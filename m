Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC08D591C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xNSzNCYfMVVqwmNC/dkjD9KuK0iM34sxaAeB6M/XILU=; b=35LOQyLWVDW+Rhf/l8pLXBhzl2
	LbKsU8KYyVunTvzHczPHwr9QQ/CjvbkyLUGg5uJaBo4P5FrX8F/kFlpRzlIfdqx4xtX6isvHes2nx
	axRW+evJY0tDspFoHWsX2AID1vDQf1y5YCBnp4VsgsJ86DT2Q/AmsdcmP4iW+jPfvKpt4ohHTugch
	3oY5+Asd6YCezr23hkxicLFUl4etflfIWfCaS87UGfjiZ47SuVx/3klSFix+CMCd2SjXyYQt+pLQr
	rTGHKvX+R01M0qGFcHvjWMTZvcWO3TFm1LuubtxFBQEMY6s1XZvz5zp3HIBXHAYolhHSC4AfiOj+T
	UoyLXp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIeZ-0000000BdgS-4AUD;
	Tue, 19 Nov 2024 07:28:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIde-0000000Bdb1-1mQk;
	Tue, 19 Nov 2024 07:27:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so3841138a91.0;
        Mon, 18 Nov 2024 23:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732001226; x=1732606026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNSzNCYfMVVqwmNC/dkjD9KuK0iM34sxaAeB6M/XILU=;
        b=NXpfF14L+ZZWJ8i4sXFRh3U9YQebK/LslHqaqC8iDuT3Bba/Lh9xG/tamSiFrgBpMQ
         UUpvMXCVY3TCp95Q9IKCFpbu0GYKbuxgAybKFWE801rNEA2T0fUAdiBPfMd1s/rpm4tP
         yoS7Ba//GIgRxaCGiqRipbYRkWxScLfAN/rWI18IIS0McsstKBNqQC+94fDyw9r3OSAG
         2JgFg3rfSdPlIY4VrzMKDQYR3kEM2ioMgCmy3hUqLYKIfscNGuC2l9J44oY6pKzL52Nc
         0vwLU+AP/+Nv/n9DONFQIon+LC2SSqm0uterMh7jgGhDciyfjc9X7xFvWRgtxw1dXpEs
         8SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732001226; x=1732606026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNSzNCYfMVVqwmNC/dkjD9KuK0iM34sxaAeB6M/XILU=;
        b=ee/qRvCqfqyafUfwGOVN1K/H4rOaj7bMeveJzCvVrQSw7mygYfFVY7kNCioIIrzkGB
         3IHhQWUAzMVCp87TTqAIGhFjIESPTDt7/L8a7jSoK9B6agkmpfZj9eCMb4mJHJHrj6xO
         fsTZxtfk5gJdKOwSXJjGzq8CF5endYgvqBtLfDRhjykKM2vi+c/i2oAIpdLn1uUo1piN
         wfCuKyt+/weIpP46WPH4JYJBFJbmthmnfUFiyB22iTVxEaYXDX3rV7A84QdUbWYVUpPq
         yX6L3t82u+AhvP+F/XvutCNWMvBMdQ6zqqQssppi+ddnh/Kh0uv//nsewVWlnb/U62gx
         nR/w==
X-Forwarded-Encrypted: i=1; AJvYcCX5KJyJe6xa0SAHOBmCgqF5y/po/TXPkKG/OexsvG6dkvY/RpSmeiXsAvLXbAI+mnmw+ldKo7blHRamVht7Zox+@lists.infradead.org, AJvYcCXkYNR5VcgHIxpy2dfikP7oXvJm4OGM2hL76BEw9V9flZTQ0Jwi9YPEZlTpesT4cWZy/KvYe+F5SJmAE1d7P1U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHnk05+3yUS+bv+OYRCBwX589GaHOHVHZe2XDO+/c5RCw+pV+c
	uRfpeZ0CAPL4mqqQtR3yYzZEZ3YZHn89M4N7bu3ZXyWrYDxGmhNY
X-Google-Smtp-Source: AGHT+IEA/iTsZZHtlCuUDTuhDZRJe4+zgwhrGD2wA/t1BYs6ZH3429oBnqwQmKCFm9ZWFlUypW/zRw==
X-Received: by 2002:a17:90b:390e:b0:2ea:4578:46d8 with SMTP id 98e67ed59e1d1-2ea4578787dmr12919293a91.9.1732001225619;
        Mon, 18 Nov 2024 23:27:05 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea8f04c67fsm2423849a91.43.2024.11.18.23.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 23:27:05 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Date: Tue, 19 Nov 2024 12:56:53 +0530
Message-Id: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_232706_462671_B83950AC 
X-CRM114-Status: GOOD (  11.21  )
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

This commit fixes an unused value issue detected by Coverity (CID
1519008). The error condition for the invalid MIPI CSI-2 is not
properly handled as the break statement would only exit the switch block
and not the entire loop. Fixed this by returning the error immediately
after the switch block.

'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
optional")'

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..9ad5026ab10a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			break;
 		}
 
+		if (ret)
+			break;
+
 		/* Parse the endpoint and validate the bus type. */
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (ret) {
-- 
2.34.1


