Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163D4C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzxngQQwI02VxKfYyElZhuR9khNH3IJDh9D/mIorTkA=; b=wkgLBW4HjRt6gHAgaiU3xnVtwV
	LVCaUWjynl6XhTyLSevKMxomDMwjITtH1u1Tr8w+twGgDB48xBLrKkUs+rif2jFwOXBI18TmCHCyt
	uNToQsMWVWXPbxs4URAMH091tXsegCufhEg+jiRZZHoKCQBtMFEx08mciwGNUiRFffGCwzYbvTqIH
	N2kVN58dYqiT4dlT/njDFmTNIHVy8gXY4vyRxhwtIJILBtS9FKn0WP6IcAquvXJXho989+HWs5uq7
	gwx4/+CJWrTgiXjXhNQfn517VA8Q/7GuPULS74AXSPixQjDo+IJpaJU/FeK2syURun1f1+j7jkecb
	Si3m/zfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ke2-00000007xpF-2y9z;
	Wed, 23 Sep 2026 10:56:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ke0-00000007xoL-2edx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:56:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E97BF143D;
	Wed, 23 Sep 2026 03:56:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047343F86C;
	Wed, 23 Sep 2026 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790160967; bh=s5eK6czV54tLMgQyspEsKT5FhzSt1Pt79xGUDPqztro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LogV7v5ul2kJACpBHby8srql67OXX0Bled1I/EPPVwAmKpYNSZLzGG8ySoD5aiAqb
	 z8+RgMj8cMWr4Pz2TESQ5GlrSOcy/prdB3nggxKbZkvpFNJLKUt7KD6SYEbTQptlAs
	 Rr0b9Xa0retjD23OCp/6aqD0SFUfPj8MEmIOOIfo=
Date: Wed, 23 Sep 2026 11:55:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 02/25] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <arOv8aLJaRQjhkaF@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-3-cristian.marussi@arm.com>
 <2135509e-2689-4258-ab00-011d47f4b172@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2135509e-2689-4258-ab00-011d47f4b172@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_035608_810091_D6C3DE5F 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Sep 22, 2026 at 03:15:55PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > Allow protocols to register events with build-time unknown sizes: such
> > events can be declared zero-sized and let the core SCMI stack perform the
> > needed safe-net boundary checks based on the configured transport size.
> 
> ok, so we have a maximum message size defined by the transport. We'll use that
> as payload size, and the report size just gets the additional ktime_t.
> 
> 
> >  	pd = scmi_allocate_registered_events_desc(ni, proto_id, ee->queue_sz,
> > @@ -807,7 +821,8 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
> >  		mutex_init(&r_evt->sources_mtx);
> >  
> >  		r_evt->report = devm_kzalloc(ni->handle->dev,
> > -					     evt->max_report_sz, GFP_KERNEL);
> > +					     evt->max_report_sz ?: max_report_sz,
> 
> Having two similarly named variables is a bit confusing. I wonder if you can
> somehow make it clearer in the latter case that it is the max_report_sz
> according to the transport.

Ok I'll do.

> 
> > +					     GFP_KERNEL);
> >  		if (!r_evt->report)
> >  			return -ENOMEM;
> >  
> > diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
> > index f18f98c5ab3b..c2eb4844c7db 100644
> > --- a/drivers/firmware/arm_scmi/notify.h
> > +++ b/drivers/firmware/arm_scmi/notify.h
> > @@ -18,8 +18,12 @@
> >  /**
> >   * struct scmi_event  - Describes an event to be supported
> >   * @id: Event ID
> > - * @max_payld_sz: Max possible size for the payload of a notification message
> > - * @max_report_sz: Max possible size for the report of a notification message
> > + * @max_payld_sz: Max possible size for the payload of a notification message.
> > + *		  Set to zero to use the maximum payload size allowed by the
> > + *		  transport.
> 
> "maximum payload size" is ph->hops->get_max_msg_size(ph) ? Should we call this
> "maximum message size" then?
>
Ok 
> > + * @max_report_sz: Max possible size for the report of a notification message.
> > + *		   Set to zero to use the maximum payload size allowed by the
> > + *		   transport plus the additional ktime_t timestamp.
> 
> Same here.
>
 
Ok

Thanks,
Cristian

> -- 
> Cheers,
> 
> David

