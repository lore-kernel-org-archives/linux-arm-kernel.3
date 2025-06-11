Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF14C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSq1/7jMgg3K9UZotY/kkF6eaX6W6YJjHiG5GK8EF4U=; b=HSTqti/dSFok6bfRr8f4vgrUMs
	8zG3a5QMv/EDcXxA+GVg9covby/J+miVb89DUTYjMoUCdxKqtW4osHxfC+Q8Sm8itCSoBFwZ1zRt3
	ovgGlhAE5i7vHJJJJbEEJIS1DiaLOXLA12e5KioGh8Vu5wObHhs32dg20PD+1MFjH1Sz0IPN/g0KA
	QWgXbVX+T9HGkE3h3wL1cNBWQSM5ChhgTLaqxR06OUALpRezzpwoNsre4IdPIWjcd3ue9Tb2cBHF7
	o0V+AEnpuuAJugINqOmALO2FcbG/ctJvZTTdyD3uDR5Bo3CPkow5B9qdqlCeYVQx38MKxIjb4V40j
	h1nGCJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNvJ-0000000AXfa-1zsr;
	Wed, 11 Jun 2025 16:03:33 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKxO-00000009t10-1tie
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:53:31 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55BCrQNQ2607077;
	Wed, 11 Jun 2025 07:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749646406;
	bh=QSq1/7jMgg3K9UZotY/kkF6eaX6W6YJjHiG5GK8EF4U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vEU8OJo+FS/6fcfwMFHrP/HftKpV3KF7QPOzWwgXeX92ljXroTz1fdn9Lrhv/70+u
	 +F7QoXWpuh3Szaj5nZlIRh3kq+IkwBps/DKIhFO1Hprks9hxcTyUdZ0TrtaSWzsqzR
	 IH3N0Zhmf6heR6Suxg97u2/Q1k9QJRMrwk0jE0OQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55BCrQeR2869382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 07:53:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 07:53:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 07:53:25 -0500
Received: from localhost (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55BCrOVO352897;
	Wed, 11 Jun 2025 07:53:25 -0500
Date: Wed, 11 Jun 2025 18:23:24 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for
 remaining SERDES instances
Message-ID: <ec2c7fab-6f4d-4163-90a9-16dddec80adb@ti.com>
References: <20250609115921.2380611-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250609115921.2380611-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055330_582750_54B76B42 
X-CRM114-Status: UNSURE (   9.47  )
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

On Mon, Jun 09, 2025 at 05:29:21PM +0530, Hrushikesh Salunke wrote:
> In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
> "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
> property. But "idle-states" is defined only for the lanes of first two
> SERDES instances. For completeness, set the "idle-states" of lanes of
> remaining SERDES instances to a default value of "unused".
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

