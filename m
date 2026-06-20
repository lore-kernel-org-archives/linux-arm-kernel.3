Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3447CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx0bxxry/77UN0ow4X+b4aZiEHrj8eYQP0sffliHaf0=; b=09dzom+N50qCQurC/43uiltohP
	3gvnL7Gydb0Qs5QXi1GYgMO1BYU5sCsvvgqX8VSGqNwwPQEhziTBapfSKghaMxO09ZWxme9aLw6N/
	+C5q6P0LEYZB+CpppW6Tmh85nQL8iw6SHhsQyyf8Rco+BlVs3+fCT+3kpn6onN4/9IQr/xpg8LYAb
	H9TooI5MFlsmzT5oMVSynZQwuyzod+KfAIipUaoK9rdR6ZSxQgK8zLR0qw3HF/93806h3A64P8wbD
	Rp2ORwr5EEn3s8Hush9LOatfINgqjVbRupUqxBwTIzk/TEQsRHKZWkOWo/i9x2UPcBkABJRIPJDtU
	tFcHgANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warYU-00000003Hxf-3msK;
	Sat, 20 Jun 2026 08:59:58 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warYR-00000003Hwl-1Pca;
	Sat, 20 Jun 2026 08:59:57 +0000
Message-ID: <88a57a54-ef19-43f0-8164-a1cb21974918@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1781945978;
	bh=vsdEdpjf7YSZOGITRSdWA0LYI4GjLDa0j2gKjaAg18s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=peso1UTWFh/XtQ4tcvTy0JntRl8cFTKlJAeEZajMasRzihq0EHxnYv2jJYykxgRFB
	 3CikronWW1Wt24Cey2SIZy+gWuSK2xmoZW3RUUlOdqoQZ8IZ1ReHtD2WepSPqfewZ1
	 +7Fb2KtgALnUhEcLE/JnYUYJsttQNPmtinIc1BWo=
Date: Sat, 20 Jun 2026 10:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
To: gowtham <gowtham@ferryfair.com>
Cc: robh@kernel.org, bhelgaas@google.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, neil.armstrong@linaro.org
References: <20260614015620.20432-1-gowtham@ferryfair.com>
 <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
 <b2d8cb85-5529-4a4c-a233-64ca7a436f0b@linaro.org>
 <20260617050627.4d01ed54@slick.ferryfair.com>
 <20260618020025.2739cb96@slick.ferryfair.com>
Content-Language: en-US
In-Reply-To: <20260618020025.2739cb96@slick.ferryfair.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_015955_843917_B941F9C8 
X-CRM114-Status: GOOD (  15.74  )
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

On 6/17/26 10:30 PM, gowtham wrote:
> Hi Ronald,
> I see you submitted the patch. Last couple of days I've been fixing the
> etherenet of my BPiCM4+Waveshare-io-base-b due to which I couldn't test
> your patch any sooner. Now I got my ethernet working but now I couldn't
> reproduce the issue *without* either of our patches!!!
> 
> Anyway it's proper to initialize PCIe with RESET Active but I think
> meson_pcie_assert_reset(mp) will give sufficient time to PCIe devices
> to complete the reset cycle.
> 

Hi Gowtham,

No worries and no rush to me.
I think it's due to how uboot set the gpio before the linux boot for my
issue, and that does not seem to be relevant for yours.
Thank you for testing the patch.

> ---
>  drivers/pci/controller/dwc/pci-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c
> b/drivers/pci/controller/dwc/pci-meson.c index 0694084f612..c28ab40c9ff
> 100644 --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -308,8 +308,8 @@ static int meson_pcie_start_link(struct dw_pcie
> *pci) {
>  	struct meson_pcie *mp = to_meson_pcie(pci);
>  
> -	meson_pcie_ltssm_enable(mp);
>  	meson_pcie_assert_reset(mp);
> +	meson_pcie_ltssm_enable(mp);
>  
>  	return 0;
>  }


-- 
Best regards,
Ronald

