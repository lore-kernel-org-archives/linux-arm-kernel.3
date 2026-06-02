Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB8ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJwauw3yIgL9Nn8rgrK60DliH14WU9hH1XUdWzb9RIg=; b=o3JS+AhbYhv8c6GwoFj/Rj/1ie
	bOwYagOdxZqsT2n/Zw13na22NJNQ/nTH8umHR5H9WMuf0NLXZlaGDO9OUkP20m1N1HZWA+/pVXTF4
	yUKTkq7gM1B5jk2LiSEFEXx6fQjKugOytoAM3Y/+LCQc1pNrJ3t9WllXnrqqpBP7LJROeKiRf3lH5
	DKfZJDHwG6o6c8rSax/PcqLhFO6wPKI7DVr6KXZFdsxouFgdaQ8SrOZbsSU1tmmCYPihX0422m3Sf
	nfIg+hxhGpbOUMBoDvl29lbaRBspoYUojvFs/KKh56w6kcUTueqMHYRi8r8vQUcrEDiF59CpwNx8+
	GkiuS0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURy5-0000000DRbu-2271;
	Tue, 02 Jun 2026 16:27:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURy4-0000000DRbh-1NNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:27:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C282D6001A;
	Tue,  2 Jun 2026 16:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C59D1F00893;
	Tue,  2 Jun 2026 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417671;
	bh=uJwauw3yIgL9Nn8rgrK60DliH14WU9hH1XUdWzb9RIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g6ti7ugc7Q4yQ/Yv1cgs+KjEL5bXPLudNqMJCBXgkP6itRar9abMExf+0yKCjTY0H
	 K9CD91i/vrgx0S4xEKfrrqSFq+Hg5gKbxuMWmbPs74dmDD5PnEIillMcKq+mZc7zjK
	 0w7j5hT/zJLu1O67eB3ejj0Rox04k+jtwwfj2rVhifgSAc7KL6t4lPzrVLFQ9WiAeW
	 fVug6UC5B9qYe5ZK2t23EfQtFWKwTMJEvgFKkG/VCibOX9U2t1SgkVRrkV1Gr4ZGut
	 hbQ6//irk4k2YK4vCB3M2acMHexyaS5fKll9u8YGw0/de6pxKAzN6mWk31jz/IaU4V
	 yf5u/7DtYH1og==
Date: Tue, 2 Jun 2026 17:27:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Seth Forshee <sforshee@nvidia.com>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Honor maximum RX/TX buffer size
Message-ID: <20260602-accomplished-illegal-mole-ef2acc@sudeepholla>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
 <20260602-grateful-elfish-elk-413154@sudeepholla>
 <ah8A05Mt9W1yZjFW@omni-lfn-logwh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8A05Mt9W1yZjFW@omni-lfn-logwh>
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

On Tue, Jun 02, 2026 at 11:12:03AM -0500, Seth Forshee wrote:
> On Tue, Jun 02, 2026 at 04:56:48PM +0100, Sudeep Holla wrote:
> > On Mon, Jun 01, 2026 at 03:45:11PM -0500, Seth Forshee wrote:
> > > FFA_FEATURES in v1.2+ supports a maximum RXTX_MAP size. This maximum
> > > size is not checked when page-aligning the RX/TX buffer size, and
> > > FFA_RXTX_MAP may fail when passed a size greater than the maximum.
> > > 
> > > Decode the maximum buffer size returned from FFA_FEATURES and limit the
> > > buffer size based on this value if it is non-zero (zero indicates no
> > > maximum). Include verification that the max returned by the SPMC is
> > > larger than the minimum, otherwise use the minimum.
> > > 
> > > While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
> > > consistency.
> > > 
> > > Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> > > Assisted-by: Claude:claude-opus-4-8
> > > Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> > > ---
> > >  drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++++++++++++++++--
> > >  1 file changed, 27 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > > index b9f17fda7243..dc45724a29ba 100644
> > > --- a/drivers/firmware/arm_ffa/driver.c
> > > +++ b/drivers/firmware/arm_ffa/driver.c
> > > @@ -32,6 +32,7 @@
> > >  #include <linux/interrupt.h>
> > >  #include <linux/io.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/minmax.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/mutex.h>
> > > @@ -55,7 +56,9 @@
> > >  	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
> > >  
> > >  #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
> > > -#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
> > > +#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
> > > +#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
> > > +#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
> > >  
> > >  #define FFA_MAX_NOTIFICATIONS		64
> > >  
> > > @@ -2086,11 +2089,13 @@ static void ffa_notifications_setup(void)
> > >  	ffa_notifications_cleanup();
> > >  }
> > >  
> > > +#define FFA_SUPPORTS_RXTX_MAX_BUFSZ(version)	((version) > FFA_VERSION_1_1)
> > > +
> > >  static int __init ffa_init(void)
> > >  {
> > >  	int ret;
> > >  	u32 buf_sz;
> > > -	size_t rxtx_bufsz = SZ_4K;
> > > +	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
> > >  
> > >  	ret = ffa_transport_init(&invoke_ffa_fn);
> > >  	if (ret)
> > > @@ -2118,9 +2123,29 @@ static int __init ffa_init(void)
> > >  			rxtx_bufsz = SZ_16K;
> > >  		else
> > >  			rxtx_bufsz = SZ_4K;
> > > +
> > > +		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {
> > 
> > This is not even compile tested ? I don't think this is defined anyway.
> > Anyways I don't think we need this condition as v1.1 or below had it
> > MBZ, so it is fine to drop it.
> 
> It is added just above ffa_init(). The code as been compile and run
> tested on multiple platforms, as noted in the cover letter.
> 

Ah sorry, my bad. It failed to apply and I must have messed it up.
I have some changes in linux-next which conflicts and I dropped it when
resolving. Sorry for that.

> I hadn't checked older spec versions, so if they have it as MBZ then I
> agree we can drop the check.
> 
> > 
> > > +			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
> > 
> > The cast is unnecessary, its is 16 bit, so max 0xFFFF << 12.
> 
> Correct, though linters complain about it which is why I added it. I can
> drop it though if you prefer.
> 

Can you be more specific ? Any way to trigger it ?

> > 
> > 
> > > +			if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_bufsz) {
> > > +				/*
> > > +				 * Per spec the maximum must be >= the minimum, or
> > > +				 * else zero if there is no size limit. If the SPMC
> > > +				 * violates this constraint, use the minimum as the
> > > +				 * effective maximum.
> > > +				 */
> > 
> > I don't see any text implying the above from the spec, drop it. Please point
> > it to me if you find. Even otherwise it seems obvious here and doesn't need
> > the note.
> 
> I found it in v1.3 of the spec in Table 13.15: "Size must be greater or
> equal to the minimum buffer size, else MBZ if there is no size limit." I
> will remove the comment.
> 

Ah v1.3, sorry I was just looking at v1.2.

> Thanks,
> Seth

-- 
Regards,
Sudeep

