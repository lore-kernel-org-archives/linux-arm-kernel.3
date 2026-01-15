Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC7D44C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=; b=wyiy+WAZuL0cVNZVBvHlQS6pD5
	mOZ+d2NRm7XHP1qy+PliDL4a5sxxA4lYmpl0zfZtm3ICofo1gWdsWSODOg85BCSQ9bj1WkDcoYdVD
	2W0cw0SVXvgrZCsTqecEIAWzr5nM05SzihoLDG3YpZ9m1+4IITQXHL95nzbkD3PMMbtlSyffIHL0H
	/GOOFcONFIEc5dVjzVXsLn6hz2fOXt5RFt+SOKLsP0hgvygZLHLE/20jiWkwK3/TFDP/8OAj6IdGx
	+AMB8/ioWLKvjo1HjtE9MqaSBfPdx2MvQGmKYtPcR+DvVqLpCArh4RONVp+D2MD/SR/ZhDmE8Ihkm
	0vYtMr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ9A-0000000CgNO-3o6x;
	Thu, 15 Jan 2026 16:24:32 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQ98-0000000CgMK-15FE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 16:24:31 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38301bf7864so19993091fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768494268; x=1769099068; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=;
        b=FcCBqeabsyrDr7QQx9SRaI62TwFgj1yv3JvIc8xKw3cnyUfYpIfSyaYePGMINKUyrh
         31HcRmltKEog6MyUyx+JQm9gKENZI6YAIx5+7wgNBiyrNQL0pd3KtytQ1blnUmYXworR
         j/IJAjDEf5hK7lEnCCM5IBPIMHlawitQeGzRWDK9AiCQsyEKwjYrZMueM4OPcg9Ufrq/
         82ctX4+K4+mXd1JEaAsAaRf9O7ZT/sG/C4x1STDZJI3cxEexqcjHkwfM9EJ9UEYGeVSl
         6wBh3Tsg31DWl28iSuoRJnKmQs+Sw63Aul0MbwlQddRVgjbZBbs/t/onL+kjhrG2SdYo
         WSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494268; x=1769099068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcPjMQs8wlZ69D72bOHJHv8LmpfNACepVb1D7xG/5V4=;
        b=e/Af0LkK9ZqgOs2gskOLPxRLfpXHUh/jRexhAwioJLM+Ht3nzCR1PB/I6FXxvw67h3
         XeHLW+tRvd+jb4OiVpn5Jf9nWYwZbeiMu/LCkBiJ1v2NFM0/kQTE+8oG74wivBvSvEua
         WM/NU/O5gxeQWow43+G1E+OVOew3wwjhQ//jOWtpNRkKZO8r5OX8/UoJL8UaqK7hondp
         RlXB2HtXI+q9vns4csFpUUYT2ooxAEaUKQOB0IKKkpgnjKAIZqCVsG6dV8lS962VTZXA
         BQ9/KUR2pv9/JdQ4tNduJZOOINcXiUlWJMqdf/g+Mm2nGImg+AUOHY18U6J4+2oWHL0G
         +zxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbzW83ib/d/UBysfpj301tpH0+7gZvCZXzDGXrPJZXTK2aifAYH/QRFPkwPeB5ZvVp4AgC1Pgij8jeHb1Gt9TY@lists.infradead.org
X-Gm-Message-State: AOJu0YzHN96uTIMsk+n3w25SgKIhkCrhd1SqlYWNwb3dEzGF7zf7tic9
	Y9kWV/0/TqLcvzVysLGhJRca9T25Uh7JGhodPOifMdythQVu/9POIqzYMNkeOrlrrjiGKxvGhaR
	iMEZR5AvoeurJxsGaOpjf7Ff0Im0YZVCGh5+9h7F7uA==
X-Gm-Gg: AY/fxX45ZBM0+F6PorOmqEU9tDmNRQcrOfeboym/CIq9TOlhAgYxIUzL58Db/DI3qwZ
	eUyGd0MEYeJgTvsk7gByGoXC1t548cAeICaq9ZxMnrmkAGfQSWgx+LXTPuBjlGCtHMMVQQKMuAZ
	xSzIpymaHxHR4xb9Dc1FrR7fIE9+Jy/+Ct75aet3mxFvR90M/c44Thb5Lk/eqcxRWXIHA4V/pWT
	fYPjDv3v2Gr17aGTMi6l2sYksnosrHOMNsVqRJj+F+2MHjT/j+zzlCVyUw9FIjUa1HtXL99
X-Received: by 2002:a2e:3003:0:b0:383:543:66d with SMTP id 38308e7fff4ca-3836f09c3afmr8580341fa.16.1768494267944;
 Thu, 15 Jan 2026 08:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Jan 2026 17:23:51 +0100
X-Gm-Features: AZwV_Qgstc2v5holxo2-uqRefc6HR54B_5kwg-eT_5uV86kY4RNFn6HUBQ_JID8
Message-ID: <CAPDyKFohjOfdg1vz1o4FAhThm_1CTF46SgrWSJuJYt3mLLJwNA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix dtbs_check warnings for MediaTek MT7622 platform
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	matthias.bgg@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_082430_303051_5687F735 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, 13 Jan 2026 at 12:00, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series fixes various dtbs_check warnings happening on the MediaTek
> MT7622 Home Router platforms devicetrees.
>
> Depending on correctness, either the bindings or the devicetree was
> changed as a dtbs_check warning fix.
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
>   dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
>   pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy
>     driver
>   arm64: dts: mediatek: mt7622: Add missing clock to audio-controller
>   arm64: dts: mediatek: mt7622: Add missing power domain to afe
>
>  .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi               |  7 +++++--
>  drivers/pmdomain/mediatek/mtk-scpsys.c                 | 10 ++++++++++
>  include/dt-bindings/power/mt7622-power.h               |  1 +
>  4 files changed, 20 insertions(+), 8 deletions(-)
>
> --
> 2.52.0
>

Patch 2 and 3 applied for next, thanks!

Note, the DT patch (patch2) is also available at the immutable dt
branch, for soc maintainers to pull in.

Kind regards
Uffe

