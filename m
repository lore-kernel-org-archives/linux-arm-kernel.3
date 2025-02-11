Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8172C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0W62oH9ZYC+ChuytZaOkEvSh/GddcFQV97qyWKWaew=; b=NTpUbvoHzk1JzlKb8PS1HmbiIL
	2NLcTiB7qXUXHqSP9ZPW4aYTmJYeg80l0LrFDFSSzfuXR/s+CiMt6dRka/bgKCARVVRa5sTJr4bAW
	Bly6DA6P0R/MUaOuSuZowkSYpS8yOW3kEY8dwcdNrw+0xN8LsCnBiGRI/vdfbbnlfdQLdMRKB3AuH
	4GXGw6WliQ8FS03ReEk4imUqJFIIiaYkC1hAbKmEMjnrlTUKhnv4UxLMkknggLWG214PPZRE5jVwd
	tGp/sEopFv84syN1A+C4qqPGzy6yijfpK5ot5FSvzBYGwNBhLIpPxyQM+w49GwJ4MKe2wC2KdMD7k
	epw1uXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtiK-00000004cgh-3qpC;
	Tue, 11 Feb 2025 17:06:24 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtdy-00000004bw7-1ypf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:01:55 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2b832eabf39so2708785fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739293313; x=1739898113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w0W62oH9ZYC+ChuytZaOkEvSh/GddcFQV97qyWKWaew=;
        b=VQGK1FcGw06AJHMIMIkmrAlSkPKp89k/B64L9nPSJNHBydyu/9epWtg+GckgA9KKPC
         oCTVDC7AmRz5x+qzGlwN8PRjPvVRn3vWx1E3GP5kZ8sHFFxRAS5olB88ykIPtaWMSp1o
         dTFRQt1bpJHvysAk6UKAZExMljY/u0gOqFSY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293313; x=1739898113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0W62oH9ZYC+ChuytZaOkEvSh/GddcFQV97qyWKWaew=;
        b=NSZui4wXQsbLquuOM6xym4rflApd/UkOmpiWWSJnhmneRb+0AUNx39lq1nzUAX8X02
         kLIZiMx/S5+Yl/9u2Zfn0SKWtMJhQrg21qlUUszbNCldGsFON8zmDDP6nDWaG77yB4Hr
         UpJGxH3r8fwDyl++THm6RER/GoqpAp/QjAIYrSPycJbLpTy4E2d/qiEXEiN3EoEAI9Fi
         KBb7s6q8TzQ4amfNH7xN8T/AL3iC9A8JFKXUgMdhJRSAhZ/da9ewD4ezSAG9K2huTBVT
         b1tQSkbV8A2+y702VwrpYlEN54nBiBT2fgjzZwx2tp7x7Lubc7U198YzZKHSj/neCqxk
         V6bg==
X-Forwarded-Encrypted: i=1; AJvYcCUxEe8j+dZWxeFNqTDgfLLE5w7cuT0KoaaFcEcIIrWBUHE6Znd9UKlO4O+/Ze1FhS5dEo9/+1sUUIo5mcUSnEAV@lists.infradead.org
X-Gm-Message-State: AOJu0YwKuhFLUqtGlPhPdYyA8x9H5Je8Fu5Xu/ZlyDlk+hZRFuqtSoO+
	OqnzMyGRQ/cDOpuFS9ZyYrgBk1/pH1zdSiWQXIeDuPw/1vRhtgJ49DcuiKyO1A==
X-Gm-Gg: ASbGncsOR/I0yq1njyW+tQTQTWmyWdmN0IYjahPeJVstL8jcL2ntoxSwilWF58ofT7H
	/wgo+tL0kMRU5/1eVybM29FMKDzqI66hSlkBnDbd2kTgkMVcW92K1KSDrKKS9pN/YqqTHfqkYJR
	xC4UJVFyQNDPFl5s6lBmZVcxjK+xGv1LRq6IEtyVoYKlfnj92WnKAxFfJYvmHJkKsTTCmzZ7X2X
	42gS/SNpWzRPZ6PP1bu3iEvlExB3KJJ+EbohRF6e8YDoqOhqXSW2t6pr0lkQ6sPTyFGBnayRoUu
	rdkykFF7BKzVKchFh0qQgUtrFOiM5ZybnzO7/gCBxFXNUxUx9nqoXHM=
X-Google-Smtp-Source: AGHT+IFLUtEuCEYnU4d6LJDB60jbPIoB9QcAeA9sHYAh0/XpHftNJgrbC98faKY5+xCzyk8GsJguEQ==
X-Received: by 2002:a05:6871:687:b0:29e:4985:fef with SMTP id 586e51a60fabf-2b8d644c7e4mr108219fac.3.1739293312808;
        Tue, 11 Feb 2025 09:01:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b82626f8b6sm3642741fac.38.2025.02.11.09.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:01:51 -0800 (PST)
Message-ID: <d51a9d7a-b942-4c3b-93d2-65b1bb04c8da@broadcom.com>
Date: Tue, 11 Feb 2025 09:01:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
To: Avri Altman <Avri.Altman@sandisk.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
 <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
 <115a59e1-75b2-4d09-bbf9-50dfcd2b62dd@broadcom.com>
 <PH7PR16MB61967C18645C64E582B222B6E5FD2@PH7PR16MB6196.namprd16.prod.outlook.com>
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
In-Reply-To: <PH7PR16MB61967C18645C64E582B222B6E5FD2@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_090154_543364_D1A60BE2 
X-CRM114-Status: GOOD (  12.67  )
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

On 2/11/25 00:13, Avri Altman wrote:
>>>> This patch set adds support for Broadcom TZOS to read and write to
>>>> RPMB partition using synchronized access to the controller hardware.
> Practically it establishes a communication channel between the trust zone and the host controller regardless of the rpmb protocol.
> Or did I get it wrong?

Rather than communication channel, I would describe it as an arbitration 
scheme between N participants, with guaranteed forward progress and 
fairness between all participants.

The interest here is for one of those participants to own the eMMC 
controller for a certain amount of time and indicate when it is done 
with it. This is not specific to eMMC as this could scale to virtually 
any piece of HW that is driven by transactions from a CPU, but the main 
application is for allowing the Trusted OS to own the eMMC controller 
for a short period of time in order to do its RPMB access, and then give 
it back in the same state it found it to the next participant.
-- 
Florian

