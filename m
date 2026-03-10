Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC845FD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=; b=EoO5QDruoKeWUtQ9IPSHbQoIF7
	/0VWoZWkkHAQ2qRvicpaIajqmjRpwmdfwb1tAG6WZ5ku7nD2y/inoXJD9YRySQf1vZXJ169jXhEcY
	2tcXB/D/3zdC96WXPRpnki1fcBtS7A8fPTvga5wmCCLKpHdjtKd6Z+mbI+uvveCQV8lGbvVYhkCTb
	WCrNbmyuuIexda73oE9SuZsmNxx/RZv4gB0GLIGZG2ZPCRVl2Haw+dZAiylVEIrVK8DoUQcOqaYtj
	JUa6Z6CNn74L1n6s8FaN1DYXQ9hfsevK0eB23Yu+C59+6lUBiyMAGHtYR1wdmguWVmK1RMnybpFFW
	tz3FP21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03L0-0000000ADh7-481F;
	Tue, 10 Mar 2026 20:05:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Ky-0000000ADez-1Had
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:05:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82985f42664so3335941b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173151; x=1773777951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=JwZ7Hm0z76hezYDC8n5Q9Nhywa9LmnE4ijvAxL5Yb7JadDuwNaRanDgGODMGqEyr8/
         Bi+hWTWlXfTygxDC1YVWrooOo0f87gBqwl2NttFxKqbkdpn0jX9haLsk5nnYafMB0+rk
         jk79NOYYnoBBsWx7OEgB/kv80/5xHhy0v47x8+tPHzT6K3zznGFgFpoYSnauJkhLlrgQ
         EpTUsJPJlxn9KP0g78nyAjOqW1G2DoeVrzBx8uQUsQ17CiZ4D8eURamEzTy8zkz2XX7H
         znEBGySnWr9QNTjHXNF34M7Y+KtI2KXpX0maUoJBG41UC+XscygVvF8M2hgrWiMAxI76
         pBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173151; x=1773777951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=So1N++R0/PJ446nvr/ffmtaAEVR7EGXXY70oLfr+d0lG4hWMjLwT0RwZdhnR0xopHz
         T5DY0+B89xLKzCJ2/O1YAou4smRWiMcXTEM79O7ReeDyXTXQjoCBPiAEX6L6Qfb09g7y
         8AZoqnIDlnFqYUcjA/lts1QO2cwxMev/Yrend3zEAXRFP2XJcsBaxjFmpfbRmq/1pOqF
         H/sIGPUYwkGrUowZSX/SCGEg4yRSM4vO3hZPVNdFt2j8OmjkP5Z1ducmYCcNkaqjEvaO
         /UyVHSejlVif/1f/qB6AoO1uHIVfFm2LQ/kLE4d8VkDnAhoQOf3nxoGK1ZU2w5zwd53i
         /C8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHcVGwZRrAts8/GY35Zpj/HNIrIKzTdsBNnO8AyGR6K+fTnNghkBxE1bsyBl3/R9Z4mvf4nc+rrEJ7S3emCIEH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk+3X9jrUxqllbgCjQCzsflgaRoIYZlzM3D4GTbXdc6rnZJ1UI
	fPbq4OEJ/TQ+mn5LTt6WnYdDrqivPYaxNXnFU50fY6rqxQQ4Ng8UkKGL
X-Gm-Gg: ATEYQzzCp3YPW6XsJ89Kx0BP1pravGQafcrNfAkPHwttb0lNkhY3WppsqjpQXSVTarm
	xOXw69HJJ+TZeQbjhxVcATnCp7gL84cZyllUqiVFOS9j1ZDDcERifPudflarOQ+IYPw87ZIKJji
	sQxIeQR3IKj3snWDrkmirFeCKhXv7SaPyKk4t6lFQjxurUcFTfbVkVpbyOo6LPLG53QruFmcn4f
	bzQApgGcdESTYWd/Gn1Y6lf4oLEkEd7jJRLb9FGIDY5hs+KDH+l+qpK6jRTp4PYSPobYKH5pYmJ
	YhGC0D9WAG98t24rWT476gXuQURYiraCxe6U2k/ASNThdf7OoQsXkargkZ5ihVhOKDadr4pOy5N
	8JsPpkA+uwbwN11BbOZr58FeBjU65Wqra2TcP4AAOcohl8tADu6aoRd1Httm4Nb+BX53GY0o8Yk
	A6fyIPOYo76T715ptOFPNulRZzwxoIHUvQfn4rDZbE+RRF5zzfR9/uB1T84ZE=
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr156570b3a.9.1773173151308;
        Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:50 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:08 +0530
Message-Id: <20260310200513.2162018-3-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130552_347838_23A9E544 
X-CRM114-Status: GOOD (  11.71  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/iio/common/ssp_sensors/ssp_spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/common/ssp_sensors/ssp_spi.c b/drivers/iio/common/ssp_sensors/ssp_spi.c
index 6c81c0385fb5..e76ef39c6b7c 100644
--- a/drivers/iio/common/ssp_sensors/ssp_spi.c
+++ b/drivers/iio/common/ssp_sensors/ssp_spi.c
@@ -331,7 +331,6 @@ static int ssp_parse_dataframe(struct ssp_data *data, char *dataframe, int len)
 /* threaded irq */
 int ssp_irq_msg(struct ssp_data *data)
 {
-	char *buffer;
 	u8 msg_type;
 	int ret;
 	u16 length, msg_options;
@@ -375,7 +374,7 @@ int ssp_irq_msg(struct ssp_data *data)
 			 * but the slave should not send such ones - it is to
 			 * check but let's handle this
 			 */
-			buffer = kmalloc(length, GFP_KERNEL | GFP_DMA);
+			char *buffer __free(kfree) = kmalloc(length, GFP_KERNEL | GFP_DMA);
 			if (!buffer) {
 				ret = -ENOMEM;
 				goto _unlock;
@@ -386,8 +385,6 @@ int ssp_irq_msg(struct ssp_data *data)
 			if (ret >= 0)
 				ret = -EPROTO;
 
-			kfree(buffer);
-
 			dev_err(SSP_DEV, "No match error %x\n",
 				msg_options);
 
@@ -420,20 +417,18 @@ int ssp_irq_msg(struct ssp_data *data)
 		mutex_unlock(&data->pending_lock);
 		break;
 	case SSP_HUB2AP_WRITE:
-		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
+		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
 		if (!buffer)
 			return -ENOMEM;
 
 		ret = spi_read(data->spi, buffer, length);
 		if (ret < 0) {
 			dev_err(SSP_DEV, "spi read fail\n");
-			kfree(buffer);
 			break;
 		}
 
 		ret = ssp_parse_dataframe(data, buffer, length);
 
-		kfree(buffer);
 		break;
 
 	default:
-- 
2.34.1


