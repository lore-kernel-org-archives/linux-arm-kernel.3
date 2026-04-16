Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC59F433C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 04:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95h5f1j2G+teb3sQTEAwYScg31BhNT8uEHWAJ/hqs9c=; b=RYE9s5McLzfv9U9Dkgw3V3HYfu
	gYH3UHTYKzMmMSpiGkHu88EpKo80IoOfxhdCNmVHvcL23yHABBDX6po7qV+ySxKs1CWoY4wUZQH0u
	EPzM00ySxIyXYE0wnvvwGWbcuyr7OVKfJ7WDlxDc20UXBjxVa3pHcmdxZZ5tXMsN662ss+MxG/uEH
	dXTCx+0/iiMExn8ETmyyTGNVk2MAZG+3GkppPyfLzrJrjZ5OtVi8uuNovWsBxZS4+o//I9vFV2JJ3
	aHQA+CP5acTz/vh+XJRNugcqsZ3giZ/hKhlS2VPsktZCPk3Ql4yKoFj3EPDiXZRtF48mJOkaGkeGS
	5VU/I+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDEXm-00000001xrZ-0AjJ;
	Thu, 16 Apr 2026 04:41:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDEXk-00000001xrR-02vE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 04:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 435B760120;
	Thu, 16 Apr 2026 04:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66387C2BCAF;
	Thu, 16 Apr 2026 04:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776314490;
	bh=Nx3FPp307bRF+OmCf8vNAag4l0D0r7KGIDqlOm4AOTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzcjidpCjKSDvmec513yuSootriZjtm3YAi7IRphMf4UD9s9ybxcIuebVzRmpN7CN
	 zcdoRJMDXZn5TW8iAmlQS/054jjinA8ZE1kd59n1a2iJod+IIAx33jeYK27xonYGXw
	 wZIMPl1V6o8bSof9jOvHOADwOCzrPJBG56yt8edY=
Date: Thu, 16 Apr 2026 06:40:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <2026041603-guts-crested-ef76@gregkh>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
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

On Wed, Apr 15, 2026 at 07:19:06PM +0100, Mark Rutland wrote:
> Hi,
> 
> Thanks for the patch, but from a quick skim, I don't think this is the right
> fix.
> 
> Greg, I think we might want to rework the core API here; question for
> you at the end.
> 
> On Thu, Apr 16, 2026 at 01:41:59AM +0800, Guangshuo Li wrote:
> > When platform_device_register() fails in arm_acpi_register_pmu_device(),
> > the embedded struct device in pdev has already been initialized by
> > device_initialize(), but the failure path only unregisters the GSI and
> > does not drop the device reference for the current platform device:
> > 
> >   arm_acpi_register_pmu_device()
> >     -> platform_device_register(pdev)
> >        -> device_initialize(&pdev->dev)
> >        -> setup_pdev_dma_masks(pdev)
> >        -> platform_device_add(pdev)
> > 
> > This leads to a reference leak when platform_device_register() fails.
> 
> AFAICT you're saying that the reference was taken *within*
> platform_device_register(), and then platform_device_register() itself
> has failed. I think it's surprising that platform_device_register()
> doesn't clean that up itself in the case of an error.
> 
> There are *tonnes* of calls to platform_device_register() throughout the
> kernel that don't even bother to check the return value, and many that
> just pass the return onto a caller that can't possibly know to call
> platform_device_put().
> 
> Code in the same file as platform_device_register() expects it to clean up
> after itself, e.g.
> 
> | int platform_add_devices(struct platform_device **devs, int num) 
> | {
> |         int i, ret = 0; 
> | 
> |         for (i = 0; i < num; i++) {
> |                 ret = platform_device_register(devs[i]);
> |                 if (ret) {
> |                         while (--i >= 0)
> |                                 platform_device_unregister(devs[i]);
> |                         break;
> |                 }    
> |         }    
> | 
> |         return ret; 
> | }
> 
> That's been there since the initial git commit, and back then,
> platform_device_register() didn't mention that callers needed to perform
> any cleanup.
> 
> I see a comment was added to platform_device_register() in commit:
> 
>   67e532a42cf4 ("driver core: platform: document registration-failure requirement")
> 
> ... and that copied the commend added for device_register() in commit:
> 
>   5739411acbaa ("Driver core: Clarify device cleanup.")
> 
> ... but the potential brokenness is so widespread, and the behaviour is
> so surprising, that I'd argue the real but is that device_register()
> doesn't clean up in case of error. I don't think it's worth changing
> this single instance given the prevalance and churn fixing all of that
> would involve.
> 
> I think it would be far better to fix the core driver API such that when
> those functions return an error, they've already cleaned up for
> themselves.
> 
> Greg, am I missing some functional reason why we can't rework
> device_register() and friends to handle cleanup themselves? I appreciate
> that'll involve churn for some callers, but AFAICT the majority of
> callers don't have the required cleanup.

Yes, we should fix the platform core code here, this should not be
required to do everywhere as obviously we all got it wrong.

Guangshuo, can you submit a patch to do that instead and ask for all of
your other patches to not be applied as well?

thanks,

greg k-h

