Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D79C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDjqQI7xGn6ZAkyB8A2JVUVNfkN4kR0P7+fd79Lw4zk=; b=nS3ZcMDHhAV8pK+eHlLbzOD6dd
	4kkFHqyykj3qUBS+AQ67zh5l7aAp/FaWoghiquF/6d/Ufz2EIxrNLjgucLp2b1Mqnj7RglOcSEiqc
	QXXWjJXbU5CBqfuHroiIh7yaxJYVfcn8yu8e575WtZ4h720bIGbUqOC3pFaZdb46eAyi1F0dMoRJL
	I5yBTHR4URF/hNlXgYhpnfP7+RfuIvHzsjmKHKQxUrCvKbS1Jtd+soLpKLDqbRWqqvMNUaH47syQX
	Y3QH9vQabA/n6TTno4q0WyGZyOKwuGABcJxj/lP/fN+iAoTMcFOA5VZYVHiIOp8KK0qV92W3jXZ+p
	sBko63qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua62e-0000000Dj8j-3461;
	Fri, 11 Jul 2025 05:11:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5S1-0000000Dfij-1XRH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:33:34 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B4XMCW1341376;
	Thu, 10 Jul 2025 23:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752208402;
	bh=RDjqQI7xGn6ZAkyB8A2JVUVNfkN4kR0P7+fd79Lw4zk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RSaWinhFcfF/pN8NNbcj/1+Yo1dbwdpKtCU+wXuEQAW6THaJ/JHa5Rmz3WnH3oNkb
	 KYDWaNYMXrkYdNzCjkoNcjcv9yWjnHMmRrXoAnLiuFd0oqSbLcvnNMMiONxtAUJOQA
	 KUSjB1u6+6CUOEGYJmdB3d80Jzmatb54kJb77Yb0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B4XMkr3687438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 23:33:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 23:33:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 23:33:21 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B4XKG12538132;
	Thu, 10 Jul 2025 23:33:21 -0500
Date: Fri, 11 Jul 2025 10:03:20 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-sk: Add idle-states for
 remaining SERDES instances
Message-ID: <fcf7ca92-2963-4545-ac9a-e96787c2548f@ti.com>
References: <20250708113942.4137917-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250708113942.4137917-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213333_505002_72E1C84B 
X-CRM114-Status: GOOD (  14.33  )
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

On Tue, Jul 08, 2025 at 05:09:42PM +0530, Hrushikesh Salunke wrote:
> In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
> "serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
> property. But "idle-states" is defined only for the lanes of first two
> SERDES instances. SERDES lane mapping is left at its reset state of
> "zero" for all four lanes of SERDES2 and SERDES4. The reset state of
> "zero" corresponds to the following configuration:
> 
> Lanes 0 and 1 of SERDES2 are unused
> CPSW MAC Ports 1 and 2 mapped to lanes 2 and 3 of SERDES2
> EDP Lanes 0, 1, 2 and 3 mapped to lanes 0, 1, 2 and 3 of SERDES4
> 
> For completeness, define the "idle-states" for the lanes of remaining
> SERDES instances.
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
> ---
> This patch is based on commit
> 26ffb3d6f02c  Add linux-next specific files for 20250704
> 
> Changes since v1
> As pointed by out by Siddharth, setting lanes of remaining SERDES
> to "unused" will cause regression on AM69-SK as these lanes are used
> by CPSW and Display. Updated patch to set the desired values for
> remaining serdes lanes.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

