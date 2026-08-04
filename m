Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE14C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+G1U0PM3mhdF8K/wC5MdMG8ZWLjf/C6FGfsv064MMeA=; b=HvBS1QlcWrEDUqkJpkYhmtpsc3
	7vr7bP/UuT03Wr2eQ6JTLBgzUQogGrUVJwWrOCRP9mm8yNLNLm1c9CvACE8bDhzQK6fLHa8raUdaf
	sB/TX9420+/3Ezmp5TcS0ZGmusLJJmkQxJpBrUVzLfS2KwQu4m+WzyHF8+61XngNclypTJJdsrdII
	BVXhUIZ+FgTTxJNPMbJMtck3gbut0dppl95z99H21MKRVAFMJW2KWxKF3Wm//Qwh03TD1s4yf23hp
	cfqSHMvp53DIu4tHYmwHS7ezk/C+I0FJwGLEAqAMIeoHlufZrodA+OY1XSubmaIIgE4UbYclFeEDO
	QP3XKl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMXb-00000002oEa-0RnQ;
	Tue, 04 Aug 2026 21:19:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMXZ-00000002oES-2hbo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:19:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A6FF41A6E;
	Tue,  4 Aug 2026 21:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9DA1F000E9;
	Tue,  4 Aug 2026 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785878352;
	bh=+G1U0PM3mhdF8K/wC5MdMG8ZWLjf/C6FGfsv064MMeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ImCai4fcMYua8UoJ7OZmIu8CbYAMIMmh8NW19pwuQVjcSLmZ/zIW9pl96K/7sxT+M
	 LlmX27RUQtw4o1q870ggMkLtLXtJK3aVNF/4BxaqXdGb3cV2fgDm76PaEt9dOISrvC
	 lPvgY4iYcFvXIFVJd6InLm1twscrQ2EuzA/j+PsktztX9v6lZWSLfdhBPVmg75Cdi+
	 pZVZsVbVmUtvSakJgur38onXol4xffGn6tChHDFi114+sjdGEf0UPKGq1Xijyx4zcS
	 lIJZJ8Kgh1IlWyC+yIwn4pRkEAlt0oVHhts+lU4J7O8r0DoEETlldkuhFdd4Pun4nU
	 yvcO97EruQEOA==
From: Mark Brown <broonie@kernel.org>
To: jonas.gorski@gmail.com, william.zhang@broadcom.com, 
 kursad.oney@broadcom.com, anand.gore@broadcom.com, 
 florian.fainelli@broadcom.com, rafal@milecki.pl, 
 Can Peng <pengcan@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260804071904.860842-1-pengcan@kylinos.cn>
References: <20260804071904.860842-1-pengcan@kylinos.cn>
Subject: Re: [PATCH] spi: bcmbca-hsspi: disable clocks on resume failure
Message-Id: <178587386677.111355.14222455977856705143.b4-ty@b4>
Date: Tue, 04 Aug 2026 21:04:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=254rLJZg1P/Ua+ZJxcWr1cD5IIiB1V2uB7r340A/S5U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcldNbOCyfs8Ffux8R0kxAlYvvdk9+HdCFWrtF
 Iw/pLZ9skaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanJXTQAKCRAk1otyXVSH
 0HwxB/9S4fNDNkldFXrjX8TrdFfLPHFvHMEepS5ewziq7GkXNm3EjSui8salsd59LWTqJGGjxzN
 OWfbl5XFU7KYQ0OnsUU+VL9o4OPQ51dRFAYJIa2awNGQEMCdOAFOcbeG311oiPFVy4kZHbbu9cF
 Uml2cLji24wqJod+FpUkYrNOYigiXWDMadQIckkS/ShlXNoZLBYGZPTsRwXo+/n3xCyMkhcnEUl
 oc8IDc8+Ony8NTKUWmd/3cD1UPUj9l5mhm/hZUCKhhdBYschLNxi7+0svwtLlUdqUvHKfigTjZc
 C5ZV23WLDHjaBjT8hulFzUBXSj7eJ2pyywBI+a+3q+qXoJSt
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

On Tue, 04 Aug 2026 15:19:04 +0800, Can Peng wrote:
> spi: bcmbca-hsspi: disable clocks on resume failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: bcmbca-hsspi: disable clocks on resume failure
      https://git.kernel.org/broonie/spi/c/d2f5a606710a

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


