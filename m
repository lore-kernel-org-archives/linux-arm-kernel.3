Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D677CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=; b=oO24a0OgNoTPXxMg7fp/cZUtyl
	fz7HCONu0CmUum5lmpRJBbN9gsyQEYZkuoWHTX+rWBEu1dFIyQcy5WwNmb3haJ4DiBb2nDZAM2mn+
	Xu4R1CTD6vWBUXNEhlOHbfO82TC0mtsjmLr6siDQU7TC+LEXBxWk6dZeCZCrV7h1ucnwjF7dBaNGo
	YE67ztzXkPwj+I5RUayqF6yRsVcziZsBd8ptp8LDef5EPb5/h9qE6oUGGWP/j49wkUPjxdjLqaGL/
	nF7mFdeavIZx8dvFuIJFhXhALeozmS0+euiOM3buf3YIPY137DHz3tjy/ls96DlWgEPEX33H9KRdd
	oZextzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5HQ-00000008IqW-0tr3;
	Thu, 21 May 2026 15:25:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5HN-00000008IpP-2365
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:25:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LFIBLw3343616
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=; b=HRAhzWXEU/H7jVTN
	MtmG3ClIh0FQZcH0MEQMiv1psF0V8sFCip5Ya3leHY2qum2RU7B3QuI1IjzJD3W4
	aXphinIk2uQ8f9a75SWZVpyHLx0kxgwiApJu2XqXvTwSSPZWEqLnug6UR37Qu3I3
	ZCsQpy9I2om77tDLvH47Tnp/leD6XUjwYHr1dIrqwI6+c2Gp8EJek28K+vUrfZgB
	RHW9izdv7kzMZO2atfPULFCpuXSm+8TsSYXcXkbddYQpbFpZ/lw8uFXI3iLKGuLB
	Gf2Fa60yKhjMavW6J68scKLbI8nL1scODNR3X5Db1IFpPH8vbtLohS0tU7vr3Fr/
	pGZHLA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9waht2b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:25:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fd51d5c22so12129280241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779377144; x=1779981944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=;
        b=YKJyAJ2afUwKOIYOGZlqDWenBNBm6lKsvX9asG2TB7AWhiP9vsShRr6BDxfKZsf/sE
         I3EoFxU5YhY187L5YLK+8QkFsPClNR3RvloUavt8ayoBD5Y2DfXf1EnJMo/aMQ6N3Inr
         NqF1sNRgJvZduROd0iu08REgIjin0Jsd0FzU4hHRk1+ubcaEDWI0OZ1TQfBez1gT6BkI
         ffMt3PHPgTEpj3pg4MRARt47DUv4xcEw+LiWE0G5GN+Uw01KmBogG3eHEtUOYe5Y5LC+
         zcWMlB98wyY6LzvfDh6ZEeP9JakjUXPBEJSSv6WF7Ygpll59OPN3io5FKvmjkWOmyCaD
         V2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377144; x=1779981944;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7275bNqXcJ16wSLEQYFTe8fF465m1Mn+HIb1hm/nRZ8=;
        b=DMNPnzgyAE+sB8sFYu24H7Memi6C4Upo/+CXYKzMkYOFtNmNQKUwyW2zIIRm2hWzMr
         C2XoAYjfkLcL9y9Cctkg7epXA0pikHvwOzAAfeIBujyYLWKYF9J4Kzir3kwRvpVVSfig
         Z3QhEAZ+WaiDy9BK+nCTTe/zOYdhrjgJ0PRPqndDYgA6K9Si3rgR6Lvt7lTTt85jnWXL
         oUTUCEUysJAydgPPg+wNc8nOAuSY17JYBfqenRuW8I1LTasibNApLtv0y9NwKxvZlEvz
         T1jSqBpVbxRSHuXspEFAzjwD4dvSmn8zhh+P4KwsRNNirkXLh/vbinP8nNM1xw6HEcTM
         V5Bg==
X-Forwarded-Encrypted: i=1; AFNElJ9UppvfOk5/yKfvC0JQu1kQWXVflORW3NRJamPNaKubYUVlX0Ud2o9iTy+czfMwVE6zbXmqisoRzzPIP1MTWo6N@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqbf6FOhEDrmIsjieOKrqn0GZomA1KlkX22kmBcxQ/ImSKqksV
	g5fA3xwmEcoo16ACeEade9GOCXmpJp3FCu5vWJ1dOFEa6N+p4/yYyPNSIRo1xXyHwYm3fNpwxxA
	DhE8/Ml2LXnLGBLfEkq3NHn4qr+o97YUwNjqLnY4aU5Ql5pHSeUy9lupREIvMY53IAxiWPm7Zcg
	q+xw==
X-Gm-Gg: Acq92OFNs5jhOWWigLDyGdOWBpJaCKzAN6Wnp9jxrvMc2zmt97+/tCkGXPilWwx/VmM
	e5NQx+9D/ODFR5JaZCnONscHVjcd9k6QMH3B45wwi9C+Kh6ecFXhyLwpuUNmWBrWKcZ8Qph30JF
	+HL/AHrutgX07EGoAA3H2inmkZE82IYqLVb7iniWxYGnqJqLyD46EPxb19MN5qC8xK7N/zDoz/J
	n5UXdW1it9WANufesAl0jce7ay+w622bZKZKASB8X19lkbR9B0oUJSnZHu5kD68Q/0wFsvFh2ch
	F3If5D6hGa82atP9s4TCoNsC5ITZkMEfrmDmGu2IMcRGOqGuKAu0cWxeMn2skk7SHnInrfLUyFn
	5T686Hyle5MSGGt2WeHRGqdJxBKDGbEKhpxDB9jgJhd81wXlT
X-Received: by 2002:a05:6102:571b:b0:660:d5b8:899a with SMTP id ada2fe7eead31-6738c8c92d0mr2626289137.5.1779377143872;
        Thu, 21 May 2026 08:25:43 -0700 (PDT)
X-Received: by 2002:a05:6102:571b:b0:660:d5b8:899a with SMTP id ada2fe7eead31-6738c8c92d0mr2626225137.5.1779377143408;
        Thu, 21 May 2026 08:25:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d52c8bsm78386875e9.8.2026.05.21.08.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:25:42 -0700 (PDT)
Message-ID: <b83ef885-3d29-4e46-917f-26bb8490fe35@oss.qualcomm.com>
Date: Thu, 21 May 2026 17:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Drop non-existing (yet) PCI_SKY1_HOST
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Peter Chen <peter.chen@cixtech.com>
References: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NCBTYWx0ZWRfX3yNsgLPfyM3x
 oKLFOrelgZJzdllZfJ7u4YsDi7j11qNpJJvlCU9EsrZN18OtgODXB8+/Jq7296RRKJJw6KtFQYr
 yvsmcWzFqCj3D2rYkniMf/pMAgLVQKkqnPlvo6TR6jufOohvW7NvA2pvVS0xx3HfmKZx3qUgXV1
 9a+90X06/5cDizWnUsvqIAz2z9bnCPAEuEnn+DwH97sXrP3N8wCaJJ0ZiX3FKkG9m4oHzrtpyMq
 qm7PLys2gEMP9kBMlEAMk2qUm+pYaE6GSo8fk5h2M3N3XNRBcVMojrPPRg/PHC5UcMhK5dqYrQs
 It+lYoDTZX1ahYE0UQ/p2/MSX6P9Y8ISVKGwhRLmnc6ovLaSNPqo1/KQ8qlIIt+WFPH9CIIPiuk
 wXU49Z5yJVb1CkNA59YkxnUl2TA0XJmcAIWmev4EAKjucH+OsYzibOk6EO62JxsaC7vcterM9Vr
 sR29SJMt4thtKCYD4ZA==
X-Proofpoint-ORIG-GUID: 44z5R8UfqyHxZ4AJ1M0jJvoJG5HFRgXi
X-Proofpoint-GUID: 44z5R8UfqyHxZ4AJ1M0jJvoJG5HFRgXi
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0f23f8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=KaF378oVaPLUFMQH0kEA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_082545_647955_91FFAE6F 
X-CRM114-Status: GOOD (  20.50  )
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

On 21/05/2026 17:21, Krzysztof Kozlowski wrote:
> The source patch for commit f54f7979ff88 ("arm64: defconfig: Move
> entries to match savedefconfig") included reorganizing around
> PCI_SKY1_HOST, which is only in next at that time and was not merged to
> soc tree.  Applying that patch caused some conflicts which were not
> really resolved correctly and PCI_SKY1_HOST was added.
> 
> Cc: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> This should go to soc/defconfig branch.
> 
> The PCI_SKY1_HOST will come later with:
> https://lore.kernel.org/all/20260327114628.3800886-1-peter.chen@cixtech.com/
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 094bb9cd8764..4ed684efbbba 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -232,7 +232,6 @@ CONFIG_PCIE_XILINX=y
>  CONFIG_PCIE_XILINX_DMA_PL=y
>  CONFIG_PCIE_XILINX_NWL=y
>  CONFIG_PCIE_XILINX_CPM=y
> -CONFIG_PCI_SKY1_HOST=m
>  CONFIG_PCI_J721E_HOST=m
>  CONFIG_PCI_IMX6_HOST=y

Heh, I see the Cix patch was already merged, so this is wrong :/

Best regards,
Krzysztof

