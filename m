Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F58CC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5AEfoX8egocTPO++2eMREVjlJDtW+Hj61LvDCDccGA=; b=Bh4VYe1M+qqPEg2rSbbq6kFXhh
	PQYcSxEP72qvrtc5KNId9qDtUftJER2BVs6QV0ipmCnhxABlnrSbMDipwUdjHaG8sNUfVIyOk4/j/
	J9EY0xN0zH0zcsbTqkViqAlGakrOxpiefhErt91O9/PZGelO+r1ML+ryVQ0yexFYmmM1pZzdEEKBA
	INHoAR0teYowW9jMQwPJotMRbgZpqP+alfEn4DkxG+CoxVn9plLN/8uNfyzhot5h6fdQFGSEMPv3h
	nMDqBJyQ01hzYmJRxBx2+veSMBZWjHGndhbNKmXvaIWJJxj2msC4RyY8qB4mLCMCW5k7hyUUFnBBR
	u4qnD5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAp6c-00000001qIk-0SaM;
	Fri, 02 May 2025 12:03:02 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAp4c-00000001q0U-16cm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:01:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542C0sxq398062
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 07:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746187254;
	bh=I5AEfoX8egocTPO++2eMREVjlJDtW+Hj61LvDCDccGA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MZuIJTKu64T471E1iFKTntrDzK1KknS29QHal0soQiWcyVkbpqDJGKJcHW+ROZdNU
	 vboEA/u7QZkORUni2+Fm1Yu7mD0kxc/vOertf/hDVT3E5TGZJtrMinnlE6NFsHyS5r
	 Ar9rnFpnBnRy8G7yQ3QFVeuzSn3JcJPw4/sh5/NE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542C0sAr094309
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 07:00:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 07:00:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 07:00:53 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542C0r7e112887;
	Fri, 2 May 2025 07:00:53 -0500
Date: Fri, 2 May 2025 07:00:53 -0500
From: Nishanth Menon <nm@ti.com>
To: "Vankar, Chintan" <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Roger
 Quadros <rogerq@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-am62p*/k3-j722s: Add
 bootph-all property to enable Ethernet boot
Message-ID: <20250502120053.zvtxmjuybetlk2er@manhood>
References: <20250429072644.2400295-1-c-vankar@ti.com>
 <20250429072644.2400295-3-c-vankar@ti.com>
 <20250429112728.m54x2jwyjykcuus7@unzip>
 <511ef271-ed0b-40b6-9abc-9fce0081d25b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <511ef271-ed0b-40b6-9abc-9fce0081d25b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_050058_395151_238626E3 
X-CRM114-Status: GOOD (  20.14  )
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

On 11:18-20250430, Vankar, Chintan wrote:
> Hello Nishanth,
> 
> On 4/29/2025 4:57 PM, Nishanth Menon wrote:
> > On 12:56-20250429, Chintan Vankar wrote:
> > > Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> > > stage. Add bootph-all property to required nodes to enable Ethernet boot
> > > for AM62P5-SK and J722S-EVM.
> > > 
> > > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > > Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> > > ---
> > > 
> > > Link to v3:
> > > https://lore.kernel.org/r/20250425051055.2393301-3-c-vankar@ti.com/
> > > 
> > > Changes from v3 to v4:
> > > - No changes.
> > > 
> > >   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
> > 
> > Please notice that we have the same problem[1] here as well.
> > 
> > [1] https://lore.kernel.org/all/20250425212427.vvyocc4mmne5g3vq@vividly/
> 
> I have added "bootph-all" property in the common file of J722S-EVM and
> AM62P5-SK since we are enabling Ethernet boot for both the boards. Are
> you referring to move the nodes I have added in
> "k3-am62p-j722s-common-main.dtsi" to respective board files,
> "k3-am62p5-sk.dts" and "k3-j722s-evm.dts".

Yes, bootph properties should not be done in SoC dtsi files unless it is
mandatory for all boot-modes and all boards. That is not the case here
as well. This is the exact comment provided in the previous version for
patch 1 with the expectation that you'd apply it to the rest of your
series.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

