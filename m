Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3VeMp42ESkf25czww66+dfndbwWYSien0lEceFj2a4=; b=b613roAty6IUpiPYFbeHL0hq13
	Sm2owMf9Qg2hEUYKWQ5CUn3CA1nFRVU9q/2f0BX4vbJ9bh5bXZYlTes7aI1qvHbMstVom7Q1XuGTE
	H4uc09bmu8u2lvwP9TzpWle190XoMZiNkI+uXPbIylvPFS53Cabl3TjRkOyt128be58eX4YwR6Npl
	knR0y9dnJDv99qqp6Ko4g61tvsmBy32aj7A/WK3UbuVqal7SJoQ5BQ6yebg7BAet6xDHxKRPS7F4G
	L1rv4B64jtd90PXRhE1nQJ5YCLsBP+EOoleiREKpGRdv5D/iHwK617Ze6ywzl76u42zMsd5QbD5ZK
	aPCtZHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBqV-000000099p7-1yhM;
	Fri, 25 Jul 2025 06:23:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBgw-000000098Tr-1W0Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424042; x=1784960042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l3VeMp42ESkf25czww66+dfndbwWYSien0lEceFj2a4=;
  b=jn0GeJwYnXHBap0HWqfYgiUm5L5v3JDxAYFD0yjv5KezZ9V+6OQMXp6O
   c/E4ANCDb7RI3Xvg+GzgdXkcZSub4GtNrNJeyV+qkVpkdvhQIKJHM53X1
   +prccAjYAhYpJfnHouz5dXaxI9HYHkX62+acpr0oXWZ4eH91WfQyYglZe
   opwpEcYau22Bq3HbYL25LC8EDBtrOexa0FLbJe1Th+HWNZnnUe1tz87LO
   IsEHJFfeDv8y/VZSsZ+8cB4evya47zQhikc9qoEunLuEM1Fq/THMFk7Fx
   Vz2m6IpIfvZ78TxPq17GQH5zZne4kw35EzSXSuT/LsT+jgXh6v34F+ggZ
   w==;
X-CSE-ConnectionGUID: +yqKvMIWTg29agj1eC1cJA==
X-CSE-MsgGUID: tea+HRQtRMqPdSt5JlwgiQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:01 +0200
X-CheckPoint: {688320A9-19-943DFC15-D71A48EE}
X-MAIL-CPID: 688F6B9749C3A52304DF6AB48DE50F72_5
X-Control-Analysis: str=0001.0A002103.688320C9.002D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0DBD17364E;
	Fri, 25 Jul 2025 08:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3VeMp42ESkf25czww66+dfndbwWYSien0lEceFj2a4=;
	b=VKgRbOBfAGLHAiOst+BvMDIRPae4Sw21OUFWKdsiZ+B6jRbbEiXbaCOxpk2+1tSl2t1F3+
	GIUKZIxVr9oo9ATsiGldxQ8U3wpImnymyOqe5UYPX1AXui/pydd9BZ9+CIeI6d86Mjj6c/
	OOW+aISgwA6C7PbYbBP7S+PawcKKmavZZNjS4RW9uw1MqXyYyCGeYeG9/U6ZkO9bMgctz5
	KfF83ZzWlRLbGeNcidA8iSVG3+oZWWqBzKo4PFosiPWordoouS278JjbvqBReX+Yc24Ceh
	6L9EhGjWzcoKj4cdMlkSnj/UJWF6GkIKG5L47u+GhvkPp7WTtVv7QW1T8sRNDA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] ARM: dts: ls1021a: Fix sai DMA order
Date: Fri, 25 Jul 2025 08:13:28 +0200
Message-ID: <20250725061339.266125-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231402_702273_081E7310 
X-CRM114-Status: UNSURE (   9.43  )
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

According to bindings Rx DMA channel comes first if Rx & Tx is used.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 74c5698e0b314..2351374c2e107 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -627,9 +627,9 @@ sai1: sai@2b50000 {
 			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
 				 <&clockgen 4 1>, <&clockgen 4 1>;
 			clock-names = "bus", "mclk1", "mclk2", "mclk3";
-			dma-names = "tx", "rx";
-			dmas = <&edma0 1 47>,
-			       <&edma0 1 46>;
+			dma-names = "rx", "tx";
+			dmas = <&edma0 1 46>,
+			       <&edma0 1 47>;
 			status = "disabled";
 		};
 
@@ -641,9 +641,9 @@ sai2: sai@2b60000 {
 			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
 				 <&clockgen 4 1>, <&clockgen 4 1>;
 			clock-names = "bus", "mclk1", "mclk2", "mclk3";
-			dma-names = "tx", "rx";
-			dmas = <&edma0 1 45>,
-			       <&edma0 1 44>;
+			dma-names = "rx", "tx";
+			dmas = <&edma0 1 44>,
+			       <&edma0 1 45>;
 			status = "disabled";
 		};
 
-- 
2.43.0


