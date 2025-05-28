Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A6C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 03:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+9g0jjRqmhF0kN4jpC6BzKtxGKIexmnwr+kN5DjlRU=; b=LUjbdypbo0YZ5qFZSGbNJAeva4
	aVtVW0XyMyzR1wwI4wFQ77mwvBYhGOhfRLRBmwR1MDTflDyXf03vvyXhER9Qb+9B7pW9hFTaHpEYu
	Abl9bMZ09l/0WXbICvsiL+bM3tERzlhpaZgUjr09jtAJUpEguVzrrhi2pRsnAz+AjNgGnXKS5iPRC
	1c86hBf1217EDDl3sB4xE08Ig23GhDFzvLnUcNWy4jfQPSm/4fCh1WaoATSWluQRztc08+LD/HLk2
	oB0mVa4PjKVF2jPDyA+8YAWaJMLp68DrXakfty/m9ZUkL1oV8zOedfef0pTP49uTZ5K3Tr8dq6+qF
	fWXznL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7ng-0000000C5Hh-0zhp;
	Wed, 28 May 2025 03:49:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7lY-0000000C4tY-0IvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 03:47:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23211e62204so26567365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748404062; x=1749008862; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h+9g0jjRqmhF0kN4jpC6BzKtxGKIexmnwr+kN5DjlRU=;
        b=tWpt7qI8mNWV6+NztqZ3WdPNcfGc6O5dbGapzckODXRIX/f2yOy616S0S3dRUgC/Mr
         ECy2Ju+BcT58E6WulO5B7lzkpniPbSiQDdQwCTwlTXZ4W/Qlz322+p5f8Aell/BqY05U
         pv3EcWN2Dykw+7GMRhEZhtDx5b8sw0kCoy6QSHdA6yCqqSffdAdilsXeKIGIDjEkrXbD
         4lJcoSPDNyNSmkwW6XicgYqFWCACdLeI2fthJE26J3dl2qjtYMBKd7E1v/AN2/R0FFx7
         4kchDTJ8QpcfhCaNwRbKebTtq03UfIAC/afP4oLyZt/Gl3WKGYO+lD2yJOAoHL6guDHe
         XkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748404062; x=1749008862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+9g0jjRqmhF0kN4jpC6BzKtxGKIexmnwr+kN5DjlRU=;
        b=V/CL8ptgi+PIdhgW7Lds4K5AAYtYgl5b5nqAZMiO6Txp0x/odwDDMU1hUybXvWNneR
         9YZx71c2EPMNn7nN3JzmoPa+W7LpnwbTE9HI98DIi1ZDmbOzxdTt483kN7MeOzJ5Tmk5
         v/zMC3n9qYd2b1Ac1z3pd5bfkvIhptKRXYo6R35EDJ+J4itXaCICCAnchLiUhqe9Y16Q
         cIyv05qeDd5pdfX8gqs6RsCigRTaAAISHk6WlI7O6I665UZphtNh2s/Fhos6T69KvvZK
         E/w9KF+PAtNXzKBZQPopK5vuFC0sP3BGCIw8HSfsTuYFRDR1qo3EPrmJ2dQH5rNUUlE+
         5YbQ==
X-Gm-Message-State: AOJu0YwsX9X8zGjClbR8Tmtq8RXeLDTwlZT9Tw7qvemtBtka2KR6hBWc
	QHlwt6prbMDZwFC90uziA4op7BOfFjQDule0qews7JlNjxp4j69v56lu1GedEP4hDQ==
X-Gm-Gg: ASbGnctp085BP37oyxHXm5koHbIFyUHK0HDNXYDsenwYJD0OavimZxB0CTBgtOna/Yz
	zfRAGshB6S/q9VqmD852J+wxLiGFQbFFsd8iU4zjdEK2zo9t4ehmqbylkLZinoay2jqN2CsmKDd
	mB7KDj8yqvVZLqvNHzEWsmrl2/TMJ7mIjjbQSXxQk45cbWM/8OTRGpsGm5g1kztLokHxr3P4Uqs
	opj9C1+mLdKr9YT0PBbzg/IVOF3YgaLfid5X22CQnMnzgUw7FUF9jOJZ6arHxqSjXWlQ0CoyQ6c
	zwzbShrTsqofnbqWknn2Y4b17z8YlM/j3cud/U6dl9P6D1XoxfPkBD23peH2dcMfi5Bl5CLVAA=
	=
X-Google-Smtp-Source: AGHT+IEUi6A5S8uES4iHZMououSHKnzCTcxXGhYKA42ZvuULMyc2nhVY5fjwE6TvUPYSQWctHRzSFQ==
X-Received: by 2002:a17:902:f686:b0:234:a44c:18d with SMTP id d9443c01a7336-234a44c034bmr78425935ad.22.1748404062477;
        Tue, 27 May 2025 20:47:42 -0700 (PDT)
Received: from thinkpad ([120.56.198.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d3590bf8sm2056925ad.129.2025.05.27.20.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 20:47:42 -0700 (PDT)
Date: Wed, 28 May 2025 09:17:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
Message-ID: <rvfkojyooqg7unr4i2izx4hmb24ppsx7tn65pbtfmlbrga76iu@dvsg74hlspzu>
References: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_204744_114621_5D47AD2E 
X-CRM114-Status: GOOD (  25.74  )
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

On Sun, May 25, 2025 at 06:04:03PM +0200, Marek Vasut wrote:
> Add the ability to enable optional slot clock into the pwrctrl driver.
> This is used to enable slot clock in split-clock topologies, where the
> PCIe host/controller supply and PCIe slot supply are not provided by
> the same clock. The PCIe host/controller clock should be described in
> the controller node as the controller clock, while the slot clock should
> be described in controller bridge/slot subnode.
> 
> Example DT snippet:
> &pcicontroller {
>     clocks = <&clk_dif 0>;             /* PCIe controller clock */
> 
>     pci@0,0 {
>         #address-cells = <3>;
>         #size-cells = <2>;
>         reg = <0x0 0x0 0x0 0x0 0x0>;
>         compatible = "pciclass,0604";
>         device_type = "pci";
>         clocks = <&clk_dif 1>;         /* PCIe slot clock */
>         vpcie3v3-supply = <&reg_3p3v>;
>         ranges;
>     };
> };
> 
> Example clock topology:
>  ____________                    ____________
> |  PCIe host |                  | PCIe slot  |
> |            |                  |            |
> |    PCIe RX<|==================|>PCIe TX    |
> |    PCIe TX<|==================|>PCIe RX    |
> |            |                  |            |
> |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> '------------'      ||  ||      '------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/pci/pwrctrl/slot.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
> index 18becc144913e..222c14056cfae 100644
> --- a/drivers/pci/pwrctrl/slot.c
> +++ b/drivers/pci/pwrctrl/slot.c
> @@ -4,6 +4,7 @@
>   * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> @@ -30,6 +31,7 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  {
>  	struct pci_pwrctrl_slot_data *slot;
>  	struct device *dev = &pdev->dev;
> +	struct clk *clk;
>  	int ret;
>  
>  	slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
> @@ -50,6 +52,13 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>  		goto err_regulator_free;
>  	}
>  
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
> +		dev_err_probe(dev, ret, "Failed to enable slot clock\n");
> +		goto err_regulator_disable;
> +	}
> +
>  	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
>  				       slot);
>  	if (ret)
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்

