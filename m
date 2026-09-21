Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41258C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTc4eaTqTCWWXmcCsM9hd8rF0EjF2lDAr6pE9wv6n6k=; b=XI1PO5Ny6unSmeY+VLSSdup475
	0sbiOKMgXQj9Pg1g3t36El4MAgiLPpeTQJxf3HgnMpR0t+lwLnTyTPavgpp1oADij6KmoK7CSrAJM
	ay9UUHBO4zfpuE6CD4+Cd/zTWynidaJbzJ8OypnO9vcLBEhULbZVd1MAZh4BMGw4SZ7JnJ3GFdN6a
	oqXgcb2M6rOQCC1vLedx9Zk56fWZZy3SggVdre2ibjDsZTOeEUxzTMfPUl+8GO0By0kUvkvDmqO81
	GJk0oX4vxoJ6PK6t0oWHox/tyW8yHzv6+NVthxRQaKVHpgyfaS1DUjnsmGy0BCQ1Q3D0AMYjov0oB
	wdbHsSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dMw-000000027Qq-19vW;
	Mon, 21 Sep 2026 12:43:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dMt-000000027PK-0z2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:43:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdopr1217422
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTc4eaTqTCWWXmcCsM9hd8rF0EjF2lDAr6pE9wv6n6k=; b=RjNhQMW0qXvCl9e7
	TSqSjkDCMfDvn3tLw3Cir5ZYA42nfF6E17HauGaX61Fj0ylBQweO2l6cu7Ja1ckf
	bTkYPxta1GMCaU3pKkI2VxKH3oak+zv+0Td9/U1IMNUWo9PGFgsaXdK0JbDAjy8E
	9WUe4FSN44FrQeReNOrusu4zefIi2DGS7SlM93UNUJZ92ubgeva2ZyevUEOjxHgm
	1KotCQAkWGKs8y5QQHk3iqcJBOR/BwzySMjwYrff7wXQWAIWtINpjTKMkhDJSjpT
	vrUr230c/RwSaC9P6ePBdhDIZFQVeApKVBjMFEfHcYYTAeFF6AZOdcpBgQs4XRUb
	HmK6/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011999y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:43:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3799548a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789994611; cv=none;
        d=google.com; s=arc-20260327;
        b=Ui7dQDGIrguX/AXX8wDeKCdZj6g9OcNcRDRXpVcbJaiPasTk5Fo+wJaE4jM8Wk3Fd1
         TYFcaWeSye8TkyDdBg3XJl1Nxfod4sonuCUAVcwyeLNMbSdY4ts1b1srX/mPclrGEzEV
         vsfwJJvHwuvL9QyzHacMkMSLUHu7BsSHzRjL3ARr84UBOysjJKraosppmmegsJ3riQzO
         qHbL/8Oq4Fy1t4HYCRFn/nOpVjjbdIsRCOK/OA3QTciFfBWNgrE8BkD5VzroCX5w+kH7
         5IX2meHU6INr85WLUXxjnRpkREB8kPrTvf9yZBSU14SEqcQiUIqLv2TFMuPVEXwimyPi
         YnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YTc4eaTqTCWWXmcCsM9hd8rF0EjF2lDAr6pE9wv6n6k=;
        fh=tM8P/XuMI/lJsixRllRkvKRKupoUIx+ZJmwGhjYQ8uY=;
        b=j9XcLp2BDvVNf4WHVN8FVfWN2MaiGMTsZemDXqkh9fvPCIGYt0jTidRKNFgC3fSZjR
         OuhuhlFPwkAcws2jjwicd76MnptKMtmwfl5c5oBi3o98yrEBQCej7H4LLUS0EQ9cSaOi
         QO0fNCkzEPM7utGcB1lGWBmxlu+JrKDxL5MggSwp8nX9KgQ5RAV6J/GlMDXYZjukdBIu
         nqpZjK5fMSfI/5zVmxjIRg84k7UV+ovusQly6UfaRy1vK/Qp2CVZBmg7XwXtbiIcFDvx
         9T/ByKTZh5JDiSyoPXGcyNvhyHeCs5lJVwZ0FhDBvBsTntOo7KhmVZ8a7ZdZ4JVRYESo
         +fDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994611; x=1790599411; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTc4eaTqTCWWXmcCsM9hd8rF0EjF2lDAr6pE9wv6n6k=;
        b=SR0NhsWWEk7jLuNuX/VRsGy8ZpxmpnHnAjJYCSRr9AY/n6rql84LwgfbqC3iIo4+2o
         84TPU4Dj+22HaTotMMIlX2arkv6VR394ghE4WxAsNdyJubuO4vFogofFRHtOw+G+YfkC
         pNThYNNWAF4unuX7Sx4YuRWGBjUmHaP6877Zu8n65xQU7FkncrhoAm0r4xBwnRSOiVx4
         /4ppnfYcX0YoI77P2yZojCM/lmuhEI/kOmnbcZqDWoA5M+9FlPKcj2T3SvzXXMiAJMOU
         oWN2BxmWGnaQn9Y4MgvuOvUaEyNftBPz/kgggTijZSa6KBGIQo9QKzY91HywzHqLNy21
         HOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994611; x=1790599411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTc4eaTqTCWWXmcCsM9hd8rF0EjF2lDAr6pE9wv6n6k=;
        b=GlIBNH2GyLZ6tL9edjY0BW4nfJ6Qt6pPy7zKlPQJmZYyk2jG3VvnddId2RQAUWmBkO
         i62FARmqXTm/k3Dx/qyPw+aWrB8ots0jpdJPOsfppBlVeMzgMZz+sCPsXJx2QgiHrIEb
         Eal0MHAMQgHNDMDN05aUoLt298DPTaO1dlBk+ppl/I/Sihp+bE26LZTEvZKxFzwvdt3V
         MSJzcDMDNCzzdpUiOHN5tAhxoOhIUVl5npA9rDWHTo8H1/bZZNJq/W1dDi0e1sY26u4i
         DeI2cB8U/7J16oNHE+aFfhG4rQmso06cYw9BhYoZHYKWinOewoELR05kQXoi1BvBGREj
         qDWA==
X-Forwarded-Encrypted: i=1; AKwUvBx5il6r/Z64iH7vVGarrexgbkt4EmU5tswAVmzCosdy3moA4qJ9F/kueosDiULcOcT5fjowtkRndvo6OnegHQON@lists.infradead.org
X-Gm-Message-State: AFuF++n/DInbSld9WOH7Uhgw4VaSpIEWqkQlY/8gCyiLkTOGm7aBFz6z
	7Y/9qpBBfEbq+iDBtqUdr5uKELrUlfwAfACyDI0H+bQGj9Ds1armRheoPNasx7q/AXgAKJuI3o6
	cE9vr3J39EBNo/l+cvPjwynCfl4KFc/0iJK3R+CtbvB1diHnRzB3LCFyEBPnvLoMZRMfL8D67yD
	8j6yEkSlm2m5Uv9ozpkNv/wVP6kJ7qOIVicw9Jjdf660xQsoDDyT6S
X-Gm-Gg: AYBFou0ltPPYqJmRb0OkXkbfw4FOqnzkyozKxidhkG74aw4tbq9DzRkK+DogzCBi7Sf
	sW2jpGq8QJJrieax9GRCDPLjVbQM2dbfJb8GlRWfCNMjEfANIQ6UJhU4+tm3miXtlCUN4F68eOP
	MrXce4c00/bl07n5t962YfrmHkrbaJ8tU0RtQkAAmIcsKOfMnx7mesaXYNwA==
X-Received: by 2002:a17:903:2349:b0:2dd:c100:424e with SMTP id d9443c01a7336-2ddc10044e2mr89288725ad.50.1789994611235;
        Mon, 21 Sep 2026 05:43:31 -0700 (PDT)
X-Received: by 2002:a17:903:2349:b0:2dd:c100:424e with SMTP id
 d9443c01a7336-2ddc10044e2mr89288245ad.50.1789994610661; Mon, 21 Sep 2026
 05:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260915104328.45901-1-gahing@gahingwoo.com> <20260915104328.45901-11-gahing@gahingwoo.com>
In-Reply-To: <20260915104328.45901-11-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:43:19 +0200
X-Gm-Features: AcwNN1XRM4Zpoe9SV6Ox1cb4qr0Qhj7z7Tg6kKrM_v7MoPDIacNjWOamn5qOldA
Message-ID: <CAPx+jO_MFkUrzRDnuoqn_yKntRc_NqPs=0nda6wC_xgb+Fy7bw@mail.gmail.com>
Subject: Re: [PATCH v13 10/14] pmdomain: rockchip: cycle optional power-domain
 resets on power-on
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
        sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
        u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
        diederik@cknow-tech.com, alchark@flipper.net,
        dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ct-_W6HXHu2hIAMq_FE7G4J655rbyoCY
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab12674 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=9GNsruGHAAAA:8 a=EUspDBNiAAAA:8
 a=xnVI1lRHtBAIIYlgu6QA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfXyiI7qxdTmnoP
 tcipesbcovn/epua5cdtCIFWQHiCZWm7LjOD6Xx1A7Bicwdkc1hdqe5jsuN0vRpZzvj+6EE5P/C
 I5rn6VeXjfGowU5a2BDHEATw+IYMQO7SU9VYL5VF5C22LlZ64uxa+58s9H4K7LbxoErMWfn/JWW
 JhNrrp76+vRsOQKVkeYeaqKq/vEvf0Fyv+e7AXLTVh573UhPyWBcwZ2FYBg7yEBy+EoLn96aI1w
 lqMIAL/JoZyKMKIdUGNFNUtV/F+NUGyFLYInFz7IOgGRHiMJBvZinQ7BEPYvRmPo5bi7t8PQizO
 KYNzBXcm4+yrZXHEalQIMEq4V8FvbeIJXBg3Q5pTOSHgNAirfygdPjw/sRLpRwmpX4WiLx65Gk7
 GaOR/SNvXNTcG5TQNMQXoqGE2fkO9KNiEdJGfP4GJWFynIaw7MJPX5XbjhCmWymk7BUMew9BObn
 OD4TntuovHClXRAXw7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX5syu2QItf2vV
 DMY9pqLPC8Tk8CbAIqnQg+wqhTH5nGj8NLHyB4hvKRXd32JdMdV8bH0q2H0ONIOss7b+C8m3NAZ
 3+PO28sPI8fnPa+LwS2+uY66Jyh6aDk=
X-Proofpoint-ORIG-GUID: ct-_W6HXHu2hIAMq_FE7G4J655rbyoCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_054335_394184_0E6BBBD7 
X-CRM114-Status: GOOD (  34.32  )
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

On Tue, Sep 15, 2026 at 12:45=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> =
wrote:
>
> Some Rockchip domains come out of power-on with their bus interface in an
> undefined state. On the RK3576 NPU this shows up as a hang on the first
> register access after the domain is switched on, and pulsing the domain's
> resets at this point clears it.
>
> Take the domain node's resets if it has any, and pulse them between
> releasing idle and restoring QoS. The resets are optional, so domains tha=
t
> do not list any are unaffected.

Please drop the below from the commit message, the above is clear
enough I think!

>
> The cycle goes before the settle delay 9/14 adds, not after it. A domain
> that asks for both is asking to settle before the QoS registers answer, a=
nd
> a reset deasserted after the delay would leave nothing between the deasse=
rt
> and rockchip_pmu_restore_qos(). On RK3576 PD_NPU0 and PD_NPU1 ask for bot=
h,
> and the reset they cycle is SRST_A_RKNN0/1_BIU, the bus interface those Q=
oS
> writes go through.
>
> It only runs when the domain actually changes state: rockchip_pd_power()
> returns early when the hardware already reads the state being asked for. =
A
> bootloader that leaves the NPU powered would therefore skip both this and
> the delay, which is why 9/14 gives RK3576_PD_NPU need_regulator and force=
s
> the domain off at probe.
>
> No in-tree DTS puts resets in a power-domain node today, so every other
> Rockchip SoC takes the optional get's NULL and is unchanged.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Kind regards
Uffe

> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 39988efd8..6cc8d6efd 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_clk.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/mfd/syscon.h>
> @@ -103,6 +104,7 @@ struct rockchip_pm_domain {
>         struct clk_bulk_data *clks;
>         struct device_node *node;
>         struct regulator *supply;
> +       struct reset_control *resets;
>  };
>
>  struct rockchip_pmu {
> @@ -688,6 +690,21 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>                 if (ret < 0)
>                         goto out;
>
> +               /*
> +                * Optional: some domains need their resets cycled once p=
ower
> +                * is on. This goes BEFORE the settle delay, not after: a
> +                * domain that asks for both is asking to settle before t=
he
> +                * QoS registers answer, and a reset deasserted after the
> +                * delay would leave nothing between it and the QoS write=
s.
> +                * On RK3576 the reset being cycled is the NPU core's bus
> +                * interface, which is what those writes go through.
> +                */
> +               if (pd->resets) {
> +                       reset_control_assert(pd->resets);
> +                       usleep_range(10, 20);
> +                       reset_control_deassert(pd->resets);
> +               }
> +
>                 /* Some domains need to settle before the QoS registers a=
nswer. */
>                 if (pd->info->delay_us)
>                         udelay(pd->info->delay_us);
> @@ -861,6 +878,14 @@ static int rockchip_pm_add_one_domain(struct rockchi=
p_pmu *pmu,
>         if (error)
>                 goto err_put_clocks;
>
> +       pd->resets =3D of_reset_control_array_get_optional_exclusive(node=
);
> +       if (IS_ERR(pd->resets)) {
> +               error =3D dev_err_probe(pmu->dev, PTR_ERR(pd->resets),
> +                                     "%pOFn: failed to get resets\n", no=
de);
> +               pd->resets =3D NULL;
> +               goto err_unprepare_clocks;
> +       }
> +
>         pd->num_qos =3D of_count_phandle_with_args(node, "pm_qos",
>                                                  NULL);
>
> @@ -931,6 +956,7 @@ static int rockchip_pm_add_one_domain(struct rockchip=
_pmu *pmu,
>         clk_bulk_unprepare(pd->num_clks, pd->clks);
>  err_put_clocks:
>         clk_bulk_put(pd->num_clks, pd->clks);
> +       reset_control_put(pd->resets);
>         return error;
>  }
>
> @@ -949,6 +975,7 @@ static void rockchip_pm_remove_one_domain(struct rock=
chip_pm_domain *pd)
>
>         clk_bulk_unprepare(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_clks, pd->clks);
> +       reset_control_put(pd->resets);
>
>         /* protect the zeroing of pm->num_clks */
>         mutex_lock(&pd->pmu->mutex);
> --
> 2.43.0
>

