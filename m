Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37368CF6497
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkqaKHKvjWpeQ8D4fmkNv2eo4/4sK4YbRn9WjXlECuE=; b=Y8GmmUnv6f3eCB2qYt+HnchsgR
	Y1+7MNhGzBdXgOqEYPQgPVEAyeSirnJMGOt/Ap0CsV+ElOUsjGQqPRdSy32rygb+lrSLkUVWginri
	YAxlRedSbagem93VbSVHqq5AAOW/VKXBZSGuDdKQQDAP0HQCXOy4Rgl0CaiuSD00xjyJzTijRj2nF
	2dkj0+usKhXgAXslI7CZOtilvGXY/aUUwcdsYUEu6oPYBTo2xupUG0tP49BBKneYNNOHJ6NSEvw5C
	j1AKo13HyjENgZbOUH4CxNiEZSZuvehOEFN98aobXwjXQdlgjx+Kgy23VhXHpPOGfSWU6NxV3bc6S
	nFnNycdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsFg-00000005rlQ-0KnC;
	Thu, 20 Nov 2025 00:10:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsFc-00000005rks-3AwM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 00:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51DAC41A91;
	Thu, 20 Nov 2025 00:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12B7C4CEF5;
	Thu, 20 Nov 2025 00:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597416;
	bh=ea5U/JJufh5pYNga2ZzeflJrlaYuHhKo5b+7WwgCRf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiZU5FlvGhByHmnQ2qXdxblVfg4iblqeL0BCCeWosof+z30V8kacoOcobZ722KyC5
	 kkJ5dYhBO96hdyYeG/zuT4izsyzFiA21hIwV1E33n4hLQlcLJGWQ/wWrvvA9Jzk5dX
	 zv2BGtnNKlUMaSVyOgbM4heQD3oGPMEQY1Pac6mJYBjlg+itLiMmJJxwvZeI920TWW
	 UG67mS9CDdV5UkEu1oCJaoycfUouWocn7lEYWHsT+b4QcjFDRuAwfRM749k+v9ibA4
	 FcAl6+ML8krCT7ORBKK6Kg8Y9dJNhX0lcOkFgzT/6RcwME43ooa3I5QIMaBPCla1mE
	 JH22UPQhGpH6A==
Date: Wed, 19 Nov 2025 18:10:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com,
	Sam Protsenko <semen.protsenko@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Message-ID: <176359741364.3604013.10884169748220916434.robh@kernel.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
 <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_161017_310075_AD77E03B 
X-CRM114-Status: GOOD (  17.68  )
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


On Fri, 14 Nov 2025 14:16:48 +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components and MEMCLK gates the sram clock.
> 
> Now the clock driver supports automatic clock mode, to fully enable dynamic
> root clock gating it is required to configure these registers. Update the
> bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
> 
> Note this is NOT an ABI break, as if the property isn't specified the
> clock driver will fallback to the current behaviour of not initializing
> the registers. The system still boots, but bus components won't benefit
> from dynamic root clock gating and dynamic power will be higher (which has
> been the case until now anyway).
> 
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for automatic clock mode.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5:
> - Invert the test for google,gs101-cmu-top (Andre)
> 
> Changes in v4
> - Update commit description with additional requested details (Krzysztof)
> 
> Changes in v3:
> - Update commit description as to why the sysreg is required (Krzysztof)
> 
> Changes in v2:
> - Update commit description regarding updated example (Andre)
> ---
>  .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


