Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD94C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x9jBiJblCUlvn6m2+9uKBjaVBVp8SOYB0MqJMXPUZw=; b=mL5GklOO6WkkiFTAU6YItnovpv
	jhATRAckXxRIdtJF+dDWhMgEBAzjGfZcs2dbqrwY9TmIMa/BrkOxS2zo+QZ7CF4iGTjjKs9DmER83
	wC1UP3+hGzb2TBjnFw8Upr1dI7hoASqr9X/VCSzdn2zFsMSkQavN22xTkHsy2gKk9cVQCUuRtJMy/
	cury8HV4GGrQOpDCgnlulbR/DoHj0uGtk9sMmq0ET5QUlo9/anhfeliHAkOf8A2q8+8YlMPPFXm64
	eDR4idBK7FEUM8E4eg8II9okWiRJxOSXZhJiARK/voGr3Gm20XzyLHpfjglGnNq7S/DgZJmIaEfNx
	Y6Ih1G5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeKC-00000001jKR-3yhb;
	Fri, 17 Jul 2026 08:53:40 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeK4-00000001jHX-3SFb;
	Fri, 17 Jul 2026 08:53:34 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id AD4BF13002C3;
	Fri, 17 Jul 2026 04:53:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 17 Jul 2026 04:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1784278411; x=1784282011; bh=0x9jBiJblCUlvn6m2+9uKBjaVBVp8SOY
	B0MqJMXPUZw=; b=jxGb+KhSHiNimmWMckEuBsaXcfGUD29/BEj6GvBTLPFzA4qQ
	BsHIe9N1BKRTp75eHy/g3i4RXq7nf5F774hp7giWVYgitnuZ77eaC0/dz+SC7rXE
	M3vFuIr2YdrDkod4lWEp/2JWAAyRcrZ9U8cAFYHr1HvfZ6R4DwwF6zG44t2T4ute
	3tCCRfE7HNPPzfPvQ1I6nKseT3+Efr+GBtzGOUADEAt6F4RRC+LlPgCPSYdOUM9z
	mdoq4DXa3hY+1111F9p+4vZHpgQH4ZKVmxikFpUfqkKdyjSctLpHrduyKmRRjlX1
	DbQkTTlJFrsX4zPMrTW3Iw3t/zhVudAmHWHJdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784278411; x=
	1784282011; bh=0x9jBiJblCUlvn6m2+9uKBjaVBVp8SOYB0MqJMXPUZw=; b=K
	KMD18PMb46CWoixpdw7k4Iv9BwN2XIdhMfPe/0SjAPvwm72L/LXG5F9ex9c3in8o
	spTYG1xcMfLbzr84Nk27vrA70fMzeSCazplQeW+9Wg8NGF0Sx4EHsFMfemLuf/LX
	5MkkPb6CCvt+//Dir80KJlpYNATBHGvaLdydRUbQC6UcR+cCp77TMkba3jOhEO7X
	8A5YWrjxXJFoGu6kaOuOMEfPzGxpPkPSSvxCvu941YZp3mq3L3jJ8Cjm0XYGFSyI
	+ZGVadMSoMO2UsMjbhtHgabYuwP9M74ynbOTWa2JxOF0Jte9bfeO6A2w2355WLVX
	fEiWZVIHJYoj7l5FHyqKg==
X-ME-Sender: <xms:i-1ZamkK7FuVugH-UvXUz2U2zwt6O6LdNRDXFhwwBAaJ0mPXvceAaw>
    <xme:i-1ZapsTqrfU4Msy8RqQHrLgc6naS_e224pg1EQoHYingPiXaySejqstZm6GjtD9D
    P6MQP8EzFZEI1l8hzen19ojuJB9eyuAJuh_V1fyM_PZXEYVZLDQb1g>
X-ME-Received: <xmr:i-1ZagKC_4aj3ji2mVytlB4NbsO9qelU992YNtBv9PRUIdTqawtfO4Bjh-WGj6-_sZQ0i6MHofecLr72mCQ>
X-ME-Proxy-Cause: dmFkZTFlqYOQDR3j98mEg55zUTBRGJoyYi0LNYqpxPFUij1eeuOTNhPKEq7aaRJQxFcRRK
    Qe+rnmyYP/2AYKqjSPt6DmVKl9pFcjlTfz975oGBl5Ayy790RMcDXxZVGd5MobgrZ5sJ5N
    ZppcnGayfzsQ4x7JcCuA8tWmlRxVvKCLDl4TR6oihVYV3SoUulACa/g1A4zhFAszisSGMj
    u4Ui6WKABbGiuHbVQbDt8uT4F124PFqAYsOpAjuFkew0bhukYMl5KvFireeUYxIc7I6Kwy
    6tBTZ10j5fYXecnDucl6C4ODV8HSIytp1MMpvREV+JeOyBx8/LnU+PdEGxWXC1sad6S4tp
    kz2+qaSG0vo/Y/IO4dbxJAJz0ivuedzjhuArWXS+hqjSlTD2f5RMATmXwWgla1J5heT7Uy
    ZKMiflWP1lEI8j4il1GCU3JYFAcfZvUKNZtaY6AIkebergvW6KdM34T3DGUPJZE2cPZpBq
    jxJ3TeXKWyxzsBRP9vPshTExHefxU9zn9UugseBV5lYrh2zlO9RBeXzEpmNyOY7rmwP/kY
    NUAyrToihkVAor87yw96DkTUf0wADe7s9tgC2gp0m8l4kr1Bb9Dy/z2eHDJUQz8rsk+loO
    RAzNIgmOUMXDRa4PJ3VJMmqCfPFDWVATf8nn82FdP9aR84ZO6QIsWjf+kYdQ
X-ME-Proxy: <xmx:i-1ZaugQ4_LerCerI7emyqtsm123aSG4LN7ojBCCJlQ431GlkZ9SKw>
    <xmx:i-1ZastbKq2wQo1o7Ll3Eq-N71bmYI_A0j8aapMvgp14IpKsUzLhzQ>
    <xmx:i-1ZaggOATM0mWxCRQDxqt2PskB6thZAZMdxwgf3QKDUNZviQlghZw>
    <xmx:i-1ZavdKOJPHrqL2svVpuFxczg6A2OsPyz8gs9c7QDNPOhF8xWzNCw>
    <xmx:i-1ZaqUL35lXA6EsHvcgIikB7EJ-LD3ZWFXLGi5msT6yqrj97xYxoy8z>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 04:53:25 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 3/9] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Fri, 17 Jul 2026 20:50:41 +1200
Message-ID: <20260717085220.3212274-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717085220.3212274-1-gahing@gahingwoo.com>
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_015332_906894_9FEE1478 
X-CRM114-Status: GOOD (  12.12  )
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

Some power domains contain hardware bus interfaces that require an
explicit assert/deassert edge on their reset line after the domain
is powered on.  The CRU preserves reset state across power cycles
(stays deasserted), so the hardware never sees the edge it needs to
initialize unless the driver pulses it explicitly.

Add an optional resets property to rockchip_pm_domain.  When present,
the resets are asserted and deasserted (with a 10 µs hold) inside
rockchip_pd_power() after the idle bits are cleared and the
delay_us settling time has elapsed, but before any device in the
domain resumes.  This ordering guarantees the bus is fully
initialized before any device driver accesses registers.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 1787f62ba..7a88a9149 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -102,6 +103,7 @@ struct rockchip_pm_domain {
 	struct clk_bulk_data *clks;
 	struct device_node *node;
 	struct regulator *supply;
+	struct reset_control *resets;
 };
 
 struct rockchip_pmu {
@@ -671,6 +673,12 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (pd->info->delay_us)
 			udelay(pd->info->delay_us);
 
+		if (pd->resets) {
+			reset_control_assert(pd->resets);
+			udelay(10);
+			reset_control_deassert(pd->resets);
+		}
+
 		rockchip_pmu_restore_qos(pd);
 	}
 
@@ -840,6 +848,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	if (error)
 		goto err_put_clocks;
 
+	pd->resets = of_reset_control_array_get_optional_exclusive(node);
+	if (IS_ERR(pd->resets)) {
+		error = PTR_ERR(pd->resets);
+		dev_err(pmu->dev, "%pOFn: failed to get resets: %d\n", node, error);
+		pd->resets = NULL;
+		goto err_unprepare_clocks;
+	}
+
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
 
@@ -910,6 +926,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 	return error;
 }
 
-- 
2.43.0


