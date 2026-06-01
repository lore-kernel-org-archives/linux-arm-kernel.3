Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE75CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjocX/StcatzA+7lRhbJocmTLZYm3zu6CJOUvlYp57c=; b=nZH+9H2irkrLrebhKoGYuC9Na5
	7l0x4NyP1ijshYWIJyB7W9BKupCcb5QJGWOxcbcZACbizTknZ8puUyAxaVJ34Xe8oR6m2BSBeK1YB
	vmoV7uq03rZBZCh1w3ZJr0fMtIyYBH7L8/JGuZt++3eZw0cFb4s2qwT8xAtLMXGmzi8doGa3f8wp9
	d1PlDgq3r/tIqoDTvveVr16ayGux2bjLPzyUgc+dR6l1C4Y/ScxNnFEQplWgcpiGF7JDINsf85BDj
	W5WS6wbxoje1gxdsDNfx4kzqFdQLOHZMfNZEiUaPnTFJc+em4OkBn4w412PcYY7tYbt+rRG5IVFtI
	7WxYl/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNuS-0000000CwRe-33rH;
	Tue, 02 Jun 2026 12:07:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNuR-0000000CwRB-1SFJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:07:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9360601D6;
	Tue,  2 Jun 2026 12:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B8A1F00893;
	Tue,  2 Jun 2026 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402070;
	bh=AjocX/StcatzA+7lRhbJocmTLZYm3zu6CJOUvlYp57c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XU670/yewUMzeHj1IfYY/Nb6Ee1nuk67I6Kp6MR5lHyAxYXSqQCIZ9pkICxaVigzy
	 lAw/kwonX77zDqUXN1gcuILviEGr+9GLl7tpca035Gv+AbQbvpfq6/pCw+q0M9Fvx3
	 gpEnNdOEF1Boqht4U1mL6HcI0Jfbd+6y/j/4queDTCcbntmI4L3vGJbIk0iCC2cNla
	 KMUv1XUUCDaOTwUXxTuFV9c8R2j1WKE4+PyaWEyMgPBe9yYov6mvfyxybQWDU0+HDn
	 WZKMkon+sUWrgwDZJAlyaDGl+Efk63PYhm2H3pVk56YtCo3k6XLRu8E/O93VGswhPM
	 yakOYslCiUvNA==
From: Mark Brown <broonie@kernel.org>
To: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, carlos.song@nxp.com, 
 "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525062928.3191821-1-carlos.song@oss.nxp.com>
References: <20260525062928.3191821-1-carlos.song@oss.nxp.com>
Subject: Re: [PATCH v2] spi: imx: replace dmaengine_terminate_all() with
 dmaengine_terminate_sync()
Message-Id: <178032292667.44654.11142076412680419763.b4-ty@b4>
Date: Mon, 01 Jun 2026 15:08:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yxQQ9gaWWDoS8ysnsM1La01w5SvAJPAnAKtiYQjwhXA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHseTLt8mhqABkDo/qpwSXNB94dDjhnTdFjVXA
 I214VRm64qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HkwAKCRAk1otyXVSH
 0JasB/kBexDdlFvqw5k+wXp4BPUn2L1tMWX+QCjBx+aHKPBWg1XEE1Hw9ZAjSBMc4BzwUknrzJi
 wJ27ApFrkntai7kX4DzB6PIWyUFmw0kSylVQakjz6g2a1SDCEePAbOxlD+K38SmJo8ptKj3CSAt
 v8QliTLMLCRrdTK/KHKQYOM3uOmqEeJMdx2Aj5+R7bt0SkOZ+D5a702nDQceQLHxkzTBwb4WbZf
 0/wlM2mHzTF1cfYQiWgjsfMRcTJEYbgNmxrddkaAHntu4C1I/hwD4s3SmJXjLY9XAKiU+mXHViM
 o6sa7dHNQOWQgEfpwANm39juHkpiklqyXOlshLwK8XqfWNRE
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

On Mon, 25 May 2026 14:29:28 +0800, Carlos Song (OSS) wrote:
> spi: imx: replace dmaengine_terminate_all() with dmaengine_terminate_sync()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: imx: replace dmaengine_terminate_all() with dmaengine_terminate_sync()
      https://git.kernel.org/broonie/spi/c/4503b2fe761c

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


