Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0BFF532C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca8Rj9GB7gLTQs8mTT2laB9prNTZ+3eAHNTErbTCcpU=; b=rdDYjiwKvYAkJQsryV+ez3sByy
	tYih0q/3UiIuAypKG5DG4PiCKi7H9+x39q4vX6zam+0FBxihqeFAwlCU8ECidCDQEvILztrvuWcBg
	QiqTmiSUHRTL+3kwUh99WEwmY5LTIj+U0TqIT4KYROj9qhRL1ZA/5sUqc4shqr9Se7Nzg/5qsZgLX
	aQYvjXx2gl3CXVC1YnsCYRBK2tzAu8AEUTOIEpJUrypVUlHDKsMYfPIVZHcIka+Ijr0Fr+ahymtp2
	gNMTfA7+yB7U/fWeaSoxCpi30FUrR5oVD6n1SJ0YvFMw3cjJA7hpr5eU/hgxBsFuBy5hu6lUHj3bb
	Wv6A7klA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pNP-00000000DET-2tMg;
	Tue, 24 Mar 2026 00:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pNK-00000000DCr-45zn;
	Tue, 24 Mar 2026 00:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AB4B42A44;
	Tue, 24 Mar 2026 00:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F343C4CEF7;
	Tue, 24 Mar 2026 00:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311121;
	bh=BZbJm13p6v7uFdlnM0kKtK0kw8yT1avRjwVB64Na/7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K5jrM1g2tyqh02781ZCofBxdfOJa5AeuqQBRehpGadrtFJkHXqdcRGeht8LNeB8BZ
	 wnlNZwrVhyrC/r2TLmI8LlwiO6e0sYpNbwVaLAK9WMg6TCUIVtlwIHp06aCXyVYq4w
	 Gc2rlipBVnNSjWlhvUY+v6OnmjekBcEA9X+uUcMdDNCKsxudLZUiRRzuDrIAM52srd
	 lsBYYTs0MXVixREYqFhtCQBIrFs3/YdCaT1n9zw6FHBXTvNpm/xEu0qmejb3DN2b3M
	 riBxd2/y+jPldyolcFW4HpkUCsadZYycV7tAy2B0c8xFStC8JdkVjtThnv3MhDdYOE
	 KcVPFoU266lzg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 chrome-platform@lists.linux.dev
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
Subject: Re: [PATCH 0/2] regulator: cros-ec: cleanup and add supplies
Message-Id: <177430554501.811880.4959580213615516944.b4-ty@b4>
Date: Mon, 23 Mar 2026 22:39:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BZbJm13p6v7uFdlnM0kKtK0kw8yT1avRjwVB64Na/7o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbOXyzix15AngIKGeCoU5IoLfda9/2BUmLmw
 ParSdlB6laJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWzgAKCRAk1otyXVSH
 0HbzB/9xIU3u7Z+zr1GTIUwKmtVL/HaOR+tHv7Dd1zvMFDjYaud3AO+A7Ou0rtX9wVSlclihAa0
 qzz09CEtPbgiH0gIJ+QJ29LdkY0HZo90sOFp0pAnnPZjAlCNV7piky8z32ib4/4afkquTY0RDh1
 11FaOv8v2Phr6Ry4R1JzGFzJGn5Dy96V4xKfqpcKQXlpstbsY78YNaP9m7IkNRkuD2MKbRVp0dl
 AS0XhuxxBp8nE/p5nA5njK6KcccA2blVW/0iw7gv7Ashx1uNrd/oxAZVLl4bPMyIW1YEUAxuWXd
 KQ+yKgkhBCJRrhUpuS7BfJ76IXB9M7SnKdPfWnHLpuajuUyK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_171203_071079_E158B360 
X-CRM114-Status: GOOD (  12.68  )
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

On Fri, 20 Mar 2026 16:31:31 +0800, Chen-Yu Tsai wrote:
> regulator: cros-ec: cleanup and add supplies
> 
> Hi,
> 
> This series is part of a broader collection of regulator related
> cleanups for MediaTek Chromebooks. This one covers the regulators
> exposed by the ChromeOS Embedded Controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] regulator: dt-bindings: cros-ec: Add regulator supply
      https://git.kernel.org/broonie/regulator/c/56b7c08a8b4b
[2/2] regulator: cros-ec: Add regulator supply
      https://git.kernel.org/broonie/regulator/c/411eb30f1382

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


