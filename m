Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB18E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtF2AzVJ+m1dlr0KVksDDm3jCCBe3fegi9uwgdV42W0=; b=pGs0P0pYdSYviwNTbhL0voRo2G
	V9s8GjCE0kWHJTIHhWoLvOOwwJYKuMHkzkbEN2V0w1uVnbVIRl2GptoFWNXce4hkPYfRUd5D46vgc
	EIKDs3CN5JVSjyG1vB1uo014mInJWKfrv66PXFrp9ALBoNwET7JMQKKb9uMjiTIGERVaLiP72GGF9
	YtbZZt4+qbS8LNWh1esv5sfqi+xmRmhcsYtSok5MIf6ykBzY96lO2DeRzvmBzGRix/2Ihk4VU5PZd
	JYoHD4gWe24PBk8fO9eHnbORgXDBVlXTc3IT0N7PnhvhW+5E4mKQaot2cgXe/axEcxcpxCPs8LZwY
	byh1VtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT8f-00000000qfX-2jfv;
	Fri, 06 Dec 2024 07:52:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJT7W-00000000qQX-3y6J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 07:51:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434aa472617so12233175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 23:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733471484; x=1734076284; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtF2AzVJ+m1dlr0KVksDDm3jCCBe3fegi9uwgdV42W0=;
        b=cJIFwcXwMYqmSYpjWlQGD1Ut7ZYo0NmgWG1o4NGyF2e1C4xYku84MVvqBhJTOz+UFs
         7QvGl44JTMqFNUpo7Yvcw+6E1tcJhfR71AM9ocx2+2/XuOOBZ28KY6npKvMDy2yQfde4
         qki1Sws0m6Zccz9pzcADSsQCTW6JUg121/E2joaP1LhaqMWDtW2CFhEFSEh+x0/fSROk
         RULrllDG4PYlRjfKijqSzlaVatpZWCaGrXRc314ZfONvSSWOzGufTPKsG/lyktub5Jjh
         LZTbG2zmPcr2kBgaxsn7whxV6h8TYApX/tJGUi/XAGdMdFzgSEk3DMAA6tjwfjkx91c0
         XZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471484; x=1734076284;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtF2AzVJ+m1dlr0KVksDDm3jCCBe3fegi9uwgdV42W0=;
        b=qCY0vddfzYw+XkehcAUuGn7H2bPc4mZzKk3jSw/npIvDMYtXdryMoMVrU+JyCa6H19
         MArdWOHEcI8gQ1pAtJDl/mfgmFok8D4JvSkJQWfFYiNRl8Weinw4OGTirrOOiW8oRf0j
         ws+bOKBd7xq+um3MG0UqdTaclQqQA+dBV1r1K40WjYsMEs/GaqNlHTg1n8c6bH+tx5V3
         XAtqlAL58GWMgclpF0CM7Znyks8t2yhDeWtCIvwgzm4V0yG/KmDv0vHZZxkSLABEobBM
         C3AzqJVxiCwyNy8T4snsPD/0jiMzWNk3wdnqxLNo8XmTlv8OPoFtuCp7mouQ4ova8wyZ
         d/5g==
X-Gm-Message-State: AOJu0YzRuj5Q4+TIm2Eu9BbZyZ+8bJ/2D80PA3xzOOBof3l1SL0hIQgB
	kRs/vxeIWxjai460h9/a54h5RoCUGEjT6rIjQT+IZkSshduoVCtnFat7BiCmXOo=
X-Gm-Gg: ASbGncs5ymhLg6xFiAKutnWyckf7CXVTP23XSwXSCB1YIybrEBWMKX3TxZG0SMCrHcl
	96J/TDEASeKgiVyNIopPnE3GFvSAXaYOkSFlSuLt5o5DrvC3JIoY0WtMtMHP2QZKwOdlMHukhuE
	rZtDW38NR7IGea5pBMe2bFtpqaIVbqrD563zMpsS+CtPCbOZOIG370MqZLv+QRgO8ArTe8Q1cra
	xiyjl9d3Zs8G0vvvrbNeisev2kPI4jsBGYx7vC0uMtKy2eFdw==
X-Google-Smtp-Source: AGHT+IE5fZ/i7z7N2nXmNIPVv1fmyaLiPz/XOt9gQ0D8TNBC3UISXUH544FlgQA3hcVUMGlt3gRdWw==
X-Received: by 2002:a05:600c:3c9c:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-434ddeb49bcmr16655415e9.9.1733471484212;
        Thu, 05 Dec 2024 23:51:24 -0800 (PST)
Received: from localhost ([41.66.99.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273199sm85839435e9.14.2024.12.05.23.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 23:51:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 08:51:21 +0100
Message-Id: <D64GCT2CXFLC.33Y61JJ8XFCHO@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
 <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [PATCH v7 3/5] media: qcom: camss: Add support for camss driver
 on sc7280
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-4-quic_vikramsa@quicinc.com>
In-Reply-To: <20241204100003.300123-4-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_235127_000591_DE2AD314 
X-CRM114-Status: GOOD (  18.87  )
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

On Wed Dec 4, 2024 at 11:00 AM CET, Vikram Sharma wrote:
> From: Suresh Vankadara <quic_svankada@quicinc.com>
>
> Add support for the camss driver on the sc7280 soc.
>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hi Vikram,

This is working on QCM6490 Fairphone 5 smartphone with WIP drivers for
IMX858 and S5KJN1, thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
>  .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>  .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>  drivers/media/platform/qcom/camss/camss.c     | 319 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h     |   1 +
>  6 files changed, 333 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 7d2490c9de01..f341f7b7fd8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_d=
evice *csiphy,
>  	u32 val;
> =20
>  	switch (csiphy->camss->res->version) {
> +	case CAMSS_7280:
> +		r =3D &lane_regs_sm8250[0][0];
> +		array_size =3D ARRAY_SIZE(lane_regs_sm8250[0]);
> +		break;
>  	case CAMSS_8250:
>  		r =3D &lane_regs_sm8250[0][0];
>  		array_size =3D ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
>  	bool ret =3D false;
> =20
>  	switch (version) {
> +	case CAMSS_7280:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
>  	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 5af2b382a843..3791c2d8a6cf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 =3D =
{
>  	.formats =3D formats_8x96
>  };
> =20
> +const struct csiphy_formats csiphy_formats_sc7280 =3D {
> +	.nformats =3D ARRAY_SIZE(formats_sdm845),
> +	.formats =3D formats_sdm845
> +};
> +
>  const struct csiphy_formats csiphy_formats_sdm845 =3D {
>  	.nformats =3D ARRAY_SIZE(formats_sdm845),
>  	.formats =3D formats_sdm845
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..b6209bddfb61 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -111,6 +111,7 @@ void msm_csiphy_unregister_entity(struct csiphy_devic=
e *csiphy);
> =20
>  extern const struct csiphy_formats csiphy_formats_8x16;
>  extern const struct csiphy_formats csiphy_formats_8x96;
> +extern const struct csiphy_formats csiphy_formats_sc7280;
>  extern const struct csiphy_formats csiphy_formats_sdm845;
> =20
>  extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index fb3234c65403..95f6a1ac7eaf 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -335,6 +335,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>  		}
>  		break;
>  	case CAMSS_660:
> +	case CAMSS_7280:
>  	case CAMSS_8x96:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
> @@ -1693,6 +1694,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>  	int ret =3D 8;
> =20
>  	switch (vfe->camss->res->version) {
> +	case CAMSS_7280:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
>  	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f5704c23766a..4fa16ff6e614 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1266,6 +1266,310 @@ static const struct resources_icc icc_res_sm8250[=
] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_7280[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy0", "csiphy0_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy0" },
> +		.interrupt =3D { "csiphy0" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy1", "csiphy1_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy1" },
> +		.interrupt =3D { "csiphy1" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy2", "csiphy2_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy2" },
> +		.interrupt =3D { "csiphy2" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy3", "csiphy3_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy3" },
> +		.interrupt =3D { "csiphy3" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy4", "csiphy4_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy4" },
> +		.interrupt =3D { "csiphy4" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_7280[] =3D {
> +	/* CSID0 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 }
> +		},
> +
> +		.reg =3D { "csid0" },
> +		.interrupt =3D { "csid0" },
> +		.csid =3D {
> +			.is_lite =3D false,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 }
> +		},
> +
> +		.reg =3D { "csid1" },
> +		.interrupt =3D { "csid1" },
> +		.csid =3D {
> +			.is_lite =3D false,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 }
> +		},
> +
> +		.reg =3D { "csid2" },
> +		.interrupt =3D { "csid2" },
> +		.csid =3D {
> +			.is_lite =3D false,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 }
> +		},
> +
> +		.reg =3D { "csid_lite0" },
> +		.interrupt =3D { "csid_lite0" },
> +		.csid =3D {
> +			.is_lite =3D true,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe_lite1_csid", "vfe_lite1_cphy_rx", "vfe_lite1" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 }
> +		},
> +
> +		.reg =3D { "csid_lite1" },
> +		.interrupt =3D { "csid_lite1" },
> +		.csid =3D {
> +			.is_lite =3D true,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_7280[] =3D {
> +	/* VFE0 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
> +			   "vfe0_axi", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 },
> +				{ 0 },
> +				{ 0 } },
> +
> +		.reg =3D { "vfe0" },
> +		.interrupt =3D { "vfe0" },
> +		.vfe =3D {
> +			.line_num =3D 3,
> +			.is_lite =3D false,
> +			.has_pd =3D true,
> +			.pd_name =3D "ife0",
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
> +			   "vfe1_axi", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 },
> +				{ 0 },
> +				{ 0 } },
> +
> +		.reg =3D { "vfe1" },
> +		.interrupt =3D { "vfe1" },
> +		.vfe =3D {
> +			.line_num =3D 3,
> +			.is_lite =3D false,
> +			.has_pd =3D true,
> +			.pd_name =3D "ife1",
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
> +			   "vfe2_axi", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 },
> +				{ 0 },
> +				{ 0 } },
> +
> +		.reg =3D { "vfe2" },
> +		.interrupt =3D { "vfe2" },
> +		.vfe =3D {
> +			.line_num =3D 3,
> +			.is_lite =3D false,
> +			.hw_ops =3D &vfe_ops_170,
> +			.has_pd =3D true,
> +			.pd_name =3D "ife2",
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb",
> +			   "vfe_lite0", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 } },
> +
> +		.regulators =3D {},
> +		.reg =3D { "vfe_lite0" },
> +		.interrupt =3D { "vfe_lite0" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb",
> +			   "vfe_lite1", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 } },
> +
> +		.regulators =3D {},
> +		.reg =3D { "vfe_lite1" },
> +		.interrupt =3D { "vfe_lite1" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sc7280[] =3D {
> +	{
> +		.name =3D "ahb",
> +		.icc_bw_tbl.avg =3D 38400,
> +		.icc_bw_tbl.peak =3D 76800,
> +	},
> +	{
> +		.name =3D "hf_0",
> +		.icc_bw_tbl.avg =3D 2097152,
> +		.icc_bw_tbl.peak =3D 2097152,
> +	},
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_sc8280xp[] =3D {
>  	/* CSIPHY0 */
>  	{
> @@ -2622,10 +2926,25 @@ static const struct camss_resources sc8280xp_reso=
urces =3D {
>  	.link_entities =3D camss_link_entities
>  };
> =20
> +static const struct camss_resources sc7280_resources =3D {
> +	.version =3D CAMSS_7280,
> +	.pd_name =3D "top",
> +	.csiphy_res =3D csiphy_res_7280,
> +	.csid_res =3D csid_res_7280,
> +	.vfe_res =3D vfe_res_7280,
> +	.icc_res =3D icc_res_sc7280,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_sc7280),
> +	.csiphy_num =3D ARRAY_SIZE(csiphy_res_7280),
> +	.csid_num =3D ARRAY_SIZE(csid_res_7280),
> +	.vfe_num =3D ARRAY_SIZE(vfe_res_7280),
> +	.link_entities =3D camss_link_entities
> +};
> +
>  static const struct of_device_id camss_dt_match[] =3D {
>  	{ .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resources },
>  	{ .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resources },
>  	{ .compatible =3D "qcom,msm8996-camss", .data =3D &msm8996_resources },
> +	{ .compatible =3D "qcom,sc7280-camss", .data =3D &sc7280_resources },
>  	{ .compatible =3D "qcom,sc8280xp-camss", .data =3D &sc8280xp_resources =
},
>  	{ .compatible =3D "qcom,sdm660-camss", .data =3D &sdm660_resources },
>  	{ .compatible =3D "qcom,sdm845-camss", .data =3D &sdm845_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index ffce0a0edbc5..9a046eea334f 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -78,6 +78,7 @@ enum pm_domain {
> =20
>  enum camss_version {
>  	CAMSS_660,
> +	CAMSS_7280,
>  	CAMSS_8x16,
>  	CAMSS_8x53,
>  	CAMSS_8x96,


