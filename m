Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F42EC01A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=; b=lY20Mfr+Wrmp7N6+m/OgIPuwXu
	4DJkP+9uW9/cMsCoSuhFPjipURHZMRHqVEaHTE1gb9NcpZq2GEe5BbUb7K6rI03xOqSa1kfPfu423
	GIkK/vsEJD99jRRQt83JIpJ0hJE8pcZ+GkaiKLP8ut7CsoNFTbFXoUBXoezbGF8ocSLEAvlQvv5qO
	3hvX09kmuLjdSRgz3ojsFYSX5tN1DRvZe1NpwXfoqc1lkjvWnh15PhS04LXJjBt1KXVyVDUh6JlFS
	Vaep5HfC24Ryu6l5/PnsPVlM5yXEDr8w+bFFsA55pkQ0egZviMzGvZ1EmZe6/lfNsNFUM3ZKI7F/o
	kpiZ23Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4aHX-0000000GFo0-1zIs;
	Mon, 23 Mar 2026 08:05:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4aHU-0000000GFnO-48KG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:05:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fd27754bso30706795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253098; x=1774857898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=W0YwAo40inzQlOSmY5Fob39tOVYmUhK2W9hR1g/TJ0DW8zw54MLVVFD3N0Hj4no+xp
         ybTIwQRNtXRRfT084BeGpqwa6VdMC3c+ZQfEALvi06bP1j1DeBxN8PBPTHhD88zIMifB
         geB2N6DrMMiRPtMEJLmZl3qbwNmD6iLaiGzorpC0JCFAH6+9fkPyz58wPr99ZjgLDQ0a
         FXvsIWfb42gGOnj3gWPProNGcClYKucarllI+bXtRWkSFLCkuUcsm0637G5dj+VXBHWn
         xQuasdnIkYL3Zaj/PR8Ko/zDQ4QVa6pLvPzjs4vdlL5UNbbHhCkZXkalz80XcU1lcHQs
         pdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253098; x=1774857898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=E00auod+pI3QaJFOgI/oRpWr9M5fFE5dVYw18pes3weEEqFgiFI1KoBRtuOsrKvoEU
         B97YrNC1YRUB8hqUakgNw5sAKkEWkhAXeBdFM6AdeSsYTnpPgywgyNiN1+S47rFF8jO6
         QdLRG4dmIiS59BXFxIIfc1zzVJ1UT1zw7x+lqOr3zzsDDweddj59f/I6kGu15TsZV/4j
         xgOQA4+EiFvm8a3hXkZc3xbaIUi8G0vCZyWgj6LxNQuOzs2qSolku5ptE0zVKUe8K8Z3
         KnqSsi1htA/FiasQFOgwyAMbJ2IHf5TcVGg7xxEuGelRqceO/msiKFaY/v0DQrWz7Q1l
         XRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZsc+Cm9bCG9Kxfgez/8yo25WPkyYXZF9LUp0BXybi6MlYXHDGGGwprIdOk+sF5Vs8tMbcMW3lFNAH41VX/Ae8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyru9822UDZKVUQujIJr7BXDJr43sFk70QpLZSse96ZLvN4m/0
	GfqwuGQeIy/fLVkWvfVW8Jdw2oaq9X8mn6RWc4jTT0l1Kj0KJo6gM0n3
X-Gm-Gg: ATEYQzxMsyEtPfm3gcdDy+/QtkJFRVb9EIHcd1KSWmWaB+J/WaYoArgvrsG7sy+YZER
	UDmqK8NzNj0gcIgUgb5/2D1hqv0XAJ6vC3zIj6OrB/eJJM9PC/N1QrAzoCU2NLYTx/dHLuFcQ1H
	gapSb3DV5mvi8kvuuHJTyFX3KDZtsmSrPhkzslXZ8x8EtTKU5UF0KWf2RwE92Isgen15oS6DdOf
	VqHAbmNKPX2vfKcbzfeOhyoJsLaBQSgCYwdsn5bPR5O7FA1JIiUnTYlfaCrXP0qe1aAqzMdGmK/
	LLvZydJNwaAQLtzrQWqcif9IhCwonC55T3AbnOYg8feVhceCVEBMxtRIqNKLXwbV7q/456pUeh0
	dOPxqDuY8jiKfIhtAVJe2c//ig95naVXVXHpzX7m5BU3T1xi849EscElAR+9Jjk4HEoalxpqIv+
	pErp71GDHhf9ER21ZqrKHMLG63i0hCbAuAV+7/vsVj1ij1KTm2r3OPm8ZnP5379HxPZbFdM3oYX
	pB2dWTK
X-Received: by 2002:a05:600c:4e8e:b0:485:3e6c:aacb with SMTP id 5b1f17b1804b1-486feda8c69mr158012695e9.4.1774253098203;
        Mon, 23 Mar 2026 01:04:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-69-125.dynamic.telemach.net. [178.79.69.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d452sm76320155e9.19.2026.03.23.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:04:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 pengpeng@iscas.ac.cn
Subject: Re: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 09:04:56 +0100
Message-ID: <2402496.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
References: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_010501_076757_DAD0B9EF 
X-CRM114-Status: GOOD (  16.71  )
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

Dne ponedeljek, 23. marec 2026 ob 08:03:14 Srednjeevropski standardni =C4=
=8Das je Pengpeng Hou napisal(a):
> Cedrus consumes HEVC slice parameters directly from stateless V4L2
> controls, but it does not validate the active reference counts or the
> ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
> reference arrays. Oversized counts or indices can therefore walk past
> the end of those arrays in the HEVC decode path.
>=20
> Reject HEVC slice controls whose active reference counts or reference
> indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

There is nothing Cedrus specific here. Why not move it to common code?

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff0e..d68da1eaa7aa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->bit_depth =3D bit_depth;
>  			cedrus_reset_cap_format(ctx);
>  		}
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_hevc_slice_params *slice =3D ctrl->p_new.p_hevc=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_idx_l0[i] >=3D V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_idx_l1[i] >=3D
> +				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +					return -EINVAL;
> +		}
>  	}
> =20
>  	return 0;
>=20





