Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C901EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77oRktQDXcPSa7iNhydGjuL43chSPN49aqtkglietE8=; b=d8lEaCPt265wf0YBqDiyYzhL/X
	cvxIqNlK/16kzUYar44YDCeeKA0DDKVP7Jj0G4BnCege7vzLmzzps9u+Xw9rza0AxCu1lH5mEkjia
	q3AdzfJpezGUXEszEOwJp5YlIvLhvxiLLUH8bzpyUGc2syVp3z9jZ7NKSn3prF6ZLPDPLRVwM/e7f
	hDl0bui4QEiQwtivWJ8YvuqYiratg2YJjN7S0WvoyGl1Ete4t8yB4mbogbDGaosJrf3h2kJgGVNv/
	5l06rtJuseFbZyNGvuCDEV3z7jQlgl15pRxwv3Hn7JhT1EQIoL1GrscSvO07ysIr+3jMXmSIGw+RF
	Oz5n+w1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLV7-0000000AW1Y-3ks3;
	Thu, 02 Jan 2025 13:44:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLTt-0000000AVrh-25Qn;
	Thu, 02 Jan 2025 13:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E21DBA41096;
	Thu,  2 Jan 2025 13:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B05C4CEDF;
	Thu,  2 Jan 2025 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735825399;
	bh=Lf0HL/WDMxh9e4xI2VHJmK8Uk1/y9zM9fP+Yqjx5kXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kPmq1f3vTzrv81fg7oblXEuyFGi12fV6K/sxZW/qxfXSUiRj2/Ngv3xGqQmFtb9EB
	 0ORTrqSHMm0AjPwpVpqxb3CRwqUeVCWiAQ4TMAK+J8IeaMzWJTUsj1E/dCs2PT/gRD
	 5uo1bACyeVioXSvSCRuM6S40Hz1qK6cfJIziO5MSe4MoLVXfpsgK1bEi2QKqRIGRUZ
	 +CZki6/tTUs/9ZE8zWx5v+0a3HhvAPwA/g86zqfapPb3YojmPYGfzK2xMTlQZ/YM+j
	 JHVxPUSadwS2LJpYAPYd0aJGneo/cBwyZsFIX4WYf9MuVRdc9jq90Ydon0dw7Jcg/k
	 3lK5sLTAkX6Zw==
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so14036287a91.0;
        Thu, 02 Jan 2025 05:43:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrGQXzjd5ixQ2SPLBGY3kEnaWdQtv9moGTPidfJQVgZPARdvUui9m609KCjJ16QIlIFZWMPcIUFAz9S1AV5Cs=@lists.infradead.org, AJvYcCWHiUkUPLCN98wSXYTFJVysHE/WJd4KOzQzrc80bxKuHb+vLfPPu3q6fz51V7/4KXeTTuGqxEWOWDXExen4zKw+@lists.infradead.org
X-Gm-Message-State: AOJu0YzfkUKSWNrJ0I/lf6smOCY20qtkqwkRVdVkpIJpDpq2iH8IEP+n
	ZF/4ixQeE2szMJi1fUBOh/KIWAab/Wth1w67XNrZrVPly13fJ5Ee53I/g90R9vC9AOnrZNDsog/
	clnk/HQNne+JJN9nPPZYPRkuk/Q==
X-Google-Smtp-Source: AGHT+IHCxTQkblgIukaSC0qoCzRgvJzZht4dI4RJs3qplCpdoTIBV1OD+tbt8prOFp1oNASqkY/F9sDtdJoiqhDkTzo=
X-Received: by 2002:a17:90b:54c4:b0:2ee:e2f6:8abc with SMTP id
 98e67ed59e1d1-2f44360816cmr69363501a91.10.1735825398962; Thu, 02 Jan 2025
 05:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20241204142626.158395-1-fshao@chromium.org>
In-Reply-To: <20241204142626.158395-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 2 Jan 2025 21:43:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Wiva0V52ZTY7-vdrNKWeCGWb5KTBp+CHWoNxHxi0Kyw@mail.gmail.com>
Message-ID: <CAAOTY__Wiva0V52ZTY7-vdrNKWeCGWb5KTBp+CHWoNxHxi0Kyw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dp: Support flexible length of DP
 calibration data
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_054321_671306_49E9F71B 
X-CRM114-Status: GOOD (  25.08  )
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=884=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The DP calibration data is stored in nvmem cells, and the data layout is
> described in the `mtk_dp_efuse_fmt` arrays for each platform.
>
> There is no guarantee that the data is always a 4-length u32 cell array.
> For example, MT8188 has a data length of 3, preventing it from passing
> the preliminary check and undergoing calibration.
>
> Update the logic to support flexible data lengths. Specifically, we
> validate the length returned from `nvmem_cell_read()` against the
> platform-specific efuse format. If out-of-bound access is detected, fall
> back to the default calibration values. This likely indicates an error
> in either the efuse data length described in DT or the efuse format
> within the driver.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
> Changes in v2:
> - use %zu identifier for size_t in dev_warn()
>
>  drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 36713c176cfc..55671701459a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1165,17 +1165,25 @@ static void mtk_dp_get_calibration_data(struct mt=
k_dp *mtk_dp)
>         buf =3D (u32 *)nvmem_cell_read(cell, &len);
>         nvmem_cell_put(cell);
>
> -       if (IS_ERR(buf) || ((len / sizeof(u32)) !=3D 4)) {
> +       if (IS_ERR(buf)) {
>                 dev_warn(dev, "Failed to read nvmem_cell_read\n");
> -
> -               if (!IS_ERR(buf))
> -                       kfree(buf);
> -
>                 goto use_default_val;
>         }
>
> +       /* The cell length is in bytes. Convert it to be compatible with =
u32 buffer. */
> +       len /=3D sizeof(u32);
> +
>         for (i =3D 0; i < MTK_DP_CAL_MAX; i++) {
>                 fmt =3D &mtk_dp->data->efuse_fmt[i];
> +
> +               if (fmt->idx >=3D len) {
> +                       dev_warn(mtk_dp->dev,
> +                                "Out-of-bound efuse data access, fmt idx=
 =3D %d, buf len =3D %zu\n",
> +                                fmt->idx, len);
> +                       kfree(buf);
> +                       goto use_default_val;
> +               }
> +
>                 cal_data[i] =3D (buf[fmt->idx] >> fmt->shift) & fmt->mask=
;
>
>                 if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_=
val) {
> --
> 2.47.0.338.g60cca15819-goog
>

