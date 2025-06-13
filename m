Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD4C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QzfxDUxZ7vG+0KoipotwP1mLEGJtvv01ij0pCLa6Nk=; b=uzHdjB4X0ogoCTHUPGiawHy1eN
	NniPCyOIVx60axFY2kqIzWAqIkpDQ/8y/ENebK9PEP0jEU+wPu3JVGfm58gOyWf9ADROD4EBpmguE
	IeUL29wczzShTWbzsDEOOwlqs9w0Up61SRluFw+Wf0mZNisxhnqot8cDRKqgswsisgYqLR/rJAXOc
	/5sjQRLRlPSZtYZgco/jl4jvlr12yT4DnNkA726rrs8H8SgHnACByO32SjbsMolgGNAaDPFDz99Pm
	CAYZYMdGTttv9wpPv0wHFbMBC//AFYrrCG1i9HCscbMHgrc9SDOIJMbEX29XQYRNpZ1vbk6C8NS4Z
	qA9LVY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2dX-0000000GCnG-0p38;
	Fri, 13 Jun 2025 11:31:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2Ui-0000000GA0X-34rm;
	Fri, 13 Jun 2025 11:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E6CDA50CFD;
	Fri, 13 Jun 2025 11:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7174C4CEE3;
	Fri, 13 Jun 2025 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749813767;
	bh=5rxzVe3Ow+D6PP7e26gxm2BHAwg7Xs8xFPoeYwGwIMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NE1svWmagWMxeZM77Y3Xv2bWeIm5O6825UTWoqiVxpHm/8aD1cOwbkD4BzKC4LTcK
	 KvJ9sjONO7KAf/4C0i/lCYjDMGi8IKiIC/AXVcPlcIpS7zB4ZyuztQMwRHCCqE3IsH
	 DYqPgOY+qQSP5xbU/940AE0XLq+RDGN0ChENch/EJmbeIYu0UsPD3D19/F0anAFeWw
	 apAl8vKK4vfAZg4PjA1UFv9TMEdHphvcLKzZwGomh9x6LchEtOWOHxxhNb45Kpj6QL
	 7Um/DAUObxd00UaeXa5fA7gF16U9EGsHbnBAAGbj050vKZql1RVysAgLQPi01HMWq3
	 BdcFHPDeifJeA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20250613101908.2182053-2-cassel@kernel.org>
References: <20250613101908.2182053-2-cassel@kernel.org>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Delay link training after hot
 reset in EP mode
Message-Id: <174981376322.39040.626028156798612367.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 16:52:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_042248_847015_363E87C9 
X-CRM114-Status: UNSURE (   6.40  )
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


On Fri, 13 Jun 2025 12:19:09 +0200, Niklas Cassel wrote:
> RK3588 TRM, section "11.6.1.3.3 Hot Reset and Link-Down Reset" states that:
> """
> If you want to delay link re-establishment (after reset) so that you can
> reprogram some registers through DBI, you must set app_ltssm_enable =0
> immediately after core_rst_n as shown in above. This can be achieved by
> enable the app_dly2_en, and end-up the delay by assert app_dly2_done.
> """
> 
> [...]

Applied, thanks!

[1/1] PCI: dw-rockchip: Delay link training after hot reset in EP mode
      commit: dcca6051a220484f0c1a5cb018f3012735067254

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


