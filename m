Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A3CC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pamP/RQHHZhjTKS40y208EFfP9hjWZ8VtdPcrPv0lnc=; b=WRNs1RVAYgXuP0ltAftlIzgura
	OxUJ4M6j39ir2k9XRb3G2DmafK7yWPvdVGYU99WbIssWTdIZKj5Nx+0BQNwIBXJQmrWWstaWyS7Dd
	c6MFjVFHbdrZe9039gZUVzAoxGdXfzkziEUOXfdrVeT97YlgJKXteIYYR5wxRgDsk7e26IzA58Vew
	20FwDAplk8lk2U4JoBxPJZRIsHwZfRWsXy2zDUJR5jgK+N3MBi1ybRQ2rfQwpCdkEZ4SupQqHfR60
	foSLwRnNX2I7ltBYZZ3hrf09B0G4OoWJP2i6kfGp9y3T2g4Pt4OFvg+ok3ZiNPhVnGfJT3AeEDIBk
	i9q1OGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fw3-0000000E0V2-1kbp;
	Wed, 02 Sep 2026 08:03:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fw2-0000000E0Ui-1P4D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:03:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B11AE43938;
	Wed,  2 Sep 2026 08:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD031F000E9;
	Wed,  2 Sep 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336185;
	bh=pamP/RQHHZhjTKS40y208EFfP9hjWZ8VtdPcrPv0lnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNMkaqyxBiamm9v5mWLZHNDS/r+s5OQ8SykbhnZGxOsc76gOg0jy/eSTWAV6DZ9Yi
	 tSb8dvuVjUISrvalXK8DyNmiTsKSSyBQ5LhrQ39yEv/54G6KLAOB2bHrCstngyCZjK
	 hjmJbANAdrMQI1aMnYsimpCDwOEMeUuFblsfzLQd/1SOdiwvyXkDoGcdfeGBAlHX3h
	 MyyoTCyudZiW5z9hUBQbaVVWUkxkFcTLaNZEzIFR9AgritA/9o+CyiE2ybzFM4yUKI
	 Wj/k11rjSTtsoAlpJCvwhLzE9e7G47iSmmslCMTgj7uOOvyRn63oIRJW/G0FZ65K2S
	 3agUAcG7mgr8A==
Date: Wed, 2 Sep 2026 09:03:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 4/9] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
Message-ID: <20260902-able-collie-of-purring-87badd@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-4-cb6b88b4ebb3@kernel.org>
 <20260824104337.00002275@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824104337.00002275@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 10:43:37AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:59 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > scmi_debugfs_common_setup() uses the "compatible" property to
> > populate the debugfs transport type string. ACPI-described SCMI
> > devices do not provide that DT property, so the string remains
> > NULL and debugfs setup falls through the allocation failure path.
> > 
> > Check the property lookup result and use the ACPI HID as the
> > fallback transport type when an ACPI companion is present.
> > 
> > All supported DT SCMI platforms are expected to provide "compatible",
> > so the non-ACPI fallback is not needed for normal DT operation. Keep
> > the explicit "unknown" fallback anyway to avoid passing NULL to
> > kstrdup() if that assumption is ever violated.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Can drop some complexity in here and rely on the stubs in acpi.h a little more.
> 
> > ---
> >  drivers/firmware/arm_scmi/driver.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index 9014723e0f7f..9ad827c6a9ab 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -16,6 +16,7 @@
> >  
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/debugfs.h>
> > @@ -3063,6 +3064,15 @@ static void scmi_debugfs_common_cleanup(void *d)
> >  	kfree(dbg->type);
> >  }
> >  
> > +static const char *scmi_acpi_device_hid(struct acpi_device *adev)
> > +{
> > +#ifdef CONFIG_ACPI
> 
> Hmm. Ugly that acpi_device_id returns an empty string.
> 
> However given when !CONFIG_ACPI the stub for ACPI_COMPANION(dev) is
> NULL.  You don't need this dance anyway.
> 

That was exactly my thoughts initially until builder bots complained.
But acpi_device_hid() is defined only for CONFIG_ACPI, though I can
handle it runtime, I need to define acpi_device_hid() as NULL for
!CONFIG_ACPI as alternative.

-- 
Regards,
Sudeep

