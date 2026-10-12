Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11D3CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egAWEG+bcu6VYNzUqXMRIjdS7+btc7+MbL6C2aV6SSA=; b=l365zNrH0aNyMdzWpxJLqIsdj5
	Hsy5aVnqKEx/uzaofagIJT72dl4ZRH948VVHtqrvM/7vPGFMPxr82x4+XwBXZEwNJGHWuAMisZaQD
	GMf9aC4ntblAFmojJDAKM/jSi5nUV9GV8FUCAD7vzAmlulyfZLV8zG9mF4/UUaRfy19Ll3BZefvvH
	68XdNVBrTTtxIZdUXBSJck6vcCQTqZxX6olB9tY1TmFWxRLJdQ9JxO5zLlSNNWg6MLFy56a1bq/fV
	QepJC7cfPEw/7/SpLMBhhmlZRMI85TpD8lx+lYrZHm+cNOeY93Nm24kMuD8Iwppq91PGmeOOCemH3
	hXiZaQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIbr-0000000AvM3-1S8z;
	Mon, 12 Oct 2026 16:10:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIbp-0000000AvLp-3BZQ;
	Mon, 12 Oct 2026 16:10:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84423433FB;
	Mon, 12 Oct 2026 16:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDD11F0089B;
	Mon, 12 Oct 2026 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821441;
	bh=egAWEG+bcu6VYNzUqXMRIjdS7+btc7+MbL6C2aV6SSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mtVRV9EUFgxksJVwh0JMvqSXLlXVHyRMWLkDBXVhdfreiTfFMTdb0e2X87Td9gEZj
	 mwWc17HusNhEKQnUQ2C65paV7NO2Srk51v1zUs8zJBU89805gWgfKE3dH/Gh49djUf
	 LXY2lOlhVlAJrjkMoagIa/E/J/1EOxd1WZLQJfr8QimQAGATBsOH6A6aLn5uqZTRQe
	 qgFlEJxcHrMyCL66BLZb4g0NY5nBy9X1p7AMZma06E6cuGCnggOo+3Aa0xaTQbZuxR
	 XciZyo7h0rvm0Fi/bnEzEVNiMCEqvFn71TcdTcjmSnNG0NyCJljILaOb1Cx9A+qf9w
	 VkxoHG0hWDJXA==
Date: Mon, 12 Oct 2026 21:40:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: hpchen0nvt@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, 
	schung@nuvoton.com, vkoul@kernel.org, ychuang3@nuvoton.com, stable@vger.kernel.org
Subject: Re: [PATCH] phy: nuvoton: Fix clock reference leak in
 ma35_usb_phy_probe()
Message-ID: <as0GcwfgjRsI1O8N@debian>
References: <20260917134353.2153788-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917134353.2153788-1-vulab@iscas.ac.cn>
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

On Thu, Sep 17, 2026 at 01:43:53PM +0000, Wentao Liang wrote:
> ma35_usb_phy_probe() obtains the USB PHY clock with of_clk_get(), but
> returns without calling clk_put() when devm_phy_create() or
> devm_of_phy_provider_register() fails, leaking the reference.  The
> clock is only meant to be kept on the success path, where it is stored
> in p_phy->clk and used by the PHY operations.
> 
> Drop the reference on those two error paths.
> 
> Fixes: b48baf69db97 ("phy: nuvoton: add new driver for the Nuvoton MA35 SoC USB 2.0 PHY")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

