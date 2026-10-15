Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195DACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpovG3xe/GFBxw/GZpFun0w46KPpZR7RwgjQ0+f5SJE=; b=zrAAF5Aumn6h+1QX2RbDMsApHW
	7mImPspHqlxFrxjwIo6d0WYlbTaCtgFPb7VtFgN/F998wK1fKc/tCsAvvmd0POIXm2lrjJqKt0v9V
	n4K6RLFuEk55YXXDug3nUHzszW/oR5OILPHiKDty3hZbDigPAZp5ST4G0DXPDsY5dJX/B07rThiHK
	oUq+6MmGzakHDP+iOswNE9HwTTC+1YhaaE+gixTDDpTJw3U1teYKqNc/WnSs0u1SiUe6tUb7MWnbz
	49UuPS7CT0lTwvay6q8GNSUSOeCq/vUN5u0StUBM549O/IoZlWnk79rtKCIRnWxxVNyR+UH4hkV28
	wPCyxgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQqa-00000001EO1-39r9;
	Thu, 15 Oct 2026 19:10:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQqZ-00000001ENb-0g08
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 19:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fpovG3xe/GFBxw/GZpFun0w46KPpZR7RwgjQ0+f5SJE=; b=PlcLHTSY7cX19L/clsbnStTk+9
	z9Ttu43xCVqwTNrXnXlTEL/ADzhIOHOVijDWuk9mEDO4FLVkFK9kAWtQ4qnnV5u9gc5STYolIpXKp
	Yk3rdRMrzI8NMfi/IoQwQbwTW6S8QNMBRYqW1YxY8YJg/0WSw7rO2uoGhONHK/t55IF5/BkQPMbO5
	Tg8piHququb18Kf06YwhX0e/pdvrflDc6Ts4wzB5gtJyzeNwpA+a8/FZKv1PjDQzlhZovQZH8aVvX
	jVzC2zL5dDYhTX0XaiRxTiWo1qrH7ZE5WBdGMxUwwmNpWAw+36g39uu+P8J/5brK56YBfo+8Kv3K5
	uHUdl3XQ==;
Received: from mail-oo1-xc63.google.com ([2607:f8b0:4864:20::c63])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHQqV-00000000lMa-2gn7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 19:10:33 +0000
Received: by mail-oo1-xc63.google.com with SMTP id 006d021491bc7-6e560e00a86so3925475eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792091429; x=1792696229;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fpovG3xe/GFBxw/GZpFun0w46KPpZR7RwgjQ0+f5SJE=;
        b=yqdA7UrlTCrP/L8aNnEve/g6sefaADd115bpGQzCTRJ62iM6gd37RbipfneaVjnSQA
         7Kpku+DL2vr31BGcm2wCVjwwUluzP5LBLJbIQUllloP1C4EFPU8rjBIkG2EGbthkb019
         GV55kTlsAMPHk+9iqdYn59ZwiGaj45tdRwrUZOgFDHHAUyNT3c/6l3QwJcRWfu4a8sqg
         FVBOuXXSb1EX2PN+yVgkuKpXOMDupYjDEhpkXjuz7t9j1FcT8wfeTRmK3qZ/9T0Q6LZu
         rn9/TO0PCycj225oR/YS0kAB9y1gkbNAIV7/gd9X+F+F8GyAqvuQmhID3wo6jXnQK52z
         ZBIg==
X-Forwarded-Encrypted: i=1; AKwUvByxMM971HCxe6jI7ls348C0/ZWnljHz9lMaPKNUsQFjWZe4ga4E0qBz/Z8wTRqAYt+yEYpjQgJkkCmYvW2N3Ybb@lists.infradead.org
X-Gm-Message-State: AFq9FYJey00+BSF4hF8Hddy4cjQQh+7TZBwFWAm1Zx1eVUawMSVtEFa3
	FOFCPVrLoVhZgpSEIpVeMHRLZO6dKzvHo/zeKqjova2651JWK/Oin6q2+c0yRv4rboERW/BQxUs
	QnNMIY70BAa0QZpNce4OCcoM1oQh/v+iHhLAY7XbgOgSOf5TlFtWCewk4k02O6C42gX3uqxSWFQ
	nzuUjfzh1HpFCVYUJFnT1fhDGewZilQhGcrk2/3FyBzvLN2dYK1xOEPVyU/5F7xYKDU7Oi4LnOi
	sYBFuTZ6SGfwmUmSqbwB6S1VQIjQXl2beU=
X-Gm-Gg: AYBFou0pRKzO421SYAv11bKmOuej7xstzd6/f7CnQKdeb9b3c7++MrPYPgjRiH36pc8
	qliftFF+8pYkYWlfsHYyuYLgaS35CoofJc0bYn6c9rJEINB7Hxmm41k9ec3xUlocGFKzTBBsqJl
	BCd6q+/r0McW82jDTQ5i+sO8e8ZW/Bp06EGn1K5MlDFNWN31kkv5SoXLojrzekhjPXkgKa/J12z
	apQnm9QPnoOokNMn0kdg4IY416py5eqnLCYDHCQPCD9gClsHjparqNN+Q5ZU7vu1EVQ+RmlPoCp
	p+P/44dlS0xJKwZBic6gnbeI6DBw8k4/M++aUsTnP+k0xTF+4435kMe0qg+VEl3bXJPNUcwDfx1
	500N4mGLoAJLJemCu+9GGbo0jPHAu6lo32W5x2UxYLvKVDJvZuHNCN8QxYGSes/cTVDL7UbU964
	1/FXI4hg2/1gMHfrMfwEPt9AZmTBDLOrbgmfDbLkR8MLM=
X-Received: by 2002:a05:6820:f028:b0:6f8:9beb:b242 with SMTP id 006d021491bc7-6f89bebb893mr7687191eaf.70.1792091428168;
        Thu, 15 Oct 2026 12:10:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-70185cfb28dsm3278eaf.27.2026.10.15.12.10.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:10:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so1201226585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792091426; x=1792696226; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpovG3xe/GFBxw/GZpFun0w46KPpZR7RwgjQ0+f5SJE=;
        b=OJ7dlzHmz3dfP0TyeUDI1FapW6m8FPiGJ+ovCy34Eo88kP61u1jqvDrP4lGT/z9AmN
         ZmzTutSqUUB7WJFC0fRppBnqwQNkm17ADc7/Qrr5/5nDU6yGkM05IYuL7D98KvK97xLg
         +E7L1hplafgWgJhtSHi8VraOovmUvDSp63+l4=
X-Forwarded-Encrypted: i=1; AKwUvBx7KxCpqRbvP6BqUidUy/ligPJ+fxn2/TNeHWJ7uZligB8dXl0wgRqDrXcLPw0iyPgvvv+ybGQJvfBNrjfro9ca@lists.infradead.org
X-Received: by 2002:a05:620a:19a5:b0:93e:acdd:acd9 with SMTP id af79cd13be357-93ebd0cb796mr3250027785a.7.1792091426310;
        Thu, 15 Oct 2026 12:10:26 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:acdd:acd9 with SMTP id af79cd13be357-93ebd0cb796mr3250018785a.7.1792091425443;
        Thu, 15 Oct 2026 12:10:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8b4c51sm3232936d6.5.2026.10.15.12.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:10:24 -0700 (PDT)
Message-ID: <f7cf09c5-dba1-4501-b93e-ce4ad555edeb@broadcom.com>
Date: Thu, 15 Oct 2026 12:10:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] PCI: iproc-bcma: Use EROM instead of devicetree
To: Semih Baskan <strst.gs@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
 Rani Hod <rani.hod@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20261013220421.1588051-1-bhelgaas@google.com>
 <0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com>
 <CAAsRjR=_Q7aT6+NGAszYx=FkFMYWtp0HVe1KJwLwHEVhR0ghSw@mail.gmail.com>
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
In-Reply-To: <CAAsRjR=_Q7aT6+NGAszYx=FkFMYWtp0HVe1KJwLwHEVhR0ghSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_201031_883013_EEF4E8C4 
X-CRM114-Status: GOOD (  20.97  )
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

On 10/15/26 11:51, Semih Baskan wrote:
>> Humm, this is not materially different for me before/after applying tihs
>> patch and unfortunately but here is what I am getting with these two
>> patches applied on top of Linus' master at
>> 0fcb05b72344f40806cbe810de8872f1698bf053:
> [...]
>> Unhandled fault: external abort on non-linefetch (0x1008) at 0xc896df40
> [...]
>> r3 : c896df40  r2 : 0000ffff  r1 : 00000f40  r0 : c1ce1a00
> [...]
>>    pci_host_probe from iproc_pcie_setup+0x8a0/0xd94
>>    iproc_pcie_setup from iproc_pltfm_pcie_probe+0x10c/0x1d4
> 
> The series only changes the pcie-iproc-bcma path, and this kernel probes
> the controller with pcie-iproc-platform, so the patches do not run here.

Yes, clearly not enough coffee, thank you Semih.

> 
> I think the abort is the read of APB_ERR_EN at offset 0xf40 (r1). I
> measured the same on an RT-N18U (core revision 0x01) in September: the
> platform-only kernel does not come up, and with this one line it boots
> and enumerates the BCM4360 [1]:
> 
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1388,7 +1388,7 @@
>           break;
>       case IPROC_PCIE_PAXB:
>           regs = iproc_pcie_reg_paxb;
> -        pcie->has_apb_err_disable = true;
> +        pcie->has_apb_err_disable = false;
>           if (pcie->need_ob_cfg) {
>               pcie->ob_map = paxb_ob_map;
>               pcie->ob.nr_windows = ARRAY_SIZE(paxb_ob_map);

Yes that works for me, and I was able to establish the last working 
baseline was v7.0 which did not include 
76701239797698b620f2b7ec713fe08ef50ee664 ("ARM: dts: BCM5301X: Describe 
PCIe controllers fully"), whereas v7.1 and onwards crashes unless your 
patch is applied.

Also, the good thing is that my local test bed has been resurrected and 
will be more regularly testing now.

> 
> [1] https://lore.kernel.org/all/CAAsRjRnV-RTddO6h2XCUz2N5pB0pS8i_-_2XRcD=WOTA7AAFZQ@mail.gmail.com/
> 
> Best regards,
> Semih


-- 
Florian

