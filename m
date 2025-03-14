Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3820C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27COgGu5PBodqBumQyTkUt8aOA21pd+Sx4lJoxIXQjw=; b=xRjCvfoPTj590eNgPRPOVMA7d0
	s6rE5WLA9ghGbcf0dVI/FEYwU4HD/nLXqeDF/PGNlhHyJR7CZLtOBUQlaIA5SOwKIM//4jcVU+Skd
	6mp+sOVPyiXDoHsnQPo38x5rcP1ZGqy5Wn/BGlYVim/rgfkaA+OTrBwh6etRbGugd5qSr48DqMnX4
	Tn67qDKkBIctyDPRDymfhVJPE7UHMgjRjsrZioIDc7PjUTLA4fCSHRyzTY+zqyj0/IT3lRd3XeBoM
	n9hHAKdwXEBj2cefFVC8VfrJ1Lb9e4uVCY8w3M2HV9R+BG9VhHzFCZxI28jUmZBqXt9T4U2WjAxDZ
	w97+XwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBFo-0000000FAwh-0byc;
	Fri, 14 Mar 2025 20:03:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBE6-0000000FAcC-3qT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 20:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D7AB5C55F4;
	Fri, 14 Mar 2025 19:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5386C4CEE3;
	Fri, 14 Mar 2025 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982510;
	bh=I2/xCpzzeaxrkmm7yQ3y21IF5fQqrnzVJEYGyz3cje8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYRyztuPRhxcAKA69kTgFlLLOKjWM9BARguq+/o6PX8iovbyQUKPzKeTbWJTQJxAs
	 GadHX53ZubESMMnb7s+6MmPFMKnsU+xpf1EIS0GDHbiKi1qZhavsWNG/jsli0wWvGP
	 jTcfJgmE/whopTSI09a1X/MUutMDBVnR1438EOYPxFOlvMKVFDeEw3/yWbLe8crwkS
	 P03s8MbroD/Aqmo2cMPUbwt/Jy1TyTWYZNToGjhSQXBj2eqh/vtYoxvwXihDR10Uet
	 jNA8eZfodKwEzcTdlGGwbUCQ6xDLbKyEBT6MGRWtNVlo2Rwu5OuwFI8BL/C6VVbdGP
	 CdjCrP9+6gOfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH v15 00/10] Coresight: Add Coresight TMC Control Unit driver
Date: Fri, 14 Mar 2025 15:01:03 -0500
Message-ID: <174198247887.1604753.1605423266163412383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_130150_993454_D0003D7A 
X-CRM114-Status: UNSURE (   8.31  )
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


On Mon, 03 Mar 2025 11:29:21 +0800, Jie Gan wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>              |ETR0|             |ETR1|
>               . \                 / .
>               .  \               /  .
>               .   \             /   .
>               .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> [...]

Applied, thanks!

[10/10] arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes
        commit: 05ed68070d7a061f62f502d07f883c05dc666990

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

