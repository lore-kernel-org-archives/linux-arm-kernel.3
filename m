Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2C9C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTh0CGXf1duodH7Vg1jGFN20jCRGHw3XwR7ImqQDpiA=; b=EMwkua77dy8gaMHFugfoEri4S1
	6D+BWoOU4kxk4/0hBvwbLZtajJbkNy8krEh/8VDp519X9dzgSAugZ1Fw9APNl6lmpKVM0hja8sRXI
	e3+oMCfIJ4zxLop4uXwPamDoZ7YNlu0D+/D7coGw0/mTJdrjAYJVlcipiCKHInlFiN9INzaFOq+jg
	ur9Um+PuF2fBTpzRbHlpCdBvE6OjcT5vd9Zm5PQ8iU0KhjADmUX9YlWoCWLAFS4kTMZ6QGrB/sPOu
	53jC4Oi3j+VyWkXgJKg7qepqrcAgy0aC4I5Ho51GhL4tWR5Te8sxmQcwJ8si+kbGxLat6YW/xQR/S
	UuWSqjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDn4-00000000Lst-1JEh;
	Sun, 09 Mar 2025 10:21:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDgu-00000000L7J-3BWV;
	Sun, 09 Mar 2025 10:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741515327;
	bh=oZ8C4AaMiVHmMJORqt5AWEOKtdlWfOlHyHmfVChKc1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kt31JYZ9VhyffLJqINjL3ma4HlprQIzm1kXb5xwSrKVixrFY0S4xQ46uHwyyy7zrj
	 VDS/ABfcbF+SNYC0XnIuKcJwsZw0XeJDxuCS7btaTr7aHwHsGT933/P5x9YbOY83lB
	 6296esN7JZGKt7Nw2o1lkH8nkokaCX3hgc+NHZmDpOTASAdqXhrKfAIKKtly8Ro/pB
	 s7MU3+r3qrEexwgh0MUc1g9M8Y3lDtY4VnRhvvCqs45Ya0zOyqzDmbLVYsiSKgVfy1
	 vt+eY2fQRXJuaJ7CnlGe+RAjhzQKUlymDVizx3or2loibSl6MJtpaLGy26SsIwhXne
	 dPGcN1kMJAHgw==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A925017E0B25;
	Sun,  9 Mar 2025 11:15:26 +0100 (CET)
Message-ID: <6caefe9f-1b15-41c1-94f2-9a2a92aeec67@collabora.com>
Date: Sun, 9 Mar 2025 12:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] phy: rockchip: samsung-hdptx: Setup TMDS char
 rate via phy_configure_opts_hdmi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-8-35087287f9d1@collabora.com>
 <CAA8EJpoGu4Tq-wt09Jj+b+=eJ3dNXhPWVOg4DyCQxrJbFNFfYw@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAA8EJpoGu4Tq-wt09Jj+b+=eJ3dNXhPWVOg4DyCQxrJbFNFfYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031528_954351_6247C96E 
X-CRM114-Status: GOOD (  17.32  )
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

On 3/9/25 11:26 AM, Dmitry Baryshkov wrote:
> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> The current workaround to setup the TMDS character rate relies on the
>> unconventional usage of phy_set_bus_width().
>>
>> Make use of the recently introduced HDMI PHY configuration API to
>> properly handle the setup.  The workaround will be dropped as soon as
>> the switch has been completed on both ends.
>>
>> Rename rk_hdptx_phy_verify_config() to rk_hdptx_phy_verify_dp_config()
>> and introduce the rk_hdptx_phy_verify_hdmi_config() helper to check the
>> HDMI parameters during phy_configure().
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 64 +++++++++++++++++------
>>  1 file changed, 47 insertions(+), 17 deletions(-)
>>
> 
>> @@ -1469,8 +1474,27 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>>         return rk_hdptx_phy_consumer_put(hdptx, false);
>>  }
>>
>> -static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
>> -                                     struct phy_configure_opts_dp *dp)
>> +static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
>> +                                          struct phy_configure_opts_hdmi *hdmi)
>> +{
>> +       int i;
>> +
>> +       if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
>> +               return -EINVAL;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
>> +               if (hdmi->tmds_char_rate == ropll_tmds_cfg[i].rate)
>> +                       break;
> 
> return 0;
> 
>> +
>> +       if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
> 
> Then you can drop the first clause in the if

Sure, will do!

Thanks,
Cristian

