Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8B6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxcB0sGt8wyNoYjx65VQrbq4foE3P9ODaktuxb4y4qM=; b=BtlrCg6+qBSb8q/RXj6EtUPxCQ
	GKax+aon+sBShE2VOmWPPLkn8jUEMOlwqfsy69Rc+vnbNN1/iaRoF+l3onxUwvbrAqztM0G1Ox8qt
	wWKCWZT504RBHH65L/sEkvew/ndR4RaWknvVcSAQ4J0fSs0h1HRIbceugSaWHtmzBloxTWTnD8VVy
	WApT5DHN5A16a3uwYCdM1qaBG/R04u3uY1PETU8wuJdgLnrgagp7PUuShmdgui7hfseo9X62aXipB
	nPVwcq1Q8Wv8Zsie45AGQJtLhuA+Exr40hK7vlbky9/MBLrtWNYDDvzBEiUt5S5WRyGn8N/5VKVW1
	cGVCZ/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjA-00000004TjC-0qeK;
	Tue, 01 Jul 2025 08:52:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWHi-00000004PJp-1ynE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3571B44D31;
	Tue,  1 Jul 2025 08:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A01C4CEEB;
	Tue,  1 Jul 2025 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358250;
	bh=R2mIkacQGW2O2sU10/Kr7qil4EtR9Jqg+Wkl3QVALp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtwZOxjLbIKJVbGF5ex09ZhO8xeq+x1L/RpREDlu6zXAh4ZwfBKTwdkIzMgbW8Vry
	 FPeuit6qCx+iMWnzoHTmrFoWA7H9pI1QGGmL1N25gtdAXBFcYXz8SRvg9bhf4y47Nv
	 2mW6IF4eGEmfn7vgHLkal4YEEWwHSNJWM+pu7HaibXl5GqzfeoBopBw7SxoBGFLbYt
	 aqkfBKlTvhOFIH9MFj08OfQYaViDkx6oYa/O2nrj0AjeLspscEOrje0Njb4lPgKt46
	 +MWEDQEqhupgdvKj00CsBPqGZaWHRVHuYA/69m4ZRC6zwgl/ZHqJnznR1/77gNApHb
	 ishLTHoy+nwoQ==
Date: Tue, 1 Jul 2025 10:24:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anusha Rao <quic_anusha@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, 
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com
Subject: Re: [PATCH v2 8/8] arm64: defconfig: Build NSS clock controller
 driver for IPQ5424
Message-ID: <20250701-divergent-cream-okapi-83181d@krzk-bin>
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-8-8d392f65102a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-8-8d392f65102a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_012410_530143_2D47FB90 
X-CRM114-Status: GOOD (  11.43  )
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

On Fri, Jun 27, 2025 at 08:09:24PM +0800, Luo Jie wrote:
> NSS clock controller is needed for supplying clocks and resets to the
> networking blocks for the Ethernet functions on the IPQ5424 platforms.
> 
> All boards based on the IPQ5424 SoC will require this driver to be enabled.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


