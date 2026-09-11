Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264A1C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1i7na06iDth2FdJIH8BE1JqijLD9bS75AOuEnYVjg8=; b=tBn1fn3XES5w0UWukq+2vlyuBk
	hogY16OlOzHiLdfRXEw29UNX9eiVF6QcPNGSfjBMkOqkvkPAibg1BMhJyc73hbBjsDZIcWzCIXfQY
	B7kGGxW150mTK6N0/17aWmaTrzzQkPwpkbrd6cWZZ72b9Dvcvm8eHefCWl0n7juD3cCA7nWAh5OYg
	/YEjzEVo7/MtFHchtKIgsoBPlE44jPxLyBc1KZXpoMIkC0vyLg00jwk7R/ltyg/TvHbfNJV+wqKVr
	fByTWs3EGz/Xnm9IZzdtwMYISs+mi88IcqEMf2uYY3EIikzFaLb/szVCZy6AX6TTaAmmqvDtP9Odg
	UXu3FPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vAl-0000000FyC7-2pAX;
	Fri, 11 Sep 2026 06:55:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vAk-0000000FyBz-39Sf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5C69601EF;
	Fri, 11 Sep 2026 06:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B071F000FF;
	Fri, 11 Sep 2026 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789109741;
	bh=f1i7na06iDth2FdJIH8BE1JqijLD9bS75AOuEnYVjg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F/XbA+tV/fjHLp6KWUkt1UF/rxFDoluhj3dEGL2nQVc/LNX/RMVRIvVsEWGLmqb5O
	 EmlovJpiVWVtk5TRgXB3Jv3ntHC6ZCBpkJFIBmWUCjvwWWOYFeih08MDGjTtxrMel5
	 ipyWBbV3O7s2IqzXOp9HlSE82W9KtD0APDTnH3v1rHUnJ7yGqVbgnoRNrOaYq5/TI7
	 Xp5CSIZH3LlnevFxTisSWh9m1gnGtLSsjKmjCInlm5pYZdqrm9TykzIDpLpvvRilzS
	 C2xtkv8J17Fv6cJ0zPQpDSKNy3uzIlRXQDx10xGyP/P48PdUfQtqzW3CSHbk/lPjJd
	 21DymFi2/97GQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukasz Luba <lukasz.luba@arm.com>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jiawen Liu <1298662399@qq.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, stable@vger.kernel.org
In-Reply-To: <tencent_B0189529F550458590E3BA614EAB800FBF08@qq.com>
References: <tencent_B0189529F550458590E3BA614EAB800FBF08@qq.com>
Subject: Re: [PATCH v2] memory: exynos5422-dmc: handle clock enable
 failures
Message-Id: <178910973800.29600.13263415611790690641.b4-ty@b4>
Date: Fri, 11 Sep 2026 08:55:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 04 Sep 2026 14:01:35 +0400, Jiawen Liu wrote:
> Check the return values of clk_prepare_enable() for fout_bpll and
> mout_bpll.
> 
> If enabling fout_bpll fails, propagate the error. If enabling mout_bpll
> fails, disable fout_bpll before returning. This keeps the clock enable
> count balanced on probe error paths.
> 
> [...]

Applied, thanks!

[1/1] memory: exynos5422-dmc: handle clock enable failures
      https://git.kernel.org/krzk/linux-mem-ctrl/c/cce46902ea9fcd585cd200fffa3166f63bc571f1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


