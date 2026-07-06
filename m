Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=; b=1eLgPDxCCshe2wTkxZ6jk0Cz0A
	zpmRYUdHvstWMMEKUQ3JFK9d7d9wSnaIT68oq7EkjHx2zIMsKqc2ppRCh5KUvZ4WGN/AQRyQPgvvs
	9Ly+XcR3w73+WL25eA3f39my5wIL8GNAKy2+EfF6WSUsx2hRVt3hDigpTOkQpNA2ZMx+ZwgOwCMWZ
	7Xg+IAk7MCSm784BDD+c0Oh5cSyqv1H/ERSPselxjBRUpzXE08JRkAPs7qOP5Fy0Z51m5PrH56Xgv
	FAIx1LAxRP5OoPWf6P66N3wgU436YUZMhTSDtiVt1WI42Hvu6XOzYP8/l+ZX9WTyeEmDfGp4yQDgE
	lZz2Zdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglWj-0000000CwDF-39bJ;
	Mon, 06 Jul 2026 15:46:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglWh-0000000CwCU-184X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:46:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8eu990257
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=; b=hXZp1fbz4cz372gL
	swOx37jRUZyhMOJu11R2PHaveWDbkEDuxJtIIw4ZT8oFYwMMK0fEMQd5MDT2KCnP
	XASsVc0hrVC9REAWNI++Jh/oryw7S61DX6jKX1daudC2gs038daj+7xFQQgF988+
	JPH+iDKbsv8dnDthyUtGuJefBq/O8S5tEJ2U4eUOBxCenwg+6OzRVVzZt/AYtFjd
	mh0HyEE8+WxFz8efJ/yINBZoPcjRTpPy6IBmGwV/H+I5Jcx8dZIxnwVKGM4XVHhu
	9fArCoYwqx5Bk9VzTbzuv8X/36v6/sds5G9lYjuxWbzWAvoU9PWrdm/SDU7CBcMz
	tYON5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsk82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:46:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f000e221d7so31527526d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352788; cv=none;
        d=google.com; s=arc-20260327;
        b=bBPpa30pDSqdY3JAmlYVRg1qcZNHVqxo+y5yc+Ay1r8qFWkC7nghuopv3yxO8w8eG5
         XSnn+qF/ssHmpN6V236aM6JhDkm1F/DptZnrTHrjsvRE8oDAa+0dH43Ww0QWfq0zoD02
         lY0x2+9Rib6buG7xXn74eA1ORZFDdu9v6dCKP568/r4d0nEtzbH0O1vf79n8udpJo8Bq
         8V1P4EOD+U3+79qpb4s2Ki/VVSxWVGf4Npze1JUTN1MgTfDo/Eb+IwsOx+MWwNINnlvl
         vpmU0MmCKFPXbvDbduoMETVqwiNx3/blpl56jzWktBGT32RehF4HVKRqwmaMw1Vr6EAI
         isIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        fh=cJ0bvm824QXiKNypR6HR+zFYcj8qgJPHBhHLBDknpXk=;
        b=dJ0UY+0qP8B7xieeI7mRPQ9Tbx40cx1oIxCTFj5Nyx81ZfObYXT/luGkIbLX0gtf6V
         QQck7NfA0zubUiR57+RSZWhiE63g40ztDYBjxsTcQeGIlozn5TlNiAzDvDOIrbGoIUuP
         hXtNTOzmDpGY2hOQmwdGfbJ+4El/HDcZzS8lfgDZmyD8kzlq4eNmmQFzQfzN8Xxy76Sv
         XMi29/hII+e9CD2RU0ClyK3nBcXlHFxBhZjLiZq+LS6IQ+hdjwdldEarhBYyQSR5BnHH
         +gYvgrb6GcVqDYXNYPZ+LIgUkcwcthT/vjWLgYg+LHTfvKwWO8GDifrTUxhA8mlxPMsQ
         fFTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352788; x=1783957588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        b=DSj9cH6bAXUA1MmkBWoPdpkhIxzKq/MV0CN0PlWmjJw7b9p0opaMOSgJ24iLdT5sEd
         al6HEe1un93giAVFLtsYlUnGX4VfSMuX0cqKE+3Hm1NPUfkSwFYYH0F71EwY+PMfYIbH
         1YUd61oZXAGhvHQZE/N4dKqTnjJbAV/O0RuZH5SD/psLA76tdO8bFX0gN8hNjn7lBJej
         FVeSTvFJCEkQD4y3iC6uYA4Gs0tU7B4WywT0oRRKcSScz5hDG13s1rFGd1NxuhhKchQb
         8EhRdCqt3RtjsCbxiJXe5SqC6boYOI/QHi93srNU3l4Dhp9pHAlaTY9ub7aqkB65Bfky
         w4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352788; x=1783957588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OnMOn2/de6czvKsT65QKA7vIysNRqWUd1S/71D1Jas=;
        b=jW6Dp2hf51zn5cO7TrmwvKj1IQw0+8K44HVI5XAbI7Oij5KJv+9n7birOBk6nb9+87
         wfWGdQ/wi2vEZaYVb9ABjhGXaPiQHe7IBOOPj355ku/zxloU3uFM/w4X7e1AxRy52puV
         V34xA1zo+mCSHpDnYMNAj4QX5e2hDuHB18jPo+Oa0p26EcywaGtravGGeLpSnZYdJenv
         qC+UT1mk21M0eb8OxydFz+YP3GEu2W8PHNMSc8Ai7bR448DoroUWsifXIpkioLAy+oRY
         v/AVneGVcUji+lBFBtiEHWfYep4BVCBGJ3aCSxUhxqtSLvf1MbKskizkUW1IDQsvPEjR
         FonA==
X-Forwarded-Encrypted: i=1; AHgh+RpDF49jaORWBamhXfrs0gimuwwj+hdk2lVy+kkjNfIq20yjtFl0Ij/oOgh2MG4c9MjYC6gOfrwfJIzwAJqCD+fn@lists.infradead.org
X-Gm-Message-State: AOJu0YyMOGgwYANOcC8bFn9w9mJo8HPZPzh8wLbaulx6eizPWz+ddMn8
	4yg1q2L/lSH8GF2LdLtQzjrbSBgWSHS9jQUWbcHHkg93gY5rIsfF5G4O1yFfUKunoyAmk5vLQOB
	BhMhocjEHGaM6aiSUF75XVLC/rhXfkz/hQFoZGhaAwVOw6XX3R8LLSXuDCYKcrXxenKvb3VBgCI
	POsIXVJYge0HW6S6KHeiNGI4JWXJzfXNyuRCAXX7w+z/wVyxPeNyD9
X-Gm-Gg: AfdE7cmDDGLM1eyuJ8qKrsn6ZATpwrQ78xb8oQkbcv1SC/2w2imXfMWCLnlcHomT5Aw
	ElbH/eplSpy65Mz6vBI1XMHMi5mgkLucCpRDkErZ0AR0+5xtbcPnJWrDX05/fY9OgdutRm8GvCZ
	MlV51v88gg7ClUizbdpakrrJRnowvN9N6wpJHUrS/O40QKs/ZEH2kQatJFvp0TBxUEzf1V
X-Received: by 2002:a05:6214:5003:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-8fcb3d3ee24mr12450876d6.29.1783352788259;
        Mon, 06 Jul 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a05:6214:5003:b0:8f3:e97:59b8 with SMTP id
 6a1803df08f44-8fcb3d3ee24mr12450156d6.29.1783352787606; Mon, 06 Jul 2026
 08:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
 <20260624021912.632627-1-cw9316.lee@samsung.com>
In-Reply-To: <20260624021912.632627-1-cw9316.lee@samsung.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:16 +0200
X-Gm-Features: AVVi8CcBYSP5zyLpt00Q11yUujyWdz_mc32EjqBaIjLdlr5HgDzXa1HvKfgTjLk
Message-ID: <CAPx+jO9=7B4SYyKSwvGqx+zzMsJ+hhFUK_vmU-HNYQZfKv+bdQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: cqhci: Remove unused intmask parameter from cqhci_irq()
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Haibo Chen <haibo.chen@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER" <linux-mmc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _QYDC7RxLQZZija99YrlDIgtO8saVfrY
X-Proofpoint-ORIG-GUID: _QYDC7RxLQZZija99YrlDIgtO8saVfrY
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bcdd6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=hD80L64hAAAA:8 a=EqBXy2bI2-3AcK8LOXQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX6sXOG+hmhcbs
 rsx4fI33ALVRgNAvlwCHu4xHE+LCwtHKOxT8fG2lgJuYmaLIk7anDefevpZ/8dzuSB3YDJPZgrR
 n71EQp92IAPgjy4YflkA0+ISkOUttE0XloduaT+RaiGjVl9r5+BEK80dAArbzNgZZWkbsyhP2AG
 6pUUAhTyHFup4IjwjYJcbInlShg8Kl2NW/2U+HN/nnLefgo0MTMwFmJKWTcCInJ1Xm6zC3oBUsM
 jnWPJI4C8mmHE948xMMjPASu2s/YXN58uMwLpJ2hDTxLXIMPHY8t5kSIDaPYgt+5D0PGXXcXW/W
 DwZB0o56ElEe6+YtB3NHgQxEW7WT4SEk0ENjYxTvCmmxin1MjdZ4RBMxgdQ1cNUQU/wQm/QAUDy
 ODqzU4zfSkm1HhmeBbv/95XU44CHixWGLkrlUanL/7e95/0R0W6S00s1X6XlTGzdnehPR3CO1gz
 bb58MSeFC7tWOs0EyLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX3wmfP/4Caope
 jV528hMPJmQACxdl2AlMy8Vn1/d+iS9qyuAFmADAxfL4qOiaha954q1RXN/H25WoyoEPPeihVO7
 LKKYX1sG67WLgxrsiCIpzrcyRhYWVuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084631_317178_51AD73B6 
X-CRM114-Status: GOOD (  21.69  )
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

On Wed, Jun 24, 2026 at 4:20=E2=80=AFAM Chanwoo Lee <cw9316.lee@samsung.com=
> wrote:
>
> The intmask parameter of cqhci_irq() is never used within the function
> body. The function reads the CQHCI interrupt status directly via
> cqhci_readl() and processes interrupts independently of the SDHCI
> intmask value passed by callers.
>
> Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cqhci-core.c       | 3 +--
>  drivers/mmc/host/cqhci.h            | 3 +--
>  drivers/mmc/host/mtk-sd.c           | 2 +-
>  drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
>  drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
>  drivers/mmc/host/sdhci-msm.c        | 2 +-
>  drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
>  drivers/mmc/host/sdhci-pci-core.c   | 2 +-
>  drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
>  drivers/mmc/host/sdhci-tegra.c      | 2 +-
>  drivers/mmc/host/sdhci_am654.c      | 2 +-
>  12 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.=
c
> index 178277d90c31..98ceb0b9a6d1 100644
> --- a/drivers/mmc/host/cqhci-core.c
> +++ b/drivers/mmc/host/cqhci-core.c
> @@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, un=
signed int tag)
>         mmc_cqe_request_done(mmc, mrq);
>  }
>
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -                     int data_error)
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_erro=
r)
>  {
>         u32 status;
>         unsigned long tag =3D 0, comp_status;
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index 3668856531c1..8fbbc48c3f85 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host=
, int reg)
>
>  struct platform_device;
>
> -irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
> -                     int data_error);
> +irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_erro=
r);
>  int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dm=
a64);
>  struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>  int cqhci_deactivate(struct mmc_host *mmc);
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc054bd..01ea3adbdf3b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *=
host, u32 intsts)
>                         cmd_err, dat_err, intsts);
>         }
>
> -       return cqhci_irq(mmc, 0, cmd_err, dat_err);
> +       return cqhci_irq(mmc, cmd_err, dat_err);
>  }
>
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-br=
cmstb.c
> index 57e45951644e..1de2f05fd958 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 18ecddd6df6f..d0fa83f67a80 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host,=
 u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9..ceed47ccfda8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *hos=
t, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>         return 0;
>  }
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-=
of-arasan.c
> index 785d3acb18c5..4ca73e7d799e 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *=
host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci=
-of-dwcmshc.c
> index eef53455b8ee..4c5fa6a6931d 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-p=
ci-core.c
> index c347fac24515..b121d896a804 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u=
32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pc=
i-gli.c
> index 6e4084407662..b55618566d65 100644
> --- a/drivers/mmc/host/sdhci-pci-gli.c
> +++ b/drivers/mmc/host/sdhci-pci-gli.c
> @@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_hos=
t *host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 820ce4dae58b..221e48b59f48 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host =
*host, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am65=
4.c
> index d235b0aecfdb..2a27db2f558b 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *h=
ost, u32 intmask)
>         if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
>                 return intmask;
>
> -       cqhci_irq(host->mmc, intmask, cmd_error, data_error);
> +       cqhci_irq(host->mmc, cmd_error, data_error);
>
>         return 0;
>  }
> --
> 2.43.0
>

