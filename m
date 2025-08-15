Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585A0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdqkdGOSCAX4XC81FZy2e5EZ4V68CDUBT+I+D643hSI=; b=ApbQxur1E+TGz582xC+/lrSH/e
	gLBDAHGvtyZpS47ZPM2AC8iPbXhkULoeceWg1rQC7AIBoAMGW+96FdhVEfdqTkLCEkwYdZvLZj8r3
	6eNBokt/14g6XLzk66dcpkuru03cNcH6lUJzczArwQSl7NS2wL+1IRBmpYsyF/kTO0/D2pysKY9yF
	7s80KYNg+zd2pex4UFoV4K/558A8A/RAfLiyWQr2++thvYLhhoG31esLb7oUgMVkO8tSldSpsHqxJ
	jVW8UTtN6+cc+uuMOp/qFcFpa0UDu1v8Ti7TjiHpOv+NAYx5rS62KWItIW+C5hMc42++3o6W95r5Q
	Fli8iQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umj65-000000011lT-0NLG;
	Fri, 15 Aug 2025 01:19:09 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umj3V-000000011Yz-2Vzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 01:16:31 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57F1GMnU1996956;
	Thu, 14 Aug 2025 20:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755220582;
	bh=wdqkdGOSCAX4XC81FZy2e5EZ4V68CDUBT+I+D643hSI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jTHMTRZN9rbmdBUrj7cy2N0cbMsuuvn/jeXGw/jLPTu7esEOW1Pcu8U3b8ttAmyJc
	 kVnCDJ43L/RrZ+v1l+S0F/B/qiPnsIGZmXo/Q3c54AI2Xg4ZrPePr80VhqqdJgQF7l
	 iOAWWQjeOHrr8f5SIr5g7yPR0ga0JmwHWOxQcMss=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57F1GMh82096866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 20:16:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 20:16:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 20:16:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57F1GLQh572247;
	Thu, 14 Aug 2025 20:16:21 -0500
Date: Thu, 14 Aug 2025 20:16:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>,
        Michael Walle
	<mwalle@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-j722s: enable the bxs-4-64
Message-ID: <20250815011621.rrdurnk6ueexwldw@hertz>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-2-rs@ti.com>
 <20250813151721.nc5fr3qmro5grlda@steam>
 <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
 <20250813184229.dhgpqvi3b6aat46g@managing>
 <DC2FWE35CXPV.YM6MK820R2PV@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DC2FWE35CXPV.YM6MK820R2PV@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_181629_797424_F4DAC1DF 
X-CRM114-Status: GOOD (  15.87  )
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

On 15:40-20250814, Randolph Sapp wrote:
> On Wed Aug 13, 2025 at 1:42 PM CDT, Nishanth Menon wrote:
> > On 12:56-20250813, Randolph Sapp wrote:
> > [...]
> >
> >> >> +		reg = <0x00 0x0fd80000 0x00 0x80000>;
> >> >> +		clocks = <&k3_clks 237 1>;
> >> >> +		clock-names = "core";
> >> >> +		assigned-clocks = <&k3_clks 237 1>;
> >> >> +		assigned-clock-rates = <800000000>;
> >
> > btw, as per https://www.ti.com/lit/ds/symlink/tda4aen-q1.pdf (page 86)
> > 720MHz when vdd_core is 0.75v (default)
> > and 800MHz when vdd_core is 0.85v
> >
> > 0.85v is set in the board dts and higher OPPs are enabled depending on
> > board capability.
> >
> > You might want to check the assigned-clock-rates based on data sheet,
> > default should'nt need a assigned-clock-rate.
> 
> Are you suggesting that we set assigned-clock-rates in the board dts instead, or
> do you just want to do away with assigned-clock-rates in general and eat the
> perf difference?

The higher frequency is possible unless you know that the board is setup
for the higher voltage. So, set it board device tree file.

Look at what we did with OPP-High support on AM625 for example. That
frequency can only be reliably achieved if vdd_core is 0.85v. And base
SoC dtsi must assume safe default (min voltage of 0.75v) as the node is
enabled by default.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

