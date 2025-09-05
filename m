Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F644CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QhfPD6JIYlG46t1oLGKwVf4axoG3i/vXd29SY71uMA=; b=FDp3xnLvzdmfT1YtUDIqcmoSiX
	pUvwrajZv+75/+I5rwhYwRaoVgUwK/CLZ73ub5tYP0BaGcKJTiPkVtKQGaoMO3hzc5/upyIXFflFh
	hjMTwjgUizogtq7btJ4DpeSnLSxE1+b888pYbuNLEANB0elvqQPY8zCTutrQopT+L2P2/vRsXDFv0
	MENQDyxCknHCfa7Rq8K3dWEXbEq2BuBwko+06YX1ehjyBMucdwrMnGLQIvQad8X0g05iVJAVhiXVU
	ais+UnElF72UT+UK3spCjFZ8MTxsXHyNDeTYehXbo9gqMJManoJBnkVpJ+c1wcU5MysitNgxID3tR
	A5s0VmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQlp-0000000HZbd-2Xbk;
	Fri, 05 Sep 2025 07:22:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPkC-0000000HDuc-0Db5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:16:21 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5856GG323688819;
	Fri, 5 Sep 2025 01:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757052976;
	bh=6QhfPD6JIYlG46t1oLGKwVf4axoG3i/vXd29SY71uMA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zRJzdLtPrgJ1V9493DF9TDLIcb+evX+BtefbXgcr0QKEkBL4kIDpHHS42WogoCKXp
	 WSlfazTzCm7WiBUcn6LYr4h6HFUgaNmZlYHjE27lBt1bWMqFX9gNfdKzJB80+UBoiW
	 DBvvthSsJG2KWNBCfurb6o2E7+ZgPcaADVO0kA4M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5856GGLL165521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 01:16:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 01:16:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 01:16:16 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5856GFuu004031;
	Fri, 5 Sep 2025 01:16:15 -0500
Date: Fri, 5 Sep 2025 11:46:14 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <u-kumar1@ti.com>, <sebin.francis@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vishalm@ti.com>
Subject: Re: [PATCH v5 3/4] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
Message-ID: <20250905061614.c4heyez77to4ovpz@lcpd911>
References: <20250905051448.2836237-1-a-kaur@ti.com>
 <20250905051448.2836237-4-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051448.2836237-4-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_231620_135164_B96A5E9C 
X-CRM114-Status: GOOD (  10.10  )
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

Hi Akash,

On Sep 05, 2025 at 10:44:47 +0530, Akashdeep Kaur wrote:
> Add the drive strength, schmitt trigger enable macros to pinctrl file.
> Add the missing macros for DeepSleep configuration control referenced
> from "Table 14-6172. Description Of The Pad Configuration Register Bits"
> in AM625 TRM[0].

Isn't what you're really referencing the AM62P TRM ?
Small correction, perhaps it can be fixed up while applying?

> Add some DeepSleep macros to provide combinations that can be used
> directly in device tree files example PIN_DS_OUTPUT_LOW that
> configures pin to be output and also sets its value to 0.
> 
> [0] https://www.ti.com/lit/pdf/SPRUJ83
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

[...]

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

