Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473F6CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aoMzTdNsju8lcubJn7SlbS/R1epJt1Goq+Ox6HT1gH8=; b=j7XqHA7hUAmvaULucjewKE0Wzu
	yz8L+3uFKD4KsDkdkYNcXqdaAViE6H3xlwlTJYGBgiOfHK71AJiUPJDk1K2+7k65kGeySuUOchvOb
	RVERU4Q+mq84M0xox3GHJb0T8/FqK5F7xNijfWsNpRBnqZABXVt71UwYay1Dj0rJvE6XXT7OKEGq2
	IJJzg7hOcmKPxoXpisA1SMHAIVShOW9WR6QOH0PxJzSFM4/tKncprn/YQNGwq2NgFcPnjC9gylqPA
	lBqAOnKEVvr83DRHXSwqKWUP2EEXDpB4wl8a1QCR1WqxfW2FDVindn3j7ewpSGb3fp7YDHyT6gQk7
	TnQ7g9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXQ3-000000080tI-1JM3;
	Sat, 09 May 2026 02:27:55 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXQ1-000000080sa-1Nit
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 02:27:54 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso2663949eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 19:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778293672; x=1778898472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aoMzTdNsju8lcubJn7SlbS/R1epJt1Goq+Ox6HT1gH8=;
        b=DMl1XMcz6p5Phdjd1OVX2e9TVIGpJ6gEuVWhu8dkpHxyx5TZnWDgsssHrdyGGptflF
         G8qynqDaBmJw9pTORJZYoyPRkhQ4DzKiaDmBl11mVs9CVc05S2iw5ovxFWbRErrKqTrq
         /5mbgX/+ypKNMeXNVlfu2CEml+ZZWVftiWZ/uzEkmhThHvu2XHW+FjfH9hQiYvQwpNXd
         cV6S54SsIdnE6kez98Pju1kWH8z0KIz5uZE/XuiZ7a/p5Axlb0+oRufCAjHPCQlimN/S
         4/2YHYZ8S3S/e//4iMKHLLTR/lrrLPcs1tw5z7bapJJ7GKX/rCiNCLL2NMS1A/AuGd8K
         90jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778293672; x=1778898472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoMzTdNsju8lcubJn7SlbS/R1epJt1Goq+Ox6HT1gH8=;
        b=lEZ/ETPa8L8lNCs8Ni5NBPI2PQQ348ugs7eT2X0292gAIMHxv7/FXmSHyBjQ094mv6
         W+gjs+tBk5W2qdSXfRbkq5Ps0BeO65ksHydYD85zxuuzMCdJq4Q6iisBVLqmN8pIqxDR
         vZ/dqMdi1UcdeVuNzhjHmisCFsUJaRbCQ3X5Wm53lnsjyaLIY4gTJK1gyEql5xqrRf09
         W4aSQHRFRG8gLz2+8YlRUkomQfD2aEef7FUih9B5CRw5M6e8Pt9vg4tdVqfLhdPr1Me1
         SoOtiHyTylgHrMNvISwNSmmTykRHsvSk7hfTyUoFlwFe7AWT0c3rkF53PwNOTS/WEZp1
         i4JA==
X-Gm-Message-State: AOJu0Yy72rAqntjTAqc9qy3PsILAIoN1wBH5mNVQwAI2LHrbSwwqQRfL
	auw1OSmxDpdYIMor6J/4+J7/y0N/o2MdsfxlTJ7IAVyw5Rwq89YrHXUg88stNEfsAP8=
X-Gm-Gg: Acq92OHARS17+fbZ8O0QqxjfmOE8kt1RnXERQr9VvR4lRUhdqzUdspKuCjkvMPYAAiv
	HPBt28gBEc0+TlEEMAyTmQtjyAMgxuitaunlzLyKbg6k0pCyQ5vZk/hSNsW3u/IQOZnUQzSjf9O
	PU8X0Z+9n56wlyTUABHYqab0l5Nc2+GEyE7WAnVZG4tBnrC8rONYSXqXpP2WkXjXtAK8M7T0/nL
	svjOcZmeUgiQD4ZwZhKIinvUFJr8OMqQRcPwPC495ilu0ZEzfQQ4lH5P0brA7fZueTvA6R0FRFA
	7BcOJHTd9wy9GeNIoX/VUxpqerEuJkrzhARLxp6pKMFXhkio3ddzKYnjBPQT6LIyuYgx8tB1ZI1
	NNtNQ3y68pSVAwaHWpO1r1gn49d6SstteF04z9hjTVmGIu8tbMzotoe1KgTMiwOXRrDOh6IGNxq
	9jF4H6JzUH8YCf6ni6AfzPBs5Is2eso0EFUe0A0Ger5MCjntjDvxJz2e0nrkfhlK3ktoM4Y8s+8
	XNleUFBdAd4FXNQqCGb+UmCqPhaWEDf2R9t3zPNzLOC+IS9u9vNwAp7BPFwHBx2mTZU5Lx5lTO0
	G+pZGvCk7so+9rm8/g==
X-Received: by 2002:a05:7300:2319:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-2fb4e0419aemr226410eec.27.1778293672338;
        Fri, 08 May 2026 19:27:52 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm5853620eec.27.2026.05.08.19.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:27:51 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH] arm: mvebu_v5_defconfig: remove stale MACH_LINKSTATION_LSCHL reference
Date: Fri,  8 May 2026 19:27:43 -0700
Message-ID: <20260509022744.40063-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_192753_368868_060DCA09 
X-CRM114-Status: GOOD (  10.69  )
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

The legacy board file for MACH_LINKSTATION_LSCHL was removed in
commit ecfe69639157 ("ARM: orion5x: remove legacy support of ls-chl")
after it was converted to DT booting, but a reference to it remained in
mvebu_v5_defconfig. Drop this unused code.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/configs/mvebu_v5_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index d1742a7cae6a..c42e2a4f8bc1 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -15,7 +15,6 @@ CONFIG_MACH_DNS323=y
 CONFIG_MACH_TS209=y
 CONFIG_MACH_TERASTATION_PRO2=y
 CONFIG_MACH_LINKSTATION_PRO=y
-CONFIG_MACH_LINKSTATION_LSCHL=y
 CONFIG_MACH_LINKSTATION_MINI=y
 CONFIG_MACH_TS409=y
 CONFIG_MACH_TS78XX=y
-- 
2.43.0


