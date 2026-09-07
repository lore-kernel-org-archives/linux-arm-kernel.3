Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFBCC79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeA7gvxgHLA2RU/64BLRdxjcMQo+Aba/0ZU2WSO8u6I=; b=SCPLWfs4flXWNH9WdsWFk0NSQo
	tOdeg+5xBIptVVwRYb6kVI/ZccThTLOlx18TPtzCgJY2bEHbEgRmw7psmLsPeKQ+X2N5oGzRzYAmh
	j9sDjexit8VA6PpC1kkjeJ5CEeLPZ3/T3xGdBshpFYcAhVIEKEB3BSUanlhP+8gLCjuy1F6Rf1wqx
	4+rH8M+qjvts4QFhJHdQU4e+66I96QF5qXFWXJzthX54C7vxkiQ110LwDXV1RRaMlT1ZG3a35XDKC
	+K8IvlZmFgVi0RH1G0S0GW4JEm44Lz6sLMAjuPjh/VoRWZVx04OcVH6C/zV8YFN3LHKW/kMsELYJD
	H9/QID4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bxF-00000007GOL-3bJO;
	Mon, 07 Sep 2026 16:12:21 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bxD-00000007GNO-3ft3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:12:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 653A011DAAD;
	Mon, 07 Sep 2026 18:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788797533; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JeA7gvxgHLA2RU/64BLRdxjcMQo+Aba/0ZU2WSO8u6I=;
	b=Mzg53cAYWnDW5vkPfY1LIWITg7Xt3OFcNqfmz/cqhaULfVFwR0l7Nu2EHLrhobc9hCfohu
	AXqIlCcPuGFR0DxUri3L+9SpMCrBx0sqJB+zQvziy0nITF05ZepBTGt4ETyccfPbX4kpag
	4dXZ55UvSBjFSIZDp3tapKmmCBIv60z6Bpv/R4iUNOWq134q7MTXZYZQ6LivgD+kNesW1D
	nP4bgly4H8GNTgGTlaEjxjo39VFaofHVSsso8+mlhSoOi1n1Odo71HWdgoMNOmnAkTBaL/
	54Ai4M98Dxc+Jao4kemumMz0hqDipoOU9vHtV4Ypmo3LtnFZSi8qd6Uo5xJi2Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: usb: generic-ehci: Restrict access-controllers to ST STM32MP2 SoC
Date: Mon,  7 Sep 2026 18:11:54 +0200
Message-ID: <20260907161203.713424-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907161203.713424-1-marex@nabladev.com>
References: <20260907161203.713424-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_091220_058560_789F203C 
X-CRM114-Status: UNSURE (   8.88  )
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

Tighten the access-controllers DT property availability, restrict it
only to ST STM32MP2 SoC, which is currently the only known user of it.
Once more users start using access-controllers, the restriction can be
losened here.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 908b02d9175e0..9f5130a0e784c 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -217,6 +217,9 @@ allOf:
       required:
         - access-controllers
         - clocks
+    else:
+      properties:
+        access-controllers: false
 
 unevaluatedProperties: false
 
-- 
2.53.0


