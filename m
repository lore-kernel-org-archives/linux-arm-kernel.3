Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAB2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSJDLdc29+0dWTtYhBL/9vUuQV9ugW055P7dG3ZlZWs=; b=ReZ/0s9MrPWM6m5+zu43B7Oumb
	lJTYLxg0DlrKr8hgc0+vZvuerDs8W2+QLBWosxqkR5p2ACFBWoy61IkIRgwjUD9WhjeZL0ut03rQH
	eL7qSdw2Tnium5akCReo9uRKOZLQq+kMoXGxhgRWPrNjqPmlszIkmitCr9+NDSuIDJWbHVF5A4FoE
	TMUpIpMc6nZpMGmB8C+bzHICgDTijlFaZHb0f9BwFgDprBFDDXKWjlnaVSL7LI0knjEUsH305yN3A
	HbD3FML/NIBaDgunWXXjMwjgTuR1Ll9P+3dXybJit7JcQ8W97l1UG3ILuIWU3dVoDUnD0hIxJ61FL
	6Fg91pYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAeX-0000000D6px-2O2Q;
	Wed, 15 Jan 2025 21:10:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAdF-0000000D6UD-2Cr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 21:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39534A4258A;
	Wed, 15 Jan 2025 21:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C43FC4CED1;
	Wed, 15 Jan 2025 21:08:55 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 215D61060353; Wed, 15 Jan 2025 22:08:53 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
References: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
Subject: Re: [PATCH v6 0/2] power: supply: max17042: cleanup and more
 features
Message-Id: <173697533312.451358.11039936801510899973.b4-ty@collabora.com>
Date: Wed, 15 Jan 2025 22:08:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_130857_634362_C7EFE81B 
X-CRM114-Status: UNSURE (   8.46  )
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


On Tue, 07 Jan 2025 12:31:29 +0300, Dzmitry Sankouski wrote:
> Fuelgauge blocks often are incorporated in bigger chip,
> which may use only 1 line for interrupts. Shared-irq
> handles that case by requesting irq as shared.
> 
> Maxim PMICs may include fuel gauge with additional features, which is
> out of single Linux power supply driver scope.
> 
> [...]

Applied, thanks!

[1/2] power: supply: max17042: make interrupt shared
      commit: bed41f08e222efb6f77a3a68e847b7a1ad994e62
[2/2] power: supply: max17042: add platform driver variant
      commit: 0cd4f1f77ad4f021cd56aad00c1914583c3ddf3c

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


