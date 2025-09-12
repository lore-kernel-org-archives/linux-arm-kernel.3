Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15693CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9rrTbw+eB4e+CPFH41yk8s4K4dTs5VqUYsOCYmEbOc=; b=KEvuSUuVGeV+TcmEVJharCqzlt
	pYzq2Y9OwOhgeslHNN7JkcmTdFMT6V+KhQHLBbWx2M/Ljrmyz0HJk9AU6RZeOmEsp9KKRip5KP40n
	AbrTMG+rTeaL8r74fdXFc2rswloMdl6gln+jMLt5sh2GTi4zR0wjCRqT5Hvd/Si1iDJQ0Y5XHbMQW
	9DRkfQNxYOm56ghNNEaFibpCk5WOPXdd1212jO2JCN8614KxNxtw9l1xVspQX4rpCfJdOduOhxb+C
	ODjGjni6UhgPs4j1WAkCaJ92rweN1/d3JMAC0xOQmLmFcu0m27lCYwHEkzhsq250MTuapH4zvhRDu
	xEDglkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux019-00000008FXW-2nog;
	Fri, 12 Sep 2025 09:24:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux017-00000008FV8-1gqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:24:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45dec4289f0so811975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669067; x=1758273867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9rrTbw+eB4e+CPFH41yk8s4K4dTs5VqUYsOCYmEbOc=;
        b=rT+5CUDV9c2+3BMkvEwp4l9LmAoeTplg318HYW2XiVENHeINgGfqv5Jz37uMFeCfMc
         6kv3xJZDPPRbXmeGXnecv4oG0VgK+gBVkGrd2knj1HGIxiOVYsQsR0Dm9Ywuh6F6gTMm
         6+StjK/ftrJSdbVhRyEtgVgdz/s/MH8iebaYA5U0KJat1HeBzM0pBJEFJzJHQgWcqK/t
         qyLRUDa2eZ4gvNuj5SKYetZ3hP4jQFA41NeQo3FDYEMnQLSMCsLhpsE+j25+RNLd6kCg
         fAAfVaPiTInLh8yXtnrgaOQwh9Ezi+0ZrMr5aaC88k1yWV2lASpmwtEVI2VUoas7s7f3
         968A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669067; x=1758273867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9rrTbw+eB4e+CPFH41yk8s4K4dTs5VqUYsOCYmEbOc=;
        b=U5MmQKdgNEQjunkDeaurj1TbszF8dipe/kQKACJHrOTbzTth2ye/lM9oKuPRBwuhmO
         AZSOyeTcJcg/9YdmBnMdjce8YdkL/pZ76f9aeteCgfHNNGzPIZbcBeBLv84mW20YLsOS
         Gvy2UgdfeQ9lQh98T2KyPwQxVMxYYijh5s9YiWcsDSwwhYAJR0cwZZ1raIaXbVRAMZob
         YiM/kKQfIg51kKgsfk+QrOL2z0lcoy5gR08Qc85lny/+4CzK9FgU7DPTWSg89+lvIqJe
         EqgokE4Ao6yk0pVcukfgHmH026EzV+c6n0x4YSgjGUJyXFYtb+hmG+FzCg4fgHIDyXFU
         0scQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtaFmMiq+AeUHgKBNfNC+TWhJG3FaH2DAj90pdwumdutIXx9SwkXjvuhBTmRCQR1kpqfFpjWakGSVmTys6jKCF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgwfzrxs8pGMFyxT5HhIq7ng84uV0RdaJBTFiOieJfZ3g9Gtf5
	DR0LpsPCTlyVYM7oul389/a3LTjedA03NbHp8qBlUKdBEmO940gWqaOIuqUN/uW8NGE=
X-Gm-Gg: ASbGncvoalurkp5w+pNOGSN0TMPv+0wslnSIhlTcfxU2LXv1W8TOCUK7bq8pXPbDidC
	x7f/HYORH7XWdqKL86cGLRdIu4b5CNN/FpNym3lwyb5RyrcLv59tvZMMcTH8Re2mNS8T0To+LCo
	4G3LkiZMzQxMlhRGNcp03SD/wviP92yUkvFRxcgurdZhtnBYVC+xY5l61vf0YP7fcHRz1bNPyUu
	OHFz7iKeDsWVTVI+vcko4wwzrPxwhBqPW3dBb4hjkqq+WpvPyCYZPXDsFfM+9ofG/c/lF2hrqUr
	U+zE/EN7PkFTgX99NRw0Mv3/Cq/Kr7TmcpbyrRm8FI3n5iNGJo7eeezJ3nxuZcudHnFQmpPpJVa
	BtYpKYieGESQixn88GEW4M9q+wRoEnJo5qZdbhBVBHDmc
X-Google-Smtp-Source: AGHT+IE42/Da93gcZaWH4jt7HlET0DZgR6QWug+CItVQm8/AXegxB88mjk+GQjzGdqsFMrTXdt/zCw==
X-Received: by 2002:a05:600c:8707:b0:45c:b627:a4e3 with SMTP id 5b1f17b1804b1-45f21e65defmr9620055e9.1.1757669067036;
        Fri, 12 Sep 2025 02:24:27 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c3ee8sm58316745e9.18.2025.09.12.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:24:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] firmware: arm_scmi: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 11:24:24 +0200
Message-ID: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=2XRqmPu/gyPzYkQ/gDwq5Xo2kuz0OOwm+H4kdZL2QK0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBow+bHzkYb9jiI6adZWT5vC+h+63SkbrshWqua+
 SRh/nNgqiWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMPmxwAKCRDBN2bmhouD
 13WEEACMYeZPtMnfhYuqkZkuOioVkNzJzK3QySfZ7SJbXkF/v6FzAI7NOXPneNlEq0KKScuP0BB
 Z+RTu4qmNEzzHkd274TAECf+z9nluPNzJHfPSqJ5uk6HrbKUIH2asRQtbDDi3AeM1eZz7SedHV6
 Ilb2lJU90+yfwleMpZAMZjFLgglLMsx9mQk+vO4aN1jOAmZJyBYiSNS7HPfLsvYp8uvGtlW1qlc
 MNIfMpeaWnzaqNG8co1SoU2nNpGcFHYCbQw3AIr8Rtmo/2Fb4ysn1TuzqZWB5rfWAxUwbpq5meD
 2/6X5ZW4Cim5M3vwNrbs8+wA3xUeEEWZtA48prdbIg7EuTmIdLPEgOhpXXHVrgGhrim8ND2Rwo+
 kZy5wTyMbF/Icvccbg8xYWlUI2BHiLdk+XxTNPN/eJrvE2M368N42rpW5qMj2bFOquaN1YoAtyN
 SS/lMQs2au7XgiXT5qknZQSRVs2sqwL8F2kl+XM/BnTSx+dXKIzgUyzpmd7Z/pTPrVQwRrDjhsX
 zVSYRD1AWdDgwNUrVNwf8D7RFTChLbryEk7dApxisvHsuq+kPCZac0tq1BT3E89bMqkymU9evZU
 agH1nslUUaJa55LdFqhcRE+Q5xf8jq7YAlfrXzD/RxIkZpHfLouZFdAQKEHh6yWwgZv2qdlZNdD aGZrxwlmlukU7gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_022429_470497_8B108A0D 
X-CRM114-Status: GOOD (  12.19  )
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

Print full device node name with %pOF format, so the code will be a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/arm_scmi/bus.c                | 13 ++++++-------
 drivers/firmware/arm_scmi/transports/mailbox.c |  7 +++----
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 24e59ddf85e7..c7698cfaa4e8 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -401,8 +401,8 @@ static void scmi_device_release(struct device *dev)
 
 static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 {
-	pr_debug("(%s) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
-		 of_node_full_name(scmi_dev->dev.parent->of_node),
+	pr_debug("(%pOF) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
+		 scmi_dev->dev.parent->of_node,
 		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
 		 scmi_dev->name);
 
@@ -474,9 +474,8 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	if (retval)
 		goto put_dev;
 
-	pr_debug("(%s) Created SCMI device '%s' for protocol 0x%x (%s)\n",
-		 of_node_full_name(parent->of_node),
-		 dev_name(&scmi_dev->dev), protocol, name);
+	pr_debug("(%pOF) Created SCMI device '%s' for protocol 0x%x (%s)\n",
+		 parent->of_node, dev_name(&scmi_dev->dev), protocol, name);
 
 	return scmi_dev;
 put_dev:
@@ -493,8 +492,8 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 
 	sdev = __scmi_device_create(np, parent, protocol, name);
 	if (!sdev)
-		pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
-		       of_node_full_name(parent->of_node), protocol, name);
+		pr_err("(%pOF) Failed to create device for protocol 0x%x (%s)\n",
+		       parent->of_node, protocol, name);
 
 	return sdev;
 }
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index bd041c99b92b..ae0f67e6cc45 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -127,8 +127,8 @@ static int mailbox_chan_validate(struct device *cdev, int *a2p_rx_chan,
 	    (num_mb == 1 && num_sh != 1) || (num_mb == 3 && num_sh != 2) ||
 	    (num_mb == 4 && num_sh != 2)) {
 		dev_warn(cdev,
-			 "Invalid channel descriptor for '%s' - mbs:%d  shm:%d\n",
-			 of_node_full_name(np), num_mb, num_sh);
+			 "Invalid channel descriptor for '%pOF' - mbs:%d  shm:%d\n",
+			 np, num_mb, num_sh);
 		return -EINVAL;
 	}
 
@@ -140,8 +140,7 @@ static int mailbox_chan_validate(struct device *cdev, int *a2p_rx_chan,
 					of_parse_phandle(np, "shmem", 1);
 
 		if (!np_tx || !np_rx || np_tx == np_rx) {
-			dev_warn(cdev, "Invalid shmem descriptor for '%s'\n",
-				 of_node_full_name(np));
+			dev_warn(cdev, "Invalid shmem descriptor for '%pOF'\n", np);
 			ret = -EINVAL;
 		}
 	}
-- 
2.48.1


