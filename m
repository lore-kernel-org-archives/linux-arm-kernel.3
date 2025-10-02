Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7334ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFoQJIbA05RYX3/QPLjDtH5b1xEhU4k2bh49prUsDCE=; b=l1sb6lIUXl+srsSPO7teval5Nm
	z/TTWfPIK5spJlma1YlALL7tOpu7DuAaLuDN0p9spUImajJqe2veTJKI1Rf6pV/tROU41IWkq/zRc
	bInke2t1n2cjmCNoj8n88ll2pc1LpAqYGEatXvqRiJfifNXt7kcTJ7WwoodFva1idXEPgWDpLHvN5
	RxvUu66rf0CyPyTGh1a11eYQIxOZMs49SAgSmxlp/2VbMLt/hbtlLdIJnRHtK4ZLoZDLz1NnR8ile
	W5hPqnN7nHK3sTs6jjND2Whoyzi4VT86MfGoFsXQC4HGdCeiTuXnPQMdYHjXqxcqYWFNleJs1Emis
	457VprTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47wy-00000009Oie-3kNI;
	Thu, 02 Oct 2025 01:17:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47wy-00000009OiP-0tny
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 01:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7782363D1B;
	Thu,  2 Oct 2025 01:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9326C4CEF1;
	Thu,  2 Oct 2025 01:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367859;
	bh=bqYRt5rCkxHQimYlJJh1kdOrE6Xw7RcJ54X+qmXzIxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peaJHVZG4GrFd29dDXIyJzGX58yR1Gqb9/p1wNcxArhxo+ggnT/Wdzai5cn0qBHia
	 UpXlb4dX5OnyK54x8/QHRbESVonDF72uY/DySMvZJpt5u2eL7DzK1zR0kEeZUlsP5r
	 1eKM+FfZ9IYAud9nkGmTpaliwnERwLFvQWgfn1otrUlAT2WRXcoYAd1S/FIJ5TPcdQ
	 +4xEsLIRca9wKX7UIMsGxiG6I/6jCEmEimTksjrfxECSJIwcsYeu6JySuvHjwhEOHT
	 0ZT0xyXrqrowUZB4GF/UTMDIfbopYuEXnS0bq+x28gxzFqdKOtZdmpP313LXbm1SRX
	 LCUYWgaZZY6jQ==
Date: Wed, 1 Oct 2025 20:17:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, quic_pavir@quicinc.com,
	netdev@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Anusha Rao <quic_anusha@quicinc.com>, quic_linchen@quicinc.com,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	Devi Priya <quic_devipriy@quicinc.com>, quic_kkumarcs@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v6 05/10] dt-bindings: clock: gcc-ipq5424: Add definition
 for GPLL0_OUT_AUX
Message-ID: <175936785706.2833327.15374958134771066830.robh@kernel.org>
References: <20250925-qcom_ipq5424_nsscc-v6-0-7fad69b14358@quicinc.com>
 <20250925-qcom_ipq5424_nsscc-v6-5-7fad69b14358@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-qcom_ipq5424_nsscc-v6-5-7fad69b14358@quicinc.com>
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


On Thu, 25 Sep 2025 22:05:39 +0800, Luo Jie wrote:
> The GCC clock GPLL0_OUT_AUX is one of source clocks for IPQ5424 NSS clock
> controller.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  include/dt-bindings/clock/qcom,ipq5424-gcc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


