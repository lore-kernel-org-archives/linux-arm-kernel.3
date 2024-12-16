Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D682FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjMfXFGS6dA6V1YbOlWg23gRHlVpAZHSFDaIe93RbOs=; b=g1JW7X5LUDP1pMSBEkm8P1/73o
	Z4/xFGPX2+lgbm00IwG3j147noM+evLMyRAshUoEKiKtJPiCH/umrsREW3zeZO/aEER40wiwNC33y
	+meR8qArNs5XsvP3VogGblNhBIJgeRfsXxWCXRlHEyIcwLTh4/tgXbVTB+/1sEfguvOEh3jSPEnSH
	CZoFaxoVj6fvC+d5LIblU0rpwKtiI5AmwhRjVS+4k3NOX8WJJq9UszkpPgFtgy2uO/NV3BTJcpuEz
	lvhADTyVUpkiuHq7R/Sj7m7DCh9Fd8stv4nBm6STioT4CFHDH8pd3N2PGQBLw7Of782ApdsOJAFfN
	yeSJlFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDCM-0000000AR0L-3rKp;
	Mon, 16 Dec 2024 15:39:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBvt-0000000ADij-2qst
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:18:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00DE2A411AA;
	Mon, 16 Dec 2024 14:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5631CC4CED7;
	Mon, 16 Dec 2024 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734358728;
	bh=r6E23SJ4NnZ0p4J6lfmWJy3886HYCKhaM5ebito097Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTFUOHlWU9dh0laVfqTmC8ijE2UkEjvZVlVxgqpslvt8Zz3fLqFDZ2K0t2mYgylcH
	 chBzA4IVhAjg1gnwmv2Wz036/a5CtySTl2dqMFYk4gldmv3D2UmzI8z67o8H0z+CNB
	 xALkysus5ZvsIi1IkM2Dx40oyYI2X4j5wEcCBZYjV0jhlgiXeif+TfrrQ/ivSgSLmY
	 zN9KaAZz+6VNQ7r1z+XSU1pfd0Y8O+DEPNo2XdxA1d6Sm5791Azc5GEM2T7MxemRmW
	 fbEjXc17ZFqF+r2mcFv30/jdJi+cfqCjPQQ9iEd0k64aGsrQnDZLgOuCZPh85JoQQP
	 Hc8XOm6nl4Sfg==
Date: Mon, 16 Dec 2024 08:18:46 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for
 gs101-pmu
Message-ID: <20241216141846.GA71151-robh@kernel.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061849_785430_A10AEAEC 
X-CRM114-Status: GOOD (  13.20  )
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

On Fri, Dec 13, 2024 at 04:44:39PM +0000, Peter Griffin wrote:
> To avoid dtschema warnings allow google,gs101-pmu to have
> two reg regions.

It's not a "simple" syscon if you have 2 regions, so put it in its own 
schema doc.

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> I don't really like this patch, but also didn't want to submit the series
> with a dtschema warning ;-)
> 
> Possibly a better solution is when Robs patch
> `mfd: syscon: Allow syscon nodes without a "syscon" compatible` [1]
> 
> gets updated with a v2, we could remove syscon compatible from
> gs101.dtsi (an ABI issue). If I understood his patch correctly,
> it would mean this yaml update would then no longer be required.

Whether you can tolerate an ABI issue is up to you.

Rob

