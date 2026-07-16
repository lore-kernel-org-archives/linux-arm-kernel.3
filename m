Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F9AC44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4coRiwjvVBqf9n8LjEuWK2QLrVBUAzdegtEpYVf9CGE=; b=2FazffZxZUFZ1TUM7BtFyAkevC
	S+3kntbS1sHJyl2wtJVRt5tB2yhUajwr+A0dEkg1X/d7euL4Z49PmDkgzFVYyKvshRp4Hcg5ZkBAr
	cVhmXBzEdNxCwkPa7ZV1S2w3BJjOIg3iOKDhANZ+lk0DpELYUnlgiJPqh1obRZ7pYwUkq1TGP76wa
	cgz5AvkzcCtqNUzQ1/wmkDsrg42XFCPeV6hgxCr7B0Ag22cLLgMgsq9bvVVtoVRKAe1BmJHJm6abP
	6B7DXzGpTYKT85K0UwVSauyG3dHI/SFOkGp/Shv/Mb1+z9WNCVpHXaRw71/eZSMhBgdZnZT4mdSta
	YivVXauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wksq9-00000003Rsf-2Iy8;
	Sat, 18 Jul 2026 00:23:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wksq8-00000003RsX-2cDZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 00:23:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8666D43E1B;
	Sat, 18 Jul 2026 00:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18471F000E9;
	Sat, 18 Jul 2026 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334215;
	bh=4coRiwjvVBqf9n8LjEuWK2QLrVBUAzdegtEpYVf9CGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HFKXG2Q8LPsQkg/og7HN0ZZVHzu/p+orGhphIVJ6Yklf6ZH489WWo9MG5f+Tpf8fI
	 WWT6sBE38u450BSoeZPI297irPC+k8JlMI+OUJIFPmwwXO98KlZDRsAE5s8gXFGM8T
	 hEgDt80fbjvoBce/1TY2eLirwGWuahIFJyZeOImLfN46Z+9P+4BGaQ8SabVDRC853+
	 J7BPdMKAniK07rgLnr12UaRTFfWUy24bQ96/U1Wunr70+E1zB7YXeUiSY0T7B5So9m
	 W1QQpVa8vsQKgAFVGElm+VEVU9XKNxZ1D+ovK6CWl//Gq1SrHob3zgEaXSzlFqW6VT
	 Nhl0nUTEQCpcA==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260714192228.1639768-1-ninadnaik07@gmail.com>
References: <20260714192228.1639768-1-ninadnaik07@gmail.com>
Subject: Re: [PATCH] regulator: mcp16502: Convert to dev_err_probe() in
 mcp16502_probe()
Message-Id: <178420670127.63368.9042373456774603095.b4-ty@b4>
Date: Thu, 16 Jul 2026 13:58:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SqddXHxoXAS44jnllTsPz243Fteup6i12LmMS6C4/uM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWseEiBgo3xyo82UaljCOR9Tn6rPG3NzUrPvhQ
 klhEhsi7M2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalrHhAAKCRAk1otyXVSH
 0MQ2B/sE5oVaySi960GBX3VYSnhem3ODfMEnMaaccMh/1EwPZkvQGB5lJ79kdGeMACOhV+hqg9X
 q4rHN+i1LFDayg3ft9ZJAsJVatldrCsAHUxv+jo5z/OAVG8FSYtEk3rLK4MNi34mMIZ4eOhilMI
 UaZmzrX2RTHlvSPJMWooAUI3hBN7jOCx5ZIbRlCNjDfqZTbCl8FVUHX8q4AgqPuyIJNgNm50KHX
 yO9Et/3H4gKGoMbnpIUlfHSOtU2RdwE8l6Mkyw76VX1I4P3SkulS2HjvHpUnXFOE8G+qgBYFvNi
 AfHD7nIRujT3opRRj3aa3OSEJtFmCs+XShWwKXHNf2nrbbuD
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

On Wed, 15 Jul 2026 00:52:28 +0530, Ninad Naik wrote:
> regulator: mcp16502: Convert to dev_err_probe() in mcp16502_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: mcp16502: Convert to dev_err_probe() in mcp16502_probe()
      https://git.kernel.org/broonie/regulator/c/25706f1ab9fb

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


