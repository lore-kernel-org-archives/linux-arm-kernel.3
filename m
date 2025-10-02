Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72E4CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7slv+1VBSZSo0bcokCKmeKNBlPS+ju7yCz6L+T/Hx4=; b=icOFEuC7VsiqrxFu3WNR2GOlIx
	t/hWt7lZkcRnReZUw0RB7/zYwlWKCZ6VM2P2qGu0OYE0/V5WiB0pYGCg9DkfPA8Awb6uL0GDgNOi5
	d30BLrsBMu3fwRpanbwyw93RcN0/TBiqlVuFYM6N29RURQosPqri4tuwOpXLDmm4exGRg8Rrh/qhy
	lqLFHXG7SI2D6lLs04n6n9KdYXYdevOD7XlkpBQF5ZQfavjix55QigHQ58sOZxKWu8WCD4urK8vqZ
	OWKfCnlqKQUVgIMd239nZFTP4wuBajDmkuQR+wWrrdSAcPZ0/MJxR33Tx4Lr9Hce51PWkWskgrQPD
	WMKnww8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47v2-00000009OIe-1olV;
	Thu, 02 Oct 2025 01:15:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47v1-00000009OIY-23Ky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 01:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8483261360;
	Thu,  2 Oct 2025 01:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B43C4CEF1;
	Thu,  2 Oct 2025 01:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367738;
	bh=ybWFhd4Bl669wN6zdk9DEt87ykdf3WJUYTYkdhjzDkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojSiId7BoaS8UNz6oiQJrQVUImuzaY/mzCOniA7rvODFJU4GAwUFv3dAgCJ9KmWI9
	 1rb7vwOLVXCWEKDPZVA/QFcQ8hNXvZwihE9EUDqzN0i0LGKz3mZuFkIl+BeojgiBCU
	 6foF4q0z6vt1vPHkePosD2qlYpq2eRtrg4Yc8uAvb+RdqD/+Kaq6mAQj3hAwsvJkjt
	 3azSV6vbvVsz+lvu0jLtVusygK4HGehccP5CclvEsKavXAfPgmSPpGgH6h/OOEfeBH
	 Uz3jG6rmCjTj3suHzJb09+WYEWjJH3rEfjUL2aKnnt+rELnYhKCKu0hL7aghTc4jW8
	 qhgxpAinpzLCQ==
Date: Wed, 1 Oct 2025 20:15:36 -0500
From: Rob Herring <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Georgi Djakov <djakov@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anusha Rao <quic_anusha@quicinc.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
	quic_suruchia@quicinc.com
Subject: Re: [PATCH v6 02/10] dt-bindings: clock: Add "interconnect-cells"
 property in IPQ9574 example
Message-ID: <20251002011536.GA2828951-robh@kernel.org>
References: <20250925-qcom_ipq5424_nsscc-v6-0-7fad69b14358@quicinc.com>
 <20250925-qcom_ipq5424_nsscc-v6-2-7fad69b14358@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-qcom_ipq5424_nsscc-v6-2-7fad69b14358@quicinc.com>
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

On Thu, Sep 25, 2025 at 10:05:36PM +0800, Luo Jie wrote:
> The Networking Subsystem (NSS) clock controller acts as both a clock
> provider and an interconnect provider. The #interconnect-cells property
> is needed in the Device Tree Source (DTS) to ensure that client drivers
> such as the PPE driver can correctly acquire ICC clocks from the NSS ICC
> provider.
> 
> Add the #interconnect-cells property to the IPQ9574 Device Tree binding
> example to complete it.

The subject is wrong as it #interconnect-cells, not interconnect-cells.

> 
> Fixes: 28300ecedce4 ("dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions")
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

