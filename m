Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DACCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1OxuFPXRzNkf/jjOfMwnR5HsdSbozk+lpDYi7pEr48=; b=ESvZ1N7zY1fckQij5RcdBjmZOA
	TZie1G1RSlrJdw3PTG8lPjBPhExXpa2WFP7Dx7aECu4AgwsMnmnwJpiDb7jMnWtxRRLNfHzR44Fff
	nmE1ZXOEMIcoLhasPUYV0xUIiY08yjAmb435bA3LRWZPlmC7XyKIwKLK7A44Hbed2vLffohCOrXK5
	1j6pVJ/mjSPD21tNyia1JM+/XGJml5L0uqqkFKlhzseuD7FuLlGYq7uSD0JXXeuijFCgBWtq1K1Ik
	rzG3YOUNZqT1uBXXOMQcEFsZfukAmM6jyh17KKBcluRSF/VRdPSEzAAgsOYRFX2ZW8pf2uWeuaYR/
	XCSyVdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECX3-00000002kUI-2HhH;
	Wed, 29 Oct 2025 20:12:33 +0000
Received: from mail-vs1-xe62.google.com ([2607:f8b0:4864:20::e62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECX1-00000002kSW-0C27
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:12:32 +0000
Received: by mail-vs1-xe62.google.com with SMTP id ada2fe7eead31-5db3b074f58so324050137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768749; x=1762373549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1OxuFPXRzNkf/jjOfMwnR5HsdSbozk+lpDYi7pEr48=;
        b=vHTb5ife/SwT/7BUit/dPVRd2VFC84s4DWrgjrZluceTiUPzvn3w8PfG6bFCe0ZbYg
         2cVwWEnkeK4L3s6FjMf2YnZ5egGMzYLaRQnNLIaZXbWjdt+43tjCkk3+vaT0rUuxtspR
         IIqtWEbowkszruuYWm/q+v4GAr+64bGVDfv36eLb8yAesgQzq1WJ6Y63264Aa9MtyPJy
         7/pZHuOo009AkbYagW9+tT2k3k42VrMoY/IbADApwKR0U8YEYIG/hTYMeXKPSyKIkiS0
         mKbaNL3pPhBOK7n349Av7jb2sheonsPTepQ6MIeEpg8oajwt7bagExfpunMi5Hu9HwG9
         R4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW2TFS6p6bWtpCkFjdgqv7GZWgjyBkX9PBe67kYaQ8Fe6R2vekXzyXbzS5qYaF7jfNX+bx72o34vU0uT5hHRUwE@lists.infradead.org
X-Gm-Message-State: AOJu0YxOCLjAOuonDc4wmRsLNiC0HpMW298esx2qEH5EpZU1g0GuXh3E
	IzXgRiPUJovZTCNPpGbj2JL7Sko85dOBVE1cqrFwNzkFiysCot1GDLJYGubMj1fDhAdMttRHgQc
	4oaXstZJnoBgrXmcO383xZe0hUIfkPOpcJaRBc11lWJ9Oa1VzdfKnYiAaJSvnSpO6f9bMjETou6
	6Y+VLsk8Sk30mMA/fNp6bIcTSK8/6VsqfGeBzKXQwPONz8NckzrlVUexygY2pPWSY1JQC8M7xD1
	rzqm5mgZbt+AO5twe4NPRGuBzkVcWlQyqg=
X-Gm-Gg: ASbGnctQ1fZLG6XxwEL/sUD587WCjyk/MgTxM8ziUuQ6Yu6CrQGZw6y/BhDripQaUG2
	a5rbhQvUTr5G7+0SIi7Hqww+izLylY9Ua6EklpaO4+xcynNJYR64o+xwuqRhmgP27i3Wcmj32Fp
	ZhHvm7kMDd4QuXb248UwTHLfxaOT3L3f9wt5c+dwZ0mgxLwVGUNjSHg0mCF0dwlKE7ZjD6Du1zs
	ufEVJWWzHbjYdoI7cnJ0c4frQ+1Cx0117H1Ya+SC/Lm3eUuNzzg5rtRpC+aD9BThTTI9VEFYCNV
	x0/L62tiCODrq8+RDq4X8/JYbFEG0HCmH4iJhZdxaDWT2hir4hOwcMKjDGp4DBRwF6GRMzYddWj
	T/5H06Pv1kQ/BG0oZlvtUfVSQhZYc2KqZXaaz1i3GnAJs0xL2q22wzlkHcavo+wEnqrdzKUWJXC
	AK3sBUmfKniBzsqkkFdR+BuYgfvATaJiSJJqgMIfg=
X-Google-Smtp-Source: AGHT+IF1JlDA5/Fl1vmDrqlealwHduN0ytihxPAqH74rmAhd9VpI6lQa54rIh81B1FS/3zPt/Juyf/mbHMNy
X-Received: by 2002:a05:6102:a4e:b0:5d7:dea0:d6c4 with SMTP id ada2fe7eead31-5db905d19dcmr1570179137.7.1761768749621;
        Wed, 29 Oct 2025 13:12:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5db4e58a52dsm1535290137.1.2025.10.29.13.12.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:12:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89f80890618so121729885a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761768749; x=1762373549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v1OxuFPXRzNkf/jjOfMwnR5HsdSbozk+lpDYi7pEr48=;
        b=MFiRd8vnm1wzjNpQunQT5RPJafKPiIYiHnthKjF05PHSaMJbmuLt8syKmY2IT8G/Pa
         5i5VHs/pdAeaNYsNZDwNuJ/2/jxCvHSr86TMyuJy5EunN2HnJmxUGe6JsAdIlTBvscbK
         aW7jbgkgM5TFzzXeGA8veF2uWhjTWhtLKcJDo=
X-Forwarded-Encrypted: i=1; AJvYcCWZkxAcqlxURZj2KZ5ne9ghso+D29ZGkBNoSNSB7UNwdxRRBN/azpf3B6QM+NZB/WJQ6D2j9uAKK1UjjGT8S9Qk@lists.infradead.org
X-Received: by 2002:a05:620a:44c5:b0:8a3:c4fa:9b75 with SMTP id af79cd13be357-8a8e30e42afmr645985385a.16.1761768749048;
        Wed, 29 Oct 2025 13:12:29 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:8a3:c4fa:9b75 with SMTP id af79cd13be357-8a8e30e42afmr645981185a.16.1761768748624;
        Wed, 29 Oct 2025 13:12:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f261747efsm1093976585a.55.2025.10.29.13.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:12:27 -0700 (PDT)
Message-ID: <a2ff8f41-816e-4f87-867e-cbb39e513473@broadcom.com>
Date: Wed, 29 Oct 2025 13:12:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] PCI: brcmstb: Add panic/die handler to driver
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251029193616.3670003-1-james.quinlan@broadcom.com>
 <20251029193616.3670003-3-james.quinlan@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20251029193616.3670003-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_131231_596870_80F2B812 
X-CRM114-Status: GOOD (  11.46  )
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

On 10/29/25 12:36, Jim Quinlan wrote:
> Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
> by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
> 7216 and its descendants -- have new HW that identifies error details.
> 
> This simple handler determines if the PCIe controller was the cause of the
> abort and if so, prints out diagnostic info.  Unfortunately, an abort still
> occurs.
> 
> Care is taken to read the error registers only when the PCIe bridge is
> active and the PCIe registers are acceptable.  Otherwise, a "die" event
> caused by something other than the PCIe could cause an abort if the PCIe
> "die" handler tried to access registers when the bridge is off.
> 
> Example error output:
>    brcm-pcie 8b20000.pcie: Error: Mem Acc: 32bit, read, @0x38000000
>    brcm-pcie 8b20000.pcie:  Type: TO=0 Abt=0 UnspReq=1 AccDsble=0 BadAddr=0
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

