Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00704C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NeDdgCH1H4EeC0G6DnpevkoDIVJiaLovnZau5WGOP0=; b=HgmdxGvOfcShkyGbuvZ8WGKSGd
	sFSuTQmkJ8Va8o9rHb8eptEldi1vUQFsm+Ij7MfllfMLdG2rIN9g27LHx7lxM7PeHgZVe+5HzW5cf
	ZodKU2iOdlGyCXqKNLcn2+7Td9+lnIC3QlrnKPQshHO0MTeHWOc7rWhipQ+QbKhsJu3Rb3WJNwUeM
	5ohT68Z92SkMF9WsHXvUhf/zGOUK5SNLEMQ8Rdr+EDImEONsV+so81CumJuvSxCxan9KlummJF0FW
	oi1F0cp6x8E7uyADGZOMTkJ+X3hZP9xWqmTh3lyUc77PIkyL1IOFLUHqpqcgWCvvPk5080WsrIHZL
	lzZ+x7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZr-00000001feO-1pXU;
	Mon, 07 Apr 2025 18:52:11 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qYf-00000001Q6p-0p36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:46:54 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537HkmVB433156
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 12:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744048008;
	bh=9NeDdgCH1H4EeC0G6DnpevkoDIVJiaLovnZau5WGOP0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q34nmnxaMZ1CS2wyY/kvpvY7APtq9bRgRKyMojLXwf+y8Oe2wXpBU2yoz5nU0mNtp
	 he4X6tYoXu70yXDFSni2VVptH6W25q6/4rcO/b89JCyZUPNRencgfBh30RYvJ90ZLV
	 2imXYtQOCLwy1AXg6/L5FWtFCRrT4Q3r89/VoNAI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537HkmaF102999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 12:46:48 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 12:46:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 12:46:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537HkmYQ124236;
	Mon, 7 Apr 2025 12:46:48 -0500
Date: Mon, 7 Apr 2025 12:46:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250407174648.exd57yivoj4rvson@going>
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_104653_276214_135C3374 
X-CRM114-Status: GOOD (  11.20  )
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

On 10:34-20250407, Bryan Brattlof wrote:
[..]
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> new file mode 100644
> index 0000000000000..697181c2e7f51
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -0,0 +1,672 @@
> +// SPDX-License-Identifier: GPL-2.0-only or MIT
> +/*
> + * Device Tree file for the AM62L main domain peripherals
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/

Fix the copyright year please. We are in 2025.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

