Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1904510706C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+89Xi37wcYlP/W+L3Ja1g3s+pCfX5Ep20EarskpAcwM=; b=n+HybyG73+iEZea1AXEg7iuNGi
	A5RTYsGqwTrPWH5H+p/xCCugxrVvF57Ne84LyHDjDeAhiuLCEGO1VlAdLsAwXOE72MOwJ5+4Vr03i
	gnQU797Ofb5lbS/jwU+KmpZcaH+UxtwN7hOMPYyjixoLECoqv2pQJWCCbm8m+YZYL5zJTwp/FX/tw
	XzDty4sDv2uEmf0VaTH9h5ZTAvzmC866ZICUrtDo4oKK9Wl3gxeyTWyNMmkxZyFw1jxogwlARKSkw
	oWw10VtQHbT+a0U04+bkD45I0UBdxmnNy3tVYdv5wP5j2pGBsJomenEIhdeGcFOkDCBcRBgKQnbfi
	FlBE8d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ldv-00000001iaN-0Aog;
	Sat, 14 Mar 2026 09:50:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Lds-00000001ia2-2w5v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:50:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ae4e538abdso33555015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773481844; x=1774086644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+89Xi37wcYlP/W+L3Ja1g3s+pCfX5Ep20EarskpAcwM=;
        b=DcMcfaSU/AA3/Pmzyj9ydKt9XrqmkiWgy/rOkDoBgO0x9sSz0kJyBRRGT2ftt6econ
         xXnRszUsUTgJsIAz0qfj5c0NYbx5dt7AuHVXG9r2aaZsan08HbV3bEmIvZnkltNBY8/8
         RsJaii4YXzTVsWNt/SuDIJcB672ZoLUAHHIoXedM5u+c4fjSkdzrCKwAVN1ri4G+WuZx
         m1jUdV0e2aYbq8ZnLyzmxEnNKiaW8MAa66Cm1zowoDUr8OfpMxf6+7HuteCCoHD7YzCW
         YUd6q2XXZDC82w42OSu3nNpTUU0p7lJ0vgin6KDNAyp6CD2kHYWDJe22GbmoSXMalwEx
         +IvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773481844; x=1774086644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+89Xi37wcYlP/W+L3Ja1g3s+pCfX5Ep20EarskpAcwM=;
        b=RmGWegA83TTkf3ILF4G/athPjFc5ltT8fzjOn1TDyXspGat90mxCXDKvXTYmmVz+Wl
         qX3X5ZqS0EiJ7vX/5t3MongtM+9MyNkCqTsKJkuA9Ldy1CtudTBy5vH2juKasaSgvwz/
         dv5pH+qRjDAPa+ock2rjFRui+Ag15PPVSlXq0z2GGTWroYUM14HHStirj68nUQLgQ9m0
         ojQ3PLgU28LVvPvyM2JrI/X/tf7MimcJSoNFx2GcfH8+5pU62OglGjrhTUQfCyPM7fUe
         xtfCuiU9qVAI1Bj66RovYGSsMOEWX3jJXiqsqfTn2pwygpv7SUsoia8eJkE7y0N28G5U
         FrWw==
X-Forwarded-Encrypted: i=1; AJvYcCXpTr0TthZ46kfBpY4vI0IVV/YdD3qzu1+6dR6f/WXVa/SiRNyCZD7aU1Qzu/MI245Iwla4Xh663Pdq9i1t0uS/@lists.infradead.org
X-Gm-Message-State: AOJu0YzY9g9LXzd2qKgqQ41B1t9hmzyYRCPxRFahrDZ+M9cWCITucRoi
	+yHmT0DSy5ayr09II8Dz2UAEkEcVNYrNx7OVxrZxVm5oCc7XkHYKQIxVDS1RLXTRsx0=
X-Gm-Gg: ATEYQzy/a5aTa9aj6X3K5EiWCH/oGYjh9GpUFKg6p5fjE0iBaiC0nQFfE+ncRdRu3DV
	/1Sg04eq35msCsqPdXGr+WDEDVOXTZFfGtOD2M9iWSwiih0TpRqGmstTL6d4xZGaKsrMkGCRA/+
	PIZb+jeRzfUsHMuIpp7N2RoQufUq1WnnkqrxUTssOwfYzR51vrO6uYUdbanZQBi8++mu+AFaNde
	h4Hsb1sdvW05C2CFinqJFPs9RB0m4eQfU5mlL4c3pvBgVv1Ry7rhpuIufK5VO6SxjM3IvOPCOTG
	nqzRAPgR+5FRlxh35Bo81Q2h61R9QJix07vqyVTsM7c8sC5h7qC07FtRXlJCnvBp/3tdjFTzvb1
	HEzKQ7fMU2CA5V2tzDGr/zGua4IXJvSHhSMzLCe6tYhysMM/KAjCApDdQLAvR+XS6LbzF+m6LQP
	AyGr2EB5it5LA=
X-Received: by 2002:a17:903:90f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2aeca999738mr61011205ad.19.1773481843716;
        Sat, 14 Mar 2026 02:50:43 -0700 (PDT)
Received: from gpc ([2400:8902:e002:de08:5754:7dac:85df:935a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece5f8dafsm47520565ad.26.2026.03.14.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:50:43 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: usama.arif@linux.dev
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
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	viro@zeniv.linux.org.uk,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	WANG Rui <r@hev.cc>
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Sat, 14 Mar 2026 17:50:21 +0800
Message-ID: <20260314095022.217231-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310145406.3073394-1-usama.arif@linux.dev>
References: <20260310145406.3073394-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_025045_031454_25928AB0 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

I only just realized your focus was on 64K normal pages, what I was
referring to here is AArch64 with 4K normal pages.

Sorry about the earlier numbers. They were a bit low precision.
RK3399 has pretty limited PMU events, and it looks like it can’t
collect events from the A53 and A72 clusters at the same time, so
I reran the measurements on the A53.

Even though the A53 backend isn’t very wide, we can still see the
impact from iTLB pressure. With 4K pages, aligning the code to PMD
size (2M) performs slightly better than 64K.

Binutils: 2.46
GCC: 15.2.1 (--enable-host-pie)

Workload: building vmlinux from Linux v7.0-rc1 with allnoconfig.
Loop: 5

                Base                 Patchset [1]         Patchset [2]
instructions    1,994,512,163,037    1,994,528,896,322    1,994,536,148,574
cpu-cycles      6,890,054,789,351    6,870,685,379,047    6,720,442,248,967
                                              ~ -0.28%             ~ -2.46%
itlb-misses           579,692,117          455,848,211           43,814,795
                                             ~ -21.36%            ~ -92.44%
time elapsed            1331.15 s            1325.50 s            1296.35 s
                                              ~ -0.42%             ~ -2.61%

Maybe we could make exec_folio_order() choose differently folio size
depending on the configuration and conditional in some way, for example
based on the size of the code segment?

[1] https://lore.kernel.org/all/20260310145406.3073394-1-usama.arif@linux.dev
[2] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc

Thanks,
Rui

