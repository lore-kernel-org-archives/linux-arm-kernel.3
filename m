Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C27ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V43WkuOqKLq4JwSki5bRvYwOw37hrZ6rq6NuvgrpqIc=; b=WsRtmANrNgHcf5l17J5FdJzqBG
	euFim9NWnfBi2yUJ1EVzEUJapdmaJ4CbxK8LcmRC2d6iUvgSHx6EATUaSGgwB97IwrzCInAukPzpL
	o5XocNkO5MYOZNPH+4MBnZZIqjiYMQ4w6mg8q5F6GF2LEkZ078FBOIlj6A0d4BHH6/t9wCOO342VW
	Eh9OFUQ6TLMy3T1gsy27hFbQa/1vJrpGQ1K7q3qM9mWFrEEDQlMRvSEQmW+U6WF4EQRCEfCEwiJaO
	axsoZs+C/WU32n5nc+sjmuDjZ867oA/1F12VNYKeIJJgA0jw48QjmYLp5B+QqCt09ie6zxbwHxcn8
	UR/M+O/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xU-00000008qCM-1ffO;
	Tue, 09 Sep 2025 17:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwrF-00000006s6r-1WUQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7536560202;
	Tue,  9 Sep 2025 11:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5E6C4CEF7;
	Tue,  9 Sep 2025 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757418596;
	bh=LI39LAQ8Ktx5D3nswcyvz1qCla+Io/CVwyEtyAFHRXo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JCpS4aJsIXfsqn5K5LoVLB9V9NNur1ySxm3n1yn14KwZTBDaugJ/HVfPk8eUQV84+
	 do/7U/vksqDGR95TpfFU/HlH6bU4ugS7D7yIl7Pss0Q4SLdLUSAFLl4qapqxdzPhjD
	 nz+rY/z1Sd+DARjDCyr9gXZSE95wMfYrs928joZxDsudRDYWkSvUqdQQgu36nU8+Ky
	 swJx1QZkYj2GDTXH3aehVfN6r1bjb7J+mqQZIPpgYX4xK9dXacQn8rjhGO/T9WWTCz
	 SBo2+9DGs3kJvvdHIyF7iLS/Z95X2P6Z1vbnG31UzCv0vWg+pzwYtd9mLtuTIo+1b+
	 YGaamxkN7aM/w==
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250830132605.311115-3-krzysztof.kozlowski@linaro.org>
References: <20250830132605.311115-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] spi: s3c64xx: Drop S3C2443
Message-Id: <175741859364.56807.5691660197683706591.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 12:49:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-94e36
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

On Sat, 30 Aug 2025 15:26:06 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles or
> platform data ID.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: s3c64xx: Drop S3C2443
      commit: 6248c95eef941bcf987bdd7c62f5e47275b0dbba
[2/2] spi: dt-bindings: samsung: Drop S3C2443
      commit: 2c625f0fe2db4e6a58877ce2318df3aa312eb791

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


