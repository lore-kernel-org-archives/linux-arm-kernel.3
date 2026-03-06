Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC5BF0180C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRlakgD6AzmyF11K9CQyZTDmXZeW3pFhz/xkf5/wjSo=; b=DNwBEhieSFJhFyA3IOmtI1fQSD
	tdUMrOtfvotTGH+IVRQyrgu0JUs452x/1EDcu8nEfZbVpvciuLd7BsKdo+nwCUxQfyll12yaLlGir
	qkxnUjvE2Q5THKc0hCO8GS5UHdB1XBSoxy+IGkb5iDxUVtoTx13wOD7c80gybiS7e7iLouVXNG2pp
	CH2wI0HeusfufpzXAn7q1p264ZiOfX6mDBpKR/5CxpmB0FAkri6JLd8xAEc2xms6EwJLGFZWChGfX
	RZClvcBwqGtUgXFj3axgpGBWtmUmP4ipCwqSOg1rLBSzlfMhqIBXUJj9yvE13n7nbLOmtO+yDqMY0
	ZO52nBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1w-00000003BeW-0cJ6;
	Fri, 06 Mar 2026 07:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1q-00000003Bab-2nsN;
	Fri, 06 Mar 2026 07:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nRlakgD6AzmyF11K9CQyZTDmXZeW3pFhz/xkf5/wjSo=; b=P7ldiVDH3C/DFC03p0oKi5GDRt
	JKMmzAnWz7OJUYHP6v77K6SmxEv5GGNe17Qsv+YNEzXB9W8DnSdKYMzYCd9DGxlakLbvBe/CBNye8
	DAHAwNEQ6rFS3FgWArGXESqAMFtN+092We1Us+mrB6biBesrgB2G5WRxZ3HPH/rgPIZ6m0gD5XBXV
	xC9cjGnOgGZHplK6xLo38EF8jvyMXFD7D+/qzP4d8sqip21pUInMdDeYp0wbUnwBnXpMoNDc4xxUR
	iAE5NRJfT+kyHNMDa7wr/Mc4mqYhMuwNlc+yjbJO5fjaAWCegdY+AepG1kyo+Q2R746+DAAnLDpcD
	Aj4aglfA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EKb-1N3r;
	Fri, 06 Mar 2026 07:55:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkcV72977163, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=nRlakgD6AzmyF11K9CQyZTDmXZeW3pFhz/xkf5/wjSo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=rcLAdTUnrTxidAx0Xt4udHGJTP/mu+R9fM6UjARfUWXZg3yv3fMaHU2WITM1El4E8
	 Ea5/OhFCTPn1+GrWlW7p/448rXa8PFxzRPmapMDUzagCTuYKNsggVjFBFA5oXhtdwS
	 4cfc11XpLbB0FU/0e3ZbM5iM1uwN2d/iypr+4b/xFes9Fzx7JGdOWJA+B7JkR4aoqs
	 3X7fgrjmQORZ28GgScnXHTA8ftOxBIXwhrebM+dtoIRae0fVp8PXbK9z+XmUikDMXn
	 sTKuB2b+QsBK6MkzYO/qVyPJWAKcHWGcY16mEfoUzcaEO0b95Tm+KxXqhbvUHfjmTW
	 iTXrufhSn2BbQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkcV72977163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 07/14] dt-bindings: pincfg-node: Add input-voltage-microvolt property
Date: Fri, 6 Mar 2026 15:52:37 +0800
Message-ID: <20260306075244.1170399-8-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075518_805989_7EAE6F4C 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add a generic pin configuration property "input-voltage-microvolt" to
specify the input voltage level of a pin in microvolts.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index a916d0fc79a9..da182c8a1d00 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,6 +162,10 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
+  input-voltage-microvolt:
+    description: Specifies the input voltage level of the pin in microvolts.
+      This defines the reference for VIH/VIL.
+
 if:
   required:
     - skew-delay
-- 
2.34.1


