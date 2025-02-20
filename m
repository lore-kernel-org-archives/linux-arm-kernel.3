Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8307BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se84fI0QvJHv7tBsVCkvI8sK3nuKMRhf8fQQM5TGP/Y=; b=3EXW67y6IjVyXWjfNeDGdz7ZvN
	VjhO8I4HPBqfla46xReHqUbSjCQ5I6YKRw8qmLtNaFTh7Ts6JmDSZEhmPINF0fitUpQM8knqEW0YS
	jT2ovTgujhCzr1lHvmeddig3oeejsDFpsfIpHhhwqF2Ugb0JeMWPtSPh57sCPIPVhiXkWvE0NFVFp
	Q883tnam89Z1EK5sik3YFftBU6D6za2MrJIYEt22sLBJnXMzOQbR28/U8Vt+KZ+VckCpL39FnUPEe
	GxMKln90McDVo24c4KBku6kIupOuKtqMzei0XOFYDFDBxTSvU7hHB9cTXL/HxTxLrpiGT7glwLkwo
	OGx0Vhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAO5-000000029KA-02sz;
	Thu, 20 Feb 2025 17:31:01 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlALh-000000028aq-2vIw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:28:34 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2bcca6aae0bso651864fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740072512; x=1740677312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Se84fI0QvJHv7tBsVCkvI8sK3nuKMRhf8fQQM5TGP/Y=;
        b=IQfXeLS8l1B4FsCx87EyE0lgvQN742gd43174WfiNWV+069GYGvf7LVDY0BSjmRl18
         JA+YGGB+8COAcXKtr066uwJD0MvGVOuZG6pM+MuvJL3HzTdoXuvSNr72qwD1a3Q4z2LK
         8TV3RvQPqb+BjL5XpFioBkzYa3wbfkXTJ8lcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072512; x=1740677312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se84fI0QvJHv7tBsVCkvI8sK3nuKMRhf8fQQM5TGP/Y=;
        b=YfGkFLXg12LHIH0AUZn/q3ueA1K95U//Vg3LoyBrPjwX4CEY3nZo4ZwmpuogXjxUX6
         cUIkDpn2USafndiOz7h/tgoEiWetkommKUg5gAdzYp8YwrVY22duVVmamLKaILFP6FWf
         mrmNoupNJXHRofpgZiL/NSu7Boz0ZFjHEsnmI8T/XcGqGDXXy4dl72jpSAwXAlRRlD56
         F+SKIEB8Kwl+j6eSOrAf8jgJ8nF+3ZKvvN5viAeAB4/G6Ba6Qw+QUJyZRLELSItoWKaD
         marRarX6lTSVdWKCb4GKg97afhzxOrBgqgxO2yE/fCf3km3JHwslawkReddEpwHX6fB0
         MlNg==
X-Forwarded-Encrypted: i=1; AJvYcCXvhx6UjKSsISqifunf0jiVLvB7LNQeMdFCfr4fKf5KdQplww1HyV5dWuMNgLbXtxPuD1w22DlUA0bgAMPP556u@lists.infradead.org
X-Gm-Message-State: AOJu0YzDr8QxBtG0LQyC9zg+l400kUiDBULou5BT+4HHO002NpzX2pth
	VARHrnePxhxdm1XsXEqCf+e4NGhMtg+73/fz1jvQoXxAnS3s4/ClntDWLojC+w==
X-Gm-Gg: ASbGncvb2O27YUvkIX1bsodYrFeY31cK9CtTm8wTB5Ljev/avobcxTiKyx/n1nfgna0
	RVE375ee1w58XSraTwYpcZ0jA/hCtxZhduW1YfrLS2SzcsO33bB7V7v9V56EFzplri9B50dIO3g
	Dd77+Y1H5cwgrBvCcLkbWm92AIO+NI8wqFOe8203hOQrO9wIj5iC7Ma68hOJK9f59wXFbNYKPXR
	yi2uTBPc0WRj1Nb9uRIdxohmR/SwZjTQPOUMuim7huvD535Ss2BH5PQ8NR4trZTLSwoQFEWLoZE
	g/XeFwv47Zr+wgN8yFjNm+fjqD4XSRuu6Ilyww7iNB+33KcQkpd6fyArPS8Dz2R8nU2BTggguFA
	p5sq0
X-Google-Smtp-Source: AGHT+IHx2vbvGJAHIaFv9cg0KxSVcmogH7AF0Pu9XJIHUk15LcaEcO3igriQn9XHQKeAmlP5LjbZFg==
X-Received: by 2002:a05:6870:5688:b0:2bc:7c3d:1918 with SMTP id 586e51a60fabf-2bd1029003emr6698012fac.21.1740072512624;
        Thu, 20 Feb 2025 09:28:32 -0800 (PST)
Received: from [10.171.122.29] (wsip-98-189-219-228.oc.oc.cox.net. [98.189.219.228])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b95486cf40sm6433631fac.16.2025.02.20.09.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:28:32 -0800 (PST)
Message-ID: <110d6471-d7a5-43bb-b768-dcbfb0f029eb@broadcom.com>
Date: Thu, 20 Feb 2025 09:28:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] PCI: brcmstb: Write to internal register to change
 link cap
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jeremy Linton <jeremy.linton@arm.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_092833_753086_964EF9FD 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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



On 2/14/2025 9:39 AM, Jim Quinlan wrote:
> The driver was mistakenly writing to a RO config-space register
> (PCI_EXP_LNKCAP).  Although harmless in this case, the proper destination
> is an internal RW register that is reflected by PCI_EXP_LNKCAP.
> 
> Fixes: c0452137034bda8f686dd9a2e167949bfffd6776 ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")

Likewise this needs to be shortened to 12 digits, with that fixed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


