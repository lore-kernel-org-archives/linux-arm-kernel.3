Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B940BC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmhLG8fj2RQNDb83VwTcmt6NK6fdTtqXuVcY3Pwy504=; b=3cDKfAMnOvsT04kDExKw/tb5RJ
	zANu29wi6Z9T12+LMakSkThA4WDoB200mVR1vn44NU0gxfLKZZdCj0qYHKMNf1gUKbvxuafXogzMx
	wdlynDRtuUGcRRKh99VcCuIxoQfZ6xw9Pv4jvaAkvkvoyST5wrHlStXkKmz0oidnTHnhjsXEjcJoU
	H/AxzYaJVdgFFFq72R/D1QLwQ7oA4WiPKS3Yef0IA5iPqfVSwvqgmG7hQfCf53U0SmCOW7tD33QOY
	zJIGryaJK9FQ0v6pnE5EbkxsoM7ECvj3/u48NKCAUTKdxDlRyJe9GjqYPkEJdycQBRjtKFloC20Uo
	ixw/UTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFEX-000000002Fu-3wjA;
	Tue, 04 Feb 2025 09:28:41 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFDC-00000000289-442k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 09:27:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5149QlEW3192342
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Feb 2025 03:26:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738661207;
	bh=UmhLG8fj2RQNDb83VwTcmt6NK6fdTtqXuVcY3Pwy504=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=J525MZqWVtgMPiAybEYSXaTk7nnHSHeq/+Hme4xm0AvV78yXeKrNZ5tIq+b1cVMy3
	 G95PvpqtQaqYGXzoU9DN3HLfqQRm5DOpFJSQZ9BJo3RKu/5l+A6SJjnOzePhJkrL5s
	 93MHb3w2wQxgT/PKb8GdwYT9Og8x51NmN6hxPzCw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5149QlIC085742;
	Tue, 4 Feb 2025 03:26:47 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 03:26:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 03:26:46 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5149Qj5V034419;
	Tue, 4 Feb 2025 03:26:46 -0600
Date: Tue, 4 Feb 2025 14:56:45 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and
 Aggregator
Message-ID: <20250204092645.cnu4lnzac7n2dtwx@lcpd911>
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250203150801.2399555-1-vaishnav.a@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_012719_052316_6F1BCFA5 
X-CRM114-Status: UNSURE (   9.13  )
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

On Feb 03, 2025 at 20:38:01 +0530, Vaishnav Achath wrote:
> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> for core functionality like DMA, GPIO Interrupts which is necessary
> during boot, thus make them built-in.
> 
> bloat-o-meter summary on vmlinux:
> 	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
> 	...
> 	Total: Before=31615984, After=31778459, chg +0.51%
> 
> Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---

Tested this for basic boot on TI K3 AM625-SK with next-20250204.
Tested-by: Dhruva Gole <d-gole@ti.com>

Also,
Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

