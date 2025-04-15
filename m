Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA731C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eieUaBlN0MYYufzpPs6EQyqEgGcndbJW3BMvC5o174=; b=eVzRp8dYgUZ1RxK25BRZkPDIpn
	+CW1kzQRAcAjZPWpKD9oj0UUjYR3wx1FviOx6NA3Qe8EGUDRu/Fat2ygxZ2CxZcXMyGE1Zjm/N0eP
	O47uQFMgsUnf17hGGGGrkbjGq43AGJJg6VYQy+FG6EqpANWw+CMQvcn69oYPLOtWFGGa/gXHSQu74
	9IDtLK9dzFvXZLnlOMu8MIddUbXgy87mnKsBRdk1qPSySz3JyoLSrX/DDzV02TwzLIOxnUqKB4RjH
	QVU34DNhnl9dcSK7GQKwntN5RNURhqJWTae6IVL/r03xXyWHKtiwqfF72vUnbrWKw2U4UDQh5fY2b
	kmGZCmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4izQ-00000006OCu-0yeB;
	Tue, 15 Apr 2025 16:18:24 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iSi-00000006IXP-2Hmd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:44:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFiPk2069362
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 10:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744731865;
	bh=0eieUaBlN0MYYufzpPs6EQyqEgGcndbJW3BMvC5o174=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IwW8zjkJc55sdoA2uJlFlGmXczQl1Rq8WHw/wUHtrBv50FiXKVdLttLzI6niz0XcA
	 d+PX1xAtt5loRu9XwwBDbI9RhL+zSZWXjwEF4IVLtyiyiJGcWgDJtvTFpSzwZIVWOz
	 HA9Ms/9cDSoRRuj1ap+rDKo4lLTIidmg6rsPEI2s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FFiPg2047806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 10:44:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 10:44:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 10:44:24 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FFiOdI002440;
	Tue, 15 Apr 2025 10:44:24 -0500
Date: Tue, 15 Apr 2025 10:44:24 -0500
From: Nishanth Menon <nm@ti.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Frank Binns <Frank.Binns@imgtec.com>,
        Luigi Santivetti
	<Luigi.Santivetti@imgtec.com>,
        Alessio Belle <Alessio.Belle@imgtec.com>,
        Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Randolph Sapp <rs@ti.com>,
        Darren Etheridge <detheridge@ti.com>,
        Michal
 Wilczynski <m.wilczynski@samsung.com>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH DO NOT MERGE v6 17/18] arm64: dts: ti: k3-am62: New GPU
 binding details
Message-ID: <20250415154424.62mswstk34ifxgxi@quarry>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
 <20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com>
 <f15355f7-0b95-462a-873b-cd682fc530f2@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f15355f7-0b95-462a-873b-cd682fc530f2@imgtec.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_084436_669989_B4E720AE 
X-CRM114-Status: GOOD (  11.95  )
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

On 12:41-20250415, Matt Coster wrote:
> On 10/04/2025 10:55, Matt Coster wrote:
> > Use the new compatible string introduced earlier (in "dt-bindings: gpu:
> > img: More explicit compatible strings") and add a name to the single power
> > domain for this GPU (introduced in "dt-bindings: gpu: img: Power domain
> > details").
> 
> Hi Nishanth, Vignesh & Tero,
> 
> Now that P1-16 have landed in a DRM tree, what would be required to get
> this and the subsequent patch landed? Can they be reviewed and applied
> as-is, or would you like me to send them as a separate series?


Matt,

Please post the patches in a separate series along with any defconfig
changes required for the platforms.

Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

