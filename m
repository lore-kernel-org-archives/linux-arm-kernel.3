Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD80C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZT4P26bPYlF0R//NP7ZRz7hL1o+4G7Qy2zQl64df7OA=; b=ZFufLaUZ5wtIDFSCRHOs6Q+1Xd
	x3bauFpwAKzMHNmQb3L7sZxPZgmVx0GCKKzq/TUwibC96PDAeaTX23A+HUkXBJ9J10MOgUs5lzl2W
	1jUzTsb/bhjgaWSP4P5EHeDRqxIXQAxQyrPatAd8tJwEShrcD+IXXpsO0Y5Wt84Km/Q+zXv8P+wxx
	DjgvYqhQ9KvsW+jRiTLaThORUHEwqU+Uk0D5qMghCwuOhh7vLvESuJ4RSJIx4IUDkUASHQKs34CU7
	tAQ+G3LqV4Mf5IVHJRmxahTQxfcmdY5tC46ESed+YQYruWnaRWccWkkjyYG68ySjX0jM60eQiZxVW
	aqL9ZDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscq5-00000009BTL-3yWl;
	Sat, 08 Aug 2026 08:55:33 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscq3-00000009BSz-48KM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 08:55:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so235816a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179330; x=1786784130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT4P26bPYlF0R//NP7ZRz7hL1o+4G7Qy2zQl64df7OA=;
        b=pZXRTwXikok4mFuXJ41Rqx60e2fOi4JxdOwVW13LzaancQXLGo6YW5m0RE95QFYYDS
         9NaExm9Aruuxbh6EThxILaUbFCCy714bhJbGfFfrTS1jSZ975QuOpauYzFsaoC6dG3+n
         8+9pK+b2nWxpUD8IfIhhraariF/xB03+R6q7K5e5nEw/TZj+KtKGjDRlo9d6HhBegIlZ
         35s/3taZo2SquTf/PvuFpb0ZDNSm6AH5NrKGJkPQ+2vlsVl0lrxozN344SbdLEMe8D7p
         wGWrypEQxNiXmDNYZuRhR/W6uIPpCxK8tDExMQxZo/tGgQd2kckF2k4TvJrsyB1j+/JC
         DABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179330; x=1786784130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT4P26bPYlF0R//NP7ZRz7hL1o+4G7Qy2zQl64df7OA=;
        b=bM91Gp+iQwbU4UgRFPLlZxlVTxAyFy6FNRyPcVy15akcbkUJ5i2vqCMIE4NhyxjEQm
         4Vcbsf1mhXM4FPeC9/EmA/QDRgK564uNthrgjDHH197tjswWOzVO13UnzN15YQY6o+wW
         AbEugu+f0ntGnZwQ8Daw/SywDHnThLlvHmsNwFUn+AIayg3p/eRZ4wcWW8IxaD0s39Kh
         lUG9IqhHhEnIWZ3ysIF7RmW+peCSAidUyokFW5f23KthdX72oiZkXspsR++LmEzGBxgu
         cPVf1fQPzdbk+ALXw5XRVxBDxYL44//L9h61c712DXApKr+Z8lxQJj/npYEhSj4T+FJs
         9CVg==
X-Forwarded-Encrypted: i=1; AHgh+RrFR4RvUGBI2eJY2c12q4ZKzmKeJBtWyWUNxZvFq8l/5ZXTwfGfyYreOWBFniJB2Y1ALDs9ItCr2xwLO1C5EDiA@lists.infradead.org
X-Gm-Message-State: AOJu0Yys39ILZfSEEjNwCFUENULPE0gYFkQOUB+gGfOqFFOYQn49SZGb
	dxyK2VA+c5C0Gt21SWEpxf5z839mxKlc3LqgZ1BdGah7WcJ7P2WHh0DA
X-Gm-Gg: AR+sD13QKBPmlgc1xiF0PByIwQtxjSIR2aZloaaY4ddVIGQeE0dXarQfYUupDMVmOpj
	5i4zggB4yt2wc2KHdk1/E2vG60mUePZs8tlcPHSLh1uNOBfI4ur5aJ7DEsYnx9q/KC2Ikgu//wz
	IqaoHbFxIPIsbUYY139RbtoLl2sseQqydxRPxQM4cbx3gHgVxmTu8J6eqTlYM+wTL8YEAD6Htjd
	z7BPVxaOL3NQbhZ7tgb565HWHN+qcGdQrsmuYlXBhAXjp3KlJ3JNOT6ztNC8vqgZnVyCoynK0M6
	5PoYOAuEuttXSnf4AnqyzbaFLK0qNLU4yD5gjcbI9xib1Hhnj1iavNUVOIjTKUIIBY8WSZNSLad
	XurjusZZsxPJeSq2DiZ0m4lDZYLl3TCnjsG9jAIZSgch9rL4SaQbuX+j5Q/UDrKqEDiQwH4Yv23
	16sJujtV8GKoWZc53VNssLg/esTHag7twMUlfbWQzTLZA5F+rEq4dGtipbdfp8d3JMTfmuiLsCn
	q9PHw==
X-Received: by 2002:a17:90a:dfd0:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3909d928d54mr16011147a91.21.1786179330366;
        Sat, 08 Aug 2026 01:55:30 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7ad29sm14357727c88.13.2026.08.08.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:55:29 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: stm32: csi: fix async notifier leak and UAF on probe error and remove
Date: Sat,  8 Aug 2026 15:55:22 +0700
Message-Id: <20260808085522.2650409-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_015532_028291_9879465A 
X-CRM114-Status: GOOD (  11.91  )
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

stm32_csi_parse_dt() registers the V4L2 async notifier with
v4l2_async_nf_register(). Two teardown paths fail to undo this:

  - The probe error label err_cleanup is only reached after
    stm32_csi_parse_dt() has succeeded (and thus registered the
    notifier), but it calls only v4l2_async_nf_cleanup(), never
    v4l2_async_nf_unregister().

  - stm32_csi_remove() unregisters the subdev but never unregisters or
    cleans up the notifier at all.

In both cases the notifier stays chained in the global notifier_list
while the enclosing struct stm32_csi_dev is freed by devres, leading to
list corruption and a use-after-free when the list is next walked.

Unregister and clean up the notifier on both paths, matching the
required v4l2_async_nf_unregister() + v4l2_async_nf_cleanup() teardown.

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..65800aacf28d 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1059,6 +1059,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_nf_unregister(&csidev->notifier);
 	v4l2_async_nf_cleanup(&csidev->notifier);
 	return ret;
 }
@@ -1069,6 +1070,9 @@ static void stm32_csi_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&csidev->sd);
 
+	v4l2_async_nf_unregister(&csidev->notifier);
+	v4l2_async_nf_cleanup(&csidev->notifier);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.25.1


