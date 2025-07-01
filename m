Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A78C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qed7HwMXUWfHT+Fe+qM6qntK8b0t6/eF2UleqmXTAeA=; b=SeeJBTE54R62KqOUtQkP0wuHms
	9luEbX2J3XbU4VZMMxaek1+4PzUmJjfmYzdE1Kni+Bei6K+8wHjfp0T5PDEO0TUGS8nSq3bZUm3jH
	3NlkJRWWduBvpPsVf0v9Vj5ji/R6N3Cnw2He+BC5VDL9jO3pbyYCdgTVdWEALT/dYd79SFE1hTfEF
	qqZzSkCOxzF/+dletMptt7AalG9/zuPaCE7Gzpw/oXMMVjyG/tO1gRfQeyd1JTcc7p/NS73ZYeDip
	ZUYDAZ3Ww+UtKt1ejOSFKUZ5342JPRw3fCdTQOrwDi33mdVjdHeV0WT4eUc8EkIwsPwMGlzLGtscZ
	uMHF9QYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVs3-00000004LUy-15SF;
	Tue, 01 Jul 2025 07:57:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVdz-00000004INH-1jXk;
	Tue, 01 Jul 2025 07:43:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FA496114D;
	Tue,  1 Jul 2025 07:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E805C4CEEB;
	Tue,  1 Jul 2025 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751355786;
	bh=krITJM0978IRsY752Yojw78vCX5/sdxxG3qP5TVzy9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t8kzdJvVaW+RVkrfsOqoFvovi3S0LHUUSHi478rxkKO6yyXkKC0cU/ZpGAjsMT4qn
	 1JkXekfymC9MGmxV94LQ3vVsgdkNMzGtbkzV4RA6kbpQlSbs6BSRRlTDlyoIGzI43J
	 rsB5Jm/QFVoS3fB7JKVod82EgqT837jAC7aUQUq1nL/+AH1Xd4MqdZYS3uygK/RZV6
	 N8LuSTnys4A10aRFgkIpfYfOoCv0f5aB/rMATYEsF9+Iblccn5ycEzQoQJDkBViMu6
	 ilZq8DioXEDURnmgVyxW0HPPXHRJ+hNs4XnU9JpH0LcwdwDoez94rgGMeWQI44NdEA
	 VU47dKBUk5MZQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-rockchip@lists.infradead.org, 
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rick wertenbroek <rick.wertenbroek@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
In-Reply-To: <cover.1751322015.git.geraldogabriel@gmail.com>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
Subject: Re: (subset) [RESEND PATCH v9 0/4] PCI: rockchip: Improve driver
 quality
Message-Id: <175135578094.10306.3959145621535083465.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 13:13:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Mon, 30 Jun 2025 19:24:15 -0300, Geraldo Nascimento wrote:
> During a 30-day debugging-run fighting quirky PCIe devices on RK3399
> some quality improvements began to take form and after feedback from
> community they reached more polished state.
> 
> This will ensure maximum chance of retraining to 5.0GT/s, on all four
> lanes and fix async strobe TEST_WRITE disablement. On top of this,
> standard PCIe defines are now used to reference registers from offset
> at Capabilities Register.
> 
> [...]

Applied, thanks!

[1/4] PCI: rockchip: Use standard PCIe defines
      commit: a54fa9e656b38d64761478d06aa8679eae074ca1
[2/4] PCI: rockchip: Set Target Link Speed before retraining
      commit: 7a886fbf4004a990cb7231d64370c622d0eb741f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


