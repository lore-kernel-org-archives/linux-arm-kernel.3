Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD5CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9k6YZPdseL2nMqrpcpE66trirUONOvdRAtp5r/05CA=; b=ePydHQFZQNv2NyW9PEpG0ITAyl
	HsK63lKQoJJkoTyTY9xNnDq7YfiwbNoXsp+aw/lXRkfi+sebLpdx6hu+8oGjTcBC+8cZm20w89GPo
	N8i501D1dA7KnTckTe561zmFPqKcbe6kDXd2UbNia4HgDKPROMm8iTmrOAbfItCqYOvoHOdXxc+5q
	vBHzniyfr4W5lZRCohGnIUu4pgT560TMaq7zXjUdK/xuEtwZnGoKJC24R2g4XFUrUgWS/2xT5BeCL
	JQt+Ul5GFO4AMxewjp9jf3XgbRbOJ/86O3+b3QATioAjUGCKDTzeqlTk3omzdD1axTbg3q8cLVFjI
	cTBX474w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeBB-0000000DpJH-22n5;
	Wed, 05 Nov 2025 14:08:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeB9-0000000DpIW-1OAw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 14:08:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34101107cc8so3433694a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762351682; x=1762956482; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9k6YZPdseL2nMqrpcpE66trirUONOvdRAtp5r/05CA=;
        b=XcLVAjiXnlBgMECH3ZSZ+qh38czFZ/b7RGq97NZJi0wCbPO5XDWulZ5Ism+XCNKtfO
         npEocXGoph6mquWyR2nrdE4uPvTs04u8XvvIXBF/FrnIp/iZmxbV/9nVzBjc+0AcpiU5
         zPUrVAeImYPy24ZCQxbB7+k9VPGeyxe+EwZ5rM56j97pvDaUVooFsMEWnPgo49tgBn95
         azBcDm+QAPvOSnZ6OdMq+HQXjFt/y7hByq1fR+iGuWatQhWluvUWA/Ls3w4D3AgJ3cAg
         7YDCI8ZAfadDxyCsFuFLYFfNd0xsqQuuufMUI+DUgCBBRmpGiCCn+lmK6gkF4FSoyxcl
         vsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762351682; x=1762956482;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9k6YZPdseL2nMqrpcpE66trirUONOvdRAtp5r/05CA=;
        b=Vq48Hf+Ww8Ps6MKBeKaWvGG7rqkXshJUGTzU5Qr9Rpqs1zuZEM8u7XerxM+qRqy4oj
         sB5mKqckzNnuC4ER9cczhud+Ozkfa5PUMPtxDhcE+nevICTrcDTagrX/qaNChsg6xhWS
         q97B+0gxq0tUNUEJa7M8Dt4Qg2yvpqm6QUIbt2UCCT1XSqxjWnwo1r9A/pyP2ZkGfqq9
         aQMZ74uI9FqJ2mO+NZZbH4vWiyROXa/9Qtb+yL0sL9dHEJozxs4GZh4p+S2kx+k1JmUH
         O3KZNXL+wHSCFlpCQRtnimcxDR3qSucLkdmSj3vvO612IHAKxr7p3MABhS8A0AwRyhU6
         r+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCViP3cJ8AZ0CTb0A9ZCdlLEvNtgw4DETNGgfR8ACIjNysUMx6p/s8FOnEz4VZv276B+Jzz85PUFZRecZp8ZuLMW@lists.infradead.org
X-Gm-Message-State: AOJu0YymXXCR4QPy2YFjZM4KkSc+JhECD2sszDEVwokredD0F/uZsfFv
	Ibss3qVBZqlIT2BHcNOZEpj90MsPe2J9TYqdrdlhfKLRyPG49N09JY2k
X-Gm-Gg: ASbGncv3WoR3d6C/qqLQdHuZZ8EnGzAWV7P382c+TY0ghts8G9a3xNM9a3CbBktIgBW
	vJ6UR9XgWJOf2yicIIlubM/VRLqyEQ6YasZkSsVZvQ5xoOY/btBYNZiSc0W1ukzkZVefAw3ITW/
	2VwdkJHHWVCtISVyUTWol0ZnjAa9lQvuz/KAYaYZXIzhynFl+QMnS6bvIFEnC9KTC8pgeBBeWv2
	sMDMX4BuXMkaksx7LZcNnxcKb+lcUKDZIKdWSp/AA7NiaTeYxLimhxmyjj8aurMwq5UHZPCAhn3
	dqQZLKCnmZr6/Cls3RqEQ+RzZ6g24q+QteaEW5VLuFpM2Bovo51xtGCB+0izvVA5iiNqnMmLGkf
	u/muGn29l/5TNXQxgsN361EBEB6GrywpTPvRLxUpXuXii36XjQy+wF/iBZKcVOfhfPM+jUDnFQz
	boKTv4EcwvQQ==
X-Google-Smtp-Source: AGHT+IGLooWGceuU3Xy6pREqs4jHf5ahAGLwUS3xj0A3y7lHHK9M4p0Qnju+mGSRH4RzUh8au2cYpA==
X-Received: by 2002:a17:90b:2751:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-341a6c006bemr3407374a91.3.1762351682042;
        Wed, 05 Nov 2025 06:08:02 -0800 (PST)
Received: from aheev.home ([2401:4900:88f4:f6c4:1d39:8dd:58db:2cee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm3090217a91.7.2025.11.05.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:08:01 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 05 Nov 2025 19:37:52 +0530
Subject: [PATCH] arm: fix uninitialized pointers with free attr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com>
X-B4-Tracking: v=1; b=H4sIADdaC2kC/x3NQQrCQAxG4auUrA00lSnFq4iL2P5jA+0ombGIp
 Xd3cPlt3tspww2ZLs1Ojs2yPVOFnBoaZ00PsE3V1LVdEGkD6wxs/E6WrJgu9sXE0QHWUpzVVx7
 jOUh/V1EZqHZejmif/+N6O44f/b3z4XMAAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=D1e3PqsDgSVg01Y56yPEgBksv7OMvfjXdZ87PsO9sg8=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDK5o+xMm3Z0aui/S9/z7Ir3feess6XdV76fPH47JeTKk
 Wb9rT1FHaUsDGJcDLJiiiyMolJ+epukJsQdTvoGM4eVCWQIAxenAEzkeT8jwypbxilsfDmrTTov
 mQvry+3dZ9U8W08wLrL/EcOBaRvvVTEyNPfc3PBtS/uyvu1tH1Q8ZI4fOvtfYKrlwb7uO4U7dqu
 /ZwIA
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_060803_378972_62004387 
X-CRM114-Status: GOOD (  13.77  )
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

Uninitialized pointers with `__free` attribute can cause undefined
behaviour as the memory assigned(randomly) to the pointer is freed
automatically when the pointer goes out of scope

arm doesn't have any bugs related to this as of now, but
it is better to initialize and assign pointers with `__free` attr
in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
 drivers/firmware/arm_scmi/shmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm_scmi/shmem.c
index 11c347bff766763c61100f884432c2e4669e5918..dadb37557f8aee25465e1a423dfcb4a889852434 100644
--- a/drivers/firmware/arm_scmi/shmem.c
+++ b/drivers/firmware/arm_scmi/shmem.c
@@ -196,7 +196,6 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 				       struct resource *res,
 				       struct scmi_shmem_io_ops **ops)
 {
-	struct device_node *shmem __free(device_node);
 	const char *desc = tx ? "Tx" : "Rx";
 	int ret, idx = tx ? 0 : 1;
 	struct device *cdev = cinfo->dev;
@@ -205,7 +204,9 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 	void __iomem *addr;
 	u32 reg_io_width;
 
-	shmem = of_parse_phandle(cdev->of_node, "shmem", idx);
+	struct device_node *shmem __free(device_node) = of_parse_phandle(cdev->of_node,
+		"shmem", idx);
+
 	if (!shmem)
 		return IOMEM_ERR_PTR(-ENODEV);
 

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


