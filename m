Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4856DD6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chaucy1e8lWQfwVdexQ24C/rG8+K3TB71NB1amH2+HE=; b=3r3VKZ802I7azztgN32saijlrl
	hR9jKV93J6esMg+XJ1PrOebzkSjskPn0Ft8q5uOPG1b0K2yI1KoaXqfnjNgYFZKowQMle6BSgRD7e
	pIkFPPV3ZaqtplnkOOQxp8+gxHhLKNy/bVM6sRHkF9PWHj86J+FSu7FPwMdnwMEnT7AKUzhAFsIof
	P1LKEirC6rnDh3A05DPCVkPsmQSSnTSlliNzl+XTAkA0lqJ/j8EKb1++mZt3nT1gLq1vJJGI0HMdL
	S3PMCXlLp0elob/wPW59b1za/e5sjZgXypZsyjHDWZ2uYluxrhmHRP/MoLhZjsY/zlaR2X+CwXBco
	h8CsqIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKp-000000092pT-0buh;
	Thu, 18 Dec 2025 19:06:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKk-000000092kG-2I7k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:06:44 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b7633027cb2so166566666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766084801; x=1766689601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chaucy1e8lWQfwVdexQ24C/rG8+K3TB71NB1amH2+HE=;
        b=KqJ8QTNa/8gljUIy0YSIvI8vyoPkZdUOsMsffNAPbQzz7IHPrHHVwwct2i5KXPzsD6
         P1h4Shqsf+jR9oGbWSu8mUrJTAxG6LVxSfSElXCr3jGXd71+wGolpCrFvwF8drHYIpOG
         chUsqb5/wcmYk3uurKgW0l0MEJ9IVx1Nq7+n9tL0r+QG+ssrFY9R5TiM38MIUkI70VcJ
         21BDD2gPSRex7Ti/gOfmCN0bF8gqXMm3T75qrvaJvt4ky+Yl+CTiysfWbVjXjEJR8/Sq
         cBeFUso7/DQdXozzbwb4BtfYlzGOMQTdwU8CoXemfuSQN29fWB0MMEL1pvwvdanNTLGA
         mNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084801; x=1766689601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=chaucy1e8lWQfwVdexQ24C/rG8+K3TB71NB1amH2+HE=;
        b=bKSi5u+CDF9qBqAxvX82BYOn5ngP/Ycyfio0gnF/EI7bizozzCeQg9JN4mU313fVtc
         V6v8CeeZ3C+4XYe98oFyW96qkoKwTGIaiOxy/DIlvX+hUh00PxoFoc7JMAFtuSiJB71X
         rOeKYkN/gGQTvTHWz1WJysk8Ko59KK2qXNiZXyeKlCce0e2tm8CVcbKHxOdLEb3KHxyn
         DMnSst3et7qbXlUb9d8Ihg7uql9RNGTFsK2Jbngu7wgFXiznevWvdFyc3kaP5blws6e2
         RXvo8rU2dKAXpxSubnntY27VBkZi7xj2CVULup9tt/phLrskPSf1L/20C+PnY5rRlUxn
         ATPA==
X-Forwarded-Encrypted: i=1; AJvYcCVVszdRfxaJhrSHJfcA5GiGqoy1CnNSObHQewKCq1Aaan3R+2wOrB++jEYHfJ+Mqay3Tjy13+H6h3GGxzePWjRK@lists.infradead.org
X-Gm-Message-State: AOJu0YxBWwpb6wSMvbio6mJ+3U5BTEtIyIQnXAnkOeUJkcVXxB7kRTq0
	7npfQfeCCEIcbSaKEjMJLlI86xCo8Cje7PhusWmpIWWO3DdLS+TzYhbSLn1K1TyNAmI=
X-Gm-Gg: AY/fxX4HDq/SOQVv48Ki4WQgoAa6Q2VTH4yCsArxFv6FalqMGhd6nE+rtQyAHKiF+Ck
	cyVQjxVrPbbb7Gg+5NfwrQDQsLcfX9P98WRQAvnzDgcBH+BjcYySvuBHf8ZTGDFxNTb9o/cYH/h
	6jbEzE/sQnIkeyASFuHgIPzynLH5L1zogtA7WJBf0L/YQhq5E3gOuP9YS2xtZywX+1nNSja6ywh
	UqAVpFZhZd1wxfROQ0A0Vhq1FQLY1nvaFMRSns+vCl5vgcPwkg2g7YGgmhDQDX2xwQhEp9F/vad
	WQWqZYsHpHgIKEiNMRqwT519SWWLf1TZ7XA8dECoez1guOsFI6QM2KgAQK2AZHM7/8H1niwAB53
	QxRULF9/Jb3JNyyPHoV2Abzz/vzEeCuFa8kv+2d5Tj0ioN3207S6QhMjldBXWotteWDxBenAIwT
	6IIC9vRFRAIUpXiH2kctdNeAeZPSdOYmWJIevbzbWq406+Fy2wZd+z2q/f7lzPHIR8
X-Google-Smtp-Source: AGHT+IGJ7OubBdUcx7Liyf+zesKkie0GYHAOmU4YtaOMc800CNMruH3bkATR+xrHJMNRK5MvnKCc8Q==
X-Received: by 2002:a17:907:72c8:b0:b73:6d56:7459 with SMTP id a640c23a62f3a-b803717a112mr37909566b.38.1766084800505;
        Thu, 18 Dec 2025 11:06:40 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdf3sm18392666b.12.2025.12.18.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:06:40 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 1/4] dt-bindings: misc: pci1de4,1: add required reg property for endpoint
Date: Thu, 18 Dec 2025 20:09:06 +0100
Message-ID: <b58bfcd957b2270fcf932d463f2db534b2ae1a6d.1766077285.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110642_598843_EA3C1A54 
X-CRM114-Status: GOOD (  11.12  )
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

The PCI subsystem links an endpoint Device Tree node to its corresponding
pci_dev structure only if the Bus/Device/Function (BDF) encoded in the
'reg' property matches the actual hardware topology.

Add the 'reg' property and mark it as required to ensure proper binding
between the device_node and the pci_dev.

Update the example to reflect this requirement.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/devicetree/bindings/misc/pci1de4,1.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
index 2f9a7a554ed8a..17a8c19af8cc2 100644
--- a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -25,6 +25,10 @@ properties:
     items:
       - const: pci1de4,1
 
+  reg:
+    maxItems: 1
+    description: The PCI Bus-Device-Function address.
+
   '#interrupt-cells':
     const: 2
     description: |
@@ -101,6 +105,7 @@ unevaluatedProperties: false
 
 required:
   - compatible
+  - reg
   - '#interrupt-cells'
   - interrupt-controller
   - pci-ep-bus@1
@@ -111,8 +116,9 @@ examples:
         #address-cells = <3>;
         #size-cells = <2>;
 
-        rp1@0,0 {
+        dev@0,0 {
             compatible = "pci1de4,1";
+            reg = <0x10000 0x0 0x0 0x0 0x0>;
             ranges = <0x01 0x00 0x00000000  0x82010000 0x00 0x00  0x00 0x400000>;
             #address-cells = <3>;
             #size-cells = <2>;
-- 
2.35.3


