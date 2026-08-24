Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7ABC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvwvU2fx//eAu2LlByDRKWPs/wkyAhNxSDJe0aj8Fuk=; b=ktCQCv/HUi+GD2Q5WzJo/vbS1q
	EvnJWa71X7890Y+/Dy5tk2KMsuPOQeC8l+qEN3ZjOSNvaF6YquU9UE4NJmkEthEc1o3pjhxPO0pfE
	hRy/WtSjv0UMMZeMhkY6RDlwjZiX3raWvltdGgJD5/TMgMF1yiacGxY/pM6W3hciLmi9aaObGJS3S
	8jph3kTYaqPiBsSu/BQRBf+WwZXl1uhEd64Y611zpJZEqHfCuXIvyVD8sBFtGAbQFiQ9pseXUgHa0
	AUsJMhLvjkIAZje4ckHRopdVo/l8vfwEVgbpE8na+fMmHbrWwfXzL3MsecH2SlBFh8R9UnVJ94ahh
	vB4mRqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1D-0000000GCWc-3TLB;
	Mon, 24 Aug 2026 08:26:59 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ18-0000000GCUr-2NVX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:26:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-381b831d535so4541008a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560014; x=1788164814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvwvU2fx//eAu2LlByDRKWPs/wkyAhNxSDJe0aj8Fuk=;
        b=sKuWtkyafVDLHd83nT2w71bhFOVd+7zmF/3AV/tHZ/7HQrAA7/+YQdH9NeyGrseiXL
         GsIrX+ctiDuWcbvTNoOExxGpxRBClxwdq7L6efY5ulUi6TWd5RBFSnt2UMGXBuR66XeX
         gpBx+VU1ss1jpC+tQ5V57Lm7UR3d3ASAiMxS1dEDgh8CHcZyeLnl9zm+/1k+HtdmxQDN
         lhC7Ls9wokHku+HtDajofyuddqi4IVatDaO1qicewdyz342Sg49hv+l2Sh90o8ssrH8m
         709EEqTjxZX5oX/3zOmEDMydNnBgoIprz/5c7vEsA89o0NOOUrde9O+Rlo01HPqKvGcM
         8iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560014; x=1788164814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvwvU2fx//eAu2LlByDRKWPs/wkyAhNxSDJe0aj8Fuk=;
        b=J0AOPDvzAdBLnUhsGhUjOEOp+brLu5dRE4N/EN8cANDl5/MqJfh48/gCCQe5JLsUsH
         3CNgsoVCOZdB0dHTKxVuzaWDTDrIBTWdj0APwjwk0lcLKGpu/Y7YOB/UMVqdXcbGSs8w
         NMksrl3vCsEMcjmzb1S8nkcXsKwI3O6wyTMUfy9BCaoXhojtw0k7IUbQHyLEUlbmFXRI
         CSPmt++Tc3LSjN6rAMgU6vdQhfstsZGqjlkN+lclWKo5H/G7Y8Z2fhMhecuW4+TBFByu
         MLxUinziaDNvTXekNfTscebC8UxiJntNYg82PjDG/Bd6dAQ+07e/5e39g2ydnTOXh73u
         8E1g==
X-Forwarded-Encrypted: i=1; AHgh+RqQkBjmOECVFctPnghEMA/oitO2mSVpZbdoHp+bssIG+jY7rGpkjzIQGtFs5I1ANLGLPiitwxbECDcrd3THcZuC@lists.infradead.org
X-Gm-Message-State: AFuF++n7JaVE3EfRPDR0lowuYn2sGTo6qYTuO8iky/GOtoc9+ZVHON7O
	g17+O1NQpFbEiwBLpAcrJptP+qDeJgiVhH5JmQgKknkwmp8mBPIThVL8
X-Gm-Gg: AR+sD12KbzwI/qHbHr3jyuqcb9D/vlWv3kHz6n9zV05PlXGyqevcDRXj9U+uBUNOG5x
	1s0yRmLh/8h/87XUwxwtM24VqgvF3M7Pz+j9jwutem2zOwPYRy+nkKNPqvqBjepTBH0QjWBATIP
	hxv94lkBS/zIJJf61wrvwLkujj5Ux2K8y+leAWE/8HHrczF2zVDSUnhu4Cdda6tgn+TE9dkPzEj
	hJ4kfiO0LuW29HR35RJMQ4CshwKsrJ7cTdwEAh6w5O1K4aWEW7WTGX87sa/mWraTtmMvHHSuyNL
	DBFp+J+T+/N4FHSf0aUIRTIopenu9v17YJw/l8ZVAswTuLEVDxn9NG6hKgxNhs2X2rn3aAV56+b
	9V2AMhiOmX+d3dl229o1dmTZGmQltdLNl3Co0MbMO45W7LKOMwQkRmhkN+BSlrXEsNA3LgOqhz7
	eYtBoSGkXVMpBbigcJWT+QrBBA9IQDPGsoZn8WjHbgnMNAoGXR/zU/ILOqjC+0eo/dB7BU/hgHQ
	2cgSERb1ZSfxFFpAxDNruparthnwUxJ3sK7Eout2rKR0S/ZbIDWWUppSCcbrRHynEcNvRJjzHfU
	MjwdmKUvHgHzmcGv/Ehb5r/uxFIdbb9pwSDgp64ttNNqLmxbdjzfEON98iQz6fJV8O+EHCW90n/
	bieRyc+ptd21LoTGSYbL5vdXRIj+ckc/R+TzwTkYZ0pqj/JI=
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr48059051a91.14.1787560013592;
        Mon, 24 Aug 2026 01:26:53 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:26:53 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] soc: apple: rtkit: free syslog buffer before reinitializing
Date: Mon, 24 Aug 2026 14:11:37 +0545
Message-ID: <c14026054a393b581d3dd91a618892616424e202.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012654_654088_47F2DDD9 
X-CRM114-Status: GOOD (  10.44  )
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

A second SYSLOG_INIT message overwrites syslog_msg_buffer without
freeing the previous allocation. Free the old buffer before allocating
its replacement.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index a3fdac8f6f06..1886f7eba77d 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -422,6 +422,9 @@ static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
 
 static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 {
+	kfree(rtk->syslog_msg_buffer);
+	rtk->syslog_msg_buffer = NULL;
+
 	rtk->syslog_n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
 	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
-- 
2.51.2


