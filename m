Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37161C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p96fgqRAxyLtnD2Wkwo5sRb26fDuAJmmu7Z2bDJ02Ao=; b=ST8WH6P0hdt6lFnPNKRmsfRMkW
	8qc/pPSK8tvPCwJDZhrifS+THhbSop7coXifoSEE6Y01195jZV64KMUumDYotEAnTZilB1yybAB45
	oA/+RXVMNsjuSSXCXxSfg2J8JtIYJu7i1uG+YXlSW4haVk+aKGzpuwduuH2kFEstT0oMcnoYaVpsB
	6TByccLsefMtvF7k9GibzAPztWAH2v9JVvbFyulfDA6Z1seBx1uu89hekMQC0NFT2VioBjfXy1fyO
	2mvHdtTvDvAlEE8/GpJsH3PL6rA2ch8dM17TOSb0w3xeWK/Ycq2LrTbvkdy52IckZRk3Bw+5K04oR
	stvyu9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weou5-00000000qOc-14hY;
	Wed, 01 Jul 2026 06:58:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weou4-00000000qOD-2lP8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:58:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23D174003B;
	Wed,  1 Jul 2026 06:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087A51F000E9;
	Wed,  1 Jul 2026 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889116;
	bh=p96fgqRAxyLtnD2Wkwo5sRb26fDuAJmmu7Z2bDJ02Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AE55aGPF7Lc8LHUeDYaoFlOLYtJQaCReY63VcdLuGdeUwzZZ7LfBABDb0WsQglAGN
	 wo2cK5eCAR1OhocVNbQEMOdE1MCCR1MA17rWpNLS1fs9OgzIpFD2TLpQiXf48W3LrT
	 jN5HDxGbH5AYwrIFGvqFRwPmP8C6KgZVSjrnzeru1Fj+64HfC5hcYm80eb/Uyu6pP1
	 7dUxAk+ThGQoU3jZlcfLQ7bs9ab7mOSytgsG7BBmFNYAUYRnSxIS2ka+drJO6lz19O
	 VPUiCfAl2U8DLo8YHCXw4DDPEkLVvgio+aQb4lkAZkyVihlxc9Ie55r1giiLW/pmsk
	 4+T1kk1Kb2Reg==
Date: Wed, 1 Jul 2026 08:58:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] coresight: tnoc: add AG tnoc standalone
 compatible to the platform driver
Message-ID: <20260701-divergent-noisy-hedgehog-af719a@quoll>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>
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

On Wed, Jul 01, 2026 at 09:53:42AM +0800, Jie Gan wrote:
> The Aggregator TNOC can be described either as an AMBA device using the
> "qcom,coresight-tnoc", "arm,primecell" compatible or as a standalone
> platform device using the new "qcom,coresight-agtnoc" compatible. The
> latter avoids the AMBA bus and the associated peripheral-ID probing.

So here it is: you added a fake hardware description so the driver can
avoid some action.

No, instead fix the drivers. Hardware did not change, thus you should
not change the bindings.

Best regards,
Krzysztof


