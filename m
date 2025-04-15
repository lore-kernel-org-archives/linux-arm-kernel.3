Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED90C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wimGa1udfs/aPQ4Ye8/P3PbpDd6kr57yzXcYNHlkEz0=; b=vPSTTYC2TJgFiSXgP8I3wJ3t9J
	W6hfe1WCxZ7pt86ZKmUvhWXkfA5T8ec6A5VayhBb6SyWQZ/fWYwUNWAUPy8KAJXEAmJUSLIJzVo1i
	37QxK/b+GuAwAdcI4hhmR1+F8qy5ulQ3b5TlSVY9o/GqpQwNW8u4KPC23u3G9WbtYWyx8GSFEXeyI
	jN/3DhyF6FzU18cqaU6It4S8ZMiFZ9LuMNSzoFYJaTLTZThdchC4X2WGtkduqdPjokJ8RIP8m4uCf
	ApFW48wBmWbYVkStfJjJrs4FeFrQLLc0GLL7s0wtBIG0+UH7xEgOrUNMFFf1gdPUwp4SJpJGiH6Rt
	XM2tMKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eSe-00000005XQy-2wpL;
	Tue, 15 Apr 2025 11:28:16 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNf-00000005IhJ-1kE2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744712342; x=1776248342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wimGa1udfs/aPQ4Ye8/P3PbpDd6kr57yzXcYNHlkEz0=;
  b=XH2SGIIv/kDFHcGhrUbFUKFEtT5m8vHhG2vaaN8BeUF2xgku49rM9++g
   3Sqlj1yzfJWMVsLVEqCiIbgaZ/UKyMSyA72fhWXgBsAUmn50Dn0il1g4r
   FyB9CcwIAcfbQ77h8LHHlTKjuLwMfGI5i/tFpYFLn3tXjiV9pemsa25mm
   /Fo0vr5q50mco0Y8Rr4E3k56R4CehTPVyUdOpZumhjGnnPvsLH3paQZC1
   C0/9uvjq18KBaUeY/5OSrIrfj8O0hJ6rZh+B6AN21PIyMguBFhf+ng2dg
   bchcxHfJpLBPWk7LCHZF1uNML0sqHDWxMMU0CekRdfexwa8Tsgfrsd+Sa
   Q==;
X-CSE-ConnectionGUID: OuAOiMBSRoC+zQEZDLxotA==
X-CSE-MsgGUID: XuVPIJwfRKKZTxbe3vRGpw==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43537781"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 12:19:00 +0200
X-CheckPoint: {67FE3295-24-7141A0B0-E6EDEC14}
X-MAIL-CPID: 5E09EB4AC63FE62BE71D1E04C3EAC840_3
X-Control-Analysis: str=0001.0A006377.67FE3290.0089,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2446B164775;
	Tue, 15 Apr 2025 12:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744712336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wimGa1udfs/aPQ4Ye8/P3PbpDd6kr57yzXcYNHlkEz0=;
	b=mx91+Fp1Q3/95YOyqSJE6PCDOydgSAiSmP41FQgtqttT2RkJol8Zcf9PfdWlo0BkXX6MG3
	E2aQdW2UlQAAcZqCkvB93mxTC8cTxQ1zaWzV+MvAibykg6qA/sZ0EzdXj2wo7rR/xQKDHy
	/PPYQic0ceEa/3v85eHkjhNnZnVVaq0ekHO69UeE72I8QdUE5bu4D9Fjprap2+Fk6xvoz6
	ot12jRTMibeNSTo4wqb/kQ94MyRC1+utDam6+YAI1wuY7tUfilAUmnVgn5EMuojBTx9+Fk
	bjmHugCSgGWgP9Ym56HKUxIrN6lSJyBqZwIKvhTpaf45JMZRldPAkc8bSZe8Vg==
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
Subject: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller: update descriptions of RGMII modes
Date: Tue, 15 Apr 2025 12:18:01 +0200
Message-ID: <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_031903_749766_3A1F6027 
X-CRM114-Status: GOOD (  12.74  )
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

As discussed [1], the comments for the different rgmii(-*id) modes do not
accurately describe what these values mean.

As the Device Tree is primarily supposed to describe the hardware and not
its configuration, the different modes need to distinguish board designs
(if a delay is built into the PCB using different trace lengths); whether
a delay is added on the MAC or the PHY side when needed should not matter.

Unfortunately, implementation in MAC drivers is somewhat inconsistent
where a delay is fixed or configurable on the MAC side. As a first step
towards sorting this out, improve the documentation.

Link: https://lore.kernel.org/lkml/d25b1447-c28b-4998-b238-92672434dc28@lunn.ch/ [1]
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../bindings/net/ethernet-controller.yaml        | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 45819b2358002..2ddc1ce2439a6 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -74,19 +74,21 @@ properties:
       - rev-rmii
       - moca
 
-      # RX and TX delays are added by the MAC when required
+      # RX and TX delays are part of the board design (through PCB traces). MAC
+      # and PHY must not add delays.
       - rgmii
 
-      # RGMII with internal RX and TX delays provided by the PHY,
-      # the MAC should not add the RX or TX delays in this case
+      # RGMII with internal RX and TX delays provided by the MAC or PHY. No
+      # delays are included in the board design; this is the most common case
+      # in modern designs.
       - rgmii-id
 
-      # RGMII with internal RX delay provided by the PHY, the MAC
-      # should not add an RX delay in this case
+      # RGMII with internal RX delay provided by the MAC or PHY. TX delay is
+      # part of the board design.
       - rgmii-rxid
 
-      # RGMII with internal TX delay provided by the PHY, the MAC
-      # should not add an TX delay in this case
+      # RGMII with internal TX delay provided by the MAC or PHY. RX delay is
+      # part of the board design.
       - rgmii-txid
       - rtbi
       - smii
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


