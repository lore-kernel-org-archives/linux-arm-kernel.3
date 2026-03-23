Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6740DF4612A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=; b=G6STxsdJ9419pdaXBIYTswXS24
	KF08jYfErUM5NHaKWt1E1Lc9CUN2hnHMqZkykuDKRxSW8hPHs/uq3fv4129PHqCK3hR28Q9tBhzmi
	qUJ4/3Ue9fxdaOk7H+PP8odVXkQGEBsMAwU0J1OOUJsz8gTXEccxWBuSw+ZAoe+axS0/kSt2WW8h8
	Lhnu/2Y4aWOI7DU2HxMR3b0JzwVyVQgrA/cIQ3Lkq7tDBvMQydM0JMXg1l+3zf0wb61ul5jgn8SLE
	efiz5mTt/9iCVHHgE5XfU1PtfjWWeXk0+ZjQuDP444Ov+pDO8F/D+LWaIIHKmnvUpv8+asQBZ7npe
	cmbw/I6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gHu-0000000Gvwv-09Ot;
	Mon, 23 Mar 2026 14:29:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gHr-0000000GvwB-2aHG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:29:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b982b0889d8so31846566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774276185; cv=none;
        d=google.com; s=arc-20240605;
        b=ch5revV399papNgvsRif3766Ap1L4pNvAHM974LluIIUtefA8hP6TMzwyrOgX/Lqxk
         QDxSuCji5NFLPYtV/n20qOJitUFVfNcxUdkU+D/F3A7+R/kSK234IrrYa84wlFRKNpq3
         RHdbyFTWtFRNTBzmSeaMWiWNRBAa5PB5YOSBxsQlN189vfPPrcrPk08hYDhBYuXpkleW
         Hnql+c+TJN3QaMihKnmGrh5orNLKf464dByAPfc/xB1eoxVe/ncSPlWBTWjJo4kT5u9v
         pwkUpdxKoX/Jo28DfSZI6ODkeGsmI52B4q3elZd209Gb5sc8if602LF/Prbt1D5/OpeG
         jOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        fh=6bBn5+fQPhaoLxNZR+AFrW8unFyzI5wUe8oaRoT0dd4=;
        b=f+COtDxz5em7cdW74O/JtIQGPWq7r3hHdV0F7JCrJOVmyyWPwIhCGRmCNarfPnGeYZ
         nIa2nw7WM73jKoylLKnqiRwyJtsQl1fJI8wuVNm7Yr8jhCiis7fOJayoWrqwsdmCESyv
         uP2Fr2uWUnnHpKgSRMbHBixdjXxD2RpWnKatuzZa8R6lBK+zOVM5ngTc838sbprSt232
         Iu9vUdfdN1qtYV23PsTp0vM+tE8RVrwWwtU1VmC+1M34doXiS7bHiw7KW0P9GRNTY4M1
         6MtvTX+5JumD/NPRxZKPaHyQcwKXUyHZJpGvXCMsXhnz712V4Ymw7gzgtz6lZr1GHnNX
         hkFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276185; x=1774880985; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=fPSECC+MV4ZKoyJykv07BqbhSXOnKhnm/Zkf7f/SIcbA5zI0Swk/fb9N6FMZsSkfjn
         B7dh5GLQILr3TCK7PwQKPaUt3sp3FkkcdgAyQTQJOdY5w4iY/UqYTa59HwFRJbNH8wYs
         uAOAgNW7CWRDcz9kg8GHjvQ/zPAKE5RibrwrikR673pYwn+wItf2YrQQ3451pBxdpTv+
         L2VAKuNuldIru/JHMHm4RBsw/0jVN7UnxSRMjldWFfrobKZXAI/63VOF2yrZmUBY0aXx
         DLsxVPlg8RysKQYMZvmRurhEsSHbKkpqtzDK7Vzu73d7D4ahgRUAabW4fhIQHhHXhLAe
         L4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276185; x=1774880985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=SjkEH+GjXIxZYArbSWcsiErhSNfzwZW+lXMq0AbbA1TwH9ZEONSDuBKWZ5RCcStfVd
         81utRuxMzzucMdBT0g2V8UTCtzDW4v3IRL6e0zSKi6LQ8haFTvE+fdLVk66dRnQI/YGp
         txlxcyfEsaspW1O2YHdnOpSJ32YpwZPnJsX/UIRXgfdDH2FyWNf0+LxkjP6k49O25Xnd
         rCyS3K0wCajGDPzxPFFEBKN6FOxWepVd2Gwxho3TPbaitjhnL0975t28g1CA3RaLevrM
         YkMzYFMSQ9y53o8W8+lTecHtg3IBchYpCQBq6lCYF8Vxr7aIgeGDWGMHpxlfEYAlAQzN
         hPhg==
X-Forwarded-Encrypted: i=1; AJvYcCUTfGvsKVGWfpAZDJZd8p89wPaK6MoC1LLJDFRS/Rhv9lCeF1VOeWxXgniSDvvM0H83VMCEh3G/8xzsyM3PCAiq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvg+MUy63O2Zm2PTelkI1RXp75MDozLl4prcofjFFUGG+XXYEy
	byMkUw262oazW5iTtAEiFdEP1bh/kOBvTQ/9UURRKCmMhSmbSbNBJi4u83j50FlXup7Ge7axh51
	urOa5plOmcmdMtvVWbPo6zhGfauJuLuMknSH0e+mmkw==
X-Gm-Gg: ATEYQzwf7tYhHgBh4mnO84kWpEZONx5EmBGnCeUtKW+t8hR7d5smff0aqi4RhUP5Agp
	kQL+qfGBRIqFLVqjumGYr6LykVrCuRUbiajDfxhZruukNOGLPg6MVhoMIiZOULwu2iH+LbJNUUF
	+qBnQQR0+YBTKD0mM7/sFf9OFMYmW7K90Lz/KGU1+9P9zG6JLVmxrQP2YQ+OPjvOLUUUNPH7egh
	wsyWb0TXM+2sIZfKsT+pInBtlUj0DA0FliuSA8lyps+uVfTZSUT/1Ah2H4wD9kIJWt8uleERHnW
	ypr0t103BwdHrzHA4zUkEDzMaHQP78aHmkLqEfYWbg==
X-Received: by 2002:a17:907:a18b:b0:b98:2b20:6680 with SMTP id
 a640c23a62f3a-b982ee95138mr577158566b.0.1774276185012; Mon, 23 Mar 2026
 07:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Mar 2026 08:29:33 -0600
X-Gm-Features: AQROBzDAtL1nQ4PFq47to0a6JE1kiVHOZBw70rBZKtJtzPk95r669W13VmBQzzg
Message-ID: <CANLsYkxVRDd941sVq9rdn_O0eDbDcVctPpKTACVi5vfYhzgYKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_072947_675006_EFC2C830 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, 17 Mar 2026 at 06:37, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
>

I'm good with that.

> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
>
> Changes in v3:
> - Subject fixes (Angelo)
> - Tags
> - Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com
>
> Changes in v2:
> - New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
> - Rebase, add acks.
> - Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com
>
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
>       media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
>
>  .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
>  drivers/remoteproc/mtk_scp.c                       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
>  drivers/rpmsg/qcom_smd.c                           | 10 +++++----
>  drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
>  drivers/soc/qcom/apr.c                             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h                 |  2 +-
>  include/linux/rpmsg.h                              | 17 +++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
>  include/linux/soc/qcom/apr.h                       |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
>  18 files changed, 65 insertions(+), 56 deletions(-)
> ---
> base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

