Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77A4CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjGeDQJzxnXd8m1pIJ6GNIDiTH2Wa1YICtpm3j0RxX4=; b=nIyqZ4eeiINREqx1aDZssvr/J/
	bGGqeOJ8TG7i23M6i+Lr9pkYaoqjedpKqdWLjDCgs8iR0RoDUG9a2gCFDrwmjFSdfEiYUgumXsHUf
	q2YCMdil1Gmtw//TFpCdvVWy+4rPKslx7O9EypB4Di5uVXjlUnHzSKFlfDib7Qe7dRxEdY6PRr0Sa
	joyBD+93sVBFjPr2ihT1ZTWtqi6jj+PushbPBLK4lwDuw2ZnOwzb/5frV6NdWNFEIflj6F12WLhOk
	RA7X8Lx5hDlrPFdi6Ioi8BkBIjOyivpDD2+i6FQEewEbwydDr5hQp3Ro8DmpKKqjG8t0y/F5Vq9y4
	1/w8/5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utl3y-000000068fI-1Nny;
	Wed, 03 Sep 2025 10:50:02 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkAc-00000005zyB-1sCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:52:51 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5839qlnB3236541;
	Wed, 3 Sep 2025 04:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756893167;
	bh=MjGeDQJzxnXd8m1pIJ6GNIDiTH2Wa1YICtpm3j0RxX4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EZJFfu2Din84QWVQd4CeC7AEySaoz1CCOw3Qda0+r34RHjKuHo6AT9rqluagfvO86
	 zzrJZVm2yySq0IvxuN3+6qDG7HtLLvT2GnvvT4WbWRWPdUwu4zCUVuoHZcy1EuD5NP
	 AImybWnCiITMHDFWHnD+s6echUu/16ORBfz7+Sug=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5839qlkn3435497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 04:52:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 04:52:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 04:52:46 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5839qj8C1092983;
	Wed, 3 Sep 2025 04:52:46 -0500
Date: Wed, 3 Sep 2025 15:22:44 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: ti: Add bootph-all tag to USB PHY
 controller
Message-ID: <b870f831-a560-4dfa-a339-7ef95fee9f38@ti.com>
References: <20250902053009.1732607-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902053009.1732607-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_025250_527989_6B84CA31 
X-CRM114-Status: GOOD (  13.52  )
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

On Tue, Sep 02, 2025 at 11:00:05AM +0530, Hrushikesh Salunke wrote:
> This patch series adds the bootph-all property to USB0 PHY controller
> nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S).

I believe that you are referring to boards rather than SoCs based on the
changes made in the patches which address Nishanth's feedback on the v1
series.

> 
> The bootph-all tag ensures that these USB PHY controller nodes are 
> available during all boot phases, which is required for USB DFU 
> (Device Firmware Upgrade) boot functionality.
> 
> Changes sice v1:
> Updated patch series to add "bootph-all" tag to board specific file
> instead of SoC file.
> Rebased on current next.
> 
> This series is based on commit:
> 33bcf93b9a6b Add linux-next specific files for 20250901

For the series,

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

