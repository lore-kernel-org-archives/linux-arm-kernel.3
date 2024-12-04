Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0822AE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 03:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W79gz64iQOZF0nMd4+tHBSGT9hPxWtbh0O3jv9/66Kk=; b=bK5g8MSQwE+ayPIwrqzaHbI45U
	xTMS1SweAReDDRYUtLWey+16hmFsPzBVW6nmk4AcB/7ujqOLsKxDSMqSl7jhCD7VGCmBiu6qJwGXw
	YXK84Js/Y+Yej1xSr9p9F2lLdx4OQR/FuiqvtC3l2GsBclK78aQ1QDXnr71XIjfEyDQURAu0OxkjT
	/GvkAEYwYUcYK1RqCSx9KEGbCy38NAY7YGqkPIeiZ0CWzYvTtqpDs9rFRnm/bSDTas5dkoZ73hTSb
	xtgeAigyzL9VF3ZImDjoP0MwhSv7DpUfvY8o8sD8XmABraZ0UvW5i3Q8omf9pM8vlSpAWhspTJCb5
	fbPN3hYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIg5X-0000000BO3g-1BWT;
	Wed, 04 Dec 2024 03:30:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIg4W-0000000BNyc-3wYo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 03:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F31755C55A8;
	Wed,  4 Dec 2024 03:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B781C4CEDC;
	Wed,  4 Dec 2024 03:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733282943;
	bh=5Rjgp/VIG+mrvRzrXwsjZlf0OGDLrjFESpHXXJ3leeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o981C59WlKvB86a3QmUaV+F6LosyfaWniMHxVOqBbkpV5UiCXw0eHOgC+ugp6dlzw
	 GQ38vn71Ea4Dp0FjhnWnRUL1PEX3tOzpssvahevxwS1M0iyLDEXGw/Hq+cK8olFgUB
	 YIKx4+oM2FoSWMOAIXmLOkifbw5wD+6mzcp9YoXj9PgckwYp6RKbQXv2ZoXfrRthHe
	 /KeNnP5bT0ezhVh1+U/pycJYAppzzvLtS+s2gW5M1pSUPO9JIxnyoTTQmo9rRrH8Yj
	 SJJmjcizGKXLyKPAcDY8FRUM2ITOEKSeLhs/dLj86fWq1KoWiC2xkmrHz5Di3CaqTS
	 6PwHrKmsNwGPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/4] Add initial support for QCS8300 SoC and QCS8300 RIDE board
Date: Tue,  3 Dec 2024 21:29:00 -0600
Message-ID: <173328293797.350699.5295104276161877235.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
References: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_192905_019204_3CBC5490 
X-CRM114-Status: GOOD (  10.13  )
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


On Tue, 03 Dec 2024 17:27:11 +0800, Jingyi Wang wrote:
> Introduce the Device Tree for the QCS8300 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      commit: d511280ce9cc5920442e78a589946f63c247dd3b
[3/4] arm64: dts: qcom: add QCS8300 platform
      commit: 7be190e4bdd2bd1aca84afef06bb755c06a85473
[4/4] arm64: dts: qcom: add base QCS8300 RIDE board
      commit: 45d55e2da9bd10d24c4730b452b11a76dc3960b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

