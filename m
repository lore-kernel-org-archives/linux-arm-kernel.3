Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94082CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=; b=jTSiFK3b9Mu5gUmS5wmXGZM6bE
	3m5KTiNaqy43k2yiBtbtqmrXynmsOfgYw3/9jtq+xmoQ8QhwX7FFV5lFa5seIoMSzhjL8B30RmRMq
	l3/1ZSaELBcj7d4rBinA/kH/FlLp2Bk7+2mYLRmu1HJqfPl7lGZFyEosI7IzyNCKCP8bCgzXrQQ8a
	GM/Gu3DU2lvD972OXP67CA6uS1D96xVDKUIQHlhtLUlILkbzSVMCKtQVY/FZt89KJZNpfMANny8uV
	gu1lV3GDFUZZWqHWqH55QDCUtHWTexGff1UCYBLCwaSf01+aZ+FmT3+md4Xl8MdDPoUPUTjqO/Pdp
	LgxOw9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE31-00000000zl7-2DAj;
	Mon, 28 Sep 2026 16:17:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE2y-00000000zk3-1x3L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:17:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe6HF1647369
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=; b=Bi20cZ6fwwUWrbpt
	a+Jf3Joqsq1wPQmmfSoOfR1hMJyArBHC42oglSaXxYtYKBB1i5IiKWNCevloVb9o
	BKqMy5BThScgvlptiEqjd8x5WJLlLtpwfBw5GfLpiCnmeXl5WGVHzcAdxxcX9dyw
	QuV9rhVUh1vCCZHDHSNgXeL0NEKvglbUmwuhrm8FVfsNNAZXIpmgzUl3llyIXe9y
	XXmwN9Vpkj3H4XAMwdNZMZSlAQFrk5e2nIAhNI5UhcYaPFL8EMntToXkAnrQ3ZPI
	NGsc5iVv29WINfCjpU76pOETnKY/cfkMCipVDt0NcjRLJ/RO4oeDh9UcQmaHOA8q
	N/ottA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc1p06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:17:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3560933a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612262; cv=none;
        d=google.com; s=arc-20260327;
        b=mS+uQlBzPN7dJdDjMGTP1wnlr52BNZdnhK3h0aGJTXq2bXIaV2xSJQ0NurfeNGbOeN
         uLDL80k1NDUQ18NZ+wGGdX/XYLELHWdQTA5GTToFmti/+Iz926u5EamRXHP1ADHymuIk
         a6+wecvxmS7MwOFXYF9ANFMj3rfysp7I3butUxQzBl/uA+RHRIR53gdg3L7L5dtKvDG8
         dUGd/dE6OdhjP7nxyUA7uMZOmv6QWQ0Xfd3lQX2FGoKX7VaOM2BMmcMm6DFuRGeLt3xX
         4YG+zbr+S8coW9daMZOX2uT3MjbnX17jCCTHlLnE0MdmiLgBfxWNAXoZmO0AonLJMloj
         Cwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        fh=FuhiKc0RmmeHYGcOvZOJ2lcga2xFD5Whlbg3XCW8ue0=;
        b=H0U+v1kbYkWF4NflS2B/niXHyM1CHw/IBPpkQ8i0uLrXOlVGrAQSVneRpMK+nEyNAG
         djDeIDx/QHk/xuGZWMKWd832zuPoUhEuu98vHCa+dm9fzmwpgSuzBJQYm/3JeN7TQwm0
         rPhPhaq/7jKx+eYiHStmBm86tfhsQdX0Pa/JfFOsyaqdk60zfo94nhc7FlT2AEUOQ7dv
         0wjpuYcZwfBaB9E00Jsk52Ly1aGH9bRtd1dB7ClSs/9y6JA8ixubN8NFtjbLEQQbEZVb
         Kz06F/xZc4Yr+3SZ+gFqVAspJrXWmsAF/TI62jxmE5TvlWpjaiukNleWF4QAVIXgqDiM
         fFSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612262; x=1791217062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        b=IJo64NbcQ/OByFduQQqlJXcg/qXT9hvMSdJvQcfjcEwmHwN1jQQx3bOzMrtapK7ukc
         Y4GxC7a01DpdPbXNT5xSa0ucx6BUNf4rosWpwVkF0JsHSO+84vd5CVlvJtxUgPqxB7rK
         xK8YnkneDw42XEx9WhERhHQkQI0jpxaHOX1Fd0e8owAtiMybnwANRHeTjFYEK1Z97Nd6
         3vbCN47TsStgdCDeOzXLBMPQxN2TSaKo8KlgbSRG7hd4pw3bElOm2qz7neDE5WJ3t26S
         4RLwC2wTYjwjW/OaTVkloazVDLrcdmT8UJXDeiMggq2PP+kjb/0ROQNo7HUTXoLs7Yzl
         XQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612262; x=1791217062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPG9/h412pdnG6FSVrrR7JhkCyfchpuJdtkMOSDic+A=;
        b=GNZYsctJZt/sBV/jf2EBouRyk4M43YYBDy7+mrz6PTphpwM7Nm3FnzeJnAd+nc4Lpa
         wPH0C+a2gn4JKbLsHTJm+HT73Bed+FGh8+jOaUlGY1yUCkyz5/yJI1sJzdiPg/nLdF1x
         heo8LTujKtfMp8/fFGrbphiAtgUxpQnVoaqUZLKCxoH5RHj4DxRzJ+ZEyYUfnE3y7xX2
         sqxJ/nBoTjccb4vIfsiU4rlzT8BZ3aZX7vex+84nMi5r+TCMgFCLEGq5TWubgjlB01f1
         jNyJMXtT6r2iPrhUs1E84EOK5vUfYvrSmfGgwRfcWAsspeu5F1EZ8CHGXojarjqZ6nmH
         ybgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5MZIxInwuslIzTM5ti/kdZqNMvByQyqfHZ75g+d+369rPvbvVEVLyCdyMw2uSYc+oKA8wd0GIZLvuezr6+KwS@lists.infradead.org
X-Gm-Message-State: AFq9FYLEo0Jn38vWSY9jGSJh39fZwFdQdgPRK3CCg/+c4YW7Kp5LQkYO
	SwDpnEcF/wEeth6OlR3ishkZc38+v7OX/j64twSlVxlfYSqigSzZlEKoGkiPGWFut311ucoYc72
	OATx04iGGjzwwukYXOXFn3jOypgTJfiTZ9+/HIBnfkJWtxVLyjaM+I0ruv3Ba7fZ6cLLEztXgj8
	V0tPa1VrrBEdHQMJUeH0whR4pM5FUzyIgn7O+wPvzTRZBQN3nVqzHl
X-Gm-Gg: AYBFou2Bxb9xMIOdhRipMo8ROfeboo2eFS84ICZB51HylKBqjluaw479w9XNrthUABC
	Whb0Kmzu7CjW/7Ac6B+Co7qoCUQi6EsrdrSW4acMBv7tmHOjR0zRW3FupAFydG3RT0ncuC4IqoU
	Mei+cNmPkwG6luE1Ttw9yHPsnmUHhxQHr+kCImYd8K+B0uc4CshfCA64fNfQ==
X-Received: by 2002:a17:90b:3c45:b0:3a4:77fe:d478 with SMTP id 98e67ed59e1d1-3a477fed600mr2010796a91.25.1790612262295;
        Mon, 28 Sep 2026 09:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3c45:b0:3a4:77fe:d478 with SMTP id
 98e67ed59e1d1-3a477fed600mr2010764a91.25.1790612261755; Mon, 28 Sep 2026
 09:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260921191326.2146363-1-sanderson@brivo.com>
In-Reply-To: <20260921191326.2146363-1-sanderson@brivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:17:27 +0200
X-Gm-Features: AclHuK_h-ClRM0tgPWKnM-eRAvfXYVsbs7ZT5xtGlCXk84AjgUs2ZbGoR93rbsU
Message-ID: <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
To: Sean Anderson <sanderson@brivo.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba9327 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=GX7wjADfAAAA:8 a=PBpPEWVgUkDHuXiRGYoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: T2guNO6iDtTkc957KPneNUyG3tjSyuwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX6MKxkKvEGBqj
 Jy9eDHT+wok4ahID7gqH6EHGPdh9DIkQQK15jvJoaIr3EA44a1+VQOUuqBNGgToR1DQckERb/WB
 BNoTVe9Jt800IFU3UGWzylI2ErzhCCHM9hlFxVJfZrddyUiobu620XSjjRNVgCCS8e2At+ahEIV
 SljEKU5CTn+GfmYvPWHELJ8YUvFhSeho/P4kPH2SorLkj1LPOEKNT/h5kwCQk6NXvckXD/oL1je
 tNtlqRwOIxMMfEYshswRTg1Ht8mDqzMwh3Wzd6S03+PEjsnszuAwAW7MsIPvde4HJ1ig9Ak7AEC
 JXQlDXuRWv+0SQu1y/XPb0C9Zldr6T4ZmLC77QtYPbBpNMi/wOGRqRSo3zKAbpu88SbsSGA/yrB
 kYPpRZF8yXNOyAn6OcUa8LcLosr+JfvsYUKZvcOa5QLkY8sQQ+ldkSyYeXWYRS6IlYKaM/3jp8+
 /y2riQ8/EC7vHMbgVDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXz4eB4k4MNnCo
 mBf+qxXTJduKVwndk7yN39RQAJ84ss9kF2gJodHnsVQH0SvTngS3i+KpeslEw9Ziuzp3fwZSj3c
 7d4rLxeKr5v76Uf8Xhqp+vMy1y4RhCs=
X-Proofpoint-ORIG-GUID: T2guNO6iDtTkc957KPneNUyG3tjSyuwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091744_620895_8C7590A5 
X-CRM114-Status: GOOD (  23.28  )
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

On Mon, Sep 21, 2026 at 9:14=E2=80=AFPM Sean Anderson <sanderson@brivo.com>=
 wrote:
>
> The primary handler for IRQF_ONESHOT interrupts is always run without
> threading, even on PREEMPT_RT. Therefore, we must use a raw spinlock,
> which will never sleep (even on PREEMPT_RT).

Sorry, but I don't quite understand the above. Are you saying that
IRQF_ONESHOT only works with raw spinlocks?

Kind regards
Uffe

>
> Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>
> ---
>
>  drivers/mmc/host/meson-gx-mmc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-=
mmc.c
> index 694bb443d5f3f..d5365c0404cb9 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -176,7 +176,7 @@ struct meson_host {
>
>         bool needs_pre_post_req;
>
> -       spinlock_t lock;
> +       raw_spinlock_t lock;
>  };
>
>  #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
> @@ -953,10 +953,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev=
_id)
>         cmd =3D host->cmd;
>
>         if (status & IRQ_SDIO) {
> -               spin_lock(&host->lock);
> +               raw_spin_lock(&host->lock);
>                 __meson_mmc_enable_sdio_irq(host->mmc, 0);
>                 sdio_signal_irq(host->mmc);
> -               spin_unlock(&host->lock);
> +               raw_spin_unlock(&host->lock);
>                 status &=3D ~IRQ_SDIO;
>                 if (!status)
>                         return IRQ_HANDLED;
> @@ -1112,9 +1112,9 @@ static void meson_mmc_enable_sdio_irq(struct mmc_ho=
st *mmc, int enable)
>         struct meson_host *host =3D mmc_priv(mmc);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&host->lock, flags);
> +       raw_spin_lock_irqsave(&host->lock, flags);
>         __meson_mmc_enable_sdio_irq(mmc, enable);
> -       spin_unlock_irqrestore(&host->lock, flags);
> +       raw_spin_unlock_irqrestore(&host->lock, flags);
>  }
>
>  static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
> @@ -1225,7 +1225,7 @@ static int meson_mmc_probe(struct platform_device *=
pdev)
>         if (ret)
>                 goto err_init_clk;
>
> -       spin_lock_init(&host->lock);
> +       raw_spin_lock_init(&host->lock);
>
>         if (host->dram_access_quirk) {
>                 /* Limit segments to 1 due to low available sram memory *=
/
> ---
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
> branch: meson_mmc_raw
>
> --
> 2.53.0
>

