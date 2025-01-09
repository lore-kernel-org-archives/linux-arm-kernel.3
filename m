Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF353E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JW9egJ7f52YOb2GHg6TSZuAgk3LsTV+d13hlGlvQeQ=; b=WzXjyduk0B+akFAUI6wvTq7gte
	STyBxHDfmDP27pXAFrIJ52BUGxH3ueMt/9VoDVWhIVdsA2LO5cbwWiNSKn4/v5txv11tl5yA5vvp8
	EIe6AGOhjxWbcZ1UAFNPL7sPXe5q6wTwjro0GCUktC0gGVUGwqYHjepYt3poESz5TZDgoV7rbmfcB
	AYVcCaLwPKLXp8ZilgYCmeAf7b6hhgOmV8Cvwa+rczRUoEsXDrfa3sv39wM8PqliaoZ4/pCGnZsRj
	iisz7U6XM60URv09EiORCh5Qx+Q8yAV2rM6kr3Q8t3qRwcfLnVksMktb6MuSGV8lyBJM22W7Xdmqp
	tbzvcv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqaI-0000000Bh1y-2lht;
	Thu, 09 Jan 2025 11:20:18 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqWh-0000000BgDh-2CHs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:16:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509BGUKa3254463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 05:16:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736421390;
	bh=3JW9egJ7f52YOb2GHg6TSZuAgk3LsTV+d13hlGlvQeQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TttcAB053cAYKIrQpQ7BUR3TCPMIcJKE4IGrSUPIPWnV+A77n3CA5gmwt2tWfFNZe
	 k8CN5qM8wN5vaL9lxcMe1GAdFVUZD1SkAEWaWQVFk9eYhQVsDRgr6VIKx79QF0NiO9
	 aw4LyHg1+ecnqFIGCMqhzDMyJns/KW0pL39FF438=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509BGUS1014635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 05:16:30 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 05:16:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 05:16:29 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509BGSDk080394;
	Thu, 9 Jan 2025 05:16:29 -0600
Date: Thu, 9 Jan 2025 16:46:28 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <kristo@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <afd@ti.com>,
        Romain Naour <romain.naour@skf.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <s22zegpea2vjcrnx5jdhuat2lfunh36v5ynuxrsh5fp2o5pn4b@mxtyqch4eujx>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250109102627.1366753-1-romain.naour@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_031635_693012_0FF4B3D2 
X-CRM114-Status: GOOD (  11.22  )
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

On Thu, Jan 09, 2025 at 11:26:26AM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

