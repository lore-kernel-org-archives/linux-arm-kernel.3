Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945C7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 00:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu1nBa4ilpJemQQpGyZMUSIJb8sM6APaQUaM5CiIuUM=; b=0k3cXoGi+GukRg9QXIbza7ka7q
	DjuPTVuCLg+BR3ufFdTPYovcPkPS3XuWifwqzDE2VxdSTi2Ke77uxDJXFbhzKBbzkxof++jKY/eLs
	EruO//3t6xEAibcdiyKeCQNyXaq7xdeWpVX0cDGTNgNBK32JrecfhExsyXqBsSAWti7Y/PAyymHMx
	yn/vpxuRlzW4Vo7EQCl7cJW7TEchQOQtuJB15Y7eMC5PkLUoVg+akNFiZObsCGQsFB4MMEJsngtWG
	3wAokhJY5t7hm1rXGB74b9VlCIMyIkM1JiLoQOCoYLoIuyHEB7+3N32S0e6G6oIs54UIoxpR/u3MS
	Uvz/Dh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9yj-00000002eZI-2Acz;
	Sat, 31 May 2025 00:21:37 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9of-00000002c5l-1ubl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 00:11:14 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-52dbcd398f9so1620157e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 17:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748650271; x=1749255071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wu1nBa4ilpJemQQpGyZMUSIJb8sM6APaQUaM5CiIuUM=;
        b=2wcnCHgX7a3M9o4FlIup2hQuRTT72bSiDV4Lg3Qs1x1qbiCD4FCKW8Sm+huRa2tWgu
         rvq09fVEq2Wv8BjfHg6wkf7tO7awxeckHiTs4xNpkaWK1jQBLZWqZJc3PZ4bfaAjbSno
         FMSd2KUvQa1DuKXILUtFsOZBeneWZgrBdH7pxaK+Ysw+f7JLr5J2oo8tqiZphyAl1EFv
         CXOtiZQ69YosoVTyVc6EfdMlCDCAgr+6PQ+h4M+c7QWm8mUUNSS3y+AS4Kk6qh17FOzk
         jWqYz42L5WSn0n1nNcJ+UW3S/iBUqRbFchpTkQTaoXV17bq2GUXWEEkrUa77/WGU9ZLo
         8QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748650271; x=1749255071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wu1nBa4ilpJemQQpGyZMUSIJb8sM6APaQUaM5CiIuUM=;
        b=PIQKnKr7JRezSI1pL8xUAseaCW/9BFZRD4ML/UR4DWXn7TMPL+eRaXT5TiUlQEJn2r
         wswF4F63reaITC8qrYBoJIUyIuX335qRfDd3iMOouPTxrxbfWdEVS4aFwmLU5BLJhOEw
         +K0ErPVb/UtSRaORPIBZ563nfVAEcABHsgmm0/Tr2X9eY2YTtaQ5AG4qFcCQDN+LDjk6
         OW3/6gYI5jmNXiIPyr0EgDJyKU5MoJb9b9F9/dFzy4TxEkqf08QDLVpuW2UQVv0kKzXe
         C5umA7aV38BeVuzMwavSlUYc8jMfBiM+unABq5V17IpLfD+G/7Ry0SFSz29MgsV5rAd2
         rjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhJDLx+mcN0kHVj6e9n+7nMlm03fV1VROYPNy+gJzlZaEBr6Ieqj0CGSgCUTMwd4FQMDiAym2dwQz/a9sI1pFV@lists.infradead.org
X-Gm-Message-State: AOJu0YxqVIWhw2Y7WTRNOon0tvcZpsZ26jkRYRsqs6FiocpOXTqNeldl
	6kGhfsSE8Qgr4lNGJRkPfiCwjg6KDaSm02mzUvo4HAe9/WDoBRLdAGXcvzyfRaVM8AQproB1DOC
	Y9EtCI2Ykf5pYRKFaqVq9PQWYBjEIv8IsZqysb/7+
X-Gm-Gg: ASbGnctXm+BLPS31U/ShxMF4xsKLfhxd/2fThekKfL4B+RtiniwutxeU97WCspvFMl3
	pQQZ+VjoyCPkuye8aMUZoSPQ2PWQfqHLHN+uK6Nm9AJxGDiQOZtwZJYthWTqRfFlrFV6Xwk/XTE
	KSjiCzbT3RpwajRJaysp48KkBydqLLS+O77phJ6Qlgofg=
X-Google-Smtp-Source: AGHT+IF1bYdXHRblo7zBFr6k+2FDjQ0Rocs0mQmpNa4kQY5J8sVxiRZbkV0jwf69ghtoDETnkE6jAefBn8zwr4Afp0k=
X-Received: by 2002:a05:6122:2a15:b0:530:5b1a:2b98 with SMTP id
 71dfb90a1353d-5308126ac52mr5230059e0c.2.1748650271440; Fri, 30 May 2025
 17:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250530000044.341911-1-dylanbhatch@google.com> <20250530141325.GA30733@willie-the-truck>
In-Reply-To: <20250530141325.GA30733@willie-the-truck>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 30 May 2025 17:11:00 -0700
X-Gm-Features: AX0GCFtsaV-SgHOlpiJeUGlpj9g_QHSPyIu2zUGrlxbz3jfTMw7drPnQkTVMUTQ
Message-ID: <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
Subject: Re: [PATCH v5] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_171113_507351_BF42A999 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Will,

On Fri, May 30, 2025 at 7:13=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> and this would be:
>
>         WRITE_PLACE(place, cpu_to_le32(insn), me);
>

I'm seeing this part give a build error:

arch/arm64/kernel/module.c:158:2: error: cannot take the address of an
rvalue of type '__le32' (aka 'unsigned int')
  158 |         WRITE_PLACE(place, cpu_to_le32(insn), me);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/kernel/module.c:56:28: note: expanded from macro 'WRITE_PLACE'
   56 |                 aarch64_insn_copy(place, &(val),
sizeof(*place));       \
      |                                          ^ ~~~

I can't think of a clean way to get around this and still keep a
combined write helper. Setting an intermediate __le32 in the
reloc_insn_* functions would work but we were trying to avoid that.
Setting an intermediate value inside WRITE_PLACE would also work but
then (I think) it won't work for the data relocations because we'd be
converting a signed into unsigned value. Making WRITE_PLACE a function
instead of a macro also fixes the rvalue problem but then the args
'place' and 'val' have to be of a fixed type so we can't do the
typecasting on 'place' and 'val' has the same signed/unsigned value
problem.

Do you have a suggestion here? In the meantime I can send a v6 that
uses an intermediate __le32 for the instruction relocations.

Thanks,
Dylan

