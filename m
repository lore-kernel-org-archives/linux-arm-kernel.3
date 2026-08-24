Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3CC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0j4qmzLAQl+sVGlmTA0IeZm9e3K6ICC0PLOlup5PmHM=; b=oC9qQ8HPKAZbwNY/gQj+rCYJ1u
	Fj2H9NOVyqgY7mhg/vujUD+Sur3nEs+qMrBP0eD+eq8LKdHkH92PlesvTLnEB2+vUVuLs58JP8Nik
	B+OVgBIO2t4Nwd11ugN73czcwrRDcQh14RuGSmDM9lBIYHhnyinOFW+ZyfM8lIceqHIzs9cn46Tfe
	4LmOPXDjL7Xt9yjMWzNgqTItUMv0VnC4BpGZJ9b/MLm80bGCixwCFZ8iWh/wrgYQVCT03T+ZMq6aB
	MzeaxeyJr+PGpScUSTr9zO00K6oCec7bsCV6AE0dNiJFGNmdD4bl+OjEbeVekB85/OXQCOYRkXs2X
	QkXNlu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySU8-0000000GRwa-1s9j;
	Mon, 24 Aug 2026 11:05:00 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySTx-0000000GRsD-1sGi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:04:50 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so6297423a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569488; x=1788174288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j4qmzLAQl+sVGlmTA0IeZm9e3K6ICC0PLOlup5PmHM=;
        b=TbWMVyPostYKp6KLP3RR3YP275plhvsZiRBkG4aiDUFH+yUsQMVx+NnFry4vnvvyFX
         iIkG/IQKkXV9Bz3BksMzKVh5bGtQMnMKzaAXpTB2IU1hcgHVlAlYewErKHYbRH+3Y1oR
         cQRX155DK7cdRlXL+70iD9NP1JGWI0/f+TYnADhBF8T2fjiuWJh8h38aSFVoF5SvQiRd
         t6AndqyJiyuvhCwOq06VIjKwl6pmlJ7C5DeXdT0j+cdz/QxbNckJkc0fifFBKl9nGl60
         F1Ip2pfYKNEFGYKcoKreqdvf/ls02grT0YL69fIJ31+jSN/sblhrHdgC9Z8ZYJxKux8f
         2uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569488; x=1788174288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0j4qmzLAQl+sVGlmTA0IeZm9e3K6ICC0PLOlup5PmHM=;
        b=jtQmAeGzNzc5klxl3CDFi+SiavYV0/bNXwyhcH/bx/sReYaHIVtEYTGDTQyRMVOm0/
         XzxQt8ORogcE7P9n8GD31oJE/dJbRHBXzP08bS/57LEej/HMpny6G8/OazllBl0F7uRT
         P0lngHrLe9/0kP4eiw+qLZxinhXfsWqFz6Tda1W/mdlEZsYY/OWNEReAFPqyRtUf3v7K
         0f8d7yn3hvvoHrnYY6J4saQcL9FYlKX+atVkBi0e6witJeDH38IWfQuD9pVRCIhQKLpV
         VgsY1Jreu/NQbkdAlMIF1MAF+uz93pCPCy1+8OAIp7gOx1oPz3JF9MarXEtr6bBPp17e
         weTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOe/5fbuRIlQNAoaFll/t3r4KP87ecTThx3dyGyLYKKYiPPCOupQhfXzxs2uwcfz7p6m1kFCy/qYTRzlJ9ka2Z@lists.infradead.org
X-Gm-Message-State: AFuF++kr6TSz6vaK8K2oNkvFSEXTR1WZKDw8PIHVnM2HuasooXQrWOOl
	JQKPSUwbmOPTJQjE1HherAEZ/2PitvgpV1gjqZAgNFSFUQSmmTWMLlL5IQqYLx/zgT8=
X-Gm-Gg: AR+sD11W7Xu/qijoEpIeVkxn2LJmIlfLb+NCLGlLsrbPb9kaN4HnYZ8jASSZTyHpLzU
	Yc3r5IrkrHRuVDizI0iMjuEHAcpHS/ojt5LlYchFX5S2mQXuv8RVuuB9nk9bwNEsteS+TEW+ljd
	ucAFuekCI7r/qoErgcCHBiuvPrargUtmGc/yvQywdAxTPPglbEsGeIabVZoKTbVvOXRtQ4rIfRx
	JHhHCZOJIOarqXn2execn5BaefsKai4MJNi8YRylz8kGYLadpzWCeFxL+3EMMIzHmj1M+z6BFbV
	uD6T80B3TjYweW5f7ToWKZVVxU8Qo+zyJbIAp/XOQXKpVsE2LbdGCBdzzD5/51Y/TJPzQe8FJMB
	kkbZbDkIpe9tg0oa+U+ZejtI/O8iUKiXne4q2gcfuE3zOxcZdsEWElu2sEH6JHnIbnm/ED0/QW7
	8YFyQs4qO4IXhRE1pwatI1pTWuhwLX2rlrT9CHPJufCmn8BEEB/N3S+ppRt3qyPPm+idxlF6L7Y
	vghKJLC8z6y5bKjbKPZttTNEjNl2s3pQp6KXlzBUOsDK9iDgsalNgY2/P7Nm94rAGNF+sUwc83C
	By0UM4KJjN36RLXYgwaA7GmQCS51Q7AwXLfdGQ==
X-Received: by 2002:a17:906:f049:b0:c24:6045:2a94 with SMTP id a640c23a62f3a-c246a39f420mr2623291966b.4.1787569487786;
        Mon, 24 Aug 2026 04:04:47 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] arm64: dts: microchip: ev23x71a: enable QSPI
Date: Mon, 24 Aug 2026 12:56:51 +0200
Message-ID: <20260824110432.1074136-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_040449_528813_AA13934A 
X-CRM114-Status: GOOD (  10.06  )
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

Enable the QSPI controller and describe the onboard SPI NOR flash.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 4012ea7d07bb..985ca31e74e7 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -463,6 +463,21 @@ phy27: phy@27 {
 	};
 };
 
+&qspi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+	};
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0


