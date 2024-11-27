Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A16D609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLdQSuBYZn4bZL0sD7tkxRgW+8xJC7aPjWdDJFdluR8=; b=a6k6Xp3r7Acr68LuTgQhMfxv6w
	qoABYitXxLHpaz6ZvDJrjMFyrlU0WZcU09a6YVrgygCdWtAD/zh07Io3Suuotg7XNV/Q354fjLce9
	bOsJMmbXWQI73g+Ytvc7XAFKH7xkC2rjWUnvi9mQIf+UYX3kNM75Q4/Jfj4fSLyvop/PMQNTDj2QD
	e8SPR6p/EdiWt43l8KPr0ZQ7NEt0WhlokUzkkppJVOirBYa9UJT67ELXS1LuUpAUnyWyvSu4HXnyY
	ehlhunhlCuWvFG8A5N19wIBi7T+R8tYpyR5/cC2SLgx2bdqfNSwogbN+04mhZFcW2bJTuz3x93Qvo
	BCYxF1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDMG-0000000CZ7D-1hHc;
	Wed, 27 Nov 2024 08:25:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDLF-0000000CYxz-01Z0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732695848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DLdQSuBYZn4bZL0sD7tkxRgW+8xJC7aPjWdDJFdluR8=;
	b=J875uA/Ao2As0ZrJ1pd552kLsd3moOG9/x0W24Fn7FZ5Jdvmzevrwz1l2J78KfPx68G1fs
	D/zbmuGJI/99FIXDmdRtsIxNXkx3bXohC4K9yCX7anNdUpMbicsmCafZQxIWMZ+H7mLjta
	3HPT3Xjvs3hkJAq19ZBoi7iY4c+kJ+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-PXMeMcHNNgKaa2xgvv3J8w-1; Wed, 27 Nov 2024 03:24:07 -0500
X-MC-Unique: PXMeMcHNNgKaa2xgvv3J8w-1
X-Mimecast-MFC-AGG-ID: PXMeMcHNNgKaa2xgvv3J8w
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4349cb9fb55so3466335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 00:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695845; x=1733300645;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLdQSuBYZn4bZL0sD7tkxRgW+8xJC7aPjWdDJFdluR8=;
        b=mdbhxoKfz/3UB0y5zOuEtMKPDPhYJjXmotMRJKzqWZzJHG3OJkgOnWfMyayq1MN4nO
         RiQx0DCLnnc87lluhDc3u6wdl/1GEFeyvEF1voF5zHW2JHnbORGddnSnOIGyMLIeZCYi
         byUB7LOQBNJ0sh1zoMbKJqJACPMAXhUgmYqjYL4JRt/hT4tcK4hgmvSgQp5x3j3xYu+X
         Ee6ey/Vj/b3WyOb8INorMjNlopHWPMq/KdHkHFxzn2T8tACEVHcsmhhQVgx96J/tuhVR
         LNzy06ipmqj8p6mzCb/u/OwTbJDUVmpsUc8rSUs6/StFFykFm9vZSpyjWn2koI8zil5N
         4tcw==
X-Forwarded-Encrypted: i=1; AJvYcCVATi93r2yH8o8EezscWryC0ePIwJnCV3e9OL1Gc2zliyBCDpPgehNdkFCwc2r68MSE/EX5FU3ddNb4gWrQIpaz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7vc/Wv5nSwf5N6Wo3WrKXokvl4Xj+pFP/YtW7uVj+lKgxgST
	b7Fs0Ko0oIo1xsMRUW7A08htcV303dA2qOhNvPiN2WKAnAkOmVsC7VVQzUkQDHt/x1ZNbcAxrJ5
	AcXOaVHvwWjryDz0hhhBuyHKqGq/KKJjMYAyV2fCFVlNfOplZ+ovyKEK1ne/CfyIlxIA9RNYmUw
	+7YexhnAxXlp120U7G/CqkpjxJP2fvJ0s0H36nn7cXe7hOYifwadHWPXJ/DlxkNw==
X-Gm-Gg: ASbGncvivjCO5eSz1xRoe1/B/ktO2JRaLqFbhP5dVVY2bkgs3qmCFtMeTaeP5ZuN0yk
	Dgh52wWshlsGi6aYcBbzAAPtH0i29wUpFNMXTqQH1tKbWwpqcn/do7lprY1CWfR0HnleriRd36F
	eelez9oyy6rOEI6eeA2cgbaVO+E/9q7Tt0wpHhw/FcWuejSl7JuRVS6ueNhDqnvT5tTmnDPccvY
	Fho0UUh+jWpOaAMOtddnozDjI49G1w7mVPwgFKnM3D5R37BI6scps8RaqLFrCR55PyY111/+0X7
	bQq6pp+Qs/7xOi6Oly8=
X-Received: by 2002:a05:600c:1d1e:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-434a9e1ce8emr6680225e9.8.1732695845343;
        Wed, 27 Nov 2024 00:24:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7GbyJq6Op0/kUh8of8dCHY9qLEVFtAu4wzuAcMAOzg4JRz58ZFg7QoPddZ13kWOBq1Symeg==
X-Received: by 2002:a05:600c:1d1e:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-434a9e1ce8emr6680045e9.8.1732695844985;
        Wed, 27 Nov 2024 00:24:04 -0800 (PST)
Received: from [192.168.1.51] (200.red-83-45-89.dynamicip.rima-tde.net. [83.45.89.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78007dsm13105145e9.19.2024.11.27.00.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 00:24:04 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 27 Nov 2024 09:23:51 +0100
Subject: [PATCH] dmaengine: dma_request_chan_by_mask() defer probing
 unconditionally
MIME-Version: 1.0
Message-Id: <20241127-defer-dma-request-chan-v1-1-203db7baf470@redhat.com>
X-B4-Tracking: v=1; b=H4sIABbXRmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyNz3ZTUtNQi3ZTcRN2i1MLS1OISXZA6XZM0I7NkM6NkCzNLQyWg5oK
 i1LTMCrDB0bG1tQDXiOkqaAAAAA==
X-Change-ID: 20241127-defer-dma-request-chan-4f26c62c8691
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, u-kumar1@ti.com, vigneshr@ti.com, 
 nm@ti.com, Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732695844; l=1509;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=D2zCNvv6RwYiCqPdzLthSS1rvZf7x6Pd4PMS/3lR1SA=;
 b=d6wKUqj3cMQazozorTN/arh1KBjFhAOsX/bo5B/+yX16/O3xEFZDPS9LxlOHt5vht7alVetvp
 xFILBftgKA+CalsReYgGnL7FBDHKW0w9RGtqrFjTXoQ/tTKeMyzrop2
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WHcksZslr64JOnTOufilZAiHaVfPH2MxvR-z-GKfqb8_1732695846
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_002409_128679_36224F7B 
X-CRM114-Status: GOOD (  14.60  )
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

Having no DMA devices registered is not a guarantee that the device
doesn't exist, it could be that is not registered yet, so return
EPROBE_DEFER unconditionally so the caller can wait for the required
DMA device registered.

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
This patch fixes the following error on TI AM69-SK

[    2.854501] cadence-qspi 47040000.spi: error -ENODEV: No Rx DMA available

The DMA device is probed after cadence-qspi driver, so deferring it
solves the problem.
---
 drivers/dma/dmaengine.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c1357d7f3dc6ca7899c4d68a039567e73b0f089d..57f07b477a5d9ad8f2656584b8c0d6dffb2ab469 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -889,10 +889,10 @@ struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
 	chan = __dma_request_channel(mask, NULL, NULL, NULL);
 	if (!chan) {
 		mutex_lock(&dma_list_mutex);
-		if (list_empty(&dma_device_list))
-			chan = ERR_PTR(-EPROBE_DEFER);
-		else
-			chan = ERR_PTR(-ENODEV);
+		/* If the required DMA device is not registered yet,
+		 * return EPROBE_DEFER
+		 */
+		chan = ERR_PTR(-EPROBE_DEFER);
 		mutex_unlock(&dma_list_mutex);
 	}
 

---
base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
change-id: 20241127-defer-dma-request-chan-4f26c62c8691

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


