Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69757606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KfpYRxyU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5RHEjXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q4JV/p8yAsWJM87e2NSRQvq77nvu7u4Q4arA+NaEhHA=; b=KfpYRxyUKaY0vfIWMKZrE7r4Db
	uBzSyu0hOKy44XrjPnkqsynLFi8SSl9L2Cxk4X5TtGnSwvLYSFmO/VuhcuGK8MyMlsQL5cOZ1ddRB
	70MRVltIiAbGHjebkEOPRrHTp26144nztDLSfxZQr9rC3MlvoaLOIhIxPq28jXA2mOfH9zk7Muq8l
	ythJnMx9Dl01EtbJ8GYJpX8OfsL0H36SNzBXzX3c+yK/wGBgbGI6RmnT/8gKpLe9pnJ3yRGwdvfxT
	IOHFmUSCn30B96izM22vQJnEFrs4Kn58uJ5BccVT5Fxzxm0ognwedRt2wsm+HzbQlStdvOUV/0ZOL
	EeLbq1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoh3-0000000G5M7-41zu;
	Mon, 02 Nov 2026 09:51:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoh2-0000000G5Ls-3m3h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 160D060F3A;
	Mon,  2 Nov 2026 09:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E15D1F000C1;
	Mon,  2 Nov 2026 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613067;
	bh=q4JV/p8yAsWJM87e2NSRQvq77nvu7u4Q4arA+NaEhHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S5RHEjXRv4hz1bBWgTG1B80sGbqis6qCJYXHffrydGcZAhsK47mDSD+iJIIkuxxPf
	 M89T3qLakKRL8kFscmJNOHvIX19O+fA1jNzPRjrYu5F34n8Gz9OWM9hk38ZB3iZ4+d
	 rxfuNWO8ElO7f8oq34KGZrWoRJ52SiBJUSJGh5Btn214pBNMlsxrUkh34rR1CDYOLi
	 V2gdofEkQONAy7aZYVZo77hRQ60SpKK/EJqua8xJ3qSqAdqVYTPd6AouogWVKGyLfy
	 6sSD6db24hceyNWUSN1bBBHR7BXoXKRvYZspoCpkxpeXom7WQtYKlCTGQQ/7VqJb4Z
	 +W28Ybo4iDNQQ==
Date: Mon, 2 Nov 2026 09:51:04 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control
 response size
Message-ID: <20261102-kickass-formidable-beluga-5eacbe@sudeepholla>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
 <auPDK9bG/H8GTOK5@e121740.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auPDK9bG/H8GTOK5@e121740.arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:05:31PM +0000, Philip Radford wrote:
> On Wed, Oct 28, 2026 at 01:05:01PM +0000, Sudeep Holla wrote:
> > scmi_imx_misc_ctrl_get() uses @num to report the number of
> > values returned by firmware, but it did not retain the caller's value
> > as the capacity of @val.
> > 
> 
> Hi,
> 
> > A response with more values than the caller allocated was copied into
> > @val unchecked. For example, the MQS regmap callback supplies storage
> > for one value. Retain the input capacity and reject responses exceeding
> > it before copying, then update @num only after a successful copy.
> > 
> > Document the in/out @num contract of the exported helper.
> > 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
> > Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c  | 16 ++++++++++++----
> >  include/linux/firmware/imx/sm.h                  |  6 ++++++
> >  2 files changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > index 0c708b2dd496..f00f7acba845 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> > @@ -273,10 +273,16 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
> >  {
> >  	struct scmi_imx_misc_ctrl_get_out *out;
> >  	struct scmi_xfer *t;
> > +	u32 num_values, max_values;
> >  	int ret, i;
> >  	int max_msg_size = ph->hops->get_max_msg_size(ph);
> >  	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
> >  
> > +	if (!num || !val || !*num)
> > +		return -EINVAL;
> > +
> > +	max_values = *num;
> > +
> >  	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
> >  	if (ret)
> >  		return ret;
> > @@ -290,16 +296,18 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
> >  	ret = ph->xops->do_xfer(ph, t);
> >  	if (!ret) {
> >  		out = t->rx.buf;
> > -		*num = le32_to_cpu(out->num);
> > +		num_values = le32_to_cpu(out->num);
> >  
> > -		if (*num >= max_num ||
> > -		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> > +		if (num_values > max_values || num_values >= max_num ||
> > +		    num_values * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> >  			ph->xops->xfer_put(ph, t);
> >  			return -EINVAL;
> >  		}
> 
> Why does num_values have to be less than max_num, can it not be equal to? Isn't max_num
> already smaller than max_msg_size due to the initialisation above?
> 

Good question, I didn't look at that logic as I blindly retained the existing
logic from `*num >= max_num` to `num_values >= max_num`.

The scmi_imx_misc_ctrl_eet() see to allow value equal to max_num. It could
have been overlooked when we reviewed initially.

Peng, thoughts ?

-- 
Regards,
Sudeep

