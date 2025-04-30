Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F5CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwFpFwvTEarsVyn0ddS2TUpG1aNl9BaWUJ28SJcYyO4=; b=fxDJrepXibUDyAGYMdIdN7x1bQ
	7OL4zEkccxyNNnfShN4lV5SvQVOVfRmP3OPXtXpOzQR7imuVg3H+zPb7IvA6FWv8OdE1z5ms2bbMz
	JPMV7WXZolJlR+hs/3Tr5KTxNeo8EyG5Vh2azc2YB8sE06qgGMuIcgJjv4/ErAMoBi0gZTmNQRnRw
	EcqMfY7E+73Xu/vf+CDLSAti8BspwRlx5rweZaNLgZz0p4xtzRT4kMdGnfvmxCxF1alGAIjinY1gv
	kX5RsRbQkoUsHyWJoIuoHF4cvWzN67ooEZz72BzNnsl7CNf7XefjL0+SPmdq7SRxxVdJMroCTFjd4
	YZ6dhzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9MI-0000000DHhw-1lnV;
	Wed, 30 Apr 2025 15:28:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9KL-0000000DHY0-2wGp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:26:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A3E51063;
	Wed, 30 Apr 2025 08:26:15 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3A8E3F5A1;
	Wed, 30 Apr 2025 08:26:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:26:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <arm-scmi@vger.kernel.org>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <peng.fan@oss.nxp.com>,
	<michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <johan@kernel.org>,
	"Arnd Bergmann" <arnd@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <20250430-efficient-spider-of-criticism-e857bf@sudeepholla>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
 <aBHXHnXA95TwJths@pluto>
 <868qnhj2yf.wl-maz@kernel.org>
 <aBIbC15NiqUseZc7@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBIbC15NiqUseZc7@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_082625_782203_EB04BE3D 
X-CRM114-Status: GOOD (  22.39  )
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

+Arnd

On Wed, Apr 30, 2025 at 01:43:55PM +0100, Cristian Marussi wrote:
> On Wed, Apr 30, 2025 at 12:36:40PM +0100, Marc Zyngier wrote:
> > On Wed, 30 Apr 2025 08:54:06 +0100,
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > 
> > > On Tue, Apr 29, 2025 at 03:11:07PM +0100, Cristian Marussi wrote:
> > > > Add a common framework to describe SCMI quirks and associate them with a
> > > > specific platform or a specific set of SCMI firmware versions.
> > > > 
> > > > All the matching SCMI quirks will be enabled when the SCMI core stack
> > > > probes and after all the needed SCMI firmware versioning information was
> > > > retrieved using Base protocol.
> > > > 
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > 
> > > Hi
> > > 
> > > just a quick remarks that a bot spotted the usage of __VA_OPT__ which is
> > > only available since GCC >= 8.0 :< ... so I will probably revert to use the
> > > previous, less clean, mechanism to build the NULL terminated array in
> > > which the compats array WILL HAVE to be explicitly NULL terminated when
> > > provided (even the empty ones...)
> > 
> > See 20250407094116.1339199-1-arnd@kernel.org, which is slated for
> > 6.16. The TL;DR is that GCC 8.1 and binutils 2.30 should be the
> > minimal versions from 6.16 onwards.
> > 
> > So it's probably not worth using ugly hacks that will eventually be
> > reverted.
> 
> Great news, thanks for the heads-up !
> 

Thanks Marc!

Arnd,

I don't see much discussions on 20250407094116.1339199-1-arnd@kernel.org
to conclude if you plan to get this for v6.16

We probably can wait to push this $subject after your changes land. But
it would be good to know your opinion here especially if you are not
pushing your patches for v6.16

-- 
Regards,
Sudeep

