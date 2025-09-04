Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3984ECA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjWATqY9R+2aJgVEN/EWrqX2RI2q5I+Ijp1NxZeotGs=; b=r4wK13f2FcfFsgIOR2z3Fm3IRb
	48yGDedzZ0UoWh6CojqXvWl6YLRR0TuG71ZDLhLWEtVSHwDYvc3Rk389liB8xKvhMbHduPiiJGXd2
	s2TZwrOEJwYpBOAupSv71y9odG71XHdnIAS+5Wa/XruF5Gu4mxPdxVNtXjA1qvQQLMrHdl2qpTXyl
	xN7MkiYG0sVSls0WOaDcglcCyZeKfpvb4F9RbzI3XM3VCDvgF4vbiZwxdob7kcxNHn+jcVtTzt2hD
	gb1w5HJG1eAUhaHIKEggk66IK3WtpJgtqTUlBu7yKyy52XDaN7P8nGP5mEwqTgKNU2EinTscciV2N
	kWynC75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4XY-00000009vXY-0w0a;
	Thu, 04 Sep 2025 07:37:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4KH-00000009q9h-2QKC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABDF4402EF;
	Thu,  4 Sep 2025 07:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D0EC4CEF1;
	Thu,  4 Sep 2025 07:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756970648;
	bh=vFFmIxQR5dNQxYgO3KgkRAsY5U+JuHBroGCNglNwQqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PioSNYUgi7J0BCQJgaatA76ORpSRB2Re2wu5FDNCYpQmoEIr46Df87QBeCcUROaXQ
	 Vgp0XnTdU6SuB1q5lmgem9OLpUerWL5QBwlVOdo1QM6QgCm0AcMvkYX5zzDhTPJ7a9
	 gC4zGZz/Eb4C8Z+DjcIMkbzRT+rQjF8YeK2d+zaHbCrx9V1/x5WycPVOsDLRTxSJFx
	 aQBeqxfvZP70NJ2ihvSIRlII4fv4vOtKIvnjPIxP6v6PnyOSpTS4ZXijvPIfdfJH4I
	 YAroKaxzpvMs1DSaEyFWyX6y9GVBUC7TkWSi8RcFqEZt7Eac+3wSWpi3r+382uePPM
	 3kQh9ThanqRDw==
Message-ID: <3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org>
Date: Thu, 4 Sep 2025 09:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] PCI: keystone: Switch to devm_request_irq() for
 "ks-pcie-error-irq" IRQ
To: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, jingoohan1@gmail.com, fan.ni@samsung.com,
 quic_wenbyao@quicinc.com, namcao@linutronix.de,
 mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com,
 quic_schintav@quicinc.com, shradha.t@samsung.com, inochiama@gmail.com,
 cassel@kernel.org, kishon@kernel.org, 18255117159@163.com,
 rongqianfeng@vivo.com, jirislaby@kernel.org
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20250903124505.365913-1-s-vadapalli@ti.com>
 <20250903124505.365913-10-s-vadapalli@ti.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250903124505.365913-10-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_002409_666128_56C6A1E9 
X-CRM114-Status: GOOD (  18.73  )
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

On 03. 09. 25, 14:44, Siddharth Vadapalli wrote:
> In preparation for enabling loadable module support for the driver,
> there is motivation to switch to devm_request_irq() to simplify the
> cleanup on driver removal. Additionally, since the interrupt handler
> associated with the "ks-pcie-error-irq" namely "ks_pcie_handle_error_irq()
> is only printing the error and is clearing the interrupt, there is no
> necessity to prefer devm_request_threaded_irq() over devm_request_irq().
> Hence, switch from request_irq() to devm_request_irq().
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>   drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index bb93559f6468..02f9a6d0e4a8 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1277,8 +1277,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> -	ret = request_irq(irq, ks_pcie_err_irq_handler, IRQF_SHARED,
> -			  "ks-pcie-error-irq", ks_pcie);
> +	ret = devm_request_irq(dev, irq, ks_pcie_err_irq_handler, IRQF_SHARED,
> +			       "ks-pcie-error-irq", ks_pcie);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to request error IRQ %d\n",
>   			irq);

Ugh, so you are not removing any free_irq() from anywhere?

<me checking>

Because there is none...

So you are actually fixing an IRQ leak in case something later fails -- 
I guess this needs Fixes and Cc stable tags, right?

thanks,
-- 
js
suse labs


