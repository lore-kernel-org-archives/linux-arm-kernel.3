Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F865C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/J1eHs/QwfmQDOJAETe758QiGCVwHhph27kBts3wDI=; b=N3DMM4VeXG4Bx8EpJgIhyinw+A
	ueZXclbw/EU/fmjjk2QUwDkJuLBmHwa2TgNTcPR/KZYmjH0f24wB1Wtjga3CrTFtnmGkKDFh2mgeJ
	t8r3ZP4ky7bt8xgoCRrpMKetnwIJ/epF36aPw5FnwPVuB1Meb7MPMSRaFaFUot4704psQ2jaKq5+X
	q25e3kCs4l88N3TiH4qZwoml4v7EiUsy0mxwl/M6Ggoqym5ivySjMDNEQxzNkwBZAfiAa7ieLMsSn
	FQkhiQ/c+LqCu0RE7ONFsOOXPTDrTKTswv1eJhu3Suz9g+9g0ulpj8a5EuTrEUvoHdfKzfA8lpnD8
	8RevgCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSv2-0000000CZLV-1hMY;
	Mon, 24 Feb 2025 07:30:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmStR-0000000CZ6T-49t3;
	Mon, 24 Feb 2025 07:28:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f286b5281so1940551f8f.1;
        Sun, 23 Feb 2025 23:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740382124; x=1740986924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/J1eHs/QwfmQDOJAETe758QiGCVwHhph27kBts3wDI=;
        b=f/CZLywiCEXSaOyoGRQgt00WQS3VQZkckbvzAxICenUTJn0UzMUq8bih1d6lvJlVpv
         J8gBnxAIxO/Wzp7kmPk6ajJoIsOz92ztYzAm+AI5wAdbPVBaZuZMAbOX2V0dWTmf88r5
         gFio9fzmq8FePinzS3THYaXExIHon022bgttToXCX67JQhnPpq39IRaoi+52Chn/Sc2e
         5ax5gmaz6ktZbm2mo1/5nkxdsFi/Eb1ysbKKNEzVEOvBYzpYxTSViM3sFRoKVPVZU4tY
         7HP8SJ/uGG3oWEhwbBVuaeozIQF8XJkBkqd658PuOO9cVwrp68yHe537tx7X1nJtQzXG
         4XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740382124; x=1740986924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/J1eHs/QwfmQDOJAETe758QiGCVwHhph27kBts3wDI=;
        b=lRq1aILc7WUlzagIb/8naaCKnA737TIsFCJJZQirefUHEARHnGh3EvWqWO5ez0EKlY
         QbLglps5BuaOUChR3zAV1O6tzx1sM3ED8dCAwnX2TjTUP1ufz/mCNf92x0OLszUFRavP
         euHsdXMMyu8oqxWSU/fnZTtZ+gUpD63xU8DEMXcn8qbedR2IeAJeLEuL43KhuDvonSXy
         nGHOLYpF6Z6scbu7bJ7EWxvlt/IxvY5aTGLsgGb37ybWV3vEl66sHJTyBW+un5suYUh4
         2iAcOyoP1vYgpk1M8fN0AYdSXr/6vJr6JZZIcglyDCH7+BGgTVJXB/WV+UgCBjgsRegi
         D4zw==
X-Forwarded-Encrypted: i=1; AJvYcCVPF1Smm4Z7CoIP+gmk9fgrIF81elgoOjWEpCkYFYxG27uZiC8SrGgAt54Pph9Cnwbl+b8FIknBde+Y@lists.infradead.org, AJvYcCXuQ/Ilc607282tKIxdV6nrxdWjl02IB6q/YoQ1da1eKcQLBpYRPsjkyzysU/22K/AG335JmWtwy1P/KOSrU+4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzHPhzxDBzc4z2dQvgpNNvsSPGvyi3c6pEcdcmPYdHxkeQV3bP0
	EB5uTycRxNGGTjIbSnFVba1f6wjLKHUtdEVUcfR6E3O7yf4LtXKO1jh/ag==
X-Gm-Gg: ASbGnctcqaP0vJJtzzIflDRt0Xpbt1OVP0+4+lv1dkfX2HV5OMyfdkDz0SmxBE4MTVs
	hA5NT3VyWsIE94YJ/hkToySJxALHXn/6tyOFAN5soWGRrmeKNAGqk0fpOo+/1FGHQ4LzrsiRqQz
	Kjuimew8Cx3BGYcQBrNzdDm2H9UU3WI5YEno/VLadEocbAdv2rzUh7mnNCtB2OXJR+lQ/e7Tiq6
	2fnTapiocrmtd16384+tBHjrdNkrOYMfJyS9ZqjMUwCec0ofU6bHBVPCVfMkRykKMBG5Uz8Q7KE
	FisWPx0jqzd9SRsxVWfuD+TQF4sjA6VCAXGPDLuH
X-Google-Smtp-Source: AGHT+IE5cw7vshlFbcyfY+g/VDogOlT1fxKWnLlplcjX26Jv+6luh/NyTC1ES3BHLcR0L8M4kDEHug==
X-Received: by 2002:a5d:47c3:0:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f70772b51mr8659416f8f.2.1740382124196;
        Sun, 23 Feb 2025 23:28:44 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d58f3sm30734172f8f.73.2025.02.23.23.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 23:28:43 -0800 (PST)
Message-ID: <3616b414-ba57-4625-aa35-20d3dff61cc5@gmail.com>
Date: Mon, 24 Feb 2025 09:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
 <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <rcny5iaxs6gr6vcxmjep6hwtkt2fvtgzhbxlpu3ax6vj7maure@n5bg5y74vwc7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_232846_035961_E82B7968 
X-CRM114-Status: GOOD (  10.68  )
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

On 2/24/25 01:48, Dmitry Baryshkov wrote:
> On Sun, Feb 23, 2025 at 02:22:25PM +0200, Ivaylo Ivanov wrote:
>> Some SoCs don't provide explicit reset lines, so make them optional.
> Is there an external reset or some other signal?

Well..  There probably are on a hardware level, but there's no interface
that exposes them to the kernel.. as far as I've seen. Resets are usually
managed via the blocks' registers. I can't say with certainty because I
don't have access to TRMs.

I can reword this commit message to make that clear.

Best regards,
Ivaylo

>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  drivers/phy/phy-snps-eusb2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>


