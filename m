Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BC4FD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6dW9tqfhUfNJnxZ03UfE/DW2B+xHA6p+xbQjEx8Pf8=; b=jul8lw3zUuJXAROufQqBdZ5T0h
	vRQSd455FxvIwUeZl44Hf8AGdP3tTg5YIE83vM/1wVVK5E9hffmqpu6G2iSwVCKbeuSFAEC+9M080
	c6sat5lcpnygTPKVjlAz2GT7bdtnfrNKXF4r7LOmRjPnwHr1I4Ib1k5qJbmyYPoFETKcpfKaImBxA
	MmocPXTNZUzTLsrHJ+wxKnGEcwxx8mGWOkQ0uDrJ7VETYgYLHgUQ0JYt9ma7e78KrwqXjhLDBJVcl
	y+bv4G+OzGTmWbu4wbrRIYsMIRnhkxSJBAtmr+qTnA3X9efIIf9qP4Bd3FLURu1Z8GwgNc5Iu/aNt
	0iNrXWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEap-000000042nf-0gAV;
	Wed, 25 Feb 2026 13:06:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEam-000000042mj-1DgG;
	Wed, 25 Feb 2026 13:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772024764; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=epdV6sfEGGWgxTUxXR+oqoZSQob5OAuSJo/IxQeoiJmS3pQiIkTVSN9yEH8KC3zG22qWQI35fbW9BNRE7buiWsI/FI+0PDME8v6/GBoyI6n2Uvqmjlh6qxhhpjmQ4BmIdA+k3eaQ40qkHXRbuIhebhDyb5J60OvhNGCRkW5uM/o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772024764; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T6dW9tqfhUfNJnxZ03UfE/DW2B+xHA6p+xbQjEx8Pf8=; 
	b=JApQiUWgQPuga1LI9SOPB7AY/Xw6+SCuYlqi+/SEGz0BpUv+HfWIeFoIRkVLndllADmqKbqgaVLWOz1HqTpeGYnSEgw0vupYa0YNhlzdOUWLDhTGqjiIYM5p0VjXndasVjcZ5dgiHAV6ahvbgu9Qe6F2c1HZH48pTaBB1/SpbHE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772024764;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=T6dW9tqfhUfNJnxZ03UfE/DW2B+xHA6p+xbQjEx8Pf8=;
	b=BubcYS0qqWwRPOl105g64yZkIwEjCDwd8SxMH3oqKAKPNAOTaE2y31QAoj2vOMix
	21qTnSjPngc4EFsfl9Bya0v1qpy65ZjUtS/7Ci0ekBX5zjEiJ0f9/IpBCNHfpwQfemE
	+gdnaM2TFkQbGlrVQtKoHZyT8J8cryvaUzbIM8cI=
Received: by mx.zohomail.com with SMTPS id 1772024762844490.7485741503249;
	Wed, 25 Feb 2026 05:06:02 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Peter Wang =?UTF-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v7 16/23] scsi: ufs: mediatek: Clean up logging prints
Date: Wed, 25 Feb 2026 14:05:55 +0100
Message-ID: <2575185.irdbgypaU6@workhorse>
In-Reply-To: <c333898413d249c017430d4ae98bc7be3bf33a64.camel@mediatek.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-16-b5f2907c6da7@collabora.com>
 <c333898413d249c017430d4ae98bc7be3bf33a64.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_050616_361526_25C9DC08 
X-CRM114-Status: GOOD (  18.19  )
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

On Tuesday, 24 February 2026 13:47:28 Central European Standard Time Peter =
Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
> >  drivers/ufs/host/ufs-mediatek.c | 99 ++++++++++++++++++-------------
> > ----------
> >  1 file changed, 43 insertions(+), 56 deletions(-)
> >=20
> > diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-
> > mediatek.c
> > index ecf16e82a326..2b1f26b55782 100644
> > --- a/drivers/ufs/host/ufs-mediatek.c
> > +++ b/drivers/ufs/host/ufs-mediatek.c
> > [... snip ...]
> > @@ -810,11 +806,11 @@ static void ufs_mtk_mcq_set_irq_affinity(struct
> > ufs_hba *hba, unsigned int cpu)
> >  	_cpu =3D (cpu =3D=3D 0) ? 3 : cpu;
> >  	ret =3D irq_set_affinity(irq, cpumask_of(_cpu));
> >  	if (ret) {
> > -		dev_err(hba->dev, "set irq %d affinity to CPU %d
> > failed\n",
> > +		dev_err(hba->dev, "setting irq %d affinity to CPU %d
> > failed\n",
> >  			irq, _cpu);
> >  		return;
> >  	}
> > -	dev_info(hba->dev, "set irq %d affinity to CPU: %d\n", irq,
> > _cpu);
> > +	dev_dbg(hba->dev, "set irq %d affinity to CPU %d\n", irq,
> > _cpu);
> >=20
>=20
> Is it more appropriate to use dev_info for state changes or for setting
> changes?

Is this information a user would want to see in their bootup log in
every case? My understanding right now is no.

> > [... snip ...]
> > @@ -1571,7 +1559,7 @@ static int ufs_mtk_device_reset(struct ufs_hba
> > *hba)
> >  	/* Some devices may need time to respond to rst_n */
> >  	usleep_range(10000, 15000);
> > =20
> > -	dev_info(hba->dev, "device reset done\n");
> > +	dev_dbg(hba->dev, "device reset done\n");
> > =20
>=20
> Is it more appropriate to use dev_info for state changes or for setting
> changes?

Depends on your view of what's useful information for the user.

I can change both of these back to _info if I have to send out a next
revision, just to get this through though.

>=20
> Thanks
> Peter
>=20





