Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F90C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIypQyu9izBr/7A1qOa4FEQ2MGblzldihGtaN/SHPP0=; b=cNozaIL4e1Ykoc5E/3mmSx9kOG
	DFwhdOyhTJnXVBs4ki5awxQ0o6AwMfu7QpEgYlsUM2fS52k1MxTYNTrAURSEgfmSc9e8FTBS8oTln
	gMTXrEyT6QfNqoICFBOLAKbZBOrhfKKYJ6wKQu3OpGwSIJmfv6dx+RVhpsli2QjrGpPp1IkXM+B/I
	EmkYpt9Ok5DfinVK2dabQuM+ywciI96BBfghEz08U+bVtynbgWasJqzgUHONvMOom5322Xy1OjsAK
	2IenguADOk0Zb5UuuwhcHs4iOShU7+s5pdCkAoK8+/jkScPZB+D+07WzD2TewgdDJRWDozmBCPxbv
	SoQZuQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU29h-00000005T4k-0XM1;
	Tue, 24 Jun 2025 11:49:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1IK-00000005McL-2TSK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750762468; x=1782298468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dIypQyu9izBr/7A1qOa4FEQ2MGblzldihGtaN/SHPP0=;
  b=CRi1yTCy9nUgiT2haV9kMTnffoDmEKZLT9+2Td/XCecVI9GbRbrFJ6z+
   b6yF7gLg2+NeMLdF/N6z/o6TQQDrCjRjbfSOxkmhCEmnGRPCmOwhSCgcV
   +c66jVw0wGI1MUPIluVXaTM4Zs68xaKqDzTIp0n5QiDzd+vPAdY9rZb65
   DAKdMBV8m6/gnz3JB7bDPLisL8CpOI7AYCJs29T9nXpPsAoVV5hkK/3Y2
   PeVZZWCRdnNkpCTf+jxbQI5/1PQm7S4W7ByGQWTzky0vqb0xRB/vIFf+T
   85VcfZh4gLW+0kJ9bujuMgZUhJ4bcTtDbGbZFguQbWSJuofPluSjdLQF9
   g==;
X-CSE-ConnectionGUID: eLKUm0CuTYGtOiwXD4x7LA==
X-CSE-MsgGUID: szbgzfL8T7uRoTX6yCEaZQ==
X-IronPort-AV: E=Sophos;i="6.16,261,1744063200"; 
   d="scan'208";a="44816890"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jun 2025 12:54:27 +0200
X-CheckPoint: {685A83E3-18-ABFC28F4-D6731B76}
X-MAIL-CPID: 868EC48A26FC023677F57C65E2F6EDBB_5
X-Control-Analysis: str=0001.0A006368.685A83FF.000F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1823165D19;
	Tue, 24 Jun 2025 12:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750762463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIypQyu9izBr/7A1qOa4FEQ2MGblzldihGtaN/SHPP0=;
	b=MUiSjZjfzTSatmv3j0U1YVfQTh2qXBN1BCFlL4JzAgPYiKKxPG1qOjgcrxgQnLHnMQexIX
	IWehI7DV5ZKXuQESQFLtA9qONwYCOckDyzxDR5carfawZLhUWvYhrBXqamOQYoszVrl7UN
	uzw/MC6ncCbm+Cp1MAtFih8lWMSP5bqBpWFpONI1YFfVsKl+h3MgDM0UQUHBTg1Vl/fbso
	qjdbL0mswPkuzjlhqBg8mXBDo0RuJVx8ZfzuuqnbsDTk/kXXl1HOxFCUgnp3SgBCeC3+KF
	QhaW7kHc9NGuz/qkeU3C5Wvs412sGTabjPbjkFU2NzKtNUl6zW6YMAjPK9uyug==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example
Date: Tue, 24 Jun 2025 12:53:32 +0200
Message-ID: <f9b5e84fcaf565506ed86cf1838444c2bc47334f.1750756583.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_035428_962339_6A536E3F 
X-CRM114-Status: GOOD (  11.28  )
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

k3-am65-cpsw-nuss controllers have a fixed internal TX delay, so RXID
mode is not actually possible and will result in a warning from the
driver going forward.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
index 7b3d948f187df..a959c1d7e643a 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
@@ -284,7 +284,7 @@ examples:
                     ti,syscon-efuse = <&mcu_conf 0x200>;
                     phys = <&phy_gmii_sel 1>;
 
-                    phy-mode = "rgmii-rxid";
+                    phy-mode = "rgmii-id";
                     phy-handle = <&phy0>;
                 };
             };
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


