Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF24CCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuZ3SHNNN1Vp5xAZShrxNbWTVQQOQNa2kom6jaAnmeQ=; b=UEPT8XRn3FaDxxaLj3d82xfRQg
	f24aKGDPrm13+F3e7UHwyhxZSDtLkplud1hl8BlOZiAJLZwQhN3BFtmbxu28g/zjxDR7pde5Z3B4s
	PPyB+072+OJdrAdsvPpb51GD9bAK2nGTK7OSkw+X+RT+9YfO8CFPlujLIm6PVXCT3DK1gLPBuVZmt
	NLYbG+mUcyXcxIwzdiXM/GUyMcMbwjKo3z992aWfJg525T5HR7iTzfClknVtjUpOEZXn1gpdMxrO5
	ZoopAt4RL4E3LBWiFJ+IJgvlroZTzpWvuSWaX04dC13EN4Obib/PUDj3g7tYAxM9XWZJrfLKnoJWJ
	K8y4ndJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfel-0000000EQfr-0SVz;
	Wed, 03 Jun 2026 07:04:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfej-0000000EQep-03lm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33A64437E2;
	Wed,  3 Jun 2026 07:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA911F00893;
	Wed,  3 Jun 2026 07:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470288;
	bh=HuZ3SHNNN1Vp5xAZShrxNbWTVQQOQNa2kom6jaAnmeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Os1CMoqFAVp25r+y0UsHwP/rILviNs6D1TqqUk97aqhLXOnJNQ52iRpgp1WXoQUt+
	 o92XjnqgDhq6+rtAtC9O5qxK8itHZNX4IR5U6/Tv0tKMvBz7fw9OTGMnZ59y1cI1za
	 RZWenFbgKuNSpR7EgbL3oWJrSGoTFhLA0ro8mcv7lQrVvivXI6oPr7BB8/h46qW6TP
	 IjLobi7wngBMmKoOvFKmtc+EVR1SivAJEp1gvFoON7d43ahF0ciKs+xGC1yzSabCBV
	 Kzfn5CUEndwuswPHT5kkRV63+Fed7+t5/lXR8628fidzr1/DzEDmJx5xtsajmW+aEM
	 TUizz1IrC43ng==
From: Mark Brown <broonie@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260527104850.872415-1-vulab@iscas.ac.cn>
References: <20260527104850.872415-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] regulator: scmi: fix of_node refcount leak in
 scmi_regulator_probe()
Message-Id: <178041278238.93058.12658086457449189653.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:06:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JXDHK1AFoV/Cp0lzh3E7j29/nW3z5+WpwgzOwTPLyKs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9INn4KqB7mJVRdOy2hkfe089055/c2uSL1s0
 UdLkYiA/O6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SDQAKCRAk1otyXVSH
 0A47B/9qQm3n3K/t3R1jGMr56sD02MC/VGb2KtA4cjUvQCwJcv7Kf7N2SdNcS1lsCqkvOe+XlhH
 a5L311HyBKqp4uspIQ1IyoZC6t2xWG/+LBynoecUPD0vwQju7WC5cggjAG/Ur4pvh/h4Z4oQijZ
 GkmTN0hNFh90wriHcTR6QwSzdC2C3hm+MP+iPe29IgzAriasZJOXyHac9l0HVTEd1pTXHQpkQ3/
 dbV6SKbeycfNSGL5VFOCOgmjihihq8eQ6ldECGGmZglxQvhg4woaMi/EjbOYPQApIZUOmGTau7V
 OULNeCtuKB2YSqfUzOWH010b5oKhTEesKMIxrC0fDOYBoLPY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_000449_081506_E1317BFA 
X-CRM114-Status: UNSURE (   9.40  )
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

On Wed, 27 May 2026 10:48:50 +0000, Wentao Liang wrote:
> regulator: scmi: fix of_node refcount leak in scmi_regulator_probe()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/1] regulator: scmi: fix of_node refcount leak in scmi_regulator_probe()
      https://git.kernel.org/broonie/regulator/c/fa11039d6cdf

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


