Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4203CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oj13qCsPbEiz/uqA+9d/YnVZZZufrOk/feA6A13Bt0o=; b=Il+iYJWgMu4hcYTTlNxUcWHBvy
	sTNefaREdW9O3BCYGBoAad9DhxfnckKA9R0YzL0oYawgCMUyIUc0KZ2anLlZInxpfzVFejzx17vwx
	g6H4nVCVM2eMXUk+kSfz+2rN+SXWBJauPsvaS+dIlRyJ3jBEcyXJEuKng09zi/DFQWOdhSJ7Ene1G
	YfVTAClFbbHv0ii+RGsWV35FiWXoNh0NOoPyfMc8eRdOScf2OgoZkFpga12zeX7GDaXWVIs9Hpjry
	ra+3RWD+EVDAG5TItdDRmNdNOJVHiqxW/Q08FCo4p9l2NqrLRgo+c9I7jB0Btlr+63+SGO4l6URdw
	kZuOm9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZaW-00000008dhT-3K86;
	Tue, 16 Sep 2025 17:35:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZaU-00000008dfS-1Kmh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 17:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758044130; x=1789580130;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ix9BZEDU706zVBE7HUYL3TRWisPsGB6lyHix83FcTUg=;
  b=zJzeSw+BKt0wDyQQ9dp5g0F2RGoFRDMUJKvve1LeOG5LffKH+xveEpft
   Qf2D1EVWa+H6tb6LGMB3wvejsMSMcSyv/E4F+iKQwUbpydEX3sLFa5x2/
   DDEzV6jD6W84cZ9Ary8Ud0x+m+mEk3xHq+sc6/WOMR/LPQUYyrTt+H/28
   yfgYIBqeoTXLd+VpqKPIpkO7a9JfDVJgKzHyBlfrHKZ62UD0WIzxW9Wrn
   72WyQwwrBcbKT1znjlM5cVn9rleEn6uA9bZ1mNphKGK94NP4z8UnW2nSn
   NVr/EWVZ8P6E3lW30pX8Y8yqtMWBe6+52voIOxvkBbPqyJ8VqutB+jGki
   A==;
X-CSE-ConnectionGUID: 9gsFoYIUQd260MqKd1EmbQ==
X-CSE-MsgGUID: hgZsQh8cTE28XQxvMyJx7Q==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="52418539"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 10:35:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 10:35:06 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 16 Sep 2025 10:35:06 -0700
Message-ID: <61cfc570-6632-4e14-9e2b-2bd5d2ce1690@microchip.com>
Date: Tue, 16 Sep 2025 10:35:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/32] clk: at91: clk-master: use clk_parent_data
To: claudiu beznea <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
 <95e19f49-d0df-4d3f-bd7d-8b58b60f1f7a@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <95e19f49-d0df-4d3f-bd7d-8b58b60f1f7a@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_103530_650483_A28EE1D4 
X-CRM114-Status: GOOD (  19.61  )
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

On 9/6/25 11:36, claudiu beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Use struct clk_parent_data instead of struct parent_hw as this leads
>> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
>> conversion of existing SoC specific clock drivers from parent_names to
>> modern clk_parent_data structures.
>>
>> The md_slck name and index are added for the SAM9X75 SoC so the
>> clk-master can properly use parent_data.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> [ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
>> SAMA7D65 SoCs. As well as add md_slck commit message.]
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>   drivers/clk/at91/clk-master.c | 24 ++++++++++++------------
>>   drivers/clk/at91/pmc.h        |  6 +++---
>>   drivers/clk/at91/sam9x7.c     | 19 ++++++++++---------
>>   drivers/clk/at91/sama7d65.c   | 23 ++++++++++-------------
>>   drivers/clk/at91/sama7g5.c    | 29 +++++++++++++----------------
>>   5 files changed, 48 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
>> index 7a544e429d34..cc4f3beb51e5 100644
>> --- a/drivers/clk/at91/clk-master.c
>> +++ b/drivers/clk/at91/clk-master.c
>> @@ -473,7 +473,7 @@ static struct clk_hw * __init
>>   at91_clk_register_master_internal(struct regmap *regmap,
>>               const char *name, int num_parents,
>>               const char **parent_names,
>> -             struct clk_hw **parent_hws,
>> +             struct clk_parent_data *parent_data,
>>               const struct clk_master_layout *layout,
>>               const struct clk_master_characteristics *characteristics,
>>               const struct clk_ops *ops, spinlock_t *lock, u32 flags)
>> @@ -485,7 +485,7 @@ at91_clk_register_master_internal(struct regmap *regmap,
>>       unsigned long irqflags;
>>       int ret;
>>
>> -     if (!name || !num_parents || !(parent_names || parent_hws) || !lock)
>> +     if (!name || !num_parents || !(parent_names || parent_data) || !lock)
>>               return ERR_PTR(-EINVAL);
>>
>>       master = kzalloc(sizeof(*master), GFP_KERNEL);
>> @@ -494,8 +494,8 @@ at91_clk_register_master_internal(struct regmap *regmap,
>>
>>       init.name = name;
>>       init.ops = ops;
>> -     if (parent_hws)
>> -             init.parent_hws = (const struct clk_hw **)parent_hws;
>> +     if (parent_data)
>> +             init.parent_data = (const struct clk_parent_data *)parent_data;
>>       else
>>               init.parent_names = parent_names;
>>       init.num_parents = num_parents;
>> @@ -531,13 +531,13 @@ struct clk_hw * __init
>>   at91_clk_register_master_pres(struct regmap *regmap,
>>               const char *name, int num_parents,
>>               const char **parent_names,
>> -             struct clk_hw **parent_hws,
>> +             struct clk_parent_data *parent_data,
>>               const struct clk_master_layout *layout,
>>               const struct clk_master_characteristics *characteristics,
>>               spinlock_t *lock)
>>   {
>>       return at91_clk_register_master_internal(regmap, name, num_parents,
>> -                                              parent_names, parent_hws, layout,
>> +                                              parent_names, parent_data, layout,
>>                                                characteristics,
>>                                                &master_pres_ops,
>>                                                lock, CLK_SET_RATE_GATE);
>> @@ -546,7 +546,7 @@ at91_clk_register_master_pres(struct regmap *regmap,
>>   struct clk_hw * __init
>>   at91_clk_register_master_div(struct regmap *regmap,
>>               const char *name, const char *parent_name,
>> -             struct clk_hw *parent_hw, const struct clk_master_layout *layout,
>> +             struct clk_parent_data *parent_data, const struct clk_master_layout *layout,
>>               const struct clk_master_characteristics *characteristics,
>>               spinlock_t *lock, u32 flags, u32 safe_div)
>>   {
>> @@ -560,7 +560,7 @@ at91_clk_register_master_div(struct regmap *regmap,
>>
>>       hw = at91_clk_register_master_internal(regmap, name, 1,
>>                                              parent_name ? &parent_name : NULL,
>> -                                            parent_hw ? &parent_hw : NULL, layout,
>> +                                            parent_data, layout,
>>                                              characteristics, ops,
>>                                              lock, flags);
>>
>> @@ -812,7 +812,7 @@ struct clk_hw * __init
>>   at91_clk_sama7g5_register_master(struct regmap *regmap,
>>                                const char *name, int num_parents,
>>                                const char **parent_names,
>> -                              struct clk_hw **parent_hws,
>> +                              struct clk_parent_data *parent_data,
>>                                u32 *mux_table,
>>                                spinlock_t *lock, u8 id,
>>                                bool critical, int chg_pid)
>> @@ -824,7 +824,7 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>>       unsigned int val;
>>       int ret;
>>
>> -     if (!name || !num_parents || !(parent_names || parent_hws) || !mux_table ||
>> +     if (!name || !num_parents || !(parent_names || parent_data) || !mux_table ||
>>           !lock || id > MASTER_MAX_ID)
>>               return ERR_PTR(-EINVAL);
>>
>> @@ -834,8 +834,8 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>>
>>       init.name = name;
>>       init.ops = &sama7g5_master_ops;
>> -     if (parent_hws)
>> -             init.parent_hws = (const struct clk_hw **)parent_hws;
>> +     if (parent_data)
>> +             init.parent_data = (const struct clk_parent_data *)parent_data;
>>       else
>>               init.parent_names = parent_names;
>>       init.num_parents = num_parents;
>> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
>> index d9a04fddb0b1..54d472276fc9 100644
>> --- a/drivers/clk/at91/pmc.h
>> +++ b/drivers/clk/at91/pmc.h
>> @@ -204,14 +204,14 @@ at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
>>   struct clk_hw * __init
>>   at91_clk_register_master_pres(struct regmap *regmap, const char *name,
>>                             int num_parents, const char **parent_names,
>> -                           struct clk_hw **parent_hws,
>> +                           struct clk_parent_data *parent_data,
>>                             const struct clk_master_layout *layout,
>>                             const struct clk_master_characteristics *characteristics,
>>                             spinlock_t *lock);
>>
>>   struct clk_hw * __init
>>   at91_clk_register_master_div(struct regmap *regmap, const char *name,
>> -                          const char *parent_names, struct clk_hw *parent_hw,
>> +                          const char *parent_names, struct clk_parent_data *parent_data,
>>                            const struct clk_master_layout *layout,
>>                            const struct clk_master_characteristics *characteristics,
>>                            spinlock_t *lock, u32 flags, u32 safe_div);
>> @@ -220,7 +220,7 @@ struct clk_hw * __init
>>   at91_clk_sama7g5_register_master(struct regmap *regmap,
>>                                const char *name, int num_parents,
>>                                const char **parent_names,
>> -                              struct clk_hw **parent_hws, u32 *mux_table,
>> +                              struct clk_parent_data *parent_data, u32 *mux_table,
>>                                spinlock_t *lock, u8 id, bool critical,
>>                                int chg_pid);
>>
>> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
>> index eaae05ba21ad..945983f72140 100644
>> --- a/drivers/clk/at91/sam9x7.c
>> +++ b/drivers/clk/at91/sam9x7.c
>> @@ -739,7 +739,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>   {
>>       struct clk_range range = CLK_RANGE(0, 0);
>>       const char *main_xtal_name = "main_xtal";
>> -     u8 main_xtal_index = 2;
>> +     const char *const md_slck_name = "md_slck";
>> +     u8 md_slck_index = 1, main_xtal_index = 2;
>>       struct pmc_data *sam9x7_pmc;
>>       const char *parent_names[9];
>>       void **clk_mux_buffer = NULL;
>> @@ -747,12 +748,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>       struct regmap *regmap;
>>       struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>>       struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
>> -     struct clk_parent_data parent_data[2];
>> +     struct clk_parent_data parent_data[9];
>>       struct clk_hw *parent_hws[9];
>>       int i, j;
>>
>>       td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>> -     md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>> +     md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
> 
> Please use:
> 
> i = of_property_match_string(np, "clock-names", "md_slck");
> if (i < 0)
>     return;
> 
> md_slck_name = of_clk_get_parent_name(np, i);
> 
> Same sama7d65, sama7g5.

For these SoCs the clk_hw struct is still needed since it is used later
in the driver and not changed until a subsquent patch later in this
series. Would it be better to hold this change untill then?

> 
>>       main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>>
>>       if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
>> @@ -853,18 +854,18 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>               }
>>       }
>>
>> -     parent_hws[0] = md_slck_hw;
>> -     parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
>> -     parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
>> -     parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
>> +     parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);
> 
> AT91_CLK_PD_NAME(md_slck_name);
> 
> Same sama7d65, sama7g5.
> 


