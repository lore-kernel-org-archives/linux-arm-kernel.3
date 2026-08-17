Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFA9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ez1L8EuXpvjZrmwXpLrYB3re7fNuMma9R9rfZ9jgWlo=; b=jn0sFCS0M2JNGu+VDZ5oHi9KIv
	t5i0QfWXUhN/r1Oc0JX9SkMoSSuS6Pt1FxutaOYYnd1MZ9V1dWgM9g1wFwIq/TgGeCplUMetHum5D
	ate25JxD3d22PTXErYXg8hZAOeYDLjTj5hEtmBgAicT4LhBVqk4OntnoI2n3g6maiDXCgmO/EcTo3
	24RksP4FiVRq6a3E2/mk2UNdBz/PPm5rBXohckqAPsiloiIdl9T4YUg/Bpci86hlpiq9tZmNhXsZ6
	HNmFXSJ1fkdppOPK+9gaHoeSRCL444yfXJ86ueauT7bLIjHI7dHp1d89pLO3PoVnvky/OJulLujfw
	Dtw8peHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrld-00000005YGe-3nN3;
	Mon, 17 Aug 2026 07:28:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrlc-00000005YGW-2yCc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:28:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 754DF40657;
	Mon, 17 Aug 2026 07:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A2C1F000E9;
	Mon, 17 Aug 2026 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951700;
	bh=ez1L8EuXpvjZrmwXpLrYB3re7fNuMma9R9rfZ9jgWlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzX5FRes2wCPZfU8yoZCaoqTsuVGUZMSbHaWHEu2Cx/1f585h3wW5INeLRVBn80rR
	 M6zjHt1vbhCO/RUcvS/jbBB9EGRqFd6Tup8fh1pOKWE55PifqdihTFWpsCspuK7coh
	 y7uNjoDOy9yz4WWszehblkf9eP7n6g9khQw1Qd41KzRuUoufF0pfE5YwLlMXjEEH3v
	 uv+yeyOn3wu1c5t2tgCgGO/4wx9j6Vv3FVv4bCVJebY7oVsLaFI9pcTX8UX47Iig9p
	 BNxAMQiWhzOK/FCURtKMmNog0CugIWO2Pe0Dc0oBpDXa9h9zJR9Q17QZy0jmSMczsy
	 X5NomQnYBoosA==
Date: Mon, 17 Aug 2026 09:28:08 +0200
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
Subject: Re: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Message-ID: <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
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

On Fri, Aug 14, 2026 at 01:01:37PM +0530, Hardeep Sharma wrote:
> Document the RPMh-based Network-on-Chip interconnect providers and
> associated node-ID definitions for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
> new file mode 100644
> index 000000000000..ffbf14356f12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
> +
> +maintainers:
> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> +
> +description: |
> +  RPMh interconnect providers support system bandwidth requirements through
> +  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
> +  able to communicate with the BCM through the Resource State Coordinator (RSC)
> +  associated with each execution environment. Provider nodes must point to at
> +  least one RPMh device child node pertaining to their RSC and each provider
> +  can map to multiple RPMh resources.
> +
> +  See also: include/dt-bindings/interconnect/qcom,kuno.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kuno-aggre-noc
> +      - qcom,kuno-clk-virt
> +      - qcom,kuno-cnoc-main
> +      - qcom,kuno-dc-noc
> +      - qcom,kuno-mc-virt
> +      - qcom,kuno-mem-noc
> +      - qcom,kuno-pcie-anoc
> +      - qcom,kuno-system-noc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4

Why are these flexible?

Look at other bindings how this is done.

Best regards,
Krzysztof


