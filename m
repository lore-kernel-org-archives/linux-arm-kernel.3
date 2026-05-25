Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D73ACD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 04:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8FWl0UxFX5GgB8gGa6HOaMa+f55DN13yqthzkeUsMYA=; b=0KR0bOlxb0SsOxbTfaNSJlxN3T
	ze4a76e5xR9koOw1lqSrrSWgtW7PGiibpXRKLpTYjWnlk2CVNjH2TqxcQQnyjzdEbhqhmYXFb8G3x
	KVjdgJV74FLOtHe+gz95QqS1h6bAgm2fS0/fFK0hPOYvr+juTlxq7lkc8ZklgsS8d8GMf6HeoVWE5
	+X1qKiKONeiCFfVyT2p2fbQo0XcrZmq0BufMutXf1rCqBr/6Vt2k/qJptfxz79zJRY2YA8cxObiDr
	DmcJKikuTWsyTgnzEdEjTwsMXZr4MkzFvx0lHghUgORTgAMulmG/REnBcOmYZio4i55fQav0YUwn9
	s4g6DKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRMW2-0000000GEJ5-2lab;
	Mon, 25 May 2026 04:02:10 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRMW0-0000000GEIX-1Nbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 04:02:09 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-914db409f1bso49116785a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 21:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779681727; x=1780286527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FWl0UxFX5GgB8gGa6HOaMa+f55DN13yqthzkeUsMYA=;
        b=KHNdIF+QPI6GJfOijkk/FBWe8bT7A1YK+NvgcDqBHO1E4gWyhinrl5nch2ScOJtXF8
         HiWXimdP8oL/VGaxnKQoF3lXgiJaql+WS3Tk8M42MgZHYrHa6fOvumMfLS7baXwuht9K
         18hNTVHsYTCnODUyJb73Jf/OYMYRtFtHSw8QWs9Yr68Se8i+pGC186RF5/XF8Wza7qXn
         doFta7A+PgkjYumj0PXv2F03Z6scP72k7GyadryKCQ57SU6PBaPDp8jgfanxD4szncMp
         9xM8BDan3Po7acbQ1mnWXR7wnT1t+01Wtn3ldX9zyMLejovm2KPxDCJGdViU4K7Wvopo
         FaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779681727; x=1780286527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FWl0UxFX5GgB8gGa6HOaMa+f55DN13yqthzkeUsMYA=;
        b=Kd4Jg1VewQUsFVe68KW0tWXIBmK0JQCLibOm6SJ8S7Vcqx+XTVmjnChZgqwcI88zJ4
         LFgqWtjL0AjoOhd/ECEG7DLvOMj0mC1V/3fMNilDWOOcBvFairMAdLP8bzSEI7x2hBxM
         gF5/N3MYm8PapByVVNkgoXIsLokCShauKpvZRGzplRNT6uaN3lULX7gqxeFBgSrvHxxH
         EUgeU4EmcHnxQTRfmCFASaDsCW8xhF3RzxiTWbnKOdEhF/DDe7kTyUCuj6Dq/y4GHs7b
         PQmeXXT2w7eOC/68+Df2PzLzDMEnMHsNMjFcSTRfXF4EZ5hy3qBmVszBXyJbSmNVNQ7a
         rzpg==
X-Forwarded-Encrypted: i=1; AFNElJ/IhDmhtN6eN4MkM9LBAWffvZTfW3wslihC3DKbkbqlBk+tJpuK+vB6euBXODv2rPQQlC19i3IpZvkff13AFH1X@lists.infradead.org
X-Gm-Message-State: AOJu0YzHCYbvhqOZhofuD9rfr5UXc4+0ru/hkk+At1E2VKE8AQZ0MpKa
	twOqbuk2xHGpFhHnfZut+etgMYsrljXShLGDUHIz4k/hGVYD+e+bqtoh
X-Gm-Gg: Acq92OF6x4Klscr8SGkl5H+vT29wGyEHXDSI59M/RHTFCVook8vDDIiimpDjt/QnypF
	XtZhtOrlTdA9bIf2p9f4NGZ8J7RdORKFsHQHiKCNu4RXXclEZZ//VbsVBzphridQ9GkHcDjpABk
	tVax6E7el9JOb6awJUtTbz+rh+Qwz/5ood3G0tYaJZIkjVNuD8ew/vxuAAE7RsREldw6dECY5MI
	ljuRVigvGkPtBMIRHTm1vLDb3q83DrjSJxk2LIecmeIUD0utR4RyOO/C/5NMcwhwWVKD7pH7tmf
	1RzUK3TNVV6UfjE4Cslq5tVEnE4llYtgHQioUsGq8GwThX1MJXBpEOvCpQ0zUgwgQ+53VRDOxqW
	uOZyyqrWo3Md7FfudqNnIgdoaLzM+K/lrR3btsvE0LpOEU/0lGzFya22PeWpjqvxrDiSwevMVbK
	w+/fE0dUgRH6aMJvMxPXTTESc96bDChZXMG7eEEHR/nDxllNT84Hw=
X-Received: by 2002:a05:620a:2718:b0:914:c0e8:224 with SMTP id af79cd13be357-914c0e80a72mr1628896885a.54.1779681726843;
        Sun, 24 May 2026 21:02:06 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bba0b6c8sm886659285a.41.2026.05.24.21.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:02:06 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: imx31: Fix IIM mapping leak in revision check
Date: Mon, 25 May 2026 00:01:58 -0400
Message-ID: <20260525040158.1352069-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_210208_397646_56C7C272 
X-CRM114-Status: GOOD (  13.62  )
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

mx31_read_cpu_rev() maps the IIM registers with of_iomap() to read the
silicon revision, but returns without unmapping the MMIO mapping.

Keep the normalized revision value in a local variable and route the
return path through iounmap() after the revision register has been read.

Fixes: 3172225d45bd ("ARM: imx31: Retrieve the IIM base address from devicetree")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-imx/cpu-imx31.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-imx/cpu-imx31.c b/arch/arm/mach-imx/cpu-imx31.c
index 35c544924e50..e81ef9e36a1f 100644
--- a/arch/arm/mach-imx/cpu-imx31.c
+++ b/arch/arm/mach-imx/cpu-imx31.c
@@ -36,6 +36,7 @@ static int mx31_read_cpu_rev(void)
 	void __iomem *iim_base;
 	struct device_node *np;
 	u32 i, srev;
+	int rev = IMX_CHIP_REVISION_UNKNOWN;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx31-iim");
 	iim_base = of_iomap(np, 0);
@@ -48,13 +49,17 @@ static int mx31_read_cpu_rev(void)
 
 	for (i = 0; i < ARRAY_SIZE(mx31_cpu_type); i++)
 		if (srev == mx31_cpu_type[i].srev) {
+			rev = mx31_cpu_type[i].rev;
 			imx_print_silicon_rev(mx31_cpu_type[i].name,
 						mx31_cpu_type[i].rev);
-			return mx31_cpu_type[i].rev;
+			goto out;
 		}
 
 	imx_print_silicon_rev("i.MX31", IMX_CHIP_REVISION_UNKNOWN);
-	return IMX_CHIP_REVISION_UNKNOWN;
+
+out:
+	iounmap(iim_base);
+	return rev;
 }
 
 int mx31_revision(void)
-- 
2.43.0


