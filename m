Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57618E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/aeQ0SmN9ckvhhXxxG1o/4+2WE4rBItBoD6Q9SjHVM=; b=HDwl0f6hH57cPL1gEjPxDIZkSk
	Q49jXhXqXNQJNPvdfBhEjV2KQ4aF7QVO7ixYWPozzoNx7RGzgnKQrTjh7HvBxbnN0s+ymwmb3razG
	6+P9pv7keASwnueiv66Fz0kg9uTMvAUKnd49oEatAVYVacaKULac6mJ3wcvaDLT7rQFo7GHsuvGmq
	HEKXEpZ1kMXfMvfdL3b5jisOccKHOj/5znDaNvplEzGn79N8RTugu+KGwUFz/rPmGB4E0uzquctbF
	aVzqJ9yaDDZjUA8Owgu1yMemlIwaFqjpyeDIcUvNL5cyvfxLstElAdQHI4mjXxfT729RkDgZXm5dU
	9TCBtmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwbW-0000000CtEd-3zNp;
	Thu, 09 Jan 2025 17:45:58 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwaJ-0000000CsxX-16ZI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:44:44 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509HidtP3193060
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 11:44:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736444679;
	bh=9/aeQ0SmN9ckvhhXxxG1o/4+2WE4rBItBoD6Q9SjHVM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=b3Odd8fCdhXk11gHRGneyhJucj1PLIxNwBuKbMjzFTEfxndgJvmJK93x3+Gx2aQXD
	 7/Woy8UDtsaOEWbbuVA/9hQpgUXXqwaqxbhV71y1qJrati62rK/jx8/LPlOeZsdUi9
	 UDDFZ4A2Rum6oV0EBEk9N4samcBeYzj/NZ6Q1Tyk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509HidcF115876
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 11:44:39 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 11:44:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 11:44:38 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509Hictj125965;
	Thu, 9 Jan 2025 11:44:38 -0600
Date: Thu, 9 Jan 2025 11:44:38 -0600
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
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <20250109174438.w4nwmvk3yf6in2kl@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
 <20250108-am62lx-v2-3-581285a37d8f@ti.com>
 <wbi7xppldoroq2okv4s43njug7x2yzgvnkhtjrtsij77fn6vsv@zzzzq6qzfeyh>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <wbi7xppldoroq2okv4s43njug7x2yzgvnkhtjrtsij77fn6vsv@zzzzq6qzfeyh>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_094443_390004_8CC3987B 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi Krzysztof!

On January  9, 2025 thus sayeth Krzysztof Kozlowski:
> On Wed, Jan 08, 2025 at 04:51:55PM -0600, Bryan Brattlof wrote:
> > +	chosen {
> > +		stdout-path = &main_uart0;
> > +	};
> > +
> > +	memory@80000000 {
> > +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> > +		device_type = "memory";
> > +		bootph-all;
> > +	};
> > +};
> > +
> > +&pmx0 {
> > +	main_uart0_pins_default: main_uart0-default-pins {
> 
> Avoid underscore in node names.
> 

Ah thanks! yeah apparently I didn't pay enough attention when updating 
this node. Thanks for the review

~Bryan

