Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FADCCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sf/9cuAQWvHRb3L2O5TxRXL1EAnB9o+AVNql3iH34KE=; b=Kv4u1RTrQg/pcDInSHlBuUU/PI
	qM7814+bqZx+H2LzeiSw+gGq1g96Wha4F3IPDoScsM0ek2FPhKzju6FhJF/olDyGQlRZO0CKJlY1B
	jOVj6hu2B+Uj2Kj/VYUJs8qysP6LBAW5klSwUkl6u/UqkXEvZzIgi541f3jwitQYAnkVjd4FPYj17
	3SxazWOu2NZEQq7BBvmcGpytatrDOqG/itroip3h3L+h3DGzNPqptIVoOk2jB4oQ/J5NRPH3QHu1f
	FhOHbXOC/Gd58sw+SSZkjW+AKTSsp+YkuTrAy1DivIscbMCaMPpEWfRXIsljCAfJGeUOI3t0YGcmN
	71V5KpjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKQd-00000001dvZ-3GYf;
	Tue, 19 May 2026 13:24:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKQc-00000001dv4-45Ju
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 13:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sf/9cuAQWvHRb3L2O5TxRXL1EAnB9o+AVNql3iH34KE=; b=Km7GxW033PcmHDokJKOOD78lRM
	1vcJCOcb/R4wmZ4x4EM3XemSg04sTpXln6HsmYhjuXSrndhzVbB7ARkrksOY1pPqe1HL2zUyfXdB+
	HJs/QOWDLSfa4D6L+BCOkuGzuTV7gK7lvK7D8fpTnVC91bLMQON0NE+rjJyt9OdHnpIZGT8DYa3hb
	si29WtemYKkeUbhSV7W9EQxWDZ9x8WeyXHTT2jvobAFXxRjh18bHTF8HrphXjTg6Yl1LO+priQT49
	cU3hhgkDkuMc/HaUIg6bAu3QanelvUQZ0pwMJMYrlza2RAoZjCGzuPgd5qxZgx9/lGM9tHEySByu4
	gPbdN2KA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKQZ-0000000ELVD-2rKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4089D4187E;
	Tue, 19 May 2026 13:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04D1C2BCB3;
	Tue, 19 May 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779197044;
	bh=PZZJ6SOKuUxHZpyq6LUq7dCXr8g2wg+VuBzmFpl3peI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy3qhRPE0kwucGzTZ5je5NXgokjk8/Zv9Frs9e9EGQw/42l8TaCWYTM1Un3pBLmes
	 IxMfYmREtySiIclSUp0XCA2GLRQGZfsX8KhGl0LcXEBTqDCyDsALDeuDUr+ULnQPMb
	 UENcoUUjawY0D0lqHVR8u2kIgBKKHDdpexWwf9ThGMSVGLI68tOS+JN/nYoSq2lcwK
	 YJdIGbgUliYpxvY6HbR4DMHbogCo1TGhSL/gsCgZhTKq873nt0/qQk6bARH+Af6LxJ
	 Cy/BOBjkTz7J81PdQwPWKduq2CvVPZuoHNxU/5KPmLxnBzeClPaIEJCF7DfBUMlqMl
	 uK2trvp0oqIBA==
Date: Tue, 19 May 2026 14:23:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
Message-ID: <20260519-inquisitive-teal-yak-56abd1@sudeepholla>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_142408_333815_8076EFB0 
X-CRM114-Status: GOOD (  29.82  )
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

On Mon, May 18, 2026 at 03:30:06PM -0400, Adam Young wrote:
> The tx_done callback function has a return code (rc) parameter
> that the tx_done callback can use to determine how to handle an error.
> However the IRQ handler was not setting that value if there is an error.
> 
> The following clients are affected:
> 
> drivers/acpi/cppc_acpi.c
> drivers/i2c/busses/i2c-xgene-slimpro.c
> drivers/hwmon/xgene-hwmon.c
> drivers/soc/hisilicon/kunpeng_hccs.c
> drivers/devfreq/hisi_uncore_freq.c
> 
> All of these only use the error code to report, so they
> are expecting an error code to come thorugh, but they
> do not modify behavior based on this code.
> 
> In the case of an error code in the IRQ, the handler was returning
> IRQ_NONE which is not correct:  the IRQ handler was matched
> to the IRQ.  This mean that multiple error codes returned from
> a PCC triggered interrupt would end up disabling the device.
> 
> In addition, if the error code IRQ was coming from a Type4 Device that was
> expecting an IRQ response, that device would then be hung.
> 
> Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
> 
> ---
> ---
>  drivers/mailbox/pcc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db7..16b9ce087b9e 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  {
>  	struct pcc_chan_info *pchan;
>  	struct mbox_chan *chan = p;
> +	int rc;
>  
>  	pchan = chan->con_priv;
>  
> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	if (!pcc_mbox_cmd_complete_check(pchan))
>  		return IRQ_NONE;
>  
> -	if (pcc_mbox_error_check_and_clear(pchan))
> -		return IRQ_NONE;
> +	rc = pcc_mbox_error_check_and_clear(pchan);

I think we may have to skip the check inside pcc_mbox_error_check_and_clear()
for Type 4 channel as the spec expects OSPM to ignore it. It is a separate
fix, just noting that here.

>  
>  	/*
>  	 * Clear this flag after updating interrupt ack register and just
> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	 * required to avoid any possible race in updatation of this flag.
>  	 */
>  	pchan->chan_in_use = false;
> -	mbox_chan_received_data(chan, NULL);
> -	mbox_chan_txdone(chan, 0);
> +	if (!rc)
> +		mbox_chan_received_data(chan, NULL);

Not sure if making this conditional is good as some platforms may expect
it to move the state machine, I am not sure 100% just thinking aloud here.

-- 
Regards,
Sudeep

