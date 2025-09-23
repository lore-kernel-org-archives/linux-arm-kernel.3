Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79821CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 05:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=; b=NGxchntRLu/R1G1eF06fw2bIsn
	icX1EqAs1KQpazFoW5aOSkQc7BLvwZAkAfNU+28fnrgVGpfWx4Q6OcfE28iwmzEaR/5p+N1BgznEN
	4t4jzUtC5NDcjThRzfSA3RvZ46daqB4pbIjTViiSW+zFhjg7x8e1MNF2bDyUQ8heRGztT/tWT9uXQ
	11bOjSgb62J4WSDQIvt+HHPHUhO6aCvjw9GodId1dRLqO0Kqcw+I5F3BkgB/JNnnzhY/vFFcr/xC7
	GyHnWol7hbCIpDXVNgT4H+G4MCVvQ2X7b0nQPjXC0JhEnAlzlOv2eUGeqLeVF6UteOS8zmAAkOZOm
	eunehXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vTx-0000000CRIG-1S0H;
	Tue, 23 Sep 2025 05:22:29 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vTv-0000000CRHA-310w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 05:22:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so5816852a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 22:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758604946; x=1759209746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=;
        b=MYK7t7m1YGoKNhQSgJBlJWKGX1Dly6OybzP3WgeHFROHhhBNokFoW1XoIj29QM3fE4
         Hxe00qxeQpncr1V9MhwOOwhoiXST7Ps71j4V79g7oRJ4u62flD6zSZ0nzul9bQa5/Xp+
         4O7qxjcQxJBpiVFrgNANlR2GxqmIMEvrUEiMXwcMgCBR+ZQ2zn4mUnSVdBbPvYJyxBFr
         TyzwTCwLDQhvFZohuZeOITEd7MlO6Q+IBM0j1Obc9iHhjAtwNcChyDjpwRGRx0fQr8Zg
         JTBKZ6c3VJWNLH77aux7bOCmDF6VZeUUjdavGjGtcxCIs72zHIcDDbGmcVbRjTLNbF9G
         wXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758604946; x=1759209746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dmt/sXOh8gCfdLN/NRWF2le0DpBMuP58ZmmKHufhPw=;
        b=LTqTdrvzCfkkGxEhi3ivfskkyZfG9xExvvH/CZWeEulHPTPc2CDhtqooX2n67fM0WO
         I/a5XQDYQifNoJGjzdcq6+Dk4PrMC1lonAcMuIWecItecZdB6cj7OpRHl8LqCkLz8TO5
         qpx9gRngM/xBA8ify01/YAcOgN5AliZ7BvLSeUPipk4hdSwDr1/AJB8QKcq9bGPE+aoI
         bL1+iVwGbwIzz/wkCnS7SZ638WrRjxS/3vSVek5W6HhokFhGCOzrwYj4m97ArZAGOfNF
         EoppTIToN9O+icJcyCib6ljzZeulkvr7oEz1tG2g0Vh2qoBUjGlLrSA3e1RDrc/j0Ebp
         QsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbHvpcLTAGrnYERk4DsRigvAuItIPDGsRxjapPe/NqJGCSNK0jc7VuqyQsE320yFYc1CcpSSh1ZUMYhuLDztNn@lists.infradead.org
X-Gm-Message-State: AOJu0Yya1BATJ5sXcJq+e2MroHs4g9fPgmHpM2wl6KkNzDBGdxBzMHN8
	NiW/lBimXDln+cWgX7IvTKAhXgU+y6Qf+CK7ToWgbZP9EZj1schwJIfr3voJLjy6FM3Vx2gXW/7
	BpG9USagaL4v8Ux5aD/+LcZ5Z4Q8Qk8E=
X-Gm-Gg: ASbGncv7dNmJp/ONMMj74WkbEdRnaNnwbxdAqSzkjUde7ac89p3NRVaMi0tKp85toHP
	c/nAlLGp4/8+y0qWmTycdBgi9PAJDG5/yYzFl27uRtzHZC38DTfg9AoBe9KJB4bRBYd1REMIHuU
	sBDLntEE0p/9BXIWpveUq6S3rSMISIWOVSsfEEbDXrc2cUNz++D2xpH5AHrhj0zK69ZSx3fqdvy
	8+fwNM=
X-Google-Smtp-Source: AGHT+IHjWF0OdvwVEBZ2nx87jdr7LoutqHAGG2hOFlgZ3AbCfU9cADrnOPszTGryVxRnY5J5JPGYaDNmdz6D3L0+UhQ=
X-Received: by 2002:a17:90b:3d0b:b0:32e:18b2:5a45 with SMTP id
 98e67ed59e1d1-332a92decfcmr1741778a91.5.1758604946515; Mon, 22 Sep 2025
 22:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com> <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Sep 2025 13:22:12 +0800
X-Gm-Features: AS18NWCk-cLOeEky62DrDgsGiwmbzQDyczljQVACaIeDqm4vgeh4qeeeuazbSbY
Message-ID: <CAA+D8APwkqsAEz=xgaZ9h_4NbFemMoACEJ=xXjVkGhd4mTxmEg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Add an entry for i.MX remoteproc driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_222227_761132_989F4309 
X-CRM114-Status: GOOD (  14.42  )
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

On Sat, Sep 20, 2025 at 9:16=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add an entry for the i.MX remoteproc driver
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu wang
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df319f9762b369a2746ee7f41334be9b57e7bf9b..c25aad1ad4386623065058d1a=
7cf92e1555ec7fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18508,6 +18508,15 @@ F:     Documentation/devicetree/bindings/clock/*=
imx*
>  F:     drivers/clk/imx/
>  F:     include/dt-bindings/clock/*imx*
>
> +NXP i.MX REMOTEPROC DRIVERS
> +M:     Peng Fan <peng.fan@nxp.com>
> +M:     Daniel Baluta <daniel.baluta@nxp.com>
> +M:     Shengjiu Wang <shengjiu.wang@nxp.com>
> +L:     linux-remoteproc@vger.kernel.org
> +L:     imx@lists.linux.dev
> +S:     Maintained
> +F:     drivers/remoteproc/imx*
> +
>  NXP NETC TIMER PTP CLOCK DRIVER
>  M:     Wei Fang <wei.fang@nxp.com>
>  M:     Clark Wang <xiaoning.wang@nxp.com>
>
> --
> 2.37.1
>
>

