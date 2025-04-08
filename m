Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ADBC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40zPUQrlcr8Vw5CjXjou4ckrp+WYfHtg2mzzQ/p+6/0=; b=zPRXzC656VNjH5Eho4OwHRXSrn
	I9tIfWMs8EtKzdyP6NYCV562kTrdtWy5ge+ePuZ6JhXI6RmNpM6QZxP5ZPm0DR37UAxwfNqVCOEoz
	7yKaZw8+PVJBeVNL3YCCGqbTk6LprmDhKLmNHFki0lQjDFamgoconAItcneXdeyNpuWYg/F+QO3bL
	pGb0eFNWV62uwuW0lJYcw5G+uj5WrjazOHIApEAtBWbCl4yUSPEGub5AGV1zYfPCix/xCxpZY74GA
	X0AIBk/DaVS41Eel0kELtRCVRZMc0XEXC26XrmfesCqMzxVUeagt/bET+79B3RPQKjjRRH/DhAqa/
	CVn5V4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28nY-000000048y6-0XGt;
	Tue, 08 Apr 2025 13:15:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27tj-00000003xn2-0jBJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 12:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=40zPUQrlcr8Vw5CjXjou4ckrp+WYfHtg2mzzQ/p+6/0=; b=VGR/YxEzKmckMuWJwncdl5sYhH
	BcsnjqHztSj+EXq9IXmn7iWQHV/pvnoZDtXO3T28coJutxb1SQSsl/ouewkm43E3ooyy54D8Dsemy
	Jni6uYPjSKy3XStH68IuoBI9dL1Y5AzZyDDLdvH27Fp29X5u8MOLwz7Y8uWSlGWn/kTVxE4vEQpY8
	G5tAvg4SxhHnop95aiIweULlwZmuyeFcMesA/pe59rdd57rJPJOA4oF4QX64PJvKvT3NDjuKFHvWr
	Pd4rNOCEMXrN35e9dGTnwF41PwWiChAsMI4Bw+4aVEBgSN8ewpbmiwVBl+FroPUz1UAQcptEiUmcY
	BaZXyPtw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27te-00000008I93-1l9l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:17:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538CHNdb673137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 07:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744114643;
	bh=40zPUQrlcr8Vw5CjXjou4ckrp+WYfHtg2mzzQ/p+6/0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z+pTG+24QgYuVGeEyiu+Krg6vZD7z7igJ9ynRkHU8gV8Jm+rk/alFJXJ6xgz/x1Ze
	 a4AtgTKrrLmHMtSXF4MfZwIp5riKITAoI2dWKwHf1d/oOE7WISSopWkXw9bHWnU1/X
	 FSaUIkDrIXCw+FmbzQOfgnR4PAZo73uoIGk5pqJg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538CHN4S008016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 07:17:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 07:17:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 07:17:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538CHNA4001367;
	Tue, 8 Apr 2025 07:17:23 -0500
Date: Tue, 8 Apr 2025 07:17:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings
 in IMX219 overlay
Message-ID: <20250408121723.ksjtilh4hxl2wh34@derail>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-4-y-abhilashchandra@ti.com>
 <20250407134523.d56rjpydflmkw2ze@privatize>
 <c1762c69-6a76-4f89-ab64-e6d9215e1be2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c1762c69-6a76-4f89-ab64-e6d9215e1be2@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_131742_960704_D017D814 
X-CRM114-Status: GOOD (  16.56  )
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

On 14:31-20250408, Yemike Abhilash Chandra wrote:
> Hi Nishanth,
> 
> On 07/04/25 19:15, Nishanth Menon wrote:
> > $subject - the patch adds description for the supplies for the sensor.
> > Please fix the description.
> > 
> 
> In this patch, I am addressing all dtbs_check warnings generated from this
> overlay:
> 
> 1. Adding the missing regulator node
> 2. Removing the incorrectly added clock-names property
> 
> Due to the inclusion of both changes, I opted for a more generic commit
> title.
> Please let me know if you want me to split this patch into two separate
> patches
> with specific commit titles and commit messages.

subject line should indicate what we are fixing here. If the commit
message indicates two different problems that were to be fixed, it is
better to do that in two different commits. Generic subject line is hard
to gork to understand if it is critical or not.

Do not forget ./Documentation/process/stable-kernel-rules.rst and use
fixes: tag as appropriate to indicate the original problem patch
which is being fixed.


[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

