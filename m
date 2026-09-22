Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0502C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUwmXn/jLJ9RJT7pjA9WmiefPpGzIu17sEQJkrs8eXE=; b=sc/bndQsVoguYwFXWjsYuAyS61
	GTxPnYC3ruiW1I64w0+R0GyGwpeHRIlakPKo+d4AvGEYYVPQHasNDCeOhKO1CotEsspL9IVGDj/+A
	2B93jzjh4fHfpwky8tu+LyxhHc00YJeSgN0dE9Lr0b1S73fMAxKSqRXdl/jpiQ4+xJA33pp3dINiP
	aNoPNpV51eV62tP+eW2yCbJf11JoUEC/IxD57O5feyLvxE7Sy/khdr19NT/RJvYgaG5P8NwNjzK/O
	pRPYZdfD6BRRVG7aBqFkqIiQ2RPj/yjGQCTkycnWfisBZHFLvpY+Fal4oy8Z99Ty6x3ZKmP0aHfCC
	PJ4Gt9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vSY-00000004b5N-1nAz;
	Tue, 22 Sep 2026 08:02:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRh-00000004aNu-1lXL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cUwmXn/jLJ9RJT7pjA9WmiefPpGzIu17sEQJkrs8eXE=; b=GNJdHcPQ8OIeX8pEQexlpzlD0f
	Xqj8dXmP38yh9CREAqiAxC0nR42+fDoJbGPX8gHsb3kY+4eH25iafZlWGhzmC0mPuP6wI3Nc0fXeM
	+sHBF5OuOjaOMT9xKfAB2Wk7DSTGDXgF1HqeB7VZeWWtyaKga5HZkadAyzV97NOuCZ02KQM7ZTUI5
	52wTBFpXTyKF3v0x9l3SUL72tZbAcj2YdxWB4gsffoVC9M3D4biZezJEsEH/ZpDRK7h0vznaW1nPz
	Waq/rSQ6KUIW04e0vHIbuDo+IWfeh5DrZ2rDGFlu/phYVpgp7kiBjAjUi9Dp6EyHE/MW2GSAlKM3z
	bK13Zb8A==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vRc-0000000DEiL-2sXu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:42 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b93204449so2951505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064099; x=1790668899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUwmXn/jLJ9RJT7pjA9WmiefPpGzIu17sEQJkrs8eXE=;
        b=RLKlwz+yxCr6bUbWduC48lUDOvF7yk+NLSBvCxeVp3oxXj5F/yV+2uDC0rYsVYWaIN
         jBfOuUjhm+npzTjLHW5SPh1c8nnT+HojZcxlRIWfzXn3jh3Vii8bIToNcAGGjjHKuAyf
         q4XzrWlbwzWRkNBneaZ/wtCEjrrS/gKpc9APbBg9/p/MS5U1db22z9IYGGxpnZFtGoll
         orDvjxW6Xlic4+Ow50R+lUlA6UtoOI/y61ZT+VaZa9Ed0HV26T7jFwvD59tff+17f7qV
         i04Fx0zkfan5bsXH87gOHQhKGtYmX/+rgx8Go5igkf8SANNymnmXw9aUOxSGlfxyaW6V
         ka2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064099; x=1790668899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUwmXn/jLJ9RJT7pjA9WmiefPpGzIu17sEQJkrs8eXE=;
        b=xxRkiwSU0PISddi3qDH581vzKXxUsjBlRML2BWbpMhfLSs7iPUjeJgFnASw69Lt7Pr
         bo7HWpecot+6Oph/jv3p8ILRSxg32Ptm3coS08H3H1T6bDYlWo4yV9ZZ2R47fmNTyyzJ
         tW6uBPyAVofOmsDIBP6YCueApBFJfkQMyOozDKqTHq+5HcHkLyqW1otf8QG9qj93tOJz
         +camSYck9UPbvBOqXlipqvUNmOynbW/ZT4GrjQDNmyw11gBck7/1I0Lf9+Vv2QkfMGbe
         AMqR0gvMjVZfgXKwxZFeg6OSm+RrK8M1+naoPjXZgcRI6daS/IbZ8nw6GI/76sS+8S0T
         f5Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwshv9iU1dlFF/CWadX1CWKhm6VZVrr3h2h1Fa12uM+9cKF4vN8qKCR5Vs3mmA2zBLT/f5PTbBewSobAf8nvmfO@lists.infradead.org
X-Gm-Message-State: AFuF++lj8MB/Xu6EbZmVUJ+U3FH44DewufsES81T4bI7zmvfb6y5xt4V
	2RtxNKjzczEU4KZCrZ2YUpEHAfr2I5ybtC3lVu9zveFumdrtYYkoVehi
X-Gm-Gg: AYBFou2yuUQGXZGEKHvx2QECrtTKOm98VI4fnHYHz1zMKbeH/qPbEEZeyjt0788mZur
	9mG9u3GZ+/nZXHa98YCtiZhu6IskN7wMAw5miUGhhVxsZ2ErmbS1Pke3K6yKCElfgMbK+r6jlqZ
	1UbXsYoYw6YSf9NZT/BJuGMMYXXSHCFrCfnlnWT8xblCIKKbHOyv2EIeBZ6muh+Eh8+HdP+oiWe
	QEh2aItklDP5fcg7F9cVlzjC6BM2/bdDjeWjZ6jN7nW8078uCTVXUAl8nLIDu8R79nuNebGvdD3
	gI5qw4vAxCLls/EdC0HYv0ot/RBmhRSwJvh7GNA42wyBK4r7i7+vfaRbwlz7BLd3hKGhkHxRy1a
	96h8V9iwvfDW021pb+0HC48IJAolt2/wNt1Ucnadh+8GX0Jx5Z6+dzcfHz/ULZno9PO+IrMqUDK
	a0vldTG2j+RBafI5GSd8TOEgxtdcoYhHBzSjFfnZ/zQk+ZXGwCKPtFRQgHTBqtV3QrZL/nvIniC
	vb5LVq1AE5w6HXuvDBgjVyqLnccYbIDNtS8z9hGIoDbNPag30HgLBlxqCAlTMTt7mtYHUB2hDsn
	duk=
X-Received: by 2002:a05:600c:a00a:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49fc7b83237mr163730805e9.0.1790064099450;
        Tue, 22 Sep 2026 01:01:39 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:39 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 10/11] accel/rocket: register a devfreq cooling device
Date: Tue, 22 Sep 2026 10:01:13 +0200
Message-ID: <20260922080114.44662-11-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090141_348728_79E1BDD5 
X-CRM114-Status: GOOD (  20.42  )
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
measured. There is none now: the NPU core nodes carry no
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

Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2: wording only, for the shared table.

 drivers/accel/rocket/rocket_devfreq.c | 25 +++++++++++++++++++++++++
 drivers/accel/rocket/rocket_devfreq.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/accel/rocket/rocket_devfreq.c b/drivers/accel/rocket/rocket_devfreq.c
index 871fa370eb432..c81887734de77 100644
--- a/drivers/accel/rocket/rocket_devfreq.c
+++ b/drivers/accel/rocket/rocket_devfreq.c
@@ -3,6 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
 #include <linux/ktime.h>
 #include <linux/minmax.h>
 #include <linux/of.h>
@@ -446,6 +447,25 @@ int rocket_devfreq_init(struct rocket_device *rdev)
 		goto err_remove_table;
 	}
 
+	/*
+	 * Thermal throttling is optional, so a kernel built without
+	 * DEVFREQ_THERMAL keeps a working NPU rather than a failed probe.
+	 *
+	 * The _em variant is used so that the driver is ready for an energy
+	 * model the day a power coefficient for this NPU is measured. There is
+	 * none today: the NPU core nodes have no dynamic-power-coefficient,
+	 * the vendor does not publish one, and inventing a number would be
+	 * worse than having none. Without it the EM registration inside is
+	 * skipped and throttling is step-wise, with no power model for IPA to
+	 * use.
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
@@ -468,6 +488,11 @@ void rocket_devfreq_fini(struct rocket_device *rdev)
 
 	dev = rdevfreq->owner->dev;
 
+	if (rdevfreq->cooling) {
+		devfreq_cooling_unregister(rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	devfreq_remove_device(rdevfreq->devfreq);
 	rdevfreq->devfreq = NULL;
 
diff --git a/drivers/accel/rocket/rocket_devfreq.h b/drivers/accel/rocket/rocket_devfreq.h
index 65a9de6d37389..26a3749078b9f 100644
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


