Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D05BC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPoOuYGWx7K1GomsVw6CFTdH68LEamv+uBoPeqNG5/I=; b=aUUEZIaZQ7SvqU27vfniAV2lPI
	gV+b6eSUu1La0GnigBuw3dMtPmFTEZinDpUwFwX24c8C50l/7Z8lWoivMEcS2SXLdOg6Yhus1F8tJ
	LVdyFPw5okqyxDsgUvb4YYCHHfX8VfF5N2eCd4GNkgDcNFPOjIty4PWxtQSS6RA9fCXnfHqRr9rlt
	hiKnfLOH+A+4AmIrXRVM41OiX69M1RT0XMrCkN7v3zH9Z7vwhq3YAK9z5xyHbi7PX4cU8vXy1QlgO
	iYBOlzvGyGJF5pS/4RbqDv9sALl3xvVkODAfoNM8lmAXc51Bj5GX3zM5e0cheFIIvar+e7q3mFt+2
	eZLJIDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Ln-0000000AVGn-32AR;
	Thu, 17 Sep 2026 02:59:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Lm-0000000AVGc-2SPV;
	Thu, 17 Sep 2026 02:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EBC641907;
	Thu, 17 Sep 2026 02:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7741F000FF;
	Thu, 17 Sep 2026 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789613989;
	bh=jPoOuYGWx7K1GomsVw6CFTdH68LEamv+uBoPeqNG5/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mXSonEq3aVapyCr+gGzljf7u/nC+qfmEK0hGhZyn9HNu8o5WiWQzHvYb1Xy8ogJFN
	 X7KJcSsgjsNliViqPKyrGciWep5qPFn8rTWwzs21sbpIHkTF7eAcQGIVCrVC9VyjTJ
	 Jf8ajb/Vg6Q/cGh/LdotaW6UeJ3jjq+RpXC09uMJoQsldLkJYW2fWjqeKw0X0fuNGX
	 mbcuKs8/NlPVLnoYY7ElNiUbT7xsniimRjFduooFtN5ITYW75R4ZPX8lWN1QhytatL
	 mTk+09OnJ+p1MgeDC3f7lWOqs22QlvWN2AaktgnO5eMmczVcPjAT/qS9ASJEFi+57i
	 jGZWJcpwMUlew==
Date: Wed, 16 Sep 2026 19:59:48 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 6/6] usb: cdns3: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <aqtXpPBsR-KQBOIP@hu-petche-lv.qualcomm.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-7-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-7-joshua.crofts1@gmail.com>
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

On 26-09-15 09:02:23, Joshua Crofts wrote:
> cdns3_plat_remove() calls pm_runtime_disable() on device teardown, but
> doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Not a resource leak.

> 
> Add the missing pm_runtime_dont_use_autosuspend() call.
> 
> Found using Coccinelle.
> 
> Fixes: f738957277ba ("usb: cdns3: Split core.c into cdns3-plat and core.c file")
> Cc: <stable@vger.kernel.org>

Not a big issue, it is not necessary to backport.

Peter

> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/usb/cdns3/cdns3-plat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
> index e3f32c3e9535..b85d5d1c48fd 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c
> @@ -219,6 +219,7 @@ static void cdns3_plat_remove(struct platform_device *pdev)
>  	if (!(cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW)))
>  		pm_runtime_allow(dev);
>  
> +	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
>  	cdns_remove(cdns);
> -- 
> 2.47.3
> 

-- 

Thanks,
Peter Chen

