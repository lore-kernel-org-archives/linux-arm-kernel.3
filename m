Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A5D232FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWjlmGbzykt5CozJ2o7J4PqCSsCyLWMk3+zvWanrfws=; b=yfXlAtfBM/U2hEglkThxCN+KDC
	7kvE6BulW+Yeuq0BlOM4P7dqTHKnXrL+M9XEspq0ULH/hjEoy3TvzYGd7xVItqGb3REMqlliFqgYY
	w2nLajFbu9mtPrpiHgfRGW+Aq+3UKvcnt6Bze6zRbF6s45RyQjCKWj0B0pptg8Av0OTYWz81TlDPB
	J2EvPWns8nO1F/GmVQVB3iayrNPJ7JDQ5CjML59Gv6RnJh7iNj4JIK+NWm6Vdx7tgqil2OGBcV+V+
	zB2he7w2oePj5cpO6saTmPDdU5vGUUlgth3w1uRjl07rbJ0qbt96DNY9dH+clltFwAe7tR3/PIAFt
	y66ni1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veeN9-00000003cNC-26v9;
	Sat, 10 Jan 2026 19:11:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veeN6-00000003cM2-1lzx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 19:11:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8E5960179;
	Sat, 10 Jan 2026 19:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E56C116D0;
	Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072295;
	bh=dUU57ymxvufvDgmbt5zDhcUmxnru5mFqX0o/mD8AXM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxbLz8p+Ze0TB7+oai204mntkTVnaWATnJYva9qi+qwOLdALqoFrYKRCPUA2FIrQ+
	 F72btm4wo4SQo6DmmuLQ/dqZCCoLX/WjaKuatOyeXKbqwDiC6kzbPa+q6HsGaI2SZZ
	 8II48JPsW9H1hzOGbPE4de7MolqAu9owD/NqnLhnwwt1Qc9KotSGNUcCDOQ62UCYug
	 DcLqAfwgJiHiIfoMjcD9zGs7nYQZOuKiGfjdA/CAPQDyHVfvXjoPddTxBk4Ayl9+ND
	 LU/o5LvCcq/TVl3Bm9nI+LEmtTuAzwcyB7KXEVCvdS6Ud/g3ER+DCm3arjyFlEwFkZ
	 DFHkYdxXIqQkg==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/2] Enable CTCU device for QCS8300
Date: Sat, 10 Jan 2026 13:11:18 -0600
Message-ID: <176807228444.3708332.17299201888079444801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
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


On Mon, 03 Nov 2025 15:06:20 +0800, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.
> 
> Changes in V4:
> 1. dtsi file has been renamed from qcs8300.dtsi -> monaco.dtsi
> Link to V3 - https://lore.kernel.org/all/20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
      commit: 4f791e008807a1e7743cf6048822bab259b2ad0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

