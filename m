Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94E6CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=; b=fjEewnEYba//nMRo17vVbhjbGN
	Z37idooVP5H6HkqtfkwMCW94OA2HNmp3ExYSU0UEh7txn1Z7tHV43FXaWYIRZyIdXMOPYPSJu3nVD
	BTY3uPVpzDUvMjq0cEkiRs9T3aUYb81clSbqxVvcHfI0TzHRoqxr7wOpYjUkqCTxydqkfDFVOPnn+
	Uh9o6Yx9Oh2T6XDTnh/YZGM1/Hijf3V55mqNohVImXejuoKB+LB9cVolbAPA4ukP+WTOWCbTIPtQq
	t7M7mM8wZg9Q+BnQWZ8b5rqTMwedzwE1XEAMBLyGpV9ltfp2UHkI0EdC0ENY09UDPJ/wBefwOFd1o
	OWIG8arg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidF-0000000Emv0-2JVg;
	Wed, 03 Jun 2026 10:15:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidC-0000000Emth-1xv2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536v7KJ1755407
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 10:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=; b=XmrpaKZigwia/7BY
	DCjkUP+LzEvNycdfLoO5/BLfMGABaH18v7DbZ0POu67u3H5IgMW75BXxhwpEeQj/
	PDNoDIf3n+cRt6WlYOt8mb09cJyhMObuWCMx497xl614LZRPIFwMzLrA2IXjW/LT
	rgkZFG12prZa/OJC5QUT3qDit1Z8AZPCJLj4+fl+g27leNvpdFN+yr7MEp5CJVtP
	kfFkuyheLAoVOLJXTFA2MiOGkmqZZUyYdefv3f3qzuUYladbXjT8ikhI02GJJsGz
	QB7o1d9GVv9HABFLI8KWBJEJ6vQ8rNYmLbGTe0CZiWHouz9Z1QdlNkNA4W9foDUM
	KPv7wQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff00ueh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:15:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccf3d72081so7651926d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481725; cv=none;
        d=google.com; s=arc-20240605;
        b=F8P0TgS4vpVys535O5g8X7/mB3GeS379KqNJc0DsEAX+QsgZ7Gt8d6EjPSYqn6YjKC
         mNevWdhb9hu2viFQYDPcXLK+2uNb506x3a/KpictkLpQFR8pY/fILe0gGuZbmq8XPio6
         4QH6UzO2btgj/qwOj0RenEQsn984VjEUCLJinFX1v2WSkNYiEm2XtOSrNazrUwiCHoZ+
         ryC8+BpIjNHPcidjCPBJgbCWnRsx/WaDrUlH0svepFViM2ioyv5VgpVQjc6WTnBR23m/
         OAyevkDz3/JCn4hNumpeA9Wtzg9qAVpBxnRwefCmBx0cT4TNwgTaud1BHVQQXS/EEecp
         fPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=;
        fh=7KO5YUyHGjYYh+7oLtW014yye3fcTqqQDoT/TdEvBmE=;
        b=axOD14wh5O0o4WRPbQTnLNdRKjO1eHeAbidwXjjAX6ZkJ+H2yEHAU4ZyhGkoj4ENE3
         6VyhflHd5IuHJ1GQxSz3fI7LrA21pdutNOI5iLE6pVE10/QRaykTe16/wawnbGM6RoA2
         XXfXNBiAjWRjHgEGk5l9drIEK+IO7y/LWD8JavLmYw/uXAOXR4M1ysA0gI1HWBXw2F/C
         z/SxZEUmmNEVaP4plRQHEwblRZtSWlSHTqlxV2RSX66lTw15VnYSXA6SLtaxazjRtLlV
         q1RBONjo3Pb2uOJFohn0xZraiGk8hDpoygGuzzF5svc8TLvHhjFWWIdMoiqad4d4R3tl
         5WIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481725; x=1781086525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=;
        b=YPZEbbLQMdnRT3JCbQWaCfjjpztmDhXNg7Z/5VnNPug6gbqRLbNg6ZljWxoqvdEfXA
         duZ55aYce2UfYY3X2NTH8sxNhmVDHtgZpeHn9he/rMwvas4dx/pv1ZmMoWdf12qoQBxm
         7+TQ6fTIkca0ViZSzRtL20KwUBglXaql76aT4GT/xm27sDOMDpAeOsnhBRKgtqJpXgOW
         9SOflwgeDobX6v1Z0Vpwz7h6dcAeMweZbFAefmgliVOpTnfr50uQcbDYEtCWsnBnv2PU
         nZSHC2jXRTWOO1kf4erEoSYpKL7pRv/qvYRuJfODip7lrHVCc1oNVo90b8mUJlkdr1wG
         66RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481725; x=1781086525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENWTTyz1dB4FHEiWpExoeF0j7dMymKgaFvfH6YbqIQA=;
        b=dOK+shy2uAJqZ22QrUuRioEkk3wDkpQfyJ30QClog/67zmkyBaqfDykp4wtC4FiDPl
         yldVnRbV6dNiu++pCJ7tuvsXKyA3oNZAANMsg9zgFu793cE+GS+mcKPXWydEzQCCQDTy
         oLO7mIwV4hdG98Cz/AklBhn4GaBiUBZsmwi6d6nDuhZXP3jy7xytk8ANA5WyYes7EWI/
         q14zvOucjm5Z8NIDDSmmMq/ZI9mC7h6HdXtew5RfDRTHjW+gZR+pDOy7IOHa65FRklPD
         hQCJsFQyscms/ETQ4mYIIbsokA0BPswjZ6HlHjXzvE81tQBoBV8sCGSKaLfOCXN0569H
         BDow==
X-Forwarded-Encrypted: i=1; AFNElJ+MJazCsZDYuwX0hCG6XIj9Z+cWe5W7HtbCbHOmdVOeyCGyQ6HCz7O591g1OGCN7Oh2eowcJ10egdtb4GqG/N1x@lists.infradead.org
X-Gm-Message-State: AOJu0YwJnZ4F0aMwnBmaeXtUf1NUmNdC9kBV+J2GzPA+ZbqCQ1GAHjxC
	3x241181vm1HWT2KS8mCwBDbEUStKVvToUm5WgcWXls00mXWzCniCruULoahkTvGi/kVjULCDfK
	izpECS97r/IDVux/I4gBQApM6janngVFvN9XYk8V5n9O2jB4DqSfWuNJszIQwqmn2ICKaOAxN7C
	Y0pCZwQMWruJsu2IrceFP2vVWvyR0THRFnw1POazeWuCCWAmekE8nClAChkEBn0AI=
X-Gm-Gg: Acq92OH+SnhDfaa94RYJweL/O0Ip3eosdxsvWkPpha3TNyNnIdos2oioVdnE2MWIjl7
	GboBjPKg1Lx85/c+YgIhtKin3W2gPCqs7cKX2nssHWr+lAfjdK10boUid8JyTc+/kwL9kbz4pN5
	hvxnMrhOLHi2EgHpG0KoG7tIOOBoqQWlBmjixb1fascOMC0n1x6bBHeYt2ZIEZRrGtTgEu+q0gg
	WK2NoIOxnkTmRwU
X-Received: by 2002:a05:6214:3204:b0:8ca:25e6:e892 with SMTP id 6a1803df08f44-8cecdc15d66mr42033566d6.2.1780481724721;
        Wed, 03 Jun 2026 03:15:24 -0700 (PDT)
X-Received: by 2002:a05:6214:3204:b0:8ca:25e6:e892 with SMTP id
 6a1803df08f44-8cecdc15d66mr42033086d6.2.1780481724247; Wed, 03 Jun 2026
 03:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260510-pck600-a733-gpu-v1-1-d6393646d714@gmail.com>
In-Reply-To: <20260510-pck600-a733-gpu-v1-1-d6393646d714@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:12 +0200
X-Gm-Features: AVHnY4K08klW06vk2eW3sXiNnVn0avH1wL4mD1fro5ZcJ4CYf6HKE76f_6zfqQk
Message-ID: <CAPx+jO9GrBPZvBr6pU7GpGdp=+xKQb4YSQut-M1LONEMnwkDxA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: sunxi: support power domain flags for pck600
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
        Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9cjAOyQzBnIrahu9SjR9u0D4Y5H1YGOS
X-Proofpoint-ORIG-GUID: 9cjAOyQzBnIrahu9SjR9u0D4Y5H1YGOS
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a1ffebd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=gYkhY3VTAAAA:20 a=pGLkceISAAAA:8
 a=fAHllOzSo_MIxufCVBsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX0/XSsxJ/25/8
 OpgOG6HbK416OSusHiComspyRofaQ+/kVMc+IRhRvYp+VhdSjlKU+UqwybtNz+Ij0fqFdhHsy0u
 Ju//5iQ9A7FbWMcXYYqm94fsdWSP12k3UMxqhGds8R9Eg9aStjcMtmUILRZUreIsWNSCgJVVrkN
 5og/X24MKiRAVeG7clPRs+EfonF57A/KGqzEWdjUywyaNqiHjA/2MNsyo7aR7GqApas4Y+XI5Qg
 3wu4A2AxlmKn3o1tluEn28gvMhUwMgJSSuG4e6Geiq5RbyEZc/jEedNdCv4Feu8bHse0q+x8S1s
 eQ7fCqHKTM5LOD33yDQaaciV5UlR3VVDl7zpiUDXJa2kMjvIOAAZJKfB+04aHGr9zSEQ6UAH/II
 47/90XEJ25iNnge8H2aNzvb9Tgaq/hIV4lN75QlUiTmrk9uOoXAyk6oH5eEHhEn6GK+kiHq4xai
 JD/F0kQCGMwWDgBHZ9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031526_642598_1DF8B72A 
X-CRM114-Status: GOOD (  30.64  )
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

On Sun, May 10, 2026 at 7:25=E2=80=AFAM Yuanshen Cao <alex.caoys@gmail.com>=
 wrote:
>
> Hi everyone,
>
> This patch refactors the sunxi pck600 power domain implementation to
> support individual power domain flags.
>
> While bringing up the PowerVR GPU on the A733 (Radxa Cubie A7Z), we
> found that one of the GPU power domains must be configured as "always
> on." While the Radxa BSP device tree leaves the GPU power domain nodes
> commented out, the GPU driver code contains traces indicating an "always
> on" requirement [1].
>
> Currently, sunxi_pck600_desc only supports specifying pd_names. This
> patch introduces sunxi_pck600_pd_desc, which stores both the name and
> its associated flags. This also (more or less) aligns the implementation
> with the existing sun50i PPU handling of always-on domains.
>
> With this change, individual power domains can now be configured more
> granularly. In particular, the GPU_CORE domain in sun60i_a733_pck600_pds
> can now be explicitly marked with GENPD_FLAG_ALWAYS_ON.
>
> The patch was tested on the Radxa Cubie A7Z, where the GPU now functions
> as expected.
>
> Thanks to Icenowy for her support and expertise on sunxi and PowerVR,
> and thanks to Mikhail for identifying this exact cause of the GPU
> bring-up issue.
>
> [1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.6/modules=
/gpu/img-bxm/linux/rogue_km/services/system/rogue/rgx_sunxi/sunxi_platform.=
c#L62
>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/sunxi/sun55i-pck600.c | 31 ++++++++++++++++++++--------=
---
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/su=
nxi/sun55i-pck600.c
> index 1d47bbd35ced..8a37d11b65a2 100644
> --- a/drivers/pmdomain/sunxi/sun55i-pck600.c
> +++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
> @@ -41,8 +41,13 @@
>
>  #define PPU_REG_SIZE   0x1000
>
> +struct sunxi_pck600_pd_desc {
> +       const char *name;
> +       unsigned int flags;
> +};
> +
>  struct sunxi_pck600_desc {
> -       const char * const *pd_names;
> +       const struct sunxi_pck600_pd_desc *pd_descs;
>         unsigned int num_domains;
>         u32 logic_power_switch0_delay_offset;
>         u32 logic_power_switch1_delay_offset;
> @@ -164,10 +169,12 @@ static int sunxi_pck600_probe(struct platform_devic=
e *pdev)
>
>         for (i =3D 0; i < desc->num_domains; i++) {
>                 struct sunxi_pck600_pd *pd =3D &pck->pds[i];
> +               const struct sunxi_pck600_pd_desc *pd_desc =3D &desc->pd_=
descs[i];
>
> -               pd->genpd.name =3D desc->pd_names[i];
> +               pd->genpd.name =3D pd_desc->name;
>                 pd->genpd.power_off =3D sunxi_pck600_power_off;
>                 pd->genpd.power_on =3D sunxi_pck600_power_on;
> +               pd->genpd.flags =3D pd_desc->flags;
>                 pd->base =3D base + PPU_REG_SIZE * i;
>
>                 sunxi_pck600_pd_setup(pd, desc);
> @@ -195,13 +202,14 @@ static int sunxi_pck600_probe(struct platform_devic=
e *pdev)
>         return ret;
>  }
>
> -static const char * const sun55i_a523_pck600_pd_names[] =3D {
> -       "VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
> +static const struct sunxi_pck600_pd_desc sun55i_a523_pck600_pds[] =3D {
> +       { "VE", }, { "GPU", }, { "VI", }, { "VO0", }, { "VO1", },
> +       { "DE", }, { "NAND", }, { "PCIE", },
>  };
>
>  static const struct sunxi_pck600_desc sun55i_a523_pck600_desc =3D {
> -       .pd_names =3D sun55i_a523_pck600_pd_names,
> -       .num_domains =3D ARRAY_SIZE(sun55i_a523_pck600_pd_names),
> +       .pd_descs =3D sun55i_a523_pck600_pds,
> +       .num_domains =3D ARRAY_SIZE(sun55i_a523_pck600_pds),
>         .logic_power_switch0_delay_offset =3D 0xc00,
>         .logic_power_switch1_delay_offset =3D 0xc04,
>         .off2on_delay_offset =3D 0xc10,
> @@ -213,14 +221,15 @@ static const struct sunxi_pck600_desc sun55i_a523_p=
ck600_desc =3D {
>         .has_rst_clk =3D true,
>  };
>
> -static const char * const sun60i_a733_pck600_pd_names[] =3D {
> -       "VI", "DE_SYS", "VE_DEC", "VE_ENC", "NPU",
> -       "GPU_TOP", "GPU_CORE", "PCIE", "USB2", "VO", "VO1"
> +static const struct sunxi_pck600_pd_desc sun60i_a733_pck600_pds[] =3D {
> +       { "VI", }, { "DE_SYS", }, { "VE_DEC", }, { "VE_ENC", }, { "NPU", =
},
> +       { "GPU_TOP", }, { "GPU_CORE", GENPD_FLAG_ALWAYS_ON },
> +       { "PCIE", }, { "USB2", }, { "VO", }, { "VO1", },
>  };
>
>  static const struct sunxi_pck600_desc sun60i_a733_pck600_desc =3D {
> -       .pd_names =3D sun60i_a733_pck600_pd_names,
> -       .num_domains =3D ARRAY_SIZE(sun60i_a733_pck600_pd_names),
> +       .pd_descs =3D sun60i_a733_pck600_pds,
> +       .num_domains =3D ARRAY_SIZE(sun60i_a733_pck600_pds),
>         .logic_power_switch0_delay_offset =3D 0xc00,
>         .logic_power_switch1_delay_offset =3D 0xc04,
>         .off2on_delay_offset =3D 0xc10,
>
> ---
> base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
> change-id: 20260510-pck600-a733-gpu-dcbfc0c7ce99
>
> Best regards,
> --
> Yuanshen Cao <alex.caoys@gmail.com>

