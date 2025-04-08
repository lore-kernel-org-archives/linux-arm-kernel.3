Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714E2C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfOSYHYspGzottUnArFkYcpitk4r7QWdZuM3+8JN/mM=; b=wkMnoCDPGNI7axDOTODK/ZaSNN
	jx0JkaH8q6KwFyzE7QE64spqiRo+16AlZrhEO0Uyl/1i1VgIT7mC38hserz3Pw9UANuZpgcilI6Vb
	mMXG09XzipLuNdWHE960to4N19uJNjAa2e1H6vrlfxw2hxpDahr0yohADqyQLWVa7nrI/VsmZoqSM
	DdGdY3T8X3d5LUORWuFlXJctQEhrMJmuNuYj9yTS324SURvNUU+effHZl+KMeLd/8e3WaAhugQVQW
	IXH4jFKHzrcRJ/LwzsJDDeiSY1pHuOLgL/TCi/3QPrHfPeME8J07Zqvooj8ZB/v6QNnLUDXM/yfJr
	YXcz4I6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BSz-00000004kF1-1MYp;
	Tue, 08 Apr 2025 16:06:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BP7-00000004jYR-35kk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744128129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mnvA0U6gu5D1adVHNyzGk6daeByrjdf2vkFwznYEwD6irNssbWrechvnb0X19BCHnyJ1zWM+yTZPy0v88i7ZknKkGkwAZdugpxNNh1bXOxn1dmnzTS7TWPs+ohZCP/CHuaaXHySAwSdG1rdYFgwlCfEobHYO1L0uuOlOCLdMHic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744128129; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pfOSYHYspGzottUnArFkYcpitk4r7QWdZuM3+8JN/mM=; 
	b=b9YxsACy0OWipiJ9j9dxKTf4ITMizDCae13iZ/kdtVxbfacz6Nbh0SEc/cL3AFGfoAf1QAzOgZf/Jwx+WiDg4LIb6iqpqgA21VrHbBUEjliAqdrNmEm2fDw6U1Wxt85IooWgGQLUPHTjCqT2WoXZTSbHW2V8uu4OUuPlvTS/beo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744128129;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pfOSYHYspGzottUnArFkYcpitk4r7QWdZuM3+8JN/mM=;
	b=kRsY0/+or4//xtvdrskrfgxm1Tp+3Jpiq5gdpzPUvH1ydRgK2D2q/JgE5JzxJD+4
	B5UZp4nWbrKYEUCCtrAzG8sh84EoTbl0AwKekdrLKR57f3P87+v0wxqvHcAuwdTREuD
	W728ScZPxgXfVg2sepYFuOGC/l3s8ELU0a06MMrg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1744128127769606.6585613743389; Tue, 8 Apr 2025 09:02:07 -0700 (PDT)
Date: Tue, 08 Apr 2025 17:02:07 +0100
From: Martyn Welch <martyn.welch@collabora.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"kernel" <kernel@collabora.com>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"imx" <imx@lists.linux.dev>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
Message-ID: <196162332ff.b61ad5b5564260.8672918780815538746@collabora.com>
In-Reply-To: <cf525617-b895-4d58-8455-a5c7fa9bbeab@lunn.ch>
References: <20250327123907.542132-1-martyn.welch@collabora.com> <cf525617-b895-4d58-8455-a5c7fa9bbeab@lunn.ch>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_090225_854279_DE5D72BA 
X-CRM114-Status: GOOD (  15.80  )
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

 ---- On Thu, 27 Mar 2025 14:25:38 +0000  Andrew Lunn <andrew@lunn.ch> wrote --- 
 > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
 > > @@ -0,0 +1,415 @@
 > > +&eqos {
 > > +    pinctrl-names = "default";
 > > +    pinctrl-0 = <&pinctrl_eqos>;
 > > +    phy-handle = <&ethphy0>;
 > > +    phy-mode = "rgmii-id";
 > > +    status = "okay";
 > > +
 > > +    mdio {
 > > +        compatible = "snps,dwmac-mdio";
 > > +        #address-cells = <1>;
 > > +        #size-cells = <0>;
 > > +
 > > +        ethphy0: ethernet-phy@4 {
 > 
 > Just conformation, the PHY is on the SOM? Are the magnetics and RJ45
 > socket on the SOM, or the carrier?
 > 

The PHY is on the SOM, the magnetics and RJ45 socket are on the carrier.

 > > +            compatible = "ethernet-phy-ieee802.3-c22";
 > > +            reg = <4>;
 > > +            eee-broken-1000t;
 > 
 > > +#if 0
 > > +            interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
 > > +            reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
 > > +#endif
 > 
 > Please don't have disabled properties.
 > 

ack.

 > > +            reg-mask = <0x90>;
 > 
 > What does this property do? It is not one i recognise.
 > 

Good question. Seems I missed quite a few bits whilst trying to clean this DTB up. Will try again....

Martyn

 >      Andrew
 > 


