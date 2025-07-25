Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4FFC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+NMJ7h/o8pylRH4ygiHeGJQ+PzavQZbTp36paYIGYQ=; b=VAs7GgWVLa5pkk/YbVRZ70vCOI
	Xnliw20A8SiW4ksQXgNOwFbch1heuYQWKgZ9PgmmKh45CC/zfGzq0zLFFEeeT1sdFRX0IYzMhqK4i
	i0Y0Itk35WU0ZBjqqrWg5VLiQABHTeCD2f8ML7NhTtj+k5eeJd++66feaAWzwQWThkZdWMRd9Na/T
	gVbLZ53B649U7lno5Gkr/pGwEgP6j5fUjhUvPLFZYldF7hZKS4S8UH5zSf1Gteqd/nhEyGk6NQL5T
	Y9yKZLiiWjtH0esMg/hENnzc/ThEpw7h7Gpemtn0bHkMe8fllrW68lMNOtNyP0W0UncEEKxK+2wKH
	GYSjaM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCCO-00000009BWa-2M83;
	Fri, 25 Jul 2025 06:46:32 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBjc-0000000998D-2Ucb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424208; x=1784960208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6+NMJ7h/o8pylRH4ygiHeGJQ+PzavQZbTp36paYIGYQ=;
  b=To3MtcVj0ym4A+m4q3+tXKlQb2wb6QXC4GC5tAnvfZBq/tbXCD6e+Ic7
   0E0O5Udnv2PPJBpQilov2XvIafjyXKJdmdds7UW10W+N01nHpWv3uJAAu
   PUUBqUqEtoQal7ijTZnvO1XF8YRPdpN9mP0MUv0ZgH2JkpbbfijbHUW57
   NRh3f9tHDJgvHqNwr5fkNHnlJSkKk13jtHgK1lPfrdPZH51z6JbI+/ChA
   MSBOaZr+UrBGXaM51UFqbSMUkOcC8S0tiKoVSZGO6VSaDtGE54KoGFR7L
   n7yHmHiOkqZBwMFo0iaBDRUIONuBMGXLjXCwCPm874A9TQzSFpU6gYaJf
   w==;
X-CSE-ConnectionGUID: wCx4nWgLQiaR7GJ+WCauAg==
X-CSE-MsgGUID: pdqx8zC9RPi5hh2m7frMQA==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413152"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:16:45 +0200
X-CheckPoint: {6883214D-39-943DFC15-D71A48EE}
X-MAIL-CPID: 382319F339E41E674EC679742E33E083_5
X-Control-Analysis: str=0001.0A002101.68832150.000C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59D22173655;
	Fri, 25 Jul 2025 08:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+NMJ7h/o8pylRH4ygiHeGJQ+PzavQZbTp36paYIGYQ=;
	b=Ook6lqJ45cr4IQkw5NLK0hVGwkBA4ZFHhDp0XrV/6cMurI/wwyHM/Hq0aKVz8ezmHR9a4P
	K9u9RD++BnIxLHAe5/cEyjMWzOdFbBjLfiUuAcHG9lFDNj5P4RrgN9SE7+16U65kV4Bi57
	Y3j9xaNmXgYXl66WhHGdAlTeCDIvM2AAE0jdn3lQgFxDyp94RCSWrtDx7ibcQbqQEPvGno
	3fhxVw9wqi8bt+D3oXyrfII8HPJXdbcXCRSrTPDfFV/nED1eOxIwqfLO1Ggibh4jEeH2jr
	UGs9Lzlnnc+n4V/musW+kvG7LWtVaeNnqC6YQnwqO0xclpu9BCb8+Jb9IZ5MQA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: ls1021a-tqmals1021a-mbsl1021a: Remove superfluous compatible
Date: Fri, 25 Jul 2025 08:16:32 +0200
Message-ID: <20250725061633.267174-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061633.267174-1-alexander.stein@ew.tq-group.com>
References: <20250725061633.267174-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231648_939200_EFCD3AA8 
X-CRM114-Status: GOOD (  10.62  )
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

The touchscreen compatible in the overlays has one extra entry. Remove it
to fix the dtbs_check warning:
  touchscreen@38 (edt,edt-ft5406): compatible: ['edt,edt-ft5406', 'edt,edt-ft5x06'] is too long

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso    | 2 +-
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
index 146d45601f693..66cedc2dcd965 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
@@ -36,7 +36,7 @@ &i2c0 {
 	#size-cells = <0>;
 
 	polytouch: touchscreen@38 {
-		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
 		interrupt-parent = <&pca9554_0>;
 		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
index db66831f31af9..8b9455bffbd26 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
@@ -36,7 +36,7 @@ &i2c0 {
 	#size-cells = <0>;
 
 	polytouch: touchscreen@38 {
-		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
 		interrupt-parent = <&pca9554_0>;
 		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
-- 
2.43.0


