Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B546FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnFaW8D3P7JMYF4YVfDkUarRJOKqz/skLyqRNd+M4Zk=; b=bnhRXyLjITyfmeQQAKfZM6okqO
	PFr9TzVy2OlJTfujTwHpL00/nSov2lTvAQpCHwdFU5E3pysf5gcE2KtV3s1Q/rd+lVMrA4gm5HvTQ
	YR2OKFvrh86uy46PvkXPUQJiShxbR4Zrpk+bHleeMIcwUPnd/BQoVERgQsv1Xp1ncp794KsULrk1g
	yk91VhnN0WL7FUTXiECRNhyofC7r/M9XE1oKdnFOkDstoWYAj+DDLOhIl6embfPUJkx14xyEAsmRJ
	cGFiP+/QHkmtqfyvGgIKGdMm2f0yyw/Y7Ew8t5+mx6BlbLh0F3oqqGTWGxmwHB33NaQepoZWexe3w
	OKsoTJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8ny-0000000FvV4-3S6l;
	Sun, 26 Apr 2026 23:22:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8nw-0000000FvUN-1asL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 23:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B5BD409D2;
	Sun, 26 Apr 2026 23:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266CCC2BCAF;
	Sun, 26 Apr 2026 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245744;
	bh=S9dBTChFIlnYvDUEZaETK0hIKafFubYQ+1rcMFkVN8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=om0ejSB48rnF07FqWKyOsSodsGu7SU/3sGdOBHyfvqGV5T18gdUnVa8Qh8rkRiRs+
	 mssiLicxFZWKcMOraKuR61UClbLosjDoLhg3vKe1FgGKNDDm5jPCMYCAqxXch15bxD
	 VVCCeo8V4J6N5nN7/Ic0UmRZuYHtzWJuOe8kCJk55FFn7tjePtJoArZVjdVTkccAe1
	 QGygaTQIDBBX54VqgeVRVJE0DnrJjS7yT8CrgIlsbgPcfZyDFME7M2kw9nJXUnm6IN
	 En3h6PLZJqCN8hvWLV8OopfC8tgNEvhDZ0+OaTY1G5JABM8sP6WNXUkrlOkQNHSRgE
	 DFo1aWZ2li9tw==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 Gabriel Jacob Perin <gabrieljp@usp.br>
Cc: carlos.albmr@usp.br, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260421193113.1060213-1-gabrieljp@usp.br>
References: <20260421193113.1060213-1-gabrieljp@usp.br>
Subject: Re: [PATCH] Change manual bitfield manipulation to use
 FIELD_PREP()
Message-Id: <177724043581.266775.16077702022130631965.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:53:55 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S9dBTChFIlnYvDUEZaETK0hIKafFubYQ+1rcMFkVN8I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4t6CI4Rcq9kTqMarTJ4G7FVZB3M5EfMwoOn
 KkZAF1QL96JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eLQAKCRAk1otyXVSH
 0OSsB/99y9bUzrW42ETTKfIN3VqLin/KgFpythZJnIH46o7vyOsUQjO3KLJllGqDYfZU5LQOdzt
 6c2QTn3l1nG4xUfDpBuxyh0qpeUBHN6E/HY7+WU1DvH8Z2bNvPa1Hmyb1MtJ5pEnu8i4N/emBSQ
 upnyNLlRP/64wqwDIzWWdFQlrn/NL3OJwhreyWUuicRyRs4+X3nrRaB4feOI+B82G7YuzXj/mNu
 eM5vRywc48TAY+LILEsorvcLHR+xr4FxwpJOkhri3R+ir98aEDGFxWJx4AtXSiGKswX/7qZ4QRD
 +JU+hdQ0qukg6vxi0sUXndNd7DF16faD63QLAfpqCUbguSU2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_162224_443994_6C84B12C 
X-CRM114-Status: UNSURE (   7.81  )
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

On Tue, 21 Apr 2026 16:31:13 -0300, Gabriel Jacob Perin wrote:
> Change manual bitfield manipulation to use FIELD_PREP()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] Change manual bitfield manipulation to use FIELD_PREP()
      https://git.kernel.org/broonie/sound/c/ae93afff9818

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


