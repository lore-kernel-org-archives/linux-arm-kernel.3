Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CB7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=; b=zsplWel+CczL6d0hg8yr9JNzac
	6VENxPrdG7RkESqz4ETLslFe9ByVrnZWAtcUDrEt0YaKuQZeS9o09iV1ziUM8AxtBD+TRhyLzy5lp
	iZNkNJcXdoqaQT83iMnkjCGGPpi2/6gzmV34gos/J9kUqPf6gZkxKeihkRKvt/FLEwfkuE/NqK3FI
	j4UxFjeSC9PvvEkmy1aTCu8ZAEVvzwMNM9TSULo/eUKqBbGMu/RAjCRAru5zh0xF6DDceX8gCdQh2
	RBgXXsHXXR5+Nlnw4z+fJnPSyRsBnr8u1f4kZYUxyWKT9L7TQ/bSMhm6owEE/K9NG2IAFAjo+365e
	UvOfLcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrb9-00000005FXK-08B5;
	Wed, 02 Apr 2025 06:29:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzrZN-00000005FIa-087w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 06:27:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-225477548e1so114166935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743575244; x=1744180044; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=;
        b=V6LpIfFJEy8Xeba4aoN0qMnc0HEBV8lny5LZS2mLSTUkaPFzVJYr89w+4ZcvRLe3+B
         v/Fs+EJWN8rmdbhLuvYJN8PX+QECPDgh91nvVZYjNhm6LGLxp7rEb5m2Gxx71VEh9RiL
         Y7etAmmutmnDa9j3mhu3TlNhVzrbNsyM5ZBIL9fP01L4lv4Afr9y19IhehLr6l5USkxu
         nI4JrH6IQd+2GoMjwokQHK1crTNbLm+v1lsDr7Bad9E/uT4LZ73EkEPG9PwIwQ9RxlxL
         nVuSrVOKSJkEmh+fQz9zQ0bMO8k2Ikn3grd8qNJHRF28FI1EK1PhcoNVD1ypIRFHJKTB
         XnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575244; x=1744180044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=;
        b=BTp7pg2fAR3rr1Vwzwz0dygrl76WAqZ2gJYFvVVWKJur0LbDYphvnedb7pQ/J5qTAU
         cUQDQhFhD2OoR67QxshgXHuwHsfSbcLPywaaHjJVNWSDC6TqoD1kA3DFkdIgXSgzDAOv
         JDxxrXA7po52nZsLQN6VmietXFhkPPcHMrI7PRuIVmscktCMQAw++BjR4AXqVEIUiMdU
         ZwoiG22YhA3c4DvoSdzFoC3KNuNA/Dnh36kU6+ss8FhHOa7ZVOs79UaaONt9/r/NJcM4
         FHAjEXx9sypgooE8sB4rH9VsDXEQA/CYPIaUNE5NDNBHdxtYumzCeqDdFE5dbUgjLWQS
         QCwg==
X-Forwarded-Encrypted: i=1; AJvYcCXAERK1t5sbk62RprC+/wxFclk8cXLK74YPHsL1w2W44HPeVn6UrjxoifHD3dOVz93Z7V/EuldZkXEg1Rji4Hli@lists.infradead.org
X-Gm-Message-State: AOJu0YzL7cWdiXyuOfA5BfwkOk812+XL21CQuibG3N42rfUadB6BdUOk
	HspXxJ4Nd7AeEg6H6pihpQ4V9aHLCg9R7GQBjBa3YWslhrdx8phvuNGOE9T+TA==
X-Gm-Gg: ASbGncvxHfEVvD6pUzi5F8xFm4b1NlSK5Tr9uJ8J/SquP95G0pvuE1sHPvpP/6FKDlK
	Kii/DcTG6OJx0lpTfbl+IXi9K5lnkfZoUjpzM+LSt3TyDrsZbQRu5WeSmGKK8O1tslEK20doYZs
	C7XQi9K3cclh9jqsXE1fNCp3XhZaHHGTVX1OB8dVu8Z6fdnp8YRgwotrZGDAjIOQAkLUHjrPtPZ
	DxlACHJ8fqp8bN53JeTRq9nemVhiYGuqCZKBUW22UH+8AkRfgW6A8YUe0qv94LkqCpvJKa3vttY
	JJUh3cGfsGE42JTreU3h4zngn7vZuJ1+1QVm/eKBbigFn+9b0V1e3nkb
X-Google-Smtp-Source: AGHT+IEftqywmuVKm2jxf0hoVI8+XFFEcICMDydA0YNIWpJc2sWztLxMbLmbc7T+583swHeEhH9wPw==
X-Received: by 2002:a17:903:11c7:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-2292f9622b5mr229392235ad.21.1743575243714;
        Tue, 01 Apr 2025 23:27:23 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1b3fsm99908325ad.74.2025.04.01.23.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:27:23 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:57:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] PCI: imx6: Start link directly when workaround is
 not required
Message-ID: <kskqytb67s6qpt2jfn6sry4oj3zq46y5hizyzxxvehtjtqtj6r@qmtfepjzjrpk>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_232725_080379_F263A7DD 
X-CRM114-Status: GOOD (  24.83  )
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

On Fri, Mar 28, 2025 at 11:02:08AM +0800, Richard Zhu wrote:
> The current link setup procedure is one workaround to detect the device
> behind PCIe switches on some i.MX6 platforms.
> 
> To describe more accurately, change the flag name from
> IMX_PCIE_FLAG_IMX_SPEED_CHANGE to IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND.
> 
> Start PCIe link directly when this flag is not set on i.MX7 or later
> platforms to simple and speed up link training.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One observation below (not related to this change).

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 34 +++++++++++----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c1f7904e3600..57aa777231ae 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -91,7 +91,7 @@ enum imx_pcie_variants {
>  };
>  
>  #define IMX_PCIE_FLAG_IMX_PHY			BIT(0)
> -#define IMX_PCIE_FLAG_IMX_SPEED_CHANGE		BIT(1)
> +#define IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND	BIT(1)
>  #define IMX_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
>  #define IMX_PCIE_FLAG_HAS_PHYDRV		BIT(3)
>  #define IMX_PCIE_FLAG_HAS_APP_RESET		BIT(4)
> @@ -860,6 +860,12 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	u32 tmp;
>  	int ret;
>  
> +	if (!(imx_pcie->drvdata->flags &
> +	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
> +		imx_pcie_ltssm_enable(dev);
> +		return 0;

While looking into the code, I realized that we could skip waiting for link
during the workaround in atleast one instance:

```
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5f267dd261b5..9dbfbd9de2da 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -875,11 +875,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
        /* Start LTSSM. */
        imx_pcie_ltssm_enable(dev);
 
-       ret = dw_pcie_wait_for_link(pci);
-       if (ret)
-               goto err_reset_phy;
-
        if (pci->max_link_speed > 1) {
+               ret = dw_pcie_wait_for_link(pci);
+               if (ret)
+                       goto err_reset_phy;
+
                /* Allow faster modes after the link is up */
                dw_pcie_dbi_ro_wr_en(pci);
                tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
@@ -913,17 +913,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
                                goto err_reset_phy;
                        }
                }
-
-               /* Make sure link training is finished as well! */
-               ret = dw_pcie_wait_for_link(pci);
-               if (ret)
-                       goto err_reset_phy;
        } else {
                dev_info(dev, "Link: Only Gen1 is enabled\n");
        }
 
-       tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
-       dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
        return 0;
 
 err_reset_phy:
```

dw_pcie_wait_for_link() in DWC core should serve the purpose.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

