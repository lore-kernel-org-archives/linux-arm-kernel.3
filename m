Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1B4C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 05:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGClTHgroxBcfOqGpSNsGz5pDhgYGNK3UlpzTs482Pc=; b=Qb0MQVpGmVXFVvnb4Ga02NdDWC
	Qw4WWizEryo96kO0Xv6isZGEFGC83kK+tAeq+YK0dAsO722yaxFgkXQBPwBHZ5nUoU10Zbfp2ODhS
	g3KoFUulQustvAI1a3VvvvBT5vSUu8FXbJZgFmfy1fdl5+Wjb0bf2FI9Pq81J5Nh4V1RUrtcqzka2
	XPJyGxXCjzaSRq5Sk9gw7UooxmDlJtOJKxHSiTdmKjIJuSfJrxpmGXQ4jBtTCYXnPJgdfj4s1gO5x
	2nfzy71tuJdkRpd68Lu/y3haLOEKp04agU0gnn1UtfAY5WrGgbAMMcPCJmAGsmjcvVE9OFBgSbaID
	v9yu/LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9Lr-0000000CDYa-2YKZ;
	Wed, 28 May 2025 05:29:19 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9Iq-0000000CDBP-0LUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 05:26:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so111274066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 22:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748409970; x=1749014770; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eGClTHgroxBcfOqGpSNsGz5pDhgYGNK3UlpzTs482Pc=;
        b=afTY6utcc+W+dhUb79gSe0GipDLcibocjKlRX35WazqifOEAjRy8o62nEGMSrSSCLV
         veYoxe7hfwWX7NnBaP0DSy66KXp9Pa6XlzahA+7BtCOTNI71w2N8enF8FT/T8Lg5xIF/
         Sfyf48REcr/DMh4WWwqJNfEA93/BH2KPba9zTWvGmZ/ISUIW0P1muF8wESXTSHO9QHqv
         ttJck1uOLq/PmGczGwXERiyBVNwAYiraxpF2+YfPyozmhWjTbAgontD2NDH+Y8RVcZh/
         kea3YDoivu4S5g/WNic1ojoWnNtq6blzRX02qwkC9DU6cKHf5MRoEITvPH52qhULhviL
         i4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748409970; x=1749014770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGClTHgroxBcfOqGpSNsGz5pDhgYGNK3UlpzTs482Pc=;
        b=hZA/ByKjNozPnDOHeNplMx7zv9a0eeZzfIPhYJgOo1pTZud/f8mniDJP80MZ56tNMN
         Sp/tkUaSxPzPQZHDgU/xEw/gRuItFXsRxL1ZFhk6PU+nz78yM7jYY/X+MtiyfEB+5Dv5
         qNWO3FBFhlsR0dYIEe0hPz7SlawSN3ApgVoNNeIM7hgEcaQcD623s/FeEC+WGfxRK34H
         1mh4jqvLtY7rKUqNtFSKYaeCKWeHwFGoLh0prVRYCZiRHKEpOHCp2w3vdB4iNMC0ozD4
         TZ2yzFc7w1zJMvtn9Cq/oz/aCunrWUMivp+kfk9naOtytiilhZPYVj4oVj9nTJ0BFZkJ
         GRdA==
X-Gm-Message-State: AOJu0YzuhtBoszrDyntu88f2D2Gu0PpkezsrxDnoaOSmhFrPxaQIf2hk
	1XCyRu/eaFw2RHpElRKn4HRfTWCx/hTIUujYvJcKbVxSXtbuY2Kmf0wnIapFOHPvy4kQCO/FtQS
	3gvPHIMfjioWBl6ZC3b556WTAyv/D1rs=
X-Gm-Gg: ASbGncv4r8f4bq8ZYUXNwFrAdLSbZpxQtvmPyYOeKXHY9Ba2nXT6n4onP1hgLDTWjCs
	Fn/+IvBYhf0rcNuKDjhxflJgYo3hlG4jbxpjQBxRrwFaguwmphvshJrVH29+zhkkSn9LysdKOd1
	S4GTwWX+V/1rxTUVJkhFoEFNXO3iRa3QULtu53cxG8Fw==
X-Google-Smtp-Source: AGHT+IGtzXS7r014ksMOyLWyv3PY+eL9kVmReP9BCXuY+JhbQJHaBU9SpOog9pV/WyubUhLYHA04NIb+oVSmRa6PrEA=
X-Received: by 2002:a17:907:1c2a:b0:ad5:9ff3:c6ce with SMTP id
 a640c23a62f3a-ad89886abebmr283385766b.4.1748409969604; Tue, 27 May 2025
 22:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 May 2025 10:55:52 +0530
X-Gm-Features: AX0GCFvOx05IZ5_kXJ72iIXw3IbiUdPuTxyEyjCQN5yHvmLpaXyXqe_dfeV4Hz8
Message-ID: <CANAwSgRXDLGAaXGXHfiS2rA3=+r2is2g557Bozu+SocQoBMySQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_222612_139114_D8552943 
X-CRM114-Status: GOOD (  27.55  )
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

Hi Marek,

On Sun, 25 May 2025 at 21:35, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
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
>         struct pci_pwrctrl_slot_data *slot;
>         struct device *dev = &pdev->dev;
> +       struct clk *clk;
>         int ret;
>
>         slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
> @@ -50,6 +52,13 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
>                 goto err_regulator_free;
>         }
>
> +       clk = devm_clk_get_optional_enabled(dev, NULL);
> +       if (IS_ERR(clk)) {
> +               ret = PTR_ERR(clk);
> +               dev_err_probe(dev, ret, "Failed to enable slot clock\n");
you can user the return from ret = dev_err_probe()
> +               goto err_regulator_disable;
> +       }
> +
>         ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
>                                        slot);
>         if (ret)

with that change.
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
> --
> 2.47.2
>
>

