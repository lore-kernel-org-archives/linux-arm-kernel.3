Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDD6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWxCLyK4AJgfk1FfjpH9G6YxLoJtD0ixlqlSrDwjPFI=; b=gorO+S5quebVfwmgEpQuypn8Vg
	TnnYS+BVjhRplN7YY2e6VKBs6PBqtPDN2cdchE1TXwkpSNxnWfD+qSiguwIbogXiImfBXJFHSRxnM
	kd8OzRdq2xaeYzteS6BLsGKPlPL1hrjKfpLSpWmmOE7iKcYuYPrDts+yIgGQDcrA4v0yP8Nqtm2qQ
	RmRxfX7UTwlp8HHxoB3SsrRvfsKPHBD+wSf7qhgYaHcDZhavTSQHZYjFxwwg45ad7Gey6ktzx4eIe
	pCpZyGwaxkup0tQP5QcEuJAa5rYqCwlS2vbfSavZGLMxdg1tbU1ywVS4hxpXmtEbhOeI0BYa/Kqvq
	6MrmZVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDCo-000000053fw-3roG;
	Mon, 30 Dec 2024 10:41:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSC9p-00000004wpX-3PIq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:33:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385deda28b3so6562702f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735551232; x=1736156032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWxCLyK4AJgfk1FfjpH9G6YxLoJtD0ixlqlSrDwjPFI=;
        b=exSYXJbfn1e/QUPHGBV6zXx72WCofhFr4z4IZpVhjMx/RJHNK/2CdomTadLvTH2OoU
         CmeYdLkl/XkSl5JrGZ4k+jlXnvRiOMYlUhFNBBUQ77QL37vAJa205f4EnS/hEFHnDMkq
         sq6XqHhNDmpJwwjuMpgKxARmz4XGPNlRzhf1BK5WpiQka4DTBym6S4spz4V2cXmXef2p
         ZAVjQk53eNmASf0koxQ1X7Z3wWMqVCyj7a2eU/ySjdCOQSONCzFajERfJ9d4okAzsyIt
         8FS7O1W1VLyW6g5wJwiWNAz2J9xIldk5/mWfbIiMd4IlO+ehcxYR8qL1l6RC2i3qRP+j
         l84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735551232; x=1736156032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWxCLyK4AJgfk1FfjpH9G6YxLoJtD0ixlqlSrDwjPFI=;
        b=JrUJRASBdSt7E1S64//Hcx6YhRXDjthlTSckCnztKgIKCDiXlzzrmr7DPFMx/Jv9bu
         6TmsA5+PmXCtNH/whdU9b4vfwJFqaPDRpPIz27wMlWC0qXva2D7CXKeIUF1XiJkE8k2V
         4BfagxNEOl4YIz80ACLIvgiqlWUSQhA5orUQ6ami/t/cOdliHyerCyrMKBLHVWzHggWK
         R7ZGuvwtPH4cdZ1Cyfuc4Mf1jO3l1FKXsbfmiRn3Ka46VCo0heufq3miAbfjMqxRThBI
         X9SRoRYuFeRCLnsXZ3Uwa3w3Kl9LBeR2LhRdxjsZv5VbPlSVE28htINxlWOhw13M60UQ
         78dw==
X-Gm-Message-State: AOJu0Yw8fAUDVkbqDeeRre8Y6hJFjIOmkvUxK8LK7wkxHEesN40S8CHH
	AOpe+U7AiQKSPU5x43lukB8cP2ydZ3CrdB+S2CkzIEv9FkXM1ityNTtMy/QwXHM=
X-Gm-Gg: ASbGncuu7jL7MU8QfMziFm9sAUW9z4ogZIHwJpZi7Fa4hT9P5vADj3DyU8TbrDXDxkf
	QY+lbcRju+RSLBMG3Sz8G+4BTipt5BCGAZRd106IHUnZVwLvxTg/H6KmLa1IxwdimY740qeXLEX
	xFjBm2LyKriJJ3joVqp/ej5cbDuyGxjnknyhpUKs4KQTizwZtjLAR7j3uOhc1E2pkJHDRoPjKmu
	7vWgN2t7wjrkjTIEQg57HzbzfAjpsxp/ExeUSsi0szP7Vs2sTmGJq+Vg92lKa+z
X-Google-Smtp-Source: AGHT+IGt9+hFPNfKD0vYj/l0vMmTZmm4MtaV//fw/vdTlSexZfNqLe9/5huEQLBsPI/BCg5Yf4wjuw==
X-Received: by 2002:a05:6000:400c:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-38a221f92c9mr32375904f8f.26.1735551231816;
        Mon, 30 Dec 2024 01:33:51 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847dabsm29231573f8f.59.2024.12.30.01.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:33:51 -0800 (PST)
Message-ID: <d852b956-b61a-4770-8d93-9987a982080d@linaro.org>
Date: Mon, 30 Dec 2024 09:33:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
 <20241220-gs101-acpm-dt-v3-2-642d64daa5d1@linaro.org>
 <f5e3d00e-8f98-46c6-8f1a-85a2169324ee@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f5e3d00e-8f98-46c6-8f1a-85a2169324ee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_013354_670560_85D9C44C 
X-CRM114-Status: GOOD (  18.76  )
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



On 12/22/24 11:47 AM, Krzysztof Kozlowski wrote:
> On 20/12/2024 15:45, Tudor Ambarus wrote:
>> GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.
>>
>> Mailbox controllers have a shared register that can be used for passing
>> the mailbox messages. The AP to APM mailbox controller is used just as a
>> doorbell mechanism. It raises interrupt to the firmware after the mailbox
>> message has been written to SRAM where the TX/RX rings are defined.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 1441e9a252c2..6947dd081a0e 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -1445,6 +1445,15 @@ wakeup-interrupt-controller {
>>  			};
>>  		};
>>  
>> +		ap2apm_mailbox: mailbox@17610000 {
>> +			compatible = "google,gs101-mbox";
> 
> 
> I don't think I have this in my tree and cover letter does not explain
> where I can find bindings. Nothing in next from few days ago. Always
> document in DTS patchset where are the bindings, unless it's obvious.
> 

Noted, will add such details. For the reference the bindings are part of
these patch sets:
https://lore.kernel.org/linux-arm-kernel/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org/
https://lore.kernel.org/linux-arm-kernel/20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org/

I'll ping you once we all have an agreement on the bindings. I'm still
waiting for Jassi to let me know if he's fine with dropping the channel
type argument for the ACPM use case or not. ACPM always uses the mailbox
channel in DOORBELL mode, but this info can't be retrieved from SRAM at
runtime. Jassi suggested that I shall pass the channel type via DT.
While I don't mind, I don't find this necessary. Discussion at:
https://lore.kernel.org/linux-arm-kernel/eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org/

Thanks!
ta

