Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B9FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcwbwn2lH/wq2GnjEWUj7ie3kvxE7shHftPyeIQ9m+M=; b=ow0bDN49+d1XIBBfPLXQ2PGuN+
	yx+svlt1u5NUZgYY2ek8zKpITCI/ba58UJhka5ntT64tuVtUpCtVEDWdugt60ZdlKp448nj64biAS
	w5T2vFpDhjscHaZ2TiMiomCX1qRbBDkOvK5UxnF4SUD+0+kclLt92jLtk3TEO8rgccgN2byTdeltp
	z98gR8iISC7JFtAeLXV0zE+W7PCwNL3DFTjwu1P7vJdDuvSoNvlrC6v8cvoWR2XC+AP4dRuC99j4e
	RGqaJZfBJTpBoUHR+QEk03orY+OxSXNni3HTx1Q8+pxErBdlOuN2suFi7YsTA4HfCnr2MjDRgl3Tv
	4wWofDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQGZ-00000009BOi-02cU;
	Wed, 12 Mar 2025 17:53:15 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQEu-00000009BFw-24Dg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:51:33 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2b2b6019a74so87451fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741801890; x=1742406690; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zcwbwn2lH/wq2GnjEWUj7ie3kvxE7shHftPyeIQ9m+M=;
        b=HggfTioLQyuVWGtkWOGv/ExBxdbTnfqVjKi07W3TvhuGfUF4Zc1OxAywivg3dbu66f
         V0M4ZVeNXzflPWeiqI3NFICym0mCudYblwptyn24atbsE+tjIntIQ78KeeYMKH8w4Rkc
         ve0VXlG8Mit/yZ1kpH4aukc34NbtpynNGw1QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801890; x=1742406690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcwbwn2lH/wq2GnjEWUj7ie3kvxE7shHftPyeIQ9m+M=;
        b=M/w4ew/wYNYbzyZENMIvsv53x5ip38ERsvDIShMvKSna4cN2S80y8Si0N3UPCFjBBo
         bJrwLBNqD5yr9iGNlAvmjhhecVJa0zrLg8a6/lmAYgvyCy27py20r048X/9ESnYb2Gyh
         W1/gKMVCyOy4kgqQRMCp2kqD+fuBShKjTep2LxDEZ5/Fn3jxnkvstCULcJ+QrtXplamb
         mRnbf3L5dafdyVIcnC9UMGMV3RzRNgBSSaw1BtgNKZjhGTYKqfmlN48Q9TwyKtEdmKvG
         oFYBBB8tjXGTHR5y6OTyqQszKrTS0eesy4DDF6sot+fNb5BEgrA+gVWd0RsMvaxKm0Ze
         smJg==
X-Forwarded-Encrypted: i=1; AJvYcCW7dEN5IC4TyGNWJNfT9N315oolMF3ZGmbKGXIUHwUYg1YSaas2xffLr1l7kDQBbQF/WMR8puOot4Eg1GSg9Xne@lists.infradead.org
X-Gm-Message-State: AOJu0YxBz3gEgww5B7xkbdEsYWmgHgWnYZV5gbG9yX+4mCasFzG7+hs2
	IhAIse1n2Df1Xc6s+eqMKWp4ZZumzlutEedsSXJQ0Cj3SHlQj6OI2uDSZ9MsLg==
X-Gm-Gg: ASbGncvbSkRAXHyrsnPA6QvQhD3sdX5j+M4OLsCy7LJNyR1z8z3wdLbX+QK54ciwA6M
	b7itzUN1PuA0KT8Q9mO5vBjwTzI667n3o3S/QeHA7OOqZCyogWtwI93TUWeNJmoSG7KSWEFeGG8
	Xe1iUwZ20Uvhw/yCs9YXpLXmc7Dr71bVGLTgCRfP10dQN03dY8g5EqszRQR0YanGwaP+SwyVnTf
	k2xuEg9E/u7T3WlhNdQ2GXhVN69d8D+XGco+iu3SVBoOeupRzlPF6uXubo+HVzitsznp0cme8tt
	LNeQAZOW/hOrpQPjsfAWi0yWj9Bwg7HFRmE4sMxOyDRaWfoS2uBKhHEMDQkRWPIS/97VN1QIbTv
	INiADLciF
X-Google-Smtp-Source: AGHT+IGTe6RFQQ82TXIt6ZjT9vX2p9NsOi5VE0tMCgKcRs6lizvKwC6F5+6cc54HIilZFggI3MQbZA==
X-Received: by 2002:a05:6870:a546:b0:2bc:918c:ee04 with SMTP id 586e51a60fabf-2c26102c6bdmr13301757fac.14.1741801890497;
        Wed, 12 Mar 2025 10:51:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c248de52d8sm3054139fac.47.2025.03.12.10.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 10:51:29 -0700 (PDT)
Message-ID: <6328fe8d-c4ea-4945-b6ba-d994403121b5@broadcom.com>
Date: Wed, 12 Mar 2025 10:51:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Avri Altman <Avri.Altman@sandisk.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
 <d51a9d7a-b942-4c3b-93d2-65b1bb04c8da@broadcom.com>
 <CAPDyKFrCjo8gGnxmXWP6V39N+b1o62VQH9zwMUNb2_+D3-qrdw@mail.gmail.com>
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
In-Reply-To: <CAPDyKFrCjo8gGnxmXWP6V39N+b1o62VQH9zwMUNb2_+D3-qrdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_105132_579719_A45EAAD8 
X-CRM114-Status: GOOD (  30.47  )
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

On 3/12/25 06:17, Ulf Hansson wrote:
> On Tue, 11 Feb 2025 at 18:01, Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> On 2/11/25 00:13, Avri Altman wrote:
>>>>>> This patch set adds support for Broadcom TZOS to read and write to
>>>>>> RPMB partition using synchronized access to the controller hardware.
>>> Practically it establishes a communication channel between the trust zone and the host controller regardless of the rpmb protocol.
>>> Or did I get it wrong?
>>
>> Rather than communication channel, I would describe it as an arbitration
>> scheme between N participants, with guaranteed forward progress and
>> fairness between all participants.
> 
> A scheduler in the MMC controller HW?

There is no scheduler in the eMMC controller HW, all of the scheduling 
and coordination is left to the OS and TZOS, and other participants.

> 
> Nevertheless, it means bypassing the I/O scheduler in Linux and the
> mmc block layer, kind of breaking "fairness" from Linux point of view.

Yes that is a given, our approach favors the TZOS that has the ability 
to preempt for short periods of time the eMMC controller issue a RPMB 
access and then return control of the eMMC controller back to Linux. The 
very reason we came up with that scheme is that we are not comfortable 
with having a Linux task responsible for issuing RPMB accesses to the 
eMMC device on behalf of the TEE. That task is subject to the same Linux 
scheduling rules as any other task (yes we can play with priorities and 
classes) and our TEE team was not comfortable with that, they prefer 
hard guarantees that their RPMB accesses can complete within a certain 
time, which this scheme provides.

> 
>>
>> The interest here is for one of those participants to own the eMMC
>> controller for a certain amount of time and indicate when it is done
>> with it. This is not specific to eMMC as this could scale to virtually
>> any piece of HW that is driven by transactions from a CPU, but the main
>> application is for allowing the Trusted OS to own the eMMC controller
>> for a short period of time in order to do its RPMB access, and then give
>> it back in the same state it found it to the next participant.
> 
> Honestly, I think this is a really terrible idea, sorry.
 > > Data and communication with an eMMC needs to be synchronized and
> managed by a single owner. Having multiple clients with their own
> channel to the eMMC sounds prone to problems. Is each client going to
> have its own mmc protocol stack, dealing with eMMC initialization,
> data-synchronization and power-management, etc?

The synchronization is done around the start/end of transactions and yes 
each participant does have a minimal amount of eMMC driver knowledge, 
but is confined to doing RPMB accesses only. The contract is to put the 
eMMC controller back into the state where you found it for the next 
participant to make use of it.

When we operate with a single participant such as Linux, which is a 
degraded mode there is no loss of performance nor any observable difference.

> 
> As I said, we now have the RPMB subsystem for in-kernel access. Please
> use it instead.

That scheme works when all of the participants run on the same CPU, that 
is not our case, as we have another participant that is a separate CPU 
which you cannot factor into Linux's RPMB subsystem.

We considered doing a mediated/proxied eMMC access through a firmware 
interface running on a CPU that would exclusively own the hardware, but 
we really did not like losing access to mmc-utils and other things.
-- 
Florian

