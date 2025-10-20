Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E28CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyNJEwUFyvycmMa+coiltSzlAZF56ZzHC7M1saBhp58=; b=d2N5HQ2oE/F9l31XS7id5DEdcc
	kz1JayD4CkSDH0ZpLe6w/8aaN4WJKezZSVC/0qoA/wInxPJWOANxvKYHm+fro2m7inG8KVj4+z46z
	f91YzhFzwiKYDNQrUaM+N0u2aD5tPZFFiy6cbv9PAa1JGqsjaAKbGnUUQ8hkNiuNzrsFAOPb9SD+T
	jlLuVWAZi2ES+9k3XXqQrGRlK/qGRyKh8F+xJMTRUmAHzymY7knor589zrAa907EOCY7pc8BDDN6p
	MAw4k1JB384M9sgHUwp/XxJ9hTvXniIc08AgBXF2bF7l1dMQcFsdr84II32E9OoFR4mFFBN4Lio0A
	JXqZxt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlYb-0000000CSEj-1dHj;
	Mon, 20 Oct 2025 08:47:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlYY-0000000CSDp-0gYi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 08:47:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5031F91;
	Mon, 20 Oct 2025 01:47:41 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61F4A3F63F;
	Mon, 20 Oct 2025 01:47:48 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:47:45 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] firmware: arm_scmi: transport: Add ACPI PCC transport
Message-ID: <aPX3MQwjB2PchQqT@bogus>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
 <20251017-acpi_scmi_pcc-v1-7-0adbab7709d9@arm.com>
 <aPXwuEebbjEJHmc5@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPXwuEebbjEJHmc5@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_014754_259834_5BAF2A72 
X-CRM114-Status: GOOD (  12.69  )
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

On Mon, Oct 20, 2025 at 11:20:08AM +0300, Dan Carpenter wrote:
> On Fri, Oct 17, 2025 at 02:23:50PM +0100, Sudeep Holla wrote:
> > +static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> > +			  bool tx)
> > +{
> > +	const char *desc = tx ? "Tx" : "Rx";
> > +	struct device *cdev = cinfo->dev;
> > +	struct scmi_pcc *smbox;
> > +	int ret, ss_id;
> > +	struct mbox_client *cl;
> > +
> > +	smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
> > +	if (!smbox)
> > +		return -ENOMEM;
> > +
> > +	cl = &smbox->cl;
> > +	cl->dev = cdev;
> > +	cl->tx_prepare = tx ? tx_prepare : NULL;
> > +	cl->rx_callback = rx_callback;
> > +	cl->tx_block = false;
> > +
> > +	ss_id = pcc_get_ss_id(cinfo->id, tx);
> > +	if (ss_id < 0)
> > +		return ss_id;
> > +
> > +	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> > +	if (IS_ERR(smbox->pchan)) {
> > +		ret = PTR_ERR(smbox->pchan);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(cdev,
> > +				"failed to request SCMI %s mailbox\n", desc);
> > +		return ret;
> > +	}
> 
> Use the dev_err_probe() function for this:
> 
> 	smbox->pchan = pcc_mbox_request_channel(cl, ss_id);
> 	if (IS_ERR(smbox->pchan)
> 		return dev_err_probe(cdev, PTR_ERR(smbox->pchan),
> 				     "failed to request SCMI %s mailbox\n",
> 				     desc);
> 

Good point, every time when review I think of it but apparently not when
writing code myself 😁, will fix it. Thanks!

-- 
Regards,
Sudeep

