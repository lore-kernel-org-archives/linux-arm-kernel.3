Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51729C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 22:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5ZxICt6RyNBBcsv8PtuLdI0PmtZ+1CM9RWdDcC0spw=; b=DzkrDYGDv5tWXPEHu/iIqeUABI
	NT2tnE8FKzTlDyEluemK+9uEOpkKb/d/0brdUo+d/sbsInvOIlpwmZ+5Kjx3yvOrgyo3M8N1Dg9Bh
	J9XwcgEmEbd9Leflb2/oOBcVL+uPZ02yiXT1q5lMTTxp4HPNMnBCEu09QYhYc1k8oF8/JTJPavQKn
	nPQDWcoUvCTMcjKMYluhVFszsuUYlF3WQX0mDUBkJdPeABV7KUcEocCGt0s5oc9qgmJ5q6nxcJrUp
	dgHpPgA+hJds6qpfDueVp9nAluQbY5RI/BByHIHu7FR8IB+xELSTPeVmo60vWSmiZbvmQxXBOEAx3
	VDaAnAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EvZ-00000004llM-2Y31;
	Mon, 14 Sep 2026 22:13:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EvX-00000004llC-3P9M;
	Mon, 14 Sep 2026 22:13:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36D2F40E24;
	Mon, 14 Sep 2026 22:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20CF1F000FF;
	Mon, 14 Sep 2026 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789424007;
	bh=w5ZxICt6RyNBBcsv8PtuLdI0PmtZ+1CM9RWdDcC0spw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Uj4LsHMOv2FGfDoF9rWK4Yze9xM1bckOL93wswNtVvUhZxSgcjGobFHCA3legYEIw
	 qsbSTOfaIsKO8gOagLSl+HlizS+wzUUECQp8mypuIrE8OVuKJaNccmbQfMe5ne4zz1
	 SE7nA3NPqBzTanCWwpeO6pCYdaB/25q5w0IzON2HWvSSxFXkslM17EdRoDorwbqyFx
	 CSjQp2UXqmRjJKux3r+XWHoJ1nSJYG5epBiodyfgPI6H9YKwQXrTjFqig7pGWqRXbH
	 I8MSYSOwTFxGhbyonjMZtVtkkNk+TTEO3gKDakx0BFyzAbLDL/I+5JplKm1DkGaT7f
	 nVzAqJTOmscbg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexey Charkov <alchark@flipper.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
Subject: Re: (subset) [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses
 from the OTP CPU ID
Message-Id: <178942400455.686568.7345103522777056647.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 23:13:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 02 Sep 2026 17:07:51 +0400, Alexey Charkov wrote:
> Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> memory, and Rockchip bootloaders use it to give boards which have no
> dedicated storage for a MAC address a stable one anyway: they hash the CPU
> ID and patch the resulting addresses into the device tree they hand over.
> 
> Kernels started without that fixup, e.g. straight from the SPL in Falcon
> mode or by any other loader which does not implement Rockchip's derivation,
> fall back to random MAC addresses which change on every boot.
> 
> [...]

Applied, thanks!

[1/4] nvmem: rockchip-otp: Serialize reads
      commit: 798be42019957b28b4fb897d7f9f6cf6712247db

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


