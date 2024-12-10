Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24A5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGD6VvVesz9TaXvUHr+lSG6yCgGJWZjixEBsCx87FF8=; b=MczJiBsgjrzr/pyHdDarik+aW0
	rzXCOLpeLmR48O/0FFP6xwBYYIPB2sYWqUjq3P19mqK6OM8GnQ1hXClmxkdoWiP3FV3VswikS0ZYY
	M7kXYVolcvudkZTCuPQd8BdpFajVNUMSDi3Km1r2OtVIXLUjV8/BteChd2TAhz8P/Mu0P93ELzp6h
	vrFyidofudOqBnn7jg68rDX+2x/mEumH7/KEygbWspEDWDJKalzWN5lo9PmBkCelg1IGVId6sGCKm
	eKvpvulMu+AKIIuotGsh+St9vEOjoMIpVqitdfEE0jqX5Ee12HhZVLKCKLhWS1j9ikZu5EsuWeV4U
	K9d64Cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxxG-0000000BEQC-3hiM;
	Tue, 10 Dec 2024 10:59:02 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxti-0000000BDNm-1rnx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:55:23 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAAtJTT2917336
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 04:55:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733828119;
	bh=vGD6VvVesz9TaXvUHr+lSG6yCgGJWZjixEBsCx87FF8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PtkbDjAIFQTn/KknoTTMTajSadc+BjNpBnn50RyFBICj6naI3yd2dR3JXLqVai3yI
	 H+SmziJtbpX1Ir0fHJ9GW0m02BqFrL0xlde6G8j/8WURHvLHQHJgrhK7In5NCAHCGt
	 mlQaLq9q9IaBTE/0dY0NPCTpoKOSfT57hLAj5EBA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAAtJRm114297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Dec 2024 04:55:19 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 04:55:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 04:55:18 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAAtHMZ130180;
	Tue, 10 Dec 2024 04:55:18 -0600
Date: Tue, 10 Dec 2024 16:25:17 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, <linux-pm@vger.kernel.org>,
        Nishanth
 Menon <nm@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy
 chain wakeups
Message-ID: <20241210105517.ms7twggosr2rs72m@lcpd911>
References: <20241206-lpm-v6-10-constraints-pmdomain-v6-0-833980158c68@baylibre.com>
 <20241206-lpm-v6-10-constraints-pmdomain-v6-3-833980158c68@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206-lpm-v6-10-constraints-pmdomain-v6-3-833980158c68@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_025522_524600_B4E1DF65 
X-CRM114-Status: GOOD (  12.18  )
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

On Dec 06, 2024 at 14:12:52 -0800, Kevin Hilman wrote:
> When a device supports IO daisy-chain wakeups, it uses a dedicated
> wake IRQ.  Devices with IO daisy-chain wakeups enabled should not set
> wakeup constraints since these can happen even from deep power states,
> so should not prevent the DM from picking deep power states.
> 
> Wake IRQs are set with dev_pm_set_wake_irq() or
> dev_pm_set_dedicated_wake_irq().  The latter is used by the serial
> driver used on K3 platforms (drivers/tty/serial/8250/8250_omap.c)
> when the interrupts-extended property is used to describe the
> dedicated wakeup interrupt.
> 
> Detect these wake IRQs in the suspend path, and if set, skip sending
> constraint.
> 
> Tested-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

