Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005EAE9904F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJaAhb/tRYmxEwODOUpVowErScJNMh49e8IIQqJgPQQ=; b=Ih2BxlpsOZ5KMlIgUeVvTVIKiD
	+F7Oyx83NnWQx6a72lb3Y2CaMLvBxXMOEDHfMEG/2KV0mxG+6x/CXvKP05UdqPrPuoktkSxJRzl2h
	mGQuJS/piObWuJaLyBM5moxskDxGcjJjFUnsXnPtMZYqhtWdOI0cqR17yIaPHpforHfR0taD1fRZn
	60DiKdkQXAnKi7YOTtQrIiPux3ORw6WvghkAtQ1I+FeecQ0ADvxN0AM/yyJpzJKX0fWgpcRhC3eF7
	SaKR4BezIatmbOFywSkDobH28ZFPmYr0hkSEu4bgmM5uKfCIURrKL3GhOpatnhTfIOVZyxF6jMBoF
	MVqkFUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Xu-0000000Bmz7-3lDJ;
	Fri, 10 Apr 2026 07:44:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Xp-0000000BmyE-40sW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D265340825;
	Fri, 10 Apr 2026 07:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB7FC19421;
	Fri, 10 Apr 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775807088;
	bh=JsZglFfqp60/OymRyVjYka9YiyjQ22XOenDQYcWCKIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WuhGltJPPqIHbF4Qlipkz2YJ6f43KKOCc+Q0lxqz5otlnGKb1EpmmWsUYUQByS0o6
	 REMrCi++66bRLgcaBgggl2ldR9nKnfsQrzkqqT6qj+1UOrt55OvGNx+1gq5tnhXRBV
	 mDQp7Q9xxpx39MXGnbeLXM+aJRsAAEut8QPLPc1ayyB9imbfuwZCArmKp0aUW2v3ya
	 iNVTzdpr/jhElhSaWJya23KXX/r5DokpCKhmufjY9Q1stfrg1kxOR4RqZFkIqgDOBB
	 z/RKYCklU9GX6Ap8aJ/Iz88Rq+mkx++ZhetWI8WJUk50wm4u3MiFtM11IWv+UViUN6
	 lSdIpIsctQdVg==
Date: Fri, 10 Apr 2026 09:44:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Message-ID: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_004450_019233_01567B23 
X-CRM114-Status: UNSURE (   9.94  )
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

On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Note that this patch and drivers parches were likely not tested.

Please mark patches you wish others to test as RFT.

Best regards,
Krzysztof


