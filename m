Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3400FC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lb0FpvvpSdoj0hDfslcUa9MeWIX/fDu9Too5G2vuRxM=; b=CND5k31MwKGyyZEJrTw2gRjoiA
	NQ+nFyGDi/L1t3XswAzoOCvkVfbOjlatL4pxCCG5e2ZgB5S96YUTWhU9oMDV0N2NfK6Zjgkskg1+y
	t3hl6vGEnUtEtgTeSC+1Ec0L8A5AiaSewxLrcSLDNhL/or/cM3slTcgTUjaQRuN727Ct9M/cbh43D
	cLBsryYaCDOYc+MMTSiV7pXGR8vXPfx8Iznt7DRTMDVvmeN/X2Jb99ow3phtM+Z2vlRpoMGOql9ZW
	PY/EPPFDHC2As9eW/px8qXeRbt0XXUr41kcvBOoR8B8z/9NlkPJE4rXJ4dksHGOhgeIWmlWujGNQm
	EZeYz7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNIK-0000000HWd8-2R3r;
	Thu, 16 Jul 2026 14:42:36 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNII-0000000HWc4-153X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:42:35 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so3170119a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784212952; x=1784817752; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lb0FpvvpSdoj0hDfslcUa9MeWIX/fDu9Too5G2vuRxM=;
        b=jiZJoyjQYbK62UFdVG4B/un6dTwNCJ1NT/Exen21gobpD93WmljPrGR2E5vlrNK8nJ
         hxYfDBPBEEDqAGrjlWMfoDVq0zeNj4qV3BJSZtb7/BvJp9fUdsihFOEiwgvXQNS4fsow
         I+x8H+2Bw9tbl5D02877cw+000/0LIrQJdsr7j2mIVRUoWemmsPDm7Qp36EQSClybQqH
         scM7isLXc3Rn8PXxJ1bmExp7g9YVbp8tAbjNotT5u/dJdjRH7NUUKFmk/EEu+vFez7rd
         mj+YBnPrVbW+0QZ1az7NS/ds9ragr4cfoguasWOBUJ1ybxqSva7Aq0+kxg3oh/eT6jNx
         Fy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212952; x=1784817752;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lb0FpvvpSdoj0hDfslcUa9MeWIX/fDu9Too5G2vuRxM=;
        b=cAlQB0jsZxt+6TgWejMNkfvkSQ/JNRszbybjGKY+5pgn4qE4LS6YT8uXixFGmw7D6y
         bjS76iQPs23+AQo8OBpiA5i7chs6bL4xzjJsl4XM50EqQmKwoDZIi/UckFEHHiuya0KO
         oMBM8ITTWLcP43wvN6ym0xzigzQo26OiI0kdaKO2SQlyAIGCixBkvUNmhK2iZ7VPdSUp
         strXofeOw8COSMHURebW/liYSi7xFf2Xr+KLJ675DGMfl4eQ6lQacl/dgeErA5uHP8M2
         5pn387wZzY133Ms9zJyVz5jIRPjGi6TCGZ0V1J1F37tt7Hvae15vJSlNk6Iv6g5wvLkN
         JTQA==
X-Forwarded-Encrypted: i=1; AHgh+RoOPvNAyhcLv9wzM2IEimTzq4yPTUMkJ4pF62x2OYONFHuaHJ22WQTJ/bQrdmNq19jQJ3B0dT7kjRAhN97at9W9@lists.infradead.org
X-Gm-Message-State: AOJu0YzeXCZyOeX8i8/v1sVsn93vJQnPDqHIdS85ECvWfltVx5uh3JTd
	d6CNeMxjf6A1kBEu8eMOmnzNTli9RmGcOJVO7NNnRPt1gzlKe1xvRkJhn+V7y+IlkWE=
X-Gm-Gg: AfdE7cn1QL+1FP8kSZiGXB/l9e3WhTky5Ml8aIVQCyrQsFNT0Zy0Sbz+SEDTUDKEEZF
	FlZXtHK0C0lmou8t3BuB8utrCFsRmVjJbD8uMxwfQqr3PLyFB2Us2QpCBfJfq3Dm+KtrlWEk2+l
	n8TzxAFeA1v0evl44TLzWTgzterBF2tzUm7crlO7Z0E22/8vhNLG0bbhXrJhkwhZA+qDcfQFdcy
	P3GpNimoKFndZYB1Khv7UMGUZcq1roDV4K6r0kZd7GRr8aTtL6kkqpINEBYQiDJoYmKOX4AXDQL
	zLhU2faT8x2JYgfXwXOsj3KgDLpwVqEzlT+HDpyi5kf+Vg98eBBy/uK/00kZnv3c9cmx4A5a51u
	QWgDCh0RPawLWhNfEGPigi0GpSbv57dPzlr2nFiiOxT3zVJG3VRQc4flEXqy2trobqR5XkO39pa
	koCDMbkDo9jp7paefLZgsFwxfu+yfVwOFy2vIs5iZAy1aZ20hJ3n8rYg+pJQa8HDQE5nfI
X-Received: by 2002:a17:907:a48:b0:c16:6c0f:a810 with SMTP id a640c23a62f3a-c16790fc001mr454407666b.9.1784212952048;
        Thu, 16 Jul 2026 07:42:32 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5e58:c548:d5e9:96bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16874a27f7sm221311966b.57.2026.07.16.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:42:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 15:42:30 +0100
Message-Id: <DK02PDXI9JAT.R27YE9T9UG5G@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
 <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
 <b7657812-3afc-4b13-a579-6f07d061e2d9@linaro.org>
In-Reply-To: <b7657812-3afc-4b13-a579-6f07d061e2d9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_074234_333404_22161D3B 
X-CRM114-Status: GOOD (  17.67  )
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

On Wed May 6, 2026 at 1:11 PM BST, Tudor Ambarus wrote:
>
>
> On 4/30/26 6:37 PM, Alexey Klimov wrote:
>> On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
>>> On 14/04/2026 11:00, Alexey Klimov wrote:
>>>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>>>> information and configuration data. Add the SRAM node.
>>>>>>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>>>  1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/=
boot/dts/exynos/exynos850.dtsi
>>>>>> index cb55015c8dce..cf4a6168846c 100644
>>>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>>>  			};
>>>>>>  		};
>>>>>>  	};
>>>>>> +
>>>>>> +	apm_sram: sram@2039000 {
>>>>>> +		compatible =3D "mmio-sram";
>>>>>> +		reg =3D <0x0 0x2039000 0x40000>;
>>>>>> +		#address-cells =3D <1>;
>>>>>> +		#size-cells =3D <1>;
>>>>>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>>>
>>>>> You miss here children.
>>>>
>>>> Thank you! I guess I should convert it to smth like this:
>>>>
>>>> apm_sram: sram@2039000 {
>>>> 		compatible =3D "mmio-sram";
>>>> 		reg =3D <0x0 0x2039000 0x40000>;
>>>> 		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>> 		#address-cells =3D <1>;
>>>> 		#size-cells =3D <1>;
>>>>
>>>> 		acpm_sram_region: sram-section@0 {
>>>> 			reg =3D <0x0 0x40000>;
>>>
>>> This covers entire block, so feels pointless. Maybe requirement of
>>> children should be dropped. What's the point of having children? Why
>>> does the driver need them?
>>=20
>> Thinking further about this. I was looking at the schema file and
>> different commits and it the right approach could be:
>>=20
>> - add separate compatible for mmio-sram region for this case. Similar
>> to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
>> "samsung,acpm-sram";
>>=20
>> - update schema sram.yaml to exclude requirement for having child nodes
>> and properties like ranges, address and size cells
>> Similar like in commit, for instance, git show d0fe6491ddd22
>> (or git show 2d4a22e79a5fd).
>
> this works fine, but only if the sram is consumed as a whole, and only by
> ACPM. Is this the case for exynos850?

Sorry for the delay. Yes, as far as I am aware, this is a case for
exynos850 as well.

Thanks,
Alexey



