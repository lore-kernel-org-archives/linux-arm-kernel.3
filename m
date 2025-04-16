Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BDAC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXKZ/QBlw91XJiqZtti7QrRoymu1XI2lK56ZzBX/0vg=; b=3x6OBQST19WSBcECH8cejRcwRz
	7+74CVe1R74NL3dpRVmuD6pgFug5K+adiC4NfE1OGkGQE7gThX7kZ9MPk0jRYvKCwoN28fJ6nkU87
	Z6Fx0hnW8wym/beKCsGerki4NEEmxYlg+B9Ju6gAsnV8oj7cgdyUMxDtqjeqf3OPBjP5nTynnebhK
	NfIP+LLzwXQjAugELbNZo+/1/H9ArGdwqPkfqwEvVbKc50gPVOSOtmylmMibLpRudRVszxaVautuw
	BfytY0E89bbzfIIkqV6W8e49LHZ+Dsb18IhtB5wZp7Vi8nvQIewG6B7a0cGuBKfYq6eX8JEB5AbIx
	yi3gs9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55CM-0000000AAqs-3QFx;
	Wed, 16 Apr 2025 16:01:14 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53xp-00000009vyN-1tKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:42:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GEg3RV370663
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 09:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744814523;
	bh=ZXKZ/QBlw91XJiqZtti7QrRoymu1XI2lK56ZzBX/0vg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ESC/IdM4GeB5oosu399uiU+IJn4WFdbS/hDnBUdqritQRt0r6NsU8UfRX7iKbaKYj
	 kR2bIvCy5bOs0rtBBMAF1PRld/H5lHOMnYN1IEyp7O2YSdKlWaP8QIhARjzwW2Ok8K
	 KcA0D37wGz2g/X2Wrnyfn9PPFXispMrgvwPKGfq8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GEg3ZX024384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 09:42:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 09:42:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 09:42:02 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GEg2SE061927;
	Wed, 16 Apr 2025 09:42:02 -0500
Date: Wed, 16 Apr 2025 09:42:02 -0500
From: Bryan Brattlof <bb@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250416144202.4bmm566iqaz6adzo@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <20250409-calculating-hungry-mosquito-f8cfeb@shite>
 <20250411182608.cpxr357humjq6ln7@bryanbrattlof.com>
 <859a4fc2-45f5-4d72-9727-7979e4c15bd5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <859a4fc2-45f5-4d72-9727-7979e4c15bd5@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074209_655626_2A74058A 
X-CRM114-Status: GOOD (  19.52  )
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

On April 12, 2025 thus sayeth Krzysztof Kozlowski:
> On 11/04/2025 20:26, Bryan Brattlof wrote:
> >>> +
> >>> +		usb0_phy_ctrl: syscon@45000 {
> >>> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> >>> +			reg = <0x45000 0x4>;
> >>> +			bootph-all;
> >>> +		};
> >>> +
> >>> +		usb1_phy_ctrl: syscon@45004 {
> >>> +			compatible = "ti,am62-usb-phy-ctrl", "syscon";
> >>> +			reg = <0x45004 0x4>;
> >>
> >> No, you do not get syscon per register. The entire point of syscon is to
> >> collect ALL registers. Your device is the syscon, not a register.
> >>
> > 
> > My understanding from [0] was that we would need to break this up into 
> > smaller syscon nodes because the alternative would be to mark the entire 
> > region as a syscon and every other node using it would need to use it's 
> > base + offset which was kinda undesirable especially for the small 
> > number of drivers that need data from this region.
> > 
> >     a-device {
> >         clocks = <&epwm_tbclk 0>;
> 
> 
> Hm? That's how you use the syscon, so how it can be undesirable?
> 
> Anyway, one register is not a device, so no device node per register.
> 
> In the link you provided I was repeating the same, so you got same
> review in multiple places.
> 

Interesting. The way I read that thread was the opposite and it's why we 
did this for the 62, 62A, and 62P devices. I mainly say it's unfortunate 
because if we have a block of miscellaneous registers there's no clear 
guidance on how big or small that range can or should be and we still 
need to encode the offset to that exact register.

By labeling each register we at least have the opportunity to describe 
each register and if they are even used.

~Bryan

