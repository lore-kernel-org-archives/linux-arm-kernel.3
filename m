Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851C1CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=; b=bCrH0fy0QpKYWl4zJ+UIfIUweh
	nz88hPOu341WeyfikHcejMpIWyM3SqQEd2lZZR91WFrgHES5U/wc/BuG/vJICVqsEdOJAVm0jvzYd
	9JVFTd7YqPUluNY6WBRIF2EZDmf7MtaTP3DSrcK5mgTDR66AW3W1tO6xDlAhoMS+X+hm6ilo01yf0
	OCJfDynl761Pb2/bbvdkgRWJVabgMXeEXVosQeK2Zh5V6OxHzX5HTykeesMZ+928q+ddJpe8/UPYB
	yVQqQMc3EexOKVklbyAiahm3k81U2iVgfNDnx7SZN/p4lpcYMJGjunj4R1iS0P0o77VoGvbMNfm4Z
	2zy7tHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcMO-0000000CveQ-3dts;
	Tue, 13 Oct 2026 13:16:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcML-0000000CvdQ-1L4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:16:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49e73611928so31413015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791897359; x=1792502159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=RaffImXzE6Z8AaOw7qBFyPX0MvI85gAdLsgZw5gOMq7dq8O7qW+H7ruOcEAvJJgEoO
         MSewyTd4U8LMinzyYWYy8uCqZd3Ysa/phCgcXXYiaQOA7F6oU6i1xOThZIo5Mh0uzSet
         5uGCuPrghoi6KaeVoFn9feTnHwtQZAyg/DYYyE1tdFC8KQtcJJdNJLFumIhJjwcrEXc6
         7kkKBvXsqTPZLeMJbTO70YRJGHp2jKqDb23h+ZR0wBRgbOSbAMCEBQryzJp54yIqJiuO
         mycrL1FBK+9Jj55y+lWVZWoZqbrRHSxcbCat+IRUjfrT4gZL1dtd2otQA6lpawgBqXaj
         KRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897359; x=1792502159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ig0Y0bs9FN6Dhfi95iv4Xq2tV5MXRKRrxHG4lzB5XTM=;
        b=c7ml0QVdgvqIOVgvpS6Yj+Vx2DowI4qNDNjPxcIHNXDCQ8KChZS3o4zLgeYcRAJsHz
         1cns8z0klHmcPD4EPUX1x2cMvB+ksxR9BoUUL4uAqOU9wIIvwVgjEJvbod/VV4IJC3t/
         2Q7qmp8pDq3By02YA6uczO6R6LpcN1YG5orL24vrg2XSpZtJ4V5S7FQqDMJH7ySSsYWB
         3VnFc8tf5dItnq+UT7dMzzzrkMSyFKIGuhl5L6rsYicaWg88OVNiiOGm7uIgJhOln2dp
         Nw7GvCgeY4tO7b67VERRo4CXaEtKuKVHap6G/YRq4+OomA7cTHp+DboegkuQ90hxFP13
         5btQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqLFh+rWbPbzzvZMc1ftowWYxkIFsj1ndp/FIdTVhuQPlnAPGP7qqgR/aAETIwX0axugTmKEY5XeNVemab3fom@lists.infradead.org
X-Gm-Message-State: AFq9FYKoQbhQDfzH571qh56yRiI1eiAgiTIO1Z+OYhBLdTMwu9Fsybya
	mHy4QIFYo1mcVJm9DWKHyPVgCZhtU3I2JcUTSAZGpqMs2Np6IasdvL7I+gPM7+M66Tg=
X-Gm-Gg: AYBFou0yu2NhxYbDNU/bvwWq89I/PpIL7c8v9yG70GvgDetAhVZgYxMlEClnKTxMUHK
	oT5h2ITx+mvmCTM6PiQ/r0e1RFqk04CheEKTD00QEDM3SxUYQhK0EAHmjFGfb6Mn2l9iYV3E1pf
	kyRx/urIRZmTAKSXfEerXYQvMMAvV2tMGSUwD+bedmG23cvcZ1eUIL8a7rTpN4MhjoVVa5PtoQd
	uLv/7m9CVKUOi2ILLcsdB8Z45I6z8NkXfhYIwpj2sARORg2guQlXywnHAjHH1tP3Bw/IG+Nhc8a
	jXmiVvXDAU4hLX8fyQeCJWemRX3V+yr2IaZb5zZRamtiQbo23Feulam6OWet4Vu+hC/qfUqcNm8
	lpxgAIrz7KOM3/poqV9vatNdPX2wl57gYbkTvS6dJc9LRSas0uBovvJzKSwj4hzGguxw3G7EWhN
	5J1riMZ4SLpcukU9RvFbpeHoSxtkionr6jdMU1yWHiI5s1Z+EtvSRRV7wk7+G53Sm6wQ==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr213743705e9.8.1791897359239;
        Tue, 13 Oct 2026 06:15:59 -0700 (PDT)
Received: from Halley ([2a01:e0a:dcd:52a0:bf8b:5759:6fe4:3105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm520141515e9.6.2026.10.13.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:15:58 -0700 (PDT)
From: Martin Wetterwald <martin@wetterwald.eu>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Martin Wetterwald <martin@wetterwald.eu>
Subject: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Tue, 13 Oct 2026 15:14:35 +0200
Message-ID: <20261013131435.1454019-1-martin@wetterwald.eu>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_061601_692997_7CA0A492 
X-CRM114-Status: GOOD (  15.04  )
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

Since the VCHIQ interface was moved out of staging, its bus is no longer
guaranteed to be registered before its client drivers. bcm2835-audio,
still in drivers/staging, registers at device_initcall level and now
runs first:

  Driver 'bcm2835-audio' was unable to register with bus_type
  'vchiq-bus' because the bus was not initialized.

Register the bus and the platform driver at subsys_initcall so the bus
exists before any client driver, independently of link order. The
platform driver probe already returns -EPROBE_DEFER while the firmware
is not ready, so probing earlier is safe. When built as modules, this is
equivalent to module_init() and nothing changes.

Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
bcm2835-audio both builtin and both as modules.

Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
Reported-by: Martin Wetterwald <martin@wetterwald.eu>
Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e78641703252..d35f5ac5c2e2 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
 
 	return ret;
 }
-module_init(vchiq_driver_init);
+subsys_initcall(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
-- 
2.55.0


