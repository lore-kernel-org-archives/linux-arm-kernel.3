Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E223C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84c6lcHumFFzr+dYNe17i6pcmgg5iEfbD5LAN8CFBA8=; b=0iOxSMM3Y+tEPNl/Pk5X9TBgXO
	7nt+HxofqHLMr07+1YKUUxN2TQUShkRF9Gh+UhFh9axWDrjU0s+SNyUvenMFkFb8uUWmZ6U/1+WSF
	lzTGsgS+Mx7ed0N76NwaiiNf+veMXb1TZEmnMdBNl2vzeAgdO6nTB13iogBOGcWsO4UnSivX7KDH8
	VU6dBqpEcURzhCLfzDkqZo0uSWSoOwsTPF2iiFNUnJ1mTWij9qCvJUDUazbrR7aawvytAZD6SWRZt
	wAtkjKRuAJdz6Tipw47slsGNBKIA2CBJSJb8lUIxUV50WyvgvLh+wN5bLNTPHi4dCuWg17ms3UpK3
	2aKYAEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf10b-00000008Fqz-2AXV;
	Thu, 24 Jul 2025 18:49:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexvq-00000007tW6-0EQp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 15:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AB7444757;
	Thu, 24 Jul 2025 15:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70797C4CEED;
	Thu, 24 Jul 2025 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753371149;
	bh=pL9X6wBVQbvY3/cwyyVMcF73RrjD7dKiLTM7koIBeFk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OibhsSLgypSM5xeL5fgwkJ3cMf4Rj/60CVbD+4XRnxQiMz9i9Xspun4kfhRz2tDKN
	 NuuTfFwGzs5EhQGJ/mgGL9y+yLd7iNs/edoPpD3NzbwM7gjjEQp3pYY/89S+yFbXdi
	 Te0BEdFSqlUq8FpgPCtPN1IeAz0ii6jWNjYGoqplIRdqD6plynRdgmuDzwMUEr6ENm
	 t9SrbB2hqt/WKCY6hvq24cJmYTwhAxrfwFlCcmEPhkzB02K+C4OSB5Jhg+PRiN5rx6
	 qKFBjx11EYeS6f1eZuNLnbHucFCjJ6dPPl2VNmgtAc1dt5Y2Wced2casLXhapg4m0H
	 2hEdr4SmbKCaw==
Date: Thu, 24 Jul 2025 16:32:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Andy Shevchenko <andy@kernel.org>, Manish Narani
 <manish.narani@xilinx.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: xilinx-ams: Unmask interrupts after updating
 alarms
Message-ID: <20250724163219.0098ced6@jic23-huawei>
In-Reply-To: <20250715002847.2035228-1-sean.anderson@linux.dev>
References: <20250715002847.2035228-1-sean.anderson@linux.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_083230_137314_2E0FE874 
X-CRM114-Status: GOOD (  24.86  )
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

On Mon, 14 Jul 2025 20:28:47 -0400
Sean Anderson <sean.anderson@linux.dev> wrote:

> To convert level-triggered alarms into edge-triggered IIO events, alarms
> are masked when they are triggered. To ensure we catch subsequent
> alarms, we then periodically poll to see if the alarm is still active.
> If it isn't, we unmask it. Active but masked alarms are stored in
> current_masked_alarm.
> 
> If an active alarm is disabled, it will remain set in
> current_masked_alarm until ams_unmask_worker clears it. If the alarm is
> re-enabled before ams_unmask_worker runs, then it will never be cleared
> from current_masked_alarm. This will prevent the alarm event from being
> pushed even if the alarm is still active.
> 
> Fix this by recalculating current_masked_alarm immediately when enabling
> or disabling alarms.
> 
> Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
Anand?  

This seems fine to me, but I'm not that familiar with the hardware or driver.

> 
>  drivers/iio/adc/xilinx-ams.c | 45 ++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
> index 76dd0343f5f7..180d4140993d 100644
> --- a/drivers/iio/adc/xilinx-ams.c
> +++ b/drivers/iio/adc/xilinx-ams.c
> @@ -389,6 +389,29 @@ static void ams_update_pl_alarm(struct ams *ams, unsigned long alarm_mask)
>  	ams_pl_update_reg(ams, AMS_REG_CONFIG3, AMS_REGCFG3_ALARM_MASK, cfg);
>  }
>  
> +static void ams_unmask(struct ams *ams)
> +{
> +	unsigned int status, unmask;
> +
> +	status = readl(ams->base + AMS_ISR_0);
> +
> +	/* Clear those bits which are not active anymore */
> +	unmask = (ams->current_masked_alarm ^ status) & ams->current_masked_alarm;
> +
> +	/* Clear status of disabled alarm */
> +	unmask |= ams->intr_mask;
> +
> +	ams->current_masked_alarm &= status;
> +
> +	/* Also clear those which are masked out anyway */
> +	ams->current_masked_alarm &= ~ams->intr_mask;
> +
> +	/* Clear the interrupts before we unmask them */
> +	writel(unmask, ams->base + AMS_ISR_0);
> +
> +	ams_update_intrmask(ams, ~AMS_ALARM_MASK, ~AMS_ALARM_MASK);
> +}
> +
>  static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
>  {
>  	unsigned long flags;
> @@ -401,6 +424,7 @@ static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
>  
>  	spin_lock_irqsave(&ams->intr_lock, flags);
>  	ams_update_intrmask(ams, AMS_ISR0_ALARM_MASK, ~alarm_mask);
> +	ams_unmask(ams);
>  	spin_unlock_irqrestore(&ams->intr_lock, flags);
>  }
>  
> @@ -1035,28 +1059,9 @@ static void ams_handle_events(struct iio_dev *indio_dev, unsigned long events)
>  static void ams_unmask_worker(struct work_struct *work)
>  {
>  	struct ams *ams = container_of(work, struct ams, ams_unmask_work.work);
> -	unsigned int status, unmask;
>  
>  	spin_lock_irq(&ams->intr_lock);
> -
> -	status = readl(ams->base + AMS_ISR_0);
> -
> -	/* Clear those bits which are not active anymore */
> -	unmask = (ams->current_masked_alarm ^ status) & ams->current_masked_alarm;
> -
> -	/* Clear status of disabled alarm */
> -	unmask |= ams->intr_mask;
> -
> -	ams->current_masked_alarm &= status;
> -
> -	/* Also clear those which are masked out anyway */
> -	ams->current_masked_alarm &= ~ams->intr_mask;
> -
> -	/* Clear the interrupts before we unmask them */
> -	writel(unmask, ams->base + AMS_ISR_0);
> -
> -	ams_update_intrmask(ams, ~AMS_ALARM_MASK, ~AMS_ALARM_MASK);
> -
> +	ams_unmask(ams);
>  	spin_unlock_irq(&ams->intr_lock);
>  
>  	/* If still pending some alarm re-trigger the timer */


