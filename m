Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52263C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMnVKEeUpMj1/oLWqzycRfePjsua/6mSkJtKt6Ux614=; b=JQXYTde0m77THs8NlwrUFqeJ6V
	XIxMEQEypW2ffQYTksd5nL+jZC3Huw7gO3N+um1mwZS+nkxzY9jVEgYdUFLwSze4TvByqagZ0Go2H
	U1zInuxUEz1BGuML+Q82EoypRl25V6/i9l9Pqyh/p4qZUsw2btnNO3cNzD4KUHDoqSygHyNw8sqdj
	IR3WZTxW2hACtWasyjNQM3icQPlrQdgQWg7unjG6IpZk1bkTMEsmMUIK+D5o8RnM1koqhvzq2TGsn
	hPzWN3SYrhnxwaojREGYhguFCQYr+K7LOpb3jIThPKVbVM2sw2LdWxtHM/YdwxieXaZx5FYstboC8
	5bX1VbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRJD-00000004cUu-1jQh;
	Tue, 04 Mar 2025 12:23:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRG2-00000004c5P-4A28;
	Tue, 04 Mar 2025 12:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741090821;
	bh=PUBEhxWckZa+nMU3VKaHI27uqQbQR5AaVBf7PjPU6tE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NmRVOV/xONIj5eHdISMlWCxuRIK24rWjtoMvWosf2uKorM4q3XE9Ra1osDQbdKEj8
	 QBE8WZ5Rv6zcpjxfbcklLn01z4tMsBJz2L0WlcZc6o9n4BACYWHiOYCeEfTh1MLSQG
	 c3TB4Cl/CHtTAn0aF1rjXhf5cceZLUsSSSK0jZ85uuhhCgQPUgl1aniuCHyhes0upn
	 CD1q5CnHeMntxl15d1wQcRMsgqa3nRSgsZ/jUHUzunHeyDGNdAlV+l//85TuNDMv56
	 sOveCklQ/dQEHKUFEHqfdWrAOb7ZPJDYpOin+UoCO2Im+HyKYIWeLE8nIc8ysIhRkv
	 IFUsSIZhI4w+Q==
Received: from [192.168.1.90] (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B85C517E068F;
	Tue,  4 Mar 2025 13:20:20 +0100 (CET)
Message-ID: <bee17643-e0b4-467b-a632-06f91ac7fc3a@collabora.com>
Date: Tue, 4 Mar 2025 14:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] phy: rockchip: samsung-hdptx: Provide config
 params validation support
To: Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
 <20250304-phy-sam-hdptx-bpc-v4-8-8657847c13f7@collabora.com>
 <20250304-romantic-truthful-sambar-deaab1@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-romantic-truthful-sambar-deaab1@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_042023_178572_AC3F2D5C 
X-CRM114-Status: GOOD (  15.15  )
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

On 3/4/25 10:18 AM, Maxime Ripard wrote:
> On Tue, Mar 04, 2025 at 03:44:07AM +0200, Cristian Ciocaltea wrote:
>> Implement the phy_ops.validate() callback to allow checking the PHY
>> configuration parameters without actually applying them.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 7e1d1c10758249aa5bbddbdaae0108bba04f30df..47db1395051f5d900197871694bab90ca4d6e38e 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -1482,6 +1482,17 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
>>  	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
>>  		return -EINVAL;
>>  
>> +	u32 bit_rate = hdmi->tmds_char_rate / 100;
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
>> +		if (bit_rate == ropll_tmds_cfg[i].bit_rate)
>> +			break;
>> +
>> +	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
>> +	    !rk_hdptx_phy_clk_pll_calc(bit_rate, NULL))
>> +		return -EINVAL;
> 
> What are you calling bit_rate here? If anything, I'd expect the bit_rate
> to be a multiple of the char rate, not a divisor.

This is just an unfortunate naming of the search key in struct
ropll_config, inherited from downstream, given in hHz rather than Hz.
I've already renamed it in the last patch, while getting rid of those
annoying unit conversions.

