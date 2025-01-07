Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09236E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVYVEipvd5H4q20DXz8KjWI0d541jihGaq7GP8u3Bkc=; b=k9eEzgsFYAV0ZwSpqRLsNGKf5l
	Jpi4HRjE23HmG7wc9btTBU2l4+yXM3oDN5yS3u8o14FEhFR6K2AMGTmMnfACExjKJQ5Rz9M0ZR7u7
	ctG6WDZfy/ZLPpXVL+Aj2LEQzagV3BXLDTSfxurbGUwRlFLNT2eptaMRSLoqH4bSFs37zn/JSY741
	Bw+u+/IddClwplJeP3zHottb/2W+ZHaDPZv/2S7iwuOgQ0LFcV+B2cS73pLsqXE94Vtmx9m+RcTba
	Q1sHU/ILfe0KmE8uQVB1BO4y/Nr+tcCfqlfBLpb0rmzbKPkiUORaw7YRPp+SHMVbGohBTFzrKm4KC
	E3VubsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDeU-00000005uHm-2qPC;
	Tue, 07 Jan 2025 17:46:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDOe-00000005rgF-45oD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EVYVEipvd5H4q20DXz8KjWI0d541jihGaq7GP8u3Bkc=; b=MepFbkWtfGkzFWwnw8iMfC8KPN
	jN4aHEUkXdwNwBa1HCM4LwbMqfcHPoMdU/TiIbG/kFQ41YJho1cZyrnwXmVd7b8JNa1GjRZBDJd1s
	fEZgkP2BNzTdiOIjZdaA03/y0Owmdy1LD+Ml1OUUPVQ6U8n61nekWpGwcmE/y8jwjX76PR3lV5Yzu
	sklqoWT2Z/wTVkkHC7vhTg+9wqpeMkhJy6WVAat9GtSW/hcq5Kxv8VBWf2P3MFfvx0zwShqT2heyj
	aU24jRDLJk5t2p3GqyjM6epAYk8vzLg3cS4Amywo+b8eZr5Q5UEHNA0D8vOnC0KlPY4OD4NDftTuO
	WH9OBnww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57138)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVDOa-0007w3-05;
	Tue, 07 Jan 2025 17:29:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVDOX-0005TI-2a;
	Tue, 07 Jan 2025 17:29:33 +0000
Date: Tue, 7 Jan 2025 17:29:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ma Ke <make24@iscas.ac.cn>
Cc: elder@kernel.org, sumit.garg@linaro.org, gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] [ARM] fix reference leak in locomo_init_one_child()
Message-ID: <Z31kfQiLA6pddH_a@shell.armlinux.org.uk>
References: <20250107020714.662708-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107020714.662708-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_092941_013337_40BFE547 
X-CRM114-Status: GOOD (  19.19  )
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

On Tue, Jan 07, 2025 at 10:07:14AM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> 
> device_register() includes device_add(). As comment of device_add()
> says, 'if device_add() succeeds, you should call device_del() when you
> want to get rid of it. If device_add() has not succeeded, use only
> put_device() to drop the reference count'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v3:
> - modified the patch as suggestions;
> Changes in v2:
> - modified the patch as suggestions.
> ---
>  arch/arm/common/locomo.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
> index cb6ef449b987..9e275b2105c2 100644
> --- a/arch/arm/common/locomo.c
> +++ b/arch/arm/common/locomo.c
> @@ -220,13 +220,11 @@ static int
>  locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>  {
>  	struct locomo_dev *dev;
> -	int ret;
> +	int ret = 0;

The code around "ret" becomes:

	int ret = 0;

...

        ret = device_register(&dev->dev);

Nothing between these two statements references "ret", and the present
goto is eliminated in your patch.

So, why do we need to initialise ret to zero where it is declared?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

