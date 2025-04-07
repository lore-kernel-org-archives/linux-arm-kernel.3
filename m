Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65253C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYWazmmfD/ANxoGU9LJS/ciQ9FZGln7uKvv9Wh4ZZrw=; b=IJTpdSPsL3+iCJZ2bFHON0jfXq
	91TXmf1QAXkNZzMwxQNXbgC5yR2SydyTHwjFW7yJ3TK47dxGn7RFzWd2bn7evxqrYmyuVyNa3tG5y
	qH0ScOZbPJecqi18sxC4arKBMr5ZmS/9nWS4XRnXx1JWeHYH8o9x8FVABN5CdWjVzOuu7T6Avt8v2
	YGaTPmX/mytVFiiBFxLNEaEXBQzwL2FAtGG8VItrzirQn4rdnovC7fwKvNLJ9eEIgIf9BePQILizZ
	ECkEn7UJ4R5RLemuOaAKl7wDwhleVuOSgBeM2hf1+UlDz+qsAQUjv9/Mj5mQEsvtbUi7vKxsst7zZ
	2qAgGsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uLE-000000028Q1-0ko9;
	Mon, 07 Apr 2025 21:49:16 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1u6x-000000023Ho-2mwX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 21:34:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537LYRec1024896
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 16:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744061667;
	bh=eYWazmmfD/ANxoGU9LJS/ciQ9FZGln7uKvv9Wh4ZZrw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GEQfehUG3BYjl1WUo1gBNftT/qaJEGcrPyaodQ8+yWcuZLE4taqN3rJUd4GFpuJGG
	 wPdyuJzcgBAhLawpXMK3YuO2HkWoxsckBGq1ygmY8mqAD/yeARsJFJWQvg0dMnKORu
	 4NgRWggKwCZjzmHgOYaH7Zu9JjR5A7KKeXzX/wE8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537LYRWZ027597
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 16:34:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 16:34:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 16:34:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537LYQSA015167;
	Mon, 7 Apr 2025 16:34:26 -0500
Date: Mon, 7 Apr 2025 16:34:26 -0500
From: Bryan Brattlof <bb@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250407213426.gkhes7oh5f7vg36q@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
 <20250407-am62lx-v4-2-ce97749b9eae@ti.com>
 <20250407174648.exd57yivoj4rvson@going>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250407174648.exd57yivoj4rvson@going>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_143431_789437_81714B8B 
X-CRM114-Status: GOOD (  12.12  )
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

On April  7, 2025 thus sayeth Nishanth Menon:
> On 10:34-20250407, Bryan Brattlof wrote:
> [..]
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> > new file mode 100644
> > index 0000000000000..697181c2e7f51
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> > @@ -0,0 +1,672 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree file for the AM62L main domain peripherals
> > + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> 
> Fix the copyright year please. We are in 2025.

Ah thanks, time flies. I'll update that.

~Bryan

