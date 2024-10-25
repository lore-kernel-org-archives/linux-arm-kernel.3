Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E825D0C61F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTp0kNH81ZJnMqT+aGOjzfQePrvh3802k7Gassmeshk=; b=FbqSAmytX+IpGahiB9TvtXwfEJ
	bHbBtnh1VsfLemtnKF35xUcy1tLoz3Tjo7bnoICiM0MX2gXH9hDf32U4Y/A9c9KnM1wl0hqf4Xmde
	hjfcEqmYXG1b9Y38FAMe1s+l09NjYg4CIqgOuhYZp0K3AtSytUNMGrCf1FLdD9gVnYEQnrJ6HwDff
	OVSyvE7HpNPrgYlZCqy3J4PHov90161WoKq0vNGg9QFUM8MnDxgdm+XPaHDXTgUz+Hn77void2VnR
	F1uYwdPXQXS6SoYEoSOchHaJV1zXQZy12r90fGV3Bpb6CdMywh7+d45UfLrE03zlfj5EvBIotn/HQ
	704xm7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LsO-000000048qE-0LxR;
	Fri, 25 Oct 2024 15:05:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LQ3-000000042Xc-0TPJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:36:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E628F339;
	Fri, 25 Oct 2024 07:36:31 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6288E3F73B;
	Fri, 25 Oct 2024 07:36:00 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:35:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com
Subject: Re: [PATCH 5/5] firmware: arm_scmi: Relocate atomic_threshold to
 scmi_desc
Message-ID: <ZxuszZFKdJoHwiSe@pluto>
References: <20241018080602.3952869-1-cristian.marussi@arm.com>
 <20241018080602.3952869-6-cristian.marussi@arm.com>
 <842a9844-ac89-4972-9024-72ed0e08c2d3@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842a9844-ac89-4972-9024-72ed0e08c2d3@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073603_230722_53E8E9EC 
X-CRM114-Status: GOOD (  12.45  )
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

On Wed, Oct 23, 2024 at 04:20:53PM +0300, Dan Carpenter wrote:
> On Fri, Oct 18, 2024 at 09:06:02AM +0100, Cristian Marussi wrote:

Hi Dan,

thanks for having a look.

> > @@ -2959,7 +2952,7 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
> >  			   (char **)&dbg->name);
> >  
> >  	debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
> > -			   &info->atomic_threshold);
> > +			   (u32 *)&info->desc->atomic_threshold);
> 
> This cast is unnecessary.

I was indeed wondering why I added that....then I remember something
about debugfs_create....without that (u32 *):

drivers/firmware/arm_scmi/driver.c: In function ‘scmi_debugfs_common_setup’:
drivers/firmware/arm_scmi/driver.c:2988:28: warning: passing argument 4 of ‘debugfs_create_u32’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
                             &info->desc->atomic_threshold);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

since the enclosing struct ->desc is const AND debugfs_create_u32 is NOT
smart enough to expect a const when the property is R_ONLY...unless I am
missing something.

> 
> >  
> >  	debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
> >  
> > @@ -3071,6 +3064,13 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
> >  		 trans->desc->max_rx_timeout_ms, trans->desc->max_msg_size,
> >  		 trans->desc->max_msg);
> >  
> > +	/* System wide atomic threshold for atomic ops .. if any */
> > +	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
> > +				  &trans->desc->atomic_threshold))
> > +		dev_info(dev,
> > +			 "SCMI System wide atomic threshold set to %d us\n",
>                                                                    ^^
> %u for unsigned int.
>

I will fix.

Thanks,
Cristian

