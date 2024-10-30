Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9580D5CCA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dz8ORMovlm8PCaRFyxkHztKoIVxbuXiuAHwjiXhbYNM=; b=CaN/4UJO/Cmxah8jq/UxqmGcyh
	WBhjDQGbFlTEOZ99+90RiPiOanjlDEnjuBkQkLU44NoLLdUGlntE/OnR6Zq/8Baa6T+oBiuWzvTiU
	17ISVk/Bg/wkCm583XRdNmH8eq8FFNDmAmTJqjvbu3WpopdR6VqtKBzcHjpDbv5XQ18lIOJBBu/Zj
	y/6V2+j/DUpNqsoac+R3cC9/2go0jOWiz2uzBbS3LYjRgyP0gKcN8yAvU9xJdu7kskB5ASA6Pj7J3
	eiw62N6+Mr5gJd1wtnje3i2SWkXJCpWyh2N2aZ31DVRlQgAqcGsHfDkw5TsCqdJQSJMCjyB73wkfN
	jh5mcxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67xh-00000000LUm-1qKN;
	Wed, 30 Oct 2024 12:38:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67w2-00000000LG7-0onY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:36:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d41894a32so553664f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730291784; x=1730896584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dz8ORMovlm8PCaRFyxkHztKoIVxbuXiuAHwjiXhbYNM=;
        b=Z5XgSmS2OhUFci7Iqa2f85evc6+RqeClsO/Usmet+sYkAQdFYMifDTC4Sym6GGbgVI
         CQAThFqnJAKSAhQfVKJlCv6sNuzSgEbQahKlXkhTVp4/QbzJedIn7/lANduQTkHi4slT
         efCdYHnjMJ/xMSHpjLuXva/VV45ED69p24GrMhkfA6kcILJ1h62Q+9sKaiqm2K3Kjy1k
         z7/2INjvzTvlxjOOk/gbpMqTLUPYBkOyN8scWGV68uHuw4/Zb3C+kjLnvFU4xVJvXD82
         rlMP/JSoeI/DaXSAo3WhIqRSfl5mHyrAbLtz9NNMYiNnMOGMI3EfA2nrdkPq1fGg1Smm
         V5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291784; x=1730896584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dz8ORMovlm8PCaRFyxkHztKoIVxbuXiuAHwjiXhbYNM=;
        b=leHpdUuRgu0FDvxwSHIOGDzT8r5oTQl8xxebpLEEO0NtiEKhW9jLyP1gVh+sBjdmDI
         GmKyt4Kzdia0DRoSkdhV4YFtPsIJa6zqmvgC94bmj+alG0ieaaVoRJ9pRkNQ1s54pXzZ
         53le6j20bmLUwKJIuBoxVl4NNakK87roY6WTpVAKp4r51/NkZ+0IZgcwDsrVoyhFP+PB
         YrmsFHD+ZQJ5Xi7NibwXEFOFGQsLXIYStscB06YcL/w/WDWelFmfJ3fwCk6H3cthU6ps
         gavxEgrMcAlzVFRJFLgL83Is3O0gOsFwhDtWCt25tUkFzh1ypdps8KPAFSYeb5rCUl+9
         QeOg==
X-Forwarded-Encrypted: i=1; AJvYcCVMnSYopV+DgA+Zmli8KvPgMEaqoU/lb/fGZseSqS4I8bQ9G4344lRt0lAVQO7B2wUjbqjgFa6hHUcBbq1XPVod@lists.infradead.org
X-Gm-Message-State: AOJu0YwkgN+darOxL2V88jxl8pznAih2O13t+O0Aa2e9n0vB3CeOHGJC
	BmV59yOZkWhZ0+nh6Wfgqunfa1lDKzMSw8ef5kMMmzpTrKMvT21WYfikh7DfbVg=
X-Google-Smtp-Source: AGHT+IH4FRnmdK9aLuDppBh7wG3Y7nEnBh681TyLIF03sNmMciY0XgRonlSoema7XbLW/dKKGVBRtA==
X-Received: by 2002:a05:6000:504:b0:37c:fbb7:5082 with SMTP id ffacd0b85a97d-3817d649f89mr4690368f8f.25.1730291784286;
        Wed, 30 Oct 2024 05:36:24 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47952sm15159285f8f.48.2024.10.30.05.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:36:23 -0700 (PDT)
Message-ID: <8dfeb9bf-3326-4d04-8dfb-fea9dad85864@linaro.org>
Date: Wed, 30 Oct 2024 12:36:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] scsi: ufs: exynos: enable write line unique
 transactions on gs101
To: Peter Griffin <peter.griffin@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org,
 krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-9-peter.griffin@linaro.org>
 <436b02c6-a262-4015-92e3-454d444e877f@linaro.org>
 <CADrjBPoq2jbrMC7wBrjGxMwQ1ebTtBNRQzQ7NfE9=Gw9_4LQ6A@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CADrjBPoq2jbrMC7wBrjGxMwQ1ebTtBNRQzQ7NfE9=Gw9_4LQ6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_053626_281860_04D0B748 
X-CRM114-Status: GOOD (  10.22  )
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



On 10/30/24 11:32 AM, Peter Griffin wrote:
>>> Previously just AXIDMA_RWDATA_BURST_LEN[3:0] field was set to 8.
>> where was this set?
> It is set to 0xf in exynos_ufs_post_link() function, see the following line
> hci_writel(ufs, 0xf, HCI_AXIDMA_RWDATA_BURST_LEN);
> 
> As all other SoCs expect the current value, I've left that assignment
> in the common function, and we update it in the  gs101_ufs_post_link()
> specific hook.
> 
oh yes, as a driver quirk.
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

