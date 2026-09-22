Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41080C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYZSrvfaNRUF8vysf/3RvkJxXOyz3bEJ1eP7jW1LNrc=; b=gTsIEUxCCPYzX1QShhlJVJyfd1
	PwVl/95rZbWoXweQ+QVP4U8agDOvYpZN9w/vP03YapwgsU3PjIF/dMmUTHqg3yVvYkiqZCRrMDAVA
	/EdAu2Z8QQOYerF1TLTsmUKFxJMqBRuNIh5Ax2Lv4sAqvi0Z+rwfpD5zZawIEUeAj5oNdspuJwgS+
	BV/seVsZGFCCZ78RcIUiLMPOYiYDwO6cYQzIn1uVYm2gRtJ/KARYKCXFqwP+cEaQ7wVjNQNovKoVL
	J3NYFmNr3dHcCAtiSp5Q47QILlnxSJ3Jg+JEENdEnnTAlVGF0kVLxZvzb1GeYDsswzaUGmkrJ1an0
	PIt+lQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x920B-00000005m1n-07Eg;
	Tue, 22 Sep 2026 15:01:47 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9207-00000005m1M-1nk3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:01:45 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso37728935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790089301; x=1790694101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYZSrvfaNRUF8vysf/3RvkJxXOyz3bEJ1eP7jW1LNrc=;
        b=c5lZjW7iiR5sXqtyumIOCqClxnQcTzfEDhMj77xk0zii+HsN2KMsRLxclFpmxX3CNH
         gkFsh6dp4i7tSzaXiseGDVNGWSMOpq1XJIznU/W8Xx2fUuWSVJXOZFidJuGuZmb12Alr
         GSf6fkN69dlRe/k+HPfspmyf56upZ7huFKgErNhc+mGJF5ronfH0nt7VxZHR2gLWCttt
         aX/W5YMktmD/Kw826PIkfk2S8axTRsZLg+uVr58L1x244z0wDa2PAgSmu5O+s2Rj6CCk
         VN6+jePaS29HeVV0fCWX2UcdvfWujT9aHEZsimEzNN5jiSP3n5lsOg+pGxDlUQg39eos
         kZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089301; x=1790694101;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYZSrvfaNRUF8vysf/3RvkJxXOyz3bEJ1eP7jW1LNrc=;
        b=CNMQCL7rHUDafCwLHKmeMjZEdIArKWkgojFJ7c1C6Sc++JDMjbkBj0BkSZysKmLbxu
         qvu2nqwWy7zgEkNpFlXZ4MnoXftZKAKvldEl75DAxkT9B83f65uTbPZuuRcLPNFfKx35
         U45HNmQ71AdQ5Ci9DcH7esrZwsV6UCSUWOQZQLi7MEtDiEx95yC7B4ewUnKZssEJ+v/l
         Yks02FKHnoQ4NxkWu1dcwCcxTNRU9N6JbyDZHKbriabo8CfcXhSdesI21OnAXRxpVy3G
         Dz9imBsnO4E1RZaoLvs442izCSZhkc51+aT2qJZuLyt9B/3n/Iywhxa2bClGeHxBXyod
         6jng==
X-Forwarded-Encrypted: i=1; AKwUvBxYWkfIqV2R/kP5LwxiwY34oZOfijccmF/0Kc2Qa5YIA5CDUgQuJM/hTBb3HCZXO9RV+jFpJD/4j60QH6ciY31I@lists.infradead.org
X-Gm-Message-State: AFuF++nH3lYDXDu5fjVoEvPPUhDxQCH8BtUgRoawwvBWdCU6JOYLsPmJ
	EYxlFPD8HOTO/PSRjOPcrOS9ExTlw4T9IkQFe5Ff9nAWPJ1rEfj9I+oBhzAALFznvgqAq8Pt8xb
	fYlC/
X-Gm-Gg: AYBFou0FPuW2kac33ZSqmYtFr8Uq9OBzVZ1ngOCm5+EsT/lBTtMCtmEvZVHmj4SbFWD
	03cFwyKYXkwC88O2hNt0LC6yLFbyMs+ODVjyNI6or5VfETsxn6YS7xcZzTapsqMwnLrbyuzJx1e
	jJtFQeyKOOdC/o4bwALfszYMrKQj7gaN2AX16174PqNdZe/2hxZF133/8LMkdIum3Lxv2OScSrq
	p6BvujXF1u1lmByaFETbT+yV87QdiHKHPnmTo9FeKHIlorHHwKoGRRbSrw4w5dZO/yfv7ZDtm7X
	oXnDbKS/vVm8tdWu3kjWAwrhXgaV2CjqC3H4Ld2TXy5mBqKncgc4JMEvQkGVH/8vp7wTiWsLim8
	Hk2vQ+PA8REBmcz5QDKoBlbZIY4nbFEc8SyXK/7kFFAkr9r9ZkvKmJ8+sdkYWg020T06/Lw4XCT
	TDTMXUVByafVEFVcgZlO6MTfI76DlBxbkhxElahaYYNS0O6Yn2f1mDgCDosPkjx0EqWcsiVpK51
	Bk1jG/sQdIxJB5POaa6oBeZQQdJryS+YtnQhCZV9Jv0VPaG0ubq5MP/hl7UhA==
X-Received: by 2002:a05:600c:6097:b0:49e:7cd8:b269 with SMTP id 5b1f17b1804b1-49fc57411a5mr205964555e9.21.1790089301582;
        Tue, 22 Sep 2026 08:01:41 -0700 (PDT)
Received: from localhost (p200300f65f19a9041d0e57515b2ea4c8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d0e:5751:5b2e:a4c8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fdaafa9cfsm61257695e9.4.2026.09.22.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:01:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Message-ID: <arKXJ3mlnq8E5SGP@monoceros>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-5-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q7aq3xdvldwxgy5c"
Content-Disposition: inline
In-Reply-To: <20260922112134.4167305-5-joakim.zhang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_080143_506503_E25E74E4 
X-CRM114-Status: GOOD (  13.80  )
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


--q7aq3xdvldwxgy5c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
MIME-Version: 1.0

Hello Joakim,

On Tue, Sep 22, 2026 at 07:21:34PM +0800, joakim.zhang@cixtech.com wrote:
> [...]
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. You can rely on
<linux/platform_device.h> to provide of_device_id instead. (Or if you
prefer it, use <linux/device-id/of.h>

Same for patch #2.

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>

But please don't rely on <sound/soc.h> pulling in
<linux/platform_device.h>, so please include the latter explicitly.

> [...]
> +static const struct of_device_id cdns_i2s_mc_of_match[] = {
> +	{ .compatible = "cix,sky1-i2s-mc", .data = &sky1_devtype_data},

Missing space before closing }.

> +	{ /* sentinel */ },

Please no comma after the list terminator.

> +};
> +MODULE_DEVICE_TABLE(of, cdns_i2s_mc_of_match);

Best regards
Uwe

--q7aq3xdvldwxgy5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqymFAACgkQj4D7WH0S
/k478Af/d+mXR7ED7qQBSPvWMVUXs1dj0eXbvlU1Lh5/nYAdu6XY6ghnYahPD6sd
n5guUj6dgqPeGND4qQtAD2M3/dM0QUCC9hTxRNZhU2WPjJJ5K2GBgOzYKwBJZfOb
sEFLS72glHFiOGAXLbEMgc+3YbAIq6t8iidG56ujbxCfk6f6Awxs47Ly8uU0Xu6q
xqqHGYoEsPBZ3t+tDqC96+uRAThOXxUZ3Vz7Sj4ieXZhnE9HCeLd+rL2yb6CpC/5
87kaauk0tor1zrnB4fGRI7XUxWeKR6ojH3NlJd7xFKSimohFKw1t/PFOVQI9iggq
1pNvwN0bLxN7Vx0RnlTeKcBO9cZ4BQ==
=rB0Z
-----END PGP SIGNATURE-----

--q7aq3xdvldwxgy5c--

