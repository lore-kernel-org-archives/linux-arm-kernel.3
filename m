Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7A9C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+f52AKxDAlw/HpKk7FcOocDLK6B8oOeUPjxL8dkr0A=; b=sDjH+64Cn9l6/nsNYWCVx6kkdg
	eexNNMluhxO3g8JjjvQ2bdUEGbXpWZJyLj7C7AXJGPD/IYRGJzPZ6ddMTHaTAIjn3a6kfwWj70xa4
	xhxymrPPUyYittRVmHBUCtWUKjE6o2xgXBBsnlH5Rkkuw++TkrevnX3uQ76LvgVEn5ommTt02UPOI
	oIPLfSBMZaYtJMADav9YFY5IAqAU1yy7onSFmCFkaZKKAa+j9JD46EPobYXdU7JS1PNQu3+YbEwEx
	IUQ0okv2TLSNQBv+Jo6RzzVTfrdf1Wvp8MbtnTzUxrnRZurndiTv3cM3xHwsKReBd42rporF0lP90
	IOXmT+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfp-000000026nw-0oFj;
	Fri, 04 Sep 2026 13:09:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfj-000000026fv-2IU4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:09:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4957799b92fso428495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527374; x=1789132174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+f52AKxDAlw/HpKk7FcOocDLK6B8oOeUPjxL8dkr0A=;
        b=ScZ7NehGjpUAHewUN+qAQGQq0WRa80p8/ly9y8b0HjvwjYZEx0DmKPR7FdV/thbpc+
         9fYEeHDd8CxIp7OOw+9wzU+UivdN5HLYsXni09Vg5q6Zd2kTkxRyftmIijXaU7x+rWit
         /UvuonnFUjUxJaULqy5yd86zFfjqWDe/Vq2vrhlFT2FOAcL0SGwzueib/B7pAGO++uHE
         9k5ZCo/s9GVklaf3NAWKH96PVqjWx98BRE9MmFT9smUivflsop/CKkuzphRf/FMhcNN9
         ATQrGoP1FI1+Cw4Tx7KfQFt3usbdgM9pkm3RpVLTpQ1BMWE9vlND9LIG57YY4laMSj9+
         Rbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527374; x=1789132174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+f52AKxDAlw/HpKk7FcOocDLK6B8oOeUPjxL8dkr0A=;
        b=l4xvoXNjIspATc9Ga4xosbT+C9yNUXKUGu/5eJIzCei9IpNOoshvui2n7skxe3fuQ3
         i5qGousg18MRqKzHh7ene7f62SH1EbTC6bKwXBJ+er4QEQv/AwSOL/pTun6Ml6kiE7X6
         IQPdABbNxJQqE1GFDJrZCfjQ506ws0eAEk2H2PDFy76LFZAXzXIS0V7iMTyCsY06i2n0
         6SI6/oaDETOdgGMzA29M7pT8AVybeYfzDUkw/5iM+z/EUvY0+oMFVqmr83UtfuywoZdB
         5i0UZbPDQ0I7MiXk6kdan1a4ST8YfoWR+mvbjfM01Kg2KbsDE1dDE8s0lJHmQGMRdm/W
         Fs8w==
X-Forwarded-Encrypted: i=1; AKwUvByQdhbLRSzY125hlX+BTggc9d6cBnhx3c90LnakZE0yrb2C3tCH+qgF/U1LSIMVPFyimlKdaqhxtRAlbBUeAWyq@lists.infradead.org
X-Gm-Message-State: AFuF++n/Jmko/+K2Nc3gvg6JutFTPzEnQqxGpglU8h8hIR0R0+Gh57P0
	AVJKETkurHgQdeGxLsErh9QcYyQztj+NiGoqIQkLOuNfRh60RTxCCD0m
X-Gm-Gg: AYBFou1vRzryIOJM/PcgUAxOkaCGpMb7SxId6RjiUtajyffeOzcRQmrLm6CN+yLx6Fh
	FVX1kcl9jAIR5aXvxpNVZmDYHJXTP5b1fyVf0u/FTc8q7s8S97V5NqO8vFOLONBxW7yEJxPV6pg
	pH1Iz25vQc5Hn5d0y//2Qod3VW2gvtXLr16ZL57cxzyYvUe2sObej/GRRVwHlDi9np1yWnQQaWh
	D2jrfk2tCaYjt3kfkjDPVL1tWi0qed5bn1eaRxUl5bxyorgqg60ICgGqtLscAqXeFnodQa5+HfA
	AkDrIBt76NkzyzsizYExVOhsfBDUKc/4r81pvFPJyVnkhiziAbULsbug1YClnbVn3k/s1lLx/Ql
	1ms1hG8LxVATG4cNYvFvO3SSgGoKvmqVPlJgZ0gwrI5KOdUwLCvUaHDHo88Hn6oZ1F69oboBfcg
	c+FWJaJaTTqNix8yaovfAdOLlSfL2qg+bm1vxhLHrZg+LsySvUdzyea7/ND1L9ABk6nuuYGcttN
	tjc87Z1GR8mcrrsUmWfyxZoCgex6tmJ4tgdeNPVI0GffM2EqQRYJbpnQUHj+t/paRGSG5aK+7+7
	Q1NU
X-Received: by 2002:a05:600c:a40e:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49cf9b8baffmr34000785e9.2.1788527373810;
        Fri, 04 Sep 2026 06:09:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:33 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 6/7] accel/rocket: register a devfreq cooling device
Date: Fri,  4 Sep 2026 15:08:57 +0200
Message-ID: <20260904130858.27803-7-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060935_868970_D150FC5C 
X-CRM114-Status: GOOD (  19.56  )
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

With devfreq driving the NPU clock, a thermal zone can now throttle the NPU
by capping that clock. Register the cooling device so a devicetree can bind
it to a zone.

The _em variant is used, not because there is an energy model today but so
that there will be one the day a power coefficient for this NPU is
measured. There is none now: the NPU node carries no
dynamic-power-coefficient, Rockchip does not publish one, and a made-up
number would be worse than no number. devfreq_cooling_em_register() logs
the missing model at debug level and registers the cooling device anyway,
so what this gets today is step-wise throttling with no power model for the
IPA governor to use. Measuring the coefficient is follow-up work.

Registration is allowed to fail. A kernel built without DEVFREQ_THERMAL
gets a stub that returns an error, and losing throttling is not a reason to
refuse to drive the NPU at all, so the failure is logged and probe carries
on. The cooling device is unregistered by hand before the devfreq device it
is attached to goes away.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM sparse checkpatch
---
 drivers/accel/rocket/rocket_devfreq.c | 24 ++++++++++++++++++++++++
 drivers/accel/rocket/rocket_devfreq.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/accel/rocket/rocket_devfreq.c b/drivers/accel/rocket/rocket_devfreq.c
index 9d923a0b6ea30..86bc34819a187 100644
--- a/drivers/accel/rocket/rocket_devfreq.c
+++ b/drivers/accel/rocket/rocket_devfreq.c
@@ -3,6 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
 #include <linux/ktime.h>
 #include <linux/minmax.h>
 #include <linux/of.h>
@@ -404,6 +405,24 @@ int rocket_devfreq_init(struct rocket_device *rdev)
 		goto err_remove_table;
 	}
 
+	/*
+	 * Thermal throttling is optional, so a kernel built without
+	 * DEVFREQ_THERMAL keeps a working NPU rather than a failed probe.
+	 *
+	 * The _em variant is used so that the driver is ready for an energy
+	 * model the day a power coefficient for this NPU is measured. There is
+	 * none today: the NPU node has no dynamic-power-coefficient, the vendor
+	 * does not publish one, and inventing a number would be worse than
+	 * having none. Without it the EM registration inside is skipped and
+	 * throttling is step-wise, with no power model for IPA to use.
+	 */
+	rdevfreq->cooling = devfreq_cooling_em_register(rdevfreq->devfreq, NULL);
+	if (IS_ERR(rdevfreq->cooling)) {
+		dev_info(dev, "no devfreq cooling device (%pe), NPU will not be throttled\n",
+			 rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	return 0;
 
 err_remove_table:
@@ -426,6 +445,11 @@ void rocket_devfreq_fini(struct rocket_device *rdev)
 
 	dev = rdevfreq->owner->dev;
 
+	if (rdevfreq->cooling) {
+		devfreq_cooling_unregister(rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	devfreq_remove_device(rdevfreq->devfreq);
 	rdevfreq->devfreq = NULL;
 
diff --git a/drivers/accel/rocket/rocket_devfreq.h b/drivers/accel/rocket/rocket_devfreq.h
index bdf8e89ed3761..d5876d62a0b7c 100644
--- a/drivers/accel/rocket/rocket_devfreq.h
+++ b/drivers/accel/rocket/rocket_devfreq.h
@@ -10,9 +10,11 @@
 
 struct rocket_core;
 struct rocket_device;
+struct thermal_cooling_device;
 
 struct rocket_devfreq {
 	struct devfreq *devfreq;
+	struct thermal_cooling_device *cooling;
 	struct devfreq_simple_ondemand_data gov_data;
 
 	/*
-- 
2.43.0


