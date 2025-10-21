Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670FACCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 04:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hiGOwtbn751Z9KEbSua+qX3ZxJnr5e2JNCJKMsP3Nw=; b=XtOqPzG92IE8MoXOPz+ppfLGI3
	Xs+TIhba7XYhOJqsS9MtU6yszpRsF7KO+y04ocRQ0kpbcnoTjlkcUr3VcT1UCqfWPSXEHF0y4uTZN
	nLZqtTl9Og6a8FFFxpmP4SVAxpdISRgPfEjum/A0aDarxVlff3XY0NV08YGqHgDGgc4rd++2xrAgz
	DKIF+0TpuFwVbb1hGEsYD/pG9i9KXZK+Q3oHgPHzVN6vgQErDWsOWScMxdElseyBwgxH8dDtq3KfS
	LssDIgUbCG6CAiW1nd0JzNwEV+n4lvSPgn0ZOwW9SV5WmDhT4OyhyWM1XSyznL+LJmEpcJBgefAgt
	hwP4iGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3xo-0000000FmrC-0CSu;
	Tue, 21 Oct 2025 04:27:12 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3xl-0000000Fmqj-0LKR;
	Tue, 21 Oct 2025 04:27:10 +0000
X-QQ-mid: zesmtpip2t1761020794t6063e055
X-QQ-Originating-IP: vMCkboM9fsdjPAzo91wrsqh4saIlE7UDpjoWy4czKSc=
Received: from [IPV6:240f:10b:7440:1:21fe:b84: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Oct 2025 12:26:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1327726975815582351
Message-ID: <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
Date: Tue, 21 Oct 2025 13:26:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Niklas Cassel <cassel@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OU1KiBGGGpgtLA5cQ6nXOsavR+8KCbLlloJVYgpAwH3ElL8iyhDZYMXW
	RDz2F5dsomu/Bs5OVyaiHWKT9qlvHJS8X7b7Nt3Te6XEP0YpVMyMxeg04IAZVUHXnqFwzDV
	Yh9JcBR+gd76BPx2DRrerSY3m+XUXoJHdcjn7svrxDlBDf+C4+/xjFC9tbRi4ZZRSBBFMu3
	qYCG3bcAXsaDgx/8xNc98qsPkV8l7N+y+nBfhM/2+fmiaPOYZUp5phnP+Mw0l4HhCZff73p
	AlwbHsrg1CLBhUuYFlYwg12lIMgk8E1Ym3b0EijL6J4MN0MOly0Y3cCRPyZfDF+9Nhkf1O/
	wpxHpHhY3FJEjaW0sN9iPAmJlBrYf8ZxPPJqs8vf49F5Se6R9HdZihKMPYyngxRtQ7k/EPn
	dSoOFPDTk8yGRHbrZ8IhnL4d9snKI26aRczK/FupDjd7q9E+VZ96ePxYw5B97AwEPdlPHEO
	xWApJci7TxHYnRdQeEqGhpQQvEhJGvsGw/wjioZ4OUVXhim+dC2qVI9Rib6tGME3jfndSqS
	AKPBdW3lZf659fUTWGIFFHdjlNueBW5AQo/z/AEYc4q5hzFPloTB8+pLJdyHe87dKChfRaK
	h0+h4pmuyR/2QDsjTEjJKgBrm6ksUigOY7oh7PesK4CzHNAB1LcOkL0LeroCbJJjfE6InWV
	h0edgIrhdiO3WB+8f8P9pHc8zkJX4xRf+Q9NUCjgNRYChSMExOoFNibxkEQeWnPffyTM6GW
	VzKZdUoGMi4097ok9MJWVZnOolyIHdnooXQLoHOqzNxb6G+xTCDlSHwlykKXJ/MM2ITJLGY
	VYyf+zmPkL3ryJysj1umuDPnILgJiXmUltgL/E2gG/X14Xeacq9SRquO+KmLAmcheKiAaKT
	SX8UcpC2jSJYNa0/Zpt+oodK2X4LPO/vhjl4ZqBLPfqCI2PMeUrudrQkM0TCydXHmgjIKxq
	HCkoSiE52iQZ11ykgLnqhoQyW1BhTtXZppYcQ7R8v/Rc4OHTM92RbyRtxgzKTPNnS7gATOi
	tcZOJGIsLfMRJ7DNZZ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_212709_467541_187A635C 
X-CRM114-Status: GOOD (  20.84  )
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

Hi Niklas, Bjorn,

I noticed an issue on the Rockchip RK3588S SoC using the ASMedia ASM2806 
PCIe bridge where devices behind the bridge fail to probe since v6.14.
Specifically, this started happening after commit 
647d69605c70368d54fc012fce8a43e8e5955b04.
dmesg logs from before and after this commit are available at:
  https://gist.github.com/RadxaNaoki/fca2bfca2ee80fefee7b00c7967d2e3d

I have confirmed that reverting the following commits fixes the issue:
  commit ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we 
can detect Link Up")
  commit 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on 
dll_link_up IRQ")

On v6.18-rc2, the cold boot behavior has changed somewhat, and I have 
observed the following three behaviors so far:

- Probe succeeds
- Probe fails
- Kernel oops

There seems to be no pattern to these three behaviors. During a warm 
boot, a successful probe does not seem to occur.

If commit ec9fd499b9c6 is reverted on v6.18-rc2, I have observed the 
following two behaviors so far:

- Probe succeeds
- Kernel oops

"Probe fails" has not been observed so far.

The dmesg for the kernel oops is available at:
  https://gist.github.com/RadxaNaoki/4b2dcd5e41b09004eda2fdeb80ae5e15

Can you please help me with this issue?

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 1/13/25 19:59, Niklas Cassel wrote:
> The Root Complex specific device tree binding for pcie-dw-rockchip has the
> 'sys' interrupt marked as required.
> 
> The driver requests the 'sys' IRQ unconditionally, and errors out if not
> provided.
> 
> Thus, we can unconditionally set use_linkup_irq before calling
> dw_pcie_host_init().
> 
> This will skip the wait for link up (since the bus will be enumerated once
> the link up IRQ is triggered), which reduces the bootup time.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> 
> ---
> base-commit: 2adda4102931b152f35d054055497631ed97fe73
> change-id: 20250113-rockchip-no-wait-403ffbc42313
> 
> Best regards,
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 1170e1107508bd793b610949b0afe98516c177a4..62034affb95fbb965aad3cebc613a83e31c90aee 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -435,6 +435,7 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
>   
>   	pp = &rockchip->pci.pp;
>   	pp->ops = &rockchip_pcie_host_ops;
> +	pp->use_linkup_irq = true;
>   
>   	return dw_pcie_host_init(pp);
>   }


