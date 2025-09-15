Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A726CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8vrwHu8vhbNZonZggE69klPUG5CjF8THASRPUKtN+I=; b=wVVP5Rw3SCijm9BgaGqQdK0pgv
	GD1FjPCb33nN+5cNaZVZ4zZdiKRd3Ax8oIYYP9VUuWmy2X4Cy04S9k327AAXsxDJXeB5STVORukQQ
	XGgAYbcdPEUXFEVpwOnHApiyh53iWGPjCD74ghOXgSBfSuY45nvAeqb6eQh9EAHQHe8bNbXufyR1o
	fiCjvfPl1OH7FLhqmiN7Gj4R6XVH3hcFb7uhVP04X44RFlKsat5Fcxxx//VcW87oNs8XXSwNuiZY9
	4deAV8QI60ZlV+fK5EV7n42RpEdFpU/0hEqL8N49TWXH2ILEVfS9vs9sTy3v1AlvU3gWT6T1H6SAx
	o5t3NrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAbm-00000004nlT-036y;
	Mon, 15 Sep 2025 14:55:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAbj-00000004nl0-41Js
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757948108; x=1789484108;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=EwNwBb1ZMwIRBiUXSFpclOvP5L0lGkCC606UBB6bd7E=;
  b=n72ouBc2/HcJizy6WQP6lM0l/3HSH/w3SMaOPR5f7k7MG7xIuyPeUowb
   wSoRF5M/XUDvP5iptJLRvPNEt9C/jrnUbXo9M0ZVJz/F/jtFv/sCMcb92
   +U5csg76Z1Z7siNkq9sWwJt/gKlVAoN/pHhhIi+RT8znQ02zgInPU+Bor
   IKM0Dl+uEnpazvZT6e9eSEzE3z73afBK6rdWiA0oO4lbU2ibx8ZknbodX
   zL9a5BIjNAzamA0tVpOTD+Mhf468NVBL6sO+RrFctZUJxGT0OKrfWk8YT
   kPBW57KBBEvyk0uri4GIbwFXy7r2J4nStQy7zIZ1N1SpAHZsm7SHoqKUB
   w==;
X-CSE-ConnectionGUID: V6We0pr5QIOXx8mFDIxkEw==
X-CSE-MsgGUID: 2WzlJk5dRtitwyzzXmjgJg==
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="47066873"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2025 07:55:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 07:54:59 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Sep 2025 07:54:57 -0700
Message-ID: <272ffdb9-9d7f-4a48-9968-7de1d32d721e@microchip.com>
Date: Mon, 15 Sep 2025 16:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: clk-master: Add check for divide by 3
From: Nicolas Ferre <nicolas.ferre@microchip.com>
To: <Ryan.Wanner@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250908200725.75364-1-Ryan.Wanner@microchip.com>
 <1882cb12-cb65-423a-bacb-3965ba845ab3@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <1882cb12-cb65-423a-bacb-3965ba845ab3@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_075508_069695_D61989A0 
X-CRM114-Status: GOOD (  13.48  )
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

On 09/09/2025 at 09:57, Nicolas Ferre wrote:
> On 08/09/2025 at 22:07, Ryan.Wanner@microchip.com wrote:
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> A potential divider for the master clock is div/3. The register
>> configuration for div/3 is MASTER_PRES_MAX. The current bit shifting
>> method does not work for this case. Checking for MASTER_PRES_MAX will
>> ensure the correct decimal value is stored in the system.
>>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Added to clk-microchip, on its way upstream.
Thanks, regards,
   Nicolas

> Thanks Ryan, regards,
>     Nicolas
> 
>> ---
>>    drivers/clk/at91/clk-master.c | 3 +++
>>    1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
>> index 7a544e429d34..d5ea2069ec83 100644
>> --- a/drivers/clk/at91/clk-master.c
>> +++ b/drivers/clk/at91/clk-master.c
>> @@ -580,6 +580,9 @@ clk_sama7g5_master_recalc_rate(struct clk_hw *hw,
>>    {
>>    	struct clk_master *master = to_clk_master(hw);
>>    
>> +	if (master->div == MASTER_PRES_MAX)
>> +		return DIV_ROUND_CLOSEST_ULL(parent_rate, 3);
>> +
>>    	return DIV_ROUND_CLOSEST_ULL(parent_rate, (1 << master->div));
>>    }
>>    
> 


