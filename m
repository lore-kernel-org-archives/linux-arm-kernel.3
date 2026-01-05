Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB8C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8DuddcYEOiefRlBzZKrtL15qZCqx9WVAFvprpXIUBQ=; b=AkqMrY3+BgZCVIVUJkfRfRO5WU
	SQL5haZCqDQ8RxgeL9YI8OBDW8SpYbRPk8kOsrH4sG75zEKYCx3Ca32dzPNnVqu2BwswdXeQYywlb
	hDuiifOLAkwZkjKYbxVA/Y3AjDwIJz5/nd66MdkVVSosM69nhLgtsbLCJtUdkOLqmZMIwZefkrQEx
	9s2FGfvHzzYtKDvjITZ7ahqjOe3pjOrBHyEqYS8HSUhkv+DVqsbwGh+0xE75J9Hf9s+P/DJxeBY87
	GIk0zardopVs7HQaqf7qKyMzknqltYIt6d0E+lzzJ9/6g/unndMOUKpbrGM3byyF1q0MhQqrO09na
	wYZp0qjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqir-0000000C14f-0O8x;
	Mon, 05 Jan 2026 19:58:37 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqio-0000000C13p-3wVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:58:36 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so286527b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767643112; x=1768247912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8DuddcYEOiefRlBzZKrtL15qZCqx9WVAFvprpXIUBQ=;
        b=Mq9Gtuu/CNy531MLqOA8HhWXMAQhEnO+OILqbhUFYzli4C0aufHa9HH8MNqvHiJSI7
         OqjFK4tqc57/0rZOJXIMAtDKA61nQ//ibhXHuXzfhBAk3O4Wds+IJY72Og6x91KbQRWU
         fi/wMyf7tRkV2ojnxoRqcLxAX4eN6gwfd5n5X7xL9H2FjJcyxdWoEOKUbzz8+u8FSN8n
         iaqrDUzXJpUvFpsRExdJvu7fIW3ZbRz68iZEj1iK0Oxm2Io3VX8T4EqyLhpE+zBJ97WH
         WZaXQBWEPmG2chzr5li2EiBiyvrzfnRi2TrntQvHaF0+K70EKmTt0ke+a68CpPudPnfN
         CZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767643112; x=1768247912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8DuddcYEOiefRlBzZKrtL15qZCqx9WVAFvprpXIUBQ=;
        b=JfKo0Db8yLlXVKv+ZyuR6hG1LHUfXtvw4E/Ubg7PduOnqbN2cCIpYlxbU0pJapC4qY
         ntVlZafoKkwydyAVKkzC0dktAqCHNfYvQHC2Dx8aLDYewHjm9xPGQZ/s/psuCKryXWvf
         4JebrdSh4qQ+rbMlydL0Qdwx6yZl0Byi5i04zjcMSW7cInommJSTQVPMYbDprLc/iyW8
         6xZcW7d7Toe2hJe6TTLuePpXlQOJTZVB3yzqlibAd5YxPn8PDciNEjZPlCPPBH7QMd3f
         koPcUjnkwEtwkdxt4zrRD4qLNlsl31XdwTo36Mr/NlET66HWXw+azMPn2R8YU5/+nca2
         g8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsG2Evi3MRr4kB6LVzoyJmD/onSxykAt+Jvi5qKxgoly7J7/JUFm1tUj+I4gJViPDj0rf7nZ01z/xII5PIV42N@lists.infradead.org
X-Gm-Message-State: AOJu0YytX6JTMht2vYETGnYtzwCygockzbdNLDhsEOBNEzlxDM+J+aVo
	m7dGHACm44GIA3r5nvcxY5w4RJi1txqyJ4xBSpr8HaomIquuuNubHaRefw83rb/FqQ==
X-Gm-Gg: AY/fxX4wu/yv2kOSVtXWHfTTjrGq35xgdhH70DNAjAUIXMzRW/Iu7gIVA47wlfOXXG/
	GAkchjTn95Cg+hhoC3MLJYJG5L9B/WaSYttEaBPEL3HvBqvf0kQQ9Jef9Vrf85EO4obwMOx9Kxd
	bu1XHjdsrPArKZQFt7xLcpBXY7io+eoamEB2pyQFJHBO6yzxoy7pukLDoAR1wg3K0Xtp3ebGAEu
	Wn8orCpla4rNnB+SkjH7NpUUr0yZ3a6R/2T5yCpmkX2HCzKkmK8j/2uzpi77oA/YLSgbm1fRL2s
	v4fPuKpXZhAS1hgHmpqfk36AzcE+S8I2hbiCkFwt9CDAJSWtSSNcpeJh9b+IkV9k0dVt+NlWlHe
	MgD2qcaNGDT4Z8GGUmN8M0zUIu6v0IelObbLPuFwjocdGmBt2Cpgl+6x4qT0QVvR3cNeYEhKjHA
	Nx0qRZRfqG9Qj15ttbH4QbfrMi3P9CQUL9OUwzhmveJddxa3Gpgqt5GeZXSjWmwzlxyjAJhVZ1T
	Td9rlsE3IBC5K8Qw6H+7Snu
X-Google-Smtp-Source: AGHT+IFYi37OgBvlreLAlI6opJMukcl64WhdUNqoIdTxzRCBTYpyF7jQRnopByzdWT0cS1RWXEtYww==
X-Received: by 2002:a05:7022:2215:b0:11b:c86b:386a with SMTP id a92af1059eb24-121f18a3909mr496909c88.5.1767643111325;
        Mon, 05 Jan 2026 11:58:31 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:7c3d:6070:7e67:29c5? ([2a00:79e0:2e7c:8:7c3d:6070:7e67:29c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f12209efsm1739565c88.3.2026.01.05.11.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 11:58:30 -0800 (PST)
Message-ID: <f1f2a382-64d9-43dd-bed1-8b1ac9e53470@google.com>
Date: Mon, 5 Jan 2026 11:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-3-54e664f5ca92@google.com>
 <d2c50afe586956ef3a60f17eb77b20fc73fe8dc8.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <d2c50afe586956ef3a60f17eb77b20fc73fe8dc8.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_115835_145098_3C9ECBB7 
X-CRM114-Status: GOOD (  12.97  )
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


On 1/5/26 8:45 AM, André Draszik wrote:
> On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/mfd/max77759.c       |  91 +++++++++++++++++--
>>   include/linux/mfd/max77759.h | 202 ++++++++++++++++++++++++++++++++++++-------
>>   2 files changed, 256 insertions(+), 37 deletions(-)
>>
>> [...]
>>   
>> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
>> index c6face34e385..e674a519e782 100644
>> --- a/include/linux/mfd/max77759.h
>> +++ b/include/linux/mfd/max77759.h
>> @@ -59,35 +59,65 @@
>>   #define MAX77759_MAXQ_REG_AP_DATAIN0            0xb1
>>   #define MAX77759_MAXQ_REG_UIC_SWRST             0xe0
>>   
>> -#define MAX77759_CHGR_REG_CHG_INT               0xb0
>> -#define MAX77759_CHGR_REG_CHG_INT2              0xb1
>> -#define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
>> -#define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
>> -#define MAX77759_CHGR_REG_CHG_INT_OK            0xb4
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_00        0xb5
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_01        0xb6
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_02        0xb7
>> -#define MAX77759_CHGR_REG_CHG_DETAILS_03        0xb8
>> -#define MAX77759_CHGR_REG_CHG_CNFG_00           0xb9
>> -#define MAX77759_CHGR_REG_CHG_CNFG_01           0xba
>> -#define MAX77759_CHGR_REG_CHG_CNFG_02           0xbb
>> -#define MAX77759_CHGR_REG_CHG_CNFG_03           0xbc
>> -#define MAX77759_CHGR_REG_CHG_CNFG_04           0xbd
>> -#define MAX77759_CHGR_REG_CHG_CNFG_05           0xbe
>> -#define MAX77759_CHGR_REG_CHG_CNFG_06           0xbf
>> -#define MAX77759_CHGR_REG_CHG_CNFG_07           0xc0
>> -#define MAX77759_CHGR_REG_CHG_CNFG_08           0xc1
>> -#define MAX77759_CHGR_REG_CHG_CNFG_09           0xc2
>> -#define MAX77759_CHGR_REG_CHG_CNFG_10           0xc3
>> -#define MAX77759_CHGR_REG_CHG_CNFG_11           0xc4
>> -#define MAX77759_CHGR_REG_CHG_CNFG_12           0xc5
>> -#define MAX77759_CHGR_REG_CHG_CNFG_13           0xc6
>> -#define MAX77759_CHGR_REG_CHG_CNFG_14           0xc7
>> -#define MAX77759_CHGR_REG_CHG_CNFG_15           0xc8
>> -#define MAX77759_CHGR_REG_CHG_CNFG_16           0xc9
>> -#define MAX77759_CHGR_REG_CHG_CNFG_17           0xca
>> -#define MAX77759_CHGR_REG_CHG_CNFG_18           0xcb
>> -#define MAX77759_CHGR_REG_CHG_CNFG_19           0xcc
>> +#define MAX77759_CHGR_REG_CHG_INT                      0xb0
>> +#define   MAX77759_CHGR_REG_CHG_INT_AICL               BIT(7)
>> +#define   MAX77759_CHGR_REG_CHG_INT_CHGIN              BIT(6)
>> +#define   MAX77759_CHGR_REG_CHG_INT_WCIN               BIT(5)
>> +#define   MAX77759_CHGR_REG_CHG_INT_CHG                BIT(4)
>> +#define   MAX77759_CHGR_REG_CHG_INT_BAT                BIT(3)
>> +#define   MAX77759_CHGR_REG_CHG_INT_INLIM              BIT(2)
>> +#define   MAX77759_CHGR_REG_CHG_INT_THM2               BIT(1)
>> +#define   MAX77759_CHGR_REG_CHG_INT_BYP                BIT(0)
>> +#define MAX77759_CHGR_REG_CHG_INT2                     0xb1
>> +#define   MAX77759_CHGR_REG_CHG_INT2_INSEL             BIT(7)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_SYS_UVLO1         BIT(6)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_SYS_UVLO2         BIT(5)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_BAT_OILO          BIT(4)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC        BIT(3)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV        BIT(2)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO        BIT(1)
>> +#define   MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE      BIT(0)
>> +#define MAX77759_CHGR_REG_CHG_INT_MASK                 0xb2
>> +#define MAX77759_CHGR_REG_CHG_INT2_MASK                0xb3
>> +#define MAX77759_CHGR_REG_CHG_INT_OK                   0xb4
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_00               0xb5
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_OO_CHGIN_DTLS  GENMASK(6, 5)
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_01               0xb6
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_01_BAT_DTLS    GENMASK(6, 4)
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_01_CHG_DTLS    GENMASK(3, 0)
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_02               0xb7
>> +#define   MAX77759_CHGR_REG_CHG_DETAILS_02_CHGIN_STS   BIT(5)
>> +#define MAX77759_CHGR_REG_CHG_DETAILS_03               0xb8
>> +#define MAX77759_CHGR_REG_CHG_CNFG_00                  0xb9
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_00_MODE           GENMASK(3, 0)
>> +#define MAX77759_CHGR_REG_CHG_CNFG_01                  0xba
>> +#define MAX77759_CHGR_REG_CHG_CNFG_02                  0xbb
>> +#define   MAX77759_CHGR_REG_CHG_CNFG_02_CHGCC	       GENMASK(5, 0)
> Small nit - there seems to be a stray TAB in this line.

Will fix it in the next revision.


BR,

Amit

>
> Other than that:
> Reviewed-by: André Draszik <andre.draszik@linaro.org>

