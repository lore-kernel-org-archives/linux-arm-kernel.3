Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A0FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=; b=sz5shfXCLhiTXBmGd/VXiZtVGj
	+YbxUhgqgnZ8e3f+tyLAijXW1DjR4uALTkzdFc/3yCRxcpwzeFbdZoOXru193vJvFWXQ4nTV7PlDp
	ERbwqcNklTylywGNyfb7WV89Yiqs4JAifXJ1qPj9LKSiwo7KK1d4KzyZfJLMiX5+5QJWiYlsiZJmy
	ziD2FzYEcLIMq4Gey24/+NjAay9koc7r4hy/A9Qfqaz2+awU3GDPzKPzly55N7Ws6bPsG31C7wVao
	t4s/IR32VTCyrcmpZaUuCdhN3CsFTy4V0IhMcc1kqb6+/6NxskV789HrBP8ppl6dgp/yKzyav8vH8
	aKp1/Xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZnd-00000005iLp-2acG;
	Thu, 28 May 2026 12:25:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZna-00000005iLU-487G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:25:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vU7C3203244
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=; b=prEfC2i4IyXES7BC
	cmHulPI14uPbrVtMetN2T5yu4ICQO00WgaK+A6eXmgJI1v7hE9fii++rwodl+CgJ
	mST0ZvEIHGyhietuMO6fYzSAJNAzRD8ppMDX5EdMynHhNRkTmvNeu5bXYvzPcKdB
	rA6oIBqgnEmljP1Z0rxr7yVDRlNHKXT0pivyyFO5kR7FlVfxbwaHpqz5Ta0WTbp9
	6BnOI1vOHCLXZDz//RqETpdeYe9/zaf6TLaJHqlz7Bdkrx1h3kD3pMG95XEDk2MC
	DvpNyX4lbx3Im5Mx5bc6unNLyEB6lrMTHPd+XBXSQFjT+C1Wg9a7joPe0d9r3EBz
	WzGJmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjpef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 12:25:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b5249bc1so1013298585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 05:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971117; cv=none;
        d=google.com; s=arc-20240605;
        b=KvmTuLnz4nC42lXrz7apLTQLW82So/DshLnI/Y/ahNqwIr4XDOAQn+4E2m017e+BZb
         6qitnflPqeWYp2fOcm8UEuNTr1GOLN0Zs7cNgf9HxrTVNsREMWDESaKRhyv4jSElW1jk
         Sbex5igSJjb114GhE4aFykjcGNoKXUJNUCM+UAResIHBVur3fu1ccsRvduzbYdRXJ04d
         wH6YF6UeSgB5uP8Jv3umpEk2sqORMf0y1Jk9Q+Ijwg9cxuPLzzxdX7jaj7OpzUuhHgT5
         PZXFweBbNJo37IfkcbYxszx/mgKskHnCTgMQ6WoEb9uzjSwBaQPud/E8WH89lO5Hy17x
         +adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        fh=9o1vSC4lbfNuAXYfomDiY/RwHmGbXi1gmcUCgyDUIbw=;
        b=PQCaUD7WcJTG2w+rRWI8q84AsBiFhfNKbJp9y2xNbDY772G5DCLDJR77RibD0aDs8o
         G304N5yRNQOsrzxkHT7yHtKC5IuCqmBzcWt1pNnxtwhR+muF6qci4A9zK5myBkzmHKex
         ybiRi3uxxljyyuWjN1CJ7yHWY9g4fLskK3mmXCUtE44wW3qRjyeU86vvGoUZ2wo+RaWv
         e14OM/r7Zb3Q7ctR9da5PhlTIME1c0Hn3ju1e21hVcvqAfEwBPxhdVq5bkp1q5bjCE3x
         jgLnZ7DzWC3ZNamFK8gVHrKMAf9UikyPVDdudHwiZFOaOztYqIvtYm9thZFR7APGOWLU
         CRXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971117; x=1780575917; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=RPglHOjVE/+Od6o2HnQvziMuxaahT3UgbMdbNKFcMVRtsxWWzyLsdiP0v6kFsdVF08
         iQfaW6uO9IfHT+7Pq+lu4bxgl+rG2e/luLe+gqX30zRH47DCAyEKqfMZ90VvQER6APhp
         9yEMGAEeYzcilS/5uFCvKb9qNXxf7YvtCQrEhtE6JvMdyRgzWzrtVWllEHpfMLA3qzAM
         flzupP56MD91EWZOd1S5FoRElYiu6CpNsYUB8T+WbPnnUAIg2haC5oNyhYUpYbnCxbkf
         aJCMCo9fUE4i7/zd0p82pFwQ/QLNOwU0lo9tgRtqu4vNMV7RyZSjF8TMjYRJb6pg/vn6
         2n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971117; x=1780575917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=QPCyFn6bVsUtAtBgoPLtFG/Yg3n50jsDqVdbjIHJNlWtAcYxK+0Hq0mD6zkeM+jcnu
         GX3l7pbwBKX5BK8btWjmBLkO4PsFOnvImsiSjg/3MqKJziDsmwPeci+2N7Y8vFGRyTHG
         NYWQZwcoir5VlyR7RsV+BdxbROe8ZVyjMTo8JlYQ/bwwIKK1A0s/aLnnJvk/ch9467sx
         CAvgAbFmTuZfl82ix98pt/3ZogGdUy61ZoG4HzTTzyKbfJzE94rRh4RLHBnkRU9vZsYq
         X9O+8ukCCNq8PmeYKy/Ca3uWebbu5xtNWmUCg7ujw+1ubE7o0lu9My2A7J9XTz+/dDiH
         LsEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WmfzEKNgqYCJQQqVUhMINQBsZ7ewnIN/rfV0IskQ+uGo1GlFOpdztMD7RZtKcWUL8m5Sru8AIN934jk/PrWJc@lists.infradead.org
X-Gm-Message-State: AOJu0YycKs1Uso2AYXgz/xPxmDSLD6M5e2SpYFwQok9Gp+6DKlPYgnyA
	nzpf6uHBVnwq/IIe8YEbDMpxcAJ8KpgeDbEDZuYMFs4+qQKhpLl+1IvWv92UEdqHE8PgFErCqbo
	ra2bHnxVvwWd6TL4TDkEU8VblPS/ufVhqKzlewMXI7N5P6HYbfAewGACnjUzwZHMVNU0O5+Qk5s
	atJIOZoVwogV1TwwafWMCZW7Y1npxOvnjPKrUvwFV/UaOATQWY2T5F
X-Gm-Gg: Acq92OE8ai91xWeRcHz/FrRfr9Ajh0maunA8TFnGKVj96+batgIh5y5Dsi1ySZX9H1n
	NaKOf+brmfcENE+4Vh90LXXC6Cuyk2UPPuo4sY4dOCgrpeaH8Ib9nZb2Q32Mz5ChZyPqHjcUAgd
	fw08sh0XWb1biGnMMKwwHQNVmjsDp2qH4R6XJEnaNsfcFQyesINjnbUlsVqGiqcsW+LJREgxcsL
	S8OtTGHlVeN5cRl3XkkIbkWMvdf6qEP9dT00ECh4GsrDUXC
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id af79cd13be357-914c0bcaf11mr3886830385a.48.1779971117101;
        Thu, 28 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id
 af79cd13be357-914c0bcaf11mr3886823885a.48.1779971116654; Thu, 28 May 2026
 05:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com> <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 28 May 2026 14:25:04 +0200
X-Gm-Features: AVHnY4JO8P8GLceB0VuUyA9tvcNmn11LuhgjLHguxnzI4BEUk6ZkF0V4tx2XITE
Message-ID: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNSBTYWx0ZWRfX/ClFJ/7PbseT
 ux7+D4DfupY4lAa0Ghv83CnxaKCWdV+gz155IaR2/gqBkp3AUsKuJNkZ6ryyTfnIR9slc6pyHep
 6vDyBmiiJUfG04O//dSx++0NtiiHEpPwvMEFMfh5JkpurYh3t+vF6N+5pMBtcUzv/32Wbq0xbvr
 b9anI2Rl4IXUJ2CNC7YikYyhlrwgL4W8Pt+KrAA8WrAcN8qVmUdlPBEX3/ciAAG7hG4MFIWteD/
 q9hEju0AjAqccUgJt+k9D1Nxkj/QCKjljmPlz87RnKqwxQHHbfmkUTqTmY/C8Oudy6JlA5yogeT
 p9h8WjZELAljlOWa8I2BgrF2ZXPyQufaBbTE1eG08PVWd88++xudDP7drAP8nV66f1mkbEYTP6w
 2urPRLeEFeWs24J/tuCZZgOKQSE0JG9PBXqlhdzgsfm2ey8qJKtsksT1a3j2Y/pYNZBruEXw7WS
 QwO8y05BNZuWNizETaA==
X-Proofpoint-ORIG-GUID: sWCjGCiMgdXRyySkJmevJiUjpfnM241-
X-Proofpoint-GUID: sWCjGCiMgdXRyySkJmevJiUjpfnM241-
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a18342e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=8qkcLw8Gk86Nxc3JiHYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_052519_051005_25FC0B3E 
X-CRM114-Status: GOOD (  22.09  )
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

On Tue, May 26, 2026 at 7:13=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>
> Add CAMSS driver support for Shikra SoC. Add high level
> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>  drivers/media/platform/qcom/camss/camss.c                | 13 ++++++++++=
+++
>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>  4 files changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613=
649920e6ee1a1f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>
>         switch (version) {
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy=
)
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
>                 break;
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>                 regs->lane_regs =3D &lane_regs_qcm2290[0];
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_qcm2290);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad=
57419b25cdec087 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>                 break;
>         case CAMSS_660:
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4=
e5fe880007d1ee7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resour=
ces =3D {
>         .vfe_num =3D ARRAY_SIZE(vfe_res_2290),
>  };
>
> +static const struct camss_resources qcm2390_resources =3D {
> +       .version =3D CAMSS_2390,
> +       .csiphy_res =3D csiphy_res_2290,
> +       .csid_res =3D csid_res_2290,
> +       .vfe_res =3D vfe_res_2290,
> +       .icc_res =3D icc_res_2290,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_2290),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_2290),
> +       .csid_num =3D ARRAY_SIZE(csid_res_2290),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_2290),

So isn't it exactly the same as 2290? wouldn't it be easier to have
the shikra simply fallback to qcm220 (via compatible string)?


> +};
> +
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sdm660-camss", .data =3D &sdm660_resource=
s },
>         { .compatible =3D "qcom,sdm670-camss", .data =3D &sdm670_resource=
s },
>         { .compatible =3D "qcom,sdm845-camss", .data =3D &sdm845_resource=
s },
> +       { .compatible =3D "qcom,shikra-camss", .data =3D &qcm2390_resourc=
es },
>         { .compatible =3D "qcom,sm6150-camss", .data =3D &sm6150_resource=
s },
>         { .compatible =3D "qcom,sm6350-camss", .data =3D &sm6350_resource=
s },
>         { .compatible =3D "qcom,sm8250-camss", .data =3D &sm8250_resource=
s },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d0=
5b2c3853f3a7714 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -82,6 +82,7 @@ enum pm_domain {
>  enum camss_version {
>         CAMSS_660,
>         CAMSS_2290,
> +       CAMSS_2390,
>         CAMSS_6150,
>         CAMSS_6350,
>         CAMSS_7280,
>
> --
> 2.34.1
>

