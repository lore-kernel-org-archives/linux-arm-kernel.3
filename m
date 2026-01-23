Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E8D72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1NePwJCHgkmaOrOX/MEPkH/zPtNPeBUxGf5rTLnWwg=; b=EhnZ6EM1gAgFY4ks9CX1EMP50Q
	iyk9D6RnbrUkx1iFHSzfGrwsGUQsDR4lRj2b3Y3maqcHRkqq/W7yjDZ0A8VKqZ8rOf27WfhGffls2
	gg2SjAMzng0XijSSMhHOfayCcEDl4qZy9QTv5opAT4fuChT8QEDYui5fp2rNhuFRvztBhKKbA1VE4
	VesmEphvASGoJgBh2E9um9A8VNHnNGO0hBm3yzXbSriCqn+YeRIcHLb1ep+VFcmnFuRcvB6GlMzFx
	Q4OSKpFdwoQJBiDPcal9YZs6Vqfs/H8OHRnvTZvpN/OnV58UfmwNEHKEjxyPmUq7SdlPFRYwIGRyF
	amQAQDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjECD-00000008hPX-1Hdc;
	Fri, 23 Jan 2026 10:15:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEC7-00000008hMd-435q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:15:13 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59b710d46ceso1917699e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 02:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769163310; cv=none;
        d=google.com; s=arc-20240605;
        b=TMWdxde/Ome+4UYXxUgYdydhFbqHosrmziSOXEV2SYY+EZA9bFz6SnqoYnSfeL9xpF
         P4DTdDIGTAJGmtHICqPKU1WGqU3+qXuI28pHMiW17mnZphCAfhI/QScg/LpNBysCySa1
         jF25PQVyRS1HsORJq6eFG7gcMZzwagY6++goWWMooYFMYag93uW4pXi/pxeGy1dlq+oz
         TKtqM7RVTf3D4Mp31H38xb0NMpnRM67T1F/gyGkzF4ecWw1j9IL2vjCozM4Qc5mFanVj
         ylcEu3Pqd24rcH985cFCEeYKgS1jEgNDS31J6WPZt4QTHmUrXKCGgnRZ66/neC+Xr2rL
         7Z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f1NePwJCHgkmaOrOX/MEPkH/zPtNPeBUxGf5rTLnWwg=;
        fh=bHjHqmZd+G5iyr94UX/XM6o3RRnawxe9VH/eEb00z30=;
        b=cWed7FgV3+3p9GlwGiyocu3s5xmMXec50Orridl7Ex86Mmmsk9cvu6EVmgWX45icnk
         gQGUsXqvo/AyR7hHeql25J8xl8Pxi5gw513ibAA4Vv6+ymicXaxALSe2us6iPB2AV6e8
         VG5jLr0ka8XmcUd0r8eJUcD7u/SjXL0nlBEQKJSTgLw+Bfn4Y/WUwTRxoYtXenNIRx7r
         HLhuWWJA9rcJCCxNTcL2f/eA8RrGHgYpK6dCR2jShIY+6/3J1jo9qyBNcXtNWgefm/y3
         GWNXFCHSSxocdK+9sg78A6JXf6cTTMVtyDKlEelXp1LRC9LfO5O8WWGA5MfGdzsZVAWn
         L7DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769163310; x=1769768110; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1NePwJCHgkmaOrOX/MEPkH/zPtNPeBUxGf5rTLnWwg=;
        b=Jf2JeFl33/GLwhGJDGqtaZHZSzwl1Plq9TC/PCcPDhIwUxvFEUqRQzLI3wEDzf4BFt
         64fMQiKUAyO7cyLq8l61uaEAo9lNyxnBZqXFUgAis/4PZs7pWfXi5CstDjHcswQbsJMz
         yb+0BDQM8WUfh7SEu3JC2RwyGnW7TS7XphRIjsUAq5W7RSI3xewWL1c+psgyCAJuYaGJ
         dSkkFp9YlesT45H0RNMBrvLn8mGOhmtLvO21NPeplbJ1JQCM+407X3+sTYoIlIh9ECfc
         BzrSbL8F/ufM+qbgg2HVgk+fGesd1NNq9MHuGP7QTmD4HFyz3Y/UKH2BJBOrY+EAw4hY
         zkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769163310; x=1769768110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1NePwJCHgkmaOrOX/MEPkH/zPtNPeBUxGf5rTLnWwg=;
        b=p4SxtJrwFPqyBM+DfxVxNK31xK9rUiWnQClZvftyJnPSsfBunKGXj8NKPPHgnH2Qve
         bSIiLv/Wf/9iP72oI1M0mqwmkXp3+sLrmOSj53jDtV1FErV1hroCBKa7mhlv2oliCxY7
         6oNBoMkcpmhDpNMxrJ+qY5DThIwUSV+Md5RlL+BJUioj6+/qZtR3oJEkegsrMCmnsFuh
         5/Y1iyNDZQs/VKoCUvwixvzdykibTbr/33bREkrLMw22aEqWPdi4qnuQpw/NmcrRxOql
         wPo03r4DeiRNmxMdRCkgsRtDgJccjr0driAyp4whLcYSGZ2R5yYOFjYNxNclmrDunfgm
         Ro3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCzPsmbF3MrQMwIjDCaZD6vmFf4O4eSuXMe5cWKqlAw5Jflzl/8MP+Q6RFWFT14BpQptbpH/zmiDxbrpvQfLbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Yxc+gMLZ2XOXN+3hHJBf2vJfTu+X70+pp+P0EDysZqpDQnHp
	P6xAZ1DdDtaFCfhyFMFJSCVrgptCjFtWDJBflPGG5RgYHa3qdF/Bd6lIwnOKf0PFoDFDdyZhYKu
	SSVfTe4a9M5mSLYVVxFO0VUhhfHrLWAEbViupHbUEpQ==
X-Gm-Gg: AZuq6aLX889An5/0n50wJtiV+ov7BkPirDOic6htwNeu99XRa0J18qE+AF3axDWc7LO
	u9KpQ7AmRmKfWMpqfP8VRsR+0ruWfoqkinUlWfjzQWl+zS0dFj51bwnmHquEHsuvuCqcxx4o3kh
	mDC/0u+y4U7Ne929NedOQL1Gp6J3Muj+fxXEgr/HsytEMHDLHfQdpP7NPsipAKtfiU4lNmrUdtI
	FWPWhUvnw7KSZSVIt2635w5bgTveKAwSWU5nlpajjgrI6YIRBrD5SfllxZo2s5DniBfEI+G
X-Received: by 2002:a05:6512:10cb:b0:59d:ccb3:2f0d with SMTP id
 2adb3069b0e04-59de4922159mr793933e87.36.1769163309685; Fri, 23 Jan 2026
 02:15:09 -0800 (PST)
MIME-Version: 1.0
References: <1769132482-177365-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1769132482-177365-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 Jan 2026 11:14:33 +0100
X-Gm-Features: AZwV_QgGSg-BBq9S7_AV3LtbRn4AJfL-B908kIEEoaE0Y2St9LA5MAJw9GzsJKM
Message-ID: <CAPDyKFp_Hw68uf=Bw0ndc9EzDOTQpp-dLejuy71wrygRSyBV2Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Remove deprecated mshc alias support from dw_mmc
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Wei Xu <xuwei5@hisilicon.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Jaehoon Chung <jh80.chung@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021512_038545_66FA31B4 
X-CRM114-Status: GOOD (  16.74  )
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

On Fri, 23 Jan 2026 at 02:41, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
>
> The support for the mshc alias has long been deprecated[1], as the mmc core
> already provides standard alias support for obtaining the controller ID[2].
> With mshc aliases removed from the last Rk3036 plaform[3], the only remaining
> users are the HiSilicon hi3660-hikey960 and hi3670-hikey970 boards. This patch
> series removes support for mshc from the dwmmc driver and updates the DTS files
> for the hi3660-hikey960 and hi3670-hikey970 to use the standard mmc alias instead.
> Considering that the hikey960 and hikey970 are open development boards, users are
> expected to use newer kernels, and the need to adapt old DTBs to new kernels is
> relatively low. Therefore, backward compatibility of DTBs is likely not a major
> concern here.
>
> [1] https://lore.kernel.org/linux-rockchip/20211124184603.3897245-1-john@metanate.com/
> [2] Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> [3] https://lore.kernel.org/linux-rockchip/c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com/
>
>
>
> Shawn Lin (3):
>   mmc: dw_mmc-k3: Remove mshc alias support
>   mmc: dw_mmc: Remove mshc alias support
>   arm64: dts: hisilicon: hikey960/970: Convert to use standard mmc alias
>
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts |  4 ++--
>  drivers/mmc/host/dw_mmc-k3.c                      | 22 +++++++++-------------
>  drivers/mmc/host/dw_mmc.c                         |  9 +++------
>  4 files changed, 16 insertions(+), 23 deletions(-)
>
> --
> 2.7.4
>

In general I think this makes sense, but we need to make sure that
patch3 is merged before we drop the mshc alias support in the dw_mmc
driver, so please re-order the patches in the series to make this
clear.

If we agree that the $subjeect series makes sense, I could potentially
help by taking the DTS patch too via my mmc tree.

Kind regards
Uffe

