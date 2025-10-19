Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74D9CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDtTIK2+iDJUniyJe7txR6FBZbVfQR0Z8/V861w1LKg=; b=Zd4n2XJtDZhcnDaXTkN1kJP8TB
	+/FWTkGgA6HAd3pAL/57PwCvKR2QrTjl5Bh5CsBJjdmbsIubaQAW/CiC24QPPdS/3NR8d1p/jjm65
	uwrDxXWzQKS/mDQkN0Aqv80TEO9tO4ph4GTeGCzBIdBQSVgw70saBgTkQ28G+ZUC9kWjKf5XLav/z
	Kr3hbJsekv4P1pr/yYJilkcYtXQyq2ZhtomnTJRtwQuLrmwGHveV14G2x0tJcjT/3GfBu9TTk08gW
	AUXoQTpeIl/hWd5ggVJE0e69MA1P86iwmpuOdmfemHEvXidEswKm9SzCpQJ5JrSxXwn9kOY1yrJoh
	Y0Vhbqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAN3n-0000000Akkt-3FYm;
	Sun, 19 Oct 2025 06:38:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAN3m-0000000AkkF-2DNE;
	Sun, 19 Oct 2025 06:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FE7660250;
	Sun, 19 Oct 2025 06:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1D4C4CEE7;
	Sun, 19 Oct 2025 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760855897;
	bh=zutQ6iQf0byeRZ/GXJXZW1hAG258FPpWvXBWCy3HRR4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=h/iVFhoQAyK3Y8+SGOK5H/0il/s5MM/gUzmZhceLEECMiG6csCzKWW6/6MfkxuALD
	 2F5Sybk1He1fZhw4/5ggAQ2h5Qusv8wEUX8TDCOuoKPXMEf1Au1D1/lfp/HJ1vZ5Kf
	 EmVEvHguGrJYej3vSromF2Qa6CHvJqXNVCivdGrxyKq3FdfPntQZ2BM/3TQjXY+8nL
	 QuYgj9yrnjQ2Vti2EO5MD3Q2jDrl79vUKWvAQE9jtn5gqMt+/juvtXKX2MORZQYlzH
	 Id6h7XSCZUOX9dUF3mbDNW0/nI79xu0k06MiqqBpjeRYHkBzjeg9Wrv0c1xhPLugge
	 ODuLGy0m8u5OQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20250905112736.6401-1-linux.amoon@gmail.com>
References: <20250905112736.6401-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v1] PCI: dw-rockchip: Simplify regulator setup with
 devm_regulator_get_enable_optional()
Message-Id: <176085588758.11569.7678087221969106036.b4-ty@kernel.org>
Date: Sun, 19 Oct 2025 12:08:07 +0530
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


On Fri, 05 Sep 2025 16:57:25 +0530, Anand Moon wrote:
> Replace manual get/enable logic with devm_regulator_get_enable_optional()
> to reduce boilerplate and improve error handling. This devm helper ensures
> the regulator is enabled during probe and automatically disabled on driver
> removal. Dropping the vpcie3v3 struct member eliminates redundant state
> tracking, resulting in cleaner and more maintainable code.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
      commit: c930b10f17c03858cfe19b9873ba5240128b4d1b

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


