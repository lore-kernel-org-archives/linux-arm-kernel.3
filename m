Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A71D2FEDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVseOukvGwj4novij/7YCSFUYqE5cacw/o6dOxJoQ98=; b=lWYrJoqp5kQzXLH/jHvO3mFJkR
	anvf9tL+lIi/RIKwGk+fMkNZqYU3qnVrAAzT1DiCvnDbD/06hWG4G1xOmf6JnQk0TvziD1oqEYCpo
	WA4SQN7pSgZ0oid2STEkU8SfZ1B4s5Lu1kfDQ+vOrcqrYcHj/o3yZCN4j60oSs8oAukX9o+G3R3ey
	1gcbu+GOMrwI2p+LSiAlDFQCCFjC08448FJWwfOHs3pb2AloH1jBmrbqISyk/nOSnCWbSyL1NL4VU
	JeBMvxNTokY11hnPY7LA/cMASkZVgAcE09HqOuM5hK3XYxXIcag8xOZ25/x26wojeAMIKhoSbuz6F
	yR2Ji1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYM-0000000Eu2W-2HNb;
	Tue, 27 Jan 2026 19:16:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYD-0000000Etym-14jv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 19:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=rVseOukvGwj4novij/7YCSFUYqE5cacw/o6dOxJoQ98=; b=aS/utPqP953CnGDfKTn93CtMV8
	wLuBMmBVdTHHN2Rcj256nZG1dZuxksUB7vcPeSRi1oq2IjBqvBG+pRC8bLsFCvarShn3eBTMVwcXy
	INrdK8HrJv3/R/76msmVm+ME4EXuuurhgqLZpLfH1ocmQwoBBVZhoitmRHx9JilphO9o5ZcD5kf+X
	RGswh6kWWvYJGd2HxYLwna01O099NfBN1X3kgHnnU1idWtnjS5mQC2/MugK7KnVXwl+rw/holfFYC
	Y7pMu7IZDKffcuO9UmrO/xk4pR6D8UHHKr260SCdyvu74mmth6lqdKkljuaLc1vX3yLA2qBjvljbW
	zuKRjpIw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYA-00000007UQg-2TlU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47ee0291921so52132725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541389; x=1770146189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVseOukvGwj4novij/7YCSFUYqE5cacw/o6dOxJoQ98=;
        b=Eqq97q+MC9ZDgFrp+rTCwhzHk/m32YLFufjp3dRLpJLaGjDz8J4BOvOI2yoNNHGRFM
         E/X09J5GAUyY3XXd/ZjZ5tVc5JFimCi9mlh1xPj2Kc1WFmZkHV+6CEC/xRZuskHmt+O9
         bH+ylWxWiY3i309+v/gyK1m3fWCv1TtedXo9SdOG/KkNMiF6cuUPe17PUyEjfEqD1Dwg
         ftaGtqfZuCFUEKbmxMOkVVIEm7uuOzr1/tTUTegeUXd3Vai5S0onIQeTDwx7Vdn8wI3L
         MHdzkQ7QdzbZHNgdfwiCT6sO5+wdV3u2dYYj8+ximZeATsUafgGHUDjUWUiV3FCiC8rG
         lskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541389; x=1770146189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rVseOukvGwj4novij/7YCSFUYqE5cacw/o6dOxJoQ98=;
        b=aqUL334HhjZ83G5CQvGsvx+aVw+qXdfUcwU/YVEDHDbPHuG6XXPI/xftl7fulcH/Rh
         g0+Fo5Gd8uvwEQ1kBqSyqEDEteRa/Ft7tqoPQA8+LfVDbXsELAUdjXzItiSxoL+Mdy4U
         O+ggrcvLkO0jOOqc4o6fCWtU63fq7ZuPdA4+bL3/pZ2E+MRRHZImocKaR5bXJWW/apne
         HmrtQowSa5zRN+kIILESYwyQq2TauZ/9W/Cbp7E1/j5yL4NyRNs99WQW0u/3OJ+cnrkK
         /a+twzim44Fotxd6KIWJxTW4/fol1QzQdYL4xQMt8Gk1lWgK/mRCN+njM8kg2U2xVmqw
         wIcg==
X-Gm-Message-State: AOJu0YxLvApj7Gnn8teJJfQ4ZztOpBqkULz8b+68/8mS0nFG2oMDMZYa
	j1bDcIUemXb1qMMPXu0tT+zOcvJchejBm/XQXzpw3x6vk5P7GpsBQIXc6kcZHA==
X-Gm-Gg: AZuq6aKsF9UD+UW5vn5eWFaHQcTEjvaC8Y8SZuCGFsfwX1noIdfUUlylUh+9SBUa69/
	B6ixgLH2pkqxd9GLQJPdEQip/JI5SzhOKMvJPOg7fiI9kOX0Op/GolDubyz/NwH06TSjAR4jNzP
	bXfelzShgYcJglSQPFdQ1c0cVlbqi6qgZDW+MGc2vqXs2+W6WGVeMrT4TeupdLXEFJ6q1hvhcPc
	mNWocOLKyHOYAzC/JYQ4MYlN2SVLNn+WAGozeAdt/O7XrFOaPZyt01cGYt0+GfmPEqrdMNWEHoq
	EfxJnZ6D7IeNatDphnudGLrY6k1wfZWHjoztiXRLBO/ve41RR1k0z2Hp0s9MVUsymrxkivTQhJe
	YnsoV3MchIa7+2MouPmcRDc56XGF5Cc0jMkAMlIq2vZjpyiavKCAIHTGmv2cQbH0fN3FopiRo5i
	pQ+dHLqngH98imCLKlLSqVgZO1
X-Received: by 2002:a05:600c:154c:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-48069c3f6ccmr35173255e9.2.1769541389246;
        Tue, 27 Jan 2026 11:16:29 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:28 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] ARM: dts: Add an armv7 timer for zx297520v3.
Date: Tue, 27 Jan 2026 22:16:15 +0300
Message-ID: <20260127191618.551317-5-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127191618.551317-1-stefandoesinger@gmail.com>
References: <20260127191618.551317-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_191630_736434_5B6BD537 
X-CRM114-Status: GOOD (  14.10  )
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

FIXME: Should I declare it arm,armv7-timer or arm,armv8-timer?
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 6c1b22a64713..c9295c2f53c5 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -25,6 +25,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -34,5 +43,19 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			clock-frequency = <26000000>;
+			interrupt-parent = <&gic>;
+			/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+			 * arm timer at all. Since this is a single CPU system I don't think it
+			 * really matters that the offset is random though. */
+			arm,cpu-registers-not-fw-configured;
+		};
 	};
 };
-- 
2.52.0


