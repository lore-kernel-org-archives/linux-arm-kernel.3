Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B86BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEP2HDyJ3eN7/1m77SdcDj5XaWZQ0CXEG8ZZWs4ZwFg=; b=o/0GjaTuyLbEYUxjD0Dog8jlOV
	5WSRza1ZnbPVUXw1eU5TTqWtzn0ItE1FYFtHuJj1nQA6HhscVJIOzA89DE1Al6sI9dRAlvIHQXmV+
	c4lkKSlL5AB8AcQfv6Ox5ht4apNEyyQGpyBNf2oRkqmmxSh5+x17D25mwyNy8m6xTkvdhUtGJ3b+b
	4Z9ltavsId8BvnRqSDl0mENFYvxHs7Aql+ZlUQmvwF9/NfNwmRrxK8FMs94wKrbeKYF8Ed+fuEsVT
	hb3AVHU5fAve5nyAluK/0MefINifJVX/Jhp/FbZr81JNIjVmLKA2JoYh8XJ46NZtrwGAWGrOQxZ2e
	iBpiXgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUGc-00000009WVl-011S;
	Wed, 25 Jun 2025 17:50:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQkO-00000008tuH-0Ntt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:05:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FC9B106F;
	Wed, 25 Jun 2025 07:04:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 982683F66E;
	Wed, 25 Jun 2025 07:05:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:04:59 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <aFwCCw6K2NWuz5XZ@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
 <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_070508_168358_F5839866 
X-CRM114-Status: GOOD (  12.07  )
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

On Sat, Jun 21, 2025 at 12:01:23AM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> > +	/* Build compsing DES string */
> > +	for (int i = 0; i < ti->info.num_groups; i++) {
> > +		struct scmi_telemetry_group *grp = &ti->info.des_groups[i];
> > +		char *buf = grp->des_str;
> > +		size_t bufsize = grp->des_str_sz;
> > +
> > +		for (int j = 0; j < grp->num_de; j++) {
> > +			char term = j != (grp->num_de - 1) ? ' ' : '\0';
> > +			int len;
> > +
> > +			len = snprintf(buf, bufsize, "0x%04X%c",
> > +				       ti->info.des[grp->des[j]]->id, term);
> 
> Please use scnprintf() btw.  Otherwise if there is an overflow the
> next iteration will complain that bufsize is negative.

Yes, I will review all of this.

Thanks,
Cristian

