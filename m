Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FE71094474
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFdEgLKBQwl/qBMdiHVw8eCe65OPPezRSACDbsiut88=; b=SXwRl+8HlhWijQ4kFjGQfIiG0S
	PjLk24+WSCU2Ns7/dSF2v+/m+ka58WL4gr7ekKBB6wseIaEUw09gSHADqRzZsHrJeoaT9ZhaZ43OV
	O7k40zrcKytpUzJ6aX86nueaJVxIWGhGdQXlBkiatu61ulFOZ1vHm39YN8wOjHqAYTBBk3JcvErVw
	tVyn5xuSxxFfBxk95oyBvY23/0AZtdDaoIVFEX0FQDIv/MAzxZpLLVl/7p7ZvM/y9ydSn/ELcSnLD
	R+Syf7BUiLc/ZQ+d8kBRyls1XBXMU5sLliHvsq8piOzlSuz6Vi0xdDO7SeLiBk7uK7SOnKwzsx6BC
	iqf+HJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3xCp-0000000EXNu-0rT8;
	Sat, 21 Mar 2026 14:21:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3xCn-0000000EXNb-1uaa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 14:21:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ad617d5b80so18578345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1774102892; x=1774707692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFdEgLKBQwl/qBMdiHVw8eCe65OPPezRSACDbsiut88=;
        b=1Bpy4wBndGqKogc40Y8XueTOwpt150WNvXv/polHPpoSbOPPQaiyo7fr9m02G7wZfZ
         0IrYQziHs/JP5GMOzwA6J0h+P02oq9q5w1yLuZ+o1goQPY0r4TEQoxyk5kuogVpngHUt
         +QDFLRYYeok+bIuF17zqYEoSfv67SGIccHNFuQVmIGnz331SeKxKVF/5CznWa+uXxGlz
         Kk9sEWkWINGb2DMQmUjjtIeJpEOYoqReM1JoNQQW0QdcXLG/3i9ok5d284uBhbx4lC8H
         EFzVOBwMndPscGapjGoMzrBmt4aUEU3AiugS9coHx9HM361DGbwf1X5jrSOyx9X/ee9D
         j5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774102892; x=1774707692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFdEgLKBQwl/qBMdiHVw8eCe65OPPezRSACDbsiut88=;
        b=CwzdClmPhYyyAwwmRBqk4zgH1AdfRAvzWPg5mx83k1PdnPaPeGb2pz/lrSvfh5dmBS
         MIuoK05Y2doJBm5yZu43mRh2ysQPrS7NjrtNClUF+noGs65h5EGJxzBgtYf3Ytl02YES
         9RLTlOZoAnxmDfERHYccIV6Mk7hyJGU7wg4PGJsIs0LQeciMdNDlaRnyz9Wxsj8c0W6m
         aTTxn2mPDuPHvlJT9sQM1RZh2Qs+HbGBCLqkV/DBRfoCoIz36OCslS3CNgyCBJj1ptPM
         SgLdn1Pj081kiqfD6nfBFMB672Ejr6nQa/ruOUjZZM5TTcxAGud16tq7PoohBQouGG1S
         3DyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsGpuincw2rdQ2/PhxQU2uBMEStrbt2PxNdSZvCsIVgVbSE1yfRwHP8/iD/pcYFmRsWVV03cfQdpKn7t1izm3D@lists.infradead.org
X-Gm-Message-State: AOJu0Yxte4tsjPF/wDI+B693PGhMps0QhOsUw0vIf0wf5YKtk4Tppe7I
	hZEcluRb7WmkcoCzc2J+WeMVUkm6ooz2AXKX3KmY2PTUp/JotEYLQC2PMx8cBaImsmE=
X-Gm-Gg: ATEYQzysnNXJBWFg64RSuBjrNyL/fvGCJeOnqQYDKLsZVDfD/n5x7bgA38efc+88MaY
	qYPJySKXeVY7x4j5pnylU2U31raSodiey3CJVfepwQNhYnOHa5MXt9VAJNXFE4RAn3nY/GAlJrC
	KEd/snyB0506OPL+IZ+XcGvHdWCJieXPyDi1HY/OiV2YlYxQuCE+RUcquQ3iNTlw5McKMCud3Zv
	etx/eKqZEB8v5JkNBvbStxCCgzxCr35n2wYeJ4m3H/6Abhcl/f6yct8xx411vjs2xgJiPNcIL22
	bn8VpSJxmd55nEK+A9cMDjblOissrFVBG+6M8UdyEg6SgsO1NfcernVDdHn5G02bVxs/syHvKC7
	HBZHtnDfTJS2vcJcqOlOCybGEnxFr9OZUa3nnTioMK8EwA0obGhM1KQECznMW4L4rWBF+F+/PDc
	j0
X-Received: by 2002:a17:902:eccb:b0:2b0:8106:f3ad with SMTP id d9443c01a7336-2b0827c7f52mr60674775ad.29.1774102892319;
        Sat, 21 Mar 2026 07:21:32 -0700 (PDT)
Received: from gpc ([2400:8902:e002:ded5:78c1:8178:95c1:6ca3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656df5sm70621765ad.44.2026.03.21.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:21:31 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: david@kernel.org,
	usama.arif@linux.dev,
	willy@infradead.org,
	baolin.wang@linux.alibaba.com
Cc: r@hev.cc,
	Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	baohua@kernel.org,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	npache@redhat.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	surenb@google.com,
	vbabka@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v5] binfmt_elf: Align eligible read-only PT_LOAD segments to PMD_SIZE for THP
Date: Sat, 21 Mar 2026 22:21:19 +0800
Message-ID: <20260321142119.102525-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320171115.93235-1-r@hev.cc>
References: <20260320171115.93235-1-r@hev.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_072133_619361_E6CE2783 
X-CRM114-Status: UNSURE (   8.88  )
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

One clarification regarding my earlier comment about compatibility with
cont-pte.

What I meant there is that the alignment logic in my patch does work for
systems with 4K and 16K base pages, where the PMD size remains within a
practical range. In those configurations, providing PMD-level alignment
already creates the conditions needed for both THP collapse and cont-pte
coalescing.

This does not fully extend to 64K base page systems. There the PMD size
can be quite large (e.g. 512M), which exceeds the 32M cap used in my
patch, so PMD-sized alignment may not be achievable in practice.

One way to structure this could be to treat alignment in a layered manner.
My patch focuses on establishing a reliable PMD-level alignment baseline
so that THP has the opportunity to form large mappings where it is practical.
On top of that, Usama's work can further improve behavior at smaller
granularities, for example by enabling cont-pte mappings when PMD alignment
is not feasible.

 			/* skip non-power of two alignments as invalid */
 			if (!is_power_of_2(p_align))
 				continue;

			if (p_align < PMD_SIZE && should_align_to_pmd(&cmds[i]))
				p_align = PMD_SIZE;
+			else if (p_align < CONT_PTE_SIZE && should_align_to_cont_pte(&cmds[i]))
+				p_align = CONT_PTE_SIZE;
 
 			alignment = max(alignment, p_align);
 		}
 	}

With that separation of roles, the two approaches complement each other,
and we can get the benefit of both without changing the core alignment
policy in binfmt_elf.

Thanks,
Rui

