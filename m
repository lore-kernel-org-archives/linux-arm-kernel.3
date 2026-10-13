Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E176CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwsHrhWwBAqFC5XDIDWmcboOdLh7zz3XrR9XYaXosSk=; b=H6XOm0fWljadO5R2KWrQaceewg
	vOLRQU5ogQHFnX8TLZq9PJ2SUkpbPHiHIR8XtEVZiEgamYmAI618AE/y0fR7dJPC3oNHNvFWk0byZ
	XgDSIhaBa16/oewVAUyWb2ti33oEKZhImw3etSuQYrLaIhOymYmd9kh8AyqrSHeo3qII74INFvihV
	XtZHYns3u13Ce6mBLetpswz/Vsr+WhV2zEPU6UPcxX/k/7rolTkFteOSBCwj0hF5co4irwHrKvEKQ
	/NjQj1RSPX8u62VghzNsZ1CFcz5pnXM8dNnXeQ5MeKKLR4zqcJxTKhFJ939Xtzy80u++0z5lE1zua
	U8G7Hb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcra-0000000D0Gq-33W9;
	Tue, 13 Oct 2026 13:48:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcrY-0000000D0GE-1C0t;
	Tue, 13 Oct 2026 13:48:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A076602C3;
	Tue, 13 Oct 2026 13:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EB31F000FF;
	Tue, 13 Oct 2026 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791899295;
	bh=MwsHrhWwBAqFC5XDIDWmcboOdLh7zz3XrR9XYaXosSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZqqqnXTXL5JQQBVpDNrKTM+tmsrFuh0quFdrhPcnKsyO7YbA+lJycODBdX98wdONc
	 xUDQCxz05TL7W75efE5ASsLNQRZLVN5/dBp9WD573ytfDG0rg2Gk6R7d3M/iNI88tL
	 RXJb6RL0tTmjBoZjyP/89KYnxPitqQKJ2XWJyoLAyjiE3wbbIVMxyquN7oWk7nKoNs
	 G/DNMOqBz69isfb+qUI0N2FHmmRXZndeYKJs8ErRvSxrMPnyE7FdVH504bw8/T3/9U
	 V0v7mrpEZLQLR7Z1iMbD/vHjPrNTjS1Th3v8OWXdvYA4WVEeKVP1iPVbQHnszEI5Qh
	 LSdKlEbgaI3Yg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
 Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1781622998.git.geraldogabriel@gmail.com>
References: <cover.1781622998.git.geraldogabriel@gmail.com>
Subject: Re: [PATCH v7 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by
 Rockchip
Message-Id: <179189927768.12828.5970294502454132706.b4-ty@b4>
Date: Tue, 13 Oct 2026 19:17:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=mani@kernel.org;
 h=from:subject:message-id; bh=MJ2L3Ts8++Q18HVodqsi50qgRqQHnU8MLJbv9TbaZZU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqzjaWuJsyJInKTko4kslC28gQaP58gTARVbj2t
 UDexrJ/9uWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas42lgAKCRBVnxHm/pHO
 9W4rB/9dfTBuarNvfVBSNUuYe2/Gdg9P5KVqDROq9kkrp8mxE5shnJedONgaWeuv7GI66sIjIjn
 rD8FbCw8pRxng8BoATEhuSMlZq9QKbV13RebbzDMgpYoPdBjw1frOv6uMUZ6kgyMtdpgUZYOO2C
 6W410/kMupZjqqanx7W73Bg0LNMWuga+2rwyzOr9Rle1AQMco1hT/dcrVbMzU6NKDOmENnyC2G4
 ZFyrxo0ZSnXNk044fYyMemjU2ZwBwMiy3hR6fO4hCWslzj52aK4AN++wb3smZb7GQGuT1yVJU2B
 NGzRdxzYXeyLJH+Yber3rvaSu6wuzO3i3KToeCmVjn3+03YS
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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


On Tue, 16 Jun 2026 12:24:48 -0300, Geraldo Nascimento wrote:
> PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
> 
> Dragan Simic already had warned me of potential issues with 5.0 GT/s
> speed operation in Rockchip PCIe. However, in recent interactions
> with Shawn Lin from Rockchip it came to my attention there's grave
> danger in the unknown errata regarding 5.0 GT/s operational speed
> of their PCIe core, including data loss.
> 
> [...]

Applied, thanks!

[1/3] PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
      commit: 39f89dde0a76b229df7eb356aaf6f444b4f8a636
[2/3] PCI: rockchip-host: do not attempt 5.0 GT/s retraining
      commit: 5988a53f5bf758b2d41cb6e0832c19b9692c76d2
[3/3] PCI: rockchip: drive at 2.5 GT/s, error other speeds
      commit: 62843031ca1f11d1b8e90e7f558c1b3c4cd77184

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



