Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3178010ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=; b=Cwn85FTsXzVkCrCTOfzEFM6R7F
	7Yqm/5vLUBCqHSxQnMq6QOrm/WQLMbMVSnjAP1FUHXDIX+lGZsw+Xn3EIXhx9Tv+Jt159q1fVqzuT
	dCO3EDgAmRN2tsHFVoAh9aUFf84EnR7yuH8g5os5obFn+OCRnMlXliToC2hYuOckpTMFFzardIBYj
	XI0QUF6cIkj55NJ1//N4LBSPJ/6dh+n3cMh6dAuGIJhFabtfUEZqFkr8jxprQxOHaOw5HLs4gufrq
	I1M4+VWCwlfkSWW5La74JcuouT/3AmBp+ddrli1r6pI/HJUBsUA3JFujupyWUQf4Pm0N2ikrqfOpg
	3lt4+mMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67nx-00000007YVE-0iJN;
	Fri, 27 Mar 2026 14:04:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67nu-00000007YSw-3lWf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 14:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=; b=o747e1jU02T13LHV/l2k6B5ogx
	XbxpBxFbNkWm3f1fMtpp/lO2lpUZkFjSjE3SN3CrtKZm65kzxw61hZhS1UhvGFX7Fh9SGoBzoc/yz
	7FcSrbPUbgk2jjnmTavlP6PfB4pnWUvCccsuvJ8AKT3QXSdJ1V163hvHlnLyTXI/rBgw8KIL6aKph
	ARonPoNSGqjpKiM5htJxTEYN85GT1Tpv1H07/xe7a/mzpt2dlK2IQxThldrKx09HTVQyRgOtMbC3e
	HBmPQcBFGmgon98iupl5eegK/NynFXwvvG4CXcjLmOafxtWIsYqNABn31KxdAFrZMrcnKOoUMQgTA
	QYqjdDjA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67nq-0000000AZ3K-11VG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:04:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so24776195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774620283; x=1775225083; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=;
        b=SnddVSAthzKBcRP4sfbiS8NjWtyZeZ+sdZpkjBj4Y+9tcaFnZiNlcONmGu0l70WzNp
         MIkRcJE3QIcSs25VveyCJT9SMmthsmpWcWfJvQXY3PpujEwp6pH6F1F0VFCD5DNR3o5q
         CdRLPT2sSiYAUZjjCEZzu0EeP8q3UHeTh0f2pYXavIvYNDlxbwytoVded/5HrwqkVv7z
         gRJM8rWvmXgIlKwrbj6+kyrcoIHBI9kcwyXs0X1r9dq40eWvo/1USafycEcrM3goi6Su
         A12hczV1GfFzySAJ19aSyvI9vJ30NYYj8b/e0Z2f58S6dBKDwd8x0brvHrVtDQ0AiOyk
         bNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620283; x=1775225083;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=;
        b=Mrl3CUTWecAswt4TqR0NTBlQjiNB7nUYemfppeg7oUcjImve5mNrQqsE0Nf85UrwLZ
         5dtU2z4fuDdbXnJWkXs6wZlgOIvNLMijtNUCPRbRYmJSY1L41hJF9Z71U2mFe7ayQQ7U
         owYDR4lPiQIumbFY01ZYtiUIZqg75DxX7tQtYr52s8i4sluZ3+3G7OFlifBitQ9N0STv
         fauy3NJOKysn13lzgY2i9YLmboAIpSsUOagNE719HVEOstlHiQv0TJzSjFJOLfgP2OWa
         wPlzJ7TG1RrGLCGkf97m6KCfXfkdvR5YOEb72dMRtjvks27zcNryDhIBChg4FL7ElXvC
         xf2A==
X-Forwarded-Encrypted: i=1; AJvYcCVpKKUQoZgSoWVypJRmyQ68F1am3OVpvxRtXf7a3do4cilrfOz/tu7VrJF/jNF0yR7MWG+3sHDcpPhusIwvMuME@lists.infradead.org
X-Gm-Message-State: AOJu0YwfT9K8hlUCEmNsZf90b6EKsW3jOBFqespSrtY4aKzhs9yB9FXM
	OqUw0S4hytAPqIiUnxHEqsVNDE0bWhv2ZgfngNJ/IQIpJivZWokbcL5w7EgxrGsWkqY=
X-Gm-Gg: ATEYQzzyoojZxJzSlV6tS5mYZSlVnBazLY3NznqkFMJJv7IdtrMBiP+r4vHe/4uHkWU
	Isn6Oh/34hFAtIr/NMVkmAUWkl/sswG8JMBdikKP3+vayxmnqyleDr83/U2w47o7JlL2cCWTuyi
	30yoQsJEAm3y8w12Qlde9NdDvgHgtUuhYYmrut+VO8jJ2zCzDWgOwOvljA1150GKp2kYrbemEXe
	lVnt7GYRcKzPBUJYZ01Lvcb721TtPY/R+6S7ufBUjgjVmnyULMnjtw/UDt8TH8GlYvMbBCUs9vJ
	f+uQ3fx3pDi0yuNJvcwHnIo/xK82uxqZHGJRbCYomahfs8hJxiHFrVTb/mLG9nwYqmV015FjufL
	BoxwNHkZQ5tiCj4pOEyW38pWS505asPrWmPweZ7UCAqWFG1NGFWslzpdqAWW93lbmxy/TJwiuUI
	YhZR5JMBG5E9pyVgLO9w3+JDqXqGfOUovVWLbBCJE9EypbWg8q0R3zdGPaohnMaiTTezp/1Hdlq
	2P7yB+3y/21O6LLV/xlR64=
X-Received: by 2002:a05:600c:3f16:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-48727c86862mr44979375e9.0.1774620283136;
        Fri, 27 Mar 2026 07:04:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725eb5417sm27114795e9.3.2026.03.27.07.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 07:04:42 -0700 (PDT)
Message-ID: <7d9675e6-3f02-49e8-b65a-9785d5b6a7c7@linaro.org>
Date: Fri, 27 Mar 2026 15:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Chuanhua Lei <lchuanhua@maxlinear.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_140446_623126_15B839DB 
X-CRM114-Status: GOOD (  17.99  )
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

Le 05/03/2026 à 07:20, Sumit Kumar a écrit :
> This series adds support for multi-port PCIe controllers in the DesignWare
> driver. Currently, the driver only supports a single Root Port with
> controller-level properties, which doesn't work for multi-port controllers
> where each port may have different configurations.
> 
> This series introduces a per-port structure and parsing API that allows
> each Root Port to be configured independently via pcie@N child nodes in
> device tree, while maintaining backward compatibility with existing
> single-port bindings.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix error code preservation in dw_pcie_resume_noirq() to return actual
>    error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
> - Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
> - dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
>    failures fatal for now, add TODO comment about making properties
>    optional later (Mani).
> - Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com
> 
> ---
> Sumit Kumar (2):
>        PCI: API changes for multi-port controller support
>        PCI: dwc: Add multi-port controller support
> 
>   drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
>   drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
>   drivers/pci/controller/dwc/pci-meson.c            |   1 -
>   drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
>   drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
>   drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
>   drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
>   drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
>   drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
>   drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
>   drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
>   drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
>   drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
>   drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
>   drivers/pci/of.c                                  |   6 +-
>   drivers/pci/pci.h                                 |   2 +
>   16 files changed, 232 insertions(+), 74 deletions(-)
> ---
> base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
> change-id: 20251010-dt-parser-98b50ce18fc1
> 
> Best regards,

Tested on meson-pci (boot log https://gitlab.com/amlogic-foss/abcd-linux-test/-/jobs/13677061036)

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # On Bananapi M2S

Thanks,
Neil

