Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8758CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGvdfcSqol4uqC5hrNdAipjgClOPmg1Z1nCGTM/7W5Q=; b=xPtxq3qI0nt0Cna8y1r0S/V/y8
	l75cG1az3enBjACnQ6CeDz8w2mlB55dvvSaTWrSO5XwVFL6bn3MbkLg1zANKCMPvVx5mjE/u4Uuwb
	iOnlIgP56q/Dau7F8r8CDVnKAk4p+kCSGb7XfpJ7CIdqk/vcBXR+DU7usSrtDnfAEIQXvcgkONauJ
	v6TiS7vk/DYaLl2AEtppZ4Au6J7WU98VuAlwtSKAWR30xpTlO8XdYORZYIqCYy9wWpaR3Ic/AOUgP
	nPEpi7sfczzRlHnfHCnznaOlHLM4ccfLPTr7VmJGICyv966z+vmut7yAMSyEElFWPZ+keuKdDiijt
	l/b/868g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1BD-00000007pzM-1BOw;
	Mon, 18 Aug 2025 14:49:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unzne-00000007Qno-1Hm8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 13:21:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 803B41596;
	Mon, 18 Aug 2025 06:21:13 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6493F738;
	Mon, 18 Aug 2025 06:21:17 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:21:14 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org,
	johan+linaro@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	quic_mdtipton@quicinc.com,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH 2/2] [NOT_FOR_UPSTREAM] cpufreq: scmi: Add quirk to
 disable checks in scmi_dev_used_by_cpus()
Message-ID: <aKMoyp5xw9xSj2v1@pluto>
References: <20250815102736.81450-1-cristian.marussi@arm.com>
 <20250815102736.81450-2-cristian.marussi@arm.com>
 <20250818062044.zawqkalphvxjwt2w@lcpd911>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818062044.zawqkalphvxjwt2w@lcpd911>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_062122_431289_083C7BCD 
X-CRM114-Status: GOOD (  23.05  )
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

On Mon, Aug 18, 2025 at 11:50:44AM +0530, Dhruva Gole wrote:
> On Aug 15, 2025 at 11:27:36 +0100, Cristian Marussi wrote:
> > From: Florian Fainelli <florian.fainelli@broadcom.com>
> > 
> > Broadcom STB platforms were early adopters of the SCMI framework and as
> > a result, not all deployed systems have a Device Tree entry where SCMI
> > protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> > CPU Device Tree node(s) referencing protocol 0x13 as their clock
> > provider.
> > 
> > Leverage the quirks framework recently introduce to match on the
> > Broadcom SCMI vendor and in that case, disable the Device Tree
> > properties checks being done by scmi_dev_used_by_cpus().
> > 
> > Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> > Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > [Cristian: Moved quirk directly into scmi_dev_used_by_cpus]
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > ----
> > @Florian: I reworked this minimally to avoid the global as I was mentioning.
> > No change around the version match either...so the NOT_FOR_UPSTREAM tag.
> > (also the if (true) i smaybe a bit idiotic...)
> > Please check if it is fine and modify as you see fit.
> > ---
> >  drivers/cpufreq/scmi-cpufreq.c     | 9 +++++++++
> >  drivers/firmware/arm_scmi/quirks.c | 2 ++
> >  include/linux/scmi_quirks.h        | 1 +
> >  3 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> > index ef078426bfd5..9b7cbc4e87d9 100644
> > --- a/drivers/cpufreq/scmi-cpufreq.c
> > +++ b/drivers/cpufreq/scmi-cpufreq.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/pm_qos.h>
> >  #include <linux/slab.h>
> >  #include <linux/scmi_protocol.h>
> > +#include <linux/scmi_quirks.h>
> >  #include <linux/types.h>
> >  #include <linux/units.h>
> >  
> > @@ -393,6 +394,12 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
> >  	.set_boost	= cpufreq_boost_set_sw,
> >  };
> >  
> > +#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
> > +	({							\
> > +		if (true)					\
> > +			return true;				\
> > +	})
> > +
> 
> Probably another checkpatch warning to fix:
> 8<--------------------------------------------------------------------
> WARNING: Macros with flow control statements should be avoided                                                                                                                                                     
> #50: FILE: drivers/cpufreq/scmi-cpufreq.c:397:                                                                                                                                                                     

Yes I saw this too....but seemed harmless and anyway Quirks are really
very peculiar piece of code...

Thanks
Cristian

