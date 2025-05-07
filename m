Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C30FC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+10a6Fl3SYk8s9AOlehRcxdun4zG4/gdUlq2lQ15FrQ=; b=K8KoCjX0C7/8ZkZra4DUB5JGij
	JODOJjglHgNhPGXByAwuGzUHcHCxuEBK79h1O/kitkuVb6VaywCn1Yio1ByQu2dYa8AMzcQzvk1xv
	0VbGT9ZhHzwOxyD9fuMYHoKI1UBicLb96uJ12BKFB+cb38+v4les3U8t4Ye9VR+WMznzwT/68bcal
	Q7/D+Y0meSJkrh6ylIopwVOoWaMjXvP8ElmsCQPU0+8akLtalx+76K1f/gvC39TgbTPBYxm4Hj0H+
	/a1NqiUikYsqgicc6FANcKlBor2SVUjlGESS9XIAr0/5zC31FjKChAvAPqjt4JXf1qF6p2X5ECYOe
	a+HUt0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbEn-0000000EzYI-0OqI;
	Wed, 07 May 2025 09:38:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaSn-0000000Eolv-0qHQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:49:14 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so942788666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746607751; x=1747212551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+10a6Fl3SYk8s9AOlehRcxdun4zG4/gdUlq2lQ15FrQ=;
        b=nbPT1qMj1UCcRcQkVxafO7G9VUF9iOkAY6q4Hm+QtBYFK60PTLlKG7kD6ljJ9LrbxG
         s6I+bj0FjGZ6X+xEzIZDtssjKSenpEyL1XlxDpaBnHxc8KaKFw7xxP2NNk/RkCs1APYa
         +TwaqD2ry3NktPctw9keIB9kaU1OY3Psq3scjD7liPbkJtZTwGj7MVt30loEP/95uDRW
         eiw3r9R594VMwJ3qE9CoMQSQVX5PST9R46KvL19qSvUS6UQqTz+Fw2RhytP/wyJGQQl3
         pIcQ3F5kwPCWLkPlP95s6qScZj0fj03wCOdHz0iZ7n5OuIdszz/aXwDNpMynUVNYzbqP
         amLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607751; x=1747212551;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+10a6Fl3SYk8s9AOlehRcxdun4zG4/gdUlq2lQ15FrQ=;
        b=We6MEzt+ifKW5yx3AqqcMHuWNVwkjpgIETbb22mEMxRJ8w8aBvdfPPKAm3eyGyJi34
         bCtEF8elN4nPMNFZFD/Tdm2xmDKE4a53hnxDXhDSKhUsLxBJf9vcJ2FKdVDo0qwuNpO+
         ScNIQWDZYfzRinp8ntUJC6debMEoqFS8/shtKb2rjQRx1B+dPojFz+Fl3l5vls8BaGbh
         e3zBwSlNayUHJz2kxIoaU202f+ygcF1cwp5sxcXgtTItY5gX4f9VtmrXzSM8eWDb6vcH
         YPa9GZxKExMNiAylhlccKqclsSZsqlyJFXwsEsNt27G1QY1QBzZx5am18a77KaXNFjMS
         kxrA==
X-Forwarded-Encrypted: i=1; AJvYcCV8I8H77YEFo22uYWwdWoBR5J2tasNSCtEwS0SfB+5xFncwl92gj0SGDE4BZyAFebya6Me9A2KV4pKD8El6El0M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4fJRc0OZ32fYhlI5dCujI51X+B/CdchLG0L4Y2UEPUEgqGLLJ
	TgoBEeRzabf2IpCnfs64UK2uPTP1a+q8cxD9pvk7zjQ1ocXxxNd/
X-Gm-Gg: ASbGncsZYoYBB/iu7haJr8p3Ej+8+q8MDj3HWNqb0BtA7pH1OdSn4EzecJDwmC2nIKV
	jruTtAJTCJBzQC3hiXkZJdo000WU8BfZnm9PJ8PtSd3Lfsi/3QAj5FVsotkXQXClaRJk6XFsz9p
	+96y7vEcpzp+feE0IYtThJHPVcw+0BtuiVt/WN/1X0XsoNb2OFNQ12oKNZpJPGvaYO9ZB6ZvORN
	k5P6sScOO+VgNkng/K/u5Ny9yFS3wzHTcWs6plTXWItlHTMwffJosGxHKil6VoTo4lHPx6QcRFn
	ABpoG2L1BEkLzTrHmEcHLQhwcNyhE1O20+JKySeGtgSnmw==
X-Google-Smtp-Source: AGHT+IH7l4ECxJMJdvAnFGxq4javtpxMVIOqZQGVLLZY3qh4kIT2AXvmCFtcH3BzW9LSfh6TllvpTg==
X-Received: by 2002:a17:907:86a4:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-ad1e8cacfb8mr222839866b.8.1746607751184;
        Wed, 07 May 2025 01:49:11 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147431sm869699666b.8.2025.05.07.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:49:10 -0700 (PDT)
Message-ID: <c56d03cb-14a4-4a7f-82e7-80368c3ca4ec@gmail.com>
Date: Wed, 7 May 2025 11:49:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
 <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
 <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
 <29eea52b-a512-4948-b4e0-e6d19d09ded4@videtronic.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <29eea52b-a512-4948-b4e0-e6d19d09ded4@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_014913_244860_5BB6C4C5 
X-CRM114-Status: GOOD (  29.05  )
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



On 5/7/25 10:28 AM, Jakub Kostiw wrote:
>> Can you revert the change you made to polarity_on_physical_lanes, and
>> try the following?
>>
>> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/ 
>> media/i2c/maxim-serdes/max9296a.c
>> index f48f5b68a750..dea0518fd790 100644
>> --- a/drivers/media/i2c/maxim-serdes/max9296a.c
>> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
>> @@ -474,7 +474,7 @@ static int max9296a_init_phy(struct max_des *des, 
>> struct max_des_phy *phy)
>>                  */
>>
>>                 if (priv->info->polarity_on_physical_lanes)
>> -                       map = phy->mipi.data_lanes[i];
>> +                       map = phy->mipi.data_lanes[i] - 1;
>>                 else
>>                         map = i;
>>
>> data_lanes is 1-based (since 0 is the clock lane), but the bits
>> in register 0x335 start from 0. That means we should adjust the
>> values in data_lanes to be 0-based. 
> 
> I have applied your patch and polarity settings seems to be correct now 
> (based on register contents).
> However, I have came across another issue.
> When I was debugging the driver for MAX96714, before I found out that 
> the issue was with polarity settings, I have commented out calls to 
> MAX9296A_DPLL_0. Probably because I thought it was there by mistake. I 
> totally forgot about that change.
> Before applying your patch I reverted any changes to the driver, so 
> MAX9296A_DPLL_0 writes were back again. Sadly, video stream did not 
> work. So I began to wonder, and just for sake of testing, commented 
> these calls again (added some logs for quick tracing purposes):
> 
> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/ 
> i2c/maxim-serdes/max9296a.c
> index f48f5b68a..b24a8e2d6 100644
> --- a/drivers/media/i2c/maxim-serdes/max9296a.c
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
> @@ -391,6 +391,8 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>           * PHY1 Lane 1 = D3
>           */
> 
> +       dev_info(priv->dev, "Using  %d lanes", num_data_lanes);
> +
>          /* Configure a lane count. */
>          ret = regmap_update_bits(priv->regmap, 
> MAX9296A_MIPI_TX10(hw_index),
>                                   MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
> @@ -474,7 +476,7 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                   */
> 
>                  if (priv->info->polarity_on_physical_lanes)
> -                       map = phy->mipi.data_lanes[i];
> +                       map = phy->mipi.data_lanes[i] - 1;
>                  else
>                          map = i;
> 
> @@ -484,6 +486,9 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>          if (phy->index == 0 && priv->info->phy0_lanes_0_1_on_second_phy)
>                  val = ((val & 0x3) << 2) | ((val >> 2) & 0x3);
> 
> +       dev_info(priv->dev, "Val for MIPI_PHY5 (0_1): %lx", 
> FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1, val));
> +       dev_info(priv->dev, "Val for MIPI_PHY5 (2_3): %lx", 
> FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3, val >> 2));
> +
>          ret = regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
> MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1 |
> MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3,
> @@ -499,10 +504,10 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                  return ret;
> 
>          /* Put DPLL block into reset. */
> -       ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
> - MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> -       if (ret)
> -               return ret;
> +       //ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
> +       // MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> +       //if (ret)
> +       //      return ret;
> 
>          /* Set DPLL frequency. */
>          ret = regmap_update_bits(priv->regmap, MAX9296A_BACKTOP22(index),
> @@ -519,10 +524,10 @@ static int max9296a_init_phy(struct max_des *des, 
> struct max_des_phy *phy)
>                  return ret;
> 
>          /* Pull DPLL block out of reset. */
> -       ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
> -                             MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> -       if (ret)
> -               return ret;
> +       //ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
> +       //                    MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
> +       //if (ret)
> +       //      return ret;
> 
>          if (dpll_freq > 1500000000ull) {
>                  /* Enable initial deskew with 2 x 32k UI. */
> 
> To my surprise it works this way. I tested this 2 times back and forth. 
> Can these calls really cause some issues?


Can you revert your changes and try this?

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
index dea0518fd790..3bb80fe42a22 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -519,7 +519,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
  		return ret;

  	/* Pull DPLL block out of reset. */
-	ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
+	ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(hw_index),
  			      MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
  	if (ret)
  		return ret;



