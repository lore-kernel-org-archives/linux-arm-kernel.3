Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A96C10706DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKSCkW0BeK5up66BRXXiiTYFSs9Fl6al4vvswcco47o=; b=wgn3CPjjsVNUqnu8vhDb7mzT4i
	zHjjw48nwxSmClISAMfSOj9zoUp3doL5zHcvznQt21pfE9LK78HTZp18Jc1MJQnesg+2Rxv4N1RY/
	7kkYaYUS3Nz+i8/XWTsg3xXZahzi7ZBFMRQvO0JU/VqIn0zzFHGW+yRA5JvxhBWPG4YgEVKMtJIbl
	4rvtfai8dHQ/JezBGlffPv8fwIahC7XinXy7+rF21f81uOaoA4Szu3/mr+dWL106VqSBXPyRGikFv
	9Tke9I6dagQ8bo7Vs+SFN50wwyfmj5rW0drxvsW/kNTckr7hqK0iojCRubtpm1J0ebrYZ16yBQ8uX
	auv2QKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ova-00000001t0N-37ek;
	Sat, 14 Mar 2026 13:21:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OvY-00000001t01-0wr3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 13:21:13 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-356337f058aso2028460a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773494471; x=1774099271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKSCkW0BeK5up66BRXXiiTYFSs9Fl6al4vvswcco47o=;
        b=wDpH0b+ZqgaRq2cyQCNemJFXEjllUhQtIG0rbAaWxAcOodumi8mz8uR9gBNZXOGZFL
         2Ay5EiH+JAI4cwPO0wCZ18Xx4WAJSu1X5c8lBjihHBcxuWr2AyCsNJ0eHJefAQnqhgUs
         cjHLfmixZhAyrujgtbmGwLYPf1r3dDKOQ7lYO1V96n8CZqN88fLvEGCJAzp+qgsjgizW
         py5BwgJQJKtx0iOndV3GgwgOsrPjziHeM0ky2FB8mbkO5UOVneyRtkufNT8NzRVMhhbA
         uLfyG63rf82IqOkGzarqETlfCqjeDBnDI93M6rgdSvMDe2m+L49GRVwKs8/QEGzv7vRt
         9aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773494471; x=1774099271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKSCkW0BeK5up66BRXXiiTYFSs9Fl6al4vvswcco47o=;
        b=FaTdC1QSIn8hEFwuVX/SgHUHgwU9O2/u6NFZSnMb+QjH62IqmLvoLThnTHvJVOTRU/
         w1JtsqoKFUEK3YmGZFaYThF1rAbV2K4WxUluZwt7fUtvbs7xQLOMBBzT19CZysiDQ27S
         06LzPMGHH6Fiv+iaEQQoOH2EWEltNmZC4YaCkdnAO2Qr/hORGx8NbFIc0LaAKGeVGWcW
         Aktz8EYjFktl1x8FkEohWzzD241hZkNsnbHd3k5FTRumXWzTrTA/1OVsbslbAXMkzPwc
         6mHbZWP3O7fcpT0FSnmhUMVnkfh3sNGLyd26Vo+k4civRkXzAb0+25ECRdJbE+FOJ24j
         ycQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG1eoLlkZcCBFv35y6KNngb8CtAw/SkkyZCKNkXit4Ow+brSvHPvb/eyD0K9qSDw9oPCo2KKRM3O13dJzZK7lY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Jb+NRXgjfGTlRvP+xwoBR306j6h8tv2uWbTeipO1IBH1jhWp
	Rd2jwdU2apo68l7Gk1ROmY/R03LWWEesRsN3n1fkJibyig5s536Qz0ZumPj4m75ov5I=
X-Gm-Gg: ATEYQzwd+g8+42DRPR3vGn8dFKpZJsIiYhbUNeyuCVb7v6CYJCg1I+3KYOeHEXsJanI
	eQdybCmQ3aSTmffl3rnoqhHDERN4gG90kv2cWv/sLb9nY4jsWNHs7LKC0h5TN8hvWa5aWEc66us
	oVqh6y5hjrzO5NrBd57vRqtRnnDud3nidOqwaC5N9l5XX3oiaA8pAa6q8UPbqiclncsIF2TYXcq
	PTovIUUiv1EvFr3Lgpdq7/M0huBQR4NeqBotBChLmUclm2b6/9yCAVKLL8SPZrweTt0vVwl+4U1
	zvgkzJlq2C3b0zaaDawukp4oBff1eLUPdTr3pO2aeBxdUX5hx1UZzq95wZK4sWgNVAwWxqIxHA8
	vYiSeJG8OmuQ61Se8ytS8MGd6g5nSNvkLNUNdluTklONVqekz95gI1SZJPM4+Z5BcBjLatalELj
	Um
X-Received: by 2002:a17:90b:5306:b0:359:91a0:98fc with SMTP id 98e67ed59e1d1-35a2208bc41mr6562451a91.21.1773494470557;
        Sat, 14 Mar 2026 06:21:10 -0700 (PDT)
Received: from gpc ([2400:8902:e002:de08:5754:7dac:85df:935a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a03005f7fsm11288866a91.15.2026.03.14.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 06:21:10 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: ryan.roberts@arm.com
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	jack@suse.cz,
	kas@kernel.org,
	kees@kernel.org,
	kernel-team@meta.com,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	shakeel.butt@linux.dev,
	usama.arif@linux.dev,
	viro@zeniv.linux.org.uk,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	WANG Rui <r@hev.cc>
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Sat, 14 Mar 2026 21:20:38 +0800
Message-ID: <20260314132038.223901-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cfdfca9c-4752-4037-a289-03e6e7a00d47@arm.com>
References: <cfdfca9c-4752-4037-a289-03e6e7a00d47@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_062112_536020_AE88E4DD 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Ryan,

> I don't see how you can reliably influence this from the kernel? The ELF file
> alignment is, by default, 64K (16K on Android) and there is no guarrantee that
> the text section is the first section in the file. You need to align the start
> of the text section to the 2M boundary and to do that, you'll need to align the
> start of the file to some 64K boundary at a specific offset to the 2M boundary,
> based on the size of any sections before the text section. That's a job for the
> dynamic loader I think? Perhaps I've misunderstood what you're doing...

On Arch Linux for AArch64 and LoongArch64 I've observed that most
binaries place the executable segment in the first PT_LOAD. In that
case both the virtual address and file offset are 0, which happens to
satisfy the alignment requirements for PMD-sized or large folio
mappings.

x86 looks quite different. The executable segment is usually not the
first one.

After digging into this I realized this mostly comes from the linker
defaults. With GNU ld, -z noseparate-code merges the read-only and
read-only-executable segments into one, while -z separate-code
splits them, placing a non-executable read-only segment first. The
latter is the default on x86, partly to avoid making the ELF headers
executable when mappings start from the beginning of the file.

Other architectures tend to default to -z noseparate-code, which
makes it more likely that the text segment is the first PT_LOAD.

LLVM lld behaves differently again: --rosegment (equivalent to
-z separate-code) is enabled by default on all architectures, which
similarly tends to place the executable segment after an initial
read-only one. That default is clearly less friendly to large-page
text mappings.

Thanks,
Rui

