Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD521C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcMmKyfzRPrJzQxmfuKdthZfczaSiWFNmwbcWXI38R8=; b=vgqSVY8YK1tDj3YJoPqMkLF5y/
	hg+PDGIfRMvxgNf/3OoALsKYRH2GIiY/BJ3kpfYvl5lRjZkevQrKO+L1kxNYEK4HZQMPuxqxEbyZX
	yotHUpRF/X8trgg8pzYdVa8Uer9URuYfQqoV5NzMCbcRnsVPKqS4sRNsePRJHda/w8b47SUYNHmFt
	KUGqdUPJyGwd+rXzNJfPcw70Wq2M0W6WvRsrc/Bt0AVWVkAU+oyELdD1SbX0ZUMaETAz8riDclcvs
	n25Bgvwji0HfVXu8ei8uh4id0UU1He2KUGLsi6xPEbVzC4I/o8wXo0vLIHdl/17HjGGVAKj2hmWj6
	xmGipLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTZw-000000030Tu-1Ff9;
	Mon, 27 Jan 2025 18:11:20 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTXO-0000000309U-20wp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 18:08:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so8108824a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 10:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738001321; x=1738606121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcMmKyfzRPrJzQxmfuKdthZfczaSiWFNmwbcWXI38R8=;
        b=Si4y4fgeGJvWp+Eb1v6Na+LJ6QQm5pmI5MODfADckWZwJ1Andcb2FhD5nZTNgr6mZX
         Pl4iDefNu98Wa0SiMTFaqTLtN7HHfLxYZCPgr25uE9RL4YcdBM6V1tD2ckMFZqheIjzn
         DuzpbPHNB4peNgR72Dz8asOVs609F6si9xS2ZJnl8g3K+eQdRhgDUfAPDR26fFIkeFW4
         m5ExLfd540DD8XCTx3LOnAwmVelqbSQFZzBA1MJpv68pCP3Z3qMDr5eiVg5GPr7TKpfV
         bSdDK3//OqlYgbM8g1x/IMHGYITcvGa09mTgEV1RYSdpZjyo07WBvRAxbFRJw7Hj60vM
         RVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738001321; x=1738606121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DcMmKyfzRPrJzQxmfuKdthZfczaSiWFNmwbcWXI38R8=;
        b=YWG90r3b/YH9HNMFm1Ts6o1cU42cQ+SulCeJFJv9rgRe5YlgXlMnIahSABsUsHBSjj
         NobALoE81jHRpCBMI/vD1l8dziogygYVMBzUGGeDkZYJeQuBFiyQ/QxWtufNcbncIkr7
         AsC94EVDkdRHGvKQ0Lg8L8MpfQ95O0627azNJB9veE0TuF5WMF9i8vrlxWT09y7PAVNl
         JEpFD3IZf8no+GjVNn8CACOuRvCYP4MQYr0zhLUcLtOTZqF3EVg3mftMo2+LRGakQaCc
         GxvtvPDsprN/emh8siKJrcR+U/tWThu4uht8xnsS422vWhE99emz0SQ96cCWkoPAz9kA
         Qu2Q==
X-Gm-Message-State: AOJu0YwWOs91CM/ZWXorDoLZtURTk1RqX4L4eJKpmckND+Nn8UEu+OEz
	+8T3KPdFPzw+Y4VfIKs8zBCnqGHgWwUoo54fK5EwSBw0FOiaAk7PeOTsNJK7zw==
X-Gm-Gg: ASbGncskCcx4l82kHTywa1UHpEXqOldeq1aRZjbsQ+yTSoEG6BRdgvMUAKoIfFNF6f3
	oXLAOSNR28j8glv53euv2PRd/0ouotdgcftQ5EoVPGIwETuCOQ0f0HhQWk28l9eTnJWCCtCJnCC
	2r7p3vYRFCBXQH3RN6yJgNP/JiJnx8RrlfhRZ4ZQ2viCjdjYVigl+0rmBvGCR1IHFd1qNKn2YJO
	CLqn33cRwUvXYA6hjpcOIHVfYbjSogOVXfQ3VSlEyEBGbOMPhB6PtHKXH5Tjjam6FGTh0jh/vCu
	dYwrXYB3GLhN
X-Google-Smtp-Source: AGHT+IGlogWMYJ2GtaIr4QzKApNRqsW/sLmvKZ3dgsxiTqEPLTp6ZpBbr/RQ5HQAEFElCAjibvustQ==
X-Received: by 2002:a05:6a00:2914:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72dafa00359mr56731649b3a.6.1738001321400;
        Mon, 27 Jan 2025 10:08:41 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a77c550sm7685545b3a.135.2025.01.27.10.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 10:08:40 -0800 (PST)
Message-ID: <6555da50-77cf-4310-b20a-69f9a7db223f@beagleboard.org>
Date: Mon, 27 Jan 2025 23:38:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable gb_beagleplay
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org>
 <7a576b41-e1bc-4a67-be94-27ada6ec437f@kernel.org>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <7a576b41-e1bc-4a67-be94-27ada6ec437f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_100842_789790_8B9E3DDE 
X-CRM114-Status: GOOD (  13.97  )
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

On 1/27/25 23:11, Krzysztof Kozlowski wrote:

> On 27/01/2025 13:39, Ayush Singh wrote:
>> Enable greybus driver for Ti CC1352P7 over UART.
>
> Which upstream hardware uses it?

ti,cc1352p7 [0] on beagleplay [1].

>> The driver communicates with Ti CC1352P7 co-processor which acts as
>> Greybus SVC. Additionally, it also provides firmware upload API support
>> for Ti CC1352P7 over UART.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> Enable greybus driver for Ti CC1352P5 over UART used in BeaglePlay [0].
>>
>> [0]: https://www.beagleboard.org/boards/beagleplay
>> ---
>>   arch/arm64/configs/defconfig | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index cb7da44155999b59aff95966f4cdc9107f2af46a..24353b0aa3e0ae1786ce99706a52cbf25d037d3b 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1760,3 +1760,6 @@ CONFIG_CORESIGHT_STM=m
>>   CONFIG_CORESIGHT_CPU_DEBUG=m
>>   CONFIG_CORESIGHT_CTI=m
>>   CONFIG_MEMTEST=y
>> +CONFIG_GREYBUS=m
>> +CONFIG_GREYBUS_BEAGLEPLAY=m
>> +CONFIG_FW_UPLOAD=y
>
> Does not look like placed according to Kconfig order (see savedefconfig).

Thanks, I did not know about it. Will fix in next patch.


>
>
> Best regards,
> Krzysztof


[0]: 
https://elixir.bootlin.com/linux/v6.13/source/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml

[1]: 
https://elixir.bootlin.com/linux/v6.13/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts#L895


Best regards,

Ayush Singh


