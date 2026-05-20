Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76382CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U53nOZsze2BOUUWxn8xrqWn0udiJAimX6PJ2o0xVGTg=; b=nBLgPPpyk/F4KehE3t9FKaN7Ec
	nQCeI7IartbCFTrkeFainfIJXaHxfceZNfVSeRYx8niZnYPY1Hl+B+upFDpqlehCjRXG3OKBcFH1U
	iyI6s2qI/PBZEPuSoqJJYOY+jhbomll40gDrpccbkvOxus6cxauFay8ADUEf/jHIi/RC7zLHtLjL9
	gNP72hls1u/XbaU91U2oVp7sQ1YMLjacCzQvkxaDNWGITJlvDx3FgzFqe2e5Tpi9cxlPrcXvhEX7o
	SwLENqTB7uhTz96CYm3ZeKXrLk1eFUV4JJRhozFWLvlr0lMrbTxUKdAKfr1TEpezcExuKMwKc8Haj
	F5W+aD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcZh-000000040BM-0ux7;
	Wed, 20 May 2026 08:46:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcZe-0000000409v-1PVH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:46:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so1852219f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779266800; x=1779871600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U53nOZsze2BOUUWxn8xrqWn0udiJAimX6PJ2o0xVGTg=;
        b=NzZeljVrv/KcLKU/ZxT4LuiLsTVmNVf4SMsuo0JjvHdcpEbaOaO85ycLtLP974Zov1
         xDfq203LFZgieCyG8ANIVpBDO3M0nh4tC0yddbQRPr6P4cyqjkNrZNtHF4JyfsLUu3B9
         BhOC7KEoSWgWQp0fk/B2zlUvYAJVMl9HNJfYOZFfg+0NknJBg+rHkTPR1KAUhWKQhmq/
         jBZEJYPjxQHHFJezuWAYHS3GgriSuAIBXieCoKK43NIMjPgE7WlzSLsnC58tJxCUTPtG
         BghXVMvltUwHtKihwn9RnjeGeI1J/s74WGlZixs+H1E7BGyRXv/Jp/ADHIiYLiXqDX9A
         bv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266800; x=1779871600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U53nOZsze2BOUUWxn8xrqWn0udiJAimX6PJ2o0xVGTg=;
        b=ne7aNN1ZUrQbKTZqtBEYFagt3WIuWk/piPXmvIifXhC5Tpraot8Wth23X8TsDitI4C
         D1HE9/mFUnsxQzFhN1FkCjvCR/QabrSYhAaW6QyvOC5axkIaBm80l//QMlcdpuxraUHv
         G7HRvyg9q8baE/vqsd8MhwGWs6SJpsZVhWKbF7chmpT59rVVB4n666XLNIGvDDANvTLi
         ZF0x7blvYDwtSjY/F7Sqk5fYH5hXmj+LTBRNcTWgWFE+Ebw8k8tsnX5oLW+T8r/m+jp6
         n9U7f80VcVDr2zH7gduwM5Ap6r0TSQOlZfP1/8e9JTe4efgaQJEt32D4EUxqM5wwtrSp
         vr1Q==
X-Forwarded-Encrypted: i=1; AFNElJ83DwqOtjks6O3/ceOX3LECd7dYJ75v1lihug9v6chfMKADclOmu91UlAGSixVQR6quYizBg/YGNvxhurvc5sPB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2mUV5LqURctqsEG3cnOsWiFjNVO5UQAvfJ4Jp0uko61YDnTuv
	OOT4kt0erNCghLp8AgAbDIvJ5KQkGy6iDbwVtvKc5hd5UU0PuYM/OuhRfVX48q9XjaI=
X-Gm-Gg: Acq92OEj96IBr+gochALCoDf5oCcLdBu6wLTCOsZ1sGAgxVH+c0vMJrx0VPZY2rmfhD
	87eNozuuI1EapOYhPflsS4ZPNBmvHcpW/o0/Z/6oaPuyw7cKpi7AjgUgfN0GoVu4Gs1NlIAuyIH
	zPsNEt6550cu7j/jd62ctox7olipnav6NktCFuJbTP6t6/KwzDuO8SguU8Vi/xKZM36g3lJLzUB
	6RFt2AJb8WQc0zitoHadUxXRpEA3UatAeds/IodriHFpxyVEE6W1sPn6mNOCGJ4oKkVDWJgf4K6
	a9PFKg6UBBL/bmGBtDh6J6GTDPoBXw3bUXx937DygNxDAjGrUTsN8JcEv/Qgvilk2+PC9d5Qe54
	nYldhkKBsugmdDzRqkHSnq33EEWcFXa0wTfaHPxkyajikrQ4iRVKTKvQJwl9kcofKSaQjS4zgM2
	4d4G647dYNLMwIM32uD8IhdmymCM0SpkN4y77YYpdcUCU3qpivUJ97L8/QTj76oLBw+8tQMcJgt
	qYup21gCc8Uzls=
X-Received: by 2002:a5d:5d82:0:b0:439:c299:4d8f with SMTP id ffacd0b85a97d-45e5c5cbe4bmr36382479f8f.17.1779266800378;
        Wed, 20 May 2026 01:46:40 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a19b1dsm51573666f8f.17.2026.05.20.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:46:39 -0700 (PDT)
Date: Wed, 20 May 2026 10:46:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>, 
	Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] fbdev: Consistently define pci_device_ids using named
 initializers
Message-ID: <ag1xQVCCzXkc_Ucu@monoceros>
References: <20260430111637.211336-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4j765bpqgzr2splh"
Content-Disposition: inline
In-Reply-To: <20260430111637.211336-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_014642_407931_9EDDB24D 
X-CRM114-Status: GOOD (  18.60  )
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


--4j765bpqgzr2splh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fbdev: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

Hello,

On Thu, Apr 30, 2026 at 01:16:36PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/f=
bdev/matrox/matroxfb_base.c
> index e1a4bc7c2318..22774eb1b14c 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_base.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_base.c
> @@ -1642,7 +1642,7 @@ static int initMatrox2(struct matrox_fb_info *minfo=
, struct board *b)
>  	int err;
> =20
>  	static const struct pci_device_id intel_82437[] =3D {
> -		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437) },
> +		{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_82437) },
>  		{ },
>  	};
> =20

after further sharpening my tooling there is an additional change that
IMHO should be done here:

-		{ },
+		{ }

and ...

> diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
> index 3f6384e631b1..06aefad75f46 100644
> --- a/drivers/video/fbdev/pvr2fb.c
> +++ b/drivers/video/fbdev/pvr2fb.c
> @@ -993,9 +993,8 @@ static void pvr2fb_pci_remove(struct pci_dev *pdev)
>  }
> =20
>  static const struct pci_device_id pvr2fb_pci_tbl[] =3D {
> -	{ PCI_VENDOR_ID_NEC, PCI_DEVICE_ID_NEC_NEON250,
> -	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
> -	{ 0, },
> +	{ PCI_VDEVICE(NEC, PCI_DEVICE_ID_NEC_NEON250), },
> +	{ },
>  };
> =20
>  MODULE_DEVICE_TABLE(pci, pvr2fb_pci_tbl);

=2E.. here:

-	{ PCI_VDEVICE(NEC, PCI_DEVICE_ID_NEC_NEON250), },
+	{ PCI_VDEVICE(NEC, PCI_DEVICE_ID_NEC_NEON250) },
-	{ },
+	{ }

Would you mind squashing that into the patch you already applied, maybe
adding:

	While touching all these arrays, unify usage of whitespace and
	comma in a few drivers.

to the commit log? I can also send a v2 of the patch with these changes
included if that's easier for you.

Otherwise I will put sending these modifications separately on my todo
list.

Best regards
Uwe

--4j765bpqgzr2splh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoNdOsACgkQj4D7WH0S
/k7n3AgAmiu0dkGSmVN5iwDMsbx9u5oGpxoTfYsBdf+ieZ5EzDYhZzjAd5M4GNMS
dajrNSdkatRRbEZFE3PYDscIkW69PVck72sxOJdTDyAVSPf2hgi3mbElPpXW5ZEl
V5s0iKhXHTafmLPl+5cAsDOdMG19WulP1A3QfTepuM0kOEAKsQ4UwUV4AWlpBgH6
GMiJdyUX4viX+gD8zOIgyKPCjqvBa8CMPkgQORFA1fuD+eEbv1Iw1b0xDr/AinyG
8Jfn/ZzaAAnTJje43x8rP+Q5hw6uVI6bBHTrhypMFQ0C9ofIZBsv2BUyQ8Hp5i85
TX3Z+lJoWmwknV9WI68+rtnMMOgSCg==
=on22
-----END PGP SIGNATURE-----

--4j765bpqgzr2splh--

