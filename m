Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C80FEFB6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29xGwZx4QmtZUrfPtkG3nKCYS3+MgHmL/NsrLP4T1A8=; b=t08T2TCiBmgrlEuAGCazdvtiLf
	NjpkCuC5noxjliW0Vh1OafWhvFu0f4NsAW1A+Lq+FHTY+Rbt+CfEa1ie0V+BxyT8j4Kk6PslcfNpS
	AL6/8h43/Og4YAq01rFAChFqN0eXlYgecPtIN7piU/KjNE6NN1znWwGc40oPZ0za/TSnJJOJOt0vn
	mDD/UH7cReo9YEB0De4Yk6UMlq2XfBlC4Z9UKCuG8L85ebtCoEX9sdSU48zFA7xpdNwbPQe/80cKd
	zpIeXHJdUGxNlJ43RnV/PNvfv47k1BaXorLOKkghLVA1ToDdcd0XaU8TmqYj4Yg2um4jtA+ATFgyD
	muIFZ8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1CF-00000008lcK-2MEO;
	Fri, 27 Feb 2026 17:00:11 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1CC-00000008lbP-2VGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:00:10 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 24B99240101
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 18:00:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772211605; bh=29xGwZx4QmtZUrfPtkG3nKCYS3+MgHmL/NsrLP4T1A8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=EeRGdjkVKBshKlwZtTw5YZY8AMmj4a8Nh9NBvINJnY8Ljh1/wyfN2Yx22PTBDPU/8
	 eFfjsvkiBW50X1V7ZxVGccrgiGVv1tOkOBEQqexAWjwPT3l3B1O1LVvXgIrUk+33dZ
	 RaoyaPxN9dMHn4/y3rfV1Vr5O6r/6JEsYzFZgWeNgwDwrHgcVooZZNSqiW4ifzWlXM
	 v3dzXwPR8P2uVAGNcCNK5/ZIKfoN4pjauxq77IH+TIFKb9162Ga+bSvfA1P7hF23/X
	 fTVzX9qUaY+Ww6L4QauydYfl4Grm6y66gooeuBq8CeV6b0omEPfzt2aJUG1oNE4IO5
	 +hEqO8yvDAjqQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fMvhK3Zmfz9rxN;
	Fri, 27 Feb 2026 18:00:01 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,  Lorenzo Pieralisi
 <lpieralisi@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Rob Herring <robh@kernel.org>,
  Bjorn Helgaas <bhelgaas@google.com>,  Heiko Stuebner <heiko@sntech.de>,
  Dragan Simic <dsimic@manjaro.org>,  linux-rockchip@lists.infradead.org,
  linux-pci@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] PCI: rockchip-ep: do not attempt 5.0 GT/s
 retraining
In-Reply-To: <c51c804bea56d772a59fd29fcb080541b7a367d2.1772169998.git.geraldogabriel@gmail.com>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
	<c51c804bea56d772a59fd29fcb080541b7a367d2.1772169998.git.geraldogabriel@gmail.com>
Date: Fri, 27 Feb 2026 17:00:03 +0000
Message-ID: <87zf4ujf5b.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_090008_926645_26F6BAD4 
X-CRM114-Status: GOOD (  21.17  )
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

Geraldo Nascimento <geraldogabriel@gmail.com> writes:

> Drop the 5.0 GT/s Link Speed retraining code block from Rockchip PCIe
> header definitions. The reason is that Shawn Lin from Rockchip has
> reiterated that there may be danger of "catastrophic failure" in
> using their PCIe with 5.0 GT/s speeds.

Patch body says "header definitions" but the change is to the drivers'
source. Maybe you need to reword in a way that is clear as to what
happened?

Cheers!

>
> While Rockchip has done so informally without issuing a proper
> errata, and the particulars are thus unknown, this may cause data
> loss or worse.
>
> This change is corroborated by RK3399 official datasheet [1], which
> states maximum link speed for this platform is 2.5 GT/s.
>
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
>
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip-ep.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
> index 799461335762..9ebc227a1ef8 100644
> --- a/drivers/pci/controller/pcie-rockchip-ep.c
> +++ b/drivers/pci/controller/pcie-rockchip-ep.c
> @@ -553,19 +553,6 @@ static void rockchip_pcie_ep_link_training(struct work_struct *work)
>  	if (ret)
>  		goto again;
>  
> -	/*
> -	 * Check the current speed: if gen2 speed was requested and we are not
> -	 * at gen2 speed yet, retrain again for gen2.
> -	 */
> -	val = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
> -	if (!PCIE_LINK_IS_GEN2(val) && rockchip->link_gen == 2) {
> -		/* Enable retrain for gen2 */
> -		rockchip_pcie_ep_retrain_link(rockchip);
> -		readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
> -				   val, PCIE_LINK_IS_GEN2(val), 50,
> -				   LINK_TRAIN_TIMEOUT);
> -	}
> -
>  	/* Check again that the link is up */
>  	if (!rockchip_pcie_ep_link_up(rockchip))
>  		goto again;

