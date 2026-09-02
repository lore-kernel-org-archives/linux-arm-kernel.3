Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A4BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxHiLh7xf4U33EDf1yNoj+0B6+1An558XrAtVhOAN3w=; b=fbhk2UO+JbCbQRc7XCAufcQGVl
	F61aSkKL+WGWg9aXtovd7cMfNar2C8L62a902ZakcsPRAgBgcq2ckR81oJOQaTQeBD8zD5qS7LYqa
	npDpRrR7tF98e7f6OwcN3uGDOvpWXIi36Q4UG7hD/rgMADaymW2kRhe5djxvm55+QGd3Gj/c8TSaY
	sORcQyBlCjKleYwAQnHc2chzVivPAPJbVip56H0OaNkwRoOpmJzHHKMgnHp/K8l9f/FPEZmWFLCZK
	i626wDFuD6/ipsKXR2paEBVUcGQrkaJWvKycQNCzFVdmuIUwApE7iYKt650nOZAr8hBCs3kJlS7rd
	meqIGagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g2R-0000000E2ll-1VTW;
	Wed, 02 Sep 2026 08:09:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g2Q-0000000E2lR-1ovH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:09:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27F7440491;
	Wed,  2 Sep 2026 08:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8D21F000E9;
	Wed,  2 Sep 2026 08:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336582;
	bh=TxHiLh7xf4U33EDf1yNoj+0B6+1An558XrAtVhOAN3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jj6t00NSdjUxb76e38CHx11UZxusgqDpeYLzjJi6gQMgMuHS7f+JyGfXWA6w0/cck
	 dkGPt4arFSnHiPxDZcJ6QEEYVu6830WsnzpTfkUc39TFomnw3bqJf5Z8OkV0H8VF+Z
	 bMVgDC4FMBcgVARpZkvvH2bm5BSVMnaJmgIfA+g5XwOQAyDlLCx30OQ4xN7Cu4Z+ey
	 3gCXgXVAMRCrSatmOQSivcZNuRCySj4Nx+4iYSebM5ik0mcayzNv8ZYxhKqvde0Qlp
	 7XtIrInEZBnZUOLCjHskQCGpQA7soDzw+OfibqkKe2R6ZDSVpNRCBaQb0BmltQWFfs
	 BWOHVWQnAV9ow==
Date: Wed, 2 Sep 2026 09:09:39 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Message-ID: <20260902-slick-meaty-mole-dbfd7f@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
 <20260824104337.00002275@oss.qualcomm.com>
 <20260902-able-collie-of-purring-87badd@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-able-collie-of-purring-87badd@sudeepholla>
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

On Wed, Sep 02, 2026 at 09:03:02AM +0100, Sudeep Holla wrote:
> On Mon, Aug 24, 2026 at 10:43:37AM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:32:59 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > > scmi_debugfs_common_setup() uses the "compatible" property to
> > > populate the debugfs transport type string. ACPI-described SCMI
> > > devices do not provide that DT property, so the string remains
> > > NULL and debugfs setup falls through the allocation failure path.
> > > 
> > > Check the property lookup result and use the ACPI HID as the
> > > fallback transport type when an ACPI companion is present.
> > > 
> > > All supported DT SCMI platforms are expected to provide "compatible",
> > > so the non-ACPI fallback is not needed for normal DT operation. Keep
> > > the explicit "unknown" fallback anyway to avoid passing NULL to
> > > kstrdup() if that assumption is ever violated.
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > Can drop some complexity in here and rely on the stubs in acpi.h a little more.
> > 
> > > ---
> > >  drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > index 9014723e0f7f..9ad827c6a9ab 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > @@ -16,6 +16,7 @@
> > >  
> > >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >  
> > > +#include <linux/acpi.h>
> > >  #include <linux/bitmap.h>
> > >  #include <linux/cleanup.h>
> > >  #include <linux/debugfs.h>
> > > @@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
> > >  	kfree(dbg->type);
> > >  }
> > >  
> > > +static const char *scmi_acpi_device_hid(struct acpi_device *adev)
> > > +{
> > > +#ifdef CONFIG_ACPI
> > 
> > Hmm. Ugly that acpi_device_id returns an empty string.
> > 
> > However given when !CONFIG_ACPI the stub for ACPI_COMPANION(dev) is
> > NULL.  You don't need this dance anyway.
> > 
> 
> That was exactly my thoughts initially until builder bots complained.
> But acpi_device_hid() is defined only for CONFIG_ACPI, though I can
> handle it runtime, I need to define acpi_device_hid() as NULL for
> !CONFIG_ACPI as alternative.
> 

Scratch that, I need to dig the build failure and understand it better.
I think including acpi_bus.h caused some issue which I don't like as
acpi_bus.h must be for core acpi support code. We may need to move
acpi_device_hid() out of there.

-- 
Regards,
Sudeep

