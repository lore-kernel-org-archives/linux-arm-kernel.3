Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B9C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 03:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ9ziYOK8AMefDH28dk974JiuKuWWef/8ABJn5sihOQ=; b=UbUBqQIzgHeBxRIBTdcY11/saL
	willQPRO4W8QcCApH9uBBQcSpkkMTGZrA7Cmcl4dwWXe2syk3ZaA4Qk8dZukOMi7CIaJ+TCGf7bd7
	s10JHfKM8fR+oIqtD77jIWRQzlg8QbOs5q5jLFkZi6JRvdfxMO0eZ4AfCTjTQI4aFtjLo7tt0ozC9
	G+9Pr+VBiJ49KevcROpRUq5aoeo4/4BT1i6hiGqMysbTrek6TWVBcnR80DbV+4WRrbQENw3NJXvlG
	jjkPQmIHBbNL0jxGO+Li+4JNqp4v/Gxh9H/Thwtdka8pbEVBP27Q3hOkbrxaZ9E0itF2ZOdRLhhod
	lSu0aERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6L26-000000027Yg-1NH3;
	Sun, 20 Apr 2025 03:07:50 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6KzV-000000027O2-0xQa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 03:05:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K355Yb602066
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 22:05:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745118306;
	bh=oZ9ziYOK8AMefDH28dk974JiuKuWWef/8ABJn5sihOQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ByXi7g+hVtHcSvxqCy/g9v+ZWvKGpszt+SVj8dJmxQviJbwzMEooOvBSFz8JlktXK
	 PDXMzvizbU6jQqci0CNUejg9I5I9xE92FmxtYnU3ZI4N6kL2Cf/TdEAryEdYDiApR2
	 83qYxQBdfDdG05yRV7aVrRYy0sETCQJd0591fGfE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K355og075840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 22:05:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 22:05:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 22:05:05 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K354MJ060597;
	Sat, 19 Apr 2025 22:05:05 -0500
Date: Sun, 20 Apr 2025 08:35:03 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1
 and PCIe1 DAT1
Message-ID: <45e368a9-43ed-4d03-9a03-f60abee698ca@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-4-s-vadapalli@ti.com>
 <f9cb52e2-d211-47b1-9536-3aa81db916c7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9cb52e2-d211-47b1-9536-3aa81db916c7@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_200509_360752_5EB20C06 
X-CRM114-Status: GOOD (  18.80  )
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

On Sat, Apr 19, 2025 at 11:39:55PM +0530, Kumar, Udit wrote:

Hello Udit,

> 
> On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> > The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
> > address space of the respective PCIe Controllers. Hence, update the
> > ranges to include them.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> > index a7f2f52f42f7..4f5d277c97a4 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> > @@ -126,6 +126,8 @@ cbass_main: bus@100000 {
> >   			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
> >   			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
> >   			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
> > +			 <0x40 0x00000000 0x40 0x00000000 0x00 0x08000000>, /* PCIe0 DAT1 */
> > +			 <0x41 0x00000000 0x41 0x00000000 0x00 0x08000000>, /* PCIe1 DAT1 */
> 
> Do you want to map whole 4GB or just 128M ?

It should have been 4 GB and needs to be updated. Thank you for
reviewing the patch and pointing this out. I will fix this in the next
version of the series.

Regards,
Siddharth.

