Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD504E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 05:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+JDr1LaRapYlu+PHe/GJEFAnj4I7CbUPpdQPHNvTfI=; b=EwTzF42zv5mjnerJCF1dVzyhjO
	b3VbzwWcEsKGGTO9oeIKW1aJhsMj+uiMv4JBM1hiLXepbxESOsKKCczAcWVU75lj96pUPqGZF7Is5
	a01zoEMM754/gRndjjgYz3F6PnNhQbhUu1rembnkmkhp2aFWDz41+PolUUS3aT4Asbm7T5nX2SzTJ
	k/pkZV5P/yiTqZ5YptAqicPYajunAt3D9aKWErLey/rEmBHU3ICAHNmI4Gh+Q8EPwIJV+oUiktkiR
	HLojtt8N9oM/4wGq9blPpzKvup8w5ifhjwyT3sen9nALH1ORFPpIfZ8oo3uvzibruj0DuRoJ//RAD
	+gXnGWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQgQn-0000000FDc6-2QMj;
	Thu, 26 Dec 2024 05:29:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQgOV-0000000FD2e-1cda;
	Thu, 26 Dec 2024 05:26:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso11969207a12.2;
        Wed, 25 Dec 2024 21:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735190805; x=1735795605; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T+JDr1LaRapYlu+PHe/GJEFAnj4I7CbUPpdQPHNvTfI=;
        b=EouxycGVfXGlDLkV/FB+rKHvXE50Pe3d1KOH9jE1zEsB70AauQungEsRPuaC/8pBha
         +UVS64+XDa6IcsGj/fyxcIO7ndeyHRfscRvkVscDRn9HwElze+lMmv1Q4Tlqiu+xwNJV
         Jw80LDruAf27w0X+2ITMWLVMeWcAOGFy4iUYQZmWRFJNFIz4VnqESABJBh6KJUVsd/ah
         +ZS1+lpuKAjPfhjcsxZNSql2mOSoUcHwMc680VHmxdqw6zGGWj9Pffl6VTtUx1r2bw/+
         rqx22B9aIjZr2vrFnf8nG064IKnV9pKJpelLQjAvSQMxbKeOvxPb7ZnykC5CWqdHX2u1
         AB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735190805; x=1735795605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+JDr1LaRapYlu+PHe/GJEFAnj4I7CbUPpdQPHNvTfI=;
        b=AtccdH6dmocxxvfiSgZ6vKCwHueXseq8xuaSQZjE58tO3RtnDl9X1aZA7tMt+xTQJJ
         Ouuij6lYRBwI/Yf2yy/L/yOGrseNwXZ8VlVx2J+L+jYO4CeLCjofSiL3qzP5dh73yazc
         QgPMsw3nsnkxODOgxeheVtuuDM7UDefhe2nmEiRS5g4vZkpBIcyP/K3i3aZ3Y8tmorfJ
         5NUu1x9P9sJ2cqZvSXfIsv3eCecuSI74uivoytxXUXHUZbEqRN9W1XOS4FEsYXjeUzng
         tRMUkX2p2xdKDb6GQN+slP2H8HpyW868MktX9NUuGcMVIzCqE1bIP1SadiGKOgkvc4lv
         jFaA==
X-Forwarded-Encrypted: i=1; AJvYcCVjl7TLgmYr3lKoJ1eZ61o5ibvqMNMzbl02ruJ1wa2hZkAkY5H3zGIUNFyoM6L/mxROMj+IINtAGAdPrBG3gaAy@lists.infradead.org, AJvYcCWYj/ZpkOpLTmlSujDwFsKUgesVl/x+WDQPRR/opsqpW7CnQrwvgalkgewHLXk1Mgk4A0xvTLP9RwqtIwZolGg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjYfVkMU0/DaijJK4lsECzVZ7xMUCZZlIcnCNiBGePNNxK04ZV
	8CmeRxDDI5PQbFyGZihUPDG7sElNkwf27E52odsRXZs5GZa8cLbyEZLbZviqkvC1f1zBH/GU7jo
	2nT8xstukHnro9QDVUtJLBAbQcRs=
X-Gm-Gg: ASbGncvXJzNPDwF5hOifdOOBCdSP/gtBrKJHrsB/pfPGTbEy+32idfQoZMFrWIfByO9
	cnrsQFYY+T8MMpdvTC4R1fShWkrvjhTGKtHjrng==
X-Google-Smtp-Source: AGHT+IHQ7vKwTP1Zh5rdZtm6sAzdXA46Hbae0qn8v1s5EYWSFykwVcX3dLIMcWjb/pilCPy7xwAqCzbLwxMhQ5SdnJA=
X-Received: by 2002:a05:6402:5255:b0:5d4:75b:8ced with SMTP id
 4fb4d7f45d1cf-5d81de39845mr18362948a12.32.1735190804649; Wed, 25 Dec 2024
 21:26:44 -0800 (PST)
MIME-Version: 1.0
References: <20241202151150.7393-1-linux.amoon@gmail.com> <20241202151150.7393-2-linux.amoon@gmail.com>
In-Reply-To: <20241202151150.7393-2-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Dec 2024 10:56:28 +0530
Message-ID: <CANAwSgRgnwszYSH4uS-u=52f0vQuB2_SGcfNak_Xipe4=gXPOg@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] PCI: rockchip: Simplify clock handling by using
 clk_bulk*() function
To: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_212647_437330_E7656CE2 
X-CRM114-Status: GOOD (  25.97  )
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

Hi All,

On Mon, 2 Dec 2024 at 20:42, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Currently, the driver acquires clks and prepare enable/disable unprepare
> the clks individually thereby making the driver complex to read.
> But this can be simplified by using the clk_bulk*() APIs.
> Use devm_clk_bulk_get_all() API to acquire all the clks and use
> clk_bulk_prepare_enable() to prepare enable clks
> and clk_bulk_disable_unprepare() APIs disable unprepare them in bulk.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---

Gentle ping ?

Thanks
-Anand

> V11: None
> V10: None
> v9: Re write the commmit message.
> v8: Improve the description of the code changes in commit messagee.
>     Add Rb: Manivannan
> v7: Update the functional change in commmit message.
> v6: None.
> v5: switch to use use devm_clk_bulk_get_all()? gets rid of hardcoding the
>        clock names in driver.
> v4: use dev_err_probe for error patch.
> v3: Fix typo in commit message, dropped reported by.
> v2: Fix compilation error reported by Intel test robot.
> ---
>  drivers/pci/controller/pcie-rockchip.c | 65 +++-----------------------
>  drivers/pci/controller/pcie-rockchip.h |  7 ++-
>  2 files changed, 10 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index b9ade7632e11..53aaba03aca6 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -129,29 +129,9 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
>                 return dev_err_probe(dev, PTR_ERR(rockchip->perst_gpio),
>                                      "failed to get PERST# GPIO\n");
>
> -       rockchip->aclk_pcie = devm_clk_get(dev, "aclk");
> -       if (IS_ERR(rockchip->aclk_pcie)) {
> -               dev_err(dev, "aclk clock not found\n");
> -               return PTR_ERR(rockchip->aclk_pcie);
> -       }
> -
> -       rockchip->aclk_perf_pcie = devm_clk_get(dev, "aclk-perf");
> -       if (IS_ERR(rockchip->aclk_perf_pcie)) {
> -               dev_err(dev, "aclk_perf clock not found\n");
> -               return PTR_ERR(rockchip->aclk_perf_pcie);
> -       }
> -
> -       rockchip->hclk_pcie = devm_clk_get(dev, "hclk");
> -       if (IS_ERR(rockchip->hclk_pcie)) {
> -               dev_err(dev, "hclk clock not found\n");
> -               return PTR_ERR(rockchip->hclk_pcie);
> -       }
> -
> -       rockchip->clk_pcie_pm = devm_clk_get(dev, "pm");
> -       if (IS_ERR(rockchip->clk_pcie_pm)) {
> -               dev_err(dev, "pm clock not found\n");
> -               return PTR_ERR(rockchip->clk_pcie_pm);
> -       }
> +       rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
> +       if (rockchip->num_clks < 0)
> +               return dev_err_probe(dev, err, "failed to get clocks\n");
>
>         return 0;
>  }
> @@ -375,39 +355,11 @@ int rockchip_pcie_enable_clocks(struct rockchip_pcie *rockchip)
>         struct device *dev = rockchip->dev;
>         int err;
>
> -       err = clk_prepare_enable(rockchip->aclk_pcie);
> -       if (err) {
> -               dev_err(dev, "unable to enable aclk_pcie clock\n");
> -               return err;
> -       }
> -
> -       err = clk_prepare_enable(rockchip->aclk_perf_pcie);
> -       if (err) {
> -               dev_err(dev, "unable to enable aclk_perf_pcie clock\n");
> -               goto err_aclk_perf_pcie;
> -       }
> -
> -       err = clk_prepare_enable(rockchip->hclk_pcie);
> -       if (err) {
> -               dev_err(dev, "unable to enable hclk_pcie clock\n");
> -               goto err_hclk_pcie;
> -       }
> -
> -       err = clk_prepare_enable(rockchip->clk_pcie_pm);
> -       if (err) {
> -               dev_err(dev, "unable to enable clk_pcie_pm clock\n");
> -               goto err_clk_pcie_pm;
> -       }
> +       err = clk_bulk_prepare_enable(rockchip->num_clks, rockchip->clks);
> +       if (err)
> +               return dev_err_probe(dev, err, "failed to enable clocks\n");
>
>         return 0;
> -
> -err_clk_pcie_pm:
> -       clk_disable_unprepare(rockchip->hclk_pcie);
> -err_hclk_pcie:
> -       clk_disable_unprepare(rockchip->aclk_perf_pcie);
> -err_aclk_perf_pcie:
> -       clk_disable_unprepare(rockchip->aclk_pcie);
> -       return err;
>  }
>  EXPORT_SYMBOL_GPL(rockchip_pcie_enable_clocks);
>
> @@ -415,10 +367,7 @@ void rockchip_pcie_disable_clocks(void *data)
>  {
>         struct rockchip_pcie *rockchip = data;
>
> -       clk_disable_unprepare(rockchip->clk_pcie_pm);
> -       clk_disable_unprepare(rockchip->hclk_pcie);
> -       clk_disable_unprepare(rockchip->aclk_perf_pcie);
> -       clk_disable_unprepare(rockchip->aclk_pcie);
> +       clk_bulk_disable_unprepare(rockchip->num_clks, rockchip->clks);
>  }
>  EXPORT_SYMBOL_GPL(rockchip_pcie_disable_clocks);
>
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index a51b087ce878..f79c0a1cbbd0 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -11,6 +11,7 @@
>  #ifndef _PCIE_ROCKCHIP_H
>  #define _PCIE_ROCKCHIP_H
>
> +#include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
>  #include <linux/pci-ecam.h>
> @@ -321,10 +322,8 @@ struct rockchip_pcie {
>         struct  reset_control *pm_rst;
>         struct  reset_control *aclk_rst;
>         struct  reset_control *pclk_rst;
> -       struct  clk *aclk_pcie;
> -       struct  clk *aclk_perf_pcie;
> -       struct  clk *hclk_pcie;
> -       struct  clk *clk_pcie_pm;
> +       struct  clk_bulk_data *clks;
> +       int     num_clks;
>         struct  regulator *vpcie12v; /* 12V power supply */
>         struct  regulator *vpcie3v3; /* 3.3V power supply */
>         struct  regulator *vpcie1v8; /* 1.8V power supply */
> --
> 2.47.0
>

