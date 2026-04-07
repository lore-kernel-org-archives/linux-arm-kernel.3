Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB284FF5125
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM3MnYvM3wFVWBdsrYfhAwVIUMTw3f7CK8mjoMEcMFM=; b=nQerA018JKwCqotxXTWzWCLXnw
	wH/BM0TnMQprpDkbHTXh6CLicctuoasEGc5ynpmp/Y8Ztu2Q0a+JScXm4Bt47SbCyt6CkgDkMgJJh
	Sl4SyfAm4cSr9H21E+m5atExFA3V/vxnE5zMlxFPVv982u9M7q/T9PbG1D+n7DmqA2rpdsv4BR0zG
	oAnp/byyz1DgazklRIJ4sSeCS2ORpfzv76tQYs5H3jXCubq0mkJ3G7nQZ49CHWSixbDQaz5T/2Wqa
	Il/JDvTWHEIoOx2IU7gexRxjLTX9vDXlWk2uSED59gMIRTyjiHf17+MejDsCCsiXGImleM0vLmkG+
	NfkjrXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9XW-00000006oJT-3Bk6;
	Tue, 07 Apr 2026 16:44:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9XV-00000006oJG-0ljn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1E660123;
	Tue,  7 Apr 2026 16:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C985FC19424;
	Tue,  7 Apr 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580272;
	bh=66I77DD+WytDeh9AjfSnO+ZsYGkQ6+hIC2mvN5YxyAM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jjnWSs889V7kt+xaxcrZzPiI6fKzEKoc1RYbCsLizHENxXInEeACy7tewBx0/nl1/
	 Ul/KDVOiFwQO/usb84l/NJ54E7+Kkz9X0GD4n8Oz+LJ5pcDSv5PKCXtbHv4Ka5zcNI
	 djAXrcn7uH3KzBlqdH9EJe3zenXq5gZfbqOeqHRwUkgEIQeDWGDTnlx5VZopWeqp8r
	 3Am0mrAwpZkgRippu8hEqTQ62kEWzxer/9EnbXRuJrPaBeWs3DxhGZFHWkoa9keJtg
	 khcdVMJ8RTPWo8uCNxqsIMUHrNSGWaWXshpykKKeg9Dum3/Hw0ipyo3QczMHEtqj+a
	 ARE6rBY+R1ZTA==
From: Mark Brown <broonie@kernel.org>
To: hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <b2deeefd4ef1a4bce71116aabfcb7e81400f6d37.1775546948.git.xiaopei01@kylinos.cn>
References: <b2deeefd4ef1a4bce71116aabfcb7e81400f6d37.1775546948.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH] spi: uniphier: Simplify clock handling with
 devm_clk_get_enabled()
Message-Id: <177556396963.37897.1195757316005441316.b4-ty@b4>
Date: Tue, 07 Apr 2026 13:12:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7a3e7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=66I77DD+WytDeh9AjfSnO+ZsYGkQ6+hIC2mvN5YxyAM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1TRtbfHYaVyeZGshk4QPL5GAixQqfgbNbCGdo
 FLljBM6Mq2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadU0bQAKCRAk1otyXVSH
 0Fc2B/9VcjmkYZARxUL1PvF4DXiw7cDO6txyR+8Ba3cmRA4qNJYElm0uR5kXKSa1XAh8u+q3ubI
 puVsF1pkkdIOfQFTLfjcUQu5B4Wcuzh5vz86OyEITG5ROMzVDzbgx6i8DJ0shGDzg8KZHCafiFH
 WGxyg2MhRozIPNg4vDcU1JWP+Y1KZ6Y73UQMlKzAXasW4S8YUazTcFKnHjrcF4RAiV6WPmsk7FC
 dTV8uQjDwa0E+gW8sIbdCjHgTE5Ha6db1vKDQLKIOKkIUpglE++fwcw+51duRu0o/Igl+ylT+cb
 s/zJKjkxqG9XNLOgbGdJpsblRVACU7Xg21P8OqXxb+NSxwMy
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

On Tue, 07 Apr 2026 15:30:28 +0800, Pei Xiao wrote:
> spi: uniphier: Simplify clock handling with devm_clk_get_enabled()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
      https://git.kernel.org/broonie/sound/c/fdca270f8f87

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


