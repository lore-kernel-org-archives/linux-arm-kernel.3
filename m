Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8664EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aU/yGosNIV2qEhlQd8Ariiqp/9sHT9/6EcsW0fCB7PI=; b=Re8Bp3l50oRW9wcJFamLQ2Texd
	MPx0aT3K8ocNgtfazogt98ZQX9UbOpe+eoi8eaSBuDdV/mjnr8tk3VEW+b3m6F59ZG4gPgryS4A9U
	J8AJraFet2pV5TG1sDP6i6yr47oAamatXinUbLBG5WWoRNR8/zscd3H/He8QqDefJao0b8y2CN6J9
	lxZYwu9y5yiwMYThOmzcyjD4YX2GebeGZf8be+PFqSrH+ToqG3N+VWJNeO0fcTghD2ZsI6dO4ZRdg
	OZsTlSE99cFzjbN8XNrV7YT/4Ju2jlgbX1I4cii02Q9+RLJCY/4GlK+Hhx7ocMAUNZNXw+L+gfmJS
	KLT71EWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUh9q-00000000MBS-1Afl;
	Mon, 06 Jan 2025 07:04:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUh8e-00000000M3h-05xT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB23E5C06DD;
	Mon,  6 Jan 2025 07:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E259C4CED2;
	Mon,  6 Jan 2025 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736146978;
	bh=sbbH6cRjWBZxw3cDoRJkv8UFdjiY/oIHJd+32MRs2E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdhFbf0YXxOzsM2Bkeq+ig2GGXG0XFZnRIX5NKJjmYGeEU9GHBzaKKE19e2zXfWny
	 flf7Trnpu6kE9lMXu1D8EXfLtDkdlJgmzclvWZQuZuaqqscm6VmLOnF/hM7D/gYwF5
	 uKUG1f9Pi16nF4VVSjIa46scXBi9V5eVl97IyOu5ZC0creGgMKMMRUJZ5JklPzlgld
	 PQtDtlNslkhg89b2khK7ARyPGxvt6Ph/BUFQ+MxOS6ArmSK1KJXwx0808BXMKJ/N3N
	 775TJYs35GKOTt7r/NQGrfWeZOS5dIGg46Plp2HdXYXUO1l+7Y/hdP3n7XBXm6og4o
	 zacP4/wgdip2w==
Date: Mon, 6 Jan 2025 08:02:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] soc: samsung: usi: implement support for USIv1
 and exynos8895
Message-ID: <4ddzqybi2umjsstg7olmtjlrtfbqxnpcrcfflly7snfzcez6r7@yrkxp3sclfad>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-4-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105160346.418829-4-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_230300_121582_BF440343 
X-CRM114-Status: UNSURE (   9.36  )
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

On Sun, Jan 05, 2025 at 06:03:45PM +0200, Ivaylo Ivanov wrote:
> @@ -169,9 +207,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
>  		return ret;
>  
>  	if (usi->data->ver == USI_VER2)
> -		return exynos_usi_enable(usi);
> +		ret = exynos_usi_enable(usi);
> +	else
> +		ret = clk_bulk_prepare_enable(usi->data->num_clks,
> +					      usi->clks);

You need now exynos_usi_remove() callback and also error path after
populate at end of probe.

Best regards,
Krzysztof


