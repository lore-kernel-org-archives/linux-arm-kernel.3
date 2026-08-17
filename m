Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF81AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Fd7pzNoHyUBnTjJJpnWRPeGYZJV4vIlYLFWplUVzYY=; b=gXjzP8S25bN376kXpK7iB0uaAR
	FDadUVyAu7j1SrKSNxlpYIwgv3ISWgJpTgDdWkr6IpNcsSapDVYWKbXi3sNIHJ0yn12hakIKzZgvg
	L76Ck/NhyUJMiaiUhfDSCOkRoaNFxupRXxsQKx4/KHlEnDn93j8MeQ/gKv2bb/x2vWBnlnPD7A3M9
	GRiU4XveqKFtygSuT1xDMlmu3w6EAgCkUA2gScst3i7xU/C5k+xPfYaVMBZozptx95LKdfNiyABgW
	4xxC4DfelGJSwUKpabq/g2kdvUR/iSEVfN90HDIBX25i/3Xbo98Q4JWKxG8hVT80SPf2jHwVaykAT
	gt9OrIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvroC-00000005Yen-1nSd;
	Mon, 17 Aug 2026 07:31:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvro7-00000005YdU-2pma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B5964056E;
	Mon, 17 Aug 2026 07:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62E11F000E9;
	Mon, 17 Aug 2026 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951855;
	bh=+Fd7pzNoHyUBnTjJJpnWRPeGYZJV4vIlYLFWplUVzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dXsYiIHpunmj7OQ6/Efrvkr4t8pr7EibUF2BO9xuUthST1xV8rGn3eEZGIVWONquD
	 u4LKNQI+cRdbwZ8dYZA0i1SH56FNvgMvrUHnBgwLMM+ntgEEVb6sUHYoCttdQN0w8I
	 U2flXA7Hvzrsb4IwUBdz5RS2sa9tYKSW/f2c2SIvnycq8NJTYY6W6h9TyF33c+2qSh
	 Qbt3HW/6MZWvIwCdiVul2yiaUrgoUwBWOXaIBLg1DtA/U1hVPsPEcGm0xeogI6uEiE
	 Um5x5p0/DV9qFbsvo6QTCB1pr3HigufgLu5CHVAH2HJ766L/OQLPTZjBgPZThNonjF
	 Zevt9Y83nwAwQ==
Date: Mon, 17 Aug 2026 09:30:42 +0200
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
Subject: Re: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Message-ID: <20260817-speedy-nimble-heron-a4aeeb@quoll>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
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

On Fri, Aug 14, 2026 at 01:01:41PM +0530, Hardeep Sharma wrote:
> Document the Global Clock Controller (GCC) binding and associated
> clock/reset IDs for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

I do not see how you addressed my comments. I should not be needing to
verify if each one is implemented and then say again the same.

Best regards,
Krzysztof


