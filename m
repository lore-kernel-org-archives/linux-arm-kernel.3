Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA01CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEPW2+diZhljtgmo2ebKz0clEahHBJjRKWMmy6eAjTI=; b=VOznbcpfg+QIE7PfitjMlJftd0
	SNouB35Veta6bKP/5p6TlGec0hNSUHD8W0HND0P902xDacbJipMGFewlLupcU+YIg5UBITTahvJDe
	6PRO6PPHM7NbTu7nO9XTd7KzgiaqsHHppNkUiF2NTOyIT5hd96prp7Qt8/UkcHFGEgkM+A82SoRt8
	uUUCwsvITKoSAocLxjrOD5boPvT+GfWbuDrCg9PqEYZwbx2PtH4441D+wi4Pt5lrRcduZKtua7ijF
	H1Rs0fTyifelff5fTrwPNIqTwfvfi5T9ZvtX3nHWXkLU6W1hg21okPq858rrbA7lJzgsSDf9pzdHW
	zDtdpAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2CM-00000006ShI-03t1;
	Tue, 23 Jun 2026 14:33:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2CI-00000006Sfr-0E0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:33:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso5529511f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782225232; x=1782830032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YEPW2+diZhljtgmo2ebKz0clEahHBJjRKWMmy6eAjTI=;
        b=Ssk/vCLiybpDslPPzjrX7LHvOxWKzeMWJ41E41Z5w3q+bBwS2aPwrNKtgZCjjRKrnc
         RCWbpRf3rjVzmlqAiTK319fJF6697kfggukxAAHuAusriqwJoVJrQP/Gv4pHpSl9c8Hg
         nSKkrwUpVMRdwRV+WAKDJWoo9QfMdUTdyBrOzMfUErz1qZcnJVUoLHwexwcwKMwgF+Fg
         XuNSfIRbN3kOoyDFxtbaOAhLgzRtszgKKALGNgKMqnxVwka7R4HnQx3Sh6hGKNPw1Hf1
         dUq06Q017nPVneFH4NgODHeFcvvT2sbvilER9JEugmVc/ArC0jCUDZPeA5+/0SDKJ81P
         6AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225232; x=1782830032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEPW2+diZhljtgmo2ebKz0clEahHBJjRKWMmy6eAjTI=;
        b=AKPB6CSbiE3NQPAhMhXgnjTYqnkNgeeuhpBe93bccKNd8+IeDt/7owxc8RwNdKKJUk
         grSsnWC5a49qz8vudsy6rADS7PlF/a4Yz/QHTcHnlyFOgid9eYWz5PnxGxKcRZqyc88S
         8RpSwd4M5GlzV0UJRKs7HWjR8xn4CSVEjyyABV25sCod2hrypqCZZrjJID3HMrFb1oOQ
         /cCNC5QEKfMHFZALpl/ppeMsQJSImiF/l2JB3L8qB8NjDU1Auu1fMzllbtqpvhHhbT60
         6/BUt3U9Ejjmqzi/ntovpdvsTUptoyRJA6MJfomIHcTHLFGyJ72+/63a3yErxohHk+oT
         m3mA==
X-Forwarded-Encrypted: i=1; AHgh+RpIaXfof6OOzY+csG0DQm7XHkIjhAh3tD05+O7DTkmg/SRU8Z9GA6H+kD9k8tqhLrA3eh2EBCwdwOwGrYF+sF2t@lists.infradead.org
X-Gm-Message-State: AOJu0YxjE4CSN2m+s5bLI7jtvcTqG0f1v3guWEwrMVs+nwcm1Q/C3FyO
	JDgkEsC2Oj2ei3oVRKc6yZZUyXRNwny0DUFF9TWCK38a8jHmezTg8JCTlnVW+u/h+V2e287XyhX
	Y0u1w
X-Gm-Gg: AfdE7cmQWk8szzWfRJBxDOXFoJ6zxA717jWyZHELDKFu0YSusPLVwLYVD90Cb3wKNrk
	ZUyxRjzMI3UTLMt8zWNQmJEApEQ4FSo9wA4XDPEHAGXNFuCSw/Do/3USqFNLqBwgZCqYAc3NlYY
	039SrpFyvw3BX+SUp1AT8N1rKjBDhplMOMEgW3MV7ht4FaU/JURSNntvNAgx96dUDZ2iU6BvrG8
	cES1xAVIS/ISzfZt/99XHwfsR+h4V4dqoTdjSqpV8YS2PGxbcHHlp6T4z3Y3A1EMNR4Xvv2/ydT
	/TeaSSjIUrw0p43e9IeLD/p3Npu1ww/ujTu3ZeVGVzIDMhmdvff2wC5lx8hnZvGwr+eq8VLOxx2
	HkRw3XJ4TFA+8qAIYo/FXPvm4jY+H/F9WARZI6fdz4W3r+mGsMXk3eP0eaEBlx3+7I6UqqEYJ28
	Bh73X2lVH1a1CRctmmDv92YJ/BPQkwE7N3c7vZpC/k/OMy23YqoPr57fNHzX5xAX5lPntpS/6tE
	I8=
X-Received: by 2002:a05:6000:46c4:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-46adb0b627cmr3442205f8f.9.1782225232172;
        Tue, 23 Jun 2026 07:33:52 -0700 (PDT)
Received: from localhost (p200300f65f47db0493d7da2f3a2c0dc4.dip0.t-ipconnect.de. [2003:f6:5f47:db04:93d7:da2f:3a2c:dc4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-466667882f7sm36693330f8f.21.2026.06.23.07.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:33:51 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:33:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <ajqZIBDVccYSGoIY@monoceros>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
 <ajqFGWp3XKqDhPpE@SMW015318>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aupps37cqxgxelmw"
Content-Disposition: inline
In-Reply-To: <ajqFGWp3XKqDhPpE@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_073354_105484_5AEA0AAB 
X-CRM114-Status: GOOD (  16.78  )
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


--aupps37cqxgxelmw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
MIME-Version: 1.0

On Tue, Jun 23, 2026 at 08:07:37AM -0500, Frank Li wrote:
> On Tue, Jun 23, 2026 at 12:45:57PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> > 4b563a066611 ("ARM: imx: Remove imx21 support")).
> >
> > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> >
> > And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> > ("ARM: imx: Remove imx device directory")).
> >
> > The last user of imx1_reset_init() is gone since v4.9-rc1 (commit
> > e1291cffcc50 ("ARM: i.MX: Remove i.MX1 non-DT support")).
> >
> > Drop declaration of enum mxc_cpu_pwr_mode, the actual definition follows
> > later in common.h without a usage in-between.
> >
> > All users of of_device_id also include <linux/of.h>,
> > <linux/of_address.h> or <linux/of_platform.h> which is enough to not
> > need the forward declaration.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> > [...]
> >  void mx31_map_io(void);
> >  void mx35_map_io(void);
> > -void imx21_init_early(void);
> >  void imx31_init_early(void);
> >  void imx35_init_early(void);
> > -void mx31_init_irq(void);
> > -void mx35_init_irq(void);
>=20
> which commit remove above two functions?

These are covered by:

> > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).

Best regards
Uwe

--aupps37cqxgxelmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo6mUwACgkQj4D7WH0S
/k7ohQf/UicBdj6bBdSXzM4BEoWXLLOHVx/FAZkISFVDzWN/VB6iWbXDBXnImi5p
+FNwS2SGTNFFyQB/bUViIvrpdeKs6tbr/GHfNUwomTgZ7a51JQP/VATZLtcUL5uQ
u1SL0hI6AVAIruiNEMeeLiJuWb7lbUcmf/tCRn0645UwwqzM4v6R+teLTXoCRHgj
Fl1QN77UY2Ml2J81sSLbO5u9ND+/LXC74JavIeQ7DSPIrypxQjcu3UAsk9MLECSO
m0tJ3R2xib0cgaGQF/cIwDLS5uT4mgGm9Tk+Z/8pXqfD3Z7/DFWVla9XiY60jBRd
O4XUrDFyAFxcDNWMnrMgqK3l5/vfIg==
=nscW
-----END PGP SIGNATURE-----

--aupps37cqxgxelmw--

