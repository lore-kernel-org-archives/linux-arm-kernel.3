Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F222CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW1z095MzZSMk9KdimsOw/oibgooKAru9daqRXooKa0=; b=W9v+UyDke0cNcuBXNd6eUjmfMx
	njH9VS08OxGVlr636eIwJE5WVJPgKWpo4WKCSLyiZULGjC60PfLk2oCBP9gJfW9CkKFJCaXUHOFlN
	QOMw7uQsL50T00G835zB1vFGyQvHS1Gdg6g0ZfL2jA3loFnrb8F2sa9xbIwj7kIVJX/HIlwTyGRcF
	t2FqHqesGlpdxR5Zb6mESfvaTzhLA0CbF5DcmxN5fxfG/uvf3u+eZPcsS7ItN6t6NTjY5H8kax+1s
	17THVxSRFsCf/ljvZN1gORi9wP8WvzIs5va9m/wKynYLd35jqDzNVjd6p+Hhqt73CJuJz360EYUrl
	oHupwd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIxh-0000000DoGw-2PZK;
	Wed, 10 Sep 2025 11:26:05 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIxe-0000000DoEb-26Qp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 11:26:03 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ABPvEL502951;
	Wed, 10 Sep 2025 06:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757503557;
	bh=zW1z095MzZSMk9KdimsOw/oibgooKAru9daqRXooKa0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=W3Faza0YcYqDbWrsC2D4EtsnXFRMX04q2tJS23pZf28T8w/pX69f+K01l3JmFzo5G
	 ZtWoKR3q2G9VdWXOoJcgPrurodGRJLvWoavz4blsSgfSD/N5QEaOJAbC8mZRgi+WsO
	 vNSk6hgMeI2F5KIhqmvLq4iMM0DpiNFH/i7wBJJA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ABPv8M246816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 10 Sep 2025 06:25:57 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 06:25:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 06:25:56 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ABPtMv102183;
	Wed, 10 Sep 2025 06:25:55 -0500
Date: Wed, 10 Sep 2025 16:55:54 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <u-kumar1@ti.com>, <sebin.francis@ti.com>,
        <k-willis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vishalm@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: ti: k3-am62p5-sk: Remove the unused
 cfg in USB1_DRVVBUS
Message-ID: <1d16775c-fb7b-4e7e-a48b-31fd48d3bdf0@ti.com>
References: <20250909044108.2541534-1-a-kaur@ti.com>
 <20250909044108.2541534-2-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250909044108.2541534-2-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_042602_582250_6A4454DC 
X-CRM114-Status: GOOD (  13.11  )
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

On Tue, Sep 09, 2025 at 10:11:05AM +0530, Akashdeep Kaur wrote:
> After the SoC has entered the DeepSleep low power mode, USB1 can be used
> to wakeup the SoC based on USB events triggered by USB devices. This
> requires that the pin corresponding to the Type-A connector remains pulled
> up even after the SoC has entered the DeepSleep low power mode.
> For that, either DeepSleep pullup configuration can be selected or the pin
> can have the same configuration that it had when SoC was in active mode.
> Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
> as the DeepSleep control bit is not set and the active configuration is
> sufficient to keep the pin pulled up. This simplifies the setup and removes
> redundant configuration.
> 
> This reverts commit 115290c112952db27009668aa7ae2f29920704f0.
> 
> Tested-by: Kendall Willis <k-willis@ti.com>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>

Acked-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

