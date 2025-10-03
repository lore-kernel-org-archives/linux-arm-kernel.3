Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6932BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIh0ta/ySV31IDAsjscXZdxDAf93kz39y+kPAUa/I64=; b=3O4dsCXtjPz9RGB7212W5lkL7o
	M3Sg06BaW3EkjNSjU+nEKq+Nnx3x3unBhEgNTpj/d+Hsn+yCRipwf0TADfszRB8VI1wRv1SYSDKKT
	JG7VYnwlagw+M6uqS0kf2Hgk8OIENcMR5X9EMCtfN3cLlNZUm4sFGBv3c7WmzUPQNN3UHKz3R2DqF
	aUswcROmp08GGqzAfY13hoLjb5OBx9wdgwbhieYqGKYCP56G7FCQCAHxlgKsGsbI1Hebz7gqorSx0
	foYfdaV4qQOs3L3hpHi3LkeEn2/6w1EEXgJ2+WpVfzRo7jZO1xyV2ugk/Q1gjxXeQ/5wBN+zFnSWf
	+QNiqF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gWA-0000000CWWO-16wp;
	Fri, 03 Oct 2025 14:12:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4gW7-0000000CWVU-1LMm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 14:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759500734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIh0ta/ySV31IDAsjscXZdxDAf93kz39y+kPAUa/I64=;
	b=d1qY01MTSTt9YXjYLXXaFViv+CZAqgj8i+IgLfRDG0iMwUF2xbJOcG7hEpgnWlzJZSaSLd
	gothpZuCLoYc5yaSqH73Mb4hRu3HOI24JGt8MRNAIB8XDRXaY+PWgTcdWqqCBCML8lcArL
	yfGGxMgOVL6Mv0rRcmB2fbe+CpNz0dQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-p7-gEo1SOo6uURtbNF1Mbw-1; Fri, 03 Oct 2025 10:12:10 -0400
X-MC-Unique: p7-gEo1SOo6uURtbNF1Mbw-1
X-Mimecast-MFC-AGG-ID: p7-gEo1SOo6uURtbNF1Mbw_1759500729
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e45899798so9854845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 07:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759500729; x=1760105529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIh0ta/ySV31IDAsjscXZdxDAf93kz39y+kPAUa/I64=;
        b=hbZZ/jph337AfxyemMSl1WBNU6ibU703eobBPtiVSmFYNg6EGQnSyN1/OraX151nik
         IdSuPPq94Z8bWD3kQnxt7tWYuucEQgU5RLlkg4OJGbkk08g9yIZlO6krngX36vqYqVda
         BdNMej99jyyWwa4wYNqgaWWj7pMANLzP3KoXgW/Ij8sh6IN6L4CRbibufoy/Pup78B33
         aKY3V/6dXS1Xj9xhZuGvoNcw4+kmQn70mb7V6b6wOwjecgljDLy9Dzl3y8t3/AkU1lpu
         UPulbE0Q47ckTLhnzmVlLCcME/J1oHx+/u3vdDru+OueeXavnDMtDdAOwCDNSq46bKAB
         7ARw==
X-Forwarded-Encrypted: i=1; AJvYcCXctyI7/ZzNJyWLCYQ+ZVElfzBsm0D1ADqgTyQNZIl+Mctgz/SXfFlUdGdid7dpC3/RwDqoovpkNWSKwXh3oaPc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhxen28HhQUTOjv1eYSzT5uI7kT5yFBJwOTz7pHjjpIxuyyWAp
	SARNIIzs83u9odenevdv3Qa/RoCEbuNoIPbvk/Q8LTly1v9OwM1rW0WAPBEurWKkQmuuVMmw7fT
	lu5WGxzjr1VKJ8gi1WU6EVTqmYFyxYCG5nHUgR2DITBRXg74Zf7bC2jzTf72YHd44QwwR3aHtuK
	0b
X-Gm-Gg: ASbGncvwJwinyHKnkuqbwP1+oD3c+ee4ih6oS5RJhDWFFkp9Kv9lGil5Q6fNk1DWmb2
	o5JDhwq668+1yt/LpVMYWlL0cuJvu5Pmow4J3N+p6krXt2TQKyQ8Hhaful0EdOk4fyi1QJoRPUI
	S2uzrdOLAxh54ZQBctgXSbwMGW/Hg1PQiLeRc8hZh8saAcJ6xUrLEhc7RwOQxmc4dv/TqKeuKMW
	WzHNcBssm1DV/zkWWS/0OivZ6VnTc9b3+Hxr9LWD5ux+OY1pPd0YjiectQhQTX1J+kkBdfMSxyF
	xj49IMzfuyRQ9M6pyfPejQ==
X-Received: by 2002:a05:600c:1986:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-46e71109f78mr19837015e9.13.1759500729023;
        Fri, 03 Oct 2025 07:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvZE78Vlry2HWGKctUpuvV3NYdSpp6VF7NSq0LXvMOwPsaZRtbqFATFnYhybF+GpisNk1RcA==
X-Received: by 2002:a05:600c:1986:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-46e71109f78mr19836735e9.13.1759500728555;
        Fri, 03 Oct 2025 07:12:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e7234f69bsm36548575e9.8.2025.10.03.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 07:12:08 -0700 (PDT)
Date: Fri, 3 Oct 2025 16:12:07 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
Message-ID: <20251003-majestic-indigo-emu-d9dbdd@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org>
 <20251002-sceptical-goose-of-fame-7b33d6@houat>
 <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="uh2g5nrijwsim4uc"
Content-Disposition: inline
In-Reply-To: <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_071215_429056_9A11D0BE 
X-CRM114-Status: GOOD (  26.33  )
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


--uh2g5nrijwsim4uc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
MIME-Version: 1.0

On Thu, Oct 02, 2025 at 02:57:25PM +0200, Jens Wiklander wrote:
> Hi,
>=20
> On Thu, Oct 2, 2025 at 9:54=E2=80=AFAM Maxime Ripard <mripard@redhat.com>=
 wrote:
> >
> > On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> > > +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> > > +{
> > > +     switch (id) {
> > > +     case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> > > +             return "protected,secure-video";
> > > +     case TEE_DMA_HEAP_TRUSTED_UI:
> > > +             return "protected,trusted-ui";
> > > +     case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> > > +             return "protected,secure-video-record";
> > > +     default:
> > > +             return NULL;
> > > +     }
> > > +}
> >
> > We've recently agreed on a naming guideline (even though it's not merge=
d yet)
> >
> > https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf=
0dfd@kernel.org
>=20
> I wasn't aware of that (or had forgotten it), but during the revisions
> of this patch set, we changed to use "protected".

I think protected is fine and what is documented in that patch, right?

> > Secure and trusted should be defined I guess, because secure and
> > protected at least seem redundant to me.
>=20
> Depending on the use case, the protected buffer is only accessible to
> a specific set of devices. This is typically configured by the TEE
> firmware based on which heap we're using. To distinguish between the
> different heaps, I've simply added the name of the use case after the
> comma. So the name of the heap for the Trusted-UI use case is
> "protected,trusted-ui".

I guess my point is that, without any prior knowledge of how that heap
works, I have no idea what the "trusted-ui" use case actually is.

> What would a heap called "protected,ui" represent? Protected buffers
> for a UI use case? What kind of UI use case?

I agree with all those questions. They apply equally to trusted-ui and
secure-video though.

If you want to have a vendor-specific name, I guess that's fine. But you
should at the very least document what all these heaps are for and the
subtleties like the set of device that can access those buffers (or how
to figure out that list if it's somewhat dynamic).

Maxime

--uh2g5nrijwsim4uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/ZtwAKCRAnX84Zoj2+
dk9GAYDf6fryp88Ahl12b+j+v2rumlMEN3n/cHougouDTADzYYFHD5FrzdVXoXCH
2w49Sa0BgPbuh4M8qU3Ly9kSPtLFD2tEJs/iA5V+MezAw2Egx8cvBUXOLP8pdylA
HFFK1Cqtug==
=PVWB
-----END PGP SIGNATURE-----

--uh2g5nrijwsim4uc--


