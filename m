Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BF5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmgZUcmDeAwsJ+f00H+1LiMNmyVriymxhiX1Ppt7gHI=; b=X9FaG9ve0ywcFRXA8dT5zlB5E6
	4Hfd/F+2xpgmzFPJeIaStJBb0dF7sjrKz1dAu9ShKe58XuhFAdwMA2W7Lp0YXJWGo+bNPzEqO5EQs
	MdpdCnfaTG/AeMa6/T8on0++umXlzP5q+wZoZLWe9MQm104caIOKFIvO5o39wFzQ+Z/UjOSyeTdbW
	BNInBM+VOGQvYisQFLbGMTDU4MlhlR1qiOI19NjnY1Uy8Eio6AtfQFofPSRu91g+PK97gSQMxfxes
	lgMSrma8Vp8ZDdQM7nNTTAv6C3o7i9bgkO9LbuIVprKtcVjom+T6NG0tgo+844Y7q5y6/zLVUkfnW
	zfFGqkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjzM-0000000AFUG-4AYM;
	Mon, 23 Dec 2024 15:04:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjyB-0000000AFM7-1tLw;
	Mon, 23 Dec 2024 15:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734966220;
	bh=9Uk4DZGoZgt9jIhyWCEgTSIsBhoNfzlfz6+xrGe7MSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HNc46ApHwR3QSB4UFbizcKOsz1Xw4oJsAmICm5n4kGOlLL/OXztNUVL4ndZWkm5Yy
	 nHRHuY2GvgHbWDgUjKzuf23CYfFnuwbuW7MMpETvm/82pENy6Tk58GtTv1i9Sm/GW8
	 4q1Ki/caz610ZdaNv8y51Bz5fK7gNpKQ72WlxUTuXbqgOtGn7hqi987C8P3ueeNLJN
	 tnVyJtKek3bV0rmzESnWcmSQFPa39SBsJY/g3DksSbTwFbqbn58mANvSdkBE5PvuyG
	 a9UqBawMpZbT+wBI5LeycYh7tc4lH1AZ7AU5YUS+ahnSdDJbZSJcGPP1AImkORCdmv
	 xjexlN++t6Ndg==
Received: from [192.168.1.90] (unknown [84.232.140.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78ABD17E0E2C;
	Mon, 23 Dec 2024 16:03:39 +0100 (CET)
Message-ID: <cbd16df2-4f94-4f66-a00d-e9e972390905@collabora.com>
Date: Mon, 23 Dec 2024 17:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] PCI: exynos: Switch to
 devm_clk_bulk_get_all_enabled()
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
 <20241217-clk_bulk_ena_fix-v5-2-aafbbb245155@collabora.com>
 <19eca5c3-cedb-4c5f-9b70-9c25c8387414@collabora.com>
 <20241223141806.GA1864738@rocinante>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20241223141806.GA1864738@rocinante>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_070343_690003_FF1F5AA3 
X-CRM114-Status: GOOD (  10.03  )
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

On 12/23/24 4:18 PM, Krzysztof Wilczyński wrote:
> Hello,
> 
>>> The helper devm_clk_bulk_get_all_enable() missed to return the number of
>>> clocks stored in the clk_bulk_data table referenced by the clks
>>> argument and, therefore, will be dropped.
>>>
>>> Use the newly introduced devm_clk_bulk_get_all_enabled() variant
>>> instead, which is consistent with devm_clk_bulk_get_all() in terms of
>>> the returned value:
>>>
>>>  > 0 if one or more clocks have been stored
>>>  = 0 if there are no clocks
>>>  < 0 if an error occurred
>>>
>>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>
>> In case you missed the previous requests, we need your ack on this patch
>> so that Stephen can apply the entire series to the clk tree and drop the
>> obsolete helper.
> 
> Please, take the following:
> 
>   Acked-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
> 
> Should be sufficient.
> 
> Also, sorry for keeping you both waiting.

Thanks Krzysztof, no worries!

Regards,
Cristian

