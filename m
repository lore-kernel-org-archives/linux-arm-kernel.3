Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 05:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DhUtPoGTteIH7DDUn9cBBWATVGD5xciR65qwj35AMo=; b=0osgNl45QHaKvbaxqKU9kgDdq9
	K9KWVhpPBxqA6p4d5G4bijBFQoSMnUUbG009vK5IHUTr/5ApFUEAlUjfM8FAWwg8xARUNDvfGs/JR
	4ddpNFxYyBGranMRuYg93YBmwCM3Vf6AvEWVGX5KgGAHO8GoNAM29Xv7BpjUZ3ni98rkQ4hwUup6x
	d5CkSL/wRYvoFoTOtLdprz627Asd3rSyMyAY6IdmikvdsX05zWNVkKjpyJt/wOo50cF+G1I2Tz5OE
	YInQP0aGTUVYNYRhCpyl2yXNR9MlfPfXx4YdSBV6IpcIRIiYHZT/gmzsUOhG6xkSI0OvCPn3sL7wG
	Nbp4iVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIhXS-0000000BUe2-2iTW;
	Wed, 04 Dec 2024 05:03:02 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIhWS-0000000BUWV-03iI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 05:02:01 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B451rh91719832
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 23:01:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733288513;
	bh=7DhUtPoGTteIH7DDUn9cBBWATVGD5xciR65qwj35AMo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LkYJodZQptK5Ov/2agxu1hQJFiQq9ogLyzt9ycpuU136ErY6+CfHi4uatuuYQE+lk
	 UZ1TgL+tAJVstYkd0l06JjIZafmT+t+iJjN2RSDAd/cxjtivzgzuRe7vKIFJcLhKgX
	 sate8IUHbWjMbtbSd5rZiQr97iCMhTNLEMDDDDCQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B451r6S015782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 23:01:53 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 23:01:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 23:01:52 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B451pSo018690;
	Tue, 3 Dec 2024 23:01:52 -0600
Date: Wed, 4 Dec 2024 10:31:50 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Enric Balletbo i Serra <eballetb@redhat.com>
CC: s-vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dasnavis Sabiya
	<sabiya.d@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
Message-ID: <o37g5m3qvod4mydnjytyubobmvit7zjmh5xhv6jxjze3reiqct@wkwm36yvftyr>
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
 <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532>
 <CALE0LRtUN2N_Z05jH_BMSg7yvirSRob0pSErmQxTu8AatmODgw@mail.gmail.com>
 <CALE0LRu-Sx5oTVNY3hm+Msu-zb04a7_ZD+r3xF1eRfR_WtK0VA@mail.gmail.com>
 <wbsg3fmco6rwjj7vtiqtqv7trfjor73j7rjx7efnlafo4pz4bc@awixm2iygd55>
 <CALE0LRvZNnNJ8jBG35bU8Ev5Fvr2400O5qXUsRn0zufkidJeJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALE0LRvZNnNJ8jBG35bU8Ev5Fvr2400O5qXUsRn0zufkidJeJw@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_210200_188115_2C97693F 
X-CRM114-Status: GOOD (  29.80  )
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

On Tue, Dec 03, 2024 at 04:29:02PM +0100, Enric Balletbo i Serra wrote:
> Hi,
> 
> On Thu, Nov 28, 2024 at 10:58 AM s-vadapalli <s-vadapalli@ti.com> wrote:
> >
> > On Thu, Nov 28, 2024 at 10:47:42AM +0100, Enric Balletbo i Serra wrote:
> > > Hi,
> >
> > [...]
> >
> > > So I changed the dr_mode to otg instead of host and tried to configure
> > > a usb mass storage gadget but unfortunately didn't work, but this
> > > could be a driver problem, I got the following error
> > >
> > >   UDC core: g1: couldn't find an available UDC
> > >
> > > As the devicetree should describe the hardware, and as far as I can
> > > see it should support the type-c port act as a gadget, I'm fine with
> > > changing the dr_mode, unless anyone have more information about this,
> > > the thing that makes me think a bit more is that, in the TI kernel
> > > this is set to host, so I'm wondering if I'm missing something or is
> > > just that was never tested.
> >
> > Are all interfaces (Type-A and Type-C) functional as Host when the
> > dr_mode is set to "otg"? (Do USB devices connected to the interfaces
> > enumerate on AM69-SK?) If yes, then it could be a DIP Switch setting
> > that is related to OTG mode of operation or a USB-C Mux that needs to be
> > configured.
> >
> 
> Yes, all interfaces (Type-A and Type-C) are functional as host when
> the dr_mode is set to "otg". Looking at SK-AM69 Processor Start Kit
> User's Guide (Rev. A) [1] I don't see any DIP Switch related to the
> OTG  mode. Looks like the type-c connector connects directly to the
> SoC through a USB HUB (TUSB4041).
> 
> [1] https://www.ti.com/lit/ug/spruj70a/spruj70a.pdf?ts=1733215039014

In that case, please post the patch setting "dr_mode" to "otg". As to
why "peripheral"/"gadget" operation doesn't work could be addressed
separately and seems to be independent of the device-tree. The reason
for suggesting "otg" instead of "host" is to ensure that the device-tree
describes the Hardware. Since "host" mode is still functional with
"dr_mode" set to "otg", at-least for the use-cases that you have in mind,
I believe that "otg" should be acceptable.

Regards,
Siddharth.

