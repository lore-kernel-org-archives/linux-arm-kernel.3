Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCD4CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 21:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkkC1Vko+WvOxUwHMvXg7IztDR/h0HWvV2LknFPdch4=; b=VG5e3lG+gl1C5bh4uN+mC42dFE
	MS/m0JUHySNmtQZ1F8//BBry633x/fFvwiMJgBad9R7hDcNFf1b5SsCCQtV0dI5vP9BBbIhaHNIvV
	NMRcVjt7UnIfZrl2Y3FXJrj975FBWhsfIZPmdOai5nJGOsEv8pDvECvOKeTMLDi/K/lCQ9HJZKyPU
	rbHuq1DUlmGMSfYNQUIYkVEV4BL+Ql+m4WlOuxrARDKCfC7ftKFbzHAyBKnD8J+xGlqFI7Gq4/pyA
	ZaWCscuOaW8RLrJf/bWwYLGMOOZBSylu6UE/qB203g+tYbaPT5Vxoyr6GWy0mwFw1t75N00LTI5iH
	9+hbxtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvgp-00000007msw-1KKy;
	Tue, 11 Nov 2025 21:14:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvgn-00000007msQ-0pr2;
	Tue, 11 Nov 2025 21:14:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762895643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkkC1Vko+WvOxUwHMvXg7IztDR/h0HWvV2LknFPdch4=;
	b=QCMQr7hPcgn6dCNJX98bU9IBPqeWfG3Ql1Mu6n4Y9LoOsmj13Etz6iojOHwYcweudjPD6n
	SK/kCBfBz6KHrLyBW4voUWmuCls3bRLR2gEq423UrMYkvZdtVNxv7SvFOCAP3KCL+ZhPSo
	Dh/VMTFWyHwCEmcQ3Z8Du+I1btcxjEpqUhRVsa7eN99ptH/HLbsRNisS0yihVrXlq0rGP8
	hRsZYRDGXfgiJHTuKco1FN4OkNy+IONOBB7xByVDeUTKgENRw/W1pfx/4LJrIVjnP3S1Qz
	mO56wI/bcpbDvixGbOZtVIv1bUZhfKw7uJGMp7CkplGZ5sr9XomnpaqRXhYcJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762895643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkkC1Vko+WvOxUwHMvXg7IztDR/h0HWvV2LknFPdch4=;
	b=NWBf5/sdMIqLgR3LBr+nNke9DKJfpj5OuIHKoW7Yv0z8dk6zF4g7KO2sAVROMns0UW7FTe
	1xvl6jVq0thmABAw==
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, Hans
 de Goede <hansg@kernel.org>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 08/13] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-8-d780ea1780c2@linaro.org>
Date: Tue, 11 Nov 2025 22:14:02 +0100
Message-ID: <87cy5oxof9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_131409_380889_9F5E5520 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
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

On Thu, Nov 06 2025 at 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

