Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B468AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFqpgQW5EamtR8QdmjqS2VZbo2sqPuCPjB+h5Oo096U=; b=YqoxT3es8h25fAkIgNCCVrh543
	W6RtMAjQxYtINTZPpmJAyJA75QONN5beEBVp0c4/YT/UjNs7gr4UhL3ZvXstu21QMJNt62Eznh5aY
	sUDyTMkL814Ss4LbZ2ENko/OMSBLaxzcYxgWq0E1otq0k4AnYJcIvrdPRm1EvmmJVmD+aKPgGvz4d
	W2o/TzgBLClly8lvY9+l/Pe68x0EV6FyecfYGLDB0Cv3g/iakT7l+Ltz6wziLiIJnAe0Vm4Soq7fA
	4xxTiAyrep8VV6cwRY71gXzI/5fJ5sY1+yEIptKOIT3jQMiaLozZSxK5u1BmcTbuhuxXgebsieVSj
	LBFfzJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dWt-00000005KZk-1dri;
	Tue, 15 Apr 2025 10:28:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNq-00000005Ils-0k50
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 10:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MFqpgQW5EamtR8QdmjqS2VZbo2sqPuCPjB+h5Oo096U=; b=cFxfQMUFuR0hgUs683SrA5POJH
	fxOH1uYQcbH5uA8zClYuuLR6f237BtbJhkOYuoXl4+jh5qYU26J6l+mAQanryffH+VC7GyaznsWQ9
	/fex/bGBdnn2U7QVDZwygMV8eRbzd67JM6O77G8klvPxw2j+jUWzBsFAoAf2ojXkp+JThlV6PcFtP
	WBu/PhL0VPL0nanv7QnBLfxK/eeinvgmD5jUlWQeCIk/CWTqhTgKN71wQW8mnuZV16VvsMbvhyilJ
	8my/buN0Lv7J2M5NcBR92VJ1dos+rx+Ob9Z8vW0FJhXPMY4bsVE3g3vkhIxs5gFM16Z1sLviG10rT
	rpWtA/qQ==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4dNm-00000009qy8-2Wnc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744712349; x=1776248349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MFqpgQW5EamtR8QdmjqS2VZbo2sqPuCPjB+h5Oo096U=;
  b=CnR/Ey1Dc6CYi9s0kyQ3hCMhAkYVqlTXBKdv+Ejw8bMOJ7hwKKeE1ZkO
   MyCITPC6IzTQe7TSUVHscgT5Gf7KOLpAUtMlInCcyu5TGpgzVwCI4ZYEt
   2pDBJJ7rQg14sBCaz/n5YcZFZYkwJXE8xqaw6ZZymNwZ0AZ/reWYzqi1v
   jn08xs0Oo9gTCKt3uW+3LmKQ2Mu7eKAeLEZteURhIWYRA+Hws7xjjcLg8
   zWzZ1GJ6QpgII5TeMUf5bcP47RDoZMqYQBhe0TIPXD2bky+K7RRsMwXCa
   ovcAEzN9kEgoCllzoatH9TCTioIx79dh4LyAwPhPpiWWaSP7Hk1vbYU9r
   Q==;
X-CSE-ConnectionGUID: kK/iwg5hSmuRAog/IIY4Pw==
X-CSE-MsgGUID: EsvKnMCcSpy31wr4isC/8w==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43537784"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 12:19:05 +0200
X-CheckPoint: {67FE329A-46-DC4DC9A0-F4F29281}
X-MAIL-CPID: E2AC9662668DFE112FB8F3BA65C48555_0
X-Control-Analysis: str=0001.0A006377.67FE3296.0004,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60984163A8E;
	Tue, 15 Apr 2025 12:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744712342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFqpgQW5EamtR8QdmjqS2VZbo2sqPuCPjB+h5Oo096U=;
	b=X3coK32oMqIEkB1CNfPLlgOroXkcuLoSzbI2Au0MWdzOzmnVyb3gJzdPtUha13qwd93GKh
	Sora7MJBYzJC1kzCNEBhgV1SM3XUCLV5ORJKoiH6WoGksYg3bImk/6LhW2pP8HkSU4jlfo
	P30YGLpNjS0NWcT6QeB42r/0NFKZJbD0u85Xpz+bktp4ZqcS4aXp5mqVLqvYOfYE5wGgDl
	Xfhe/Bto5TDpxjuf8DpYZO3NYm3SiFk2paNeT5VXLzyiVhiDPrKadLbldrHNlxcQ4jOC6h
	AsWGxonmQRQKnhpE+kQfWF27VuOfuMTEVWrGVTBXcBL8CiHsiios1+ksg/4FUg==
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
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH net-next 2/4] dt-bindings: net: ti: k3-am654-cpsw-nuss: update phy-mode in example
Date: Tue, 15 Apr 2025 12:18:02 +0200
Message-ID: <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_111911_070760_9FBA5EA7 
X-CRM114-Status: GOOD (  11.39  )
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
---
 .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
index b11894fbaec47..c8128b8ca74fb 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
@@ -282,7 +282,7 @@ examples:
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


