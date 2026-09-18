Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A06C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrF5NSzar5jv65m2jp9XTBtvCU5/5PF93POgQGb8pAQ=; b=rbxeh3j05IqI+ieWqgmN5fdKQr
	XhVFNmz4lDDMvbbsSkv1yY7fzBHmAjoCg2m7QMxwbEttRJC6eFmPIbc5ig1d76DtpEZGJC5L3we2X
	xaYvo4A7MzZDiXzh1mk9Q3UCsVE0O74AJfL/y1WTQd1xF6iTwsE/NKHUgrk61cWT/HKYnxkgSHfSu
	3vktqUODbkZ7yaLnB2zNKWHkt858qPMe9bTa3nqVDj69KQEvB5XJuIrTGgW/pqrmTktxH8H3UDdF3
	PaB20EPKVuNR0cxBRMeo+4/DZ0PixvTi5pHuSwbU7HSQN0SVRS8bOeY4EbDCgLR/B7R4MsT0bpd69
	QaxZusIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7fNC-0000000FWaC-0w3h;
	Fri, 18 Sep 2026 20:39:54 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7fN9-0000000FWZb-22Fk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 20:39:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so7302525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789763989; x=1790368789; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrF5NSzar5jv65m2jp9XTBtvCU5/5PF93POgQGb8pAQ=;
        b=Klyfr3/2KMMrs0xkhMksgR78a5sz2OZ3LiQlxqnwlQXhBad3HT9iytmzAPT4HQ9tX5
         Zn3oDTakK0bZnH8/YcUtd30cxa45G0L3uDHYI32HAujkRl1gdeP91Mg+cJs2XvYnUzjs
         bXCvdzdY4VP5LVLoips4pbjljWL+WO57O8fvu37noVxtXVcuJpO4eb689uM4lIzoRhxf
         iZZXStd/f0lsiMQqRgApRHZ7x4DxmpHMOtGqQTCbCA0sdJ3gqJm+tegZk5rBk8VW9E43
         2lyXdLmHBhfdZlh4pKDZeA3VY6/891JhPkEUr3Cp39qVeeEbWeCLiV0K83CvSIc1xRJI
         muMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789763989; x=1790368789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrF5NSzar5jv65m2jp9XTBtvCU5/5PF93POgQGb8pAQ=;
        b=ZcBsoXxW08uE/JlVSqdlQLb6GIrZNEg2jABDfcAnwR//MY3CdD+QPHiLtUpMJKQZ/m
         Wb0n7UAwgv3aQCMfDKZfKazHB/9ZDFsc7jqSHR213S6VfeBrElR61PzwObrRh8lEFadi
         temoMJW8+0HCKBCasCBnnReVvmwPVhtG8KaAD5/V7+chdsCZyMBnwwHr014enI6JjWDB
         MElg78lolQSggqgs/WyTSEx0r5ILDEbf+CnI+JVnC+5vSu7JxBU0B317iCVJNKFDX4St
         e3nJNn7966Bq1MQbarZhBw/oJ+vLJk//35Cw9gI7bPcsxhzwrJoDBxRVghBS9DY9UIhu
         aV2g==
X-Forwarded-Encrypted: i=1; AKwUvBxZMuH7kltdUwU/+V3VNK0exowB2kh/M0A+wjtAkAD1qTkc8Y7HC3YvXJl5HG/aBViK+/RA0OBf08v+K1ZpGkna@lists.infradead.org
X-Gm-Message-State: AFuF++l1Yg65+Fdi30x/GhVQ0UNqBRcvO2bbhZXE5g237wrPLG4wjvo6
	WmKR4Alx3VRvoN1J8gKLKKsRFyvzjFSvuesv/QgdkaXHsS+/qZUxORIhClNjMFQzCWw=
X-Gm-Gg: AYBFou2SJJyBOE5hGeFL0pEADU6vUorV7941F3ZDl2S5nEeWxJdCGrB4SFMVnrME9Xc
	Afq2yjzXZv1a96fCw+YRvIyxrIEEvdZZe49N1MYPPwKbm+WaV/PnOXuo6nedmCDcAyv7pl4AeL9
	ehXEga2Cw8no6G/uq+jXBeXID5fuY07TCgVtYebmX+BEVAhXqge0JLBJOjUnInxSZzP9wIinu6P
	9vzvsu5AxtFwWuE45saA+tG7hIrKZwV7NX0bJ3DxRxxhGIdkdYPtBhE7mzAXmSWco0IywUTd7g2
	77gtSsfr5e4LjZqBJkZKyHQfRI8qe7k2B2Vgplwp+zrdzMqnVxgbHkrhk2gpLksDizP6UIXa01P
	SuUaV0K9QA60BlJ6PJoxZBM09beNU8/W8B+jRoDWra6xxrCurjt8VDIKTnl7nW+HIjtyQY7E1NV
	MsA1+fGo5gQju4LsV6xYae0IgCTyItMwPo7gAYEyLjl1GmSGf9poN7JkFcINvMkTW5VK+7c1+UF
	LY=
X-Received: by 2002:a05:600c:c0c3:10b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49fc5a10b5fmr75871985e9.3.1789763989396;
        Fri, 18 Sep 2026 13:39:49 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd8bf159sm4358055e9.10.2026.09.18.13.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:39:48 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:39:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <aq2g9otvja7xQqJ_@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
 <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fq4cwhvzzcfekf2h"
Content-Disposition: inline
In-Reply-To: <dca62a09-2af7-463e-9ba0-1be935a95502@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_133951_540318_AC7CCF18 
X-CRM114-Status: GOOD (  21.80  )
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


--fq4cwhvzzcfekf2h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 04:09:36PM +0200, Hans de Goede wrote:
> Hi Sudeep,
>=20
> On 18-Sep-26 15:32, Sudeep Holla wrote:
>=20
> [...]
>=20
> >> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/=
scmi.h
> >> new file mode 100644
> >> index 000000000000..1b4ccfa9dcc5
> >> --- /dev/null
> >> +++ b/include/linux/device-id/scmi.h
> >> @@ -0,0 +1,17 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +#ifndef LINUX_DEVICE_ID_SCMI_H
> >> +#define LINUX_DEVICE_ID_SCMI_H
> >> +
> >> +#ifdef __KERNEL__
> >> +#include <linux/types.h>
> >> +#endif
> >> +
> >> +#define SCMI_NAME_SIZE		32
> >> +#define SCMI_MODULE_PREFIX	"scmi:"
> >> +
> >> +struct scmi_device_id {
> >> +	__u8 protocol_id;
> >> +	char name[SCMI_NAME_SIZE];
> >> +};
> >> +
> >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> >=20
> > You need to include this above file in include/linux/mod_devicetable.h
> > to avoid duplication of its inclusion elsewhere. That's the pattern fol=
lowed
> > I see.
>=20
> That is what I did for v3, but Uwe, who is leading the splitting
> of mod_devicetable.h from one large monster include to smaller
> per subsystem/bus includes explicitly requested me to follow this
> pattern, see:
>=20
> https://lore.kernel.org/arm-scmi/aow2GFAfy84k-N2B@monoceros/
>=20
> [...]
>=20
> >> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetab=
le-offsets.c
> >> index b4178c42d08f..91ec3704ee2b 100644
> >> --- a/scripts/mod/devicetable-offsets.c
> >> +++ b/scripts/mod/devicetable-offsets.c
> >> @@ -1,5 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  #define COMPILE_OFFSETS
> >> +#include <linux/device-id/scmi.h>
> >=20
> > Drop this for above mentioned reason.
>=20
> This was explictly added at request of Uwe because the goal is to
> get rid of mod_devicetable.h including all the device-id headers
> in a big single catch-all include. This is done because currently
> many files include mod_devicetable.h and then if any of the device-id
> headers changes everything needs to be rebuild, making incremental
> kernel builds much slower.
>=20
> (and the same for the second include you point out)

FTR: That all sounds right.

Let's not add the the dependency mess that is mod_devicetable.h.

Best regards
Uwe

--fq4cwhvzzcfekf2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtoY8ACgkQj4D7WH0S
/k5r0Qf8De3R8/xBOJ/3LeAPH4UFuVBKGGI19ecvA8OulWQaGdttHVOB4PnQgqqI
zr/VQpCTb0UsY22b7aTRkbE+WpDtBA1glRTMwymtj8USz80zQa5+7SjfjrWcBpLt
CvSb/wjcEMfFDbN9cDw9J0WsUZhuALKA5oZW/kybeJxaLWF3pafGwaSZ8eCC/Ohl
au0Sk7ctvGaQOlJqXEuEqcRubWvFyRDmdgkfTXzJukqSdKh8Zlatdd7IWvSyT5KL
RdGlPH5frkEDcB+9Wu3HXANsWdZIe8FsrozPlGoF+7TgbayKM83MOuglXb0/lTJE
NwVV+Boz1Okzu1j4XOq114FfH2ZSaQ==
=ekEU
-----END PGP SIGNATURE-----

--fq4cwhvzzcfekf2h--

