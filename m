Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B40EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 04:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIjtwJfkN7ZiZcHT4jzSh398jmINFhF08hB7N7xJt3E=; b=yoc+KLuACyR7vp9cl1WKG+cu0+
	qoi83MpeiZz6fnD/CXP3MYLSHz9MQkLPaNxpwN9BdQDgBvCSHFNmE3RxzG2FiouieA2pVPETLfr0u
	A3iCbSVFhm9kMCRl2JzFMdG+dj26aDK5thkDWl23whl9n6+QG7wRJ5YGxbCoM48jfmJsjzqN2MBKq
	MYu5uqeiOeVxo4YJD1sjvRyxYaFwfLlcCIwwrHXR/gIuX/30SMbWYJvp2CEBaPuUBT9YoGfQSBUtQ
	ct18VBonR4p0E1sLeI/Rw+mBrXuGBDvfJBecW5XqnaAalJU3WnL5akAnFwEnti6HF7tfbK9Uf6xkS
	/LyeywQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGJb-00000009B3l-0wtx;
	Thu, 17 Jul 2025 04:33:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGHA-00000009Aeg-12Oo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 04:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22EC3601D1;
	Thu, 17 Jul 2025 04:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FCDC4CEE3;
	Thu, 17 Jul 2025 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726678;
	bh=x3k38YgM7pT0R+UbD5jaz5YqCqk54/Ulve4u9NBd+Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=enOTDJXhI0p2+BgVz7sGN+ipLqHVKXox/clCzv3nCga8X79fuU0izlkdHUyFv//TT
	 P9jL1ijF6+nK7rQi7m2D50n/TiElRvLOPxnHgzGP01T5fuwo85ArM84kY7YFUf+Aen
	 intA4GMXLZI6gHL7FTFvvhh1VSiMf/7uaRAlW5mG2BsCVjOiOSq2fEiZuQyzBVVR5q
	 As2JItT2oR691EnIWGirRvhR1NXPFh0yWLX8PyTenrc4bE/oanX5HA1iD4DcG1RVqL
	 SShiBHPZCoFoawtvB9h70n2T8JMHHGFKLIX1328s1ks1Cb/Kz+P0WWQWTR4SUM4bnV
	 w+PfUP+4s9EgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Support for Adreno X1-45 GPU
Date: Wed, 16 Jul 2025 23:30:52 -0500
Message-ID: <175272667115.130869.4357209750133500599.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 23 Jun 2025 19:42:05 +0530, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
> 
> Tested Glmark & Vkmark on Debian Gnome desktop.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
      commit: 2c66665d8defe1c36bdd2848b245dc906d4f3ab4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

