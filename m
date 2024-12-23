Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84146E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 20:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7511N2OAxNJkgb42XSVIgACVMtbge2/q9/DMKR7CSs=; b=fm9BEFZ00fGgQm8oGjn6YU4ZON
	YWSed6NbD2q0uS1In9NUV16kAjV8ZfArUiinJgG46juvuFUbdMd2j6ZmurO7HvI2ZNanVPc8JEll9
	Gwh5Dh5tk+qKs166EucXHcrTJK0le+lIfFtNVriw2D/N21eN3Od5kQZZ3FAeXEFzKjSGXdx5bhrFj
	jjMGIlRe8AocqneqkVh1FMQhEkAw3zzTA0aEh1jfCsTfRYBvmA4ri4YwFQE0vQ0COV66pPjdH35m7
	b/+hKuGsCaFkJkPjInYjMija4zWF/B3qXnClvICArHmAitTzN53YWT3KTsFXbHxoNm/5tTS+yot8J
	slPwc7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpTv-0000000Ak83-2H1B;
	Mon, 23 Dec 2024 20:56:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpRi-0000000Ajo8-0wSg;
	Mon, 23 Dec 2024 20:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43E0EA41246;
	Mon, 23 Dec 2024 20:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0033DC4CED3;
	Mon, 23 Dec 2024 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734987273;
	bh=kbXC3RlLQvMbB0Kr3AmNpOGH3nzjNPCGMhfshggZNlA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NizACS31YVDw4z71EsAy7Qx2p3j7UDgUZareoT0accQ9ootNCVf66zIWg6xmTqdcn
	 HVQT1rMSyeds1vXm++1I86ABfO6lNxM89jmblxXrQK2fg2YNMQun2Vv61hya3fxM1r
	 dYB/jgByHUj9yqHvQqFBvdtSdGklZVFByJngsjCpbR3h49bYmbJCdJzNBvyAt1lbMv
	 owe+Nxkv7p6OOnk/7BvgPreFTktqshMFuFRbK3QutBxqyVl9s8fQ2CvL9PX8ahJpvs
	 aStLZKWHeVMT3GnHQMqiiZpo9uVgcn5XZTK13euMvaU4q08t1EvpIZmLTej3loyHKo
	 BxY73q6M3yp4Q==
Message-ID: <e16974439c048232c366503d73c2c799.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-2-aafbbb245155@collabora.com>
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com> <20241217-clk_bulk_ena_fix-v5-2-aafbbb245155@collabora.com>
Subject: Re: [PATCH v5 2/3] PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Date: Mon, 23 Dec 2024 12:54:30 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_125434_328509_9D83B0E9 
X-CRM114-Status: UNSURE (   9.39  )
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

Quoting Cristian Ciocaltea (2024-12-17 13:41:52)
> The helper devm_clk_bulk_get_all_enable() missed to return the number of
> clocks stored in the clk_bulk_data table referenced by the clks
> argument and, therefore, will be dropped.
>=20
> Use the newly introduced devm_clk_bulk_get_all_enabled() variant
> instead, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
>=20
>  > 0 if one or more clocks have been stored
>  =3D 0 if there are no clocks
>  < 0 if an error occurred
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Applied to clk-next

