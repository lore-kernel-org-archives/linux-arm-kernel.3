Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35SLMVPx0u6ayMN4r4D0tKX7Ejde+ZgmUYJJPjitprw=; b=JuekitgN2RByEPi1wu5+FSDKSG
	gmZo/Tv84hHDxJ94S1+w/e4wTYHTlUh3p1WmltjCgY58K4Bbo+og1uVngrNTrXIDhPks5mqLKHocF
	o9kN6+uKQqeXrqJWHtFTIDOK8JFWcXGp3E1EJ2S8+fBQjzu0QG9ojN3TQEZPilonwAp//ssAYL1gL
	3o2xsrfAfiy4VL8ukNhjniIJPju5+BlIAiwxKPUfBYMB61fCs3tkckYvuLpnVxONf7YhJVl1PUUfw
	DEiOblHzveBsh+1LrU4bGRw0MpZRi0E8oa1s+UP8Lk3KYf95mxWvsYdw+ECpFqfp345HAFdamgm5r
	c243CkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpcu-0000000EXtm-210d;
	Tue, 11 Aug 2026 16:46:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpct-0000000EXtZ-1h0I;
	Tue, 11 Aug 2026 16:46:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5F40423CC;
	Tue, 11 Aug 2026 16:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94631F000E9;
	Tue, 11 Aug 2026 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466814;
	bh=35SLMVPx0u6ayMN4r4D0tKX7Ejde+ZgmUYJJPjitprw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aJtX+m3fc3xxLA0Q9AKc5S4DEtALmtAq/9rYx74j4YQPC4RzgCSSG3ohIF39znldg
	 Pum0I8zL6uP47KPy4e6QUTQAtKIcraPNBWEm9y1tmlM6/Q0Rwt6IBmxNL3IqrmMLz/
	 cNsX8eSRmFZqSG4DRazhqiQLU+AwQ/m6yB91/VzRp+QSRpSWwQxVEYFYNC0v0jAMs3
	 70TCxVvbhP0BNiA5xIXCipydo5wPVsAf5LlutPz9sssh/dF+tR3+G+XMGPZENwdhUM
	 XklYzbMwWoFgV472FKFA/128xuP9Smcf9raiDDnvex/n86oJQgJp+/d1tj5yttQFK8
	 DP4hWh8KFFQYw==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260802-spifc-v2-1-46e9d06a3217@gmail.com>
References: <20260802-spifc-v2-1-46e9d06a3217@gmail.com>
Subject: Re: [PATCH v2] spi: meson-spifc: use
 devm_pm_runtime_set_active_enabled
Message-Id: <178645712491.119683.11333152337040642121.b4-ty@b4>
Date: Tue, 11 Aug 2026 15:05:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+JK/qtzYidYxvmfvEm32GTzCLRscEza11mb/ChBDu38=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqe1H71ff9HUK4skCti6zzMXrFYRGaDkU1jVyo2
 ZgPr9DwTgqJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantR+wAKCRAk1otyXVSH
 0GxWB/Yj7AZhfrU7mudjhSzbAMFpUyuh/nfPqyLT7oFAz+x6qCq72kUL+F8+5XiqNNj0Jp9jQXw
 RMMtuyzrg9aRl5/OKN6AKGWUOHrxYJbaxIdbcML+d95Mw31rvhfFiE76VIHLcMuIUM1lXi/wcl6
 S5dvnlGG8rL7PS+HlAzHm2AQfO/z+eHjz+ReNpPryC1jxkA9FIoRNu2QKBerOtsQOzeYfNNbKmg
 aq4ORFpuWxcPKxnrguNc+pieO7XlbVf1QZ0vLxOeWj07sr6L8hmvji703eqOEZrEYLL7op2bw7M
 pUfI5Pzw3KNwkUxt5QTczJS9szeWZL17JrgqOtUrONs8IBo=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Sun, 02 Aug 2026 01:51:24 +0800, Felix Gu wrote:
> spi: meson-spifc: use devm_pm_runtime_set_active_enabled

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: meson-spifc: use devm_pm_runtime_set_active_enabled
      https://git.kernel.org/broonie/spi/c/c10b7f5e0cb1

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


