Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37147CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Onv5GMtYMYGqIc0NXOj7zeKBHzwqXBjAsiz/y0d7YZA=; b=dLCWeG5Iuv9tQR088GUuSaeH3x
	PHCiGkDENtY0xJz9DiY2ptF79Rdh4hyl/7xiBa7Jv+eATzW7Dd7zwujyB2EdGtEJiPwp21aAuLpN6
	z5FhNq1DXAtcqDGPRHqlC17l3gzN5bPgsBYatoiRkFHGBd6pK0YanJU9MdiNHyAuMt1SUj1LKEqIT
	30K+89sQ8AP87HN5mBSa/pz77HRNAcOacFSsq7BKLFHo3f0e1o8Y3w3sKpQ0Ao8mEXYRmIHY16d61
	FH5K3B88uOmiE8KHgNGOn52KWntHClVW9s5bWUDq30WOUcTVT/oKgbtsW2gBzZ8G8U7AIZIXmx7kc
	m0e1XSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNGE-00000002Dv1-0P7z;
	Tue, 19 May 2026 16:25:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNGC-00000002DuS-0raE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 16:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 306F960145;
	Tue, 19 May 2026 16:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18973C2BCC9;
	Tue, 19 May 2026 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207934;
	bh=A8Im1bNcESttGU6wM6vV6hVj+DqKwcO+0RA9AjCYEqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ea0Vue0oFYz82kIdNJzi/3LvqzJJ0xs5CpRQYpcyFaehI4kv7iZUN/QomE8atbhon
	 McfAaKg83dNbTZJyifkrHLV2PXjz8VuAUQGLznJCnwvetUehVZqdopAALV0fX7yJZ1
	 mMhwVdQiiP4BNQghG2q8qsiD1kc0dN4DroS91o1H9wfxl11blTatRG8PPt6ffnmHZc
	 wDk0hN3m/vfQgfykhVkC+pQWkx2T09ER4fzEKHsjTwlEx2JHMG6w2zd+Ef2sE76dvI
	 HD8xBpj8H+2NYcDFqyYL5EjQepSW1pQq126Cyz+HmKeuFh8LbY0ARh0Jo65bGENwew
	 pN/jlBzwqsx4w==
Date: Tue, 19 May 2026 17:25:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: Adam Young <admiyo@os.amperecomputing.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
Message-ID: <20260519-outgoing-rough-fox-04daab@sudeepholla>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
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

On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:
> 
> On 5/19/2026 3:30 AM, Adam Young wrote:
> > The tx_done callback function has a return code (rc) parameter
> > that the tx_done callback can use to determine how to handle an error.
> > However the IRQ handler was not setting that value if there is an error.
> > 
> > The following clients are affected:
> > 
> > drivers/acpi/cppc_acpi.c
> > drivers/i2c/busses/i2c-xgene-slimpro.c
> > drivers/hwmon/xgene-hwmon.c
> > drivers/soc/hisilicon/kunpeng_hccs.c
> > drivers/devfreq/hisi_uncore_freq.c
> > 
> > All of these only use the error code to report, so they
> > are expecting an error code to come thorugh, but they
> > do not modify behavior based on this code.
> > 
> > In the case of an error code in the IRQ, the handler was returning
> > IRQ_NONE which is not correct:  the IRQ handler was matched
> > to the IRQ.  This mean that multiple error codes returned from
> > a PCC triggered interrupt would end up disabling the device.
> > 
> > In addition, if the error code IRQ was coming from a Type4 Device that was
> > expecting an IRQ response, that device would then be hung.
> > 
> > Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
> Not fix above commit.
> mbox_chan_txdone() was added in below patch.
> Fixes: 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler)
> > Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
> > 
> > ---
> > ---
> >   drivers/mailbox/pcc.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> > index 636879ae1db7..16b9ce087b9e 100644
> > --- a/drivers/mailbox/pcc.c
> > +++ b/drivers/mailbox/pcc.c
> > @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >   {
> >   	struct pcc_chan_info *pchan;
> >   	struct mbox_chan *chan = p;
> > +	int rc;
> >   	pchan = chan->con_priv;
> > @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >   	if (!pcc_mbox_cmd_complete_check(pchan))
> >   		return IRQ_NONE;
> > -	if (pcc_mbox_error_check_and_clear(pchan))
> > -		return IRQ_NONE;
> > +	rc = pcc_mbox_error_check_and_clear(pchan);
> 
> I think it is not necessary. This function just return -EIO on failure.
> 
> >   	/*
> >   	 * Clear this flag after updating interrupt ack register and just
> > @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >   	 * required to avoid any possible race in updatation of this flag.
> >   	 */
> >   	pchan->chan_in_use = false;
> > -	mbox_chan_received_data(chan, NULL);
> > -	mbox_chan_txdone(chan, 0);
> > +	if (!rc)
> > +		mbox_chan_received_data(chan, NULL);
> > +	mbox_chan_txdone(chan, rc);
> @Sudeep, I have always had doubts about the addition of this line of code in
> the
>  commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler).
> The patch seems to avoid the timeouts in the mailbox core according to its
> commit log.
> Regardless of whether the command succeeds or fails, each mbox client
> driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible to
> call mbox_chan_txdone() to tell mailbox core.

Few controller drivers do have mbox_chan_txdone(), so Tx complete is detected
by PCC, so not sure why you think this is not the right place to do. The irq
is to indicate the completion. I am confused as why you think otherwise.
It is defined in include/linux/mailbox_controller.h for the same reason.

The client drivers can you mbox_client_txdone() if they wish to as defined
in include/linux/mailbox_client.h

> This is done after executing mbox_chan_received_data(). So I think this line
> in this function is redundant.

No, I think otherwise, see details above.

-- 
Regards,
Sudeep

