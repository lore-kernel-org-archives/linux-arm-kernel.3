Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E45D6A249
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfhhuvQxgsjolz/D6JiwLtLMDBKlJ4RlLk8azVUsYko=; b=tMJbTCDJwAyOvb8M1+xhmpLGLy
	0TfQ7LlV88lhpc8e0cmY+drkuYv2y5ZGPQEpor9MFDGuVnFQCJckN3ZgbRGZyom8bZH4MportI8SF
	Sd6e1S5onvvkctWeTT3hDw+Xr4i15ZdnzCo14ZbwUFd0axHri/TgXwNQ6Tw18vg8fPYEx+zzdpEuC
	31AyG3hmHbYEz5GBVAtma6mg4TcgD8FRiqW9RuNaJNzW5Vu1FHqvdpc/gE9HNGYVNFWbVlrvu9rME
	Ntse8GMD0Hs1RXXi4A6JjJbeikJFyQNAD8ni6Q/Mg1NzKm3MIr6k+5JA/am9SnXV/Kdfxx+mlHPfP
	45c54HVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiTB-00000000zqP-2gEY;
	Thu, 14 Nov 2024 22:37:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiSG-00000000zd4-126O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F8165C6080;
	Thu, 14 Nov 2024 22:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E9CC4CECD;
	Thu, 14 Nov 2024 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623807;
	bh=mfhhuvQxgsjolz/D6JiwLtLMDBKlJ4RlLk8azVUsYko=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vE1SNNJHxW0oSAzwxVA92cfDhEScdhXdsHcinHfXPL7o/u7U0zW4FzDiw8toVV3pt
	 OP7T7gSTWPkc3tUtQ/9EnGRI9CLMfzhaydVVCpI1XGWqmo6MmtIscO8Z9bD1UyrL+X
	 8DTJcj1um4nuHiRz9eYZ/j5CuJvPlQaifmRl4xG59xBYta8BvSFxxO/zcqvbUPNABq
	 LXP1ZyryqCOmqVwCbqHmfWPZXoJTwTAVF7gpAv6ixHfjVqGW7eRsVdx30ek2fkEM/8
	 99Kz0sWS8zfT1s1bvjhnG6rmImfyd+S0LnQIS2bnPCfdVW1mLSehflENQnlrruCtqb
	 dHs7fQm2faDcQ==
Message-ID: <0b49bddf8ac713f7d506661e081c946e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-1-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-1-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 01/12] clk: mmp: Switch to use struct u32_fract instead of custom one
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:36:44 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_143648_330370_3EF07340 
X-CRM114-Status: UNSURE (   7.70  )
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

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:03)
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> The struct mmp_clk_factor_tbl repeats the generic struct u32_fract.
> Kill the custom one and use the generic one instead.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

