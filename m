Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE3CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=; b=23RcXs4QSQNPtqwrD+/itFvAfh
	6zSWpmsbGX0qZUIcI4MpUc45lU3iqJUJySIWEnV5uywgVinoSaRBVeBFqXJqs4GaSZfWp5t8ueTpC
	YBaB52yWVsl5DY84dwY/Yhp+GBaDvBf2WRTTvRunJ1Z4oaf19HfOLAaGVktTDtKYv9ca7FLsQ27Hl
	Ei5npLqDFeYRylQ/9lewDtHzNdVv9TYVD7SGQri3nICqkBirMP8OY2SunVp5kqD9/JzLXK39SEoR/
	JyMLyOhrt5uHF0U4OqgG5CgF2NPUQzHv3beXkw7P+qWiSzdNGdSDk55quFDN+/ajEh5VJzJ2bk3b8
	dpWh2wzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kee-00000004Hf2-3j9O;
	Thu, 16 Oct 2025 09:52:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kea-00000004Hc8-3qI5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:52:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-582067563fcso96387e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760608329; x=1761213129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=;
        b=es64AFqGPiNYMA5qd9tGUidMs8Q8FI+H0rWK027MOe17cIWQJ2YHqrBF/fDlPbEWLO
         McVVzfvUkaQZK8VYKYLui7oWn9nB4MAFpvfBpoqERrMpU0MxPwS0QfnSCx2u5EClmKAJ
         HqwfIyXPbh9Vb+jk/SBsMNypHyIOpc3aQGqaR7l+KH2+4uYLBHcqT47WSqBAg1Bl7cGl
         /E1IevNoVkO/M/Foz+iXbv7LcDPh6nRwxL86kBl6/71pPJJBXTxAyxBiLQbthYYWsWhe
         NX0A5KiunF1SRH6tLP0ZE5mvc4hAnRNPZpGryZ/TZJTPZadtEiUDSpLmdLa6kG39er4L
         ohlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760608329; x=1761213129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=;
        b=fZCBv8dEUerP842m2X2UcGvd/sB+26qs77cNwEYii2eCboo9cxbEMlEplW9OFUoJOz
         fEncp89zLSMQPGainwYkABosRfGFWOJI0Kcw/Yv/6GUOKbvQ6jRnzdqiVgnvJDAM7Vi3
         QAV1B8yzLZoptflTJfuZsZKrTO4a9ijnFh3GRqv+MYdpGAWNn9yR1l1zvA0q4td0h8Yr
         /fMs3zbzMl2lTbttyJ9UaHbepld+Qs0PIeTxiLfGfVLxQ4DH6hEP4RLrsIEy1ccfS2jC
         tUWO0hwbV2pQytLzXmuxyprHyLFNjfuFUknpsEJR5XD9FU51gURVnRILyjmJrw/nkn7V
         CPOA==
X-Gm-Message-State: AOJu0YydzLJr17crecJgt1Iaqvz50cfg/dg5fGy6wjJgs/TvOtnL/sDA
	+2cOzFdTiswLei6uy50LhDP4jjwFoiYKwkkjlXb+G/8O38URxeODV4lgZHprphfctIM=
X-Gm-Gg: ASbGncsWBR+zOeZcleEzkaOgJur3OxgN/XVqEi3ePd35gNSkZSU/1cmFXOV/64TJT5d
	voyW5QZItb7ADxFiF1paQPDBK/UT/9NOmqLZPIMloBGkKn3fdu2XVQ4xrU2zBB9gd3xBjIo1exc
	QbFcmf1sZhuE6T1t77m9EL52GUqxQBgg6ZQ4EO4Ip9jS2xc+aNuwxhv6Lb022f92F6xrZgWjz7Q
	FNlH8D7tDCbIj5povoV+Hs99UEr64RCO8rewoKnfmvtsd3NIzflRP1HWAk7sD73RfGtKnlc1hr6
	lRynXxoIYOEuG/Z7cYOznbcETWrlpjCe7kuvihXUuSNa0HYwCB18kiS8DvuUN+8u6jyLtdpGFoH
	dWt+CZvkefgtwiCRKep27uA8wIooN+uHovQfogwk30bhmd9oLR5pREsPxlvQ4Ha64xk+n2N1kBN
	vp29QjXcnEcxsQf11QCnqWFjkOd5edEjaZv/Taw3YRlcFgNgvnQoREgNOcDMk=
X-Google-Smtp-Source: AGHT+IHGrMqF/SxK/b9Eusc1EmuTMX1oF3LiG7gqz6PSDdypVz3evm0d5vIiv9I+NCKFDiLfXQtkSg==
X-Received: by 2002:a05:651c:2224:b0:36c:ebb0:820c with SMTP id 38308e7fff4ca-37609e72b63mr40963831fa.7.1760608328682;
        Thu, 16 Oct 2025 02:52:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ea1fsm54348501fa.3.2025.10.16.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:52:08 -0700 (PDT)
Message-ID: <ad05ed96-80fb-448a-a264-f4b4befc5d30@linaro.org>
Date: Thu, 16 Oct 2025 12:52:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
 <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_025213_016198_4B22C093 
X-CRM114-Status: GOOD (  15.50  )
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

On 10/16/25 08:59, Krzysztof Kozlowski wrote:
> On 15/10/2025 20:49, Vladimir Zapolskiy wrote:
>> On 10/15/25 16:01, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the QCS8300.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>>>    1 file changed, 171 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> index 8d78ccac411e..acd475555115 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>>>    			#power-domain-cells = <1>;
>>>    		};
>>>    
>>> +		camss: isp@ac78000 {
>>> +			compatible = "qcom,qcs8300-camss";
>>> +
>>> +			reg = <0x0 0xac78000 0x0 0x1000>,
>>> +			      <0x0 0xac7a000 0x0 0xf00>,
>>> +			      <0x0 0xac7c000 0x0 0xf00>,
>>> +			      <0x0 0xac84000 0x0 0xf00>,
>>> +			      <0x0 0xac88000 0x0 0xf00>,
>>> +			      <0x0 0xac8c000 0x0 0xf00>,
>>> +			      <0x0 0xac90000 0x0 0xf00>,
>>> +			      <0x0 0xac94000 0x0 0xf00>,
>>> +			      <0x0 0xac9c000 0x0 0x2000>,
>>> +			      <0x0 0xac9e000 0x0 0x2000>,
>>> +			      <0x0 0xaca0000 0x0 0x2000>,
>>> +			      <0x0 0xacac000 0x0 0x400>,
>>> +			      <0x0 0xacad000 0x0 0x400>,
>>> +			      <0x0 0xacae000 0x0 0x400>,
>>> +			      <0x0 0xac4d000 0x0 0xf000>,
>>> +			      <0x0 0xac60000 0x0 0xf000>,
>>> +			      <0x0 0xac85000 0x0 0xd00>,
>>> +			      <0x0 0xac89000 0x0 0xd00>,
>>> +			      <0x0 0xac8d000 0x0 0xd00>,
>>> +			      <0x0 0xac91000 0x0 0xd00>,
>>> +			      <0x0 0xac95000 0x0 0xd00>;
>>> +			reg-names = "csid_wrapper",
>>> +				    "csid0",
>>
>> The list of 'reg-names' is not alphanumerically sorted, this is a newly
>> introduced sorting order pattern of CAMSS 'reg' property values.
> 
> Please stop inventing ad-hoc or fake rules. There is no such sorting
> pattern for this property, which I expressed multiple times. Last time
> you claimed there is some sorting by "values", now this.
> 

The sorting order above does not resemble the order present on other CAMSS
devices, which is the alphanumerical sorting order.

The same order is supposed to be kept.

-- 
Best wishes,
Vladimir

