Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089E8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/knhkAXouYA6Xl6JtvTXAsRE/iUR0XbPvcQV+3XkA0=; b=U4PONeijGONWoNch2Fn12S2eIQ
	lo3ugVujDUAo/6ZXwzbdGrfrPkYWZWBD639uhNJf3Pe4mccs/z4wb7lTrVBHmE3BNFv9rlNLdppHb
	3icrVvvNe9fPzAwaqvxVzbOo8NWAyoGat09PZ5ipyB8z9OYphJM1JUekn20bCsrvNCXkDScUjyweh
	uVZkGVJq2IWnTAPlj2cSG17REnjZrWxiBMXVGh+UD0BRQlqxzAAywYzu7IYdImDgWJl28B6w3VCSa
	WzShOj3f8xU8ZwNS5XjwyNy4cO1+S/EwrItENGUFcwABhGn0EiMeKx5kpQPRO7xXVRCXgaHlXnNli
	11vl7GyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze6z-00000003XzM-2um4;
	Fri, 19 Sep 2025 16:37:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uze6w-00000003Xyd-3Kzu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:37:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3d118d8fa91so986644f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758299845; x=1758904645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/knhkAXouYA6Xl6JtvTXAsRE/iUR0XbPvcQV+3XkA0=;
        b=hnv1WCjUXu8zUsQF8oqQ8ovyy3gQIK++2BRDMabamXEAkBXeaZUSnqRLVMJn3TRPHN
         OyiVlZNxGWOdMi4xn3Orb06dJG3zsDjfZqQi2P4WisDzetS9wGlv3cjHV12w4j4e9uFr
         NkXKbliO/eTkXUpFJVXOI9tQtsuWJ/Xb8PB5K7sokiy3NdXVPBT7Y3vNMwVdu0ZoW3rR
         ahYGn8mT10gmhnf9dUFdmfs4wfCJr9x8/8kvdPeXkBjAV9PTYstmZs/NAaP9DFxqOs+g
         NwvKFwPfk7lgQxwTT4PrVCbIUA/jcfNhWy0NOiPXJCbbCu9bsmuHOTiJaXT2MtNPc1fi
         EkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758299845; x=1758904645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/knhkAXouYA6Xl6JtvTXAsRE/iUR0XbPvcQV+3XkA0=;
        b=LlS7d7v8Ak8nHnS4cURbSe8A519A89bdOBZBUwgH/irbydjtjZ4u5WGFLwe4m+IDoR
         o/68I9kUMu0nqOY3p26753MvvUxPslVZAZJ7QPiXQjeuPNWcoGXhRGyHfKjDgG2k4QDp
         nU7ZGo4SDnOnfcGlOJiqppiMWBAVh8mSUVRaF+6GshXoOkJAQv+Ew6Z+UiQGu0teYxKl
         hYj5xful58xSzzpnCYxgoILTNecB98pB+aGZHMnXBPeAwPYYM5FQrmeeNpvv9TPfom7o
         6gxqDOZO4OhdzfT8HkGKCZWhQ4pVpKJBzuVM9Q87P2aqypmioGhxYS8ztiU/24smCrcJ
         v5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWXjrXsnIclSDT/+YLR4TNoMguqJEWx5MJREjV6HVdfctodajRX8hntIjySvuSreUnerI6+qmxpSI/KibFx8QkY@lists.infradead.org
X-Gm-Message-State: AOJu0YwyFI4Nf3D+9FS9efMTMJPi0vnhrRd56U5z6HD0BkBHTKvgtYyF
	PD5PXJ3cLJoIRDD9kZ4/JaLo9jKCefJmtPTW1Lmchi8NjvsCagtDy5bkBGKk/6q3X8w=
X-Gm-Gg: ASbGncu0eLuCyLkt/DMif1KtEVmNl2CUSE4709Y//KBS98qpB2hrt1ZT1AZY8nYhfnE
	kb6jBT1unHAXfdBvJpcz7CK8CPHbSJjGvIA3ASVuOiu+71Egn+fl7oUGtOVQEmOsjmWiEcwXpcM
	FOcI4hF0xrZDm04vrj1JpxpPhs3V51JgImLd+3i45HGVyqHk5+vIVlBo6sWgf4SGrfPjlGETSB6
	1Yrk0ACEAaceQWBovxhZT2ttwJI3YnZE4S3aYsd7MzjwtS0CBfDS/mi0fZuA2QIJrUEOKOuBwbH
	/ctTE26E25rj8BATOXBOuPUvsFJZZMinzRKLHpTFO/h5oMAsmTftd/LHeX/MSBcDHXKVgetFSqD
	3mscXfsGcmX2REPJ8bLPPRueNHKNB6MtagzeTWURNuNjcfyrc0RMPCwAP2W3jTfShdaDnMQk5UH
	bntQ==
X-Google-Smtp-Source: AGHT+IFLCUqUgGD2nd4xyiWXNaIfWMF8JqHjk07IMJDtnkFYT6wdV7TebvWGMsqzX6eS0i+DvItVtA==
X-Received: by 2002:a05:6000:1ac8:b0:3ec:db87:ff53 with SMTP id ffacd0b85a97d-3ee16600969mr4237445f8f.12.1758299844844;
        Fri, 19 Sep 2025 09:37:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7478sm8450648f8f.38.2025.09.19.09.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 09:37:24 -0700 (PDT)
Message-ID: <71ad53ba-7b72-481f-9b62-1b268cbcd912@linaro.org>
Date: Fri, 19 Sep 2025 18:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] thermal: renesas: Add support for RZ/G3E
To: John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org,
 geert+renesas@glider.be, krzk+dt@kernel.org, lukasz.luba@arm.com,
 magnus.damm@gmail.com, mturquette@baylibre.com, robh@kernel.org,
 rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org
Cc: biju.das.jz@bp.renesas.com, catalin.marinas@arm.com,
 devicetree@vger.kernel.org, john.madieu@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 p.zabel@pengutronix.de, rafael@kernel.org
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_093726_843096_2E3116FB 
X-CRM114-Status: GOOD (  11.05  )
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

On 17/09/2025 19:01, John Madieu wrote:
> This series adds support for the temperature sensor unit (TSU) found on the
> Renesas RZ/G3E SoC.
> 
> The initial syscon patch [1] the series depends on has already been accepted.
> 
> Changes:
> 
> v9:
>   * Remove driver-specific read/write indirection and use readl/writel
>   * Use devm_mutex_init()
>   * Switch to syscon_regmap_lookup_by_phandle_args()


Any more comments on the patches ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

