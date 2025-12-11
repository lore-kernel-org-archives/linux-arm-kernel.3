Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A8D41D6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Jsu33z0wmycD38Ck1lob20P1g6o+zkut+jonvSWb/k=; b=C4pULOJCLJsb/ENFmIhL5+aaVM
	wIcElAzjE6xjC99RVs4yUeexFw0mlAG6AmTzvMVJGooJZuKTIUvnGvlacWE3BI31RI9KC/sZqw+Nm
	je6i6C5UUaW+BihMhs1kv3lS4UxONSWai4Hem6L4fmrokeOL3YS7/htlSrcyz82igOMxuXw6aX8ja
	eXGMFiAWDY9Ii+HyqnU4EqFXab1Tzq5uMuAbwOXL3JMQSUMzJZ9Yhic7Fb7/m1I11DHzYpSfq9oVM
	VarvRjR0htebs7wkyeg/AoEqjWN+6lqy8QXOuDJuR3Ie1cdYe+XEHzD4K6bNchbDmvk7QlvRkYbU0
	CfcaofZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGv-0000000H1Cz-0Vqj;
	Thu, 11 Dec 2025 17:16:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGs-0000000H1Ah-2VZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:16:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42f9ed40b8fso237064f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473365; x=1766078165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jsu33z0wmycD38Ck1lob20P1g6o+zkut+jonvSWb/k=;
        b=NqB+GnLAa3f+4MfwmqjgT9AMCeWG0aHhQ31xwFA1lXReHi8K2zCTNX5yWEhC1SlKDf
         dFQcMvoXcCBb7BYO6OPWDjVtO0wUgsD9QI7OYK1xi+M4b7OgSMROheiZZfUtkpUaYWXo
         H0wk5whn96UPtDUCTvPNhcUcmweVKYHNSopRlwokX0So9o0TzymQkUBKFlZwjnRwF033
         t/JY5tzhc/frNHAUIrQPZVS/JrRSLi3MlGyu1XSFwefwIoZIHpGuRt/0zIluCryyT+9R
         /nu+DkFEwQ2MZsn9U0WINBmkm4qmJ3WDZG4Ud3MvjmUP9bCAShe7bXVDUHnF0IsdH2gj
         2i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473365; x=1766078165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Jsu33z0wmycD38Ck1lob20P1g6o+zkut+jonvSWb/k=;
        b=cnQycUn6h0NkXA7d2p9lPhaEPHPe+zwcrgij0VCpoo/nnybN0VGlvNFVrZyxnuLBAk
         A+dM5eAwzsXqxN93vu0BgjxZ7mE4Y/zEe0oT3IFHi75kZ8BKRgdL3NsUzaFqmHKz4KHI
         pC6MAxAP0H82UXbRMsp6X0pqiPXNUKmHDH30QpGroRnkZrRw4gg95ZZ6CWRi+FQHGa5A
         qQZWU5zkiRJxXWh0W1TDywAdfhGAybc3oxdTGmCzWrhxMT2PwtTUH+ZfVaZ86O/jl9GW
         8SOL1u7MRxOPSI2WkwSDmqC/77xwt9Hxx6yssuxQl9Hmu7y8h01eDMu1QZX0LHYpOUFp
         uOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT4006FanTTniEH0FYS0AUCKYeC+EMq8UJr9J01J4bhfB+1rZ5bI7OlHbiNjQdnRwD3cdUZhH7hAoOxjOa1ugZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxS3Me6nigZL2rE3u3MNeWVrVsLbRtlEoShqtoCkTh98CdptZOI
	vMSdhpYeqi6Zx2ALxXg6iV+306yIv9WSBaXswBuMDPm9bsoDeTBZm9RlZBRtCV0v6tc=
X-Gm-Gg: AY/fxX4+APBGgskXO8r28y8a1VS28MwlRp+BD2mPWEiQ0LFdF3mUOcxvcL1V3Kqa11a
	fT9XvjvaJX+9NgMBBnGuUPAl5u9fh9ytkcTHm8SYX0MTd98jEZqizgvQTFHyvK2sRwvdpzqDC3H
	hvyoIEk5+ORWDwouRAFY91FCFbmQSnjNdtG00aBI24Eht91I5g72Gs0Tf2BTvwHhWRvtfrv4zQk
	x3hgKrQGFKxF6pAoN/Kg02f9udzif08O7d7dOM8iSBoDlHRJrPnsaI8xp/ss3gfi6gKpt/MPYUj
	OfGCl3BMoCxA+dZKeoW6YZK4m5FF/1vg+aPJmdJJaXMwmVwH01fYXEqtqjJLzSeFBOUSDZ7J4/S
	gVVW08gIZmnbvwV1ONTkwWEpFpfonXDqPZ/Ib3zmuYd8qLVVvBoNGBvLuV0zlGyBUNPOxJD/Fu5
	bZEeILixCLPT9Feq0Aca5EBSCJwM9XWifDOuWOIj06Q4sX8tgFs7Sp2ITt1QGTNsGOUGX9TCv2H
	CE=
X-Google-Smtp-Source: AGHT+IHT/47lM8U2n9kb0yO2qNfCYTAMiiikeGIeIkkmwYtl5yfApNSyt+GvQrmmfeRCuqCiWdtNfQ==
X-Received: by 2002:a05:6000:2008:b0:42b:3c8d:1932 with SMTP id ffacd0b85a97d-42fa39dff34mr7462013f8f.23.1765473364680;
        Thu, 11 Dec 2025 09:16:04 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42fa8b9b20dsm6977919f8f.38.2025.12.11.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:04 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/17] firmware: arm_scmi: optee: Make use of module_tee_client_driver()
Date: Thu, 11 Dec 2025 18:15:04 +0100
Message-ID: <537c48e3db243b5c68c3192179a948efb3a180c7.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=XCE+dl0ldCkIhemm2S2ZeqHCREzROrXlRdPi5igiXsk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwtSZF4Ik75GwqQ+EWV8U0/usd0EXZO6Sryo OtegG9XU8GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8LQAKCRCPgPtYfRL+ TkGsB/4kfZYi859BNNllj8EMK4U0tKtFDeScFfbKa+NwjGXgHVpSR89DKubfoO7V7TXzKxzZvMC v63m9WjAd7iwwwDv5xXNjj1JC1KnscMoyDrKlzKWrZiLuYJHCZrk3Sydo/8FtIfFKhL3/J5Vixg P+q+Yafa9vNA3OaLq/baAtLoPdm17/FoQA8NR4prce1EHo8UMzLvPXuyrpEGvq/WvuDVwpPraxd H88+knoEsk+vtjpVUa1O6A91PsS5YPd1QCPuwaCJ22w3g8vPvCpO+5sOP5c7Yfu4Mf9ShaalcGG QH/pUvOksk9bBlExdPdfrM98AqIk/xJKyHsRfm6/hBZGcaId
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_091606_650988_93AB2B4D 
X-CRM114-Status: GOOD (  12.47  )
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


