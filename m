Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D74CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 04:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkXUCD/sfJEqbYrrabHICoE25LMTNly9IBUsbDSuWOk=; b=vRzLXfsM3b+D9NP1YqUEFM2m8P
	kTExYbx2DP4jlsFHlYLzoX8vFBgKo6kMadUNfeow97CSZv29+DQBs7g0Sl3VHJt6zCKyBCfgEU4iK
	E64WSb1m3sTLSo+P93MmXFV8Cb7n63zu4d79ErvX1Un8Vvnyw1AiEnrpxtqvnKrLc3eDIzAzND4X+
	pLB6R7voNR/ZKJakORBcVPYmvW7EDbj8dL9PBjJsuZO8w4MmLgz7pgNrIqrYG9Nsp1o3qNe1+FSUa
	7h31Fi0T/VEGTJp0ZoQ3HQH2DrImWMSwl1Qa00k3ptDEIIdNnwX/D2QeqtGQvZJm4EPTDNYCuSovp
	gYpeYWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTQ0-0000000FxWJ-2FbE;
	Thu, 27 Nov 2025 04:15:44 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTPx-0000000FxVv-2b7u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 04:15:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-bddba676613so303563a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 20:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764216941; x=1764821741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkXUCD/sfJEqbYrrabHICoE25LMTNly9IBUsbDSuWOk=;
        b=jlRNeKvwjFwknFTEtU5j/mQqhQ3PM8WbJvxXAmCnQZ5mwK+F+BBFXcNOf26ZJguHOj
         LUpIGIXlPviT/tPw6suNkaVKC9IfM0O+K5avlSdX5tx8m19xEhEytrRdTovi4l8KF71G
         /yFWe75tZx06IJ7d5z4TAQWG4+qcDEM3opbZ+KoPuOGLTn1XDrtYDN8+mfJ7KsQWXyVU
         t4AZ5NY6zLakZhvX9vb/d7w9g/6tX/SbY9Pp9zwyRvAi+0YKLWkloGIAcowb3uMwnZld
         DYqTE1VAGy7przL+kc9svCxUn04oAD/0QZesiQPzr5qKCHax9LAfRiUSHXea7uqGKa57
         PyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764216941; x=1764821741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkXUCD/sfJEqbYrrabHICoE25LMTNly9IBUsbDSuWOk=;
        b=mKuE2yRkzaVkK6ZCAfYq9H2j6VKXfGQ0iieQDBO8uVNFEA+nrppE4xifYFieS/ULEm
         n7G5IB9+bOsIB/JvhIk3QvtxDJGUCs+ZPlbBHgHvcWXCsej1Mk+wSrxA0ciQVgm6skTy
         P1gcCUABp7UJbOqPHAR4VUVffqf/B18BaYLAGaoaTkX2oTSYi/YV11yLp4Ir/sJugTRa
         pg/BtW1mV5BR67LrxtO2JL7qZ0zcnjBLRqYJD5QML/AvKLSE+zVL6tjFENfeytvZxDBo
         nTnAgcTl4LKuKyW2eqEBGQWiLL6EBY+rjPxt8oTDcL/PvYgD42zEb5spOOXPP7+xIqak
         N0hw==
X-Forwarded-Encrypted: i=1; AJvYcCX7OYFHeRV0GfCKEvN5YwEwU1Th1xPvNcXuqIfdjHOhzvzH0YrPnqkH0NnwgLuyPjelXHc5UGZxZ4+QGu+I58UX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+JOh1rydTmnYGaadYnfci5d8g5TD1pYXtQe7bPVAilu+hpL70
	ldrCVoLdI/6raPD3R/EDsO5o872jQo9r5HGi8gNxQT+GetURKT8C3isKNLovYuhk+Q==
X-Gm-Gg: ASbGncsWA/H+OfRUqUu+C2j0yGRHomUMf+NqbRDs4RO3kueIEsh9sNjOzh3U6uoTmEQ
	a17sVYn1mEWlVVOFa0svoY4OF8mcW9X0+H9fAXdfZTwxq4F1JG2VTYnzdoCCA2UDgwp/e+M3kNf
	DV2aUr8873phuWxbxEloTCqZwutF8Qi/Rwgi3Koc0VnXjj3xyaYv98jvgyMqZiQbkicPUpKnSgT
	GFGcJvb9S7zvi4ZWwf9rVNwsJE3IPy1VYsuUNyhUjI1UCq+ZRJH2AZCvLX+T+p1r7GYcYK5qB7w
	aNezfRpgnmolT50v/rqnp1XNyhmPr8OlxOo1dciAP1nkzGlqqaG7rP/u9uteQ/VwVMxZmN77fUo
	c5WGytMCxeV4V+23bHhHOGwSJQgTw5zJwklXyzi3R5hveN+SmHTDpzknx8ANRt1Hdit+2e2iYSQ
	Fzk9/fgD6c/ekVLWTGCxh0U/B2ht/5OUs2mk2PnrKk9cwrkrIxEdXljeeg5KBdVEv0gJZF0909+
	afXFFVkjQ12xQ==
X-Google-Smtp-Source: AGHT+IGdB7ijJFvVK8Snhgzlb9iXXr21271jtHTPlPGlAm0Ty7r+mUpMoHeF2HI52zomvLA2TJb3xQ==
X-Received: by 2002:a05:7300:d405:b0:2a4:3593:c7d6 with SMTP id 5a478bee46e88-2a7195cb23fmr12999898eec.22.1764216940215;
        Wed, 26 Nov 2025 20:15:40 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b47caasm2419198eec.6.2025.11.26.20.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 20:15:39 -0800 (PST)
Message-ID: <6f2f075b-3570-4424-9cc7-695fb8c3b988@google.com>
Date: Wed, 26 Nov 2025 20:15:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: modify irq configs
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
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-4-6b2e4b8f7f54@google.com>
 <5c901a6c831775a04924880cc9f783814f75b6aa.camel@linaro.org>
 <aa7bdeb1-c8a9-4353-af56-869f16a083c2@google.com>
 <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <e25ff0e5ff103433942fc7744eea4a3c61ce1daf.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_201541_702845_BDDF8388 
X-CRM114-Status: GOOD (  28.10  )
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


On 11/25/25 10:44 PM, André Draszik wrote:
> Hi Amit,
>
> On Tue, 2025-11-25 at 17:10 -0800, Amit Sunil Dhamne wrote:
>> Hi André,
>>
>> On 11/23/25 10:21 PM, André Draszik wrote:
>>> Hi Amit,
>>>
>>> Thanks for your patches to enable the charger!
>> Ack!
>>
>>
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>
>>>> Define specific bit-level masks for charger's registers and modify the
>>>> irq mask for charger irq_chip. Also, configure the max77759 interrupt
>>>> lines as active low to all interrupt registrations to ensure the
>>>> interrupt controllers are configured with the correct trigger type.
>>>>
>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>> ---
>>>>    drivers/mfd/max77759.c       | 24 +++++++++++++++++-------
>>>>    include/linux/mfd/max77759.h |  9 +++++++++
>>>>    2 files changed, 26 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
>>>> index 6cf6306c4a3b..5fe22884f362 100644
>>>> --- a/drivers/mfd/max77759.c
>>>> +++ b/drivers/mfd/max77759.c
>>>> @@ -256,8 +256,17 @@ static const struct regmap_irq max77759_topsys_irqs[] = {
>>>>    };
>>>>    
>>>>    static const struct regmap_irq max77759_chgr_irqs[] = {
>>>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
>>>> -	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
>>>> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0,
>>>> +		       MAX77759_CHGR_REG_CHG_INT_AICL |
>>>> +		       MAX77759_CHGR_REG_CHG_INT_CHGIN |
>>>> +		       MAX77759_CHGR_REG_CHG_INT_CHG |
>>>> +		       MAX77759_CHGR_REG_CHG_INT_INLIM),
>>>> +	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1,
>>>> +		       MAX77759_CHGR_REG_CHG_INT2_BAT_OILO |
>>>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC |
>>>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV |
>>>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO |
>>>> +		       MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE),
>>>>    };
> You should also add the remaining bits in each register here, so that the
> regulator-irq can mask them when no user exists. It will only touch the
> bits it knows about, so the state of the mask register is non-
> deterministic with this change as-is (depends on how the bootloader
> configured it).
>
> [...]

I see what you're saying. I will remove this and keep it the way it was 
before.


>
>>>
>>>> diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
>>>> index c6face34e385..0ef29a48deec 100644
>>>> --- a/include/linux/mfd/max77759.h
>>>> +++ b/include/linux/mfd/max77759.h
>>>> @@ -62,7 +62,16 @@
>>>>    #define MAX77759_CHGR_REG_CHG_INT               0xb0
>>>>    #define MAX77759_CHGR_REG_CHG_INT2              0xb1
>>>>    #define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
>>>> +#define MAX77759_CHGR_REG_CHG_INT_AICL          BIT(7)
>>>> +#define MAX77759_CHGR_REG_CHG_INT_CHGIN         BIT(6)
>>>> +#define MAX77759_CHGR_REG_CHG_INT_CHG           BIT(4)
>>>> +#define MAX77759_CHGR_REG_CHG_INT_INLIM         BIT(2)
>>>>    #define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
>>>> +#define MAX77759_CHGR_REG_CHG_INT2_BAT_OILO     BIT(4)
>>>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CC   BIT(3)
>>>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_CV   BIT(2)
>>>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_TO   BIT(1)
>>>> +#define MAX77759_CHGR_REG_CHG_INT2_CHG_STA_DONE BIT(0)
>>> Even if wireless out of scope, it'd still be nice to add macros for
>>> the remaining bits to make this complete and avoid having to update
>>> these again in case wireless support gets added in the future.
>> I would prefer to only define the macros I am currently using to keep
>> the review focused, unless you consider this a strict requirement.
> It makes sense to add them now, as per above.

Okay. I will add them.


>
>
>
>>> Also, would be nice to keep existing style and indent the bits from
>>> the registers (see existing bit definitions in this file a few lines
>>> further up).
>>> Finally, can you add the bits below the respective register (0xb0 / 0xb1)
>>> please, to keep suffix meaningful, and to follow existing style for cases
>>> like this (see MAX77759_MAXQ_REG_UIC_INT1).
>> I will fix the indentation and ordering in the next revision.
>>
>> Regarding bit definitions: In [PATCH 5/6], the max77759_charger.c driver
>> defines bits for the register addresses defined in this file. Currently,
>> those macros are only used locally by the max77759 charger driver. Would
>> you prefer I move those definitions to this header file as well?
> Yes, would be nice to have them all in one place (in this file). That said,
> CHG_INT, CHG_INT_MASK, and CHG_INT_OK all have the same layout and share
> the same bits, so I personally would probably reuse the ones you added for
> INT for all three of them - MASK (as you did already), and also for the OK
> register. But up to you.

Sounds good.


Thanks,

Amit

> Cheers,
> Andre'

