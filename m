Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305D5CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oolI/9SZA77QYLIGLWodHJi/GBANzzG46vAsuvdNsiQ=; b=y4xmWgLvjvR7lGAnb8BoizUHll
	8F+iGNqJDXodK2AbmItOJewPj5TEGO+JEXL+CsD2T8oikbKtJkXPbFBe8BsHMVaVm6wfJYScK6VCQ
	1B4eQqg3xsevtFO1XTuwbVscS9ZBa0nQHGTwHNrjjA3/1tMMVHeXH8M1zbS9MrN0Bu8HR5No7GWbw
	X3C9lZieseF8U6yd5UDFsHBEmortpk9jAfeEMDh1XwxfCmIYzF1Rc5pO13pBnOcIomHAmZmOnFoQD
	miU2KkolEZ2OPrs5BO/etIxmrfhu+1oVOcetqWQ+FA8znPA4el9tXVXa5YDBsWEz2v5yIDeWZh6YK
	xrMTeowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJdQ-0000000GGBR-3alb;
	Wed, 27 Aug 2025 17:08:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGEs-0000000Fali-1o1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 13:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF46F434D6;
	Wed, 27 Aug 2025 13:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04AAC113D0;
	Wed, 27 Aug 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756301457;
	bh=D+f7sGcwgv+7yWZQKZNxbE+Fo7kTjohDpe0jO+6Mvf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SDGuqgFzwsVWUQYALgiMql1WtTwrAAGmN+lcU06/ydR38GFlkdnJk4MjY13lN091O
	 nbSm/HmrEp2DGulV6STXZx7lRlLpOWXIgFzxJgDqpcT2QcXynUSiD3/5b6VNwjVVE+
	 s98n7JEiFTK0lzA+HvznK/KgOY/5iQCq1Ozd6SOrArJLcVekwVJhXAKYh3xtcnc3cu
	 Ezv6P9xJbF+gt6r4iUEzXo+7xOeihSfkggBJby2Ivx23zB8EmDJ0WVJT/VxbvPWWtd
	 OK0GO4VpntQwI5PxLs2oAXy80GcquzbdO3ksrlKan/QOf/7xUhGn02GvDRccerFUJY
	 ehB/Kr2FWvGmg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linus.walleij@linaro.org, corbet@lwn.net, p.zabel@pengutronix.de, 
 shradha.t@samsung.com, mayank.rana@oss.qualcomm.com, namcao@linutronix.de, 
 qiang.yu@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
 inochiama@gmail.com, quic_schintav@quicinc.com, 
 Christian Bruel <christian.bruel@foss.st.com>
Cc: johan+linaro@kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20250820075411.1178729-1-christian.bruel@foss.st.com>
References: <20250820075411.1178729-1-christian.bruel@foss.st.com>
Subject: Re: (subset) [PATCH v13 00/11] Add STM32MP25 PCIe drivers
Message-Id: <175630145053.10268.16196388698773824322.b4-ty@kernel.org>
Date: Wed, 27 Aug 2025 19:00:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_063058_500011_7561CB7A 
X-CRM114-Status: UNSURE (   7.02  )
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


On Wed, 20 Aug 2025 09:54:00 +0200, Christian Bruel wrote:
> Changes in v13:
>    - Rebase on pci/next
>    - Replace access to dev->pins->init_state by new
>      pinctrl_pm_select_init_state().
>    - Document pinctrl PM state API.
>    - Group GPIO PERST# de-assertion with PVPERL delay. (Bjorn)
> 
> [...]

Applied, thanks!

[01/11] Documentation: pinctrl: Describe PM helper functions for standard states.
        commit: 272dad3f84004079328e8f36b2292e7297460ffd
[02/11] pinctrl: Add pinctrl_pm_select_init_state helper function
        commit: 08383cd479f8212fafee2f557b58cfd48818bee0
[03/11] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
        commit: 5ffa3d2f43a487f60e9f6f692aa8e22251446755
[04/11] PCI: stm32: Add PCIe host support for STM32MP25
        commit: bb90c3dd42adba65fc2f26ecb16c1d27d74fa68b
[05/11] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
        commit: 89f6842156333cca9abb8e641e28100b708bed00
[06/11] PCI: stm32: Add PCIe Endpoint support for STM32MP25
        commit: 679ebde120900c246925a374ea1ad39392d6e84b
[07/11] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
        commit: 3cf6b1bf4d250c15ebe537d55b5e09a902c41971

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


