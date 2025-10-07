Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C224ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRXHLbRBDsuSDZ3JRGY2OvYgbs7ujLbpdTE0+o8E2EQ=; b=5CoPp7fgVN3ko3bnognUIlS8+p
	BOr2gIKpd3AkKTC19LM31G0Smp8pSs2B+YtCDYzu7MeH6GTS4Tr5gVipObJ/z6p0+bu6aq1VAqicN
	AHZmBZcQM1tU3uSHwJIKT8r+6XMt2Zx5ft72erv3RFvw4w1zffqEJ3llrk6f6VZUnPj+ysOC4nUDV
	Lx9d7Z4aRN85PvlY+HwVHC6F2YbQuA4PVi3I5dC7J3ubUGQ+wPvkurhhzAWfIZ65/kynZJlrCJYiv
	zDTzo0ZzghBECCGnEdmpprpb6va4i71O8AgmTN8aKzZtHr7YwWdVBmyC4bC5jcXsN5aOzvrmUv0y+
	QuCGdLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65Kv-00000001owm-2Fqf;
	Tue, 07 Oct 2025 10:54:29 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65Kt-00000001owP-2Kgt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:54:28 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597As0eU064331;
	Tue, 7 Oct 2025 05:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759834440;
	bh=qRXHLbRBDsuSDZ3JRGY2OvYgbs7ujLbpdTE0+o8E2EQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JDPukr/S3NeMkpra/lCjbMz4mDcIOWzuywKysPN7YsCQ6JU30an5ju1YxNeEH45mC
	 Fn8taa/iuxbGpNEqXUSmEQ4f57QTZspHNQcuENHNttHulSwir2Fym2WI0w0DpvbfLy
	 7d/akc9AOvjLTpa784veuIY4izGJUiPzqaC++MiY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597As0XT2923797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 7 Oct 2025 05:54:00 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 05:54:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 05:54:00 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597ArwX71007621;
	Tue, 7 Oct 2025 05:53:59 -0500
Date: Tue, 7 Oct 2025 16:23:58 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Saravana Kannan <saravanak@google.com>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-pm@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Heiko Stuebner
	<heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebin
 Francis <sebin.francis@ti.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jon Hunter
	<jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] driver core: fw_devlink: Don't warn about
 sync_state() pending
Message-ID: <20251007105358.6jgn25jnwjxafz6r@lcpd911>
References: <20251007094312.590819-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251007094312.590819-1-ulf.hansson@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_035427_688116_D2A3B1B3 
X-CRM114-Status: GOOD (  25.53  )
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

On Oct 07, 2025 at 11:43:12 +0200, Ulf Hansson wrote:
> Due to the wider deployment of the ->sync_state() support, for PM domains
> for example, we are receiving reports about the sync_state() pending
> message that is being logged in fw_devlink_dev_sync_state(). In particular
> as it's printed at the warning level, which is questionable.
> 
> Even if it certainly is useful to know that the ->sync_state() condition
> could not be met, there may be nothing wrong with it. For example, a driver
> may be built as module and are still waiting to be initialized/probed. For
> this reason let's move to the info level for now.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Sebin Francis <sebin.francis@ti.com>
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
> 
> Changes in v2:
> 	- Due to discussions on v1 and because the default Kconfig is to use the
> 	FW_DEVLINK_SYNC_STATE_STRICT, I suggest that for now it may be best to
> 	keep the warning level for the "Timed out.." print and only change the
> 	"sync_state pending..." message.
> 
> ---
>  drivers/base/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d22d6b23e758..c62e428b95b0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
>  		return 0;
>  
>  	if (fw_devlink_sync_state == FW_DEVLINK_SYNC_STATE_STRICT) {
> -		dev_warn(sup, "sync_state() pending due to %s\n",
> +		dev_info(sup, "sync_state() pending due to %s\n",

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

