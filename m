Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C92FCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=; b=vMFWB4HEdcvYIe+6ecZugpKDt0
	EYAYRQbIer1g9BJv25VCpdDgjxMumyBRrHcjTSWdhyDhdzEHq1md22GSor/7v2dAqN+oCbEwUE6w7
	DkkfuOuaMyUqZ+NxY2Ows4C7LsgiXHN6vgT03XORn+0+Tfsn5P09/z4Uscmqipyp4xLLDiOF4KVnp
	nLUZeC2jQRLQBMuw5riKmGm335Q28RB/Tgn8tpQKW2RY471TFasV8wu0jzNP+AKZMymOj000XRQ4Y
	k5A9WxPmYHLf6I4HUzQ6naBtCxkVcECuN2i6L3Luj+9ipoMOzDjZY/xyA8b4ZOr4PPBygZQm/MCfd
	wRurxqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ibz-0000000ASgM-1mQW;
	Thu, 02 Oct 2025 12:40:43 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ibw-0000000ASfC-2Q9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:40:41 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-85cee530df9so112783085a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759408839; x=1760013639; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=;
        b=NbMYLLtF+S+2wIpBz2PZ7ssCGNIVYJ16yhz60g0Ip3jr9HTsnh+ZVtwQHXXKRHf6HB
         nsM+i5BAMINUzhGwmvObWEXucRldrFaGpevSu4uaJ5NNG+dOjimvG8vgXQRACjy30DkQ
         QzHASuGh3S4TcalbHiE7d1D9VVIgJJAzd785D3vn+AsplUmccsdtz5dhhE8Jrz5j3g+z
         3aaNcbr3JeRaZaSK8NVewLkfGubXf6s55NS77YUCuPwe41mbQwWG4fAnXnX6gfPYRZOI
         IrZuY8lV+Zs3TquVZAPxci09HOLcE90uvPT6gA9TK+6SxYTd5XRPxVFAkfwnVLQv5bZo
         0oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408839; x=1760013639;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=;
        b=LpzubEU/kvldjKpz67Vh8JEepDV7HunW4ZCRlx/JXFrp5d+XgO/cLn2fREhZYHtDrp
         DkhCOhmeYRkPnpJKLpR9MfSQIsn4zN6eYKXWijmHjh7WbtR/b9uTxlBdz2oCyysON6g6
         08Jeush4LsRnJNRttCZoV/6zJdKn9ATuqClHaCo4gNRDhdg68pMcs4XG6mimBSfy2QjC
         PyYi5o5wKhxAvToAqGh8KsU7cfyHmZl5bkqIjQAe5aJDmc2Q3duLtOipJRlygxSZPWQQ
         gl6G4UNdpl6K2UKLx6Dyh6YZV2zqA7WgBUDRlDUxelS92MVeIWCIaAggKsCX6xUZfWEb
         J4vw==
X-Forwarded-Encrypted: i=1; AJvYcCVZPWioGxNXVg0cExeKIAoGKS2XA9w4YsL8DwG6iobv30EOAVGkPieUA2mvymyDtqQHu0pK6lM/kTuqlokEV5vK@lists.infradead.org
X-Gm-Message-State: AOJu0YyCVZbZk835gjcp9BZJ4BJ6hApFon1gcyt5C4zLQlDcIcnAVXXS
	HafzX2gc/vrWnTnTgED9KLaMnf7S2bftwjmIBzmiA7WBaONXh7kzHGg/Twb1Febkqqo=
X-Gm-Gg: ASbGnctQ7pTswrsU9Nkm3LmEldj96RcKFbhr2WKzUtCzvM9/HSQnjN6FhRhVyktUmFn
	YsfA74TBWqNMsDOgQEXUtZOyI3PdO8Ge9D9LadlVr5gmiPWWLUdZeJP9JX0zjJ/CZSYQT5wWFVo
	0inApB3nX8Lj5yKbesf9IylRWtsgcGRVo+Dfg/B99VnXjeLiSzTetRxhLIRdrGfQhgXpTRvuGYj
	JTsjM5wPfFva5epcFuOCAflae4J/HpSN77Konrz3+UdAUkDvlJDDElnYjthOVJzqv092pXgZrKM
	a9Fx8xThTd18ofFGO/eZ7N18kRtZSiApGKAsLJL7+WkcQLSl6JivVv52V7Y6SH6knES8qP/R8Gr
	5J/7nwHCzWO750Gxi5o/3bUh5zJ2wY0sh4aRmRbgY+M4NJpEN4euBylBBGEP6sH4=
X-Google-Smtp-Source: AGHT+IHfFbRDc0lxQJHEnEb/USvJWquapfe/e1sD30gNrrrl/FzbGv+DojWArzyJNLJRhyT1vMSzeQ==
X-Received: by 2002:a05:620a:1a0c:b0:85e:5022:33b7 with SMTP id af79cd13be357-8737780ae60mr1022559585a.72.1759408837081;
        Thu, 02 Oct 2025 05:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129fcdsm200898385a.13.2025.10.02.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:40:36 -0700 (PDT)
Message-ID: <9ca0e8b7b644637101f8bbc3f69cb71f20665f04.camel@ndufresne.ca>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@redhat.com>, Jens Wiklander
	 <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,  Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey	 <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier"	
 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Sumit Garg <sumit.garg@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com,
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone
 <daniel@fooishbar.org>, Rouven Czerwinski	 <rouven.czerwinski@linaro.org>,
 robin.murphy@arm.com, Sumit Garg	 <sumit.garg@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 08:40:35 -0400
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
	 <20250911135007.1275833-3-jens.wiklander@linaro.org>
	 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-45N4bvp/oD9a6lFdlKUD"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_054040_627663_302F1340 
X-CRM114-Status: GOOD (  24.80  )
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


--=-45N4bvp/oD9a6lFdlKUD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 octobre 2025 =C3=A0 09:47 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >=20
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > =C2=A0drivers/dma-buf/dma-heap.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> > =C2=A0#include <linux/dma-buf.h>
> > =C2=A0#include <linux/dma-heap.h>
> > =C2=A0#include <linux/err.h>
> > +#include <linux/export.h>
> > =C2=A0#include <linux/list.h>
> > =C2=A0#include <linux/nospec.h>
> > =C2=A0#include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > =C2=A0{
> > =C2=A0	return heap->priv;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> > =C2=A0{
> > =C2=A0	return heap->name;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct
> > dma_heap_export_info *exp_info)
> > =C2=A0	kfree(heap);
> > =C2=A0	return err_ret;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>=20
> It's not clear to me why we would need to export those symbols.
>=20
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>=20
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.

Maybe I'm getting out of topic, sorry if its the case, but making that a ha=
rd
rule seems very limiting. Didn't we said that a heap driver could be made t=
o
represent memory region on a remote device such as an eGPU ?

Nicolas

>=20
> Am I missing something?
>=20
> Maxime

--=-45N4bvp/oD9a6lFdlKUD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN5ywwAKCRDZQZRRKWBy
9KyVAP0e+zNS/qwzQzV67XRNZS/HR4iYLotJyohgk+o985wA0gD/cUs7EW6a2cas
LUv2nPsRzhxVleDso0vC+2RD1vBV7wE=
=kgiD
-----END PGP SIGNATURE-----

--=-45N4bvp/oD9a6lFdlKUD--

