Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF463C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uabhp1OFgeoc1G7fSq5ppr9KBFz81UoMCS0Yf9xgX3I=; b=I3V9sZhxRTsAGD3A5sqzaZAjC5
	5sxuiusT46CLWbyYir267yGCklikbUzrM++PdiABISOV3LAdOkvOXGIO2fwq7jGP1WU/Tkzp+GVNw
	bUiZD3BmeeWGsWvVr2NdxJeLZYHH7MQI1qPtCJKHgr9oxlNjzvjE7LgXD3JHNKqpWnMAiIFgn+QDe
	+4KBNY0Nn9URIiy7R9v5HJs5fH18luCfWLURahpeO6wSBZec8wuXhBPFR0zV22T9/S+V2EW9Iv1C+
	iUQ3ISKpBcIMay1NLZlqacbYS864iOn/6xSSug3yc5yNPgl2bRs8otIDbEG12gLksF3KI5adbb7WW
	pPA4+M6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqUn-0000000Bn21-1acC;
	Thu, 10 Jul 2025 12:35:25 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp7T-0000000BaCK-3IdV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:07:17 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56AB75jO1487548;
	Thu, 10 Jul 2025 06:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752145625;
	bh=Uabhp1OFgeoc1G7fSq5ppr9KBFz81UoMCS0Yf9xgX3I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LdlKtGkdZBQzNhp553vr8DtO7DF04BD9gHnlF2o6wbMi9fZXPUTfAmDg9C2mQ81VX
	 E0mbxa/N23YWYqc9PGGjb7LOCeoByE/8aRu0w1Wif8Ka9ASWZIUGJWuBqUOrOoYxiV
	 wOfVEoWj+hBx8ckm7j4mKN0YOO71eLZcqPszXeeU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56AB75Kx1163561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 06:07:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 06:07:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 06:07:05 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56AB75eb1530947;
	Thu, 10 Jul 2025 06:07:05 -0500
Date: Thu, 10 Jul 2025 06:07:05 -0500
From: Bryan Brattlof <bb@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: add boot phase tags
Message-ID: <20250710110705.ah65r5nathlpqzhz@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250709-62a-uboot-cleanup-v1-1-70f8e6cde719@ti.com>
 <4d531a8b-1d32-4618-a984-6f4435f6a676@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4d531a8b-1d32-4618-a984-6f4435f6a676@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_040715_934599_0D7B8EF1 
X-CRM114-Status: UNSURE (   9.91  )
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

On July 10, 2025 thus sayeth Vignesh Raghavendra:
> [...]
> 
> On 10/07/25 05:38, Bryan Brattlof wrote:
> >  &main_gpio1 {
> > @@ -693,6 +703,7 @@ &main_uart0 {
> >  	status = "okay";
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&main_uart0_pins_default>;
> > +	bootph-all;
> >  };
> >  
> >  /* Main UART1 is used for TIFS firmware logs */
> > @@ -737,12 +748,21 @@ &cpsw3g {
> >  	status = "okay";
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&main_rgmii1_pins_default>;
> > +
> > +	ethernet-ports {
> > +		bootph-all;
> 
> 
> This is redundant as child node cpsw_port1 has the flag below?
> 

Ah yeah you're right. I'll fix this up.

~Bryan

