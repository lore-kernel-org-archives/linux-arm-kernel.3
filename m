Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A948C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sUe9u1KCQnirtd227P6w1BmHNBfUepiJPaRAQLnBBF8=; b=vdnA2oFlXnq9yr1LKkifnj4aRB
	BX01ODbBxyvHMC9CUhVS0vMGR4hQZIe4wnY+f5wLnE9TYyLLxTu2Mj4iB/8kqxEaUMdyX6XYKKU8w
	bTKnQbGwHtrvpV7YWjONlbrY6+BI2P6iZ+y9l9Plsmg5vNff130vNGkmghcuV8X7JVzfqGuvMYiBe
	FSOEu8ZD2Blkd6WSnjL4zJikGRwCzO9ZuSvK7+atkZh5OKZ0gNT0AShF7SdMSUyLpDsprGtmDT50A
	wgFH0GnYLoffHz0HPGhi3sNncM//FyPAifRVX/Un2zJKPC1JGCcRAgMOgnIHltLEJhyx+gUe04iMx
	CmR8R7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o4-00000008Dkb-3rmF;
	Thu, 24 Jul 2025 18:36:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezi1-00000008883-0a7y
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 17:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=sUe9u1KCQnirtd227P6w1BmHNBfUepiJPaRAQLnBBF8=; b=Fy3pvOc7ouXdpLR1hbW622u5UV
	JinPI0TlpxcufmSEmmE2DqdlNlNMe+QqYd4XpJXiM8bFbBYTrCLgofXQmoUkENbXba3C5VDXmFu8P
	qzp16TSAl0MmOnKBoUyuf4yVLRZk8xvAGHNUbMFV0u6XD7YxJU9F6UP03NpzK358cQlM6KGmcuzcx
	ZidrKloHi7Kas5NRgjODaq+LWk2VT8c9G+xZxqyyJxq4f0lXHEDIzTWscNuETZj/O4I3Ld7bQgLQ8
	C4vv3KrB3hrd28NM4fz7ndKI7+pa9HPZ357ui1NGGanm4IWU+157MvhR+YOFndkb+3p66DYi+5ab1
	1t3lnQTg==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezhy-0000000Bf0p-1KAl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:26:20 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so1735602a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 10:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753377975; x=1753982775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUe9u1KCQnirtd227P6w1BmHNBfUepiJPaRAQLnBBF8=;
        b=AE9aer+mbP1qZFtONxcOm5WM25rlw4OF5f2TvW/fFX587Iubcicxcbj1PGiCUNrrQg
         G7GEse3oYonQf/Xa3S0z/zP1bU9Xq3yZGnOvADgbH1nDXtqVCyn5zorwDone7j5oohXF
         r6wYSKv+JHtX63NDeG7amQ8HQn2dZ9WcX5YIe9/Ly4IuI3/RE597SnTiTKcy6YZgnKyu
         Mmrz6Yb/bCIxDuKRkFP4vNdzHpRDEXmnL3AsVvJDotjDqcrqQyKZmtSiwz5liQ8XKhLM
         IoEh5X1sAWzh97aM/maSrxEMH7/pQAF2Tpk4mNPt+1GmgTqNNXQYDJoKyh43shZispt9
         JhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753377975; x=1753982775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUe9u1KCQnirtd227P6w1BmHNBfUepiJPaRAQLnBBF8=;
        b=pTdIpNGmfOnBoOCplElJm1rlhA/nD3/QB6pzKEWMjy0tFm5iNaGtj2lJFHjIs4VMhC
         Pld7OM6+vPkRNecNirhi/wmJwJN2P8g1+UkUwnCVBkwiwf/LXZQ8GNd8MBeacwSLhIwD
         HeItzAziun1xH64/zPyczdToMusiTBsQ4FgAQE487fwVaudU6gaYcjBserA1h9jPOnao
         V3BfiLuQfgT43Zbjf51ccI+YM7AlBd3tZvVzo8jsYjvcWcgjQIuv6knoIqIdE8ldZw7v
         m0fFVbwh4c6gK7luDlVgjtDHvNvQXcgA9bY9UHmfxVud8M0xx/vS5ouhfAVSxqHFHYJC
         3OPw==
X-Forwarded-Encrypted: i=1; AJvYcCX07440Fo1cVqQijM8UcFzoPrNS/AYVKxgq8yKBFEFo8CGUoNjlU0+NzV6hz/Xh1TyEalAZZf6881hvCx8Ur2Yt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4RiLgs35bOr4ZcPITXW6jhrB8+vPBZAeaxxcv0KIly+7ipiRs
	uwFnkD3h1Y8YTOFUjki8E131Krw1cImyNnvWi+/wtEcGbCxXUr/IADhH
X-Gm-Gg: ASbGncsyNiReZj2IY8xvX8RALFeyMq8aqXDMYUDCs7zOhB4TXa2l1Y0Zhjq8pdV8MTa
	TGIgnKq2C7P7gRhbipRUOgc7J77q3UBw/aY37iuYj90he3GnBrJ3eLVCutUl7c1GJzjfJRQIle/
	DLLBHaQ4K8tSaWU9g5Y8zRKWMv5x+/rsL8WjhNM7gKSilh5DNoZZv+Redt+w/76PxhzkJE/bGA6
	9Yi2b51v8zpBlU1t5CUfRxyJ9jDBLuxECOl6UZXsm2UyIbi8x22AV3hGWIuv4EPWYcntgnqcjFT
	1VAlIczw2gj4rpb1dOJyErbPjRQ2AI2Sp+20vbdjG+5c8YzMgbYfv038lBgvYJESfgOLI0TonVH
	KgyDltr4kPTxF3DG6eVO3BKp4dVj5lP7nEmYBW0VD5w==
X-Google-Smtp-Source: AGHT+IFcNSsyYwzraEG8EbrCJ0la1lFa1eFwIPy+bqFr6TTzxI3z6TYAGO2SmResKfllx+bfdd26bA==
X-Received: by 2002:a05:6a20:a11d:b0:23d:40b6:3f9 with SMTP id adf61e73a8af0-23d4903ffa4mr13812559637.13.1753377975343;
        Thu, 24 Jul 2025 10:26:15 -0700 (PDT)
Received: from archlinux ([205.254.163.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae1584bfsm1999495b3a.38.2025.07.24.10.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:26:14 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: linux@armlinux.org.uk,
	rmk+kernel@armlinux.org.uk,
	ardb@kernel.org,
	linus.walleij@linaro.org,
	ebiggers@google.com,
	nathan@kernel.org,
	lumag@kernel.org,
	dave@vasilevsky.ca,
	ruanjinjie@huawei.com,
	kees@kernel.org,
	liuyuntao12@huawei.com,
	linux-arm-kernel@lists.infradead.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] arm: allow single CPU configuration by adjusting NR_CPUS range and defaults
Date: Thu, 24 Jul 2025 22:56:03 +0530
Message-ID: <20250724172603.18701-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_182618_499995_74FDF746 
X-CRM114-Status: GOOD (  11.56  )
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

Previously, the NR_CPUS config for ARM required a minimum of 2 CPUs.
This patch changes the minimum NR_CPUS to 1 when SMP is not enabled,
sets range to exactly 1 if !SMP, allowing only a single CPU setting and
adds conditional defaults:
    - default to 1 if SMP is disabled (uniprocessor)
    - default to 4 if SMP is enabled (multiprocessor)

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 arch/arm/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c..23acee38721e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1063,11 +1063,13 @@ config KASAN_SHADOW_OFFSET
 	default 0xffffffff
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-32)"
+	int "Maximum number of CPUs (1-32)"
+	range 1 1 if !SMP
 	range 2 16 if DEBUG_KMAP_LOCAL
 	range 2 32 if !DEBUG_KMAP_LOCAL
 	depends on SMP
-	default "4"
+	default "1" if !SMP
+	default "4" if SMP
 	help
 	  The maximum number of CPUs that the kernel can support.
 	  Up to 32 CPUs can be supported, or up to 16 if kmap_local()
-- 
2.50.1


