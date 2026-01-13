Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BC3D0C83B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=; b=KzohulLxdydHdkFwuY75KF0l5z
	yumyqKeEK/5TWBM9kV4D2JlPVH2e065mEck8nTjh1hY6T7RDzmaW6w++V4DHBpEybTkf54FVEtI7/
	ScPGtk6fZtKRtyX4bfda1MBq8PLWuTAiRkzKeBXXms4fAZxGltjVshGf3xEQpihS2Oop2z1nwSWwD
	V8g6UG1CntoadCQr+Mj9DzOp2yD4Bp/aATRtU0MGsE2MRILMR9AubUtQxyUpE85IpjVU9GCEbXmJE
	yUu1JqBofKdQZYLGc9CAJPkUYQkDz558SRd6lH2MJdhjdzw0pF7R1H3s59zW3wiww6AR1W18SIayZ
	zVq0TmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbca-00000006uIl-26FK;
	Tue, 13 Jan 2026 10:27:32 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbcY-00000006uIB-1R9F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:27:31 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-12332910300so264501c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300049; x=1768904849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=;
        b=bYHsB63Lb+DkJSAhAhOeQ8r9KtR+Ti0+4/kAWJhhHd+D4O76SgByUjpPkRiZ5x6d4a
         Qyzl8cThxoSgI8/E7R988fdFIYZq4p7GLtYEOfP+PAcNMqrez6/OwAHX1pLzyLRLfkP5
         6NeVCzptax44XRdS+exxEVZy01G0w0I8usgp1n4231iGNLTxVv974IfAMBjsWQeTjMjE
         aQCaUbg9jA2Ena6hmN4OYiE+c7aXohMhediII+QqJVJy7l0gUjGITIrMrVZ27RNHdNRK
         13jpMhALDLKoHoOl5jqgGign6IqncSguuzGexyT1YEDMGJ3/1OMuj/LPX34aPRfXmsNr
         cAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300049; x=1768904849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wW2RV5GZiteOIDgKP3C/DU2CD20lK7usX0CbcTmS+0w=;
        b=kkIkP3iTUgz/c91LRTFej0ro7HsUbn4XN6ZvATcbAfQMSeBEpVff3nzrgHAUeTd9oF
         ygTxHS8B8Y0gJCxo/p6tal62tWc2cxurGlHUdqyuBtza/0mkjSTqnvANo/7+OZn3H+ux
         K4Fajp/C6spXv3j6ECFuCD8OYKr4WFH8cass8jtZgSmdr9dmPpGpaVwd+sN17ZtaMuuc
         MXhuB/Udz9+gN0UedBvMhjHXXZm0lmTOcryN9ZpWXU3zueFLsMe2tA+23CxUKvRI1NvT
         wWWjQTVNOwLq3OVzcUmhht7ZBm0nTQFrqDdvE8TKQ7SLBTf5K5p+Gwf3cxejwoeWpTf8
         tVIw==
X-Forwarded-Encrypted: i=1; AJvYcCXk3Xyyygmn0sm7YiEU17HoD6yKoLxb13S/SmhX+ryInee5gMt8VHDyGeD2bVEubTULii94d8dPshHrZgRGvFPY@lists.infradead.org
X-Gm-Message-State: AOJu0YwTobYVx22kK6MCi7JeBbdQhj/eAQDlv/nFyHDnMrUv6JTMOo26
	KtoLcj8NjVtZ5SEkENo4oZoYvOf8m1wWHMS1kjHxo9jmnMJIh6VOK/Ly2c1i1o31gMug6SfajCy
	48ElgmcGBnjcIgXwf1dN88sh/d/OOPm0=
X-Gm-Gg: AY/fxX5TeTxzsKnh0ipkumcD5FoM2VMDtHnlnTetolq6k75wThcnQTwaS0VGOqQtioS
	pE/Y78HRYDakfzcqLxaB5UaPLlYWSiSY2PXVHX90FhadUHrZ11Ssh5LVu5NbimpSydRMOkbgKm/
	neXnUWG/aHb5bCYvHFseRKdTu3sXf6j49comZKDOXrX6hkPzBFHvsEkrAy9YDCXw+HfEr9DOCOS
	wVLiWtVnJxpcEtytzeDV/qWRq6POFqC54QtqcVphlr5UoGnXBt2tatJC5WuzXP369zqyis5V6pb
	ca9w6QLp6sWBEigOq7AUK+r9Nz7mkznBGJRnV/oUOxyccjVF3LRM97L3upCIe4IrAJ66w9l1TpL
	F+nGsLpC85Dk29Crapyzz
X-Google-Smtp-Source: AGHT+IGfZnTOvyA+GnXypmSKKp8ss0rUr7qVhUutqVZTtjEFsV9r1oGBsX3My8UCe04SYXGn8hA8XADTEg/VbdC5KTM=
X-Received: by 2002:a05:7022:621:b0:122:9d:bd43 with SMTP id
 a92af1059eb24-122009dc38cmr17343117c88.19.1768300048919; Tue, 13 Jan 2026
 02:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com> <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-5-d2fefb36263d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 12:29:58 +0200
X-Gm-Features: AZwV_Qhqne5fRPBq_W-RkiEIzWVDm8CQPMcCvVpNRV8tzXEGjqNR0mdGDlyatAc
Message-ID: <CAEnQRZDjfyrcMj5ykvAQX1RzTMBCj-EaiM8SSKePb=6FyG+1cg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] remoteproc: imx_rproc: Add support for System
 Manager CPU API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_022730_380471_9A86B35E 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, Jan 9, 2026 at 2:16=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> When the System Manager configuration places the M7 core in the same
> Logical Machine(LM) as the A55 cores (M7 LM ID equals A55 LM ID), Linux
> can control M7 using the CPU protocol API. For more details, see the
> previous patch that adds LMM API support.
>
> Changes include:
> - Introduce imx_rproc_ops_sm_cpu for CPU API operations.
> - Reuse imx_rproc_sm_detect_mode to detect shared LM and set priv->ops to
>   imx_rproc_ops_sm_cpu.
> - Implement imx_rproc_sm_cpu_{start,stop} to handle M7 start and stop.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

