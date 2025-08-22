Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B44CA0FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV4uWkjT61iJ9YXeyDFuXrc749JIxLfL+L28IP9iqhM=; b=noE4rP82KOB9YL+id/MFyOTsLO
	fR4LT2FoXddPhmlLdBCJKIk5riLXe8W+PHdjDSpwmGvoNbXmYgmk66nh/WGJDCGstL8AQ0X5yok0F
	nJ8NXzB3VKSUoTbIlbYwIWzx6t0JRmTUKZNhbo83GIDN1Zf+AbtEdBmNmDYY1m3jBL90GVnzXB/De
	30eOd+OK07aOlfnnLApc5KXX4Xk8upcboCU8yMq1A8BfCTBhG67mAjcy+lh8ewx9UqjLnkgP0PNxt
	uoL0DAgAXwIRHkMrVs38ofNWBIg/GGmYEzWegzMvKU0tzbf+X40JfBGk8M7AMnynqMS1nasL3Z90M
	G2ZibmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdp-00000004SDg-2IIj;
	Sat, 23 Aug 2025 09:34:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRcb-00000002b0A-1wTj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3208644E12;
	Fri, 22 Aug 2025 13:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B21C4CEED;
	Fri, 22 Aug 2025 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868557;
	bh=a3svFGmTilPFyxqTFgQXgDbt5tuJn8Vyfor/nk7LNPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEswPetoMT+t+QtbFxdvKm4nu0MVOpO5GAX8QMrJzVTerQo1EKssqCEhP5nHLsjP5
	 gOl6gTaKwvCpXygwVnsDsgCzSuRDmA4SRPs5TJBAWf8zyzbm6Iol4uu5S/1tKjrbRZ
	 DAey6z5BXnef7LsVIsHUog0HGQIqJVDPSwoq5kZsT7k8jabKt++nDPV7J9uyL63HNs
	 bS6o8FY7uFP4QjNiU6cNEgGxwCt9xRVT6sd7eLFD9KqKoyiacYQ2TUmWakzWRbkLEN
	 uc5zBHAhWDEbIbcl3sIq6u2OuL1Z5M/abqjBHQt20KhOVu0/exAp0Zh9fjlB6qTcrJ
	 +xLQg55rGQI9w==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 3/7] dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
Date: Fri, 22 Aug 2025 15:15:27 +0200
Message-Id: <20250822131531.1366437-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061557_518799_79E2167B 
X-CRM114-Status: UNSURE (   9.77  )
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

The Kontron SMARC-sAM67 module features an on-board house keeping uC.
It is designed to be compatible with the older sl28cpld implementation,
but has different sensors, like voltage and temperature monitoring. Add
a new compatible for that board.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 010333cb25c0..0275803e843c 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - kontron,sl28cpld-fan
+      - kontron,sa67mcu-hwmon
 
   reg:
     maxItems: 1
-- 
2.39.5


