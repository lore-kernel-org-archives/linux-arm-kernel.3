Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BA2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+vGZfhgz1bD40ocE4HqL+yXZ99EIYUdksleBRdm8Wg=; b=ZdQjB5sGzzpaNlHEifIe4YxSit
	aAJkq9y9ZOzEul8lfXm4pIappc5U63GXNqGlE8Lw2qaF3dISnKZVrCwINgRfp6zvJprQblr2hwCL0
	QT1NHpzSLYah52WPxi/TCxB581jJjqh8R+CiCc5hrRisHKAf0IgfeLTDoHCWO5lnx8Vg5Ia+j4nWe
	KYWl50yKZILOfImjyCJ2Ym+sKAyHYKtMAMHAono2sAtQBy0lkdGjrwbNMsS5Tr/43vu1asMatrisr
	E6goBmGMjYP31DUTEFTfUoRRWFn98eDro1XzmVanMq5SbGUI/T7VoJcWPxr9M3WJLSsdSBXR+mL/u
	WQ0lOEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcCr-0000000Bv5Q-2IFl;
	Tue, 14 Jul 2026 12:25:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcCp-0000000Bv4P-1YSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:25:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4720d22c94aso881242f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784031945; x=1784636745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+vGZfhgz1bD40ocE4HqL+yXZ99EIYUdksleBRdm8Wg=;
        b=Klwf8gRHYzKUivlq5vvjFqoXuCWRNEf5VuDEhM031+80RhFIU3t6vKMkRh5i2gjjmw
         iIdejI11PScECgqONi4nssoXFcckSMZDbIOM+LUeohOTZGMapbZIbxSo1tVWeeSk+Fx+
         sT+1MOyWXNyQLR33tsbF0qsbA7wYbmgyF91j8g2dDX1L9/zD+M8DxE4+4u9pD1imHiQv
         HZW8Xuer1fuQA9Vutd55YzIyuqFr7IWR5Ky/HiNQCVIoeJ7mWrDLgdHJToQyaBqXjxuF
         5shnA2dPWG5fDttnRKJ4uSSpbuz9shnzzgVGe820PIpH8OMIWM+0yQzwfzYWJ07AUIvv
         JGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031945; x=1784636745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+vGZfhgz1bD40ocE4HqL+yXZ99EIYUdksleBRdm8Wg=;
        b=PDtypLvtYJ05hUcB3m3vaVuMaDbYbpJ8aHihTv6MSiBWmn8KTZJ2XSV/gfP8OEd9lU
         iga9+0b+SGIP/9Z8E6Lhu/Bx398qbYLwMuM80XErpLmyDRiPc9jjNexG7Fnu5hUw4hgv
         t35HkXErFpjVcwwuLEcv2MW9o3JbfQhfg429Nun7z9iqVFwHWaoCHHjA2otCv10C+PLa
         WJn59QsNeZchn0KHBLFWsnifLjqsa9JTqwUwy0l+LXs83m/GEECa5gEMUN0K20S31ASM
         YD3GBpBxMs+VZKRfJKgYsj+jRcDAoarEnLVwKrhdmZbGDMjWM6IoDIMbMIBDFtPqVcsm
         mr0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5f+b4fVvBwNDbvUQ5HyFIsADjo9v+voAeR0Wbbr+VSpbPKquuLQ0LvAdWzKux7BKT0U0+QC0iqjwTbdfxaTG8@lists.infradead.org
X-Gm-Message-State: AOJu0YzYLlD0Ghka2I8C+WcJEtXsXIyRJkpg93PJIFWhR/vEEtpsD21F
	ZbApcYH3PAwE4LnIHHN/8uGd7pO0VkIinfQZNPnAmXARYPkxav/K68EMy6EO6bRYBbCbIF4tGcf
	UaCqi
X-Gm-Gg: AfdE7cnPHOvXYht9fpQE7yNwXje1iwRmzRdzVAJj3u5TfemaN84lMDvJ2JdOBFegpDl
	e/1WsCqsQ3QOODHKPvydAZj+pxxrxwr6Ig1yA4lmDmeNly78eu5hx1eHuZeTLfLxe+3dLlRLoe8
	oFuw7HmwDRc3kuNMGVLLI6aShk2cAouCvB2XNAj9/IVszlBWB9yt+al5l28t6aqgxdrcG73wdte
	/QFPVQQxR9l59O/19EHJqDoQvsYpubPx/1RsYhCZ3R+zeqSQmUIJuxDdoPnnnwOEJovMVchO61F
	7xJBnbSvJGY1CrR+jB4fzH1zWnwRKRqoeoSn6Pot997DpS+tECHnqZnCDaCJV1cbxqFkVCsw93N
	pcV1ArGlcpzDeGdPgmtkD2hHnignbf74To58a9JLTRIx+pq615s4zK7xGuUv9SwyMBNeYnnXhR9
	BkdFzJOdbrkJTtXb4uQn/gS+spu3REVS43arGk2rypdXuUnaza9ScrLfy2OnWHob0UGIdwF5DbA
	1Yz
X-Received: by 2002:a05:6000:2210:b0:46d:d5da:f0a8 with SMTP id ffacd0b85a97d-47f2dd08423mr15598269f8f.47.1784031945403;
        Tue, 14 Jul 2026 05:25:45 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635a63esm8284732f8f.9.2026.07.14.05.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:25:44 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:25:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <alYqhghiVxVW2vQu@monoceros>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-3-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2h5qyp6npg6rco5"
Content-Disposition: inline
In-Reply-To: <20260713081127.115197-3-cwweng.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052547_430331_02CA0BF2 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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


--a2h5qyp6npg6rco5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 04:11:27PM +0800, Chi-Wen Weng wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>.

Best regards
Uwe

--a2h5qyp6npg6rco5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKsUACgkQj4D7WH0S
/k4ixQgAlt+F41bzzFr8wApKEHEDE06Wyl2Bj9mhJ2lBUH5L4+vpMsXE0WVLJKmu
HL5Dt7P0owSyciNzhp+pTCgs7ucr0yB3ysy+rILUBGjH8sExdTwINM8+0I8q2mfq
uUinfFczaWbZRevyDkY9F5RPUt6WGRFz9uNnFrkZfNHOJL4jo69d7MftM0IW+ruv
2SQnD38ccuoMsiZYcVDkSnDVXcruoWqhk4ViKjx/a6i5d0HhZHyfA6eSAaSfR8zf
dHm5Fk26lHBT+xuv2TXw5FDGI2/h899mXnFcQGR9zsH5ImhmUvJIM+sL4FZ4fC1A
UTd+40tRC7LtdqphWXA0H4oK7F24Yg==
=GMY+
-----END PGP SIGNATURE-----

--a2h5qyp6npg6rco5--

