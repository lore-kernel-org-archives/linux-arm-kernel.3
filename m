Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81AFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 02:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jdb6fGowj8MOn7lR8S02/xlv03Rnfa4V8/OICBYHGZU=; b=khZ1JVp2JWIzkH34pZOJNiQLdE
	TuLgXQtj9bVhVd0CWOUMtlnXZLumtXBTp07GJVnsLASNEE/qkb1XXrWI117IL7uYML3cgD6waLGfQ
	m6BCkLqpbQHd5AdEtZU+9oPp9/dd4e85EAqXVDjlJr8NVtJkeNazV/iLqCoGgJu+xmjH1SaitigBR
	oj7bVVtyHE1qCeLNT09ZBb2faVSGy5GAZejLmg9fibVRAthsSOSF/hGeYYdnA/Y+RlwQasoPz8yNz
	NH3VBW6pwxblPEE3fgZHDUIlgjyGlDLgzc6CuubVEaEQNXuVIhLO2NViyFWwJ6vc4NY3P5zoVPtR7
	lnIvZgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Kp8-000000026q0-02fX;
	Sun, 20 Apr 2025 02:54:26 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6KnF-000000026kG-27oh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 02:52:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K2qN2X1306184
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 21:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745117543;
	bh=Jdb6fGowj8MOn7lR8S02/xlv03Rnfa4V8/OICBYHGZU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ftcZLP3+vwY97bAs2Q/l/sPgdcjcS9lOssOuwRu3/7Ss9oLnyJ86kCMItN0xC1DGU
	 szI5ibIqAi6F58/y6zKC3w09w/HknmTrdC9VMmV58kuwktm53yoO1yxpspyeteuMCx
	 rwxQqG16ZWt7OkKeAw67MO6vTu0HJWGkDs62zI8o=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K2qNri003700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 21:52:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 21:52:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 21:52:23 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K2qLDA047520;
	Sat, 19 Apr 2025 21:52:22 -0500
Date: Sun, 20 Apr 2025 08:22:21 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 RESEND] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Enable ACSPCIE output for PCIe1
Message-ID: <bc44c867-ef94-4fb2-90fc-6281aa8d195d@ti.com>
References: <20250411121307.793646-1-s-vadapalli@ti.com>
 <a64ebeae-c05b-4228-9714-308d655ca383@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a64ebeae-c05b-4228-9714-308d655ca383@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_195229_705137_774608BE 
X-CRM114-Status: GOOD (  14.32  )
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

On Sat, Apr 19, 2025 at 08:03:49PM +0530, Kumar, Udit wrote:

Hello Udit,

> 
> On 4/11/2025 5:43 PM, Siddharth Vadapalli wrote:
> > The PCIe reference clock required by the PCIe Endpoints connected to the
> > PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
> > and J742S2-EVM is driven by the ACSPCIE module. Add the device-tree support
> > for enabling the same.
> 
> Please check once if you want to enable PCIe ref clock on AM69 as well.
> 
> unlike EVM, this clock is terminated on test point.

I will move the changes into the board file
k3-j784s4-j742s2-evm-common.dtsi
and post the next version. Thank you for reviewing the patch.

Regards,
Siddharth.

