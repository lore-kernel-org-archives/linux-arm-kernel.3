Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A1DCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ws629W1+/OZhaFCmlUMwKh3w716Ok42C3gMHhe8mbxc=; b=NfEgzETOBEgnholJLoTO6DPaj+
	OIiHywAfHA8IY3LFmHf1cJ1GYea38S6+NQ/dGGljpl56xmnOWi2gJtCRQbQ221TaIz1rEXA0bZZlN
	k8AG5FuXTUEg+k5/IKFHRS2BQ8S0h/m6JZ8JrJjjet4dFwOc1AdO/qnP+myOalNi5x04hvFl6Z2oJ
	nYzXiP6oQguoSy9DmE0D54dunxUT+QDCSCgM/78T18vJNgp3rVNsXSgQ05eo3lYzagLpRVigOcAZQ
	72gepCz0icLVA+WZoTV54mFGSdbvBrdQSMGTNe1j8zaFIDRH3WRj/ltf6iZ66oIm5csbSmUKbYJoA
	bfTTWt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKb6o-00000000isn-2V8w;
	Wed, 06 May 2026 12:12:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKb6n-00000000isF-1EHn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:12:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d75312379so556485f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778069527; x=1778674327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ws629W1+/OZhaFCmlUMwKh3w716Ok42C3gMHhe8mbxc=;
        b=KkLElb1hjXf9ptAMtjZ9sW6DvsidqeBVDNBnMcLA7smdXK9ewEjdSxlTXVKBpebuI0
         uppKOeEDuCxBRJx728XYX5GwQRcWF/O7I89oytkKDCk5g8enshXSgOgQ8vbuAAL+7FnS
         dNhymEjRPY0lHz+OMXHYnOl7GEX3Khfdzodipl9ahJ7efQCJLlyBEFICKSM9BdlyRCYU
         LXxj5HNscrti8QNoR7U21ftlaeQEvHWf8Hf4DQnUfmOSM/0DhEKMle9qjSqLLzL7sOSh
         c049ZmFMg+OdOGK8hW03l4Ar3ImNiSG0zdsHVwR737WBuVIW3dhamhSfx2aW/IQFKJ+/
         HxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069527; x=1778674327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ws629W1+/OZhaFCmlUMwKh3w716Ok42C3gMHhe8mbxc=;
        b=Djip3utQi7IvSIYl29mXz3Jp1vLg/OmOk2ERGhbTv7OFmRAQQmwY+G2xMECj3u32bq
         KHRYg7Vmr+uBMB64lzYTD0V3teXK55OOz5s7I5ksszpkNSVLhXC7KXztIktXVeONjXG5
         /9yV+h4a+k8CHiGa3ElGyLG2c59s9rtTJsdcdRr5t+a9ikBeWuLe3OHQJL9u4u9rZCcc
         gaeJV3g10xBJRJsnTr8Q7QuIn3wo2P1+1hwkk1Pd05Sml+G0+AKEyyzJwbbqw0QwsLXQ
         bzQXMkqqGjj5DWMpdp7kRVJy9ulOAKwnrxOodEEWguXaBgqNpu8ilO6ITpqyTstPY7Gj
         RPaA==
X-Forwarded-Encrypted: i=1; AFNElJ/Jforms5cbyblrVE4UWlPzHvr7NLib/be71cBsTt8kX6JzlUCm2F1kuKUJ0U2XEKBn4mV56orwxlMsiXvnal+c@lists.infradead.org
X-Gm-Message-State: AOJu0YzzSuU28dLB70vtI5grVk0lcY9Z6z1sQgzdYeAUN5Q9Y2XqOVsT
	nwXgPBXk6KEMiZejYJIoc5fJ0mRwxUCmupiP3rCkOuak7a1Xx2otHB1eToAXUGS4l3g=
X-Gm-Gg: AeBDiev8cuN6YqSnRa0VFXQhSzcAnURa5RbzPemJ5gzrb4/rs2tjQPkNWY92wtyyfR2
	IDIKPp2Iny4kpUdURwVJ/6U8P9JbGEVzAT8rHzLkeODeaba1vSoEXBJz1JTdyRgMB137PbeL192
	qCeqKLUr2YrFdXsR47sRxRL4XWtuLX72eK00d6PnN1k9ZParP0whE7YJRs7Qfa7nZxLIiWXowIJ
	AdT6X3Dh12Cy3AFRe+uM95zaNBtGK4+boCm2Sjg3l3n0pBN6ZGG3+gHt4wgxPw/moO93iN+cRax
	ld3VNFXftJ8f4A4vnpAFbScxtXD0SYfjCwesUmyh3iI3di80VkkKL8KmgFlzd601sc3vwG576gK
	Rhn0Nwio+L9cNcwyV28fiJ8D7shx0aFQfrf691M3tge0FZgm6ZDoRYGmxIlowaHjgKiFRm8JuEy
	xirphN5j0m1t9XgMHNfLKy5NfXK+SZdNNNp+0xwNI2I04=
X-Received: by 2002:a5d:64c5:0:b0:43e:a75e:352 with SMTP id ffacd0b85a97d-45162570080mr4694269f8f.4.1778069526968;
        Wed, 06 May 2026 05:12:06 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12000365f8f.12.2026.05.06.05.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:12:06 -0700 (PDT)
Message-ID: <b7657812-3afc-4b13-a579-6f07d061e2d9@linaro.org>
Date: Wed, 6 May 2026 15:11:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
 <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_051209_374148_E63D2B89 
X-CRM114-Status: GOOD (  19.97  )
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



On 4/30/26 6:37 PM, Alexey Klimov wrote:
> On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
>> On 14/04/2026 11:00, Alexey Klimov wrote:
>>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>>> information and configuration data. Add the SRAM node.
>>>>>
>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>> index cb55015c8dce..cf4a6168846c 100644
>>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>>  			};
>>>>>  		};
>>>>>  	};
>>>>> +
>>>>> +	apm_sram: sram@2039000 {
>>>>> +		compatible = "mmio-sram";
>>>>> +		reg = <0x0 0x2039000 0x40000>;
>>>>> +		#address-cells = <1>;
>>>>> +		#size-cells = <1>;
>>>>> +		ranges = <0x0 0x0 0x2039000 0x40000>;
>>>>
>>>> You miss here children.
>>>
>>> Thank you! I guess I should convert it to smth like this:
>>>
>>> apm_sram: sram@2039000 {
>>> 		compatible = "mmio-sram";
>>> 		reg = <0x0 0x2039000 0x40000>;
>>> 		ranges = <0x0 0x0 0x2039000 0x40000>;
>>> 		#address-cells = <1>;
>>> 		#size-cells = <1>;
>>>
>>> 		acpm_sram_region: sram-section@0 {
>>> 			reg = <0x0 0x40000>;
>>
>> This covers entire block, so feels pointless. Maybe requirement of
>> children should be dropped. What's the point of having children? Why
>> does the driver need them?
> 
> Thinking further about this. I was looking at the schema file and
> different commits and it the right approach could be:
> 
> - add separate compatible for mmio-sram region for this case. Similar
> to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
> "samsung,acpm-sram";
> 
> - update schema sram.yaml to exclude requirement for having child nodes
> and properties like ranges, address and size cells
> Similar like in commit, for instance, git show d0fe6491ddd22
> (or git show 2d4a22e79a5fd).

this works fine, but only if the sram is consumed as a whole, and only by
ACPM. Is this the case for exynos850?

Cheers,
ta

