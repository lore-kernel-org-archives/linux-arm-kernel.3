Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C228CF0181A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bd07phBtVSlJrsowhl6WGQ1wMUC+9E2jORlCgRImICw=; b=rYp9mlQVOHDuCM+lvvrvAwK8v5
	bBzpnizJKEvZBkQG/ch+yITzqw3+5MP21+K/WKUPRuhR0piXNjwGZ0pkfpZdoRnluTRGFr8dn/1pE
	ZYa0fytsOgl5q75kUUls1JBOGTaF2DwpOZv9vnvj9di9jdgDAM/tveBxQH8fKRLKREx/wuE4Ipdsc
	aSucucqQR73fl3EAusd3IZnRYleaYuLJnC8s2obPnPHE5Mk0FUx/dLISaJ5tHr/qg0y6g8BOD7tt3
	MS4CdfSIYQkrl6Zw/5tCyFfMttsZ+waxYXdAY60O90mx+5qOtIh4e9BOpRV1le4A7LmFpnpWIi75o
	SXDMiqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRpQ-00000003NZZ-1GsQ;
	Fri, 06 Mar 2026 09:50:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRpN-00000003NYH-3gbv;
	Fri, 06 Mar 2026 09:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772790632;
	bh=eOh2DPmGNAcPMGrAcM6Rp0B3989BodaM6vMWb9GBktU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A9deMTUMmsKTLdIGI2+lwnuVwIRxkyPIFLGsjQiLFqzgLl3Fw+PKU/4m3zisOF1h3
	 0P3orfcOAMx2hgSnwVfkyx0MZ3XLoeJw7VpstjRYYcas37JbjtiPQOL3zdWmiOL/aV
	 TzVdE4nhrVDnPwX5KU/Kw5yiAumr+tR9U+cHNTxoHYkLdbomew0kaJ+PEeM+TZ6BQ3
	 tcMszmQfnFdIqhNvessUzqlTCctpb2afvVovJMc13f8Ku+SrJc6ENjs+vzBtS1ANkC
	 tcl1YvU/1OOuYFfRKPXlhgNFHawxbag1D8uk2kWgEnWahDlAcptyEVDKF/cn4EQnYf
	 xZoaTIZ9L8V8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E1C817E04DC;
	Fri,  6 Mar 2026 10:50:32 +0100 (CET)
Message-ID: <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
Date: Fri, 6 Mar 2026 10:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Ulf Hansson <ulf.hansson@linaro.org>, Adam Ford <aford173@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260210053708.17239-1-aford173@gmail.com>
 <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_015038_082160_29FCB210 
X-CRM114-Status: GOOD (  21.12  )
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

Il 12/02/26 12:34, Ulf Hansson ha scritto:
> On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
>>
>> The wrong value of the number of domains is wrong which leads to
>> failures when trying to enumerate nested power domains.
>>
>>   PM: genpd_xlate_onecell: invalid domain index 0
>>   PM: genpd_xlate_onecell: invalid domain index 1
>>   PM: genpd_xlate_onecell: invalid domain index 3
>>   PM: genpd_xlate_onecell: invalid domain index 4
>>   PM: genpd_xlate_onecell: invalid domain index 5
>>   PM: genpd_xlate_onecell: invalid domain index 13
>>   PM: genpd_xlate_onecell: invalid domain index 14
>>
>> Attempts to use these power domains fail, so fix this by
>> using the correct value of calculated power domains.
>>
>> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> We should have a fixes tag for this too I think:
> 
> Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
> Voter power domains")
> 
> 
>> ---
>>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> index 58648f4f689b..d2b8d0332951 100644
>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
>>          scpsys->soc_data = soc;
>>
>>          scpsys->pd_data.domains = scpsys->domains;
>> -       scpsys->pd_data.num_domains = soc->num_domains;
>> +       scpsys->pd_data.num_domains = num_domains;
> 
> Not sure this is the complete fix, as scpsys_add_one_domain() seems to
> be using the wrong value of "num_domains" too, no?
> 

No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
which is expected. Maybe that can be improved, but it's how it is supposed to work.

So yeah, this patch is resolving an issue, and it is a complete fix.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>>          parent = dev->parent;
>>          if (!parent) {
>> --
>> 2.51.0
>>
> 
> Kind regards
> Uffe


