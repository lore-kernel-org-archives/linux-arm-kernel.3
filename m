Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C05BCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMMM1M4ymK35clYhylXYL1Gxaw7kdFwoXGgw7ibB7f4=; b=2QTsKsejCBMFFF3GbH1+DG+Bw9
	HhM8tntvRkn7LOb3HEv9JwAS675Sj7RXkZNaTUb/Q8rBrn/JwQdatXHdIKT3s6wxH6rrHy+w7hrzG
	AKckp/e3CSRWN/i5ZjpaiyuX+nGIuPuT55uOIBAmhdFrr/BsU7eAHTjJ9rSa1n70MOKaZPpxerdre
	MzEDjD5GQ9+2UXj+/9SsfEXjWxFGy3hDjJEIvGowtd0IwUjRfu+Hbwc1Pc7Bp3LKQVT40jYIoV4p0
	GjjJgTKuJ2lWs8RdIFeamnY83S+MME7vpAMAtJqqapyNemYV9fr6xJYMpf+SSzc/lS9fIFLyOszqt
	kGGn7/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxkh-00000006psK-1aoP;
	Thu, 23 Oct 2025 16:01:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxkf-00000006prT-3s2t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 16:01:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42708097bbdso52615f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761235280; x=1761840080; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HMMM1M4ymK35clYhylXYL1Gxaw7kdFwoXGgw7ibB7f4=;
        b=xrS86zdEK8ZoG+VEAWJUqjgj4zUqRvPIth0S6L/zUadaFQ7ooQ9wizK9gHJHChLWoS
         hbR0rtQGQu21RRvfcvM8q9sDuDcS++VUl5v54yQqeCM1G4KB73MoJFgPOAT6u0NzGmsW
         agiIUXBJhJCghuHJTPQnAwb6klE8r2JqkgLu6exCpx9J/B6CqD8Y0qxnIoBCEJPreGks
         YphtUlWF6LNuGtu0JtmoXYDPoRuL3NnUGbs68xjHb9bfAmsMePfTinVZzvDNxLyAgRCc
         gni2i4Z7Pv3WgZLtB+ch4NWiqM6Jq4zxoHH/txAKwtRTbw/s8hL6Z5wNoEhIPYuBFDk3
         3CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761235280; x=1761840080;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMMM1M4ymK35clYhylXYL1Gxaw7kdFwoXGgw7ibB7f4=;
        b=rgBXYw1e589j/OPW4BKRp4iWnLXo96+MLM63HxqXd3t+UdDMJ8X5Erhcx+0UtU87UZ
         pU6dajXzvPxwEuGeJaC2Dzbo/nYdkjijrRRq5v77WUvDSwx0kaZrTuUy4RWmNeQyg9Qh
         3CA09X1ncPCuAi8qWlx7qUJP22yTBs4qlgRk+J7rDABRYYRUV5kGLt/fjuyPfpG/zoJJ
         tU2yJ8jiXRE/gB2qmVwNHt2Fse9q3qRiNCtVCsV/WrbsD/PwPOfUadL9Ye4PPr8M1OHe
         26rHqDIoaPRh21gUJ7XG/ipV19jfkvbev/omz7y6h5RlVYj6edB21lFuTSuvLhaTIwa+
         Tl4w==
X-Forwarded-Encrypted: i=1; AJvYcCU50ewpQbo4HyUiNvoITVurUSFFtkI9kAc8dnw+/AYz0BuUTk7DlYDXkuT/JK0nRpWfmdzX8osMtTDWEG2GS602@lists.infradead.org
X-Gm-Message-State: AOJu0YysG5BIbXRe9/RzauVNSInerMCCYWIyG61PeHRepYu87GWCACbS
	W8GxgAQr/BJWqZeVFMLOwf0KskORitaHLHXBjkgTJOAQZfv2UytVofFPNeaMRRqmodg=
X-Gm-Gg: ASbGncud8QjyIztc1L3HrIXWMYj4uI6tP/NjQhBbnrL8xm9fvPdwjChALCBY7h9SqB9
	cPG4sqIE9xKiPsHm+fhXTtRA8cyDf7ofGa6LPHc82hzZpqkYXKSHLroHhrYSuPugNz+JkjoFNhd
	y4mYmsyIeDfvS/uV4/45h9yPByKW/vifux8mIW17j/AL0Kv9LAqYW672bAedy0ddxM5ROxZ6pjk
	/PC7laR3ZKQMnTDsgovVg0nVZ4p9OxpiPJpw+hRW0YNJ3Gkja2NmlAHeA4NXvLeFkPq/QGn4s1S
	dXODedZjuGyd8uf80dn01quPqOCrFGA/vomVPs4JXn85M4uuEmU1RfRwtEOIIB5ErusMpoFA2++
	y7mKTVDuUBOSVqTDTzwOrSIAjoJpympx7hjwXRVx8sGRVSyo05S92745Q9r5hF/5Vwzx19rWjXJ
	2WdLcOF2bMcg+bipPMkzMQmpBSqi1FbgcW/7rDVBjY6g==
X-Google-Smtp-Source: AGHT+IE7SLxl/2nK3Pkv0EEIxnqVO2wMoT+5I1j2a16NOwPkp24r6heWqdb+7CWJTEKpXFlALZ1nbA==
X-Received: by 2002:a05:600c:1994:b0:45f:2c33:2731 with SMTP id 5b1f17b1804b1-47117874694mr104333465e9.2.1761235279954;
        Thu, 23 Oct 2025 09:01:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428e9b2sm103977805e9.5.2025.10.23.09.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 09:01:19 -0700 (PDT)
Message-ID: <f1bc82c0-8800-42e5-8a4d-aea209acd0f2@linaro.org>
Date: Thu, 23 Oct 2025 18:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
To: Marek Vasut <marek.vasut@mailbox.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <3381308.aeNJFYEL58@steina-w>
 <e6b282cf-e9de-43b7-a8d4-30e67cefe430@linaro.org>
 <5d042f21-274e-4b69-849a-3342d77942eb@mailbox.org>
 <00555ed7-1aee-459a-ae60-0242809d7b85@linaro.org>
 <07aba8d4-533d-40f7-bcd3-548704d7d228@mailbox.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <07aba8d4-533d-40f7-bcd3-548704d7d228@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_090121_998648_018D43B5 
X-CRM114-Status: GOOD (  18.09  )
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

On 23/10/2025 17:53, Marek Vasut wrote:
> On 10/23/25 5:32 PM, Krzysztof Kozlowski wrote:
>> On 23/10/2025 17:27, Marek Vasut wrote:
>>> On 10/23/25 5:22 PM, Krzysztof Kozlowski wrote:
>>>> On 23/10/2025 16:03, Alexander Stein wrote:
>>>>> Hi,
>>>>>
>>>>> Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb João Paulo Gonçalves:
>>>>>> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>>>>
>>>>>> Enable the necessary missing configs for the i.MX95 to boot and also
>>>>>> have Ethernet working:
>>>>>>
>>>>>> * CONFIG_NXP_ENETC4 for the network controller driver
>>>>>> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>>>>>> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
>>>>>> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>>>>>>
>>>>>> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>>>>> ---
>>>>>>    arch/arm64/configs/defconfig | 4 ++++
>>>>>>    1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>>>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
>>>>>> --- a/arch/arm64/configs/defconfig
>>>>>> +++ b/arch/arm64/configs/defconfig
>>>>>> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
>>>>>>    CONFIG_FSL_DPAA_ETH=y
>>>>>>    CONFIG_FSL_DPAA2_ETH=y
>>>>>>    CONFIG_FSL_ENETC=y
>>>>>> +CONFIG_NXP_ENETC4=m
>>>>>>    CONFIG_FSL_ENETC_VF=y
>>>>>>    CONFIG_FSL_ENETC_QOS=y
>>>>>> +CONFIG_NXP_NETC_BLK_CTRL=m
>>>>>
>>>>> Are you sure this should be module? Shouldn't NFS boot be supported by
>>>>> default? I might be wring here though.
>>>>
>>>>
>>>> NFS root is supported already with this being module. Yes, it must be a
>>>> module, cannot be built in.
>>> It seems I am using it as built-in on MX95 Verdin (patch is posted on
>>> the ML), and yes, I do boot from NFS root without any initrd/initramfs.
>>> It has to be built-in for that use case to work.
>>
>>
>> Every arm64 platform is supposed to use initramfs and we already use all
>> over the place.
> 
> Shouldn't the platform also be at least bootable with the defconfig ? If 
> yes, then initramfs is a mandatory requirement for a NFS root boot (not 
> a ... supposed to ... optional one), which does not seem to be the case 
> until now.

It always was a requirement, nothing new here.

> 
> I would argue the ethernet MAC support should be built-in to achieve 
> maximum utility with the defconfig.

No, you missed my earlier point - all decent platforms already use
initramfs since it is really not complicated.


Best regards,
Krzysztof

