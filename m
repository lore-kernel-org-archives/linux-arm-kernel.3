Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D11FC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCVraN1KmmvdFxDljtPzJDoctV1ha4kdbThoFPLx6v4=; b=UKezKBTNZ8AqmHkSEVyT3+0pLw
	qfKj/ZriK70qbFU5aenE8tWFSMIZcRBi4t1UvDb0MJnFSS6ahq9s8JiEb0IxVmak44mLnbReR9HpH
	JSEJjT36slSkBVH4DjOusFrUOEhW3/cS212K8JKyyiKEDCazSc5b/DCHijGFQw0tqPqd0bsExP/dJ
	WhE3LC9WSFCkIrjqUbjcfo6bDK2n8SFo5Wiq21F9/r1UKtmjtAggPAsW1jA46BWwW3NZH4vw2YMg3
	Q4oC8wOcllC0WuiaTPCaT1wkN1ZWtex2M70Eew+1FqaGlfHOBud4joV8TE71pgk9P6hjLaqaAICtt
	HFqIddBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkl-00000007S4O-2vph;
	Mon, 05 May 2025 13:21:03 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvTP-00000007Q8q-1XPE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:03:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545D33sQ943634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746450184;
	bh=bCVraN1KmmvdFxDljtPzJDoctV1ha4kdbThoFPLx6v4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YgBPQDsOZPJ3bQkSLIVWcdnTs0GfpsEZ2/ZTe04ZSsGkK4fWItgbJ5W0sNgCfDimA
	 VU2shLyK/bKDKGPSizY9m4qMIdJnYpsKkmAA0UNhHNf+Mx5Zh6Jm0XFyV/sJz3tHof
	 qv0u3nfMw92xQ2H2tVeX2qfyTtJvzK4hSfBlJeQs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545D330n013862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 08:03:03 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 08:03:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 08:03:03 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545D3319097888;
	Mon, 5 May 2025 08:03:03 -0500
Date: Mon, 5 May 2025 08:03:03 -0500
From: Nishanth Menon <nm@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Message-ID: <20250505130303.x56xnmww5mzohahn@reentry>
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-2-p-bhagat@ti.com>
 <20250502160541.azhzbnmghrkory7h@cleaver>
 <e7ddd359-bf19-4f6a-af32-43bcb5504ab1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7ddd359-bf19-4f6a-af32-43bcb5504ab1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_060307_457295_FF4897C1 
X-CRM114-Status: GOOD (  13.71  )
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

On 15:01-20250505, Paresh Bhagat wrote:
> On 02/05/25 21:35, Nishanth Menon wrote:
[...]

> > Looking at the board patch in the series, this is am62p5 ? what is the
> > difference? If there is a difference, why is there no dtsi
> > file for am62d?

> AM62d2 SoC is similar to AM62a7 in terms of CPU cores, cache hierarchy and

Looking at the block diagram side to side, I am unable to see any
difference - it looks like "similar" is "same" ?

> other peripherals. https://lore.kernel.org/linux-arm-kernel/20220901141328.899100-5-vigneshr@ti.com/
> Thus same dtsi file is being reused here.

So, if there is no difference at all, why this series? Commit message
does need to specify why exactly what is different and why we are
re-using. If there is no difference what so ever, then we follow what we
have done in K3 architecture so far, which is just to introduce a board
file (assuming there is difference there Vs what is supported already).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

