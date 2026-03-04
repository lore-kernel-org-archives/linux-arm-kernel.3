Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D41EDEBFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 05:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=; b=CdvDgj6LBAR8hAO3jeu+3nWdJH
	RfYvMwdObBerF2Dqo9dmYDyBqiCdKnG1Is5J6QJFiF2vdZUd3b6sCJUqkcMtgwx5e91GSzpIOZvDw
	SxUZmXmiAktfzuuEn0CY23QwVsDZ7glzuqQA3qIazN3dw+aBE3d4pXdy9OQcah3UV3cNCKkkgBpoB
	f3pNVvmsmYmP9X9ZKH5bmjeeRgoLNlBbpmQ4oDDAHJgU2l3FmQG++57g9AAmcep2xqHqncyo+nH1A
	ucFyo89ROV/YTaLqxGYvrUY3PuQ36JPnyYZb95FJmh2JerAcBW82aVbqu47jN3UTXBreagHzmRS1s
	AoSSDsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeML-0000000GScv-4BQS;
	Wed, 04 Mar 2026 05:01:22 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeMJ-0000000GScZ-0WSK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 05:01:20 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-12732e6a123so3943242c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 21:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600478; x=1773205278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=;
        b=di9z5xNQPDj3JDrzm06wQBRuNe/pClYI++aWWwHB1V13faBfXz8Lz7sWMCxBt0dWSn
         t1QsK4CPyWs637yjV3yiT8cRzYDOgyFAxhQedzr3iHTduKOQThaV+wiaQSsYS01ZAVxb
         MMqx17eDRM018nRToa1jJ9dNsqKwXwLDxAij3OjbXyWXO2vBiL/Q5nPUCmeBuepjC0B6
         ZVk4kJNfYgmpA124GVorbuvT3qpQPc1uTtDa4RiFhjChCUewu0363Z6F1wp/EhrVonxq
         RVyh87Yc30JLwd7wuXFUw/K+hedephOy94STNj9ekFb66RlVnMywKChaTZFz+/Ygan/I
         AH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600478; x=1773205278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=;
        b=Ms4ACfkOI/8wRgcq91kuyvpLeBNSt39c9j1/zBtXHJEGwZhY1FwkJTeuWIPxNVdYYS
         WkCoVuWl5D8su8Rj3aYyoJFNV1mhmwWoc2fDyf62Xz+lBdT6zUhmthT9Oc5uzA/+1yeK
         JhxquKJpyTll4Zd6s/ykbJiAnkZWfYn5a8tf69LBic3Z52I6Q+YYXgyGy++idAeaGBmt
         wDYpRwiAMZ5X5MeCL7BiiFYTS/+Z3LsnDdYl2bucogTFbkB5lLZV2QRSIjMFYbsRfE8o
         sgR7iutTQW9seknVaaA904siY+1saewlk4qsJ4k5p7Dc4faewN6/ODsfJhUueo08mfxM
         SfLg==
X-Forwarded-Encrypted: i=1; AJvYcCVJgfTEG4FPocVUiFnExeJHVb2cI1Hx89HxxovvLDTuD0vw6To9rt96fBUIiS+nkaeg2//fyp4URG1jxUVxcXEF@lists.infradead.org
X-Gm-Message-State: AOJu0YyfwTP0eAqe0knXc3FjUIHIaMwboELtWdi1f3mK1nsOulsZzwBV
	pcyI2LqGwHSbuN1ziIvvqyVHX5k6TngY4XyezxOnYgIP04LxJAcaIlj+
X-Gm-Gg: ATEYQzwygstT4Q3eUpVY4aaZceOktWyQM2cC9xXYlx88SgGGJx4fOY7Jp49cl954DYt
	UfbFAoRPidl1kayj6/uqRRzGOmWXsYFv0TbrYaMqM28LwtxxwYz5oXjfhV8AxXnkF3BuQj9Jw8S
	JxYhL1wXTs0BXS0ZwZTjfIgp4gQ4vSE9uHs5DpVBEHJbVQYaaTuFhCgxcrWNTTtBnXzs71wwRaw
	uxxsbLcR86pz2Ix74u2/blIGcPvVvbyCYWxc1J8BoKVhew6izw9CO2EZcjQCXxQJJDeWRQllkAM
	TAobhQ0ljwQwrdLnQAjDIspzQ6nTr5yJfe3Z7KK0LnAKzt38mus88m15N0r924qKTITfq7eDTo2
	3gPBgk5pokFebqSISzoNPer1K3kMMQGu07FahUJHwHyXY28g6u3G728I4RlIGzt3W6dtCuCC8i/
	tsAW6d7XyUzMNsbfaUhSGmidMkFPpsuaUUwrmtNzY6uiLUCybpy9yiQIbq07SWp+EB
X-Received: by 2002:a05:7022:24aa:b0:119:e569:fbb2 with SMTP id a92af1059eb24-128b70df522mr302307c88.33.1772600477988;
        Tue, 03 Mar 2026 21:01:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm21528620c88.6.2026.03.03.21.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:01:17 -0800 (PST)
Date: Tue, 3 Mar 2026 21:01:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 04/10] Input: stmfts - disable regulators when power on
 fails
Message-ID: <aae8OqFl5Aejv6YN@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_210119_220184_C0314FC3 
X-CRM114-Status: GOOD (  18.64  )
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

On Sun, Mar 01, 2026 at 06:51:18PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We must power off regulators after failing at power on phase.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index db2dd0bb59fcc..f4e5f1b3ce796 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -558,7 +558,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_read_system_info(sdata);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	enable_irq(sdata->client->irq);
>  
> @@ -566,11 +566,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	err = stmfts_command(sdata, STMFTS_SLEEP_OUT);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	/* optional tuning */
>  	err = stmfts_command(sdata, STMFTS_MS_CX_TUNING);
> @@ -586,7 +586,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	/*
>  	 * At this point no one is using the touchscreen
> @@ -595,6 +595,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	(void) i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
>  
>  	return 0;
> +
> +power_off:
> +	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
> +			       sdata->supplies);
> +	return err;

Maybe wrap everything below enabling the supplies into
stmfts_configute() or something to avoid bunch of gotos to power off on
error?

Thanks.

-- 
Dmitry

