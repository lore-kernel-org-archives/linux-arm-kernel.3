Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42183D26295
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4cEAIMGkObW1m/l7tCcZGTXgNqD77j3XzcA+MF/1es=; b=JfeKgGXwfT7BYs7AC3jFLRAi+F
	dieL2wwuvQQkm/qgZ9WS3jow7PVSQf3yNTUWnX6rX6J3JoB69+bEUe3ifw+utQqnnmkiRdVmfUaiG
	RcZeg6HHOrIjy31Yr6ze6EKGm2W6W86BjzHoG9exzt9lPJ76VeNoFQ4/SUQfHQehz2i6jk+eSZwTF
	cHYH1zSP7WtmyFNO5fvmop9ytQWZ/CueFjRNaz/vMcW8m4VS9qfSj7OG+S3c9ibjlO7u7c9e9tqnJ
	K+UveEYwicuZpZAu/1WfBlCM2xttaXKeJK6m+j27htHR9Ftk5H4KrxVtmq95HZyuV37blP3ptvaCP
	wXcsKPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHJk-00000004Mh4-0TWv;
	Tue, 20 Jan 2026 19:23:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHJi-00000004Mg9-3kSi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2584600CB;
	Tue, 20 Jan 2026 19:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58C0C19421;
	Tue, 20 Jan 2026 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936985;
	bh=msgc5OAItP5BP06gHcspzIYJOajROm2gY312bQiYkIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iRpx/RcGX7hbdKjE/fPxQ7pTyEKe7GLTOnqByuIP2kdVUyNwklO2vi9PeJcqyDAAx
	 +Crkkto6oeQgxNaVV0+jMIUsXuVkGO9oPAh4PzLkOAqoScL3NlY0rpi6/z1G+F4Ntg
	 ApJhsb7EgkBP4JE79jkDkUMbjX5r+gCWgt9T2GFWngAzpI7x5ND/8BbzA4tsSTJlXs
	 cOZpjcRQhnF02WcU5OLqhi51WSrYbUydk0WefcXCRUC+fj3s/NnyHW7WZbOyzFed62
	 vHvI8MWhsz9EQqdpKy831Pu5Fyj6xtiMdDdnbFZfjNddNDXKNv7Yym8D6/8kuGGPPm
	 BIfz7aHjtjpNw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
Subject: Re: (subset) [PATCH v3 0/3] spi: xilinx: switch to device
 properties and make IRQs optional
Message-Id: <176893698361.778248.6867023245726406177.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:23:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Mon, 19 Jan 2026 07:06:21 +0000, Abdurrahman Hussain wrote:
> Transition the driver to use the generic device property API.
> 
> Additionally, make interrupts optional to allow the driver to fall back
> to its existing polling mode on systems where interrupts are either missing
> or broken.
> 
> Abdurrahman Hussain (3):
>   spi: xilinx: use device property accessors.
>   spi: xilinx: make irq optional
>   spi: dt-bindings: xilinx: make interrupts optional
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: xilinx: make interrupts optional
      commit: b603500de20fbe15ee54580481c1df4212a4ec44
[2/3] spi: xilinx: make irq optional
      commit: c3608162a95a259c669cf9fdccf900782fa8d902

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


