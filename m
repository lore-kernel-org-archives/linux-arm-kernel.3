Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8548C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNvk/B+6AVkasRZGpQAzc16soOMOZoP5VAozQDwIVv4=; b=418zxG0QRnYElMxduqjFGPi+gZ
	RmYcKaLZsb62YMOAe0tlMmE+1MrGPnxIVHW8mW20C+3FmRuNkHN/WbnWLN1iNQOifWT4sj+cwZdmU
	9owh34SNwUhELsC3bnhpMlc+Vri0F72ZLuuYKMvFiz5OzXFNtuYgp65Wshd4yBIJ21bDTxou9JhBy
	6aqf5o79SLH7nEQshbZyM1ESIu28FqKd3ePsb++r9UJSISJjWOOYcMvd7lhXqPVOdN8GFWT9fR474
	EClLYz6fPuARdfdIRc2RwXXCbq4nRe0+ejRhC8+AGQSdR1nLIBZkqay1nAXCSlCbGo2noHFA1aQva
	hqwHqIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptX2-0000000DWR5-1QKI;
	Fri, 31 Jul 2026 20:08:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptX0-0000000DWQx-42Lu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:08:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1645260A6B;
	Fri, 31 Jul 2026 20:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D735E1F00ACA;
	Fri, 31 Jul 2026 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528513;
	bh=SNvk/B+6AVkasRZGpQAzc16soOMOZoP5VAozQDwIVv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GCaH56fBoOyoEX7a8BwQZaT4gpqra7212LNCZdNhalau+OeVQT6Una+dcwuQQ6S9K
	 3VF4ddivxnU0aSXAC3P/1JLhhg9yRZoYHa/txKqmqz9WrqeX4cuKQ9v0VoN5Phvoxm
	 +WfgQYmg/zwPHHhZhWztsz3FLBHg6RgLxiIHE5vlW4z0zZSeYQkbSsS1srhOgQd75I
	 OMKnFMDFBqnqK+t2H3FyFDyzSE32vtoa3qy99xMGBrfBLX2CQWPZg3t0eGw6aA46Ys
	 8mvw019RfwYrtwIs9cxJUdte4fBLnNGhg8O7A2MEuklxNuPXXf5TU898S35mZFhH6w
	 i8wDC+6HjcjmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Joy Zou <joy.zou@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
Subject: Re: (subset) [PATCH v2 0/3] regulator: handle regulator late
 cleanup race with PM suspend
Message-Id: <178551457196.353541.951839175970173870.b4-ty@b4>
Date: Fri, 31 Jul 2026 17:16:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BHxONqPZchydRsr+c1Tkh7w7l4AfO7UEDJQYZt6tTZA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQC9nSJxy4yZhkHjtt/9hiFAOgestU7bciZN/
 i+RZtX4ay+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0AvQAKCRAk1otyXVSH
 0AViB/0bSJy/mKlpbQtL7wyz4h4X8EepNKUWwIPQXl9tlVxvKQ+Ry8ttomG/Z6rW9fh3r51BboN
 alt6N0oxkRzIombK7hRVJJz5+yPQZoCWwnTkE18ZtelVIi+IuMOZXKPO8m28fAvGME7LKzrvYto
 Dhifn2FAGbgov24f09x0pe5POofMXEmSMgnCErU8WXemgi2AC1O4wU/oQ+ibFnSAo88WIHihNMc
 qYXalElfzFG2hvI5w6mXu5Dhe5i5/nuXDaIuUkfPJxKTBzAKPBaN3rJzvT0HD4Msde+50io3Pnz
 4ZlsVMTCIxQE46755Ytax/I/r5LYHVj53jXteT/S59iD0LBa
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

On Fri, 31 Jul 2026 18:21:42 +0800, Joy Zou wrote:
> regulator: handle regulator late cleanup race with PM suspend
> 
> The regulator_init_complete_work fires ~30s after boot to disable
> unused regulators via I2C. When this work races with PM suspend, the
> I2C adapter may already be suspended, causing a -ESHUTDOWN warning
> dump.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/3] regulator: core: use system_freezable_wq for init complete work
      https://git.kernel.org/broonie/regulator/c/03eab318cedd
[2/3] regulator: pfuze100: add set_suspend_disable for LDO ops
      https://git.kernel.org/broonie/regulator/c/7595f50ff822

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


