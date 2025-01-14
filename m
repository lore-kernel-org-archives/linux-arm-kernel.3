Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98912C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMuk+UifsraxPn2X2KqUIxPaLF/bAyO14bSWUMchq6M=; b=z8+KBvmDycAwJZFBMeU7c25xkH
	n0+aykjUHstinVs5DSQTyo2N08lDawTvB3YtsSiKKwhxYEjlpB4Lcd3zY2DzxZkyybNfvmwo/zO18
	xYZyTFke72glT+01w4HpR6nPA5dbeUW7D9xo/CvCPEnJe7StcvxEjUqAY6lovVeecm2/CSK4whfTN
	vtE5XXLfJfdBase7IBg1KXhUgG71P3bOIa2XlYB6XW/9FUJFa9fXv9/V98xLAVEASNa0bp0BWT8W/
	F11bb1oTfwDN5ArgGtiVgkZGcmgpmK1wS8n3oyDRWzgrw3TRdfdLgGKRJTrkJbqLfmWJh448i1Lz3
	VRM+YnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjO5-00000008xeZ-2YwW;
	Tue, 14 Jan 2025 16:03:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjMR-00000008wyR-0Kpa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:01:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38a88ba968aso4692439f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736870505; x=1737475305; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RMuk+UifsraxPn2X2KqUIxPaLF/bAyO14bSWUMchq6M=;
        b=TfV7KlQkvycs751O0J4UEwUW76mtW3PNIT2eb7lo//rG54+kWVv2Mi8d+Hh7Wd4v+t
         haHAe61e0vNyMfgENVTf9Y3j22l8n5aICkAgyGIYtoTccY8iW8917JDST1NqzhFw01OF
         jKOJR9EUgev2vQixV3AVa/5wB/cuNy4uRlU+OC2c1sKkPadK9af6PR/6ZizFizcRxBbR
         nf58WZwVNQWq2OH4EHn4Cl4Eu0KNK6vPfYZZVBw018ef30rbAr2l8ePuxVK3rU8rpcrr
         XSXSnK0rXwlzjm47fgEodnVXY2LbJQi1O6y3tCPDmBEWiJNnu7zBwoNHMUh8pf3dZvm3
         J8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870505; x=1737475305;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuk+UifsraxPn2X2KqUIxPaLF/bAyO14bSWUMchq6M=;
        b=Q48BKPRS5wn16p9h5ycglrXAOUNICQ+6erwoMH4dgGKN8JXwvFqhaaQVHTHy2eLoNF
         oc/Pt1ljhTmG44bv7m+KLz1Liq5scd3WQ92E12iNmAp/cnMVr02O1jPNt/VQVg3YmmCY
         6C++3R7FuRqtN+QLyF7vfw+ZES2iUBjil/gspfFKyVWWNKgOAqXrZuxwPylMVXD/4gHQ
         /G/YirDg9r8COLrWHUC13/H4JmwyFZ6D3/42/R1al8VMi5FI+XlkRFSQntrbOs1YeAZc
         9uFy4BOlxYw5wB+MaEjj8RpxK5atmYsHJhOn1XtDsFqqtDo9DYY+DoiTmYl0N7/ji7rO
         adCg==
X-Forwarded-Encrypted: i=1; AJvYcCXifp4VkD7OI0yb7BHe7ScAOoU+xbibmr5hQjbbMyDbkVfiQekfQA/oYnC8sA7Q65MHBppzrMVTItVYha7cf07+@lists.infradead.org
X-Gm-Message-State: AOJu0YyZsgGq+LJnT8pC/Bz16lbQ3U3JjC1ks5dHPyyJJamMOD7E30wk
	ifA85SH/W2KOilbuW0w+tChSmxwJp3Jbcc+Z7Zau4WVVVa6kFpiYaNAobopsceE=
X-Gm-Gg: ASbGncv946ggy3CrLsa0RiyJkc2Wh9BZmqnf62VqGeB8QlpjiCnXkR3IJKBoDH0AEzR
	0lIhp7ai3DAREpbE05ItD8TwXD6exFdUWssAvys0RXbXGBD/c1/Ae07T2ZEP0i5RAQlhnwKTrv9
	cBBZi5x25P8e+Pvc79dlTB81et3V1MhzwuxsIS/+4reZcXKB6DowuN8eNuXQL1RMc99LKucXkJw
	CeQhS055FrcSBj/TcmyF+Vcf1Uzh+CYpW0sG+ewPCSR1AYzq8yo5fbdt258ile8Mk8=
X-Google-Smtp-Source: AGHT+IF3J9KLkHSdxkhJLVphEdnFgZopbnshppEer6gQraM6YW4Ox7lnjy1tK1UMNKFQ1TSYcrtXkQ==
X-Received: by 2002:a05:6000:4024:b0:38b:d765:7039 with SMTP id ffacd0b85a97d-38bd765737cmr8157919f8f.17.1736870505207;
        Tue, 14 Jan 2025 08:01:45 -0800 (PST)
Received: from [192.168.243.26] ([80.233.72.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0fasm15516855f8f.19.2025.01.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:01:44 -0800 (PST)
Message-ID: <b97f6231496d2fb0323c9e51b5bfae7c635750e9.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com,  linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org
Date: Tue, 14 Jan 2025 16:01:42 +0000
In-Reply-To: <20250113203136.GB1800842@google.com>
References: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
	 <20250113192235.GA1800842@google.com>
	 <c4129ea9da39badb3a686f7f93c334ecbc6d83f6.camel@linaro.org>
	 <20250113203136.GB1800842@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_080147_126727_82FF152F 
X-CRM114-Status: GOOD (  37.38  )
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

On Mon, 2025-01-13 at 20:31 +0000, Eric Biggers wrote:
> On Mon, Jan 13, 2025 at 07:28:00PM +0000, Andr=C3=A9 Draszik wrote:
> > On Mon, 2025-01-13 at 19:22 +0000, Eric Biggers wrote:
> > > On Mon, Jan 13, 2025 at 07:13:45PM +0000, Andr=C3=A9 Draszik wrote:
> > > > [...]

> > > > ther approaches for solving this issue I see are the following, but=
 I
> > > > believe this one here is the cleanest:
> > > >=20
> > > > * turn 'struct ufs_hba::crypto_profile' into a dynamically allocate=
d
> > > > =C2=A0 pointer, in which case it doesn't matter if cleanup runs aft=
er
> > > > =C2=A0 scsi_host_put()
> > > > * add an explicit devm_blk_crypto_profile_deinit() to be called by =
API
> > > > =C2=A0 users when necessary, e.g. before ufshcd_dealloc_host() in t=
his case
> > >=20
> > > Thanks for catching this.
> > >=20
> > > There's also the option of using blk_crypto_profile_init() instead of
> > > devm_blk_crypto_profile_init(), and calling blk_crypto_profile_destro=
y()
> > > explicitly.=C2=A0 Would that be any easier here?
> >=20
> > Ah, yes, that was actually my initial fix for testing, but I dismissed
> > that due to needing more changes and potentially not knowing in all
> > situation if it needs to be called or not.
> >=20
> > TBH, my preferred fix would actually be the alternative 1 outlined
> > above (dynamic allocation). This way future drivers can not make this
> > same mistake.
> >=20
> > Any thoughts?
> >=20
>=20
> I assume you mean replacing devm_blk_crypto_profile_init() with a new fun=
ction
> devm_blk_crypto_profile_new() that dynamically allocates a struct
> blk_crypto_profile, and making struct ufs_hba store a pointer to struct
> blk_crypto_profile instead of embed it.=C2=A0 And likewise for struct mmc=
_host.

Yes, but I was only thinking of ufs_hba since I believe mmc_host
uses an approach similar to my patch, where the lifetime of the
crypto devm cleanup is bound to the underlying mmc device.

For consistency reasons, I guess both would have to be changed
indeed.

> I think that would avoid this bug, but it seems suboptimal to introduce t=
he
> extra level of indirection.=C2=A0 The blk_crypto_profile is not really an=
 independent
> object from struct ufs_hba; all its methods need to cast the blk_crypto_p=
rofile
> to the struct ufs_hba that contains it.=C2=A0 We could replace the contai=
ner_of()
> with a back-pointer, so technically it would work.=C2=A0 But the fact tha=
t both would
> be pointing to each other suggests that they really should be in the same
> struct.

Noted. Thanks for your thoughts.

> If it's possible, it would be nice to just make the destruction of the cr=
ypto
> profile happen at the right time, when the other resources owned by the u=
fs_hba
> are destroyed.

Just to clarify, are you saying you'd prefer to rather see something
like you mentioned above (calling blk_crypto_profile_destroy()
explicitly)?

I had a quick look, and it seems harder than this patch: one option
could be to make calling the destroy dependent on UFSHCD_CAP_CRYPTO,
but ufs-mediatek.c and ufs-sprd.c appear to clear that flag on
errors at runtime, so we might miss a necessary cleanup call.


I think the best alternative to keep devm-based crypto profile
destruction, and to make it happen while other ufs_hba-owned
resources are destroyed, and before SCSI destruction, is to
change ufshcd_alloc_host() to register a devres action to
automatically cleanup the underlying SCSI device on ufshcd
destruction, without requiring explicit calls to
ufshcd_dealloc_host(). I am not sure if this has wider implications
(in particular if there is any underlying assumption or requirement
for the Scsi_host device to clean up before the ufshcd device), but
this way:

* the crypto profile would be destroyed before SCSI (as it's
  registered after)
* a memleak would be plugged in tc-dwc-g210-pci.c
* EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) could be removed fully
* no future drivers using ufshcd_alloc_host() could ever forget
  adding the cleanup


Something like the following in ufshcd.c:

static void ufshcd_scsi_host_put_callback(void *host)
{
	scsi_host_put(host);
}


and in ufshcd_alloc_host() just after scsi_host_alloc() in same file:

	err =3D devm_add_action_or_reset(dev, ufshcd_scsi_host_put_callback,
				       host);
	if (err)
		return dev_err_probe(dev, err,
				     "failed to add ufshcd dealloc action\n");


I'll change v2 to do just that.


Cheers,
Andre'


