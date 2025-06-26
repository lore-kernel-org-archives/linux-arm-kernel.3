Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E1AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sXg7exD96U61m7u/1hCYmCTverlSKuuUujYmb505pE=; b=zGDVvQqjbQ9N//LDomaGtPG5dn
	ydk2K8dJr35KzU69CsYD89OI1MAKoEePGWJjNjKU8jTncKovsmv1hgfeOZcm9rdU6IpHGVkfVKPkr
	UAwisvcD98AOXhOpkhdnmYCGih5Nd8eSbv5i+tAcOULL+zuFzscbqPaQQONbEMttfMR+mOzM3Tgw9
	W4XhVKG+dA9mfoDL/8qp12+oyoNOr7kfwH67Oc4OkKZm+RVv9pwxTK+VrXNaK7XXR/6Tq3cfU0co6
	96FZRsuTL789c6+yr9h+TmUaxBMOKuG5BXM6t4b+WkIJ48wfEk9QoeKPnasw+GCqVRw3j2nWAYOHX
	9rIBKIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwlD-0000000DBSf-0ArX;
	Fri, 27 Jun 2025 00:16:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvO6-0000000Cyrg-2X29
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 106646000A;
	Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DACEC4CEEF;
	Thu, 26 Jun 2025 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750978089;
	bh=fCvhvhbFhOlfeOSp3pz3JSwPF/zNpq8GnnnbKYprUD0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p8ro6kuHVP4rjmVN4MF+SX3pruihvHxk7qjD4XJHiiggv6p482O/uBd3JSRvtfTWx
	 5oFtEgl9QnCM+fCcxIJgeVuQcMNF0Etva2SaPsL51fGw9dGqI8ueYPuuI4j+DUOVQD
	 Plx45huqWvqeo2rp1+runItb0a5oUJFRk7pUTCufsNkIriFZ3pYpz2vgpO/uaRtIu4
	 qrKW4LlNTM0xlldnf74et4wYXoIZYWBU+Xv+5Am5+B0CDG6HhtmOlXlHUZ5Y+l2CSe
	 xoeOabeVqwCJ1ROiSvuE87brMa+aG24IYJ2oElOJ7UPEQI/5CggGyXp/qHoqI/yKLl
	 0KNSAmkOvAhQw==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250624-stm32_dma_dbm_fix-v1-1-337c40d6c93e@foss.st.com>
References: <20250624-stm32_dma_dbm_fix-v1-1-337c40d6c93e@foss.st.com>
Subject: Re: [PATCH RESEND] dmaengine: stm32-dma: configure next sg only if
 there are more than 2 sgs
Message-Id: <175097808959.79884.12989914478900786264.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:48:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 24 Jun 2025 09:31:37 +0200, Amelie Delaunay wrote:
> DMA operates in Double Buffer Mode (DBM) when the transfer is cyclic and
> there are at least two periods.
> When DBM is enabled, the DMA toggles between two memory targets (SxM0AR and
> SxM1AR), indicated by the SxSCR.CT bit (Current Target).
> There is no need to update the next memory address if two periods are
> configured, as SxM0AR and SxM1AR are already properly set up before the
> transfer begins in the stm32_dma_start_transfer() function.
> This avoids unnecessary updates to SxM0AR/SxM1AR, thereby preventing
> potential Transfer Errors. Specifically, when the channel is enabled,
> SxM0AR and SxM1AR can only be written if SxSCR.CT=1 and SxSCR.CT=0,
> respectively. Otherwise, a Transfer Error interrupt is triggered, and the
> stream is automatically disabled.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-dma: configure next sg only if there are more than 2 sgs
      commit: e19bdbaa31082b43dab1d936e20efcebc30aa73d

Best regards,
-- 
~Vinod



