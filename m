Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=; b=1G/fcMC0WVJZCCDYST5CmnguDQ
	jLv5pEWbP5MWHCN/Sy+cQ2fEEIsQgKL9vY4HNIVYJq66dtpgb0VF/ZKI0HiPLfVhzp8/onsC1jGhK
	SXkIZFqZ+/zS2P+sLghd2sy7fs3joZij/rbCKdG3ZIXf7Q5xRS1gttmKBD3xYrUQnsE2PQu2+q2T9
	Zj5UCQY2x8WXbsxVufq/hSmBaYEvcJw7nlTDK2ts4RjSCpEwrKLQ7QKnyjOIySotAL+joFCrGjjdv
	U1ri7MjstKUTYJgB30ffEhlkV25t6hbh6hYgDRfohDLfmry4JtRtzwyoMMs8K76MssHa++vMc0L3V
	IXPBMpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pBB-0000000B6Vq-0yh6;
	Sun, 12 Oct 2025 06:03:37 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pB7-0000000B6VU-38vz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 06:03:35 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-85cee530df9so489136085a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 23:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1760249012; x=1760853812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=;
        b=2FxINxh8KhEtpI2e9x5MA0+WT33ZPkCBhpVkEzDilUkIoIprRI3V8YHMewbK44boN3
         X5dtTM3Dlz2bI7IV2t503xlReYZlOaSEPss+uHWjE/DTo0qIlwN1juGP7qi0ZJD3H8jE
         ONwVw2M2t5YEc9wHLZ4dgC9CzuUL+Lbo+gxlBkT366vZXPzu0Ft3ikbr8Hde6ydHQ/aO
         BNERnjG6sW00xXL5bONhHedbDfOQesgUjjgrqD/Acjv585O2wZJKSl5USHMiIX/KjhyI
         fmcDL229WHWALelKaVm1YPn4luM3EvsVpLyHaa7if8kBFgcBKV91qr5/dxCVvVrEDKPB
         PodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249012; x=1760853812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=;
        b=T614cEEWrFtoR5Xnubg7UTOF3M3VFNNo1xrRz3Y2A9oYoHlrOX0+9AC14Sv1AS/7Fp
         5V0+AjQNLOzUwZXz8Aa0+4a+BcBE5Ub19DbUToq8bf1IIL9tbbpo3048hvA+ekVtqBVh
         JEEzULbMu/0j2atkW4Qc6E1VCFH69Th8+eZLhw2MCEXkeUIoO1hf3Sl2s9nfDWQdQVMz
         A+pOXiWi/A52IcnKrclFNl97bpubKP/bb3bsaX2D1vrAFFrdv081Ry5fxvOVbRsUIVO0
         ds/Vhr+8FKZeueQohRiuKgmKC67uUzxB+vnQzM3UfGlMbMJ5ka9ekPPUv6zRGJXhwEU/
         emRg==
X-Forwarded-Encrypted: i=1; AJvYcCViB8GfqHcIYfXVVpFoUAgvOXykXTwgEFfwbnKZ0NfEx5tPbbcJVw7mmgx3jdiU2i6e3DHxMzR5NMhYtASjvID0@lists.infradead.org
X-Gm-Message-State: AOJu0YyD53wOVuwqRicI66L2SgEvLf5VA45pMsiJmccXzlGI7ehlP4Lv
	Wd5L4Jcafur67I4G+TIr08b07+B0NXKd3slGrhV3OhhtTvjhlz5mFRlfltVURcBg2Bk=
X-Gm-Gg: ASbGncsoSIhjNv1oWww9f7ho2Ernl0gGORITA4uwqbYulG4DjwD6x3Ni/97W7Tm5uLW
	6FPDS/r2RNUgRQJ46yhBGUnABYspHf13Zh3XG8TyKcY6ZzMbRdFkv52T6WKC5g3V1S+kz7vI7I1
	qMIs2ANeBP88GVQMIy0l9GGTBeAhIOTJUzQh6Avx9dGZggWQYH7RSXm0hSgmD9F2NrxNvwM5Erq
	IxoELghCQUM87J+Z/Qg2dreBenjghjStGYoob/4S4C9f1aqlU86RNDeaCzxAZduXtFEeBMGfdpY
	+TxSHFiKrW4FoMXT1SB+HFG/IxXHNt9OnhyPuZHehConYyUWse10wXYMQeNAhnlDZIWcvq5qRZm
	BoD8KX0VOzmh6xw7jlens09KT2uVHVyhUAuwcXqrfUA1zKuUhSyg4hbgzdOkLkBTKdBC7XmnImP
	SucDECc/Gb82SL3v8GIG9DR8kDCx2cY9WRfCWT5fs=
X-Google-Smtp-Source: AGHT+IGLhoJnin+O4om4Te+bAwuwm/6HPtCKLHtCftsCB9hZmh2J7RkjVHXeDb2T0HUlNqxwL0iT8Q==
X-Received: by 2002:a05:620a:44d0:b0:863:b78e:d159 with SMTP id af79cd13be357-88354ea751amr2282466585a.51.1760249011609;
        Sat, 11 Oct 2025 23:03:31 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca3defsm730315685a.38.2025.10.11.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:03:31 -0700 (PDT)
Message-ID: <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Date: Sun, 12 Oct 2025 02:03:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_230334_033361_77925F6E 
X-CRM114-Status: GOOD (  12.35  )
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

On 2025-10-07 06:03, Konrad Dybcio wrote:
> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>> From: Alexandre Messier <alex@me.ssier.org>
>>
>> Add support for the notification LEDs on the HTC One M8.
>>
>> Two LEDs are available, one amber and one green.
> 
> Do they form a single notification led, or are they supposed
> to act separately?

Good point, I had to check the phone user manual to confirm. Indeed, it is
referred to as a one logical notification LED. It also mentions the color can
be either green or orange, it does not mention using the combined color of
the two LEDs.

So I would say they are supposed to act separately.

Hope this answers your question, and let me know if more details are needed.

BTW: I will be sending a V2 to update the color name, since the user
manual says the color is orange, not amber.


> 
> Konrad
> 


