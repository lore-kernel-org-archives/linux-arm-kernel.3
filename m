Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCA5CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfQFJEJ+w1g7xKma/fMjUoqeslFwGZujvMBK23yADlg=; b=ffMWBqkVE9hvkm+tRQDMrY7Xbm
	PxCqu+vO+9XFs1h3vdURDp6k4YC/xel01hg/GcfPj4rJd16Z49+MBxxT3hlqHyTTIJjccF9CkPmDJ
	eGRgRnERQeteqpk8gBw6DEDApH6vD0w6ARpj0fm9XX8RNu/VXQ0JSeB7aERSxKoyXr5vpqgh921uz
	Yv7TJ8/Y7hHrc8ct1cBExYMHoooxtfZ3df4HoQlZmVE7JhWxx3As9yI3qtWoGPrKBYS+55L04bC1A
	00VTwuX9Fg7qwPehTy7XZLJ0Ce8+X1Is7mE7YG3YYW1BVsXbMqnjDN3BHLUjpJ3aRwY9/QrdxqDQV
	WfkkRyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmgr-0000000GwaR-2niU;
	Mon, 05 Oct 2026 17:41:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmgp-0000000GwaC-3x9p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:41:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B05FD43416;
	Mon,  5 Oct 2026 17:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661851F000FF;
	Mon,  5 Oct 2026 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791222087;
	bh=TfQFJEJ+w1g7xKma/fMjUoqeslFwGZujvMBK23yADlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kbu43U6KALvdki19VBECdVrFjdx2vCfWAUlM5ZiG6sdWY+l+sRNVInM90HdfWmQhk
	 qrdnFtGIeEIYut4cBOTEZCmMI60UvgtDYRNmJnL2mVsFff8nrql+eZevCS8e5fZzPo
	 GTNZRfK+mS8fc3BgDA2fDeJ+WgnxzRDIbLEb2RfgQhj5Djv1Ruwu+Te3aWVL49xJlm
	 P+YpnNOnFxtoUyed8o+fMnr/oZP183GwI5Ostz7BJdQa8QNWhin1b9CliMm7zTGFC8
	 PKoo4Te9jzuNsw5WQRKUaRElHTgHoSAFqSX+sOxn1JqabRf+Rc6sNgpaqpa5ikn5jE
	 zuNdoz/cGo2Bg==
Date: Mon, 5 Oct 2026 12:41:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	Mike Leach <mike.leach@arm.com>, Wei Xu <xuwei5@hisilicon.com>,
	James Clark <james.clark@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: arm: coresight: Allow atclk for static
 funnel
Message-ID: <179122208597.1280954.9033989224338091582.robh@kernel.org>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-2-c3edca1c480b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-2-c3edca1c480b@arm.com>
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


On Fri, 02 Oct 2026 16:07:21 +0100, Leo Yan wrote:
> Static funnels have no programmable registers and need no APB
> programming clock. They can still require a trace clock for the ATB
> datapath.
> 
> Document an optional atclk input. The CoreSight funnel driver already
> enables it when present.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


