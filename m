Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C50CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1oh83Bn+6ZCgpQ6h2dPpmmWZCF/huBbKCFBgJ05nFA=; b=GVQuwg4RogDeudG6ZijnZxZXUl
	H3DyrOFKbzsvzrsyDAmuVjw09QJkpEpfXLpBEuS1iygt2sWq3BeLXWR48ozzIJBIZ610nfuwD8j59
	qs0y3uHrJVpCSbdx+3ptZEvO0CLmGHllqCve203I0zGtyfZeIn10ktGW+c/Xh1YQt4MjyEZuMVkMM
	RMdC7qds94x7jgCOe8JbA8CAOIBzQHDWtp4BIHOBjjbIkLFJLUv6cLVijj0TaZ0Gih2n1Wiidv3uy
	R7+YO+vaUAstjXekugZxet9Jsau8vLZZRL+pIyeuwn69/6/0eZW6Kd1B+2G+yXN55Vgy+WkuQLYbw
	fiLoiWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Vit-0000000DN61-2Fgn;
	Tue, 01 Sep 2026 21:08:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Vis-0000000DN5u-2CU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 21:08:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8703D600D4;
	Tue,  1 Sep 2026 21:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D381F000E9;
	Tue,  1 Sep 2026 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296929;
	bh=d1oh83Bn+6ZCgpQ6h2dPpmmWZCF/huBbKCFBgJ05nFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KOPPEvFXdTqZ3H7r8lYc4bfscuKMTVsjJBCglaVZvhcsn76HzlC56TwzGIY0b+AdB
	 ateTC9G6VQ7wGVHVn2MrU2CFysfKKTD6+N9n83m0ZxwWk3l5F2UbDZ2OcIkVQOx2px
	 Gy0kAa28eHvRuQ4OFiah7cPF+h+IYvPZ+wogh3ehv61t4gI+5L1be/4LGGl+5FKG2H
	 mce1mEDLjsFTa2mWCH8TEj0l33wJ8axYE6YsBqMBeZE4r4DuOFanOFXGyQEiohFX7P
	 12gaWVoin2xRSYwrAq2iwt/r10slRzYe3XWNM84jR5KeavW3qz9o8wUWcX62d6XHiv
	 ylZ742JsrTFpg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Andrew Gaylard <ag@ffroot.co.za>
Cc: lhjeff911@gmail.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820125835.1584270-1-ag@ffroot.co.za>
References: <20260820125835.1584270-1-ag@ffroot.co.za>
Subject: Re: [PATCH] spi: sunplus: handle signal interruption in transfer
 wait
Message-Id: <178819862061.141190.17552395113826527731.b4-ty@b4>
Date: Mon, 31 Aug 2026 18:50:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=skmUQfsezNawlIyKeMuQ/Gk6kzJ9Eyloa/jTCVPNlHw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlz7dGsvzPAXOlBeuQwLVpS7UKpfHmjKYYw7+m
 KkkXD/fZhiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapc+3QAKCRAk1otyXVSH
 0OcuB/9IDMSohzfHaCoFMDr7bFktqJ/V5vJwQ799PNxXwYgN4QJj7NKZP5FuSx4BhnW1w98oKor
 ZaslkRGjEVUsCN+CVxHQdlqiEFd6dy1IcK8yoBtore+TLse8bGDxOjrEvgdGgCGz+NNM06WXM8W
 C9v4n4Def4hSCbQpJN5Qv676H/QlzR0ldbo9qKldZgkGTvAQ3r24X2qrigHzTbGElTmSc3U0/2y
 XT8iA+jjZZ+vsraz52AqZUKg9/b6EZO49J21sqj5qe8AuxX2I0s5LyEUMMKYxOETZSxV+R73xLX
 jtT9CgowvRob6E5MebvCEBjy7xIe9n/5VQ2n9Z5f2EwFXLmZ
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

On Thu, 20 Aug 2026 14:58:35 +0200, Andrew Gaylard wrote:
> spi: sunplus: handle signal interruption in transfer wait

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: sunplus: handle signal interruption in transfer wait
      https://git.kernel.org/broonie/spi/c/7fe2098d612b

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


