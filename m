Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2D4D690EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzEelM7jIbS2O9RdoknMU1gIWK7OayEz8i4ohIB16uQ=; b=wVOekFHtE+pQHRFSviRuCKq3Mr
	Q4Z1/opMc3xRWaY3OT1vXIzEH9nQpfNaRQB5GQB6Q7Ct7ExRH0Xg/EdvmRrdX0aGKw5sAkaHatugm
	2S6wrruK/n5BOOSHOuURqUXVjdwtf/YzJtXreYA7jLOL43AXwxqcOY+u3GzKDLFDitAR3tmg1hHF9
	5WFqwygQrpFQk9GVbKqokZil8bstDyb2AnoNTu6p7h6DG7Np9+nQXUKU5p+wRppTZKXDh6+KN1sIt
	Hq89O0UdN1XY99UvVBicPJnvAozl2X/NLYeBWatrK+DL76vwPLTdGx4Mg3B97gcD7j4e0MXj3o8X2
	5bvLPXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbIw-0000000FCfx-2Pqs;
	Thu, 28 Nov 2024 09:59:22 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbHw-0000000FCRr-0mYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 09:58:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AS9wFd1733194
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 28 Nov 2024 03:58:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732787895;
	bh=lzEelM7jIbS2O9RdoknMU1gIWK7OayEz8i4ohIB16uQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=subYZv/qrk2LUGil3IpxfTnfzEpgw5bG3kX+ZLh8QbiA9EsKKfSdnhYZ66yXkdHqL
	 4A9j0ukm0FN82koccm6XExL2PUyg+8DbR2yXp2eI92sy1lUUqNfIfE30Qz8yDMlMhl
	 mAildoxYj/KpL4hajhTajmYrdXF+2T4Sl3+5hJ7Y=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AS9wFFW030473;
	Thu, 28 Nov 2024 03:58:15 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Nov 2024 03:58:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Nov 2024 03:58:14 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AS9wDAi126610;
	Thu, 28 Nov 2024 03:58:14 -0600
Date: Thu, 28 Nov 2024 15:28:13 +0530
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
Message-ID: <wbsg3fmco6rwjj7vtiqtqv7trfjor73j7rjx7efnlafo4pz4bc@awixm2iygd55>
References: <20241126-am69sk-dt-usb-v1-1-aa55aed7b89e@redhat.com>
 <2nuncc5rscu6h74ylaiu6yozg34aoigaj5d4uzvdtolt5q7bmv@6hacpxyb2532>
 <CALE0LRtUN2N_Z05jH_BMSg7yvirSRob0pSErmQxTu8AatmODgw@mail.gmail.com>
 <CALE0LRu-Sx5oTVNY3hm+Msu-zb04a7_ZD+r3xF1eRfR_WtK0VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CALE0LRu-Sx5oTVNY3hm+Msu-zb04a7_ZD+r3xF1eRfR_WtK0VA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_015820_413841_6F8E94AE 
X-CRM114-Status: GOOD (  18.54  )
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

On Thu, Nov 28, 2024 at 10:47:42AM +0100, Enric Balletbo i Serra wrote:
> Hi,

[...]

> So I changed the dr_mode to otg instead of host and tried to configure
> a usb mass storage gadget but unfortunately didn't work, but this
> could be a driver problem, I got the following error
> 
>   UDC core: g1: couldn't find an available UDC
> 
> As the devicetree should describe the hardware, and as far as I can
> see it should support the type-c port act as a gadget, I'm fine with
> changing the dr_mode, unless anyone have more information about this,
> the thing that makes me think a bit more is that, in the TI kernel
> this is set to host, so I'm wondering if I'm missing something or is
> just that was never tested.

Are all interfaces (Type-A and Type-C) functional as Host when the
dr_mode is set to "otg"? (Do USB devices connected to the interfaces
enumerate on AM69-SK?) If yes, then it could be a DIP Switch setting
that is related to OTG mode of operation or a USB-C Mux that needs to be
configured.

Regards,
Siddharth.

