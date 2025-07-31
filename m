Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BB6C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbNcmxdMTZH4+4fKNLqLIFsAiyBnuQVAnpbsOwkpl5U=; b=XTOHem1keFmgpg+3o1Nvl/krQ/
	lGU8/FhwYADfHSC471Qrf7opwhfPsDhIsWRAf41x7Im7a1YO/K33QRQEdqcZEZPkMplOK2nUfkUjn
	hMANpLGxXeVWGcN1Xu+bCrIfJ4X9I2FvQA/RLJiASyAA/cki43KNmrLuvT5ROvNNRtAVWBzsf9AD1
	SPFNiNFtZvqt2MCdaj1OQS/aDYHBtAEQhdfDp//8UUtrwFyQdAtOi1xDQIq9kTRRB6EYsbp+30uV3
	mBY8o7BLlEqaWvSIKaH4B1twscr9oXBPqQGbkQHVb8KZr6+9+72OjeOVbAS0F9XFYl0LSULIXUsic
	nWwadkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWPs-000000046He-3LTe;
	Thu, 31 Jul 2025 16:46:04 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWNH-00000004623-2klW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 16:43:25 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7e6696eb47bso141498785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753980202; x=1754585002; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lbNcmxdMTZH4+4fKNLqLIFsAiyBnuQVAnpbsOwkpl5U=;
        b=bsv5aGJD2vqnsTgwTsUP36nj7BbC6x6zHseWky/MKa5IsuMFRnsmlSr21BohwxLXaQ
         MoroP/ubpb2h1HKfNQXEy9iYPTvpdsxufzcH2VDHdQJDLfiy8DBeHyly6aYHtvpfLmGf
         4zzwjC7E8gyjrFhEHMJhIsabqt2dBJTLxwj7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753980202; x=1754585002;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbNcmxdMTZH4+4fKNLqLIFsAiyBnuQVAnpbsOwkpl5U=;
        b=mfW5uK3IuweJHdeYWajHpRSfCDe/StT/wjKPjQifoFal65QSZ572Yvlv4iK5yIBOJR
         syAHw8GefpFRc2HsaEwipiLRF8nVlesAACtOBGibWcCIZZPIqphjocwHTpHf5d/Nyect
         S8XDj+IKJgU6auMPSwUYNHC0vmkANnWHBm0Atg1uzfynuSaRQOT6/dWU8PxY6+yH7mMz
         bc7hTQTdBri8+kr9JDHuLkreVd27uVfaahQ41JS8agL+ETZfFef9g2cbMvuOYb0RpTqX
         qcNuAoaMer+/THdxh/LXTdC5K8OXgCl75cxoN2LoHflPeM/ZyG1vyLJkZLFBIs82/I+J
         ZUgg==
X-Forwarded-Encrypted: i=1; AJvYcCXNTzTO67BE6gcGB1HrEIL6p88Ss93d1H4oO0W5Sik+1yetuA3VMUaLtfX+alXBU0jqr72lPyQ+zComqF/yHAON@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1UoIGMSNXDLrlDaQEM4kRjVUm94UIFqT8rvwQMvHtlmBPGsz2
	KJPXKyezgzTx7Lj2rIYqAYZEQcXgofltMZdHHqoNNoTPL3NInWis/s0ZvZ7tKwpHvA==
X-Gm-Gg: ASbGnct4yhsL8/J8WIxInF0yOg/i4EF1fxCGDqR94Dowv+aLrWw0wA/nDZH/0C3QqOd
	o88R8Xqdl4STSQCmwoanCS6e77MSqJ8kPH1/KFcXplfgrF/6O/QRtyj0/eHMrv6xzwiHt8oPFLV
	JANi84QOzPDDLX9AUEZvFYk0+02oArzTETAdgy3g6tX0j44/fGa2+0lXYXqYsIckzGJ1u2Wl9sU
	6KlhvTkvJc4qReH9ZW1jxTibmJybaKq3+aOOYVBwpfPgVN9kv7nMxt5R3OE8rl0GOjxYGfjOiB2
	pw2dt3JPaohzCUYvT4+tnmHalNO5jU3Y4ZMT6GSCAGzs/M7r3TWQwBfR53YqxTS1FpS86b7hpUp
	xP67kBp+1xSMLzF2oxjKYwXiagIAlvblWkobepebrlSIy+3tjQXOss65CR27SxA==
X-Google-Smtp-Source: AGHT+IEMxmTL/RtEarc2NI77icOmXLVKI0iWLz9cXU1YYoJIxr439vc8qqp/uBQFKFpa+CTDFCVyAA==
X-Received: by 2002:a05:620a:430a:b0:7cd:3b02:b6e4 with SMTP id af79cd13be357-7e66ef7f617mr1153543485a.1.1753980201850;
        Thu, 31 Jul 2025 09:43:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f5bfdb9sm107416485a.29.2025.07.31.09.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 09:43:21 -0700 (PDT)
Message-ID: <f85367bb-566e-43d6-b405-b896c49c9aa7@broadcom.com>
Date: Thu, 31 Jul 2025 09:43:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] mmc: sdhci-brcmstb: rpmb sharing by claiming host for
 TZOS
To: Adrian Hunter <adrian.hunter@intel.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ulf.hansson@linaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
 <d542b1fa-6e2a-4af1-a14b-eee32a7f3de6@intel.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <d542b1fa-6e2a-4af1-a14b-eee32a7f3de6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_094323_733250_B69AEE2A 
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

On 7/28/25 02:11, Adrian Hunter wrote:
> On 11/07/2025 18:42, Kamal Dasu wrote:
>> This patch adds support to claim host for TZOS RPMB access and synchronized
>> access to the controller hardware using hwspinlock framework.
>> To achieve this Linux OS and the secure TZOS make use of:
>> - shared hardware semaphore register
>> - a set of SDIO shared work registers and
>> - IPI interrupt registers
>>
>> The currently running OS that needs access to the controller puts itself in its
>> slot of work register and if its next in line it can try to grab the hardware
>> semaphore and complete its mmc requests. The shared work registers indicate next
>> in queue to access the controller, and current agent in the queue. Next agent
>> queue state is changed under the hwspinlock is owned by the current OS accessing
>> the controller hardware before release the semaphore, send and receive IPI
>> interrupts between linux and secure world are used to indicate completion of
>> transaction to the waiting OS. TZOS has its own RPMB driver which accesses
>> partition when it wants to read/write RPMB frames. Current implementation
>> assumes Linux and TZOS as the two work agents.
>>
>> This patchset is an alternative method to initial RFC patch:
>> [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support	
>> https://lkml.org/lkml/2025/2/6/1711
> 
> Does it address Ulf's comments? i.e.
> 
> 	https://lore.kernel.org/all/CAPDyKFrCjo8gGnxmXWP6V39N+b1o62VQH9zwMUNb2_+D3-qrdw@mail.gmail.com/

If you are referring to the fact that Linux is the exclusive owner of 
the eMMC controller, then no, that is still not what is being done here, 
but we did respond as to why this is done that way, and there was no 
subsequent question or comments on my respond to Ulf:

https://lore.kernel.org/all/6328fe8d-c4ea-4945-b6ba-d994403121b5@broadcom.com/
-- 
Florian

