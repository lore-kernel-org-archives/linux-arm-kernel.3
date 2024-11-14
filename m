Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62216D6A254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgfv88l0pkkQROxiMEECHApj7OBPMmgs9Sc7Um3nOVo=; b=RtUkzYSUkObojFM5ph7cTzmxUV
	N/JAZ9Ke7f7ChF1WUZQC+WOgrr/NuPRYeqa/pivhrCUBtlPk/Nl3pOpJHlUx1G5mD1lMqpIkHTCqf
	LVOXWpf8c+Lg9/aneJZwWwAy5qcSb3nCOy8gOA+nBRZEVg5CwpdaZsM2UExOGzj9l6AqNhO1a4Ggg
	41k9Bv8/O1SKa7xMsd7vfeBLkIfhSbpcHAlgrMgnviCd8XFSwgkj6u976QvmRiozL/dt0ZDVqhkVk
	LNZxhWPzVYuyfy4nV4N6ek/hSuaOtXliZIFbUQ26q28xjf1/uMSTo3J1/PkzijUsViwONv5ZBwMTj
	wBN/TaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiXh-000000010nF-3YXd;
	Thu, 14 Nov 2024 22:42:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiSy-00000000zn3-3KP6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEE3F5C615E;
	Thu, 14 Nov 2024 22:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF9EC4CECD;
	Thu, 14 Nov 2024 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623851;
	bh=jgfv88l0pkkQROxiMEECHApj7OBPMmgs9Sc7Um3nOVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h5E96mHBaVfC3StuUkyOqE9mzUbLWkWLMZyTdbHbtrGxK0/wcoHjCwEXiSiicaahZ
	 kpWMqdADtOj19PSiNZQIOi8kQ6jjnmoFhL3Em9KPORK4iJJqFdyVI6ctVAZ1DnZEXc
	 KMFsyXh3QqaskukEsx7/PPxw3en/ud261+/uyE4YlxJU9zm2xgluVIDxK/dzYWHU+F
	 mgss9jVW/Fpo101mfp4pWiVW76K3X66xn9tYlnejGGiit8yZS4lBzZITt/UTsFnExn
	 sKpLGn/SWZg+c94Q+FOwptFahRLJazhUSYhgQJzI8zydPfVxGZpzwbjlebJBTZ7kvt
	 2w2YnFEviGsgA==
Message-ID: <9cdfdae176bf25831f0500abd2d0699e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-8-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-8-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 08/12] clk: mmp: Add Marvell PXA1908 MPMU driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:30 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_143732_876267_593C08BB 
X-CRM114-Status: UNSURE (   7.29  )
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

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:10)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the MPMU controller block on Marvell's PXA1908 SoC. The
> driver is incomplete, currently only supporting the fixed PLL1; dynamic
> PLLs 2-4 and CPU/DDR/AXI clock support is missing.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

