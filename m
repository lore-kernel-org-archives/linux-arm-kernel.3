Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75276CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/dp6R76F8HC3mLsiQnoa2x9a7wzn5sEw3TtC8v8A8I=; b=BBkEodX6BzYyQddz5oYNFgJa4v
	2Nu0I9YpgEHsHfIEL1eWWcdMhp2va5bjV1xPUMQUNBnXr+f+yMWyABKGZ4BEg4Vm+2tgRcVCJgv0P
	kfA9z2rfZI53gzS6a0J17M6obAXX/BSXaECyNK9jKLyt3u/JuPE4zepI7A5iIN2GiibUKCbIAmmV5
	AeJx/S+wOMKKWpSoYPrUKodEGfjyeCqmkwVcE+EqS4jOnXRqM3t/u/yUmieWq1G5cFfaAlJCFfoHu
	JJd8eJrPk77ZMWYGEb8PFkOsgwxcRB62zIjIWZDsJb2qM0VHKk+UFCzJgQL6g2li/pTXIObFcVKnM
	w4Ro9MmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodeh-0000000CeEi-2TyL;
	Wed, 20 Aug 2025 07:54:47 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodc6-0000000Ce7c-0Qpu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:52:07 +0000
DKIM-Signature: a=rsa-sha256; b=fjB2SWgEt51cTCOpks9gjwooiZHQ9M4zvI/RLb67ZDFZclKxRMkXHIN2pz4MhKf3jv4LcUxEDH3cz5pPt7qBOakfvNliFjxHToHr/tLIa8MC6o4tOD9+ymwb24SlBB0X451Wp1utLcUKwexwyxYovgik1qlJ9gq5/9ncClmNINGy20tqF9s3DILsBWGWFfab5CG4e0uJz1be1odFQ9mDPGtyKrCPZ9At5+lxGIuseEYDncH/0zNZfoi7BS35NpDx7lGeRny1zNZOivGXmUatSZ3dkrtQm6U0ok/mr5/G3QGNxyB6+xxGSIBpR1cbiPKj8wmrAXZBalmW/Yri+MUA5g==; s=purelymail3; d=purelymail.com; v=1; bh=elLLSuyPTheoaJ0MPlpkd6YA8BTKoQCtubTKZJG4wWg=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1035053768;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 20 Aug 2025 07:51:27 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 09:51:24 +0200
Message-Id: <DC73AUJUPBLN.2ZN5PDNUVR33L@mentallysanemainliners.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Denzeel Oliva" <wachiturroxd150@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250819-2-v1-0-e84b47b859ce@gmail.com>
 <20250819-2-v1-1-e84b47b859ce@gmail.com>
In-Reply-To: <20250819-2-v1-1-e84b47b859ce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_005206_248953_A3D9A6F1 
X-CRM114-Status: UNSURE (   7.28  )
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

Hi Denzeel,

Thanks for your patches.

On Wed Aug 20, 2025 at 12:19 AM CEST, Denzeel Oliva wrote:
> Correct mux/div bit widths in CMU TOP (DPU, DSP_BUS, G2D_MSCL,
> HSI0/1/2). Replace wrong divs with fixed-factor clocks for
> HSI1/2 PCIe and USBDP debug. Also fix OTP rate. These align
> with Exynos990 downstream cmucal and ensure correct parent/rate
> selection.
>

[snip]

> @@ -837,7 +837,7 @@ static const struct samsung_div_clock top_div_clks[] =
__initconst =3D {
>  	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_share=
d0",
>  	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
>  	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_share=
d0",
> -	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> +	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 1),
>  	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_share=
d0_div2",
>  	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),

As per the downstream clock driver, PLL_SHARED0_DIV3 has a divratio of
0, 2. Was there any reason to change this? [1]

[1] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9c=
d22b89ba3cc8282945a0c46ff27341d/drivers/soc/samsung/cal-if/exynos9830/cmuca=
l-sfr.c#L3935

Best regards,
Igor

