Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22984CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2PFVXxB4mOBI+7dY6l9vR3tKGPuDpKbTdB8LchOP6Y=; b=wHQKlNR7iJj/h68/+n8Yx9XLU0
	WpaQzYJ2/dCGbenArLXne9pl3FUqYdpLyApQk6BjCycUPZy8MlTfa8fz/B0oV51WN+jzoQ3AgdreC
	cW8tPNvQS+MJFxl5G3YMxghRlUcyNYmwoyW0g3K8C6BeOhu7TILKT82zvMZDQNbj670mRDTaFTMWy
	inwvwTSULYzcrmZ7AwqqE3Lk26mIJ8ewa47zVuVYw2TNrVIlsvXPYE7ymys9CuglVd/qwcyO+YRoj
	DB92ND4E1VCtkn+n8UJ4wepuKkjUcAtey28erIWDKuEeaGG3azVYB7LGIR50YqgStv8ebhKyaDJM2
	k916lfqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvusk-000000064ro-1Jg4;
	Tue, 09 Sep 2025 09:43:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtEP-00000005Nul-0r1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757404657; x=1788940657;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qm3LS10YHRxt9quI/Qo6hL5jG84UNY+SDIgxgVif46g=;
  b=E8q8FRDVUHU12TeLjC1qNf/Wd5SG7AwuT0aKxqg3hsBI3RSJwisCgeWv
   BjSWJgXZgTtgrPyWll2zROsfejqezqyNVnNyalw9oAFebXwkK0SEmidxh
   YZDj7I9yaDfAp3L6NrfGwbw5CTqaxUWftUPPkaktxqhenYjG8nJPHBQOI
   mjYb9+CmrhKGa95rchEkSCsGh+jKcZ6Yc2roAgRAOnZxiv0LrhYap/UbE
   W8XtNy0MJfEyZa99ZPk+LOn4tIuzlJYBBQgA+AuhhU4CTcN6YGovauEsG
   g918Sn9ikMqPzN/Tj6jeGeASFbmAxdgdEjEW98kpwXQ+w3V65f8EEh6kR
   g==;
X-CSE-ConnectionGUID: f8P1Im/fRVySCUAONR6ZKw==
X-CSE-MsgGUID: T2hDNvzEScuV+KHAEOG2ug==
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="277623849"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 00:57:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 00:57:19 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 9 Sep 2025 00:57:18 -0700
Message-ID: <1882cb12-cb65-423a-bacb-3965ba845ab3@microchip.com>
Date: Tue, 9 Sep 2025 09:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: clk-master: Add check for divide by 3
To: <Ryan.Wanner@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250908200725.75364-1-Ryan.Wanner@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250908200725.75364-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_005737_411728_53C78502 
X-CRM114-Status: GOOD (  16.09  )
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

On 08/09/2025 at 22:07, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> A potential divider for the master clock is div/3. The register
> configuration for div/3 is MASTER_PRES_MAX. The current bit shifting
> method does not work for this case. Checking for MASTER_PRES_MAX will
> ensure the correct decimal value is stored in the system.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Ryan, regards,
   Nicolas

> ---
>   drivers/clk/at91/clk-master.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
> index 7a544e429d34..d5ea2069ec83 100644
> --- a/drivers/clk/at91/clk-master.c
> +++ b/drivers/clk/at91/clk-master.c
> @@ -580,6 +580,9 @@ clk_sama7g5_master_recalc_rate(struct clk_hw *hw,
>   {
>   	struct clk_master *master = to_clk_master(hw);
>   
> +	if (master->div == MASTER_PRES_MAX)
> +		return DIV_ROUND_CLOSEST_ULL(parent_rate, 3);
> +
>   	return DIV_ROUND_CLOSEST_ULL(parent_rate, (1 << master->div));
>   }
>   


