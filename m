Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C59EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZZIhlXmSEM4mLMGt9PJm09NKzZfuiEVonPYgb5H/yw=; b=kEheFw6Py1f/dO0i//3fvKQz4f
	2unCwXcMHsBVZzf4XZ75ULLJKxa1had/TMzRJt81jU8j4d8sswd3FmcVWK6kBjDrFCAg1PHKXNhFu
	mkUqcQ3bhnDuikUFhyFLJY6Iwmr8s/LvuJEj4b3MjSru4K67vThUmrZd5IZnZKiT+QoVSoMn5IIFr
	pLvpk+OhMbwNF5ysNStt5LpDSDExeUx3gDIj2xvzJKSDerAWfTBuOMfMO7rpU8/Fn47TeJET2fSs3
	8cRYFMob8k1edrgnifJckYmJd2Ou0Y4OlY4g78VYoCgKU4GTAQv7z23cMj1k77DflQXjii396Mqpc
	sa+0GC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cwY-0000000BE0Z-34fg;
	Fri, 04 Apr 2025 09:02:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cuj-0000000BDgz-05Dt;
	Fri, 04 Apr 2025 09:00:38 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abf3d64849dso273319966b.3;
        Fri, 04 Apr 2025 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757235; x=1744362035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZZIhlXmSEM4mLMGt9PJm09NKzZfuiEVonPYgb5H/yw=;
        b=Hi5dhG6PPVXx+dk6xqdzld0Nwp8eAYlGTgNQ6vA35udMqYlub+Ma3VV7q3QMT/ahOm
         E2StymsjMOo/UHmRVRWCpHmw8vK2aoSbN9HxTqends3lo1o0Wlokdcc/OALf2lC+y3NR
         lTKuxMCpeGZ8cEOxCe5JrHFX56iFUXfUPsSGUYVWim0F8FRmYZI5tEd2NqWQHdPdMCiM
         B6kJc7wkNIzkeAhovrkJNgaqHQlU87HwpZKEcY098Z+f69MPtihi2oilBT4ygoQqX3JG
         bV108QFmvTOgUHlwQfXdxMj1KkEF4FCYFvOFvyDzqezRqMo3/+SO3S7uNfuDIGXjsUNa
         aWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757235; x=1744362035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZZIhlXmSEM4mLMGt9PJm09NKzZfuiEVonPYgb5H/yw=;
        b=QxeZHLmx/VuZAF+R1iiZZ9agXzl+LbkJqocIESxF6kbmOPBttPxo1l4EeJ1LXXcNGI
         RiRX9Sgo2o3mO/AvPYFlhMW7FiEEHfbnQLSWRcMUilnq/h0B2rhC5CoNPeDmSxlvKrqG
         wVxdPZRp3fCcFbNhPnFUrO9xdvVRu2wx5MJLqnkNXffiT1tRst97AoLxP0Ofge5wMSNx
         sGO7x9gcx46zG8KF7p042bboAS47kvglm05FYJXuMWmhW+pf73UN1LNqG76y0t5XMNjY
         U8meZWzqw0J9/Ndpje+oR1xj/MrWHkDvPZU71blS2iF+r8/ApGoypqam5jrQsM1ZMv4c
         /g7A==
X-Forwarded-Encrypted: i=1; AJvYcCUtI8y/lgXLn0PECDQhLOW+WNcWwEPChL1tAfXd5zwwqi2Yq+iqsEEVgvXtEW1H5flL/OLGNzfVVZYlT4TlPZEQkw==@lists.infradead.org, AJvYcCWWHQE479oqc0xq/C99Pxt0Zo+ShUXysGkylT6XMffs4YAjw9xmkarQI9o2dzbt6WG/XsfwbQKvfmZxLV3pmktX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy17z8VRw6+3zmW4jL724fhyLCSpRawfdwjTJfZBfPI5vgJkXjg
	GqYSQDrYmpM0sp88QLUt0/lO9r4u6osxR8vLxiKD1Gs+mjxHZzMA
X-Gm-Gg: ASbGnctLkypXDg20hvs7VbO1K9A45JoikAJ6hUVdE80lRWBMhSLUgHD4XEL3c1sspXm
	zuj3LbkF6R5MurWZKea0xww/FobNuyk+CW/QfZpt65lc6Weu0sNG9JfGOPpDwD+EIV6/flSdqvy
	bbQJ+P2NCEZCkprWaKkDmgj1zeAu1PL9aNn6leHSwdLHjK/YSIN5G1N5sbOcqwZtsSBcT9Kuvb3
	DPd7LVfwI3Uy7p9xlYBhAFF0QONct8l6vFIzJPA34PK4WIkgW8xS4Gfrj0Tc6mnQSCc6RgWhzg1
	IAdgEeQJgAZXS1S46b7kcbPmQg5hrdy0w+8kfwWBgyH9PKzhOEvweb7mFg6Jcduypz6lPw==
X-Google-Smtp-Source: AGHT+IFKaYCa9Ekb9gEfEN5MRzSJWHbOs1q70b7ER2jDUNXjdVPmL24jFWpqdnQ80yp71nL0KKYsSg==
X-Received: by 2002:a17:907:988:b0:ac7:31a4:d4e9 with SMTP id a640c23a62f3a-ac7d16bc089mr299516766b.4.1743757234491;
        Fri, 04 Apr 2025 02:00:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.129.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9adc6sm222086166b.59.2025.04.04.02.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:00:33 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2] media: platform: rpi1-cfe: fix pad in call to get_mbus_config()
Date: Fri,  4 Apr 2025 12:00:25 +0300
Message-ID: <20250404090026.2986810-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_020037_060004_599E4B15 
X-CRM114-Status: GOOD (  11.32  )
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

The source subdevice might be using a source pad not equal to 0.

Use the already existing source_pad field of cfe.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---

V2:
 * correct Fixes tag

 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 69a5f23e7954..7db4fe5e0fd4 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1206,8 +1206,8 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cfg_reg_write(cfe, MIPICFG_INTE,
 		      MIPICFG_INT_CSI_DMA | MIPICFG_INT_PISP_FE);
 
-	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config, 0,
-			       &mbus_config);
+	ret = v4l2_subdev_call(cfe->source_sd, pad, get_mbus_config,
+			       cfe->source_pad, &mbus_config);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		cfe_err(cfe, "g_mbus_config failed\n");
 		goto err_clear_inte;
-- 
2.49.0


