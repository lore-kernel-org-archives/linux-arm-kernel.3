Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA7C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rtrLO/1PH95pqvYUDVl2cmKigfKTrSXpbP1302lgzI=; b=KaXM3QYQHfBTLLBmQ8WXxX9MC4
	AdFCu3YPwmuXwF2ftO6IhuujG0IF1TzyK1wtIdaJzBbMTausYuLSzLjyCL+lvXVHMXuQTzpLeRmVr
	cnarbwegyYskAFfnbfj/NGkdrDA4WtougVOeXeHJBdGNBlOMQjJUkqJxPM6q80dls9mM7edzOwYhu
	ZBf82xzio+GeX2BlXhyi1HNhT9bCMTsNloIjtJHpPsb6d7kGm1Ho9zorUl71SPuPyH39TyzEReQyK
	PnQ2iRmi1SgRBfWsWwbmeZT4qzBe7u7UtdqCtTsVXV5yy33NodYUnVT2CF1iZJXYprx2VAIMCE18L
	dBFFUdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDTe-0000000G1nP-2nPY;
	Thu, 05 Jun 2025 16:30:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDRS-0000000G1Wl-3woQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 16:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75E0F5C015F;
	Thu,  5 Jun 2025 16:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886C7C4CEFF;
	Thu,  5 Jun 2025 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749140865;
	bh=kYLvhfDO84c4DA9StBqV8ZGHqoWAR6ExdP7P4Gbcg9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIrq+RRC3lJ8JM9hZevCtF5Fia5h+GyYKAOlBq4VxLEWhleE56O+H+2p7Wh2Nx9Yv
	 4Hk7jZDEOymv+owP4rU0eZKJd3xa0aAExqpUy1tfNUUomODwAjRsIFKUioTI/n9lPV
	 NFSI0UzpCknBHf17V162zGLYLpO3h1dCundj5pPPZf/Sd8qK8vMBsKj61fGI4TliJ/
	 BQy3Ig3t60rnQKvE6G+Dkehx0/SnYoCTrer8jycOMDLlbdSMjimkZQvWUz5/iVcmAw
	 +9fvwHfUsMVBa+1XJ87dCk9nfwANPBXAk/6ZGxb4SYQUf5OJ6+SLCnCBDikQfkUV6D
	 TYpZq/JUNpk4A==
Date: Thu, 5 Jun 2025 11:27:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, James Clark <james.clark@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	coresight@lists.linaro.org, Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <174914086148.2803656.8177326064551626527.robh@kernel.org>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
 <20250529081949.26493-2-quic_songchai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529081949.26493-2-quic_songchai@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_092747_067059_669A1A11 
X-CRM114-Status: GOOD (  15.04  )
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


On Thu, 29 May 2025 16:19:42 +0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>    TGU configuration space
>         offset table
>  x-------------------------x
>  |                         |
>  |                         |
>  |                         |                           Step configuration
>  |                         |                             space layout
>  |   coresight management  |                           x-------------x
>  |        registers        |                     |---> |             |
>  |                         |                     |     |  reserve    |
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | priority[3] |
>  |         step[7]         |<--                  |     |-------------|
>  |-------------------------|   |                 |     | priority[2] |
>  |                         |   |                 |     |-------------|
>  |           ...           |   |Steps region     |     | priority[1] |
>  |                         |   |                 |     |-------------|
>  |-------------------------|   |                 |     | priority[0] |
>  |                         |<--                  |     |-------------|
>  |         step[0]         |-------------------->      |             |
>  |-------------------------|                           |  condition  |
>  |                         |                           |             |
>  |     control and status  |                           x-------------x
>  |           space         |                           |             |
>  x-------------------------x                           |Timer/Counter|
>                                                        |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new coresight-tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tgu.yaml      | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


