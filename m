Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE326C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubVv6Vi59J/Kq5R4zgkakD6l3jcATZeCXAQgr62ypkg=; b=0FFBCeHpOqYLtkhW2b6FMrc2Vm
	XUe61my42DRkda3IpbAP9Rk5QAKhlT6z/xyzQARCMiXWEH0D8ErqphgojupsAhPtTbPz6ZDmlrfNj
	zGc3VBpLgHv8FPtOM13Yrnkj7OCWyPBiliTSaSDcg+tYmmHb5EohYKR8IBuEeSweoOb0MSHrkB+3/
	nBmZ46QpXh22b0hna99A+BeWPGVXg5w0Fhz2q+/kGN5THuWaHBDgPf0f9z2Q6BtKsCHLfDNMDZmJL
	7qr+PsiqXld+3h1VL75ly88tcoI/Tu3poksi5Z1Iro8ENE2FY+Y/aIC+NYPsLBMIcIZXLyzVB15Ey
	rXYgei2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrvl-00000005sIP-3vpc;
	Tue, 10 Jun 2025 05:53:53 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrtE-00000005s6L-3ZMD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 05:51:18 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A5p5PG990140;
	Tue, 10 Jun 2025 00:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749534665;
	bh=ubVv6Vi59J/Kq5R4zgkakD6l3jcATZeCXAQgr62ypkg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uF0srVgCv6ggp9b0C3x1VOobnO00RD68u0yRg5Abo668OpX5uvAfJ8veVlz4g6JEe
	 kNBzZjvmzL8uobW7nAjH047J54JyXWC42gDRlkRgKEFBKFb2btsOQxOwEgl/NjS0ow
	 Axtd3/gx00w8KS1NcyPv41eqDSy0J/0KWDssv/3s=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A5p5551902086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 00:51:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 00:51:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 00:51:05 -0500
Received: from localhost ([172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A5p4ic2424215;
	Tue, 10 Jun 2025 00:51:04 -0500
Date: Tue, 10 Jun 2025 11:21:03 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
Message-ID: <88554900-b280-425f-b79d-d065b10290a5@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250610054920.2395509-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_225116_977029_3525C10D 
X-CRM114-Status: UNSURE (   8.58  )
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

On Tue, Jun 10, 2025 at 11:19:20AM +0530, Hrushikesh Salunke wrote:
> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
> functional at all stages of PCIe boot process. Thus add the
> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

