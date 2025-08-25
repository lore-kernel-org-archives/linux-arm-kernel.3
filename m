Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9580ECA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5dcga0EHhcXJEXP2fihUBPBXwLy6dSXtW4R0XbiMWA=; b=dw9lwKHjLguFYcYXRyFY2dhcVk
	VhT8Al+cqedsppZVL67Sg0KmN405pk+NdEOZm9rdozmo59tFVS46QuINXKha9TFZTDWN329LNorDz
	BxcTnCSmAvTutHnMq3gAk2ZM3ktX8UV9rIcZPXgE7WpgrIIq0CrG+bJzdijJBvgfzwoUybzoX/mh0
	LDJtLqpA+s/dehjtg0+E7LGl3VF/8XxqQNxn2AxngBfquBtM+3ZbxE6wAR8hDIw3OXZUFFhhPk5Ip
	GLfFosYJz9Fs5iyJEMd62mxp1yf709Iax/pjuRnHLo2CFlPSq/9BfxyW9AI5Li9/onyC1at5UYO3Y
	A6Usml/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWga-00000007yKY-0OzU;
	Mon, 25 Aug 2025 12:52:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVIQ-00000007jGF-3Esj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D437C6024D;
	Mon, 25 Aug 2025 11:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65378C4CEED;
	Mon, 25 Aug 2025 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756121008;
	bh=YLuNmgSadAAEa3ZPFUF8jemmpIic3MiIIXQgw34LGCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bs1rW+FWDWAleftJfB7xKa9mjQQdPJNZ/Zzp4ntGcsViBYLF6U0gI0zKbK3YLazYz
	 7alACQs4GSarDiHQQKACslPn1mvRer+tqybHgrb+eOK0lxvvNqafRXqIqIvrVQiVXH
	 TLdY2St9l3iQZiF5yu1UcpLW91NOphcvJYwwQzdfQWiuFx7/nk8q4QlisJgssHyQTF
	 njPc3JWQu+B23QGe4xzXLfp0wgwXSTTy+hFCcq0zorsQzW4Ebdr59TuP3xe9zJoxnd
	 c/x2bdkb5sWqF5tetlYapWoUcHE4qNiNzLThxc41foH2pJ4HLMJsYBVctTonKpCOjh
	 YUUlHexCWNQsw==
Date: Mon, 25 Aug 2025 12:23:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "O'Griofa, Conall" <conall.ogriofa@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Simek, Michal"
 <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>, Manish Narani
 <manish.narani@xilinx.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iio: xilinx-ams: Unmask interrupts after updating
 alarms
Message-ID: <20250825122319.6faf8782@jic23-huawei>
In-Reply-To: <MN2PR12MB42237EC0AA00D05DE52F8C988B33A@MN2PR12MB4223.namprd12.prod.outlook.com>
References: <20250715002847.2035228-1-sean.anderson@linux.dev>
	<MN2PR12MB42237EC0AA00D05DE52F8C988B33A@MN2PR12MB4223.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 20 Aug 2025 11:28:27 +0000
"O'Griofa, Conall" <conall.ogriofa@amd.com> wrote:

> Hi,
>=20
> Looks good, thank you for taking the time to submit this patch.
Applied to the fixes-togreg branch of iio.git and marked for stable.

Thanks,

Jonathan

>=20
> Cheers,
> Conall.
>=20
> > -----Original Message-----
> > From: Sean Anderson <sean.anderson@linux.dev>
> > Sent: 15 July 2025 01:29
> > To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>; Jonathan Cameron
> > <jic23@kernel.org>; linux-iio@vger.kernel.org
> > Cc: David Lechner <dlechner@baylibre.com>; Nuno S=C3=A1 <nuno.sa@analog=
.com>;
> > linux-arm-kernel@lists.infradead.org; Simek, Michal <michal.simek@amd.c=
om>;
> > Andy Shevchenko <andy@kernel.org>; Manish Narani
> > <manish.narani@xilinx.com>; linux-kernel@vger.kernel.org; Sean Anderson
> > <sean.anderson@linux.dev>
> > Subject: [PATCH] iio: xilinx-ams: Unmask interrupts after updating alar=
ms
> >=20
> > To convert level-triggered alarms into edge-triggered IIO events, alarm=
s are masked
> > when they are triggered. To ensure we catch subsequent alarms, we then
> > periodically poll to see if the alarm is still active.
> > If it isn't, we unmask it. Active but masked alarms are stored in
> > current_masked_alarm.
> >=20
> > If an active alarm is disabled, it will remain set in current_masked_al=
arm until
> > ams_unmask_worker clears it. If the alarm is re-enabled before
> > ams_unmask_worker runs, then it will never be cleared from
> > current_masked_alarm. This will prevent the alarm event from being push=
ed even if
> > the alarm is still active.
> >=20
> > Fix this by recalculating current_masked_alarm immediately when enablin=
g or
> > disabling alarms.
> >=20
> > Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> > ---
> >=20
> >  drivers/iio/adc/xilinx-ams.c | 45 ++++++++++++++++++++----------------
> >  1 file changed, 25 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.=
c index
> > 76dd0343f5f7..180d4140993d 100644
> > --- a/drivers/iio/adc/xilinx-ams.c
> > +++ b/drivers/iio/adc/xilinx-ams.c
> > @@ -389,6 +389,29 @@ static void ams_update_pl_alarm(struct ams *ams,
> > unsigned long alarm_mask)
> >  	ams_pl_update_reg(ams, AMS_REG_CONFIG3,
> > AMS_REGCFG3_ALARM_MASK, cfg);  }
> >=20
> > +static void ams_unmask(struct ams *ams) {
> > +	unsigned int status, unmask;
> > +
> > +	status =3D readl(ams->base + AMS_ISR_0);
> > +
> > +	/* Clear those bits which are not active anymore */
> > +	unmask =3D (ams->current_masked_alarm ^ status) &
> > +ams->current_masked_alarm;
> > +
> > +	/* Clear status of disabled alarm */
> > +	unmask |=3D ams->intr_mask;
> > +
> > +	ams->current_masked_alarm &=3D status;
> > +
> > +	/* Also clear those which are masked out anyway */
> > +	ams->current_masked_alarm &=3D ~ams->intr_mask;
> > +
> > +	/* Clear the interrupts before we unmask them */
> > +	writel(unmask, ams->base + AMS_ISR_0);
> > +
> > +	ams_update_intrmask(ams, ~AMS_ALARM_MASK,
> > ~AMS_ALARM_MASK); }
> > +
> >  static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask=
)  {
> >  	unsigned long flags;
> > @@ -401,6 +424,7 @@ static void ams_update_alarm(struct ams *ams, unsig=
ned
> > long alarm_mask)
> >=20
> >  	spin_lock_irqsave(&ams->intr_lock, flags);
> >  	ams_update_intrmask(ams, AMS_ISR0_ALARM_MASK, ~alarm_mask);
> > +	ams_unmask(ams);
> >  	spin_unlock_irqrestore(&ams->intr_lock, flags);  }
> >=20
> > @@ -1035,28 +1059,9 @@ static void ams_handle_events(struct iio_dev
> > *indio_dev, unsigned long events)  static void ams_unmask_worker(struct
> > work_struct *work)  {
> >  	struct ams *ams =3D container_of(work, struct ams, ams_unmask_work.wo=
rk);
> > -	unsigned int status, unmask;
> >=20
> >  	spin_lock_irq(&ams->intr_lock);
> > -
> > -	status =3D readl(ams->base + AMS_ISR_0);
> > -
> > -	/* Clear those bits which are not active anymore */
> > -	unmask =3D (ams->current_masked_alarm ^ status) & ams- =20
> > >current_masked_alarm; =20
> > -
> > -	/* Clear status of disabled alarm */
> > -	unmask |=3D ams->intr_mask;
> > -
> > -	ams->current_masked_alarm &=3D status;
> > -
> > -	/* Also clear those which are masked out anyway */
> > -	ams->current_masked_alarm &=3D ~ams->intr_mask;
> > -
> > -	/* Clear the interrupts before we unmask them */
> > -	writel(unmask, ams->base + AMS_ISR_0);
> > -
> > -	ams_update_intrmask(ams, ~AMS_ALARM_MASK,
> > ~AMS_ALARM_MASK);
> > -
> > +	ams_unmask(ams);
> >  	spin_unlock_irq(&ams->intr_lock);
> >=20
> >  	/* If still pending some alarm re-trigger the timer */
> > --
> > 2.35.1.1320.gc452695387.dirty =20
>=20
> Reviewed-by: O'Griofa, Conall <conall.ogriofa@amd.com>


