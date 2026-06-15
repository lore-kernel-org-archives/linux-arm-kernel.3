Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273DBCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSeGclcU8eZZ2TTI+65yrmh6S3SDarp+1N+wEMak0Tk=; b=K6soVFwKZNm7+aGUgYm6cMdB1j
	sUUPsy6AAyNFGk/cOiHmrB5COLRaFRwpIzKL2eB5QrxaKKnZaeHO7mLyPERnyWCeG0E4SBmqtB68F
	53jnHJ0f2PR+b6ZbZEHlKnJl6UJ8J8Pyi42L6fBIYW2NualPIJ23wrEijMsoH2KcRZrOpFOcxTNh8
	VOy977QoIDs71g+IY735SKFdomAlmLB7HLYcNGVOMoXZuw3KTsv7Ixw/VtWqo+pwBp0lRuLBZMd2M
	pLjrZL6a2waq4e8sDNe04me7eNYalN1Ii4WjwABgpMokwQehAZAJn6fvEZ/It1gvwxE+eUKXSCckR
	5oe9Xq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ20M-0000000DoBn-1ogQ;
	Mon, 15 Jun 2026 07:45:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ20J-0000000DoBG-2sHS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:45:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFA171BB0;
	Mon, 15 Jun 2026 00:44:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50F153F915;
	Mon, 15 Jun 2026 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781509504; bh=S3aesdr6kLsMUr3xS9pG14iz/MosAT4l49e0wdffs74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzKvQYgj2iF4lrktbW85bXMa+pjivHU/qBOlR1WbOnnjLYmME7Tp1Afkh4vR5bR3R
	 Xk7sbfqqXI1biKbxPrUDKsMsI3DqmYJ/wy1gFhSbIyf6ezFz7cU3VxpEVE6FxIkLUl
	 kVuEJpT4atyv2vAFewU3n7onhcjNKa/r06KPy/9A=
Date: Mon, 15 Jun 2026 08:44:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com,
	jonathan.cameron@huawei.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v3 01/24] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <ai-tXclzfL9CkGkq@pluto>
References: <20260329163337.637393-2-cristian.marussi@arm.com>
 <20260612101100.186627-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612101100.186627-1-usama.arif@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_004507_891247_383A48BE 
X-CRM114-Status: GOOD (  21.46  )
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

On Fri, Jun 12, 2026 at 03:10:59AM -0700, Usama Arif wrote:
> On Sun, 29 Mar 2026 17:33:12 +0100 Cristian Marussi <cristian.marussi@arm.com> wrote:
> 

Hi Usama,

Thanks for having a look at this first of all !

I was busy posting a V4 before merge window last week so this late
reply....

I am already planning a V5 in -rc1 in two weeks where beside some more
minor ABI additions I will plan to address any incoming reviews and
some residual minor issues I know about (mostly sparse related)

...but you are CCed already in V4...

> > SCMIv4.0 introduces a couple of new possible protocol error codes: add
> > the needed definitions and mappings to Linux error values.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/common.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index 7c35c95fddba..44af2018e21d 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -45,6 +45,8 @@ enum scmi_error_codes {
> >  	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> >  	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> >  	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> > +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> > +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> >  };
> >  
> >  static const int scmi_linux_errmap[] = {
> > @@ -60,6 +62,8 @@ static const int scmi_linux_errmap[] = {
> >  	-EIO,			/* SCMI_ERR_GENERIC */
> >  	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> >  	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> > +	-EPERM,			/* SCMI_ERR_IN_USE */
> 
> "In use" reads like a resource-state failure, where -EBUSY would normally be expected.
> -EPERM suggests an authorization failure,  which is already represented by SCMI_ERR_ACCESS.
> 

The usage of this in Telemetry is indeed a resource state failure that relates to groups usage
and it means something like "this is busy now, so you cannot do that now with this current config"
...but you are definitely right that -EPERM does NOT fit well here and especially is NOT what IN_USE
should signify in general in SCMI as a return code for future users.

I will fix in V5.

Thanks,
Cristian

