Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8F0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/aYN7rPyWzwA0+POa1Li+U2OVvspaRln1K5mS8yp+8=; b=Z/bdk6Z9CoZozHZrO2gHY90syL
	LM/8X7ag8Gp8XoY0qeny8fGuBWve1a/DDAts3fXPEvlEMqhkqpGXv8ImHsLKIYMnpz94uyRPWT0yE
	Gtm0RR4vyf6QiGhCV1TBIGa2bXC3JnboWJV8N1ej08eFTjxFJdsw1vV03gKWpmXSjA5PzQSUpf3B8
	sRgtBMoUcz1+A1TWmGqUqrJvchjNV7tjnAgiyK3HZB/PyhIfC9lyR7Qk2N29bgvH0zVQj91PFnx+6
	PiovNGJ2YK2JaWrJEk+G6nY4qfvo9VG6RQmpLFBxz8lvNxdCnWY2ejsulso6El4H4PJ+pZrSz+EkJ
	Kt0l+Q1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKamn-00000007Et4-18bn;
	Mon, 09 Dec 2024 10:14:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRK-00000007A1b-2opl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733737950; x=1765273950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3/aYN7rPyWzwA0+POa1Li+U2OVvspaRln1K5mS8yp+8=;
  b=exNmOwEqpYj8tgk3Gy1WlR+jpw9GSJhAPJfcUEPwYoKKWJnk6jYR1usi
   FTsVVs8RuD21p7+73LChc6r1G/GuLK47LHFP/Z1MdlrtQughGJ1VaGzUj
   1dKZM1VSteJK/CoEJ51CTjRwU9QP6KV+EJpAAsfUxOx2AHWDaWTkDOEHT
   fOdt/s8VrRAwPJP+aWWQ1czSnG/fl8VM68O4+1m5wfOJ9TAbnoEUFnIXj
   kwByJti9RpT1EViYbVMffnzFobq13BXJ7WFk1xst4pkfXYcMSu/8D2kcE
   BDOjys+ciCV363Lj125becPEUeta3am86uUbFhBLGG9bUqre+925km5Rf
   g==;
X-CSE-ConnectionGUID: YMOy1Z7QT8S99Otl0T/FcQ==
X-CSE-MsgGUID: s+1EYtGfSy2rp0zfhDpAhw==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40481350"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 10:52:28 +0100
X-CheckPoint: {6756BDDC-23-D31EDE1A-D52D6119}
X-MAIL-CPID: 10A3F78DCD06F9DC5117D727EB54E499_5
X-Control-Analysis: str=0001.0A682F28.6756BDDD.0026,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9354F1665D0;
	Mon,  9 Dec 2024 10:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733737944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/aYN7rPyWzwA0+POa1Li+U2OVvspaRln1K5mS8yp+8=;
	b=iwkoMmUFFa/7e4DGM6ciLJ/UC4LbWlxbDIkkVqfNGcy8w+STTge0R7crmwqB8m/Jczm8MR
	MZsyp8JofofDfizM6+vWG2lpEscISZ0FfJUyo4Kh4204r7r5V/S+NUlQqA1afZbss5cn6z
	7hY0UvDkD3HizpIoM6pJwV+ohktoQ1EP0mYbpJeEVbEjrUC4NUfUlIZiv86VpHuAGiU0T9
	RKDiREaGTrEMH3lBTS/mmh0ymQRyrkQA+WKkDtGyYs7+mUwn2TwH3tG6HeM2GM1+i+WzN9
	PEZbxDfD3r3LzAtUKV2KopcKYz3BGSEPp6/EomphzLTmist3XRi6rqM7OzG66Q==
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
Subject: [PATCH v2 2/5] dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM family and carrier board
Date: Mon,  9 Dec 2024 10:51:33 +0100
Message-ID: <6052e70b8e744bd3a608728f876c97d3172bf975.1733737487.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015231_009698_83DFE62C 
X-CRM114-Status: UNSURE (   8.26  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c84..07d98a67d967f 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -75,6 +75,13 @@ properties:
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


