Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25383C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wm5Ysxp6GbjttnpPxWFZX/i14ZJHHqOtrosH3lsbGA=; b=1UCXLMqQ7otJ0flfGpudtEV0D2
	ZmOALMVHLdIOmvFsW115Ciuk5iJFYvPpvpCUBi0/h1WeJ0eDshKNSA/UNHqAyrKs0xfsieDI5UklC
	+ksgwcgIDmzwA/9HxE6OCSZQFm7cQOc4bxn6p1tnQxDDyPwBPhAENlUk6Wl63kmwFQi5p5Z31twAA
	UryIqrl/aprJRF4dChh2VL0T6K8rQ0O1/bpIklPZCS54W9Zo5jLc6eOvcD+Klts5p4srO6jGLQX6g
	eDOeYbImJ2X2G3Uk2oeszUW/fsVj74jmtAJ3H+8RSkx4MQj4VWlD8QZDDemkRHp1PHmPrU5Ldnvlw
	fDle0J/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTuD-000000000T3-3fkf;
	Fri, 06 Jun 2025 10:02:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTs6-000000000BK-0Yl8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:00:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so15816735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749204020; x=1749808820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Wm5Ysxp6GbjttnpPxWFZX/i14ZJHHqOtrosH3lsbGA=;
        b=sa6WBeVLy5VFZ4YXqQdZD0s9ZouLmGjBSoSlUyY09sfCoF0NKWmS65fDOUaJ9RtTYY
         vm/XlRrEm6zIvgCEWmLUnZtHKc7HlbWKM7FPlHd0q9Xgahx19qDzBASPAohnMJ3w8dsa
         MgaNom2916nLi0AxXIf2L9yVYEd4k3k8UVLpbSctnw4Llb0F6d3NBK5p9CooJsSYefEj
         c0XwAAq92nxkGTZk2qQ4aAid0FU9dh5PdamiUnwCF4I440LfbrnyUd7VPcyC9DN1Q0qJ
         6MFANIGnbVpaXxBZn7pDyNgJ9kw9PFLvFPzeWqnlpB+7AMxXF3FZYR9hiww+00kWO28b
         X67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204020; x=1749808820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wm5Ysxp6GbjttnpPxWFZX/i14ZJHHqOtrosH3lsbGA=;
        b=AiSoEz23eQHjdTw2f08Zc/o3DHNqPXLFgdEtrY0Dz/DBCyTaBmfqMStiKXVKohPv7S
         HBm1j0WL7LxI1E8ABGTdj6WUcskt1l4S6r8mYppTGaRAHUZ5uDeDfXBXaiQcDdIWZK15
         b5+w9+RTV0ia4bPOvZ7MnWLY+cHRz+zqnZzkU8WIiFGNK7JAQRR6+kxUB6eOXfGAm967
         5U6ePxMCCawPHfmjNmhBlB0+rggWqWg5XykhGBku3BLjE6NmmcvA2TwacALWHtdoU6u3
         isJbjmP116uw36JbaZ283gzNIb73XSb1XSHjJr2mh8svhVUhg+gmiTPZZVPGA9pD6+Ss
         yg5A==
X-Forwarded-Encrypted: i=1; AJvYcCX8cAbs8DdHxU//gU6vTB7reNQGUn7Sk37x4oqByQl1bkLSjaW96MVILNu5SLVqxkh9Q3NqwRQoQ8ifVv3a7/N8@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVB80xo1SsFHtfsASsLZojYMA8D4e804oxKcpKRfF+kADo86g
	9Bbupio/mZBuejMT/0M14L8A/XgDPK5T/fL5r5QO7jBLDyPrJHzEV7bsBFktl4RkTIw=
X-Gm-Gg: ASbGncsVye8mTFN1lJZpwghMxeROCQ6lAcrn3dWPLOeq4Ll1s73dECT4Z8xJtgYuBE5
	LN+4Kj+GbIgjOqvO0/XbXDYXdu3oy2DJhRBhxcANmYhvIPqNOcDIZDLk7p++m2SSROr8b3BRLX7
	GHkntpuocUzTSFixBBVaQbua4GmGTfTZdcMjks3dgBgT/myuodcNTd4eNm6hH2aQIgLgbXwIu3r
	GshhbdNA6R9Qh/ImmR9lMD3sfeQbQvP67quNk1/HpQQ+zeUejd7Hxu7H8FJIotILGWrVAkwwME6
	k3z4eP8Jbk68xZr29BOpO8B/LHDbN0WgsVba7j+G3PPuHuSx7syrFdo2BK1Z+fhAvwK7xQ==
X-Google-Smtp-Source: AGHT+IHtw37a7aLpgY1NgIlSmAhbyHbRMRvllHSnmnalrMLkUdNldLsfg2cqEgFo08aK/ax73zNvkw==
X-Received: by 2002:a05:6000:25c5:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a53188a553mr2530102f8f.1.1749204020520;
        Fri, 06 Jun 2025 03:00:20 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324621a4sm1347436f8f.88.2025.06.06.03.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:00:18 -0700 (PDT)
Message-ID: <ca3ce8df-aa4f-4422-8455-29db2440d8d5@linaro.org>
Date: Fri, 6 Jun 2025 13:00:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250606071709.4738-1-chenqiuji666@gmail.com>
 <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
 <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_030022_179556_C1F9309C 
X-CRM114-Status: GOOD (  11.87  )
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



On 6/6/25 12:14, Qiu-ji Chen wrote:
>> On 6/6/25 10:17, Qiu-ji Chen wrote:
>>> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
>> If the first spin_lock_irqsave already saved the irq flags and disabled
>> them, would it be meaningful to actually use a simple spin_lock for the
>> second lock ? Or rather spin_lock_nested since there is a second nested
>> lock taken ?
>>
>> Eugen
>>
> 
> Hello Eugen,
> 
> Thanks for helpful suggestion. The modification has been submitted in
> patch v2 as discussed.
> 
> Best regards,
> Qiu-ji Chen

You are welcome, but in fact I suggested two alternatives. Any reason
you picked this one instead of the other ?

