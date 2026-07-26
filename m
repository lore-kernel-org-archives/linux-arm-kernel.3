Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B66DC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UFhWQOa/vwyik9QrUHaltpmfCg9gV5b8FYD7Vbdi7U=; b=dawuZ7SAF6wIoV9yJtTqBI6KOL
	QMWuqAvPJvpYD44nsDwSh6JUbSOgbAwPgH+vICw3lv627aen2PwbxJPpPUcDFW1s03Sov1adTObhS
	vQ6H+FSq7Um/7OvX8PjnGF/qs/9MmBamoSay+W7Rdt0EFEeq35gNioPKlKbL+cfOl7seuoHHVflnX
	03MtG+2Ux3M8cb6foLy3jM+C9tGsTvRdpyWm8ksbGyU3BPjl3Pp+EL8TJjy+z5hs3Q9cUkymxVXAb
	r8FYSSGQRYSvgDJ1G2VBa1eOfcHxU84wmIZ3ItAkUPlDOLMnwhr8AihdPTPcxtVyo1mhAU4icsczQ
	2HEOuuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wns2s-00000000wXU-1yKu;
	Sun, 26 Jul 2026 06:09:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wns2p-00000000wWd-3zxf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 06:09:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848593533cbso1132059b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785046142; x=1785650942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UFhWQOa/vwyik9QrUHaltpmfCg9gV5b8FYD7Vbdi7U=;
        b=nnLpPo2TWSxE54lpBwrndzneVtNUZhvk7vOBczc8hrH+0bnlsGu1Z1Go9CdVEc0zo/
         b8CYtUsnYvo/78LwWVyYsCpEkwtza4195lF77U9j7C3hiVw6gnR+Jwmk3UuYT9DR5EAT
         eEjun23wSTT+uhJ3ySZ8h4idr06A+IOcVor8IoSCSAt35TyKPGcGLrU8tA7vaxFLoFxq
         6hdUA2GvewMuPDUU0ZLptbB8B6cwT/pC9I2ccjjNp//P1ykFFA6XNcq2ZWVIuW6JklPc
         jDBx3kQPRmWsgZw5CHHrSR0mnXDkUu4cKFoIRMK5Bqt4mCZ3OCfgghR1qg1gTz4MfH1V
         wggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785046142; x=1785650942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UFhWQOa/vwyik9QrUHaltpmfCg9gV5b8FYD7Vbdi7U=;
        b=iaXCVvr+E0bA/Ny88eVeVXKO9sgsQAifivEZK0rYKN0z22v/LGLpwUld6+/nsPrD3n
         cTssx/cXc8ha/USvBlu3aT07GvNPNRBrE9msJSaj9OEmWoov+sUMRszjq/bbW+2CUn6X
         Zv3b+Y2dLBhMObcjmtnh+kk1M6LdTi3Tii+vtTKgRuZvu92Q1jKV1dV5rOPm1YSAKO/G
         +mLL5NR+Af4LZ49Vbzgo6gt1LdPQjwYO4xwPhA5mi/2iKqKxGf/IXb70TIrIRZenaZJs
         gDprTXm7awAek6dIvXeXlEEtL+f3EHX87RhmIRAmzemaYZikLj+bjOAOMox0YE4X3SwW
         XNRw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+uwvm4nb2zOtaUhyDLpILTPr/rI+TjtB369yh/y1QnluDiidPkntErbWHrrnObLL0oXpbJ00ECew3aUZdtcKL@lists.infradead.org
X-Gm-Message-State: AOJu0YyYyrZwwTr0/bHRTUhhIC+Ck9zdXvUAfy3Ly+/D/Z8fnQVlAl7g
	q7plq4t4SQLCQUE+73A52fEQLLCbbR8hoUJw1a97ItcDApGTriSfG71x
X-Gm-Gg: AR+sD11BCOEna3atFgiR/ZU7fM3A06WpUs5Tkhbj9uNPLeKcrA87Pfh1iFoIG/7FfWs
	r1NJcWTZLWefeF/P57EOXO4yYI0ASFBubc3q7/nzxKvYWjLsS0tQz9/9IiiImKUwUWeyekxUuDu
	XQOfbq0rIMmBXlIAVlQ20Ly1ChqTRBl1MCCOaj7/KkS91KHKjiqS4zLoPrI51PoQr8gB2gmNNHh
	jecq45EJeZ1EHYiu20AwuB2PXtRkAzl23n2FHhpaBRQwi/TICQfpRuEdTJ/6dKZLLye1MjOB25n
	0gnXGBNCrXxQiYOg/EX9rf8nQuXDVxsiE41quolOxlz9FWgE2qfKjqmpZ8o4L6+1U8L1sKt5HY0
	DUrwKDNMOnSbQR8wEcHaUD2LDS1bmmjw6XiXNhGupDNLAW0mb2Qexg8v35LsQASGzopVEoQDDkL
	eEnwNoBnTs264O0bZdsSW21L+RS7L9hiNxrQ==
X-Received: by 2002:a05:6a00:390f:b0:847:8d54:f4f9 with SMTP id d2e1a72fcca58-84e595810c1mr3014064b3a.51.1785046142393;
        Sat, 25 Jul 2026 23:09:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1644sm1609938b3a.37.2026.07.25.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:09:01 -0700 (PDT)
Date: Sun, 26 Jul 2026 15:08:57 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, Ard Biesheuvel <ardb@google.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
Message-ID: <amWfjDyn0jrnIf63@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
 <amHYO1c-5vzqSekt@buffalo-ssd>
 <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_230904_002370_DE1455B2 
X-CRM114-Status: GOOD (  18.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2026 at 11:53:14AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2026, at 11:15, Akari Tsuyukusa wrote:
> > Can you send your fix as PATCH?
> > I think your approach is better than mine.
> 
> I think we should wait for the llvm issue to be resolved first, to
> document whether this is considered a bug in the kernel or the
> assembler, and to see if any other kernel code may be affected
> by the same thing.
> 
> Looking around other .S files, I see the same
> pattern in stext(), cpu_resume_arm(), mcpm_entry_point(),
> all of which start in arm mode but end in thumb.

It's a LLVM bug.
The LLVM assembler source code explicitly mentions this limitation:

  ///
  /// FIXME: there is a corner case where the state is changed in between the
  /// label definition and the .type directive. This is not expected to occur
  /// in practice, and handling it would require the backend to track IsThumb
  /// for every label.
  ///

https://github.com/llvm/llvm-project/pull/211641/changes

However, it will take some time for an LLVM release with this fix to
become available. Since LLVM (>=15.0.0) is an officially supported
toolchain, leaving the kernel with bug(s?) on supported LLVM versions
isn't ideal.
I think we should apply a workaround in the kernel for now.

Best Regards,
Akari

