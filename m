Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AD2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WzkG2kKql2JBYpjgx7Vm7J6WiEa1PdHkKVsK+3LgxU=; b=XoVaoAwTC/eb1gG6+GYvdZXeTu
	jd0qcZJUryOJMtNVLFkd6VxFi+Po6wXJwYJpc73G3hHgvt3UFguCSR58eoqTxRDzRRNfopcKEaBFe
	zvInwAVOd6Kf+xXrr7CyvK2xd7SC641sDIasHH01aaRWhnwNlSIFptWaq2zN5DaoxFEX8AE3S8K/W
	5m0sYSCeMsMP/uVm82K5jFh14C02VUTgMhKTxuujYBKScDo5A3iK115lCeFOCEFMndV+0l6pnCINo
	NpSSFImc5m5JelO6dsqNl6SL0oy3S/4C1XS9odFOk+PODOpAWW4+GCB52z0INIQTp2CsRTm2E7nQH
	LrXZylVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5myv-0000000GUby-31Oi;
	Fri, 18 Apr 2025 14:46:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mwz-0000000GUBQ-4BS3;
	Fri, 18 Apr 2025 14:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D387B5C110F;
	Fri, 18 Apr 2025 14:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C04C4CEE2;
	Fri, 18 Apr 2025 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744987455;
	bh=GNhKko1seFHw18Ma89S0NH7KnQgIl9H3ALOI3HIBnDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IRBvSKczkNaeWa3oymabOo6nGXxglDbWbUFLfXy2Std4DBWNzRKIbXG/ciAKTygh8
	 eiN7QKXLBKziiyvYWnHvYOuKFglauFwqaBzx12mt6yqKLHOFJe8rb1VUB8y2Kl74M3
	 vBfaCgGHE8N7BqEJwlVcH+GN3EOZaogxv9aU18hLG3jgvCIvZ1+JOn7HZE9DaBgloU
	 oRlAFoBnbwDoqVo/XzofwhLs+fMI0eP+eD4A1zpMiws/8CmdHGopykOEcuVCyzBG6M
	 9ZYLR7iEB3IlZDuIS9gvpveNkyxaDkIRHxXIytxKhqFU3xHkz5C9du8AsDLJ9pUojM
	 rXJTYcPEi0SoQ==
Date: Fri, 18 Apr 2025 15:44:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin
 Tanislav <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/8] iio: adc: dln2-adc: use aligned_s64 for timestamp
Message-ID: <20250418154407.622af22e@jic23-huawei>
In-Reply-To: <494ee0cc5be01cb6a4db29d7f1a11dcee22850d6.camel@gmail.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-1-eafac1e22318@baylibre.com>
	<494ee0cc5be01cb6a4db29d7f1a11dcee22850d6.camel@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_074418_090526_125DFF4D 
X-CRM114-Status: GOOD (  17.71  )
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

On Fri, 18 Apr 2025 09:58:04 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-04-17 at 11:52 -0500, David Lechner wrote:
> > Follow the pattern of other drivers and use aligned_s64 for the
> > timestamp. This will ensure the struct itself it also 8-byte aligned.
> >=20
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > --- =20
>=20
> With the fixes tag:
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
This one was in my series... Admittedly without a fixes tag.  :(

I've added a tag to that patch given I'd not pushed it out yet.
Fixes: 7c0299e879dd ("iio: adc: Add support for DLN2 ADC")

>=20
> > =C2=A0drivers/iio/adc/dln2-adc.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
> > index
> > a1e48a756a7b519105393f77c4aebde1f2f85d50..359e26e3f5bcfe16d723f621bdfc0=
1df2dfcf6a9
> > 100644
> > --- a/drivers/iio/adc/dln2-adc.c
> > +++ b/drivers/iio/adc/dln2-adc.c
> > @@ -466,7 +466,7 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void=
 *p)
> > =C2=A0	struct iio_dev *indio_dev =3D pf->indio_dev;
> > =C2=A0	struct {
> > =C2=A0		__le16 values[DLN2_ADC_MAX_CHANNELS];
> > -		int64_t timestamp_space;
> > +		aligned_s64 timestamp_space;
> > =C2=A0	} data;
> > =C2=A0	struct dln2_adc_get_all_vals dev_data;
> > =C2=A0	struct dln2_adc *dln2 =3D iio_priv(indio_dev);
> >  =20
>=20


