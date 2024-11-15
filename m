Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E89D6DDD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PjeRA2xF0UfYKxZqoGwYKdedIBD+c8tm1voRBlQUUw=; b=Qq8pVLTbnrUoWjx2efrApBdrxe
	X9t3NFD7DJ8vq9iPQDC21jlLsCgvZzC7sZBi0nGWXAKQw4tq1PAflEjLAnvA6Ny+vYe4ybO7KHWs5
	bb/eYCM1+fgjJwwCA+GSML+1KxEXVgl/yf3qXPz+OCPV5LM2NzdOue4YvgmHetUp7tt/DEdZL7C2j
	Oq+sdvCSLNRAcOAv0rtKmOO1gjJVaxet7cwy8LOp924CECjIkCPXpTCbtZV9qsg8XavNYQ4Ze8NjF
	4/WMvdD1cOaFfYqpnodO945TnN0VBJBj82cUDh9ZKAY8+KAwO9yN2/RcVxLTdYSAckPi3fNxAYfi+
	aslXgM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpJ6-00000001ilL-2Eac;
	Fri, 15 Nov 2024 05:55:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpHH-00000001iOn-3s7w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 05:53:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so1129686b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 21:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731650035; x=1732254835; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PjeRA2xF0UfYKxZqoGwYKdedIBD+c8tm1voRBlQUUw=;
        b=keOZCcQtw7KeT/4TyxRxJ59fDFK90Z7pCcXcr7RRukQd3odLSaClz6iL44baJFoB+1
         ZRwDeAfzwbyv9plo1N+dhoT2IMY5zyXcgJGLLN1rDvHVeYYuI0TYRn6kJ1gaEDHAUrtS
         QuZGSUm5TphC7FU4Yc40JeEz2C0BB3bICGzMpDgTtzAzwLw1uUXeF3n6wnkYG7Vgp8ne
         Im8ve8Er3eeX2SlWBdoe6Odk/VaY/rh25CrHvgdIWg7MmmjDMADP0okhjFs8etv1UEPz
         8x1Y1KSafd5TvPpqHwSxosh8JjGuZfKe+FQL7rmrFoIlU3Mx5CeOunIL3mmU/tUrkuGc
         BlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731650035; x=1732254835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PjeRA2xF0UfYKxZqoGwYKdedIBD+c8tm1voRBlQUUw=;
        b=JFYkQsgyUSY/DxADC47hHyyPQpWNUvwMBtMrA95ieP5KtqRZwzQ1LE8irzgHMp2pr/
         VJ2W7Mv+g+FAj7PP3wwIFlxJl3uzT7IDxXEbTrDuzOXJy2vpCcPzw0Rias7mcyWXx3aH
         k4HzPB45jIuh1tGGV42X2NwCjNvo190SGVkg5qt7PvifTLPFbqWTbfxjvdVYC30K4Z4g
         BmOy5asfTvHv1E1FmeupsaCGo3uI4Sbx2WLo1XdEaU5QQAXbErc+gvwyS+j7Fl915FlI
         PpeVkqKdL4bdA6ci+BuFXS9WdGSrextYdAODCxFl0rVa/J0zwfSZft2xqNdvTZ9sPDlA
         mMwA==
X-Forwarded-Encrypted: i=1; AJvYcCUTKdKnJB6NYSzIv7NeoTyObNDkZxvq6sf8lxj+JzvJaLMuiUaYMps1XyqU9fnUHcQ7pyMgN6yabd7kwImjeI+0@lists.infradead.org
X-Gm-Message-State: AOJu0YyH5LkjtsuB+2/pmBzfAW/wOCan68KLNgIj68M03tbiJ+6FnTfY
	RP9WaSWieGk/8Cz6DBvvBCSam2thXtdB1BBrWMBa8KQyLNSSHhYK3aoxhQxJtQ==
X-Google-Smtp-Source: AGHT+IHmV0f5ACpxzanuVu8/s8lS/U9F+wX+vXwYW4uBhXPOpRx3lgl4u0soVqVsy9/dqVOSZpIM6g==
X-Received: by 2002:a05:6a00:a08:b0:71e:6489:d18 with SMTP id d2e1a72fcca58-72476d5a95fmr2213233b3a.22.1731650034748;
        Thu, 14 Nov 2024 21:53:54 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477120a13sm617854b3a.60.2024.11.14.21.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 21:53:54 -0800 (PST)
Date: Fri, 15 Nov 2024 11:23:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/3] PCI: rockchip: Simplify reset control handling
 by using reset_control_bulk*() function
Message-ID: <20241115055346.m2rhcb7z5hoydxsb@thinkpad>
References: <20241019060141.2489-1-linux.amoon@gmail.com>
 <20241019060141.2489-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241019060141.2489-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_215355_979054_17684FAE 
X-CRM114-Status: GOOD (  27.20  )
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

On Sat, Oct 19, 2024 at 11:31:34AM +0530, Anand Moon wrote:
> Currently, the driver acquires and asserts/deasserts the resets
> individually thereby making the driver complex to read. But this
> can be simplified by using the reset_control_bulk APIs.
> Use devm_reset_control_bulk_get_exclusive() API to acquire all
> the resets and use reset_control_bulk_{assert/deassert}() APIs to
> assert/deassert them in bulk.
> 
> Following the recommendations in 'Rockchip RK3399 TRM v1.3 Part2':
> 
> 1. Split the reset controls into two groups as per section '17.5.8.1.1 PCIe
> as Root Complex'.
> 
> 2. Deassert the 'Pipe, MGMT Sticky, MGMT, Core' resets in groups as per
> section '17.5.8.1.1 PCIe as Root Complex'. This is accomplished using the
> reset_control_bulk APIs.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One nitpick below. But don't need to respin as it can be fixed while applying.

> ---
> v10: Fix some typo
> v9: Improved the commit message and try to fix few review comments.
> v8: I tried to address reviews and comments from Mani.
>     Follow the sequence of De-assert as per the driver code.
>     Drop the comment in the driver.
>     Improve the commit message with the description of the TMP section.
>     Improve the reason for the core functional changes in the commit
>     description.
>     Improve the error handling messages of the code.
> v7: replace devm_reset_control_bulk_get_optional_exclusive()
>         with devm_reset_control_bulk_get_exclusive()
>     update the functional changes.
> V6: Add reason for the split of the RESET pins.
> v5: Fix the De-assert reset core as per the TRM
>     De-assert the PIPE_RESET_N/MGMT_STICKY_RESET_N/MGMT_RESET_N/RESET_N
>     simultaneously.
> v4: use dev_err_probe in error path.
> v3: Fix typo in commit message, dropped reported by.
> v2: Fix compilation error reported by Intel test robot
>     fixed checkpatch warning.
> ---
>  drivers/pci/controller/pcie-rockchip.c | 154 +++++--------------------
>  drivers/pci/controller/pcie-rockchip.h |  26 +++--
>  2 files changed, 48 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index 2777ef0cb599..c17aa8ec80b9 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c

[...]

> @@ -252,31 +177,10 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
>  		goto err_power_off_phy;
>  	}
>  
> -	/*
> -	 * Please don't reorder the deassert sequence of the following
> -	 * four reset pins.
> -	 */
> -	err = reset_control_deassert(rockchip->mgmt_sticky_rst);
> -	if (err) {
> -		dev_err(dev, "deassert mgmt_sticky_rst err %d\n", err);
> -		goto err_power_off_phy;
> -	}
> -
> -	err = reset_control_deassert(rockchip->core_rst);
> -	if (err) {
> -		dev_err(dev, "deassert core_rst err %d\n", err);
> -		goto err_power_off_phy;
> -	}
> -
> -	err = reset_control_deassert(rockchip->mgmt_rst);
> -	if (err) {
> -		dev_err(dev, "deassert mgmt_rst err %d\n", err);
> -		goto err_power_off_phy;
> -	}
> -
> -	err = reset_control_deassert(rockchip->pipe_rst);
> +	err = reset_control_bulk_deassert(ROCKCHIP_NUM_CORE_RSTS,
> +					  rockchip->core_rsts);
>  	if (err) {
> -		dev_err(dev, "deassert pipe_rst err %d\n", err);
> +		dev_err(dev, "Couldn't deassert Core %d\n", err);

"Couldn't deassert Core resets %d"

- Mani

-- 
மணிவண்ணன் சதாசிவம்

