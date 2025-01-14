Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9E8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 01:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aU6EnYM1FFu/Ni2NC3JHueKkzhR3f1t7juJ8cBXKNg=; b=wyboQBLmBuYxuIvvCAm2rSzi79
	wCpMGVfFUGLSJepM76jfQ9CgyXYZEMUEBxDvNK9qhRfQ6R32uCGYpZIa7mS/oKQH75gofHSyZ81ry
	KWrJm7+45zbDP+LHIP5ZBDY1zgVwp40tc4Q1XF+pEkoG0X+n+MRISz82708+EC4/wUeHqCcJUfc5J
	lyjkDG65KDNyybmmqnFtWgfsk/b28PAG3jn022QOcMz3aKco+6ErwJUSDFHtiYdug3x238FcuL1mQ
	ujQoFwbEOIuseMB+fF3iT2klOf3VEHdR0PKgDcK3L5MHlrOaRjtoAu8lfTC+1N3iCEoNgt9tS5zOJ
	6x0B6GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVnF-000000079qa-2xzV;
	Tue, 14 Jan 2025 01:32:33 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXVm1-000000079dF-3Ghf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 01:31:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-303548a933aso39671801fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 17:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736818275; x=1737423075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aU6EnYM1FFu/Ni2NC3JHueKkzhR3f1t7juJ8cBXKNg=;
        b=L+oIffV7+3Y6d/FN68HGLZ1ORyTvFzvwaJV3bP5Pz2GLBYAOh4Z78U6aek9tXehcc6
         u+oZSflBv9hCbQPBC6uZ2WBm8crsCdvmSKZ7cvJZPJjd8QuKnZgrscChtQ6AuILEx4g8
         f3jfgkjWggbTvgwCZNh9FUmvGJn6yi+bGonLqD/ix1PWtPEZ7DicY0TLgVvQfUnTsmbU
         kuvu5+CVHc9/hQjUu5mwnEOfjejU40KPok2msLz7Xqi0c3z0Vuzq2UztVwUsEPc9upyr
         W9eLl3p7ySCTIhE4i0N/Xj6Sm46N8/Wc2vRYN8Rz0/Jsin2/ZszSb4NKFy2TdXcPhlPz
         RBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736818275; x=1737423075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aU6EnYM1FFu/Ni2NC3JHueKkzhR3f1t7juJ8cBXKNg=;
        b=EzA4Z11ifw7cYcTXm+lv9/eJVbOVuSwTrJSFShtmvurjaPpt8p0U68Rf4c8yIqYtOm
         8gVybk+1oninJfcdZqEjFhIb0U938hKQK5AK7h5YSUI8s8JU1eteseMGqTX6QsBxUJjG
         69ycXGH86AB/zXf6skLnRaZNXuEw6+WQZ6KberV0DjOa2iX1wJGnE92UYL+QbLTZ2tnU
         qkY6VIEAjdvkBOnGoyVY7JOkhEFaLqFxbGSFLfyTtxOSXhmqyA848qEWg80XJPxINR9q
         b9q4KNxkcfNBouX3QGhhEm5Csr170x9zY5OzuonY0OsLbx+pBOlY+d6LHZGu5tVY9vJy
         fFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNV/dEUppl5itSpDuut0S7EYAFfFGsh8/vZDsPZNH5R1enBKtb5Y/y+bms1iU9dQDP4LQiZ0gb3QKPWPZUsSei@lists.infradead.org
X-Gm-Message-State: AOJu0YwbvSOx+XsV5a9rp4ZBpyoYgrlIhZUwxrOvhu8+KKc2kmiececT
	J9yV875GxmQjOJIZ7gkR2w/7gMLQDIfcBw4OXEkTBSuXhcaTbEltn8gaJvdLAmmYhVEa2sENi2P
	3Ri0mMJA9i8eKp3VaWRhSriDWxTA=
X-Gm-Gg: ASbGncvvi1iiYKz3WG2KYUEcgi3Fe2GgvP3FpXtRy2rZrR1IGI7zZS0d/Ho7ZorlLBp
	a8E8gs8lk+v1ciX3K60l2YBnXJmI0tbjmCdOfltwxBeEV21+6Xn4E9fSc5ZdhQ5erDw6tbQ==
X-Google-Smtp-Source: AGHT+IEUJmr5CzHShAQpgO68JDpagn9ocRTq7BeVsW6j7XDBWpIfZvawE2F15mzspC+LVxD1aFCcu76BGOg5HtppGiQ=
X-Received: by 2002:a2e:be10:0:b0:302:52a8:243 with SMTP id
 38308e7fff4ca-305f45db514mr82377271fa.30.1736818274651; Mon, 13 Jan 2025
 17:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20250114011818.2401479-1-xiaolei.wang@windriver.com>
In-Reply-To: <20250114011818.2401479-1-xiaolei.wang@windriver.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Jan 2025 22:31:03 -0300
X-Gm-Features: AbW1kvYlHMYh_9BWfuP0hql59S9fdsu1xJunec-2pANaEdOBUzmqZvZq2hVMDbI
Message-ID: <CAOMZO5BpBjPhr3Y_+28ob48N-6GMaA640=d=VTVxfz=vq5PV7A@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx8mp-blk-ctrl: add missing loop break condition
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: ulf.hansson@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, ping.bai@nxp.com, l.stach@pengutronix.de, 
	marex@denx.de, aford173@gmail.com, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_173117_817631_E6C2C7BC 
X-CRM114-Status: UNSURE (   9.05  )
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

On Mon, Jan 13, 2025 at 10:18=E2=80=AFPM Xiaolei Wang
<xiaolei.wang@windriver.com> wrote:
>
> Currently imx8mp_blk_ctrl_remove() will continue the for loop
> until an out-of-bounds exception occurs.
>
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : dev_pm_domain_detach+0x8/0x48
> lr : imx8mp_blk_ctrl_shutdown+0x58/0x90
> sp : ffffffc084f8bbf0
> x29: ffffffc084f8bbf0 x28: ffffff80daf32ac0 x27: 0000000000000000
> x26: ffffffc081658d78 x25: 0000000000000001 x24: ffffffc08201b028
> x23: ffffff80d0db9490 x22: ffffffc082340a78 x21: 00000000000005b0
> x20: ffffff80d19bc180 x19: 000000000000000a x18: ffffffffffffffff
> x17: ffffffc080a39e08 x16: ffffffc080a39c98 x15: 4f435f464f006c72
> x14: 0000000000000004 x13: ffffff80d0172110 x12: 0000000000000000
> x11: ffffff80d0537740 x10: ffffff80d05376c0 x9 : ffffffc0808ed2d8
> x8 : ffffffc084f8bab0 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffffff80d19b9420 x4 : fffffffe03466e60 x3 : 0000000080800077
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> Call trace:
>  dev_pm_domain_detach+0x8/0x48
>  platform_shutdown+0x2c/0x48
>  device_shutdown+0x158/0x268
>  kernel_restart_prepare+0x40/0x58
>  kernel_kexec+0x58/0xe8
>  __do_sys_reboot+0x198/0x258
>  __arm64_sys_reboot+0x2c/0x40
>  invoke_syscall+0x5c/0x138
>  el0_svc_common.constprop.0+0x48/0xf0
>  do_el0_svc+0x24/0x38
>  el0_svc+0x38/0xc8
>  el0t_64_sync_handler+0x120/0x130
>  el0t_64_sync+0x190/0x198
> Code: 8128c2d0 ffffffc0 aa1e03e9 d503201f
>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

