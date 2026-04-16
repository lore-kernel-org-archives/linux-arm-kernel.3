Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A92F8A152
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntcacfxjx4x+GzsatNR5HMCbbBsrB1e1h9YfA0GOWtw=; b=dBxsLoXYL+0Xm1L5Yez2eHSzqS
	LLrzukq3gF05a7vII+LM+2DOFytUmquPT5BSKjiEve6p61cXinxxkdY72rZn3xc2lOw/e3udaC/8H
	miNQCsc/7MCgflxr9RFyiarbdGveNnUk8tdeQaS2EWBzYur2VRMITWlJD5CUJ/MxeY3gFDSL9s9LV
	rgmaYlAum3wPR36r7BNRt+TMoJzrWeGF+lI0XcCMJoD+0q+Q7Zexpe6gEArDwOUV4FE/SlklF5Azr
	ExMtgz55o6GCd9vrU/Ad0VJitq1YYNKFO7GgRIdUL83i5XMtDBHWTxdY2ibkEcKtESuW+WMWPnpVD
	wxflfDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJN5-00000002Gyq-3wGi;
	Thu, 16 Apr 2026 09:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJN3-00000002Gy5-3Oik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:50:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22A5F25E1;
	Thu, 16 Apr 2026 02:50:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3C0A3F7B4;
	Thu, 16 Apr 2026 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776333046; bh=/l68IUbXGLbQxuUCqvugNkS/csceWjEfor//cgmVMVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LoiK9oIpJe2lsQsQAzs3kUhViI3T+96/XFF/ZNRUkchuQH4d1RyvATNFByr+iyrTw
	 c5QgzgikabCMd1Y87/Wk/0iaiR/eKI3avdLc5t+fioxWcBCntb0Jcq9Y3z0TZ9daqj
	 1cU39usIzS49Q/+1N5Dg4Pk/g92mldrC7xbno9WM=
Date: Thu, 16 Apr 2026 10:50:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <aeCw8nLa1mK5tSgN@J2N7QTR9R3>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
 <2026041603-guts-crested-ef76@gregkh>
 <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
 <CANUHTR9+Z9s3thfKMC5qiLMdYJAo-1sX1g9QiU65OVCbb+mAMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR9+Z9s3thfKMC5qiLMdYJAo-1sX1g9QiU65OVCbb+mAMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_025050_323042_85CF764B 
X-CRM114-Status: GOOD (  44.17  )
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

On Thu, Apr 16, 2026 at 04:59:01PM +0800, Guangshuo Li wrote:
> On Thu, 16 Apr 2026 at 15:23, Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Apr 16, 2026 at 06:40:55AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Apr 15, 2026 at 07:19:06PM +0100, Mark Rutland wrote:

> > > > Greg, am I missing some functional reason why we can't rework
> > > > device_register() and friends to handle cleanup themselves? I appreciate
> > > > that'll involve churn for some callers, but AFAICT the majority of
> > > > callers don't have the required cleanup.
> > >
> > > Yes, we should fix the platform core code here, this should not be
> > > required to do everywhere as obviously we all got it wrong.
> >
> > It's not just the platform code as this directly reflects the behaviour
> > of device_register() as Mark pointed out.
> >
> > It is indeed an unfortunate quirk of the driver model, but one can argue
> > that having a registration function that frees its argument on errors
> > would be even worse. And even more so when many (or most) users get this
> > right.
> >
> > So if we want to change this, I think we would need to deprecate
> > device_register() in favour of explicit device_initialize() and
> > device_add().
> >
> > That said, most users of platform_device_register() appear to operate
> > on static platform devices which don't even have a release function and
> > would trigger a WARN() if we ever drop the reference (which is arguably
> > worse than leaking a tiny bit of memory).
> >
> > So leaving things as-is is also an option.
> >
> > Johan
> 
> I did some more investigation, and it looks like directly changing the
> semantics of the existing API would break code that is already correct
> today.

Evidently this wasn't entirely clear, but when I suggested changing the
semantic, I had implicitly meant that we'd also go and fix up callers to
handle the new semantic.

I agree that whatever we do, we'll have to change some callers, given
that existing callers have inconsistent expectations.

> In particular, there seem to be at least two different kinds of callers:
> 
> Callers that already handle the failure path explicitly after
> platform_device_register() fails. For these users, changing
> platform_device_register() itself to drop the reference internally
> would lead to double put / use-after-free issues.

Yes; for those we could drop the explicit cleanup.

As an alternative (as Johan mentioned above), if we deprecated
*_register() in favour of separate *_initialize() and *_add() calls,
then we could require that callers had explicit cleanup. As that cleanup
would more obviously pair with the *_initialize() step, it would be less
surprising than cleaning up for a function that returned an error.

As I mentioned in my other reply to Johan, that might also give options
for how to handle the static platform_device case, e.g. with an
*_uninitialize() function.

> Callers that operate on static struct platform_device objects. Many of
> these do not have a release callback, so blindly dropping the
> reference on failure would trigger a WARN.
> 
> Because of this, changing platform_device_register() itself to always
> clean up on failure does not look safe.

I agree that we probably can't have _*register() do all the necessary
cleanup, since callers want different things.

As per Johan's suggestion, and my reply, I suspect the best option
for a consistent API would be to deprecate *_register() in favour of
separate *_initialize() and *_add() calls.

> One possible direction may be to leave platform_device_register()
> unchanged, and instead add new helper APIs for the different cases.
> 
> For case (1), I was thinking of a helper like:
> 
> platform_device_register_and_put()
> 
> The implementation would simply call platform_device_register(), and if
> that fails, call platform_device_put(). Callers converted to this helper
> would then no longer perform their own put on the failure path.

I think that's going to be a source of confusion, because there's no
clear way to name that function. A '_and_put' suffix makes it sound like
it does a put unconditionally, rather than when the *_add() step fails.

Otherwise, I agree that would work for those callers.

> For case (2), I was thinking of a helper like:
> 
> platform_device_register_static()
> 
> The implementation would first install a no-op release callback when
> pdev->dev.release is not set, and then call
> platform_device_register_and_put(). This would make the failure path
> well-defined for static platform_device users, avoiding the reference
> leak without triggering a WARN.

Something like that might work.

As above, I think my preference would be to have separate
init/add/uninit calls, as that way each of the functions succeeds or
fails atomically, which is more aligned with general conventions.

> If this direction sounds reasonable, I would be happy to work on it and
> send a patch, and I would also be very willing to help with the related
> API conversion work for existing callers.

Fantastic!

I think we should hear what Greg thinks of the options before we start
on that, but it's great to hear that you're willing!

Mark.

