Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254AECD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGemgfg7l/z9Y4NPU9+dW1KR++3jPHs07va51svDcDE=; b=f6ZQGnbGo9c/FLzIbVucmlFqUr
	MONIRWFVqUM/j+pZjApQqbZaE+IIdz5QbNY9W6jqhUBe9+YtMJ0YNg8gDwXI2KYa3qZlrTtE/9pub
	eH2Uc4YdX8aDyC9a/q/ETs3LaHcJ1Hg4Hb9PPakL/jUnaHFGUOHYEC7AJBv8YVqq6EALKdY3Q2nx+
	ACocAqpuhTw/GydQJAQptDthl8W2Wf0uo5urfXxceyzA02VQW21txo6mAblmNmPMAXtGYwhKXLska
	JcFEoO7HbhbFwDA3O5UUoxXS0AJ+mWgekE8jh5LjRNOb2RIZLTezDUzIu5xg783BQkBvnIbbDZd0F
	Xq1RM60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4fT-0000000E3YM-0Q6m;
	Mon, 15 Jun 2026 10:35:47 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4fO-0000000E3Vk-0L3e;
	Mon, 15 Jun 2026 10:35:44 +0000
Message-ID: <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1781519734;
	bh=/Q7NtayrvVRmyxiIVTsRX0sWVVQM4Ve6hFR6FbOnq+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VxhYHQ8j5sJm4bQZT3JjTsjWDKRMqJqeEzxK3IRtHlmTkQH7+KewdQjRf5JtjZRqk
	 W8kiFSJVljSzuPtR7mY1TWnkfibFxaRGC0aCxVp1z0hdEL8nO0/k4phqhNiW18BYBX
	 qXQWkllFMIjwg2F/R4tYgUP2KfKIs6zZpk9U+fB4=
Date: Mon, 15 Jun 2026 12:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
To: Gowtham Kudupudi <gowtham@ferryfair.com>
Cc: robh@kernel.org, bhelgaas@google.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, yue.wang@Amlogic.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org
References: <20260614015620.20432-1-gowtham@ferryfair.com>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <20260614015620.20432-1-gowtham@ferryfair.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_033542_568343_BD163996 
X-CRM114-Status: GOOD (  17.53  )
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

On 6/14/26 3:56 AM, Gowtham Kudupudi wrote:
> On warm reboot, the PCIe controller's LTSSM starts link training
> immediately if PERST# is already deasserted from the previous boot.
> The driver then pulses PERST# for only 500us, which is too short to
> properly reset the endpoint device that has already started training.
> 
> Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
> so the endpoint gets a clean reset cycle before link training begins.
> 
> This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
> Cold boot worked because POR held PERST# low; warm reboot did not.
> The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.
> 
> Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 5f8e2f4b3c12..3a7e9f1d5b8c 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -310,8 +310,8 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct meson_pcie *mp = to_meson_pcie(pci);
>  
> +	meson_pcie_assert_reset(mp);
>  	meson_pcie_ltssm_enable(mp);
> -	meson_pcie_assert_reset(mp);
>  
>  	return 0;
>  }

Hi Gowtham,

I have a patch [1] that I haven't submitted yet.
This might be related to your issue, what do you think ?

[1] https://github.com/rclaveau-tech/linux-khadas/commit/bee0a02d9756

-- 
Best regards,
Ronald

