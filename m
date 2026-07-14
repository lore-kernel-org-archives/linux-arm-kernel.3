Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA671C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc8QH6BxvyW9ef8PAyxaqiwonZpdVzbJV0CMm+y4Vs8=; b=UqU0/xdgfJWRhecIvlJi0YDfMS
	9DzGHuiYO8DtUQFvvYkcpRetJkCVElaf8/7iR7tIRfdFxde1u4DeRd+QG/w1P24SdsbuZN5U8gbmh
	Z28ZT+NIURV2CM+5cyVNM7Mpi9EsmRF0aPbR5SwHk0wVat0HZg62AkGidwwpBFRatC+wUn1Ycmvs4
	G8Cxw+a004yMSWgNPW1dfDE8PeU6T4b7IuGOp526iWw66qXqtGD6ThJDJ7i8sOMo6ueNGBcHGJ/oC
	5VABoBtxy8iHZbyPmZAljW8+nGfEQQI1AC9/76MetG0PTlFDGixOS0I8nZz69FZ50GKXYz8R4jsis
	wDzIs03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkc7-0000000DL20-0FBh;
	Tue, 14 Jul 2026 21:24:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkc6-0000000DL1a-1NIa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 21:24:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D02BF438F7;
	Tue, 14 Jul 2026 21:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B481F00A3A;
	Tue, 14 Jul 2026 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064265;
	bh=Kc8QH6BxvyW9ef8PAyxaqiwonZpdVzbJV0CMm+y4Vs8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=CXQVcews4hmtRA84seJ3Qk/SD4B4/jZVLiyBOzKwH9O0BvAstEESVXu3S6ADb1VjQ
	 XT6Q2pBpI0wkBiL3oVo7QXj969wq+MKdbD2Uwc6wpBOlzAGXwP6vkAkCTYzg0ayRis
	 4Q/Nu2MkM0ns6zADbWoCjfQXJJe1r02xiI/pgttwBsuxSjWdV0hSz0pyoD+KulvTpg
	 SY/m2kCWutzvh2OGhVgBzlA0qA6cEilK0vSMWLlviXwc28BzpISFguHC3BWRRIuXMx
	 IV0p2BHDg6DeBQgzxdqxIN6fk8Et77RQo85OgCMclfLX2d45g1Lqiv5R2gjF3hy8yL
	 bMN6273gJhwCg==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705172737.120095-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] spi: atmel-quadspi: Simplify probe() with local
 'dev' variable
Message-Id: <178402987400.7661.258618486934275116.b4-ty@b4>
Date: Tue, 14 Jul 2026 12:51:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vNOBqqC9yFiEhyoXR9LChSsTeYbMgNrUtgO54Ckjo6M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqkHO380qiDwrpeEr1UzHf3y/xbG7gwxxNKhH
 DsjxxILTsKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalapBwAKCRAk1otyXVSH
 0Do/B/4lvOm0J5liKBkExSMKLVgDP3KhutGv/fNZDFbKqOfDsSdpSV6CslAPwGMRF8BODazMI16
 m/rOctg7uo4IHGw8XXiY09nclcvKuqfdnH6jkJHvJiN97eRVCjkDOY0j8klepjf7lsx+qhtg+mK
 /HrQomPJJ2SoTuWuqwNFBxAJ2HavzKt+p0hzDpzjt2NJclx4LTVBl2YYSOJqtVQYgv97ZvheFqD
 /NUoyVc31JzbDB9LImNQWS4WxL84duPd9OqFok51YRH7mIqlQ4533TKG5X9QTPvBVUNu3W1NRX1
 zz4V5z14WA2OnG4j6corLhS8qGE3+8syCl4DSQeofckgzKs0
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

On Sun, 05 Jul 2026 19:27:38 +0200, Krzysztof Kozlowski wrote:
> spi: atmel-quadspi: Simplify probe() with local 'dev' variable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/3] spi: atmel-quadspi: Simplify probe() with local 'dev' variable
      https://git.kernel.org/broonie/sound/c/51f761e4071f
[2/3] spi: atmel-quadspi: Simplify with dev_err_probe()
      https://git.kernel.org/broonie/sound/c/3ae07d8f3075
[3/3] spi: altera: Simplify with dev_err_probe()
      https://git.kernel.org/broonie/sound/c/3e106385e3e6

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


