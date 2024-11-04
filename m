Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EBBD132A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JH5f7VASZS6KUhpV8GNdtHAYtBKP0OBrhdci13q1zI=; b=U7HP+3CRIGC9RBftVNCc7j1Ui9
	JJtdAti1Y2sFkFrrKQjOpoRJnMuGa7VnSU1wtJNUCjAnUty/IOLHmXzudenCAfqpaF7l6jxCN/3J3
	W4RJYcRVYcVphsE53BhCtsCZfD00q6LRJqFvmeamDUszlZMFTUODJP+oGv+c/qKMbRT57zmuID+jK
	9D2KGb9wdI2XX43l6ry2DX5vBxjgLW+pbSkUwsI12XGlFAKO9AMAY7K4sKGgLoECuEVe23WWBLazy
	vsP6LctXiHe8bi3dsgjPnkCROF1VVmQ7JHJmUbbm7fcPktZybnD6JWlKD8/g8YizM3QtLeXZsy5zG
	p8s0ULAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tur-0000000DFOp-1DbO;
	Mon, 04 Nov 2024 10:02:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7thc-0000000DD9K-21eK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730713732; x=1762249732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5JH5f7VASZS6KUhpV8GNdtHAYtBKP0OBrhdci13q1zI=;
  b=mtdaAUpcV1AplnRWay5om3T8+HVMifTEEUhq4GBwEbqPsXdQYaiRDCre
   XnX6tZ3SlOczpTcIk4uG8PWUHaED+BzRojljXw+wYmazcJ+x4YN43VS0J
   DgWMk5+T8QkL6efR9Qhv8vZTgzmgZqsP9PQBfkmJc3WJ+5NAE7eolht58
   keV8lIRENMFCExOqqXQcP+kl2NA2LSR6b4XUOhhFjcRb9+DpS1lYdGnFl
   RS6yqDp2ynKszH9qYKB2zEi2tERmgWWav/qnJVVgHFhrVXaNyJdXj/HEY
   8M6xd+hcmwfwZz2DoZFdtdD+Zj8fGYFHQjQRdXcqFCOw2Cn9kF91IZrHx
   A==;
X-CSE-ConnectionGUID: /lxKrMAkQYuqCOTFr5JbIw==
X-CSE-MsgGUID: xmNmdh8DT5O3cKJCqw6d3A==
X-IronPort-AV: E=Sophos;i="6.11,256,1725314400"; 
   d="scan'208";a="39827143"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Nov 2024 10:48:51 +0100
X-CheckPoint: {67289883-41-86C05612-CA75E1CA}
X-MAIL-CPID: 6CA3FE28D4F36F3CDB780E76E530CC4A_1
X-Control-Analysis: str=0001.0A682F28.67289884.000B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF5EB169DA6;
	Mon,  4 Nov 2024 10:48:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730713727;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5JH5f7VASZS6KUhpV8GNdtHAYtBKP0OBrhdci13q1zI=;
	b=DX39Bo1HqN2ICbpZoX39qlp948wy1HNquH2lPpf+D0eXQI0qXHsdOgD42FOGWKpIQ0Xxaj
	7u9+3e48h9frhqbBOE4Q+IvRWFk2ai3FY+wi9xNjxagLtEJoYvl9EDXwlY3ZNy37N6au6d
	1iCshzhku/gfNYrToQC99vC0Kx7UBDoQCO+tyNOyf15gUndugn3GxnU7S3A2kJnQW3zdBg
	BveeQXwpZrgU/FD+oB6FdrXpId2GY5O6B/LV59rBxM6E6chy0/yqb9qIsb0Q8zB4yfc4V+
	BoMgwb3EL6VZcctojgDhT1THk6XThWyqsOKVISvf+QK/oI5dJsFOTZ75ZHXUVw==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
Date: Mon,  4 Nov 2024 10:47:25 +0100
Message-ID: <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_014852_856134_B5DA0E97 
X-CRM114-Status: UNSURE (   8.74  )
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

The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
the matching reference/starterkit carrier board.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index b0be02f9d1253..d8b52b95fba7b 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -73,6 +73,13 @@ properties:
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
 
+      - description: K3 AM625 SoC on TQ-Systems TQMa62xx SoM
+        items:
+          - enum:
+              - tq,am625-tqma6254-mba62xx # MBa62xx base board
+          - const: tq,am625-tqma6254
+          - const: ti,am625
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


