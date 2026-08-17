Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMO8LuIV0y8D12iyq/Re/0Tt4oXaHh33q/C/GgUGEnw=; b=Pz/5G4WT4YcK6oD76rTzaEwU8O
	eqFFiD7NQrU2Zc4v2QW0jJAjRbrNoqTKudcOdSF0HxB/ojtp1M+kY1CLvL+VTx2hfAllUfq5G1rnG
	UXDLY43HhAnYFW9JxRvVlXPdTO6ChmA+Kuc4QShREMKt5XJpbc1BkCeWoekJkDD1mrxDwLjSzzIRt
	eGsyDarsOSwzxdcT6ftbVaDRzMOeYg0Wx+OIVtfNzYeL4UQL5R8/LEFO9lqVa616VYuh3JOtEI0HK
	8NbaQSROLlPbzbQ0TXwnl6+REFsZB/oBPBgnDO5NDVUzk44y6TNmPIvDHDRvbvcLmm9Fi1Ao7ABaQ
	2eWe1iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvri6-00000005XUR-2KRU;
	Mon, 17 Aug 2026 07:24:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvri5-00000005XUL-1RF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:24:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3551423E3;
	Mon, 17 Aug 2026 07:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAA01F000E9;
	Mon, 17 Aug 2026 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951480;
	bh=rMO8LuIV0y8D12iyq/Re/0Tt4oXaHh33q/C/GgUGEnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6sOaw1aEDhQLzZOeimZ9ipiOQtdtT1SgXSTlohZzB+vXYYz0r6UxcX+3sJaMu2Pc
	 9rGz6n4ICR21RHHnjAssMLIDZ9AQy+ZnAJbZE5A7W30wt/dJNtnIKa2PyaoRhwuRjD
	 6QK+CxW4eDKadydfM+XL6TcUL+lXJO95PpSX243TYo2trYQhkHBU9RlV4wYbaRTWDE
	 hJW8GX+jwa8EY6S2yc1X6VC2HmLfa/YZvZdS3RYY16WA0iADzoR4b56m7DJQ9dyw4q
	 ZVAVp0jgREus2O18S8/K+wb8I/WpeYxtf+KaB7z++ZKFsmeQW/DImheJWuza6NlGa1
	 do5D+o1x0YXbA==
Date: Mon, 17 Aug 2026 09:24:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
Message-ID: <20260817-dashing-capybara-of-warranty-ddd469@quoll>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-2-3079794f0f73@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-kuno-soc-support-v2-2-3079794f0f73@oss.qualcomm.com>
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

On Fri, Aug 14, 2026 at 01:01:33PM +0530, Hardeep Sharma wrote:
> Document the RPMh power domains for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


