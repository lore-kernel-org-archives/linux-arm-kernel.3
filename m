Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4911CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3sQOBC6lgm5wwqQEZglJIx1GXGiTvsN3EI8B1cA2h8=; b=lpv4nERnEqKD5tA2OWneAaa+J6
	xRjXR34typoyt6rgjcs/JwY9qSTSDxcPj6iea/955C3VkCi7UNJC7nMNKhyqWR+G36j8MRmz+4xeI
	H+a2piOdCbmuqTNPCzIFaMAO+BCcuBPDBX4J3e6gdJAR7I2dWLvJEHS0pRKX2EZPNQwCMywBMinCK
	XH/BOGerNtPEo8td7xz18j8CIXtCh+ym7e4DzKGYHBDEN395d+1b0V6IDD35LDlPbg8i9w0ILzdEf
	pDxLLn8Uf9lVQZ0BaQk3t7elM6EU/ojS0bsrFe4bcbRV5Nq8SB84x2lJ5ImFuXVMJIYMHi8Agycto
	Lfe9cXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VMC-0000000A8No-1VUD;
	Sat, 27 Sep 2025 13:53:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VM9-0000000A8LC-0Xn4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 13:52:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-26c209802c0so34048875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758981176; x=1759585976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3sQOBC6lgm5wwqQEZglJIx1GXGiTvsN3EI8B1cA2h8=;
        b=hHoS1mtOXO78pEZNO1VaGO48hYMl0ZquIRn3gNteR4XB47Pc89pAz6EtJEuOqyhIxc
         9hKtX87tMVoljkbWWNbzN1DXa4qoZC8xref1PJ3Rt3cXpHiIbBkUM5qd8kUlt+sLBGjT
         eipJkb4xPaCiEV2Q1j0jx7nCS/2sVl31bilCzEipOj/lcgexgjDbIJdf8lc3cFOG4jHE
         Tj/KI4pmbNVcPxDoPeT1fEhChDZcfsCFZ+CuUmTWG18mkGRvSnmKq44bdOo59wVITCBK
         RKp36q6plcfkwzYDuwIf/beq6a+H2uMLL5ww3J5S8H4BaYNFQ8PmuLQpUC9R3eR8k+7s
         d0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758981176; x=1759585976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U3sQOBC6lgm5wwqQEZglJIx1GXGiTvsN3EI8B1cA2h8=;
        b=Klfh6iBcRlVnjcM49qlICXcGnx1OPn0bQ2Agl/IkN67mDQmMGKL63NQ7RKK3R81/6G
         iH9t7rvuZGqF6aOauRbNBMEUzDPxUK8Cuil57pAtxukOIFxumQ73aMmUEYaDkJ5wu8qv
         D1ZfSnCT00T0Y0z8Lz3kpt0wBCMPIhbaayHdaLSE13GrzSIKqHYHBfo13irP9vLxZRy1
         jkgyzhq+nCFPZYnZKok5KVeRdSHfakp7SvoAVZ/m1XnxkHWmPmdk8sppWxo/Bmh81pRx
         1L0yxH7ty4LyBRauV1qOsIU9vJFQjTwqMac5GFz603f3z7qdcjrhc1g8CwE5uAGuAAh6
         +Yxg==
X-Forwarded-Encrypted: i=1; AJvYcCUOZK6eD8iG+Oyw6tDX4vF3qDxQ/taNb8W2GrAQ49NyL0CDO6xGzVHMbazpl6VlHQCuHzgfmfYdSlFhYcu2+tF5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh8oOHMjTgtg47oM+zLiWFqhOofD2fLlEyxk9LLzTvnVFb1TMV
	2LhO/4cCn2PtteTx2xfyFyVJ2vbAfB81n7d34IPoXWr19zOcTNtTZ1ML
X-Gm-Gg: ASbGncv5OV1rNDGg9lJAG23V87JZeQCZnRAQMwTRdhwmIW19P44P5d+Y8MAULQspmZb
	yrYL969g1OvUqgaFSR7wNnBLA4G5Ph/sV899AcNI5Dvpjyk/ek0/94b76SZkm6jZZdFZkzvqvct
	v4b0GBeCl9TxcJegxYuQ7d3Fi/VRYgrTmZLBjV+jkN8Z5FfEJ29Ys3gsmS1GuKFojgVv8mehf/3
	kynx3jxsnYY9d2UCeZ3VBasnsI7eQDN8v6h8pgt+pWWpW5id25ONskGYKa6WAnrQ45T8w3sTxDu
	KdkoJg7TP5mrZU56BxvAaZXIKFb74sF1E19z55kCWvmfOxKhU5axqNoagjKPUyNWdkEn7GMcmpC
	ft5/uhBMC
X-Google-Smtp-Source: AGHT+IGK3h2/r66srXllsDk0MF+E1eFXN/e+nA4aTq6KJiKioeHUCHrtJSdf7ekPUt2zU2bJKgRb5g==
X-Received: by 2002:a17:903:3845:b0:246:2e9:daaa with SMTP id d9443c01a7336-27ed4a09580mr134300995ad.2.1758981175683;
        Sat, 27 Sep 2025 06:52:55 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6adca51sm82134025ad.147.2025.09.27.06.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 06:52:55 -0700 (PDT)
Message-ID: <ad4a7dda-8f6f-4d2a-84d9-838611f2285f@gmail.com>
Date: Sat, 27 Sep 2025 21:52:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R76S
To: Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922091509.2695565-1-cnsztl@gmail.com>
 <20250922091509.2695565-2-cnsztl@gmail.com>
 <DD2V17FJ29MV.3YDX1VUWGKEH@cknow.org>
 <1bb00ad6-ffe1-4783-909b-032dfb984180@gmail.com>
 <DD3EST9Y5UHF.12FJMDJUSZNYL@cknow.org>
 <d0a3d5d4480eac12ba5e2b15bcbc578f@manjaro.org>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <d0a3d5d4480eac12ba5e2b15bcbc578f@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_065257_171534_74B780A4 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Dragan,

On 2025/9/27 21:47, Dragan Simic wrote:
> Hello Diederik and Tianling,
> 
> On 2025-09-27 09:37, Diederik de Haas wrote:
>> On Sat Sep 27, 2025 at 3:19 AM CEST, Tianling Shen wrote:
>>> On 2025/9/27 0:07, Diederik de Haas wrote:
>>>> It is recommended to use the labels in the schematics to define the
>>>> pinctl nodes (and thus their references). In quite a lot of cases 
>>>> that's
>>>> indeed the case, but not for gpio-keys (USER_BUT) or these gpio-leds
>>>> pinctls.
>>>
>>> I cannot find any specific naming rules from the gpio-keys[1] and
>>> gpio-leds[2] bindings, did I miss any update?
>>>
>>> I think this naming matches the current practice at least in rockchip's
>>> dt tree.
>>
>> There is an unofficial rule/aim:
>> https://lore.kernel.org/linux-rockchip/5360173.ktpJ11cQ8Q@diego/
>> But granted, there is 'some' inconsistency.
>>
>> And used in f.e.
>> https://lore.kernel.org/linux-rockchip/20250727144409.327740-4- 
>> jonas@kwiboo.se/
>>
>> Where you can just copy the pinctrl labels from the dts[i] and paste
>> that in the schematic document and you're instantly at the right place.
>> Which is the exact purpose of that rule/aim.
> 
> Is the schematic actually publicly available?  I tried searching for
> it, but found nothing, unfortunately.

The schematic for NanoPi R76S is available at 
https://wiki.friendlyelec.com/wiki/images/6/60/NanoPi_R76S_LP4X_2411_SCH.pdf

For more information please move to 
https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R76S.

Thanks,
Tianling.

