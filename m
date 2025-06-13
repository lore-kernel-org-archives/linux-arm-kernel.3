Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793A6C71151
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=; b=dT5z/+Fha65KmpKM0t7yRMco/+
	Pdg3w4g5q7pMbkwbJdo9taT5lXjzHD2EqUcUo0NCOFxK70NYc/B1E7COBpCIdT9B3PiA9y0MafWlV
	Q1uGX0tYCWejrEcbOMhlF2fwRotIG5TlaPKpyzzwBnpQCx9/6EjI0GVU0Ex+FNMvAZAW1Ha6xASk4
	FoutRrLjhjdcqmRqeIABGsjywMmW70DqOaFsspXQb8Yk0cwuxGwHk7pWVnAAGIXHsMEmcdzRcC/uY
	daejndeimQllidpmM3H1T3h+qDf1+vmAwG8Rmf9RIlUt6jYFA+ASmFgwG8PH1fsJV+MVbatEBgqd8
	gD2B6s+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ37j-0000000GJbA-3veU;
	Fri, 13 Jun 2025 12:03:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nM-0000000GFJ9-2n26
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 11:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=; b=lervVIXfl4RSSmdQm+OOxl8KAQ
	gXcHPiqfbXjtNF1JDzvthuCODRUqTyhcD4pSFmHjB6wYSI7HDmDcVgx7HWPFT0hmoX2O5/JelnWoe
	Gk/V1jAf5KWeE+QM5vQm6WpQ8mgvIGTusv8OZOZfAwvRYWLUnuV9mRXkHSQnt0Igl7dcLfvUhlo1g
	z5k08lXrY0krewjE5cMkGaD58KZmrTvDA2hR+3pamu6E+qM35WxnxV6HhroiKSe0FfDk7NQPiR5f3
	6HtV1UdX81NHzP6F1wUpgG/yFClrv2nu4VNPqLoHj1ihwZ47CEEhn1Khrj2oa7Qf/lxBZiEwAhjiJ
	vusfKV2w==;
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2nK-00000002yz3-2Cd7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:42:04 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fabb948e5aso22538336d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814918; x=1750419718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=;
        b=HA/e7Zh7FANkGVKUaRYWERV2OM9TxcGSJylONUjWSeEJYRWR8FL2MumSp/TIG8808n
         FHsd1ZjOE31QlbURzHsgwGoX3g7ABN+kNJV2qSO7MkTNOun8chx439iYHKwfkHwMyGrx
         oxFonk3zhDXBOodD6Ab248UXZw10kfLV0N/4XDgNPT+pvAY82qAwaC6H3bc8X5+A0HM7
         PS3WJL8ZJPhfkiztvSKpKi5isnQ3vHLhQEDL7Hzk6V0ljhOOSYY9jmVIKMXO6NXTWMN5
         k3wwL4MxB+fhqBfNExYA9AxMm3GNKBarcJ0Po/c/VxSlMFKpmWGdSetVhTQpJFA0ROZC
         wQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814918; x=1750419718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gog1CrvxeaBvJs1XxgKi+JJwPn/cN8uX820mkK4YWuU=;
        b=r2j9m0bFIX/PlzmboBdSsUz3Psblk2NpCnGzi+OWws94/dxFMpll45Ac0oyGYxx2lb
         jMF1q3jPBs1xz6S/btKtUSYupwhlZmTuKIzxoumgMuf8W/pIFAiSEMKrEnyPuUozEmbW
         EqJrgAK5BqwTXi5BftUiCAAoCylk6M4AGbEMO7GokYsaVpcEQSFOS8qxB2nBEWawa/59
         ceFD0HEfutbWlA1xHGJSLpjy5gRGttS1LX2/86qdUyqhJjrM/yy/J8w83lqpyuq75R2G
         JiYRkRZP9LhBbWvJXxIdWHQKH899Sk+kfT3wpHlLMRxJK7n5vjDzNnXTMFDGP+uumMUC
         sTTA==
X-Forwarded-Encrypted: i=1; AJvYcCWrPj5R36rkgUPeLHXdM/J68f4hC8djRa2lc9t9bEzirBusLKTYV4w4Z/B6Kr4RnyqrFjDyj+/wvDhkwMTWVWry@lists.infradead.org
X-Gm-Message-State: AOJu0YyHJfARgX30vUGWVG9ZIrn6kaZTS1tB9UkTKAqu/Wj4lDUns0BW
	+X4m5A+mZG0Q8m0gEqKWDQ9SE3I0XxqyiaAiRAvb7KrIK8HEVcR2h0MsNsYFNCjtjQQ=
X-Gm-Gg: ASbGnct9++mnB8qP34osUXBUhdmzuDjbDB1NXh3hjuFQIZaSpfrCc3q7dENOUCP4LVz
	k7NrfpujruSxjfhf8sFuiYKGKTvlt0ojaOGex5zScPSRBZI0rxacA49hmFGk2wzuWaH1ZgJ4kjT
	bm569Qp6k/CboTieIKVSNOYM5LTm6qKUADBK9Fg14L/E9GN5q9/TNcmawh/KHz15q0li2fHUpHh
	nyAn3RbGx6nVS+oh6quT+ubp6DovyhltqSdS0c2NvslAwMOaep08f3GCGRJvsamU6SLLFO45hwS
	9DJRmLeCJsPgYmm/+kXA2+/kgZp0/yT8WsWlqzzpqyke035HAhIcNz3YEHOaN4mjv9PATfr5l9k
	4EkCGiML8Se+VmlzsXCs14Q==
X-Google-Smtp-Source: AGHT+IHFfRslU2JdUQwTEst4+2qv7pFwoUnipsx+0jTm3bc3ZWeEjmqIo+cvUGJbAhVMc0O3WiescQ==
X-Received: by 2002:ad4:4eaa:0:b0:6fa:cb05:b455 with SMTP id 6a1803df08f44-6fb3e5fda72mr39185896d6.35.1749814918080;
        Fri, 13 Jun 2025 04:41:58 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:41:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 13 Jun 2025 13:39:36 +0200
Message-ID: <20250613114148.1943267-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_124202_653599_B2760140 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..834910f11864 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.49.0


