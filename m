Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DBBC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=; b=PAMQ9pxjhgAEzJNKrf4Vazqrzd
	ofraZCCJtNAJGNHSo7KYyH7+kAzQV+Mw6t2rEX6rFfjybUB0RxQN5N9U4OwvhsDzKrT+PZ/dD1Kia
	sMDnq5weACTChFzHGpRceFU6HXX1AGEk4Jy66IueGcE/KS9mYjZ2FiEOZ+E98l78tWTy1RCWOI7qX
	s/cbYPIyzCsQRl+0P7G/iZO9erO66oBUIaNKrfdoQ9xY5MXT1E28stXyOIaHd/hO2+gqq+I0NNhES
	0Z7fLmu0sWP3gGM6VxfVAQyHJPsJLenG3LimvMPfHZpzJKi2P+tmZnyMjohapPNruXXSfa7ALu7Wl
	ip+UEW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaT-0000000DuTQ-25sU;
	Wed, 07 May 2025 02:32:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNYA-0000000DBEC-2Vor
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:01:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so9183178a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746558112; x=1747162912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=;
        b=DURqRlfvoFfz6otgdPVzHQlLq+KeA5GvE2Bvhd6way59l/BlnDf1ChpMvUMR4Yslpc
         PJiaN8wGEJs64jkMFUsVMKQ6n4jYvRoNE1n/rOfA8VkPw1EHxK5DZnStXBbu8BgHYV2o
         0Gqr/mnv5NVgwG82Y9THj2W9hNMXd5QJ8Mme++cyftH6xYH3AyMfF66vSqhQs/zLJ8Ch
         HAIyH1D34x3B4joETFu3jczwuhoGthgilrpnYHwBIlxoM98qsxydiyP29Ip68oaDDwn8
         5QqsHRyErNnB8BnJCYRraz5X/V1Pd3CmUC2ZmcUmCoW/4dRi1qPF7bfcEamO8Z+pg345
         kJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746558112; x=1747162912;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=;
        b=M6iF313uhCIgQUCKJo/W1dOrB7SfaJgbWHi0Rc71Fmx8P4dQRtfNA+k4ijBmzlaubI
         6Og29MiINxXgQkimkiHIFaPFY+3MiXNT+1WRj0+35JC152LqjVnKHv9aWqqlN5aWPy4e
         4LU9yC6Tdlj4zAMhCQiFPuk1/Uanv6pmMKTx+qhe6HlzMlMTQ4/7yycJd4mGVka4VclQ
         CyNAIQrwS29qslxWeu6C/cpJ7DC0UIO80CvIxhEOkeztC/yubNGOBJnI7DLQkhwapCfv
         WxjaHlUdDHTBJhMGyQO8S7QT+B0j1ud+q6v3nFPCrQd7TwjuoBwdnucOx24Kf05ks75F
         SXgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmK0xoggBoze1r5aewJMuE7DxlQNg4gOfkfvJb/pfif6m/YAqbmaoYJEQodebfQzEP2LHm3PFjBhocssV7Ieyj@lists.infradead.org
X-Gm-Message-State: AOJu0YxS+mZFQBJJnVYOvbPD/LrNWL1/t5cXVmekJHXo38XSEe5ztjko
	0DrANoJjQVj2Yz/kfnp4toLbAGkDNY4cyzSWJtYM4pAvarSe03k0
X-Gm-Gg: ASbGnctTBqfaKrw2RaGmO3WCVoND02Z2xYVP17BAWK626VHVge8jrdxvyA0FEPcjnJq
	xCudb3o/zTcIxnQm59umx8rZpvvFV24CFruXWQ+RiQbsgjbidprAgg1o0xF5DObkFYyxsj9yFGN
	cK5s9SYGk5sT+FqcFsjY4/thk//MHAhpDdE9LYWIU70JGWJ1SDXhwY3guuDTFsYJPzyi37ZwiGq
	0DmsL9bZut2S8OyJNBFumzrjZcMSQyZ0jRw4zaTARIaLT7Q/EqZJtPCxAauz4KWUyARyX2gWHLk
	3eliKqwblu9WlcFs2G6/LHLBQyx4+xzKXe62j5RwUUy+lQ==
X-Google-Smtp-Source: AGHT+IFWEXs3lgGVsw8JtDGd7ANyYp0zdsacD9hO6mvpw5fW/FuafssUE5pgzZvlYTNbTtqLhfLFDw==
X-Received: by 2002:a17:907:1b05:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1e8c662f9mr60826966b.33.1746558112095;
        Tue, 06 May 2025 12:01:52 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895087d1sm752900066b.128.2025.05.06.12.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:01:51 -0700 (PDT)
Message-ID: <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
Date: Tue, 6 May 2025 22:01:46 +0300
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
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_120154_638434_E98BB2EA 
X-CRM114-Status: GOOD (  31.11  )
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



On 5/6/25 9:33 PM, Jakub Kostiw wrote:
> Hi Cosmin
> 
> Awesome work. The initiative to establish a common framework for GMSL 
> devices is a great idea.
> 

Hi! Thanks for the feedback.

> I believe that we have found few bugs:
> 
>> +#define MAX9296A_BACKTOP22(x)            (0x31d * (x) * 0x3)
> 
> The first multiplication is wrong and should be replaced with addition:
> 
> +#define MAX9296A_BACKTOP22(x)            (0x31d + (x) * 0x3)
> 

I'm aware of this issue and had it fixed locally, just haven't submitted
a new version yet.

> The same goes for MAX96724 equivalent macro:
> 
>> +#define MAX96724_BACKTOP22(x)            (0x415 * (x) * 0x3)
> 

Although I haven't noticed that it applied to MAX96724 too, thanks.

> In MAX96714 driver there is an issue with setting up lane-polarities.
> 
>> +static const struct max9296a_chip_info max96714_info = {
>> +    .max_register = 0x5011,
>> +    .set_pipe_stream_id = max96714_set_pipe_stream_id,
>> +    .set_pipe_enable = max96714_set_pipe_enable,
>> +    .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
>> +    .phys_configs = {
>> +        .num_configs = ARRAY_SIZE(max96714_phys_configs),
>> +        .configs = max96714_phys_configs,
>> +    },
>> +    .polarity_on_physical_lanes = true,
>> +    .supports_phy_log = true,
>> +    .adjust_rlms = true,
>> +    .num_pipes = 1,
>> +    .pipe_hw_ids = { 1 },
>> +    .num_phys = 1,
>> +    .phy_hw_ids = { 1 },
>> +    .num_links = 1,
>> +};
> 
> In order to make thing work we had to set
> 
>> +    .polarity_on_physical_lanes = true,
> 
> To false. So this field is either improperly set for MAX96714, or 
> handling of this case is wrong:
> 
>> +        if (priv->info->polarity_on_physical_lanes)
>> +            map = phy->mipi.data_lanes[i];
>> +        else
>> +            map = i;
> 

MAX96714 has different value meanings for the polarity register
(compared to MAX9296A). On MAX96714, the bits represent the
polarity of the hardware lane (not taking mapping into account).
On MAX9296A, mapping is taken into account by hardware, so
the polarity can be retrieved directly. See the comments surrounding
that piece of code. It's entirely possible that I was wrong when
writing this code, but this was cross-checked with the datasheet
and the GMSL SerDes GUI. It's not out of the question that any of
these could be wrong.

Are you setting a specific polarity on the lanes? I've validated
MAX96714 (after the upstream submission) myself and it works.

> Upon mentioned changes we have successfully tested two GMSL2 
> combinations on Raspberry 5 platform:
> 
> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to 
> hardware limitations)
> 
> 2. MAX96714 + MAX96717
> 
> We have also been wondering about these registers:
> 
>> +#define MAX9296A_DPLL_0(x)            (0x1c00 + ((x) == 0 ? 1 : 2) * 
>> 0x100)
>> +#define MAX96724_DPLL_0(x)            (0x1c00 + (x) * 0x100)
> 
> There are writes to these addresses but we could not find any reference 
> to these in either MAX96714 or MAX96724 datasheets.
> 

These registers are not mentioned in the datasheet of MAX96714 or
MAX96724, as they're considered "hidden". You can look at MAX96716A
datasheet for a description.

> Are You willing to add support for mapping MIPI-CSI2 lanes? This is a 
> very convenient feature which comes in handy during HW design.
> 

This should already be implemented by using different numbers in
data-lanes property in devicetree.


