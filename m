Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FDECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri1nfMxiQBO4KBesq7BXBzulmGX4m0aO13eZuQEBwas=; b=uYLrdpijtyvz+7PU3mTpxyOEWJ
	hURKgiZVJiHWrQy+0LYFMdDWOG5gSvDh557e4ZMftCXyWHYeeCsC/dm8NN7CzTw1LCf7jPX2z51C3
	5mkUYDaRkVJWmzXIdbhveGGpb+Kx2UcOxvF2z7I3ZQc4s8ADSH1Jf2G0SOgwDEq72aqsXWbBcuyj9
	uloSwodey9WBo4Pj1MQvc8f3vWFQiyh6doGLySeAaHNq0ezaNN6/hFp4rCm8P18tNWcCRUWedCBEo
	sdvfKc/HSLqmMn3dWe44kjEw12qtyWcOU7ncZegKPXKIj56q0FP01W4gwNKP83ceJ6lINXyteh4V+
	rPBi3d9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hbf-0000000D7L6-3wHL;
	Mon, 13 Oct 2025 12:24:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hbc-0000000D7KJ-3KH6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:24:50 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DCOHts819446;
	Mon, 13 Oct 2025 07:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760358257;
	bh=ri1nfMxiQBO4KBesq7BXBzulmGX4m0aO13eZuQEBwas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vi+kvkAZ5nS/O7iiVbdUigRSBJAt7vLc69XxGWip5mV4v0pNaF9I0iqrJKm8GsLvG
	 Gkd8uHellZFBbNj3Tf6vvnzeAcKa5hzYbLxKlWzMebIuGI553X+Z2DS826U0q/2Ot1
	 rAQILyHV6Ls+QPuHlAHa8uLOuwtEVicV+Z+Gaq20=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DCOGMD2951310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 13 Oct 2025 07:24:16 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 13
 Oct 2025 07:24:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 07:24:16 -0500
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DCOCkV2045134;
	Mon, 13 Oct 2025 07:24:12 -0500
Message-ID: <88b11fb5-91c0-4ab2-9e63-a4d2b745468b@ti.com>
Date: Mon, 13 Oct 2025 17:54:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver core: fw_devlink: Don't warn about sync_state()
 pending
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Saravana Kannan
	<saravanak@google.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-pm@vger.kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Nicolas Frattaroli
	<nicolas.frattaroli@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Diederik de Haas
	<didi.debian@cknow.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251007094312.590819-1-ulf.hansson@linaro.org>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <20251007094312.590819-1-ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_052449_036511_34029588 
X-CRM114-Status: GOOD (  22.74  )
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

Hi,

On 07/10/25 15:13, Ulf Hansson wrote:
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

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Tested-by: Sebin Francis <sebin.francis@ti.com>

-- Sebin

> 
> Changes in v2:
> 	- Due to discussions on v1 and because the default Kconfig is to use the
> 	FW_DEVLINK_SYNC_STATE_STRICT, I suggest that for now it may be best to
> 	keep the warning level for the "Timed out.." print and only change the
> 	"sync_state pending..." message.
> 
> ---
>   drivers/base/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d22d6b23e758..c62e428b95b0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
>   		return 0;
>   
>   	if (fw_devlink_sync_state == FW_DEVLINK_SYNC_STATE_STRICT) {
> -		dev_warn(sup, "sync_state() pending due to %s\n",
> +		dev_info(sup, "sync_state() pending due to %s\n",
>   			 dev_name(link->consumer));
>   		return 0;
>   	}

