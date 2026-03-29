Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3895F3D5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=; b=NhRFuC6jvgpTASgs8NpyzGsFV0
	oZJSflnKb9+hqnxLX4yg3+EThi1ZMRFCHE0eNED+heT3hl1ZSybgEhP32gODAj0jf//lmPoaiS65q
	OQalbrRNyc4Y43cmA4zDG9TJ1VX3GP4U6/bb/Y/hXhzR8Nauh7VUbF4YQhVm3F9VRbfBYkzI2ks8S
	bpqFrAfB818vxkvkTmdbtIGd/ybku+3GLLfyvw1Gp35Bmd8FgKhA4GxbUwsdXcdYTZRYbdp1J+uxW
	wZ8BEpi0CuMQeDAHh0GChJ0Glo9YQ5LYkTQzaPDa17ylOnHHT/l2a7t0Kb94ReisITzNIE20we7d0
	DJZpqkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kOJ-00000009gpr-2sFn;
	Sun, 29 Mar 2026 07:16:59 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kO1-00000009ghw-0AeE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:16:42 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-6052f9376bfso15927137.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768600; x=1775373400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=;
        b=ABKLB0hvOB9GJcFaOcfBopVzmeMmsGJvq3LfujPH03m5DcciSs+bEMLmkPe21R3P3q
         Qbwj8S3TPdJ6I9MAru92S/cEh7e/3ubcm1eHEujQKcGOoK7NwUZQaHwJ5/TdhuqUU4Zp
         jktkyhYb4YJrhb6xrGx8ZkShndJiY3jHDZtvQffhTGuZWz11sRwV/hafLDA8siNuhvvS
         o9xzkrvKPTjPXLI3OOmJWPwLEcML+GUUsFhvbKO9uLzfufvd0m0FriaUtf+dAOLZhwR0
         dJ6abs/YuevMWz/E/XSSfKIopYyM2GAdrjwy98fv+fSxxK+E0nam27Vkq2cj8wF1foSC
         548Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768600; x=1775373400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=;
        b=hA4iQw01a0KS5jpmQbId4d0A3rQnJQB3DOUG4ZTPd67lgrBdVJjszNncvyvstFCDeJ
         HE2+1O4qwCdRcFRpOJNjVFLpFF1edW2WRQx0OPvhdZVTArm3OlWVgy6Aolotr9Ch93ba
         M8wLsoY0UIiA1rJXYJS9UKwelWpMazfZHh7ILIMndOjhBAse6OKIZ7G9qK95d6DQgAvH
         bKBfMGJBQ9MYQDRWLjZZJOzPCcZKdiOJSDzQa0m+uoZR0b2PARyouUyNq5BLGmTzZPCV
         huAtGz2G8Bw1OXlAznNPSaLybnKMvt9ErXhnhyZpOstILuG1pfbQnG/138UUudvBcrrb
         iDcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwLN+PEG2MQ/2+CMW8IhwhJ6ZrOpAjnkYBYl7yLBnYlbhnqHqnNyBWISUQSHkckjnbOCLpZhJvdhdZqoH6Ytnf@lists.infradead.org
X-Gm-Message-State: AOJu0YzbUe73d0uTr6Lo4Jvdc2aHF2SAtZ82E0X8RQdQ+Yl5asCxP0tp
	tgqjEb5jipNd/3HuBmVgWzJaFky9qa7sFSHj9fAgZ67HX20uk8DvyTbT
X-Gm-Gg: ATEYQzzFw0VZ6fZnebC9FZ9G7Q30gTwAUJmKntSsKDP03hsAHPKHL6se7AR/Ozjc90t
	XScrKThrnMXEWl+/K2ab/HaaZYbuKoGp1ZhEJRe2a/aGVfeZc8580mOhZr5IruSGMmxyRVcrotA
	F4yinlfqVCNaKAqZSBP8axINiXcyc3Aby3SsYJlfqAzjAyOa2vVGr/0RA0NzOZJLfSWwdoxx/Me
	qWpscPpmlfa4HaJqxk6Gbh6Xjt58oY8b3oHv6u8WSKeuX6hFEdHP/LYvGQeOrEaYpWKfOnVz2vy
	CQy78PW0McAzEtuOllqW/+Outqd/1k26gKlgmPaeAS4hkyWgMgsLWauaJCzbx8agjXsjV7xy3UD
	X8UbMuXs3q4Jaw3LKUdZ/Q6iFEMzvA441bRiPa432O1f2SsMBES83b0U4kxrqarknbLb6pG1XXD
	rLjtPghSssGPK3T0KP1QV5pa5r
X-Received: by 2002:a05:6102:41aa:b0:5f1:b7b2:8929 with SMTP id ada2fe7eead31-604f90e520cmr2908812137.15.1774768600043;
        Sun, 29 Mar 2026 00:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:39 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] staging: vc04_services: vchiq-mmal: fix integer underflow in port_parameter_get()
Date: Sun, 29 Mar 2026 01:15:42 -0600
Message-ID: <20260329071616.507876-5-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_001641_088133_8FDAB31F 
X-CRM114-Status: GOOD (  13.21  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_get() subtracts 2 * sizeof(u32) from the VideoCore
firmware's reply size field to compute the parameter value size. If
the firmware returns a size smaller than 8, the subtraction wraps
around to a large value due to unsigned integer underflow.

The underflowed size is then used in a comparison that selects the
wrong copy path and stored back to the caller via *value_size,
propagating a bogus size to subsequent operations.

Add a minimum size check before the subtraction and return -EPROTO
if the reply is malformed.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 18e805b92..f2bb5ce0a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1436,6 +1436,10 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
+	if (rmsg->u.port_parameter_get_reply.size < (2 * sizeof(u32))) {
+		ret = -EPROTO;
+		goto release_msg;
+	}
 	rmsg->u.port_parameter_get_reply.size -= (2 * sizeof(u32));
 
 	if (ret || rmsg->u.port_parameter_get_reply.size > *value_size) {
-- 
2.43.0


