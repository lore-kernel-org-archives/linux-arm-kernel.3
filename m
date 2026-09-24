Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F610C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=; b=iWuBJkWVqeMQ5nsTKkJJcBPjE4
	NCc4J4ZpCMC9o8NrKzgNIBw0SNWJcYYM8uE9u85DRjr5E3qCCfNs5avy+gLgpqsV/kY6FXcptnoi/
	uK2HZ3+eAc7Y8OIqyvKbOD7i0nPxsz1ocuPnf2384BLQue5K8plQnOSUpp9Y4/lSMUL5y1W8SJC+K
	rM/876iXIIiVagURroWnNtusJjau4EvXY/jx+IflUZ7HY1om2PRmxLVYgi8fyxsxGscCiWdaYBCD9
	WJn2eLbpr1p4Wh73f9us276c+odXzGwyvBxzTUHP2zR/+QPYimuF5Ulfwu74n5vocqDLtpBYBsWMp
	3d7YEwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jTb-0000000B5PS-3QJo;
	Thu, 24 Sep 2026 13:27:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jTZ-0000000B5Ow-061t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:27:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4VZL3282830
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=; b=lzM/VNtfeZPyC4Af
	MZIAy8orTAZXln36oTZCXCythr6Kf5wbs1IvEcJQtuCuyRogstihDEI3aYM/l+9M
	O0gQ30vjc1+BLJ9AFMopg3C2tiEu10K5BqXPaQKeAKTp1olnyRXIjYBjaauYOBZ/
	uMkCr7S7WYAcEUcgfSKIA4G/MBmvoFXRPXKDpJr5+VD/+tcsVna4oMXGbufECfIC
	8HhcGMFq/2Hpw7qjPmF2PY/ntnnBLaa3E439eUS1qy5jH/74SnatqzJinYaeyoYH
	7hdTW/gNnmqWOqCIt8Sju38Gd08JAfSBIDbUDOyxZzr4jzKm0ZYCPD13vPsw74cr
	OVV0ZA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujta4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:26:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd188e16a2so17261485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790256419; cv=none;
        d=google.com; s=arc-20260327;
        b=HslWKI7L0AWSopo7/q4um52KOGsCIXt/MAgMY/ZESBAP12cF895KvRIy5H/lvd8T3h
         2SGYAhP/15qxJPBZItxQ0MORm3+SbIsj3BNYQAjktkk+2ZrEJ4wRPCQAYEerdVmcUAoS
         jj5skF9Xy3NyPnEJlxfoG/+ptZuwSy3mRAtpebCAmsCMXG0IPcnVOFeDVhdcKGjcIWoo
         3CwQV8CaUvc8G2PQZQXZ+YKQYFUegSBY5dQqOjzLuKHl7afGqqg7GW36FhklxWNeOIzZ
         APQ6TlAKzjeuCJcS05gQ9z8wH1wv05pQYi4aYjj3BDmFYpc7M0Gp+l5V6tqv/5lM/cKB
         3oCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=;
        fh=oi8iNaXq2ljho8cimZgL4mcaQl0IZ3OtitbgYXbmf6w=;
        b=qLwO5vw1TBCvesanE6sayEBa0lxeKJFmS8rfUqFZUDx+fg/4lkFw4RvlpGZaO24Zwp
         4PNHWugtZika/vhKlGXqyPPXoWhgEvu+ILS3xn5bza66X56UPvSRNOPLhZk7/Wwtl4OG
         8dlwTcMNUFJCgZjncnk1TcyyweeZpLXWFPiWeC/JB9A8LQANoS5tvkr5zjTKU88gAuCS
         ya1FNTsWyBwzonmfBKjcoornRl/xhdi8Ozwmqnt+N+XbwQeI/pFSiVSxbeODhz6IXXwx
         pnSKuq1koSNVZStgkWGaud+vjuMdqlMdMct0a1/IW45ktrf/eUq4DrYMIB1RCbLTMZcr
         VApA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790256419; x=1790861219; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=;
        b=OnFgA0tuIh5a4FUR9hiUvLx01I5Uokw2/csi7EXS+y+KiJ2RjTkKjCGTP9QSiDvwkB
         f40P2nJ8uYU8bHoi86+itUzrHFjrrP81RpMt8eTJNNEbb6grv6WmbTJFqPLzc+mhciiP
         Ju0qBra7zfVQigQGEp++4arW1qlPlkXGlegYVbf//jPR8NUj1F0TK1jzwu3FinadU+5r
         TdHuShKCWe5RTYn9tK93b6nmeZtFwcptW2kLRo1B68mEaJS95fXyTt/E3KMGRFfUSZ1Q
         ABzoo8DDKuKOW43p+RfjciSdXvV8k4yDyVTnOJTDBiO6iGwsA/FvRY9sQGiCO7IIpKsh
         MOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256419; x=1790861219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=;
        b=inyMyHHF0TIj4VDFomhPrwbmkdks1XRkleAMYNcB3Lbvjz2G18BlYyRk24vjzizdm4
         JlJCSMyF2Ijt2o+z2nVRYtANNxbFooKVYLnea6dG1fLe6LQzjFw1G8DkSmSsnGpzWqF1
         OoLif8CRUS9HbrRlDBY4UpcncHTKZYjVnKoAizJFn+THX4sHDKOMzOAqoTYnVRjmJ/qp
         WcbkHd+b9yB+rCPmIXNhqsZuHzVgVqtmw/Ewwkg4HIeeY3kYFIgOoahZm25Loam6puK5
         fzerQT+EKuP1wKYns3b6n5ggpdl3a5FoQebtQU+qeGNgLp/787ISqYYWQE3t8dG7AhVQ
         YJEw==
X-Forwarded-Encrypted: i=1; AKwUvBxAuZfjzLT9RyZMGKdda+noX0kJOmDbY3D1jI8L3GHb3Fq0bw8yE9uYA9CQW/uHDv3eITgtHdv+d0oDlRYgz7U8@lists.infradead.org
X-Gm-Message-State: AFuF++nN0dUfKcKcZDlMNHYoTMa6GJBjKrLwLt/pG1KrHh72pr+MYvJm
	XY/AUAYnzocSvxz0HjGkju7HVEsK+EZkcKRwyQit4V3D7sg6ONBgQU8NHhf7VnSyhhEw3E2yNCO
	IxTilozDwbtLZATlkPgRR0ouDmyoAs2nceRgA1ze/YqPfKywhYoZvp5AZAT+U6VLz0c3IiupVIZ
	DgCQvR0z/X0cqoK2bm1VPijbwLOLqpfof2M/GQN8B/wSqhr6XKkc5S
X-Gm-Gg: AYBFou3S8Yh7Dfv7/aWhLwtRidcdGhF67aBp6FypPMtaMpww7fhKtJpqWmeUW3XQlfS
	DK5QPFcP+Ny2Bh1IgZa10IrPPTRhkFhcczogkcoL0z3CTbCnWdG5pUadTwuKyxyDp45WVvYE1re
	N5F7ojMo7jIBzfRCteJq4Abm9feji5ANtVMvbvVa4eMB0HR6qvpuhyzT6vbw==
X-Received: by 2002:a17:902:c951:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2df7da61003mr21299675ad.2.1790256419164;
        Thu, 24 Sep 2026 06:26:59 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2df7da61003mr21299455ad.2.1790256418535; Thu, 24 Sep 2026
 06:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:26:47 +0200
X-Gm-Features: AclHuK-ulLYlrDKAq5ACQMVVKj_v9czY8rajC9JIbb6FYePBBB-t1z6sdrOEP5M
Message-ID: <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX3/GFIoVU+EhI
 Doy40guQ3/KXLBdkLV9lrsZFiGR8wYtiExS1eaTAQ9OF8xdMRNTCRljxZoaEvLAQSkjVelTyFvS
 v+I9ZupGmWf1kt5O8/7odRJc9wmlhqg=
X-Proofpoint-ORIG-GUID: 6WGMAyUVwpelDKx3RcrR5bzRZcK54YRm
X-Proofpoint-GUID: 6WGMAyUVwpelDKx3RcrR5bzRZcK54YRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfXwSZ1H6ehVtxJ
 PvuiU0i+Yt9ioO/B2tGgwtLjB3WW1evzm5gkoVRTCiJUAWujoE4kjc7CqUqz9hn0GITzW43LlKw
 u2SZnoBynYbsCyPjJKBMIEDSopJsdCSyHiI+um5VYDRW2tuyUteMdkSq5dJQUZTC4J6aMqVUJUu
 3b+L4K6umGW0A2QnaxFA4Uaq7C+tqpg8tjWK4e/TKbtNDq7AOdZ4444EE5pZZ5WGW208tz8hEGA
 BmPC6LmhFNvK+l9+gshHbFofvCK25nFvUBjS+xp0pPlJkUGjQRMwkYiogqP7MEH3pPI/5qtHrQW
 B2Z5J3vXJYkMt6yh0i8BNYOoLoy3slvhVvuUJuvqS2kN8OI1xw7FJ+f5k/OuxAptNlv0enoaK8T
 gRBraZjCqFQJVg9fTBXVVv2aSgv6Ry5BtxSlwd6Ly3deeBhEu+skhmcbdwhjNt0oDWQdYl2CMuV
 TksDXeXb53W9YnKKg4w==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab52524 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=kG7VYjDAWIKszkrqOz8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062701_072608_471D0106 
X-CRM114-Status: GOOD (  39.36  )
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

On Mon, Sep 21, 2026 at 12:49=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Replace the LCLA ESRAM regulator with runtime PM.
>
> Use the SRAM device that owns the ESRAM34 power domain.
>
> Hold that domain while DMA transfers are active. The DMA controller is
> runtime PM IRQ-safe, so keep taking explicit LCLA runtime PM references
> from the descriptor preparation path instead of relying on a runtime PM
> device link from the atomic transfer path.

A bit of an orthogonal problem, but related to the above. The irqsafe
thing have been discussed in the past for DMA controller drivers.

Would it possible to get rid of the irqsafe configuration for the dma
controller device, altogether?

I don't recall exactly, but not the entire consumer DMA API is allowed
to be called in atomic context, but perhaps that is not sufficient to
allow us to drop the irqsafe configuration for the DMA controller
device?

If not, I wonder if the consumer of the DMA (like an mmc controller)
should be assigned as a consumer device (using device links and
DL_FLAG_PM_RUNTIME) of the DMA controller device. In this way, the
consumer (mmc) would be able to control the supplier (DMA) through the
device link directly using runtime PM. This could potentially avoid
the requirement of having to use irqsafe for the DMA controller
device. Maybe someone already tried this?

If the irqsafe configuration can be dropped, in some way or the other,
this patch could become less intrusive, as all that would be needed is
to create a device link to sram device using DL_FLAG_PM_RUNTIME.

Kind regards
Uffe

>
> Add a stateless device link so system PM keeps the DMA controller ordered
> after the LCLA SRAM supplier.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 130 ++++++++++++++++++++++++++++++++----------=
------
>  1 file changed, 88 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index eda3f91741ed..2841af5b160b 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -21,8 +21,8 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_dma.h>
> +#include <linux/of_platform.h>
>  #include <linux/amba/bus.h>
> -#include <linux/regulator/consumer.h>
>
>  #include "dmaengine.h"
>  #include "ste_dma40.h"
> @@ -383,6 +383,7 @@ struct d40_lli_pool {
>   * @node: List entry.
>   * @is_in_client_list: true if the client owns this descriptor.
>   * @cyclic: true if this is a cyclic job
> + * @lcla_pm_active: LCLA SRAM power domain is held for this descriptor.
>   *
>   * This descriptor is used for both logical and physical transfers.
>   */
> @@ -402,6 +403,7 @@ struct d40_desc {
>
>         bool                             is_in_client_list;
>         bool                             cyclic;
> +       bool                             lcla_pm_active;
>  };
>
>  /**
> @@ -571,7 +573,8 @@ struct d40_gen_dmac {
>   * to phy_chans entries.
>   * @plat_data: Pointer to provided platform_data which is the driver
>   * configuration.
> - * @lcpa_regulator: Pointer to hold the regulator for the esram bank for=
 lcla.
> + * @lcla_dev: SRAM device for the ESRAM bank used by LCLA.
> + * @lcla_link: Device link to keep system PM ordered against LCLA.
>   * @phy_res: Vector containing all physical channels.
>   * @lcla_pool: lcla pool settings and data.
>   * @lcpa_base: The virtual mapped address of LCPA.
> @@ -606,7 +609,8 @@ struct d40_base {
>         struct d40_chan                 **lookup_log_chans;
>         struct d40_chan                 **lookup_phy_chans;
>         struct stedma40_platform_data    *plat_data;
> -       struct regulator                 *lcpa_regulator;
> +       struct device                    *lcla_dev;
> +       struct device_link               *lcla_link;
>         /* Physical half channels */
>         struct d40_phy_res               *phy_res;
>         struct d40_lcla_pool              lcla_pool;
> @@ -628,6 +632,36 @@ static struct device *chan2dev(struct d40_chan *d40c=
)
>         return &d40c->chan.dev->device;
>  }
>
> +static void d40_transfer_runtime_get(struct d40_base *base)
> +{
> +       pm_runtime_get_sync(base->dev);
> +}
> +
> +static int d40_lcla_runtime_get(struct d40_base *base)
> +{
> +       if (!base->lcla_dev)
> +               return 0;
> +
> +       return pm_runtime_resume_and_get(base->lcla_dev);
> +}
> +
> +static void d40_desc_lcla_runtime_put(struct d40_chan *d40c,
> +                                     struct d40_desc *d40d)
> +{
> +       struct d40_base *base =3D d40c->base;
> +
> +       if (!d40d->lcla_pm_active)
> +               return;
> +
> +       d40d->lcla_pm_active =3D false;
> +       pm_runtime_put(base->lcla_dev);
> +}
> +
> +static void d40_transfer_runtime_put(struct d40_base *base)
> +{
> +       pm_runtime_put_autosuspend(base->dev);
> +}
> +
>  static bool chan_is_physical(struct d40_chan *chan)
>  {
>         return chan->log_num =3D=3D D40_PHY_CHAN;
> @@ -818,6 +852,7 @@ static void d40_desc_free(struct d40_chan *d40c, stru=
ct d40_desc *d40d)
>
>         d40_pool_lli_free(d40c, d40d);
>         d40_lcla_free_all(d40c, d40d);
> +       d40_desc_lcla_runtime_put(d40c, d40d);
>         kmem_cache_free(d40c->base->desc_slab, d40d);
>  }
>
> @@ -1516,7 +1551,7 @@ static struct d40_desc *d40_queue_start(struct d40_=
chan *d40c)
>         if (d40d !=3D NULL) {
>                 if (!d40c->busy) {
>                         d40c->busy =3D true;
> -                       pm_runtime_get_sync(d40c->base->dev);
> +                       d40_transfer_runtime_get(d40c->base);
>                 }
>
>                 /* Remove from queue */
> @@ -1535,6 +1570,7 @@ static struct d40_desc *d40_queue_start(struct d40_=
chan *d40c)
>                         d40_desc_remove(d40d);
>                         d40_desc_free(d40c, d40d);
>                         d40c->busy =3D false;
> +                       d40_transfer_runtime_put(d40c->base);
>                         return ERR_PTR(err);
>                 }
>         }
> @@ -1583,7 +1619,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>                 if (d40_queue_start(d40c) =3D=3D NULL) {
>                         d40c->busy =3D false;
>
> -                       pm_runtime_put_autosuspend(d40c->base->dev);
> +                       d40_transfer_runtime_put(d40c->base);
>                 }
>
>                 d40_desc_remove(d40d);
> @@ -1637,6 +1673,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>                 } else if (!d40d->is_in_client_list) {
>                         d40_desc_remove(d40d);
>                         d40_lcla_free_all(d40c, d40d);
> +                       d40_desc_lcla_runtime_put(d40c, d40d);
>                         list_add_tail(&d40d->node, &d40c->client);
>                         d40d->is_in_client_list =3D true;
>                 }
> @@ -2067,7 +2104,7 @@ static int d40_free_dma(struct d40_chan *d40c)
>                 d40c->base->lookup_phy_chans[phy->num] =3D NULL;
>
>         if (d40c->busy)
> -               pm_runtime_put_autosuspend(d40c->base->dev);
> +               d40_transfer_runtime_put(d40c->base);
>
>         d40c->busy =3D false;
>         d40c->phy_chan =3D NULL;
> @@ -2246,6 +2283,7 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterl=
ist *sg_src,
>         dma_addr_t dst_dev_addr;
>         struct d40_desc *desc;
>         unsigned long flags;
> +       bool got_lcla_pm =3D false;
>         int ret;
>
>         if (!chan->phy_chan) {
> @@ -2255,11 +2293,20 @@ d40_prep_sg(struct dma_chan *dchan, struct scatte=
rlist *sg_src,
>
>         d40_set_runtime_config_write(dchan, &chan->slave_config, directio=
n);
>
> +       ret =3D d40_lcla_runtime_get(chan->base);
> +       if (ret) {
> +               chan_err(chan, "Failed to enable LCLA power domain\n");
> +               return NULL;
> +       }
> +       got_lcla_pm =3D !!chan->base->lcla_dev;
> +
>         spin_lock_irqsave(&chan->lock, flags);
>
>         desc =3D d40_prep_desc(chan, sg_src, sg_len, dma_flags);
>         if (desc =3D=3D NULL)
>                 goto unlock;
> +       desc->lcla_pm_active =3D got_lcla_pm;
> +       got_lcla_pm =3D false;
>
>         if (sg_next(&sg_src[sg_len - 1]) =3D=3D sg_src)
>                 desc->cyclic =3D true;
> @@ -2297,6 +2344,8 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterl=
ist *sg_src,
>         d40_desc_free(chan, desc);
>   unlock:
>         spin_unlock_irqrestore(&chan->lock, flags);
> +       if (got_lcla_pm)
> +               pm_runtime_put(chan->base->lcla_dev);
>         return NULL;
>  }
>
> @@ -2628,7 +2677,7 @@ static int d40_terminate_all(struct dma_chan *chan)
>         d40_term_all(d40c);
>         pm_runtime_put_autosuspend(d40c->base->dev);
>         if (d40c->busy)
> -               pm_runtime_put_autosuspend(d40c->base->dev);
> +               d40_transfer_runtime_put(d40c->base);
>         d40c->busy =3D false;
>
>         spin_unlock_irqrestore(&d40c->lock, flags);
> @@ -2931,29 +2980,11 @@ static int __init d40_dmaengine_init(struct d40_b=
ase *base,
>  #ifdef CONFIG_PM_SLEEP
>  static int dma40_suspend(struct device *dev)
>  {
> -       struct d40_base *base =3D dev_get_drvdata(dev);
> -       int ret;
> -
> -       ret =3D pm_runtime_force_suspend(dev);
> -       if (ret)
> -               return ret;
> -
> -       if (base->lcpa_regulator)
> -               ret =3D regulator_disable(base->lcpa_regulator);
> -       return ret;
> +       return pm_runtime_force_suspend(dev);
>  }
>
>  static int dma40_resume(struct device *dev)
>  {
> -       struct d40_base *base =3D dev_get_drvdata(dev);
> -       int ret =3D 0;
> -
> -       if (base->lcpa_regulator) {
> -               ret =3D regulator_enable(base->lcpa_regulator);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         return pm_runtime_force_resume(dev);
>  }
>  #endif
> @@ -3509,7 +3540,10 @@ static int __init d40_probe(struct platform_device=
 *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D pdev->dev.of_node;
>         struct device_node *np_lcpa;
> +       struct device_node *np_lcla;
> +       struct device_node *np_lcla_parent;
>         struct d40_base *base;
> +       struct platform_device *lcla_pdev;
>         struct resource *res;
>         struct resource res_lcpa;
>         int num_reserved_chans;
> @@ -3610,21 +3644,32 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>         irq_requested =3D true;
>
>         if (base->plat_data->use_esram_lcla) {
> +               np_lcla =3D of_parse_phandle(np, "sram", 1);
> +               if (!np_lcla) {
> +                       dev_err(dev, "no LCLA SRAM node\n");
> +                       ret =3D -EINVAL;
> +                       goto destroy_cache;
> +               }
>
> -               base->lcpa_regulator =3D regulator_get(base->dev, "lcla_e=
sram");
> -               if (IS_ERR(base->lcpa_regulator)) {
> -                       d40_err(dev, "Failed to get lcpa_regulator\n");
> -                       ret =3D PTR_ERR(base->lcpa_regulator);
> -                       base->lcpa_regulator =3D NULL;
> +               np_lcla_parent =3D of_get_parent(np_lcla);
> +               of_node_put(np_lcla);
> +               if (!np_lcla_parent) {
> +                       dev_err(dev, "no LCLA SRAM parent node\n");
> +                       ret =3D -EINVAL;
>                         goto destroy_cache;
>                 }
>
> -               ret =3D regulator_enable(base->lcpa_regulator);
> -               if (ret) {
> -                       d40_err(dev,
> -                               "Failed to enable lcpa_regulator\n");
> -                       regulator_put(base->lcpa_regulator);
> -                       base->lcpa_regulator =3D NULL;
> +               lcla_pdev =3D of_find_device_by_node(np_lcla_parent);
> +               of_node_put(np_lcla_parent);
> +               if (!lcla_pdev) {
> +                       ret =3D -EPROBE_DEFER;
> +                       goto destroy_cache;
> +               }
> +               base->lcla_dev =3D &lcla_pdev->dev;
> +               base->lcla_link =3D device_link_add(dev, base->lcla_dev,
> +                                                 DL_FLAG_STATELESS);
> +               if (!base->lcla_link) {
> +                       ret =3D -ENODEV;
>                         goto destroy_cache;
>                 }
>         }
> @@ -3663,16 +3708,17 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>                                  SZ_1K * base->num_phy_chans,
>                                  DMA_TO_DEVICE);
>
> -       if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
> +       if (!base->lcla_pool.base_unaligned && base->lcla_pool.base &&
> +           base->lcla_pool.pages)
>                 free_pages((unsigned long)base->lcla_pool.base,
>                            base->lcla_pool.pages);
>
>         kfree(base->lcla_pool.base_unaligned);
>
> -       if (base->lcpa_regulator) {
> -               regulator_disable(base->lcpa_regulator);
> -               regulator_put(base->lcpa_regulator);
> -       }
> +       if (base->lcla_link)
> +               device_link_del(base->lcla_link);
> +       if (base->lcla_dev)
> +               put_device(base->lcla_dev);
>         if (irq_requested)
>                 free_irq(base->irq, base);
>         if (runtime_pm_enabled)
>
> --
> 2.55.0
>

