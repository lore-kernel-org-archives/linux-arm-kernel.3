Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A346E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjQPRNYsvpfmiqPX7ydNdwdrzjsq5HRAclMslwO0+BU=; b=j+rfBm/2HclOWV3CKqEo0pStAa
	TAbiAHClSwLyIAf2k4eUWmFQrv0ySY4epB89pxFG3nNxsHwlj6h1B1VSBRUka9orKOSzHFzCx8cSi
	aooL4hCGu0Jdb2MfbBLptEtKK0ApwMmoJLDAHBpiCPPKicUpiyCW0acZX2E4TgKensZjRNR8nM0vh
	ZlhLsVDO7pUN4Bvn2HaD5QR7vsImU5emw0TSDSHHn1x/cinkIdIsKmDcGVedelOlBgFvH370/LEgz
	HrE0bAxxwcODgF0cW1/1dkYjwwYon3y7SXgZp1AgVPKnjComeXUPRW2P9xe6RQM8BeL9SBuB4HhDA
	PPC1rFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLqp-0000000AYp6-0yBH;
	Thu, 02 Jan 2025 14:07:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLpe-0000000AYW3-3ZvG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 14:05:52 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502E5kQc1895418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 08:05:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735826746;
	bh=cjQPRNYsvpfmiqPX7ydNdwdrzjsq5HRAclMslwO0+BU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gycPVSUA1KV0/FA3lNCwfi/2uWd7+QD1KsQ2PWvDSbbLuyZx83IYGlr9Ue+7E/aTa
	 FZKMyYfLT6oZuvEaRToUSHvdiFt7TtUEOIgzoC0Zp0ArFThrU01IJ1i2oJrRWURi+S
	 ligvvbB4CmO/sNZikph/hT4qBzOBFIDipTLi5CZw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502E5ke1067338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 08:05:46 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 08:05:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 08:05:46 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502E5jDI038233;
	Thu, 2 Jan 2025 08:05:46 -0600
Date: Thu, 2 Jan 2025 19:35:44 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
Message-ID: <5ize7pereukviume62mu2knokpziso3c37gqpft56v6d7ppx5y@3lapih7ncs2f>
References: <20241204-am69sk-dt-usb-v2-1-d59b2ac45c6e@redhat.com>
 <c73edt6zrcg2qx6jxvlpszjlpb62pgq6ypytsur27ep4biq6tn@olk7mtnqk4s4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c73edt6zrcg2qx6jxvlpszjlpb62pgq6ypytsur27ep4biq6tn@olk7mtnqk4s4>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_060550_982801_63EB063D 
X-CRM114-Status: GOOD (  13.57  )
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

On Thu, Jan 02, 2025 at 07:23:10PM +0530, Siddharth Vadapalli wrote:
> On Wed, Dec 04, 2024 at 12:05:26PM +0100, Enric Balletbo i Serra wrote:
> > From: Dasnavis Sabiya <sabiya.d@ti.com>
> > 
> > AM69 SK board has two stacked USB3 connectors:
> >    1. USB3 (Stacked TypeA + TypeC)
> >    2. USB3 TypeA Hub interfaced through TUSB8041.
> > 
> > The board uses SERDES0 Lane 3 for USB3 IP. So update the
> > SerDes lane info for PCIe and USB. Add the pin mux data
> 
> nitpick: s/SerDes/SERDES to keep it consistent with the convention
> followed at all other places.
> 
> > and enable USB 3.0 support with its respective SERDES settings.
> > 
> > Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
> > Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
> 
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

I failed to notice it, but Roger's comment on the v1 patch at:
https://lore.kernel.org/all/5af2e2fa-3f60-419e-be3e-74771a993de6@kernel.org/
hasn't been addressed in this patch.

J784S4_IOPAD(0x0EC, PIN_OUTPUT, 6) /* (AN37) TIMER_IO1.USB0_DRVVBUS */
should be
J784S4_IOPAD(0x0ec, PIN_OUTPUT, 6) /* (AN37) TIMER_IO1.USB0_DRVVBUS */

Please fix this.

Regards,
Siddharth.

