Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC852CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHPzR+PJFlcUCv58piztRDW0kLQQov2FzIW6HEbbNFQ=; b=kVo8vQPcdNOYJdQKYsQTuAnA+o
	oSBCCpKO3ohcoFDTgWOx5gtwAT9orQp9yXiEEORL0GzFAFuFtJ4/4LTKQBfYkKAnvfPwGbeHPn2X0
	ThpFab3NOEET9USoeBfHqrI4I92iT0ZMRTISLfR9ndZ/qGotSOHJXYOhx/4nk90z7X8+HIQ4iSeKM
	f8vIFMTDpnRDosyS3gN5pda0bLLLwO6pLokEG0FQ762iuG0nC0+KYabHwpG0mkhOjniuRJXuMvhfV
	lE/a5aTXJxtrpQW4Q58G0aA9mWsLN1W8o2qkvQhRO3pu80UzE26yWefqiIbbm6zF6KkuvSRORu2Px
	iBE4Dt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfye-00000003maE-0CeO;
	Fri, 19 Sep 2025 18:37:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfyb-00000003mZl-3RZq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D5C343430;
	Fri, 19 Sep 2025 18:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C754C4CEF0;
	Fri, 19 Sep 2025 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758307017;
	bh=iywf2XUVkfJv534hhdlLGZ+yOgrjcyl7VuGSUy57e6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O31sX8wvF3L2SvcQVdppWH4aPVQzPgdarm4vEk41OAEIzdHn6RmmcE3wbWUk9Hyf1
	 fXeLwvZOpTQnkfqzyqEFWzTpB5U8X4e4LvpqgGaPPQd6+C3Hk0fJjFV6PCd+eL/lx1
	 Ot9GM/Tss29As8mZV9yBUb8QYQq+L1GiY8x9SAp/QZ+zhY0vDu5X3DYhVAx1bWMryN
	 0sikJaHrGsTd19B0xAoXKjZbtXWBI1Vk7o7YATfJbrLOqkriaIqTa29JWc5cxc/Ptg
	 89+TTti8LA/7vpEsStmmrO8VLyu0D9brkgF+wQd5DH2T2Yg04pQV4TDSrvp4t+xYJG
	 hPw9FU7GiVdmw==
Date: Sat, 20 Sep 2025 00:06:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	qiang.yu@oss.qualcomm.com, mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, inochiama@gmail.com, 
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com, 
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 09/10] PCI: keystone: Exit ks_pcie_probe() for the
 default switch-case of "mode"
Message-ID: <lo2zv3nxek57s3h4hwv2ujzophdx2ubfuam4gqmo5h77t2g4jo@447qpc7a4ub3>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-10-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912122356.3326888-10-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_113657_878381_0D1A424A 
X-CRM114-Status: GOOD (  23.97  )
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

On Fri, Sep 12, 2025 at 05:46:20PM +0530, Siddharth Vadapalli wrote:
> In ks_pcie_probe(), the switch-case for the "mode" is used to configure
> the PCIe Controller for either Root-Complex or Endpoint mode of operation.
> Prior to the switch-case statement for "mode" an invalid mode will result
> in probe failure only if "dw_pcie_ver_is_ge(pci, 480A)" is true, which
> is the case for the AM654 platform. On the other hand, when that is not
> the case, "ks_pcie_set_mode()" will be invoked, which does not validate
> the mode. As a result, it is possible for the switch-case statement for
> "mode" to receive an invalid mode. Currently, an error message is displayed
> in the "default" case where "mode" is neither "DW_PCIE_RC_TYPE" nor
> "DW_PCIE_EP_TYPE", but the probe succeeds. However, since the configuration
> required for Root-Complex and Endpoint mode have not been performed, the
> Controller is not operational.
> 
> Fix this by exiting "ks_pcie_probe()" with the return value of "-EINVAL"
> in addition to displaying the existing error message.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Fixes tag? And probably CC stable since the controller seems to be not
operations without this fix.

- Mani

> ---
> 
> v1: https://lore.kernel.org/r/20250903124505.365913-11-s-vadapalli@ti.com/
> No changes since v1.
> 
>  drivers/pci/controller/dwc/pci-keystone.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 2da9feaaf9ee..e85942b4f6be 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1414,6 +1414,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", mode);
> +		ret = -EINVAL;
> +		goto err_get_sync;
>  	}
>  
>  	ks_pcie_enable_error_irq(ks_pcie);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

