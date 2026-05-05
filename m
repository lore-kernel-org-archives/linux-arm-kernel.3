Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FCDCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LYEKKpUfVkavdHLKVA6iz5gKTqlOA3vClvdLRGh0BhM=; b=vIdI2xc90EYZFPgDgvwdj7VC2D
	msEdwQvK8JWJRV/fX1iAYYoJfBgPtvR3A8C6B2Kan32L9RWT6pH8B7bXeRpLVWOtvc9VikdHMJfii
	dJ6FmQTHTqLica2U8vH49jlE7ys6UBoiYnScmdaA1caw9mr+bOGJuyFgBptk5kTkF7mpL/GggKUp3
	0d3p5DG7mr2lQDABah2rUQYoFgrWVJ+f36nMP2yJyP00YhqCgSRfJwU2TJSdU8PI1R5evvmxcYlaG
	GSlgasO+MI5UauLSncjptO6k5T9RQPdbr0sIGucZ5zCHToR0wvI+WxW7VFBiWD9/zs2LpR/JzaJSZ
	YtEY5IOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKPSy-00000000FXI-19m8;
	Tue, 05 May 2026 23:46:16 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKPSp-00000000FWK-0PuN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 23:46:15 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-39396f873adso31214511fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 16:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778024764; x=1778629564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LYEKKpUfVkavdHLKVA6iz5gKTqlOA3vClvdLRGh0BhM=;
        b=GjF6vC319Fe4JYUCHvemu5XPBJSJMgMk0T6gbkPLmeOtsWrkhiUtnqR4pr0Pk5AYoR
         RE+sPerBdPA5VkEWLmOZ9y4hSmUlq44/4FeYcfSHzCmXvt6Z8FigDkDMkB0PG4QaM64R
         ISCt83IGdeZEpn7b1CRTntetAXRSEz+r/ERrZkB0771xAWoIuXwLvk0t5TxURVx4RcEL
         ZwhcNX+axC9r1loVZwp3Xdfl3SSiHeWzVhXDloqav+qB+Nx4IeRFwr76WwxgvUIvGNVw
         G3b/CBOq8Sw85t2ngE0FjCz0ZyfcZbbYKIcZdb74mN6RsWBrgZfaojResPpjeDNSZMJ2
         hEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778024764; x=1778629564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYEKKpUfVkavdHLKVA6iz5gKTqlOA3vClvdLRGh0BhM=;
        b=FN9V9EjCA+4wt53w9WzzPFAZk3o7ezXgywS/iWv+66wenJfIL1Lk8cNR+8wFOJaZTk
         dwETPzlBGHhg4IUj6MQ0eskDXHTgAHgRnybgXRw4Jlox1jKsLXs2trQrKyiAsCWQvkFW
         heiVUvSqT6A//1V86M8npwDSb3t0c4nkiNECTp4pRRLsfl5Vt1hQrvAge2T/aSqJ9U9F
         LCGFlfl6SnN48RUEoiafU5nT413QPpJAnD3A1EkcP7GR0EjD5PWN6mRB02Ftq21c/VpX
         t2L8WkM3uxdGcUBNxKXw0OYKZdoZif1trgsc1KR1jockTXFN2Zlh9Svt1ZtuZRZeQPD0
         4Kdg==
X-Gm-Message-State: AOJu0YzUeAVTOd+QwWKiGv5QLU9+F7oCs/29uhDoinBLB+wceC5Bn7Cn
	2GmZEgs0MHdHQL6uV/jEiqUGwVlhf8sEoyigSpPPUbWSyubvSydnBJtNZ6zZBbUj
X-Gm-Gg: AeBDieuw+Lj8b1IL/rPlf09O/CjmL+VkiWJSgf/h/zT10/nUThHWq4GRfsN3AJYObNB
	cQysbcyvbvnTLGIbzQODKwc2t1E9SGXNucZfpXWyCr5BVT/yh1ILNjDezodwfiKGkzUPDFXgwOA
	fIWO1FNwNzsO3mz6+g49cHRXqyIffIgtK731Z96HOFlwFe3XHe5QAd54QeMgyh2kyf6rTuWGRy+
	Y1TkqqSCO9yBrtC27gTL2XbHbLXxsMufvX0VU3vWcUwbzbLEJa8VShd7WkN5w05DDoHrtbuze0t
	KER5UckrU9UtIC9X1+t4j87BPjlTSYLeSnScC+NhlkF7hbaQKXNS0fP4hkIBYiq8AK6+sy7e0Px
	ji47pSMOXVnom2mj/itwbCZNtGDn5Xeov3QCh7Y0LVwpxC4cfSFZQXoRPKy5KpUZQbBmQz1u8uC
	NMfb2sSt1Tcvl/vZY272IGwcCRhA6lF9lajWrnvE4sMz2w0S0AWuPXLzAL02DQQDrBDDoGLjV2v
	goXlw==
X-Received: by 2002:a2e:84cc:0:b0:38e:2aa7:398f with SMTP id 38308e7fff4ca-393c40f27camr3232221fa.7.1778024763888;
        Tue, 05 May 2026 16:46:03 -0700 (PDT)
Received: from Shofiq.home (87-92-218-151.rev.dnainternet.fi. [87.92.218.151])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393937ad8b6sm27582841fa.5.2026.05.05.16.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 16:46:02 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nm@ti.com,
	ssantosh@kernel.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v3] soc: ti: knav_qmss_queue: free resources in remove callback
Date: Wed,  6 May 2026 02:46:00 +0300
Message-ID: <20260505234600.8196-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_164609_512222_1C25679C 
X-CRM114-Status: GOOD (  11.31  )
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

Implement the TODO in knav_queue_remove() by stopping PDSPs and
freeing queue regions and queue ranges before disabling runtime PM,
mirroring the cleanup performed in the probe error path.

This ensures resources are released on driver unbind and avoids
leaking queue/region state.
---
 drivers/soc/ti/knav_qmss_queue.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 86d7a9c9a..8d8245352 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1873,7 +1873,11 @@ static int knav_queue_probe(struct platform_device *pdev)
 
 static void knav_queue_remove(struct platform_device *pdev)
 {
-	/* TODO: Free resources */
+	struct knav_device *kdev = platform_get_drvdata(pdev);
+
+	knav_queue_stop_pdsps(kdev);
+	knav_queue_free_regions(kdev);
+	knav_free_queue_ranges(kdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.51.1


