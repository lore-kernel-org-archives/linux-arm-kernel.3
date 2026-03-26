Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390ED10A62CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vL9P/jR/0HIsuH+Bu1d67p3utwY7viGhc92J5P9lo50=; b=GVz7o+oGplq0LgVatxROUWCAMI
	3BTAT5pmwMidQ0hCFp6BUfTCcti5xvGQ27LSX2Auf/Q3howYwmA0fIRIyHgLiput6q7498O5GBnFI
	5fZqaCaK2ztPvhNrnSre30Ux12tqY/1N8K/n5qCIhkkyHgzH8vK7/uLuzrYe6Obm8y2cC4VTmHXw8
	mlbhV6LU4B3pwVs+9dgBxmDG8qZro3c7O6AbKOUBCB8dJsomtl2NtGQQsNOocGeFlp1DjmRsUkywN
	HOe+XKR7J/gHU9rAwEAldPqwEbhUKy/FuELSxJAOx9JTQPqXigzZpA326Uxae0Bk0ASehFOlTPK/W
	QQeW107w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kRX-00000005W2J-0n84;
	Thu, 26 Mar 2026 13:08:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kRS-00000005W1H-3A3A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:08:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486b9675d36so9044565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774530485; x=1775135285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL9P/jR/0HIsuH+Bu1d67p3utwY7viGhc92J5P9lo50=;
        b=hFFq7r+hDcok5Ju/FvsPtHWu4eJ0gVaR/qZgHGJW3VWmlyON9T+ghMCmRbG1cy4y5e
         X2pv1tQlphN8Ug/m+DUYgx9O9n4+77k6j7jFR4b8p3vWlcUckiLD0giPMfJakcxL6juP
         Uih3J7JV3fyWL/sMk9AdOqgn/czopc/vD5i/Ijd58M3JkMBNRISzTImaojFB6pMdFcWF
         /dPzERrKiKeLRs3z31YPvE9CgA0yIT62LXmTg4/Bw9WHxD2ZpmkT5kret4g6jWjqcAY5
         jjYLYIdLbY/ls5xOm7kyvCM9wvyrX40qVq42lPrlxABlvkYQwJ0fYdFFvhx0iAXvrRfU
         o+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774530485; x=1775135285;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vL9P/jR/0HIsuH+Bu1d67p3utwY7viGhc92J5P9lo50=;
        b=MJ7HLLBQh3TFQCYLq6AbPLncjF9rJQsKeZgJq63NK4lrxJ4Xu7ZgL8mgp2YNsgEslO
         ffPSz+XrRfSWM20q0QeKxa34CXR39Kez0Edr/TRaJ9w5PwHLMlJkb+R++UVFG4i47Nzy
         5oNlufqFalgXC5Maj0WFmwcp+rQv4CWi/ci2GmN9kPtPYjts4NEPO1GKHrE6WDn7eJQc
         B/T9HRGCUTkFg5bnjDhsimDtEuTmAQvBmMsi4mCChPj0f0M8mqiM9AVOmd9gEKRhzAiQ
         4OSLE/WKEtBaVYgy0KcR9CRZUOsrQnRk+Xu+onFcqw4Ud/qTcwF7Nm0eF441w/NlPiSf
         Euyg==
X-Gm-Message-State: AOJu0YxEQYEYhZQGM7oBc4uHRUf4XuFFNoPTZFeoqR9vV24Vc5oymZ3w
	drQZUG0KIUGQ5WAPFJ80jqM76s9fGrFBlZQUPcWZxuMtDmSeuqC+GEDTf+ed17pyUQE=
X-Gm-Gg: ATEYQzwfEhROq4tj/PCMMyb1QZEXn8HN2+dze3TqEolfZUBId0EPwfsrlUZkS9W+iQe
	dlc6w7gM6rPgQjMTG/Zfz2dc8JT2L8e5T9c2uC4pujOw5nt+fsEn5UXttGSprYVOEvjtwilwo1O
	c2sxD2lcmWeVioCDB9tE5sWd2kBxpx66JfmB3MVwH4b3XPEvMucXMdvX619ae/FBalW6zdJy/B2
	YcKhmd3KbDOq1nIhnmYZA4jjMHlABQJ2OXezLgG6ujIns9BNhsYJ9Gulk+nLwibRwwBA9ZaByth
	GaQyUTPSGZOJi2dG3fffqhmyc/do1uMe9zMAqgbQbVsNkeNsoiyr5L80BV0vr20xwz+A7gpZmQt
	8wS9n1scG0FYnBbCuEm/3nlCpsBp6Z7NqlwLBthRjb8W3T3nrOicNbeurJlzK8y3QFW86AHBVdY
	nrZgfqLqO3VwLcGwRa8hGlFXACL/c8wRLFlqIYsSlyXp/u
X-Received: by 2002:a05:600c:4b89:b0:487:219e:42d with SMTP id 5b1f17b1804b1-487219e05a4mr17195675e9.11.1774530484483;
        Thu, 26 Mar 2026 06:08:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2c8sm7580472f8f.20.2026.03.26.06.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:08:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
Subject: Re: (subset) [PATCH v5 0/9] arm64: dts: amlogic: Add MMC/SD/SDIO
 support for Khadas VIM4 (Amlogic T7)
Message-Id: <177453048347.439230.1647215482099213609.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 14:08:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_060806_817372_43B07C34 
X-CRM114-Status: GOOD (  16.98  )
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

On Thu, 26 Mar 2026 10:59:11 +0100, Ronald Claveau wrote:
> This patch series depends on Jian's SCMI clock patches yet to merge
> https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/
> 
> This series adds device tree support for the MMC, SD card and SDIO
> interfaces on the Amlogic T7 SoC and the Khadas VIM4 board.
> 
> The first patches add the necessary building blocks in the T7 SoC
> DTSI: pinctrl nodes for pin muxing, PWM controller nodes, and MMC
> controller nodes. The amlogic,t7-mmc and amlogic,t7-pwm compatible
> strings are introduced with fallbacks to existing drivers, avoiding
> the need for new driver code.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/9] arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
      https://git.kernel.org/amlogic/c/fb69fa2cabc68da247bcc0bc99a14dc857b16842
[4/9] arm64: dts: amlogic: t7: Add PWM pinctrl nodes
      https://git.kernel.org/amlogic/c/b1e49f6c1ac15b2c947bdb1d22a82b823de22d27
[6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
      https://git.kernel.org/amlogic/c/60eff75ac67bbf5445bdbd2842b0109ac591441c

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


