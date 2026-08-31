Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D745BC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMmTrDcw7M/LAr4YU/0uekZXL2PNRhokJqa94waiuNQ=; b=S2ovhvxz+ubVw+Mdsjckyv/yA+
	tjYnAEmG9hZNTEs7zinlOwcEypxk5t98rk5otIQhGRv+5TZIEBCsseEwrSNOyZQLkPMZ3LM/A4Gax
	87mX3Vet9MoFKvZRoC3wv6xljtqbxJba/2WNIfsnOLRUF3OjvSGi58Y7DaxSDsxQJGsbT40Sbxesq
	8ZUccH4hFYFeGeVcA1UPYRmtx+qQ2XQoWBZ3cqpnR6l9LwlnbEht/owZpa6VAZ+d8j4M+Ct7oBAd+
	Jvc6T4hXka0tDD6/4g7r833ZAZEkknpuyy5/sIVAOoYJwHdQChPob5fnDqJcsEitdt/S+WJpk8B/X
	96BYiupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wFC-00000008haG-2HCL;
	Mon, 31 Aug 2026 07:15:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wFC-00000008ha4-0Zml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:15:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 842A741128;
	Mon, 31 Aug 2026 07:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF541F000E9;
	Mon, 31 Aug 2026 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788160549;
	bh=YMmTrDcw7M/LAr4YU/0uekZXL2PNRhokJqa94waiuNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jyBUr4Zx8s3NKnQn0Cjk6zRAD1ZU7m1utUzQOaIAJHfsByjmAvA9jIjupWYn5OwUc
	 rFiel7zS7wwdZ0lilc4uYI7tYROWwnIhKZk39hmaT+mWbx2hGXVgkuaFZvXwrdK5F6
	 OPTfCIUqsDWXEpqCORb/9guMHcj0vM1/tPMi+LF7cCaFxt1zUbX4+StXMe8DN59AXB
	 qvPBtSfaifj/g4kjC1PzmPU1y+IC8GUzlHajuhvCtRlkO4pZeyCTAaEX1MybM4KJUg
	 dM6RZw5rxnbPWT8s6fGwIVPJIjMh693njZFo7gXI1xJnQ5R/oiuGE1YfWdPVtY+oBa
	 IqDcUQx5LFx2Q==
Date: Mon, 31 Aug 2026 09:15:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Message-ID: <20260831-amiable-awesome-ibex-cc7e35@quoll>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
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

On Thu, Aug 27, 2026 at 11:21:03PM +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
> 
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
> 
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.

You need to slow down. v4, 15 patches, was posted on Aug 27th. This as
well.

Best regards,
Krzysztof


