Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61026E87852
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0/ndP+Q6QYWzq22YHYUgQSQqkbwcgk08y+b5h1n8pQ=; b=IVG56z/hLIqGz5bo7qcSXW/jYJ
	ZfaLIXndYqkUjs039U9aSyoacY1aDAlQiwi+aiN6sU0riB4TFI7nDvNfVXP2wOeFWO0yh7r1wjz4Y
	zgmA7M//M9uSg5xVNw0MJAaHMAVDDhtDv48PULToKZ9ppTe7MKIeAcVJBm8qZP2IOd0Jm/InLN35A
	0tKIfIbyUwcbW0RX7QAB2rfpAysoXotBsoQg5ObVnb+1XBYxE+sXhdxrTPIlUbF8M+Bs2JNaEEPKv
	7BQub0Q712MGLwn1/HWsHg7sGiMa12H9TeoGMUb9y3AkscC+GMreU19BF94qW74m3kY7UUqCh9sw8
	cWRPYNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKtf-000000076t8-0w2v;
	Tue, 03 Feb 2026 18:13:07 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKtc-000000076sT-1ys4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:13:05 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-385d75e1a79so55652251fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770142382; x=1770747182; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0/ndP+Q6QYWzq22YHYUgQSQqkbwcgk08y+b5h1n8pQ=;
        b=Ydv4tk2zqyXzSR3wmeEfwAwR49rX2BO1jZw6+I+xeCDhhn8epDN1QE0i2RpGPE+odK
         H9DI6gMwem5gLUhH6JErbZletaPWQAhaPmCeVGtYHuU2LafqcFth8w6n5JNCEpQeBV6J
         VHsTXL96N6Zl3iWi26L12xRzUJ7mdAjX6fZ/Jmp+lU3ON2KKT++SV65IUJUvesmDdkd9
         3kwlh4n4NGxFO5I5eqADGAQQJuKhySRtaYP97UYKZqn7Ndork4HBeXPPXphizf91KRik
         FSL3uk6/DA2ORoDdQbCl90AP9cC4iysCY03LovXCZGjWTan+sb05+fKxWbMACfY9QWem
         4Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142382; x=1770747182;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0/ndP+Q6QYWzq22YHYUgQSQqkbwcgk08y+b5h1n8pQ=;
        b=qMuottHygSwJRiXjRWvxL39LvawxtjBzJK4qiFj2cMLrRUS0hsakB1vRzOspzy7SbJ
         qBFX1DGTCv10btcTl6UywGx+VpNw92rFLgd5ZTwGn5A6gjh6ifb2FUYfQaGSgWZOlmoB
         8QLRbcVyK8M6P1Jhh5S24UDWhKIycPVBxi+Ah1g2sKa3B9ccAezQAAO/udQJo2C7uvwF
         cGCGgBHoNFH96hXpSbtLz99TuCQHO4QXSLK+hdxkampzWYz/SWUEehOf0NKVL+ov+4yx
         hv0KvG9Gu/TER+yjkIutDXE15tJIR9TXiS3mkCVXNjFewEIf1d8fRCUFqBbwo0yXlnrr
         XcjA==
X-Forwarded-Encrypted: i=1; AJvYcCVT3ZCNIE3BaUyFBbgTB8WdHyr6cEtpDkdx/8t3UWou2GYqNLNzdmI6SWLVgmcal/z6gjXFj3yMBFs2MWWH6ICd@lists.infradead.org
X-Gm-Message-State: AOJu0YxaOLWa2Gn0hOLl7NbHcjG+dOiNMdwxPdV4jwhDyDrJxI8XBOva
	8A50WXpOcb4rU8UAOLpNyhfBXpG2sQDCDlg1rAnacqFvVFcXc8vnwxcx
X-Gm-Gg: AZuq6aIy+R77EI85hFPDA8IyV0wa69zjpEstFFkntDMPKZ1gWFz+pMmRDzWakf2xkY6
	piR2PEusZHPjr21lpeYXgOteNFE6D5OlWG9+PcviYFF3c4lafpC0jUoh1hUc1u2mqQkLdwu7PJo
	77MBObtVqMxbN5nI4N05SXkpSyB0gQ8MKOdU9sM0ZplR6vfR7zos4qsTIRzKCC0DO2Bnhg6v6vR
	1pd8cJCm/i2a8ZIKqwSx9P1LF8rbRwLzRQHTopp0pLFuVXP+fqohV8HGNmkiVfkZYGIVQtKM+Xs
	b8++KZiurXjO9H3i/2+DAhG35aN0lv8dkk/SbynjWT89MPV9+7vJsAg0vIlfQ576CbUMnngcO/C
	wk8v2WPE02CsWCWnMDl6SpN+5QSi9hHMxUwgerChP5P0/8q48ppctVfLYDLBLtr4Azi+B42Kfi7
	ICxDOssepjmZhu+LMlPe3djOFMuD9mT0+lzc/+SsNst96sMxTSCo4mMcBes68=
X-Received: by 2002:a05:651c:550:b0:383:f43:ed45 with SMTP id 38308e7fff4ca-38691db7f7cmr1903191fa.30.1770142381698;
        Tue, 03 Feb 2026 10:13:01 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38692040049sm477121fa.26.2026.02.03.10.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:13:01 -0800 (PST)
Message-ID: <66bedd88-8ac6-45bb-866d-edaf436ee359@gmail.com>
Date: Tue, 3 Feb 2026 20:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Cc: r-sharma3@ti.com, gehariprasath@ti.com
References: <20260130110159.359501-1-s-adivi@ti.com>
 <20260130110159.359501-16-s-adivi@ti.com>
 <98c254c5-94c1-49b0-b361-617639b781d8@gmail.com>
 <7abbd45d-e688-41b5-bde4-5d97877f3267@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <7abbd45d-e688-41b5-bde4-5d97877f3267@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_101304_526699_4EFF6762 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Kartheek,

On 03/02/2026 10:22, Sai Sree Kartheek Adivi wrote:
>>> @@ -632,7 +641,8 @@ int udma_configure_statictr(struct udma_chan *uc,
>>> struct udma_desc *d,
>>>               d->static_tr.bstcnt = d->residue / d->sglen / div;
>>>           else
>>>               d->static_tr.bstcnt = d->residue / div;
>>> -    } else if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
>>> +    } else if ((uc->ud->match_data->type == DMA_TYPE_BCDMA ||
>>> +           uc->ud->match_data->type == DMA_TYPE_BCDMA_V2) &&
>> Have you thought of adding a version member to struct udma_match_data
>> and use that instead of distinct different types for BCDMA/PKTDMA?
>>
>> Here for example you would not need any change as the code is common for
>> both v1 and v2.
>
> Hi Peter,
>
>
> I'm preparing a v5 and wanted to align with you on the handling of
> different dma
>
> variants (udma, bcdma, pktdma & v1, v2).
>
>
> Frank suggested moving toward feature flags (capabilities) in the
> match_data,
>
> rather than checking type. [1]
>
>
> I want to get your thoughts on Frank's suggestion before I proceed. Do
> you have
>
> any strong objections to using feature flags? I see merit in that
> approach for
>
> scaling to possible future DMA variants in K3 SoCs.
You have several differences here and there (small and big) between the
v1 and v2, if you want to feature flag these out you would need to have
a meaningful flag for each and every one of them.

I find this a daunting task to be honest, so I would go with the simpler
way to just use version to cover _all_ differences in one step.
How one should be handling things if
A) feature = FEATURE_1
B) feature = FEATURE_2
C) feature = FEATURE_1 | FEATURE_2
D) feature = FEATURE_1 | FEATURE_2 | FEATURE_3
E) feature = FEATURE_1 | FEATURE_3
...

I think this might get out of hand easily, but you know the hardware
better, which way fits better, which will scale better for the future.

Also, you set a FEATURE flag for V2, but it might be that in V3 revision
the same thing must be done in a third way, so you would need to
allocate a bit array to say that this feature have this three ways of
handling, etc.

Either way will help to make the code a bit cleaner, which is already in
good shape.

-- 
Péter


