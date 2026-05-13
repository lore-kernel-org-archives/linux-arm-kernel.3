Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C51BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=; b=rTF/quNiRs8hqodGM+s4kEJQmU
	nVRXUgh1PD/7S3DzzvjbmQD5g4LcBFPYKMwoMwzO0YhiNbt6DsNEo8fXmXWA3BDMK/sBOJKmAIxTH
	/YuaB4XvdTMaD7sZJ/lG+lBG0wWYCbQ+z5/WjovHgwgGkv9mjo/JiKCTXK0nHeXycjtYmshXln5er
	pqwSVk95KY53cQjWu68e5Yr+AIFkjP1gixCutcBddEIgdXU3Yjvf3gXGmEYEZ3jq3FtGNCOimgXer
	tAHzgdObz4UkJmGb3WjgSrx224TM0PmeYElwkfoj+XqwIdbHwdLWiyWQ6N1boawyN2Ktlb7XnLjGg
	iJcoQxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG7O-00000003hBx-332O;
	Wed, 13 May 2026 20:23:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG6j-00000003h5f-0LZO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:23:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44a5174670eso4079922f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778703783; x=1779308583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=;
        b=lK4ppRPz57afyscpxDdBLijSdn6M1Axv8mtnbiZlPdW66VIDxLck0U9W7sfSRLcoa2
         CoZbCcEBGb1KdjXl/vADHRchLIop/pNGZDcmsi1jLQIfj1s/4S9R9PHHdDkZnAOlBb2D
         gwDx20UKMHii8W02GQdkk0bDDZKhy4ddwDvzAP3+n+diHvB7LVs2ySYRDy5ViLdmhibT
         hEVxibnb5+0anjsZCNxZFYHPM6EyZ1caG53yWgMF5AYacB22Bzzled0iSgVfmyYtM5e7
         7LTZtBd9ubmzJJEstFe9ctacaC2Zmex5QjDOQMbCdVTrq+dKqwObe2PqqmAVYEyjH5xS
         /upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778703783; x=1779308583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7V1myvD5g5e+ykOUotYKcza96x6t5F4ELRDkfltp7Vc=;
        b=Mt1qYvZsS+r2QvBIMOc4IkTjeEf0csOeFmVRhSn33blagKEYnUGNDVifOIIkRpjvtY
         NtmqmdnTfiP4pqmdVrPrgu1xvJn8KpxRBb8D4rxwWQOHH+ba+fvU7tudVNkRbzg/Qd5h
         2R4F0VuzeklWeOk5xFwTMka9H3iPoIlvOCBRXwh3P8bsLHEzLSDFRPKl0bFfbDYvW5S2
         Wa7xfG+DyHkL2VudcBoeJruObTjcusZfJkx8Os858HNu8urHcGKVONf/bZkMdEjYAK7u
         ypfgSAXHg4LWunhr1q8qYdP0g6fVQI4hOeaLhX+GmSOYS31GFcYe9jWQ3ffIrGM7+nrX
         1KPg==
X-Forwarded-Encrypted: i=1; AFNElJ8AVpd+VhqUnGQuIdGoBEN5T5MMk5DussLnlUYESHXiCXkHPa/q7NkG4mnBg9RIUyD4m7XBeE7u1axXLoQHJCYA@lists.infradead.org
X-Gm-Message-State: AOJu0YyPT3kRqcpBmt0ZRtB/0scfW/6mSzwfxhvFL+Hx58adIH5pqtjT
	qFTU3TnfrdI1zuK27YLCWY4PHscPNFWTMsKGnXa3eYVcVNpIAyJrF486
X-Gm-Gg: Acq92OEhMGN39yINLvkiIxCHerlHuVnG7EFB+hot0enErF91YfzncWgH/a5y6/b+ENd
	UD5ncJqlJ/RgrYxPT8OfgYRgS2ruHhhq8pV9CNFKpZpTrMqmvQzsyRgSvUz1DDMFmIIiwxmKUj5
	KJPptIpEaejdGEPupYt4ohbNYdWT201feObAd4Ai6D+dxj43gihzmBDrE8o4dfBOwPeVTmUHmQT
	CzRBhsaiBIJiUndLQomn1M/lT/9Hb/bQGReluWAHM1ir3vZaQg4393/r1o8KkHWSFdS7YjjKIq3
	5kVD2DktNVa2Pwl8KR1IEarj+XAk4S0Oxzqqj/HF8cNP29xbFUYKqVHUVOeE+PqTgQ9kSKVpony
	J1OcwGgsR7yPurC21G2USt+FvgzxMQW4Hv7/Wuk7tOFSnrdyNlqLoGhFyMjyveAhSh6QrP9uA6b
	QAd3WEEP4eD9UVVv68G4SLDqO03/xHFoG9/HtguhG992u/3X1Vq3mYLx5UWOpbOdoKUz5qrnSCS
	6sAXnsB
X-Received: by 2002:a05:6000:24c6:b0:45c:154d:6387 with SMTP id ffacd0b85a97d-45c7a7dc6a2mr7430880f8f.37.1778703782701;
        Wed, 13 May 2026 13:23:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm1279025f8f.15.2026.05.13.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:23:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] media: rc: sunxi-cir: unregister rc device on probe failure
Date: Wed, 13 May 2026 22:23:00 +0200
Message-ID: <YRYbhQnwRdCZPKQIjbWE2A@gmail.com>
In-Reply-To: <20260424000000.558-1-mhun512@gmail.com>
References: <20260424000000.558-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_132305_169206_9D62BF29 
X-CRM114-Status: GOOD (  17.78  )
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

Dne sreda, 13. maj 2026 ob 09:11:03 Srednjeevropski poletni =C4=8Das je =EB=
=B0=95=EB=AA=85=ED=9B=88 napisal(a):
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> After rc_register_device() succeeds, later probe failures must undo the
> registration with rc_unregister_device(). The current error path jumps to
> the allocation cleanup label and only calls rc_free_device(), leaving the
> rc device registration and resources created by rc_register_device()
> behind.
>=20
> Add a registered-device unwind label for the IRQ lookup, IRQ request, and
> hardware initialization failure paths. Keep rc_free_device() for failures
> before rc_register_device() succeeds.
>=20
> Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/rc/sunxi-cir.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 92ef4e7c6f..cc64a68dfe 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *p=
dev)
>  	ir->irq =3D platform_get_irq(pdev, 0);
>  	if (ir->irq < 0) {
>  		ret =3D ir->irq;
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, i=
r);
>  	if (ret) {
>  		dev_err(dev, "failed request irq\n");
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
>  	}
> =20
>  	ret =3D sunxi_ir_hw_init(dev);
>  	if (ret)
> -		goto exit_free_dev;
> +		goto exit_unregister_dev;
> =20
>  	dev_info(dev, "initialized sunXi IR driver\n");
>  	return 0;
> =20
> +exit_unregister_dev:
> +	rc_unregister_device(ir->rc);
> +	return ret;

This return should not be here.  Device must be freed too.

Best regards,
Jernej

> +
>  exit_free_dev:
>  	rc_free_device(ir->rc);
> =20
>=20





