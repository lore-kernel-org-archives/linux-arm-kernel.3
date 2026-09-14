Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22026C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=; b=bJ8qVzQx1renXQfpg480MnSXgH
	sR+vdRRPJjjmmVtoWrhCQw89wcA0ECjeWMY3wNcViUZkciD6mFK+Mkoj6PFkimUuKcoIEfWunf4oY
	74A4kuj9glM/mshbmR/xT+3dNY5x+sdYwtYiqRIWuCtUyAyHp74uB/jIYKui4F5RTG1qmR7ywIEhk
	tORN2Tg19i1PZxbkNOa4gxxK9jomI6IwJzNKYyeLnUphcFW/09VVwPrKo9N2kosmkgZK1JbbHPb86
	MekvxA0dBIS99ppDY3MNe/aUQ8AJ+9nmVIPgOyhFn22CkAJS+b/t9hJd3U8bZrjt19FYKl9J2lzQ1
	qpdEf0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63d1-000000033lz-0ALw;
	Mon, 14 Sep 2026 10:09:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63cw-000000033kb-375M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:09:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nlDH184685
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=; b=DTJWsWaxEWcyQxd7
	/zc8B2l8YfzSEJu1xocwPAoboX3DoCDxB7PEY/LideHUdL2MgdUoVbBdpcMPVOTw
	MkZaKJeoGtDfgrYhp6hhfa+UxAZHNucMsblfD9392xgKUn2zeJRsSBDqiy0vPgOy
	CbEwG0IG9SMgIm9j1VvH5sEUvFB0KRdW4DIRQ9lXWGOXWl0unTrNuKRmulXkK9xP
	YJzQn4VyPMOs3Pz1QzyWl9nV7XFlRZFJtakhVP8s0a3pF+qB9IcD4Z/AdhWEWUeC
	Hdc/rlib/HRq8aq7qFrtZwjWCE0nVAV9ZkeR3LOBZ8aRKxjViixoDuZT0cdq0zBd
	0TR9fQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c633k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 10:09:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6df0a1e18so62066475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 03:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380568; cv=none;
        d=google.com; s=arc-20260327;
        b=NAAeq1stvsWybuhbMT0uMZ/dE8TjYwTs50+W4LHHent9zWvheOAKo3GTx9iXoHkXVF
         uQP+Cnx1zFINNiBWDULCyALPOGbH+kobYdXkvIoxylc6Tr1cAt6AYixxhx2V4Z4LWm6k
         ypcoeXtoeZh3TrgnMpoRlKZ8qMj/tNDZz+Di/vSvOOViC+BD9DbIPTvUxYmPylBRRHbx
         gtWDys/BpJ1cpue8WuVfgTqzsQBo9diI91avYQwpnG6yBTj5VyNCwsLfy04uOyu5boJL
         qHG79rkeX2LYCZQ2DnApSQNQfwPiNlv+NO+MYb51kua7dqwnqPI95aozG0d+OKiCujEQ
         ygbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=;
        fh=z4s/2mipgVkkAFxaVtWDU7bMJwnUAf2LFKYleNNxjYU=;
        b=I/DGPHzyUvcwwylCp47z39dvcJeRBpr4FZ/ksvIBQtLzLsyj/wPRFq/7TsD0630Njs
         1MCFP1IDcWZY+NXh8Zy6fOL7oLPbT17DS12vZOfyhfw1hyCGJjZYseYZN9ElGwAQHhHJ
         kaCzqbuRO5Y6DXQwXWa85iT0Rt9lxr+cNEsZ3Tdp/MlsnoScDDmJTpX01mdGI9YqHs7m
         mkR7nftGlf5G8pWBhxbgNXfMuV+VMMLMBJ5pbkiGLESyxEPmFmtV07uxxBF/ja38Z1po
         iLay8XYstRuPcIhy+fwSKcjbhJXU7cj17q2UbNOdjsvF4HsLKCjSW7P3WXNLquEa/LpQ
         iq6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380568; x=1789985368; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=;
        b=MKPGHafP5KdUEVlMz+202h3REXxbjExN3uK79crzSdcRehwI8jwuPyH9yfg7hZ8Yi0
         moP0yIDQVLAIyV07I5geHEr+x08fBgSkaNjzi27MJ25+LN9cuU8q+pv1aTbvDXpNs2KI
         svV9Dl3ifFM2SMZPzAKc5E7jse7DZxj2mD8O+i7FOwpcwGp1Kxom7wb791Wqcde3ooS7
         eWtnF+pU9l0bx7YRUqg/yVZulBj0mKRDtCS3YEx6GeLKILBDrm0Hy9zNWfX+iBhfEJLN
         ISwki20YL+n6bbcvn3PRvvMTf9AW1wVYB93OvLG3BoI9HBteHrCywK9MChTsmzGB9qrb
         5DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380568; x=1789985368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUkfAr3dLBYHJ43VED259V7T5siL3Nd9v9HANDkn5BA=;
        b=s1mZfoFjKQ7W2+fgTHWz9PODoQZrXVkdkF9oIw0ko2zuWrEHtPuP2DcNQldSkeyAkJ
         Q6HUhz0V7zJ9yBhOE/YI/SPeNMaWjf5Djtcu4ifcseWPle5dDQycUNd7Hdt3C0fTcVP8
         YYYta0Ea5xFg6zeNP1Sol5TzloSapFmNCOmeEBin+H4Mgj2DBuST2glWiIJ8SaWWT5Iw
         kAige3qDPumaim3jRvP3QpUWy920Fp/Sp2ncPnOyMCdOQhID+hoq8e7l/CpljKAnJBj5
         rDOhUe7MPyD/644O4rMpGDQbodRP8m0FOiEkBFMLuemxPKwRdGtfz7y2Zh2Gj43W9Qsn
         qzYw==
X-Forwarded-Encrypted: i=1; AKwUvBzTJoTthZ8r07874bBVISS2GG0y6ISQHiVdNASJazF04VDThE/Oj7HWcTARKwG1bGFa0x4HyuFR05SBPcoUOwSN@lists.infradead.org
X-Gm-Message-State: AFuF++mtw5ZPBUTaoKYvLlbaH/6sFpQEtKdYQpo2wt47sNiGRSCJb8cp
	3fRW5PoaAAUk4LQcohtM8crSuOuqPA+aXIUeBi5xxrKcunnwjYp5xq6807QM3iATtrfVx+LZVvt
	anukr4ByB4upuxU0yltwI7tMpdLZcPFf3dfaiLxCJ30yoYj9sg+4UDCCFYehxOLgDLkIRLBGa8c
	VA+DiaBUBeMWoZLcgvoGDFzvY+q48PTEIrmOm2Ehjivy9kUGtnM148
X-Gm-Gg: AYBFou3gAr7Zw5k96xfm7EaRO3RMscHJNM4olf30cZspfBJl1jSAyF5Jw2RvCrNyE6L
	fvJu+Vy1WphhQyc32Mue/erSF52YVYPzN+XxQoQySgZa/KS2TYpw6UED6SlsWf9n5hJn7RqLbkS
	RWZLuEEuxmp+M0dyN3Xi1DOpnjGQMT989q9E+y/skAfNilfrMoATlbEmBgJg==
X-Received: by 2002:a17:902:fc4c:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2dd6c6db8b7mr42625795ad.14.1789380568254;
        Mon, 14 Sep 2026 03:09:28 -0700 (PDT)
X-Received: by 2002:a17:902:fc4c:b0:2d9:123c:8c49 with SMTP id
 d9443c01a7336-2dd6c6db8b7mr42625125ad.14.1789380567732; Mon, 14 Sep 2026
 03:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260907064632.8926-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907064632.8926-1-hemanth.selam@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:09:15 +0200
X-Gm-Features: AcwNN1UHbb7Un59MqnfrrdPT2h7Y8EIzqrVWafIOztdgL3w_NXx4_dDPh0RBRQM
Message-ID: <CAPx+jO8KoLW+dpKrgdAnwDpWxNn-uJcUGS_j-VUGyW6YPTXoMw@mail.gmail.com>
Subject: Re: [PATCH] mmc: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Shawn Lin <shawn.lin@rock-chips.com>, Nicolas Pitre <nico@fluxnic.net>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 19FJ86psVizabjjQ66M2m5JhUpXmzc7B
X-Proofpoint-GUID: 19FJ86psVizabjjQ66M2m5JhUpXmzc7B
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c7d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=_vvJFgV3Y_p9qj4_XX8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX8YZbmtqqNJpl
 1vhpiG/8Zpext9m+NleW5VWO8/FXX32po8kJAn4SGy+SRoKe0fFcAfZ3pQWz1VWf/hW157SfTaP
 pZvWMprfYvLzlQ/NiPV0KUThHLm8RE2fnPGNrNyzyngOQK4rcInLzIUsY/PNmXR1B7nKK9uNnyg
 te8k8KSmJnRg7qJtGKwooKs6EH6FXgZ0zKdnJcHOg9KewPtAvzhevv6QkPQbA4u6C7SDIJPo1ou
 1Nkpv1TLDTHlB1HQFgnt8mnFmx/UDFPJsHIoeUqA+Nzuybc7JL7Jt5Bv9+mNvV92qMmXGHuNxt2
 fNDq9EwNEXcAipgpDrdNcp/0CrHhFgRjY49zqQN0/dp7iZnW2baAtETvi+KAbbA2bo2/ctvK6mN
 lolWGFLNsA5PGsfkM/vY6sC+baWU788Bv/RHU34i1l224K7DRl07+wPbCMOG6q1znJSO08m+vcI
 BuY8U+va17v9JlB3gRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXwtXrCfRastPJ
 NAbi4F1hVeHccdBDsE+Rg7JfyU8YN5T7fKd+4OSJ/DtH+3r4zAzeE438QfN9HArNA5/nZOdhFvy
 pk4zHjGzWM4CIQZu0FoNkEYYgU/J01I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_030930_903072_1ADFE9B5 
X-CRM114-Status: GOOD (  36.77  )
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

On Mon, Sep 7, 2026 at 8:46=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c  | 2 +-
>  drivers/memstick/host/r592.c      | 2 +-
>  drivers/mmc/core/block.c          | 2 +-
>  drivers/mmc/core/core.c           | 2 +-
>  drivers/mmc/core/mmc.c            | 2 +-
>  drivers/mmc/host/bcm2835.c        | 2 +-
>  drivers/mmc/host/dw_mmc.h         | 2 +-
>  drivers/mmc/host/mvsdio.c         | 2 +-
>  drivers/mmc/host/sdhci-msm.c      | 2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c | 2 +-
>  drivers/mmc/host/sdhci-omap.c     | 2 +-
>  drivers/mmc/host/sdhci.h          | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_=
block.c
> index ce33907bfc24..e2bf563ccbe1 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -720,7 +720,7 @@ static int h_msb_parallel_switch(struct memstick_dev =
*card,
>
>  static int msb_switch_to_parallel(struct msb_data *msb);
>
> -/* Reset the card, to guard against hw errors beeing treated as bad bloc=
ks */
> +/* Reset the card, to guard against hw errors being treated as bad block=
s */
>  static int msb_reset(struct msb_data *msb, bool full)
>  {
>
> diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
> index 605b2265536f..dc3de63901be 100644
> --- a/drivers/memstick/host/r592.c
> +++ b/drivers/memstick/host/r592.c
> @@ -289,7 +289,7 @@ static int r592_transfer_fifo_dma(struct r592_device =
*dev)
>         dev->dma_error =3D 0;
>         reinit_completion(&dev->dma_done);
>
> -       /* TODO: hidden assumption about nenth beeing always 1 */
> +       /* TODO: hidden assumption about nenth being always 1 */
>         sg_count =3D dma_map_sg(&dev->pci_dev->dev, &dev->req->sg, 1, is_=
write ?
>                               DMA_TO_DEVICE : DMA_FROM_DEVICE);
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index e760d13ee325..a02bb2fee874 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -86,7 +86,7 @@ MODULE_ALIAS("mmc:block");
>  static DEFINE_MUTEX(block_mutex);
>
>  /*
> - * The defaults come from config options but can be overriden by module
> + * The defaults come from config options but can be overridden by module
>   * or bootarg options.
>   */
>  static int perdev_minors =3D CONFIG_MMC_BLOCK_MINORS;
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 29e80e5f928e..08d41f0996de 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2004,7 +2004,7 @@ unsigned int mmc_calc_max_discard(struct mmc_card *=
card)
>
>         /*
>          * Without erase_group_def set, MMC erase timeout depends on cloc=
k
> -        * frequence which can change.  In that case, the best choice is
> +        * frequency which can change.  In that case, the best choice is
>          * just the preferred erase size.
>          */
>         if (mmc_card_mmc(card) && !(card->ext_csd.erase_group_def & 1))
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 05444ecf3909..a02b04938e1a 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1015,7 +1015,7 @@ static void mmc_set_bus_speed(struct mmc_card *card=
)
>  }
>
>  /*
> - * Select the bus width amoung 4-bit and 8-bit(SDR).
> + * Select the bus width among 4-bit and 8-bit(SDR).
>   * If the bus width is changed successfully, return the selected width v=
alue.
>   * Zero is returned instead of error value if the wide width is not supp=
orted.
>   */
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index c949a3eaae79..efd1903c3ccd 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1095,7 +1095,7 @@ static void bcm2835_set_clock(struct bcm2835_host *=
host, unsigned int clock)
>         int div;
>
>         /* The SDCDIV register has 11 bits, and holds (div - 2).  But
> -        * in data mode the max is 50MHz wihout a minimum, and only
> +        * in data mode the max is 50MHz without a minimum, and only
>          * the bottom 3 bits are used. Since the switch over is
>          * automatic (unless we have marked the card as slow...),
>          * chosen values have to make sense in both modes.  Ident mode
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index 38610c89d54a..d500a419e2cf 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -69,7 +69,7 @@ struct dw_mci_dma_slave {
>   * @cmd: The command currently being sent to the card, or NULL.
>   * @data: The data currently being transferred, or NULL if no data
>   *     transfer is in progress.
> - * @stop_abort: The command currently prepared for stoping transfer.
> + * @stop_abort: The command currently prepared for stopping transfer.
>   * @prev_blksz: The former transfer blksz record.
>   * @timing: Record of current ios timing.
>   * @use_dma: Which DMA channel is in use for the current transfer, zero
> diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
> index cf705b265e21..7d86426c6001 100644
> --- a/drivers/mmc/host/mvsdio.c
> +++ b/drivers/mmc/host/mvsdio.c
> @@ -717,7 +717,7 @@ static int mvsd_probe(struct platform_device *pdev)
>         /*
>          * Some non-DT platforms do not pass a clock, and the clock
>          * frequency is passed through platform_data. On DT platforms,
> -        * a clock must always be passed, even if there is no gatable
> +        * a clock must always be passed, even if there is no gateable
>          * clock associated to the SDIO interface (it can simply be a
>          * fixed rate clock).
>          */
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 4aff965f0e2e..b229545d9db5 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1770,7 +1770,7 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_h=
ost *host, int irq)
>
>         /*
>          * The driver has to acknowledge the interrupt, switch voltages a=
nd
> -        * report back if it succeded or not to this register. The voltag=
e
> +        * report back if it succeeded or not to this register. The volta=
ge
>          * switches are handled by the sdhci core, so just report success=
.
>          */
>         msm_host_writel(msm_host, irq_ack, host,
> diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-o=
f-esdhc.c
> index 8345e2c5a034..1ca3562d8f73 100644
> --- a/drivers/mmc/host/sdhci-of-esdhc.c
> +++ b/drivers/mmc/host/sdhci-of-esdhc.c
> @@ -1381,7 +1381,7 @@ static void esdhc_init(struct platform_device *pdev=
, struct sdhci_host *host)
>         if (!IS_ERR(clk)) {
>                 /*
>                  * esdhc->peripheral_clock would be assigned with a value
> -                * which is eSDHC base clock when use periperal clock.
> +                * which is eSDHC base clock when use peripheral clock.
>                  * For some platforms, the clock value got by common clk
>                  * API is peripheral clock while the eSDHC base clock is
>                  * 1/2 peripheral clock.
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.=
c
> index b5d7c1a80a92..7a198fb26628 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -332,7 +332,7 @@ static int sdhci_omap_execute_tuning(struct mmc_host =
*mmc, u32 opcode)
>         u32 reg;
>         int i;
>
> -       /* clock tuning is not needed for upto 52MHz */
> +       /* clock tuning is not needed for up to 52MHz */
>         if (ios->clock <=3D 52000000)
>                 return 0;
>
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index f0fd81409a86..98c1fe20bfcd 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -409,7 +409,7 @@ struct sdhci_adma2_64_desc {
>  #define SDHCI_MAX_MRQS         2
>
>  /*
> - * 48bit command and 136 bit response in 100KHz clock could take upto 2.=
48ms.
> + * 48bit command and 136 bit response in 100KHz clock could take up to 2=
.48ms.
>   * However since the start time of the command, the time between
>   * command and response, and the time between response and start of data=
 is
>   * not known, set the command transfer time to 10ms.
> --
> 2.48.1
>

