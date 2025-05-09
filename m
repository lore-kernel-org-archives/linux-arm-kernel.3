Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F1AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tT4nmiF3B+9Zf02ngFo5qPxLiB0Cnk6TGo7gdbEV7tc=; b=YGmD0TdJy7k//+9gY9EjSvmG8H
	fJt798a3jnEJ7CopnbWinVzhBK6F0oUGKHngqTifuH2vJwyT3HpugUkgUjOjBmECmyCBJyjneVydL
	1BkLRzcOiKP0metR1H0M7MCwxo3Sok8bY3Hqe0SNRtoplULZbFyGFHmfLwKK7Gabr2pNaXyhMk/Ue
	/PzwNX837W5pekd2niv2Y7vz2Jd9o0Gqls7o0gCyvI41X1HE3pzWBSAlU5GKJeOYGDI6WqlRUoXZs
	/aHKHDjmb1msJQErMC505j+iQEBjVApyimz4NCKa07BbdJ1SuMgSXAggumeiujPvtvoqUIuBpXmoG
	FVougPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGz1-00000002aZu-2Rvn;
	Fri, 09 May 2025 06:13:19 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGwt-00000002aD5-2rqT;
	Fri, 09 May 2025 06:11:08 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-ad21a5466f6so108127166b.1;
        Thu, 08 May 2025 23:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746771065; x=1747375865; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT4nmiF3B+9Zf02ngFo5qPxLiB0Cnk6TGo7gdbEV7tc=;
        b=JMwrEXO0IcLYpJOaT2mlvpy04AY6mOdK5QUiTpF+UCCsJI8LeQfaAUyqLOzf0iSmQ7
         5Oqs8hVj/K3L9gpm1YYHl+CWGrNswXIgOUgHK4z1Lq7EvdeeppOY9OLslfIMJlFZoM9F
         NMkUT5YVuRokkqbHSzwy2/vbTX48kl/hhrs/EwinCVUroPbOADQR0BCpKL/Itvzyp5Rt
         gdGz1Uq7GUZvrVmxjf0rpiRCd9a3PFdN0oq8/E4OteOUKAxPscSOxgW3l94PU4cSs03w
         yWATtUxyOwGSbTtvGohKnSVdEefQoap8ka3qZpqMWnYX0M4vAoyjsuiTvIbacPu2Ekdg
         WSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746771065; x=1747375865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT4nmiF3B+9Zf02ngFo5qPxLiB0Cnk6TGo7gdbEV7tc=;
        b=aQBBSELcpOg1G1usrzjn8cnfLKkfkyq5gUW0Yds68I4NVRu9Q3cn9Y++DCzRNch8Q2
         mXqH5Bd95BXYFZmvEuesDHt8A8r7MpKbXGd+gZpFBy3gJe3hEpAD8q8fH+8dMen6A7yp
         iP3+sDFJQSqp6o+mpcMLvJECk0vXDf6+8lRBr0SITImo3yRt/oTQLBkpGOT66NBd4zlU
         OcFZSaoJpMwd1Q3ZAyMaB3C8D0cEwnqObmvg3uBNbuhbdGr+L5NsmiuWpTGPhvjVMSIg
         erK6hVkct4ZFeymX1IyNcpUqpuQaVj/ML5orYv5UzY8tzykWR2KwVWKi7GMXkeEPe/dF
         Nv9A==
X-Forwarded-Encrypted: i=1; AJvYcCVX8GWlMeVxBk4CgIBJuRrWSXXBDcl2JSdN2B2A91larPfV4nI+csYfDGAsAdOY50ESFO5ipCnNZY7G9YViH/+8@lists.infradead.org, AJvYcCXZPhoUyykJqLqDUCVKR8dgIxS+y37PKSPWYNPG6R7mbQYGCoxoBnhbnSrOrwl+r1fHAzJuLG+Tqn5cNfA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM5V5LpbnsmhNl485ZewRfSLdhMdq6xCfjx9rhrDrT92V7Mq0Z
	7UTtcBNLMjp6hHc/wKWEsBIgX/oTwJsUqgLdKVm8Y/SpmdMj6ToE
X-Gm-Gg: ASbGncvF7AomoVfYU56E/wnyitz7q6Kj3KHYTYo5ESpu2LZ6SvPycMArKOkNjPDhXtQ
	xqWJjxi5kDqyBubzzMylAAjHMfBUgD5b5Wz4wlj5aZwUnioBibRkfLfp7hf7h7ZXgzs9wx83ykS
	XhOh4dA/O928Gkbxq/ocAj4vWnSAwMTUxXkZo1+ONRqrvZ4gPIJ8C+ywt9YhC4vOnVd/8MmksGJ
	6AQP/EzTTUwFoASAmNIbOFL84pyYd1MBpD0s+6swFfK/EHgWwVVFH4czOwomEV/fXmHBmRTCrkg
	6b9InnL1Y7bCGnKEdksg/vDIrtp2Movl3pSuU/nq19QnaF7mbp4Sm1c4okQ19C6Ri7NVanIY8+A
	Nh+4hdrmLR8uT1yPjaHjL0AQuRT0KSrQr9v2d4MrM2hvcoHejmxM=
X-Google-Smtp-Source: AGHT+IHV7Lb+Jz2vAFwguRkPg3xEv8RK1gYxrdSEajyR1uZCyO5I90pymBqse+1L9ASZRUyJgq24dg==
X-Received: by 2002:a17:906:6a22:b0:ad2:cce:8d5e with SMTP id a640c23a62f3a-ad21b16d4d8mr201457766b.7.1746771065029;
        Thu, 08 May 2025 23:11:05 -0700 (PDT)
Received: from [26.26.26.1] (ec2-3-69-236-239.eu-central-1.compute.amazonaws.com. [3.69.236.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219343c81sm101663266b.58.2025.05.08.23.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 23:11:04 -0700 (PDT)
Message-ID: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
Date: Fri, 9 May 2025 14:11:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_231107_726339_B900F8BD 
X-CRM114-Status: GOOD (  15.36  )
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



On 5/8/2025 3:10 PM, Manivannan Sadhasivam wrote:
> A PCI device is just another peripheral in a system. So failure to
> recover it, must not result in a kernel panic. So remove the TODO which
> is quite misleading.
> 
Could you explain what the result would be if A PCI device failed to
recovery from FATAL/NON_FATAL aer error or DPC event ? what else
better choice we have as next step ? or just saying "failed" then
go ahead ?

Thanks,
Ethan
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/pci/pcie/err.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
>   
> -	/* TODO: Should kernel panic here? */
>   	pci_info(bridge, "device recovery failed\n");
>   
>   	return status;
> 


