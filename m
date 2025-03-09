Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C41C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ypAH85lunbMFr5sJoDjhg+hTSX65qaGeJy9UvYRWBw=; b=4CcUXcQi1BWM5EdPhgQwhW3EAW
	KPz0LN/MsaAm/n9Tgz+ldSMxtwL3lYIqC0YanDDCa1ENzfnpErW2S5vxpK3R8nTRQtM6Gu85u4JWa
	Vpo7kwcRCXyeIhgiIaUKi7gotQBDm7Th7qNx/KEHisXj0+chC3LRrvl/msuvWj/1wOVt8tfTMiUrJ
	uJMJRIoGLZLzeCKoDKm8wgtRBdGFJ8n39k5UZruQanUTu5c2p3G3p8k9KKYDXgUHojk8qvRE6d1zk
	IXv+ywdPKm+ze/DlZRnjEfIxMqCUkt3NBvP+b5s0zB6tx6rEa7bEylH9PEMnfJP5VweD2Hfre8GmT
	L8RO64EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDjr-00000000LTO-3BAB;
	Sun, 09 Mar 2025 10:18:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDf6-00000000KuK-3SmV;
	Sun, 09 Mar 2025 10:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741515214;
	bh=4qaz6XaD49AJMpmMPzIuiS7AdroFjhN6pXZs+GE9Vhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lNe3Pv8oxWsM6LLhxuFDHI6zO4Orf8PIT//QurDx9/0FlEgjSNBN8kcgOPqDuq8Vl
	 pp4wlS86+wUkDe51Ln4RTiH7ADY8kDnn38VBQ/9VFDgpDEGa4yuWipSx9/P0lizrcg
	 /6/G9vzPksu0QjYMPykxEi1y4VAnz0gfJt/K2TXertf+LJ1qAt6g7lcFZIih+tJAjj
	 O9xyDAozOGqqL2YC30MUNxa5N9Vxkndtc+SdSxtL5NetLZeJ0dItIgJEOeUmfQvkNJ
	 1vQ27Gsw1Ydqaa76p3zrhEFGlhQqVjVXFjeIUXx+g/VgtRwQYieAzd87bd8kkvdXCI
	 1R3UGDrgdmVRw==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B636A17E0B25;
	Sun,  9 Mar 2025 11:13:33 +0100 (CET)
Message-ID: <a1a3e86a-1906-4797-932d-8e1aadafedde@collabora.com>
Date: Sun, 9 Mar 2025 12:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] phy: rockchip: samsung-hdptx: Avoid Hz<->hHz
 unit conversion overhead
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-7-35087287f9d1@collabora.com>
 <CAA8EJpoQbvFbNXQ2RB1qY2gHnwZaU-PT-DMLnZkrxkqs2wkXqQ@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpoQbvFbNXQ2RB1qY2gHnwZaU-PT-DMLnZkrxkqs2wkXqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031337_049825_C8051B11 
X-CRM114-Status: GOOD (  14.70  )
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

On 3/9/25 11:22 AM, Dmitry Baryshkov wrote:
> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> The ropll_tmds_cfg table used to identify the configuration params for
>> the supported rates expects the search key, i.e. bit_rate member of
>> struct ropll_config, to be provided in hHz rather than Hz (1 hHz = 100
>> Hz).  This requires multiple conversions between these units being
>> performed at runtime.
>>
>> Improve implementation clarity and efficiency by consistently using the
>> Hz unit throughout driver's internal data structures and functions.
>> Also rename the rather misleading struct member.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 79 +++++++++++------------
>>  1 file changed, 39 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 2bf525514c1991a1299265d12e1e85f66333c604..e58a01bdb3ce82d66acdcb02c06de2816288b574 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -330,7 +330,7 @@ enum dp_link_rate {
>>  };
>>
>>  struct ropll_config {
>> -       u32 bit_rate;
>> +       u32 rate;
> 
> unsigned long long, please, to match the tmds_char_rate type.
> 
>>         u8 pms_mdiv;
>>         u8 pms_mdiv_afc;
>>         u8 pms_pdiv;
>> @@ -410,45 +410,45 @@ struct rk_hdptx_phy {
>>  };
>>
>>  static const struct ropll_config ropll_tmds_cfg[] = {
>> -       { 5940000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>> +       { 594000000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
> 
> Use ULL suffix
> 
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 3712500, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>> +       { 371250000, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 2970000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>> +       { 297000000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1620000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
>> +       { 162000000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
>>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1856250, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>> +       { 185625000, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1540000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
>> +       { 154000000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1485000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
>> +       { 148500000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
>>           0x10, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1462500, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
>> +       { 146250000, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
>>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1190000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
>> +       { 119000000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
>>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1065000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
>> +       { 106500000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
>>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 1080000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>> +       { 108000000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 855000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
>> +       { 85500000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 835000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
>> +       { 83500000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 928125, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>> +       { 92812500, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 742500, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>> +       { 74250000, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>> +       { 65000000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>>           1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>> +       { 33750000, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>>           1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>> +       { 40000000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 270000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>> +       { 27000000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>>           0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> -       { 251750, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
>> +       { 25175000, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
>>           1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>  };
>>
>> @@ -894,10 +894,10 @@ static void rk_hdptx_phy_disable(struct rk_hdptx_phy *hdptx)
>>         regmap_write(hdptx->grf, GRF_HDPTX_CON0, val);
>>  }
>>
>> -static bool rk_hdptx_phy_clk_pll_calc(unsigned int data_rate,
>> +static bool rk_hdptx_phy_clk_pll_calc(unsigned long rate,
> 
> here and further, unsigned long long
> Also, is it tmds_char_rate?

Yes, will do the suggested changes in v6.

Thanks,
Cristian

