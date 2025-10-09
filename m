Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3015FCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 05:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=; b=A364ni6oE4CSVb70CJINgLHWCF
	dxeuEa5T1EoGCKAtT7OBb5GLBUtPR2dIqciJv2uixE0lkeVvnNg7gk0Gt3zvjr7WkuXQD7OlmZEBy
	/Z+7PB4gRx7ifFQrdx96vTn7sot2ZmCiE+hH/soGCqebPJGrttuPXJS6JXmy+ZcVVV841Qa6edizO
	ph65Vpcx8P8NuGMIC4Lg+eCZR7XI31sFiJO3Yok7hU59o58tLSq2ieNC/6IBPSbpPWa8fGua4+zPg
	EHebvNvunHQll1bQ5h6Wvr62iW8Ah3ltqOXIf6PvS8yKGq5y4TYGBmdteoSTJD2BtPug0dZ1zDIxD
	QWVcGk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jYF-00000005EL8-3ySn;
	Thu, 09 Oct 2025 05:50:55 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jYC-00000005EKY-1QUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 05:50:54 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7f04816589bso53311785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1759989050; x=1760593850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=;
        b=FiVIpDdLg8fubcTqwUbV0VuNPFamYAGsQahOthhvEiw5/54LVelzc9IINdtFRjBZaZ
         wWLePJe9shBzkqeoMHBKvIOKUIB1hwlpnB1Zv8WCF7hjidlV5wJ3pIRCQx+AjlQpMOFs
         FOE3qXApclFtO3i1/imzys4gbSC2Bq4BgbycZ5sp9/3qvJK7Dsmb2ShTdPgc7gtzBiOC
         phbdFJ7CvhQPNn1aiOqCDpNv0L0+/Bc8w0rL9FGoVFQ6Wh3nq3MmyiP6OQNyi16ChQt+
         Uvc6RdGeT9lmOrSMsZUtQWQb9T94zkefBtDe3f9SBMrIoHCupSeGXaXWX+kCKxHxTZx+
         +vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759989050; x=1760593850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=;
        b=mcnbCmZz5V5NH7kYziwnvbBywlkVc3MViGxE/g3/i/ostNfAXYUbZQ9ZnXGqKQ9K6S
         FrdaJizz3KctpJJnvHwIYRf0hnj5/al06i9zCfQ84K+X9N7+wT/a/3/Ei6TlxNdUpimB
         gb9L1BkQ8xJ2kytx2QL/OL4Il+Q+Wt3a3AlGtAKkw73cG26/A8w3LoFt2O7Z4frt9r+V
         Nrhz59pGFdDZEACvHwByd+QYil/TRH+07tbkMlwIbuvlc8Di2UkcwMOufn1Yu+F5Pzhr
         mnS/JsWfPemkznD9Fi27udHOkaGdy0lxNpUtBETo1npYh/86QTr3vH1yxW1rIw1LYUwg
         L3UA==
X-Forwarded-Encrypted: i=1; AJvYcCWFFPoEP0QmL7Bh7Nfprvn58vtbc00rA6jA0xLfiP+gEuCtSTzSg0OCh1Yj0sVIAO2UlfkkKfSB082Df3xzwXeB@lists.infradead.org
X-Gm-Message-State: AOJu0YzeZTXBlMI+IQ9rN0kD0zGqshj7NPbzdVqCmX9p+S6cWdI0w83I
	jdFAMdSnroIJYZxozlAMh68ibeI2AKoMX0ztfhUm67NR9hJQQoqkf5QqD2TycQ63f18=
X-Gm-Gg: ASbGnct/ssZZ2Whj8XbbExcagBY8AsUztIa5RuUgyik8gMzLHQJV1GDZqgO8htDpJqx
	DiyL7oNCWzQyiaAXaXE2RMM0SNMVpkv12MeMXBhl/LoalnokJBGYptHizSPszf5f80PxM6793Fd
	AVQ6gvJNLzxJpOSR1BFlCLq+XXEfavpZnA61pskmglk8U8A1N9/6ox+OiGtLg/3KNcf8UmvP65k
	U87jiZFtmBSETmHF3oLEmUp2Aa+Xrdxbdfs455+FgMiypK5cY2rx9/FCGOE3xJCOBhaDHo/0JMY
	hgCcmo3nOeQr2Yul5YgedlRjvtmFbYg67Nxr40j/55vnvL4EWGm1Y07EHN7TMCigG8daQMM4mO7
	JTsWdsnzvuAGTXZRsLM5RVOiPOV1nNuJc48Bego17UJm1SEDe85+JwEwXg9/Hndi3RHLVqTxJAV
	xBj4eilodeVqeWJZv5trxWUymyKLnjeGYjcg==
X-Google-Smtp-Source: AGHT+IFCznXbDVprhXyGUQz2c8H3d7UxKBtr6+yolyAKzCcIf8tTzXD2m9VShCCqzveYlA1zyjZR+A==
X-Received: by 2002:a05:620a:1a0e:b0:868:5fe7:8d92 with SMTP id af79cd13be357-88350983f36mr1024873685a.31.1759989050419;
        Wed, 08 Oct 2025 22:50:50 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f2e00d8sm136229585a.1.2025.10.08.22.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:50:49 -0700 (PDT)
Message-ID: <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Date: Thu, 9 Oct 2025 01:50:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_225052_625856_17C8624D 
X-CRM114-Status: GOOD (  16.69  )
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

On 2025-10-07 06:04, Konrad Dybcio wrote:
> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>> From: Alexandre Messier <alex@me.ssier.org>
>>
>> Add the touchscreen device node for the HTC One (M8).
>>
>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> index 36eb42f0f3d9..040a256f9465 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>  	};
>>  };
>>  
>> +&blsp1_i2c2 {
>> +	clock-frequency = <384000>;
> 
> This is not a valid I2C frequency
> 
> You're looking for 100/400/1000 kHz

Hello Konrad,

This frequency value is used in the vendor kernel [1], hence why I used it.

I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
other patch) are still detected, with basic functions still working.

Let me know if I should still update to use 400 kHz. I would prefer to keep
the value from the vendor kernel (and in that case, I will update the commit
message to add that information).

Thanks

Alex

[1] https://github.com/LineageOS/android_kernel_htc_msm8974/blob/lineage-18.1/arch/arm/boot/dts/msm8974.dtsi#L970

> 
> Konrad
> 
> 


