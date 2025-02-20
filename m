Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499A5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnINxmCtGqEdX8HnW+sZ9JU8eei8c7pxZRZ9qAGcAcU=; b=uNDYtpfAsQzIQ7mNM/n9gDgG77
	1cq/nRIc0vSeDLqGfcL2goR33cc2k26uN189MhXgbzXh76+wWnDnUSkVz8iqf3qJWUezvEqHxmyDN
	6fC4ftlsHyP3V/0uxuI5iCYU7+MPpB5Gy4sDn9Ovn/LwrrTZpGBSgY0QACjLSh7B8LST9XQc1Tf/x
	2+7RJeb26vwudpfDzslVt44dIETSj59vSWKnBikKZKxmFydAWMpy8HcBU5FM1IV71OeOsASHQ/0cX
	3v2+SYYa/HBsCSaDuT3+e+wbLCx65LGwke2tpdH8qh5PiECUXAleoKP72DiUoTVPlIB/7wgwdW416
	bt6JzJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvVb-0000000G9kp-3SGM;
	Thu, 20 Feb 2025 01:37:48 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvGd-0000000G5Mw-1QC5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740014534; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=dnINxmCtGqEdX8HnW+sZ9JU8eei8c7pxZRZ9qAGcAcU=;
	b=PX/eav6X/W5u2SONg46h9ezHxVlyYT/m0Hc200LnZD5sWVakXtgAY7O89Tx1sX5mied1lmJSN+ps+nh03tZm9ki6zu2jiTfVT7ufPwr9t1JUcjG1MPHXEKAkcYclk+JDOMESe9DwX1EaUH/XP+vlQZZj2ZLFzaPWXXxUQKN8cjQ=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WPqf0Tf_1740014531 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Feb 2025 09:22:11 +0800
Date: Thu, 20 Feb 2025 09:22:10 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jie.li.linux@linux.alibaba.com, renyu.zj@linux.alibaba.com
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
Message-ID: <har3enfw6i4nidve42gz6ser5esghn4jalvjhi5sajav2mcuyn@fjw53tb57h3n>
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
 <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
 <hfip42i45jkumuvgdthxm2bk6qylqyqh6erzaq43yiqygvn6uu@dcui675lwtkm>
 <73af368a-52a9-4922-876b-7a6e2d32a94e@arm.com>
 <gfgtxwe3fmh4unleypyrp2qxchrqcz7wqzyoy7om2zjqev6ggf@gnnqnmusecc3>
 <a94c0622-ae31-46f1-b51e-a344b86aa47c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a94c0622-ae31-46f1-b51e-a344b86aa47c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_172220_050642_BCD63454 
X-CRM114-Status: GOOD (  47.08  )
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

On Wed, Feb 19, 2025 at 01:16:13PM +0800, Robin Murphy wrote:
> On 2025-02-19 1:50 am, YinFengwei wrote:
> > Add Jing Zhang as we will continue discussion in this thread.
> > 
> > On Tue, Feb 18, 2025 at 12:31:10PM +0800, Robin Murphy wrote:
> > > On 2025-02-18 10:58 am, YinFengwei wrote:
> > > > On Tue, Feb 18, 2025 at 10:31:42AM +0800, Robin Murphy wrote:
> > > > > On 2025-02-18 1:21 am, Yin Fengwei wrote:
> > > > > > Currently, arm-cmn PMU driver assumes ACPI claim resource
> > > > > > for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
> > > > > > failed because of resource claim failes when ioremap() is
> > > > > > called:
> > > > > > [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
> > > > > > [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
> > > > > > [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
> > > > > > [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
> > > > > > 
> > > > > > Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
> > > > > > work in ACPI env.
> > > > > 
> > > > > No, the CMN-600 routine is a special case for CMN-600 having two nested
> > > > > memory resources of its own. CMN-700 and everything else only have one
> > > > > memory resource, so that is not appropriate. What else is claiming the
> > > > > region to cause a conflict?
> > > > Sorry. Forgot the link for the new proposed fix:
> > > > https://lore.kernel.org/all/Z7QYlUP6nfBNMXsv@U-V2QX163P-2032.local/
> > > 
> > > Yes, I saw that. It's a broken diff that won't even compile, with no
> > > explanation of what it's supposed to be trying to achieve or why. I'm not
> > > sure what you're asking me to comment on.
> > My bad. I will attatch the full patch at the end of this mail.
> > 
> > > 
> > > > My understanding is that there are two problems here:
> > > > 1. ACPI claim the memory range and that's why we see this -EBUSY error
> > > >      with correct code path for CMN700 + ACPI table.
> > > 
> > > No, it's fine to claim the exact *same* range that the ACPI companion owns;
> > > the identical requests just nest inside each other. I don't have a CMN-700
> > > to hand but here's a selection of other drivers doing just that from
> > > /proc/iomem on my system:
> > > 
> > > 12600000-12600fff : ARMH0011:00
> > >    12600000-12600fff : ARMH0011:00 ARMH0011:00
> > > 12610000-12610fff : ARMH0011:01
> > >    12610000-12610fff : ARMH0011:01 ARMH0011:01
> > > 126b0000-126b0fff : APMC0D0F:00
> > >    126b0000-126b0fff : APMC0D0F:00 APMC0D0F:00
> > > 126f0000-126f0fff : APMC0D81:00
> > >    126f0000-126f0fff : APMC0D81:00 APMC0D81:00
> > I believe this works only for parents/children resource node. Otherwise,
> > there will be conflict.
> 
> I don't understand what you mean by that. The point here is that these
> are simple devices with a single memory resource (just like CMN-700),
> where in each case, a driver using devm_{platform_}ioremap_resource()
> (just like arm-cmn) has happily claimed (2nd line) the same resource
> already defined by the ACPI layer (1st line). Admittedly it's a little
> unclear since they both use the same name, but still.
> 
> > > 
> > > And I know people are using the CMN-700 PMU on other ACPI systems without
> > > issue, so there's nothing wrong with the binding or the driver in general.
> > > 
> > > The resource conflict only arises when a request overlaps an existing region
> > > inexactly. Either your firmware is describing the CMN incorrectly, or some
> > > other driver is claiming conflicting iomem regions for some reason.
> > No. It's not ACPI table problem. The problem is mentioned in comments of
> > function arm_cmn600_acpi_probe():
> >          /*
> >           * Note that devm_ioremap_resource() is dumb and won't let the platform
> >           * device claim cfg when the ACPI companion device has already claimed
> >           * root within it. But since they *are* already both claimed in the
> >           * appropriate name, we don't really need to do it again here anyway.
> >           */
> 
> Sigh... No, this is unique to CMN-600, because only the CMN-600 ACPI
> binding depends on nested resources, such that the resource tree
> starts off looking like this:
> 
> 50000000-5fffffff : ARMHC600:00
>   50d00000-50d03fff : ARMHC600:00
> 
> If we wanted to, we can still quite happily claim the root node
> resource:
> 
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2410,6 +2410,8 @@ static int arm_cmn600_acpi_probe(struct platform_device *pdev, struct arm_cmn *c
> 
>         if (!resource_contains(cfg, root))
>                 swap(cfg, root);
> +
> +       devm_request_mem_region(cmn->dev, root->start, resource_size(root), "arm-cmn!");
>         /*
>          * Note that devm_ioremap_resource() is dumb and won't let the platform
>          * device claim cfg when the ACPI companion device has already claimed
> 
> 
> ...which then nests like so:
> 
> 50000000-5fffffff : ARMHC600:00
>   50d00000-50d03fff : ARMHC600:00
>     50d00000-50d03fff : arm-cmn!
Yes. You are correct. This demo explains thing clearly to me. Thanks.

Regards
Yin, Fengwei

> 
> but what we cannot do is claim the whole 50000000-5fffffff region again
> because that cannot nest within the existing 50d00000-50d03fff region.
> 
> > So I suppose for ACPI env, we should use devm_ioremap() as cmn600 does.
> > And make CMN700 handling follow spec exactly.
> 
> As I said, the driver already supports the CMN-700 APCI binding
> perfectly well. If your CMN is described correctly then you need to
> answer my question of what *other* driver is claiming conflicting
> resources and why (and if so, also why that should be specific to ACPI).
> 
> Thanks,
> Robin.

