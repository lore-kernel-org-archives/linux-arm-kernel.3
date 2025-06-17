Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20006C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coH03vPFT2rsdcf33PRUsXpuL1g7ZkrTHF5F6QDpPTw=; b=g3037BBL2oLag7ZFKz1xiaQeGf
	GI7JN8295EFPkw9/G8DcbK3PMMI3r/U6rK1/lI1QkQ4DSuQzgCmdUJfAwjgoasBYVzgPhbnQ4pAmi
	tSH4HPp51csJDdgiJrCTC6a6GTN/0TE2RslGovkdDv7c2rJAXSI0F2ebqaY9+zpvK7EU+hLlOBBVW
	r0fDuAA/FaVUhJrpn6rWIDOaqRk6fw1KEY1EaiZYQRDCm1Om+ww3ZWcaBHfCXNpBjyyM/gzZzKhyA
	fT+jCaok81usMX3IeeChZMg9OH0+vPeRRLp3tPGMKVo7BLYmtdockALOgn9K7rS9qmMjDY5y/K5I7
	OY/xU8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTtx-00000006yEF-0Q8y;
	Tue, 17 Jun 2025 10:50:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTg5-00000006wQT-1MxQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 10:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=coH03vPFT2rsdcf33PRUsXpuL1g7ZkrTHF5F6QDpPTw=; b=j6UCKw5+yqg03P3VhjtZ9xHG8P
	e4cSe5GL2d0JRvRqNrvswgi6bodPQzOEVUO5+zrI4dSd94fYfRq81jJ68n3ymYKF3kgnqk1w7PlQD
	2rs0P1TaU43pNhvwf8LQj0XqJwyn/ztplssurZC7V2hUpBegF42QbnoqQ4qKCFRDc8vBV5jpcsLKm
	fYB9/KUDmQJpBm1HuRUzFUIWtp1HTUjk6gitVpAulJxDtYup8LIzJTEbrlS/wy1njjaew/4jiN6sq
	Pj03UWhF7nhi3p0cn7WieeXViPmoo4yWwK3V+nl+/JQqU9jQcTOADPV3/FKrc6GyLg8jeH2AB7Rkt
	svxY6k8w==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTfv-0000000H0cK-2kRJ;
	Tue, 17 Jun 2025 10:36:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 02E7A30BDAD; Tue, 17 Jun 2025 12:36:19 +0200 (CEST)
Date: Tue, 17 Jun 2025 12:36:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Koichi Okuno <fj2767dz@fujitsu.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <20250617103618.GT1613376@noisy.programming.kicks-ass.net>
References: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
 <20250617102819.3685543-3-fj2767dz@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617102819.3685543-3-fj2767dz@fujitsu.com>
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

On Tue, Jun 17, 2025 at 07:27:50PM +0900, Koichi Okuno wrote:
> +	pcipmu->pmu = (struct pmu) {
> +		.parent		= dev,
> +		.task_ctx_nr	= perf_invalid_context,
> +
> +		.pmu_enable	= fujitsu_pci__pmu_enable,
> +		.pmu_disable	= fujitsu_pci__pmu_disable,
> +		.event_init	= fujitsu_pci__event_init,
> +		.add		= fujitsu_pci__event_add,
> +		.del		= fujitsu_pci__event_del,
> +		.start		= fujitsu_pci__event_start,
> +		.stop		= fujitsu_pci__event_stop,
> +		.read		= fujitsu_pci__event_read,
> +
> +		.attr_groups	= fujitsu_pci_pmu_attr_grps,
> +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,

Should these drivers not also have PERF_PMU_CAP_NO_INTERRUPT ? Per them
being uncore they cannot generate samples.

> +	};



