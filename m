Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7895C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxtZrCctgBhiPn6B+3RMzEgrZOTooCI6T92FZv6MTPk=; b=kS54O5Fi2TfokIQv/KgXZY/GlJ
	bDIczvos0GHtm7bvTUS0dtrfJgGZYtkI1gBObZ4mlYgIbLTkayk1SH5D6/QQJnOFdzeh0nNh5pdei
	oxOWXal6ojmN7ajnVkCcmgRc8ikFmILg05mS/QcHZzlSo/TS9P9DMJKKb5dvn1JMvb+iPd5StBivt
	qZ2+0kTgqLMnSH9fYzLegqAV9137aeTQYygtBKHCpxN+TvYjFHmP1/KscZtlos3R4IPPaQr6hGXGh
	ItMYiuyYKxytROtL7+G4X9RpnSSLMuKZys3BWB10uReK58My3IOu2qTvOyhNdA5zA1xu5R2sNc449
	ne++rI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAFW-00000007fnP-3AOk;
	Thu, 06 Feb 2025 22:21:30 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAE8-00000007ff9-0wNP;
	Thu, 06 Feb 2025 22:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1738880391; x=1739485191; i=wahrenst@gmx.net;
	bh=dxtZrCctgBhiPn6B+3RMzEgrZOTooCI6T92FZv6MTPk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=R6IgtnxwhC/48wpm38U/C1njOpeUq9DonRCJ50qndlZyB6SDDvTKwqxmnNUoPl0T
	 Cahkwq0zAmhBLnpt23ROyFo7mmyg6fu4dyzTQI4+eSixGgSi4AeRNpmDYRMyyayZj
	 mmoddlOhmEKwqt5WuaN5frPUPzNXuEYMaahU5DI6iug4pwugWtgNNcSlbuQSbUhSU
	 bPvPtYAfzNJToDiu3SRtW4U9jwBTFcJha4ZLQX51yJnE9ha+MWKS9oOjKxKh4Hgvt
	 ABvsJgexP2XiO+luOscnTl+kRrijcTG5957Y/bvtSNQlCpTA2ZlWF9zYHpZFcQ1pk
	 IC8SfJhTBloKDFR7qw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1t8Cux0kmq-00kgXn; Thu, 06
 Feb 2025 23:19:51 +0100
Message-ID: <67b38b32-ce4e-4d8d-a55f-d56d5389b488@gmx.net>
Date: Thu, 6 Feb 2025 23:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] PCI: brcmstb: Cast an int variable to an
 irq_hw_number_t
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
 <20250205191213.29202-7-james.quinlan@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250205191213.29202-7-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sTGnfuSTXZK7MNvCp5CKmJzOpF5On8p7IkfI//o0gj6Vs+nZ3zo
 HIgCyeUZCL+1EetfpRQ79B69GgcxGbIHPTicg/Pn0Sqj62W/9RMLRBH1Z8K1h9eOfay9Iyp
 aDTp97Q+1glUN5bYInLOb2GTCwl1TFa8G3Rfy/3stJszHIeb8xR/iTj3MqC7hrzP9Yl2Ek6
 3sGEeafqsDL0/i+myDJdA==
UI-OutboundReport: notjunk:1;M01:P0:7t9Vbysqt/o=;fZrYQ9MrCW2wQMR1vnqMNUEr3j7
 YNy0Sy0mrI8o56qCWcPXMbwFeKvZSYDLQIc0Ijjhgm03dUSzahEEI5f5HJDL+lLnbJH2mHfsu
 /3aSr79J7grLGa3G2M+UjL2cM2GJi3NHbLIlCl8WD/mHq46Imv2v59bRf+pYfKGvX/ZuvOiYU
 DnpmpV7kbDT6/fhZ8JXVgC1OTplZDPTbyAMxG3hN+A+5NKx0WKjbPoSA0sK0STWM7FQQcD8ax
 GSUE32/VvkPo4Q5TL+5IAfE4GpCO6q0qCl9b5MTtUrN1Gi54ZVrqd8bpNnHPJmaqCXeVnyou3
 8OOgngG3NtWM7mIq6HwTu6tlL675ZJZkBpb0N9ysRQoxScqa82aWYgW1uGHP7iw1tr9OTlklW
 Af8JdgneDmNsftOWp0XDewJbxL6k+YIcrIcueNzIBB6Lp2+RcsbIG1RLEJOyJSlFxLwb32uJn
 0jlg22vKVVvftzg9MnniqUVC1PFueFP15WpJbZXZ1oibjbxXxofS9B0qc76OazPveloHMcz1v
 juErKA0P7mjiZHs2rOfXF/63Y7/UgHN4EPeK7Lf/SLhBLd9CAp5zsjtLjg2WUspzU8Wmhq8FQ
 4xQlK9pPBjF4OzQzeP9S/8Wm8rSKdFT21BIOD9PDdCz/Lu2JH9/ZSkTFXVQIKlRmwZH6RWf9D
 hWGqFCSyi9R+GLlpH0VeiIQgX7RFbxBZ/4H+9a2HJb7Z4uwDZlIx2vcNXknXiUfi3vwd7iOCa
 9Ux2ZzhNHYrfR8sd0Pfaac1Z4QnVrPn96ootZ6uCoEW2a+qLIlKjnXSdr6CKE9T89NCw/ltJM
 f1SP3PvPyUDOqQfA37h77OS5cbURdmHKlf7V6qHI6EQXXwRVdJx8MlbA35ZKxlGTie5BcMb+7
 ljtTmjbMjfWPnr5kvGf1WC5Vm36wRbcapLgR7Zw78ZJuleZJFcwSn3Youn/pZfxIhZEu1rTBr
 kdFZeHuBxobBDCLVX+YDNhdybXvWsMolE1kiGuaQyahnNZZlUiZr+K936rLe0Fe9aQ7YU7nsw
 zcXgl7CIMy9JFlLP8vt/htmDplcHa3T4otinI33g+OhHD9WGAvgofic0ppXuZnfloA/3FXtCL
 vbFuMGcs6t56hhNbXeQO3WKBMo6vQUYLK8YwvIlAJe+JBlEJNdpVoLvQfOjRqy5PwnlPqGHNh
 QAYf3sOGhrKgEKmbE2Fm8SJOfRWOnHe00WNkYmWfQBgW+6L4hOfLRusGvrSAjrWmvxdwC8ij4
 /Z6fcj7NHesEs7wTPqxsNSd+KnzBLsicXb3JgMzhq0jcMlko52WGkRAA7du/tljgWcHV17A4N
 MWYZ+vZaPs2nqjGy5EUqS9QM/7cDA7pRhMQcL5mZw2wj4v2SW67P8nn6IDVHzxR70H9v7YjtB
 /IPW04WzyIOb1frR17z8o28MBkjrXl84b3NqhSOcFy8bChaAduQTKy+Wtf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_142004_567469_BD0D8577 
X-CRM114-Status: GOOD (  15.38  )
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

Hi Jim,

Am 05.02.25 um 20:12 schrieb Jim Quinlan:
> Just make it clear to the reader that there is a conversion happening,
> in this case from an int type to an irq_hw_number_t, an unsigned long in=
t.
I'm not a fan of this generic subject. A possible suggestion might be:

PCI: brcmstb: Clarify conversion by irq_domain_set_info

Regards
>
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>   drivers/pci/controller/pcie-brcmstb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/control=
ler/pcie-brcmstb.c
> index da7b10036948..1e24e7fc895c 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -560,7 +560,7 @@ static int brcm_irq_domain_alloc(struct irq_domain *=
domain, unsigned int virq,
>   		return hwirq;
>
>   	for (i =3D 0; i < nr_irqs; i++)
> -		irq_domain_set_info(domain, virq + i, hwirq + i,
> +		irq_domain_set_info(domain, virq + i, (irq_hw_number_t)hwirq + i,
>   				    &brcm_msi_bottom_irq_chip, domain->host_data,
>   				    handle_edge_irq, NULL, NULL);
>   	return 0;


