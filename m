Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E57DD4115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJqo6LxSFvjymO08OBbA4HDFLrBYb+JurpJL/gCPr80=; b=MpclQ87tx6Wtq/rLP5ob8XoM8e
	j0ZI/iyt8GxeKZ10EYdq8PbMPdZVcgg3qydso7IQUf4Kj832UgG66HYJhgal4+oXgpyZ5BO4NXSe3
	EQkuTTKzHIo3vvF0vtZaNEDv0r5M2NQMexaS01rADPlzM0Apzj+ZcOtXLx0oEsCgEgC0tyK7GfIyg
	VQa3yr/44TtL5sTmKeIMfHmoAtZsHrpjyqRKCWZjFmLJZZwquFP77LZblCC/i70TxOf38dE1vRPTM
	VbDWFFzzoAl/GMo3OmbPe39pV92Fzz+Q84vLkT8K9cTar70RAZB3ox9Y4djix47OwWslKNz4WCVkA
	bTioCy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKiu-0000000CAEi-17Kg;
	Thu, 15 Jan 2026 10:37:04 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKir-0000000CADx-1tR1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:37:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so7514845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768473419; x=1769078219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJqo6LxSFvjymO08OBbA4HDFLrBYb+JurpJL/gCPr80=;
        b=LaVcw42IK81JNjnxhnuyx0cEVB3rR/hbFS9h++NaLHWpt+GPrJ3Z/jfwho4r/swHur
         iClkfVVvclper2YiPuoLYDh56VzC0RYcAgPjtc4zS/HKRI8ELKChsjrTQZbq2Vy55UPL
         I44C6tXuqGf+takcNDgMMn/Yb+P3xlYq0O5oLTnTSBHkv/VsHUQQPBl83QNEqHZXBNmJ
         D00+gw1iYtHihtgMyO5U9Qqb80zS34RVdl+E0PaLCD5Bnj5mSLuALz89Nw56ClneOief
         gGbPxKS0TkJIop9jVFpXh+FdHRGRzFTo0UYFXigYY5n44OorMkts6/PDtcSSCDTVQgNC
         J+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473419; x=1769078219;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJqo6LxSFvjymO08OBbA4HDFLrBYb+JurpJL/gCPr80=;
        b=UQBhyDeRnEXL3EabvYrIsz2PkP67GoVeNHqh6wtlq+QmeCQq3AiEpXykAp5e+qP8gk
         +63FiJ1RSJ7L1dV+YqA66DpsHIHnFIwOxX7XFNlFGaLFUXjua3F7IfdBN00Ll56ZyQoI
         YtBFDXIglvyjRRvzBNGdnxa/HDHMgpQf/m4k2KtOoeqHo4NduRe9gVeLFk0X5HB4tGCD
         VO7vr0/h/VLra4NmAP4QTJcqIUDHiQt1kWM1G0ho5UnkRzKnJaDbzstbUXHFwQFzKJXS
         Uc1d3VHEEnhsmr5aBTdN9tJYbJW6sayIvoO3fKIPem3O3UrvwIfWYQHZDQ7C2MVPsjSb
         KxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKtBNFQx33nd00oglQ1kCBTqBxKsIpIsdNm9rW9j6MOHxLasx2AjVrUH/J2VocHvrwAS+k3VaexALly/zt0Mxu@lists.infradead.org
X-Gm-Message-State: AOJu0YxGCglj0SrWhE3bnDdOkXxTwOzvV1voT4w5VvPUfmrkqjheUROV
	B0e0RIWZAv+1r6WYhoxcTKoZV5SgelrAH9A29wklKZhNPGM8adqWdOk/Uv7QmPwwWhc=
X-Gm-Gg: AY/fxX57C1efx2dBvHdEZWYb1fuYxNhlcdzE2TJJu123TKw9x+Z6JJEDD8XEgOrYCzY
	7udyD7tb4RlRrtH3q7RBvyQ8MR7elzjhRUC678SGmWtxF2sHfgqQbvh3cA+3pmhaSDy+yBzmBq+
	tRny4sd/vu7ZMrCFamRwes4dSnBfKAyTKTFLeGnLokz9D/9togpxvsOnbAceM6Ts0LSHXc4zKmU
	FUglLISAnXE/hbaAlJVuYuJEzJ4Rsrjim/eUtjVuOi3lxqsJ1GYloEhlscEkwfIyqqyGB194nzC
	CJtR14KPK4bLX+1kefuN+VROngj5VM9fjxQf31cHfqbkAn5wtNIFm2v8cymamAXwpK4FpWk/cQk
	guwc6eJqm615otplWs3OLZnxZ7DDXutM2u8coMoOUUY1SJhVxyJNHShuekBI7v3ynkE8LKcyIbb
	ZkrsXNZBtBwTjHvYQyAAeKH7iGLtszHZw=
X-Received: by 2002:a05:6000:4027:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-434d75b7003mr2802540f8f.25.1768473419171;
        Thu, 15 Jan 2026 02:36:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a65bsm5120132f8f.7.2026.01.15.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:36:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Nick Xie <nick@khadas.com>
Cc: xianwei.zhao@amlogic.com, christianshewitt@gmail.com, 
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 nick@xieqinick.com
In-Reply-To: <20260115030015.1334517-1-nick@khadas.com>
References: <20260115030015.1334517-1-nick@khadas.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: meson-s4: add support for Khadas
 VIM1S
Message-Id: <176847341849.1377446.5257760418462522600.b4-ty@linaro.org>
Date: Thu, 15 Jan 2026 11:36:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_023701_518372_C020AC23 
X-CRM114-Status: GOOD (  13.47  )
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

Hi,

On Thu, 15 Jan 2026 11:00:12 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM1S single board computer.
> 
> The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
> It features:
>  - 2GB LPDDR4 RAM
>  - 16GB eMMC 5.1 storage
>  - 32MB SPI flash
>  - 100M Ethernet
>  - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
>  - HDMI 2.1 video
>  - 2x USB 2.0 ports
>  - 1x USB-C (power) with USB 2.0 OTG
>  - 2x LED's (1x red, 1x white)
>  - 3x buttons (power, function, reset)
>  - IR receiver
>  - 40pin GPIO Header
>  - 1x micro SD card slot
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/3] dt-bindings: arm: amlogic: introduce specific compatibles for S4 family
      https://git.kernel.org/amlogic/c/fee65328ab35d5491ac5c9c697c52da3fd068268
[2/3] arm64: dts: meson-s4-aq222: update compatible string with s805x2
      https://git.kernel.org/amlogic/c/9ba73c18b14ac297b9fae92b684ca4dafa5e0361
[3/3] arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
      https://git.kernel.org/amlogic/c/6186af6bd9b1e778e295a176c9281dba970da7eb

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


