Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626AED6A254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5TwThJkD0kdeyGwJsp2uFGfaqoGf9VNif44eGvx3B4=; b=fc+pXXKHWl2UNLAX554/bHP7Wu
	lM0afiUqk1buWNeK6idhHV6wKq1Z5cxrOKBH4VG7/s1GbzNqorFtLOLCAEUlEkIJraZsqde7JRK5o
	OCb3nhk+cqW77JA3uTQG81G5GyIEHOBYFWFcue2/V2FWc69R0ythXmhJC7c0GM8X+TUieIOfAppQ+
	0txMbCz0NzejHKwnZgOxOBhwFutQ+MBRN5XTZyrXv7lZdg3crH52NBBuQ1w+VJhqSIKFihZlSANNN
	kfot4vMvs+71/YEY6G+6S/UKO8tZJcCMl3vJQ/imKURGbN/VZ4+NpVVw0tdPTVtoYsBHt792hQ6eh
	u9m9Yq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiWo-000000010gX-0bKt;
	Thu, 14 Nov 2024 22:41:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiSr-00000000zlu-1NEX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8588B5C616D;
	Thu, 14 Nov 2024 22:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04EC4CECD;
	Thu, 14 Nov 2024 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623844;
	bh=S5TwThJkD0kdeyGwJsp2uFGfaqoGf9VNif44eGvx3B4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kpKq2wYxLqL+0pK+eDgbWuFm3rQlF3oYQ6zTbIN8CdkpnKshvYrjoVIkCOgxDIWOd
	 sd3yTsMbpGxp2qMJZ/Ph+o7ZRM8sPioUEOF5b3VK+8dRrU5MPbXNX6mINv7V7Fo2st
	 qlFMkDY0XhZ9W2kEB01HtH5cWRiySCzK9jsIU+tTqKVE1aVBMSfqJkEMLhxqmtSoRz
	 Rg+oT+JvDMvm3jTl8I6aXxn/zlmkwKmoK4NriF7n2BNy/KDcDHDUIZph/lBLVxGk1R
	 gpBUmCfTo2gWN4qB/U41Nvu16UxeGSjb0HyBW8quONDMIK3aruXg7jbQ89pf4eVEEz
	 ZthYB/9DUbwNw==
Message-ID: <9bfc25cc0d99ad124aa22c98f9611689.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-7-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-7-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 07/12] clk: mmp: Add Marvell PXA1908 APMU driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:22 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_143725_410304_65121B74 
X-CRM114-Status: UNSURE (   7.41  )
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

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:09)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the APMU controller block found on Marvell's PXA1908 SoC.
> This driver is incomplete, lacking support for (at least) GPU, VPU, DSI
> and CCIC (camera related) clocks.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

