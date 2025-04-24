Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E73C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 05:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thhph3q9S0yoEPj7u/nZktZDBQ9U5YP9uHYuhph+DVI=; b=A2e0uYOmPWGLAJTGSxwnLIDRF7
	5R3OtONrqKIJVKl/y9x6GeCWEp9ntdIgGIZynFRhQYc9aBE4Vts3zb+ihwcZNwJUOlayN9BwhV7j6
	3J77Ah5cXM/PSP+5r0dVx3/M0AITJxdDmEaJiH+Sk9T+7S4846Xs7DGw5Zc4k5inyTNBiXQsXzxiU
	f0Q2yvPlxQam0pEnLI+4ryT9Q9PMFlsFr5zQpef9DlkHTu3Hg4die2s2zEXjs7QBBeFm78Qqsd8ME
	2zPX7mZbUT0aZVH6xLpx+Vgec7hB0x94BiwpggOFuLwPqeDuwhvwci0BX2Fc4AHF84ntCOZp7qqbs
	Us/Bt5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pKY-0000000CuGD-3t9Y;
	Thu, 24 Apr 2025 05:41:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pGi-0000000Ctnf-2LgM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 05:37:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CAB468455;
	Thu, 24 Apr 2025 05:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EC4C4CEE3;
	Thu, 24 Apr 2025 05:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745473023;
	bh=Zhj03Wn3IByVJPKb+sDHS8tWFv0G8C9m6nuaATcy4Dc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HL2/vmrBvRRHlyZtjtWum1nvAq0wmELn/TrhD7WRkGVkh62nm+N2MHWzJjlsfdszB
	 UT/IHnD5UjmoRpxrpcGPMDooAQ7MY7bUEjBFucJHe2DNJUhHgu4oAzCzGwCeA7ziUI
	 DnFRJqBh1/pAOEf9Hg3s5DcVgZ2EQ1Y0V+4bLNbbEd9pA+C4zs7ARewKW8ApSsNrMB
	 mcg9hvJd1z2XzZP81iEriS+KOb00ne7yXXEpAQ5M3pba46D6kp3+azdONiWT0avJqJ
	 5bZYJ+zjEVoQ2GbTC5VMkrmf4b/A+ZTkQxi7uIqdHqMji8+GnjFOmwAupJ8v4D3NeN
	 dO6dLVYmX9dWQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Joy Zou <joy.zou@nxp.com>
In-Reply-To: <20250407-edma_err-v2-0-9d7e5b77fcc4@nxp.com>
References: <20250407-edma_err-v2-0-9d7e5b77fcc4@nxp.com>
Subject: Re: (subset) [PATCH v2 0/3] dmaengine: fsl-edma: add error irq to
 help debug problem
Message-Id: <174547301902.316124.419798258552986948.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 11:06:59 +0530
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


On Mon, 07 Apr 2025 12:46:34 -0400, Frank Li wrote:
> Change binding to support optional error irq.
> Add error irq handle for fsl-edma drivers.
> imx93 dts add dma error irq interupt.
> 
> 

Applied, thanks!

[1/3] dt-bindings: dma: fsl-edma: increase maxItems of interrupts and interrupt-names
      commit: a9ea01f28408169431dd3e6464ed2e48539f4280
[2/3] dmaegnine: fsl-edma: add edma error interrupt handler
      commit: d175222f5e90b7e1f23713378823c338fabb3258

Best regards,
-- 
~Vinod



