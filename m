Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CB3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=; b=5Ef7dSsb5Ra/shJQRqMCdXA97R
	VaS/3OUIVLOU7wAHaqoonaI5+t0V2Uxbkz0/YwP/Iq4S2Q1567C+4Jlj2aARm2InjotdcPJ/RvWgR
	UxWjQKrWNh8PsmFSGx0y+cRM2bRBCepL7CA8QqGpD/lC1xsOw4aBEsP47NyYgfrOR2Jhv1rXRvjxu
	j+WUU2+i1hAQcpIzKA23tWsXwkS0rCqZJjWy8A/sa2bXmzOhFZislIfpvG4OgqsH/lsE3UGsuOgbf
	AYv35Z4CrAlSuRS2yMqCUFp/QONWJMsPKoqJfV/M+WLxF/akVAy95Zo2wGHJ2T7yzCgN04GNJwKxC
	EyXSOWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJD2-0000000Dtdb-27Bd;
	Wed, 10 Sep 2025 11:41:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJD0-0000000DtcH-2eei
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 11:41:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so42135655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757504513; x=1758109313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=;
        b=TDKi7fivFzgP/zrUsCbDWOghvTb5j5YOvWzyR5Gy0rQUwv9gZuxIRCxi5ZUQlwZTql
         rycpNLoRlfhFNcL+JsWNZ/9fOclT81PH0IcuQTZf/LTn6rJBFdBZdP5OnHoxHlNe/DaJ
         W/RoV+k7vAcRFNPHGjXqde1EAhcyrq0vQmWPegNLPGKFRIN9jAguXwADMg0xeLTENfaP
         ova6GF3eKBUaFjzg0Y3c8bVA1zWatLQe+xFj+64SqYqb03ucvLIoZt50fbCDBeGCOyR/
         P5RuGcpZIPBmBLUN+Lw2OtjvP4bdiB/5P3LDARv+2OE77YpuInMtbwD/yy6FdIx3CFfm
         Iggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504513; x=1758109313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=;
        b=V3Cyi+7ArzG3vV0TBDCePmWK/wQmUyNw3e/JQoWyFWlyUwZGF7qVRY32GowrTwyiCd
         /GmsNRg49CruBaFd2KQqYTWukWUd2vvRUXWb1xURdWSUzD2d+gaapyeRXaT+wrWhLc9g
         DIl2nrZ7xBkPzTMj1ht2/gnUMKbcGa7JPvBTvmweeVwvYJaO4mfCiA9ICFoDXvupqwRy
         Eo7Ki79Vz6tc+tOh5wWW8H0k1WRA9TmwUWNYZWfQjSAJChmXiyy6HcgclPkxp1QWaocJ
         TcmHZOSHexSgfEzsj2e2ZzrNK2qGC0KhwedYxpNuuu+VNhcu7nQ+I7ck3DhvQW1n7nHR
         rK1w==
X-Gm-Message-State: AOJu0Yx9X1LKzZUegnPH879w8Rnu7XEaCHsY235MPMql3ciGHBBzEf08
	ZRICTN4lGQd9teq+U2guCmzz+XP1kjDWv+lkbnoTyiz6FiwNTjGBDKqxYHhK19tILUg=
X-Gm-Gg: ASbGnctDgfktsxMr7jEFrs3inDDpQrlfZd5dKwj7uA37hvXUACzaecEdtzIiCEkcTns
	rF0GTMLeerjGjV5qzCMdZvIPFrWMJDcrRncf//NCxoS46/jtu2bJ1Tv6rhyQR2xWlnwmebAbMYV
	SqN2t04rZ38UBoHI2JBBLefOZRyzXof7/OfxcCzcF9bFqwFcFaBeb88LLCAyc6fzR5NNiLrGVej
	lx2yX5fQqSks9982wq3JOWf0P7CwvndcZewAiOWOpNnCtQGX/KnZQaUuPVqf1FIGqLCQOW+XnmR
	eq0cHsG1wB1ToH6mG/tn947ehDr7v4Ij6L9DNY+xCQUlXGTri+rzORKk9vn2a36zff8ajH583y2
	jpYB/6p87q9JGt2KmBYON/KLeGcciv1PYV+RJeDoaAseLBnZ33oVGcFlsJ22r0g0jWuaFdjRr2l
	PxEZ8I8hrPDNOlJx76RIc=
X-Google-Smtp-Source: AGHT+IGlxSt/xs7I3D7ZMakn9Gr+X1/Zuc0c5vvYIA/kLFFFxTaanjZmiqDr4kYOYkKHuiNeNUlj3A==
X-Received: by 2002:a05:600c:4453:b0:45b:9c37:6c92 with SMTP id 5b1f17b1804b1-45dddef02f7mr145102055e9.31.1757504512855;
        Wed, 10 Sep 2025 04:41:52 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259524sm24547495e9.21.2025.09.10.04.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:41:52 -0700 (PDT)
Message-ID: <61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org>
Date: Wed, 10 Sep 2025 12:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-5-quic_vikramsa@quicinc.com>
 <e4d3c2a3-e395-4f60-8cff-fbb9a1611ec2@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e4d3c2a3-e395-4f60-8cff-fbb9a1611ec2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_044154_694945_032AFFCE 
X-CRM114-Status: GOOD (  12.50  )
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

On 10/09/2025 08:02, Krzysztof Kozlowski wrote:
> On 09/09/2025 13:42, Vikram Sharma wrote:
>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>
>> Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.
>>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
> 
> There is no such file. Why are you not fixing the patches on the list?
> 
> 
> Best regards,
> Krzysztof

The easiest thing for me to do here is to take this patch and send out 
another PR.

I can fix the commit log too.

---
bod

