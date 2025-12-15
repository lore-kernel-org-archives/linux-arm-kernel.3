Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7F3D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKbJnfJE7xkWU00mrWTEhz/b//1iCTobbbTcn9iMvYI=; b=Igmp94UCaEocANDX5oGQOmPMBR
	BkV37w+rGwtBEkd3HkHRat+0WqrZZQ10gvPqVbZqhvwfzHHFf6MF0MrXpk/jW9ZlkXXKYS1tfVYZ0
	KUxaMUVPnil//uWdOepo+gNoSDQednh6OMC8IjpuMDnTNQtNup6/VxFndfmuEIoVObLfCYCOgkQhX
	ucBEM9Wb5uTX5u1qF316b725RCx6pMlPBhoHMkXWOOUUxcBrc2ML0R9Hv+V1q+N+ejhczH4cDOyua
	bI1EnHWXhG/9XxrPdFZUCKMnBoeRoAlsSM/pA3r8xulO3p/juMT+HPRX+LKYx15cvouj8KkRL9OkF
	hg3YwPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Oh-00000003mDK-1CUb;
	Mon, 15 Dec 2025 14:17:59 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Ob-00000003m9z-0pko
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:17:54 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so5380779a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808271; x=1766413071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKbJnfJE7xkWU00mrWTEhz/b//1iCTobbbTcn9iMvYI=;
        b=Hhqv1LptshGD2dDf0LkZDNEYwBHCt2b3yPmkDclg4cKL+whJsjAyxHnlWw/u497YVF
         54+m3iUZXpWrvXO3pEpy1jwcpf3K1AaLLpC3YvCxavUz2+ddzRHtA/FuZZq7ny7I89Tr
         V3+AzkRUNhEz/w9dkJ/3hPoynMTT9GcDb/pLA3TjJWoljvBkjDJQbRbzxtEZByvfmRL2
         lHX49SOvsCsBToA3MWjUdGy4H43d8f4DmtxSVHw5LtDv7ASxsZvOopSLmN7vevtcz4aB
         3bHBjyL35+5OyayjHW2FHh+O9BknOhhEqTiofmMeVcxiTpMkw2ETVkj9vI3aHh/nOMPB
         9huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808271; x=1766413071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKbJnfJE7xkWU00mrWTEhz/b//1iCTobbbTcn9iMvYI=;
        b=aIbzl6Do0QF8kQWG1IrapQA1fjYTzptSUVwn3dAtHAMjFdDSZU7WA37X+2WeLaMV7u
         kVCJ+StrYpsaidsSxrUtqqPvfPxQjYMXyD0Pd2yxTmcW80jK8HZs++QjYmyBWuaNvTzh
         gbQ74aeGzsyHxt9j1HqecluYchN4JIKs8V0lvzIRuPU0ehc4IG2kgUP8VcAHvuoz7GI8
         mi8AehSMQQH33HZmbQHPBq/J2+6RJTTUnvRHrBvuBjrZfdlFBxJT6QupIm6QnC9mlJt5
         nO0WujCOQGXbWAqCjkICjeg8YUBp7F9jA5eW4q/exOr+3ZhEqGXovp0Nj8SVRXAg0lsx
         df9A==
X-Forwarded-Encrypted: i=1; AJvYcCXXYJ01tBYc40VrmFJX6iu3Fk/TsDtaXy6n6bRHQmeFXl6xRITalG0Da0yMC+Z++P2D+1vxW4jNLtq/J9C2fW9+@lists.infradead.org
X-Gm-Message-State: AOJu0YxOaAPtxfOLSXFkjJ/cmcQuPeM+hwviu0JSfeNNWpua3divzA7H
	12CNLI82Lkwy2xf7XC/IDnOqwtDBNC2BbwA5qt3/E37TRTp/qiLWxoRluA++QQndGbI=
X-Gm-Gg: AY/fxX7o4t+wPMNZ2kRD7LJ7X8PPvr34PSncil3AA9xcNxBLX2xfjJ4Im+iZA8KZTv2
	gpjmAxPRyzp2a6ELagHoaGHIF0OVG7iGfCCLwMwxv8oluV4rAVugtAFjjRRu/OYSN55ePzjZH0Y
	pMwGXAparHnUUO0R/ZdJQixqFm+kfCua8XTlHIHz1K1ELjvSCJLrw6WHgdhhDV+JU4hEIqrIRKc
	BY/GDLRR624aoN4a7Sfogl5SKXDDM+rdo/p6eDXxVT99qJBlzVfxqN6qi8Ko6WXc6PmQTz7GOkI
	2n6V3ciyQgdxiltlXC0EFTHZRuF+6c6YUXCApfTq/70JmW41bNLhMCw5tlT5MMZQHjw4Z4SRZhM
	OxuuypavdAVNS7uLIF0tDo/fqMWfbNDhHc7RLl4TmEEda0Ikk6PFMalOANihQvoSZbnOKP+hrlr
	sNXxrVHJhUybSrC/diVHWNfuNc5lmPXE5rC/c+xQu9QQvJPCvauIZFPWLSrg==
X-Google-Smtp-Source: AGHT+IEeSJVfJZs2amYWw+KLmEmBNVhUpqN/6+ZL8YgyOFyTuCX5haEwqwHXINz3XjvZu+mkawojpw==
X-Received: by 2002:a05:6402:5190:b0:649:cafc:2656 with SMTP id 4fb4d7f45d1cf-649cafc26c4mr4434360a12.11.1765808270921;
        Mon, 15 Dec 2025 06:17:50 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6498204fbb3sm13523660a12.8.2025.12.15.06.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/17] firmware: arm_scmi: optee: Make use of module_tee_client_driver()
Date: Mon, 15 Dec 2025 15:16:40 +0100
Message-ID: <983988a9020a2829bbedfd599fb6a52f8867e37b.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=djoazKNFNWBpRKVOu8VgnZQUMBy5m2efHrrhLCTajBI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhlaY2qxCEcyR8weby9a0kZHvfdpLdOH2fIH cLAkAUU1SWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYZQAKCRCPgPtYfRL+ Tm8KCACFX8eQzR1FU1YYCPyj7bjkaPb1IJMAne74xoK4zA3MizdDdnVj2jg38iTR72qB2ShDcYl m5G5Mnl8h4+UfOlGR5qzEmCbu89xesxDd20Sw95hoAUVz0pmelASWucFk/Jd6VnV3rG/n7NZo22 +3EQyvtFlSVGKdWFk2qXUJxXteCmVDN7EZGLLs0sR9tZ1VSESx2gPy+4AKC1jd7FYaliy79sV53 VKQyVvFcddYJFYjP6hQxEvlwnEScer6VulhTzAxgkG2lUsElYoPUmoSnEu0FQInj+ge7ThPx9HV g+mRx396gQ39PUOMdWVo9ck0W7i0qCVcz3/vA9UQ+E7jL/UP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061753_263868_79C008FA 
X-CRM114-Status: GOOD (  12.59  )
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

Reduce boilerplate by using the newly introduced module_tee_client_driver().
That takes care of assigning the driver's bus, so the explicit assigning
in this driver can be dropped.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index dc0f46340153..8fdb80d3fabd 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -612,23 +612,12 @@ static struct tee_client_driver scmi_optee_service_driver = {
 	.id_table	= scmi_optee_service_id,
 	.driver		= {
 		.name = "scmi-optee",
-		.bus = &tee_bus_type,
 		.probe = scmi_optee_service_probe,
 		.remove = scmi_optee_service_remove,
 	},
 };
 
-static int __init scmi_transport_optee_init(void)
-{
-	return driver_register(&scmi_optee_service_driver.driver);
-}
-module_init(scmi_transport_optee_init);
-
-static void __exit scmi_transport_optee_exit(void)
-{
-	driver_unregister(&scmi_optee_service_driver.driver);
-}
-module_exit(scmi_transport_optee_exit);
+module_tee_client_driver(scmi_optee_service_driver);
 
 MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
 MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
-- 
2.47.3


