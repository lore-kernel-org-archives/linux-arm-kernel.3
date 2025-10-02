Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6922CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pf+kveWR00rzUi5FUKg4gVFt8MJdiZiN5sFnI2t6uCM=; b=Kaz4RoP5gSKrNcEBh42Wxqj74N
	tKGKnK/lGtdXM1R5oX8bFKHEJz4sbwnJvmESsnncB5SA8vYRI3La7R+oYEOq0KGHF4lmksYWOsQeM
	z14WY+p6meEWUq6CQokE0Amj1aIef2xEw4EZ0Y6I5Vqjo2/0/+GMJfqS4efAQE2BQM/Fjro9apMev
	m8w4wMxl253FouLU9YfBv434ApxGfKvU5dQygL+pPXa2CkJyOekeKf0yMHSg5tKciK7bvGSIEoqor
	LYmvLTsW17UbFAMa6LwWFrEq05VFfcuV28rmoTvwow77/Ai93ZX0sYPtpIVzkVVNguz3N9mVp1dHL
	K99HYzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47wV-00000009OZm-0NNu;
	Thu, 02 Oct 2025 01:17:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47wS-00000009OZK-3FnL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 01:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DC88441EC;
	Thu,  2 Oct 2025 01:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6EBC4CEF1;
	Thu,  2 Oct 2025 01:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367828;
	bh=gLZ0UVkrnFaQO1QfoYUGLipP+gZyboeSBBk2VODCAP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DseHaLYH2yUpGOrx81GhPcx0UAZnaLZmx4VuQe2mu2jOT3iTKKkQy8puQ37eWnoi5
	 /uW2mqqqdZy7bzJf5f/WKb11BpQtboA7RyFytgh4rHYi/9/NUXyM6YbN+8mv5Nwyc4
	 ga9bhjsLT9eYYQbms4xbran4+MiKEx6Zcr7nw5RFNQVT78zXIm9gAGkQ/t1UKdgHie
	 OBrqNbUPFeVICGKa8obkGsJlPoqwK3G9CryXT8LCxCsDrgTWQyyx93mnKQXsE3cDr2
	 OGwtzExjmMFtmSBEtXqKhcbbhNK9ezP7xFdUynjppFqM/jjcBvY5x0tVSkxAvNoOAW
	 H2MLy4zXh2kZA==
Date: Wed, 1 Oct 2025 20:17:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: linux-pm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Devi Priya <quic_devipriy@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	quic_kkumarcs@quicinc.com, quic_leiwei@quicinc.com,
	Conor Dooley <conor+dt@kernel.org>, quic_suruchia@quicinc.com,
	quic_linchen@quicinc.com, Anusha Rao <quic_anusha@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, quic_pavir@quicinc.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 03/10] dt-bindings: interconnect: Add Qualcomm IPQ5424
 NSSNOC IDs
Message-ID: <175936782597.2832511.10991854182415010050.robh@kernel.org>
References: <20250925-qcom_ipq5424_nsscc-v6-0-7fad69b14358@quicinc.com>
 <20250925-qcom_ipq5424_nsscc-v6-3-7fad69b14358@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-qcom_ipq5424_nsscc-v6-3-7fad69b14358@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_181708_832305_F1781C7F 
X-CRM114-Status: UNSURE (   9.55  )
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


On Thu, 25 Sep 2025 22:05:37 +0800, Luo Jie wrote:
> Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network subsystem
> (NSS) hardware blocks. These will be used by the gcc-ipq5424 driver
> that provides the interconnect services by using the icc-clk framework.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  include/dt-bindings/interconnect/qcom,ipq5424.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


