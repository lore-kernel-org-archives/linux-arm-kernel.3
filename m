Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847B8E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqaQRBKoM/CiH2DB/TnINbMtAw4kNIgu5kDpZuHo4B0=; b=ZRYOCcknW9LCJm6Typ0+N4SaP2
	CRd87THteftYKitq88Q7u2MrAHX2RBJksG6s44Gii6W7jO1hTdWkUL9fz0TnfvCcNSXguEZzeyDTU
	cWbRdElasZtNzyc1SHV/mWlaaqVM2OmHjUK4dcDZcfT6WFmM7RcZ/CcvEY8AGb50/6/rfCgsyLpXJ
	RLLMtNbudllW6I+kCLDWr9nd+uK2gmVnW2mgpGAUOBjAUYBRpjGDvTZCj8ZTcB3SWQmaMZuWBuohn
	CADJ8cUUcWD/ophZMGYX02tHj4kak0+TDhEzmmGlBafY0s40ID0wruHlSMZ2ZrUuJ9eCeSCA+aH55
	HKK/WyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6GW-0000000Fpbz-1aL7;
	Tue, 23 Dec 2025 17:33:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6GU-0000000Fpbi-2EU8;
	Tue, 23 Dec 2025 17:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F242A6013A;
	Tue, 23 Dec 2025 17:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7633C113D0;
	Tue, 23 Dec 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511221;
	bh=m7HpFgNLV9TNM8Cr/q/pRPRVkPEEhFM+P9eE+IsCGLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a63U1Y7t+uP3fy7j+j3rVDyF8Qn7Ezx49gZ3nu/xsZmcuw3nCyx6HRSf1y68qcUyV
	 uUUwYe1HZtoTP6eAX9UfKqsA2cNDXmUzj6Nq1tmHadGGWi5U/pPf9q44xU/ASjqHP1
	 Ytu/EEvTzvr1PvRhWdo6ZR/YqyYsURAC5a2QCPJ0yIgOilgEL/fiGKQRpInOY0Xgw7
	 e0qy9RNwP/xSTSgQM6jM2qpltSl7wWCFZO0nsvmOL1NUe0rXb1tHgEc1hitcNLd5Am
	 IR/2NFfbFtb9A+uRO+nMvcesIq7/r8xTNoGQCpxvB9ZS445mauauZYo+BaC9PFEe6I
	 4vSVXL78iZ4rQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Franz Schnyder <fra.schnyder@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, stable@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20251126140136.1202241-1-fra.schnyder@gmail.com>
References: <20251126140136.1202241-1-fra.schnyder@gmail.com>
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: fix typec orientation switch
 when built as module
Message-Id: <176651121758.749296.4271020306636125527.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:03:37 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 26 Nov 2025 15:01:33 +0100, Franz Schnyder wrote:
> Currently, the PHY only registers the typec orientation switch when it
> is built in. If the typec driver is built as a module, the switch
> registration is skipped due to the preprocessor condition, causing
> orientation detection to fail.
> 
> With commit
> 45fe729be9a6 ("usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n")
> the preprocessor condition is not needed anymore and the orientation
> switch is correctly registered for both built-in and module builds.
> 
> [...]

Applied, thanks!

[1/1] phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
      commit: 49ccab4bedd4779899246107dc19fb01c5b6fea3

Best regards,
-- 
~Vinod



