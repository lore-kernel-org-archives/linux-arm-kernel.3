Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EB0CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kg+A+xrZdns/Gt1pdYxZtMAWhuUXTyI/p/XIqtBsPU=; b=Kt5AEjhNnv7wvRlRWyJ2dF/nuv
	1c1ft31hjwcw6jeK6FyjvZRUBOOYEPiz9aCoZ4RGASGeXcC1F4+rMCquRGM7t18h8XeqdOTcw/eSH
	0N/Gh2tf3P6PzeQN3KGrKybApjoMpeHHlP00WFcdeKTLFtw/EOI7fF7LvUMVGmA8+LJCQId0MhHln
	9I/UCF6YtAALHdW0U7+L0nk9qM/wLGjNYeEV9fFqLC8p+kUnyCeCPp8TszWRe3tVNZPOFNQ388Z8x
	LJlP8Xz9L2xI8lR7qV5qX2imHU7HA5HpKpJGPGZIiKXKgr/eHEZnGczwiNK/QJ+0vaSWhHvb5CNXN
	2quJ/HNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz9h-0000000FcD4-1A1b;
	Wed, 14 Oct 2026 13:36:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz9f-0000000FcCs-2QIY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:36:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5735642D84;
	Wed, 14 Oct 2026 13:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD2C1F000FF;
	Wed, 14 Oct 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984987;
	bh=/Kg+A+xrZdns/Gt1pdYxZtMAWhuUXTyI/p/XIqtBsPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IOPD676Bzqg8w3PuxzHaWtPLz4Fr1BGavAD4ZKepp+VzH02KwLCArkK2JUaJy5VYC
	 GmztHM30ObE8AOA7cr61nyWpFnePu7d8J3Pks9mbG8Tb1fkZ1FOCX+1hT+zV6IL3Wq
	 RYZcSCn7zwieXuGT55CchkP8tFFxchV6wQFcHoYf8P+NMSthRHY7V9RwETLF+mwieI
	 rqQdjhZfKPPDDnVAuRg5fS/cL+dRV/1SKhDEWvSmaRhjaT/wk1X+d0Ly1vCoG7Lu/1
	 lkS4LaGJfzGirFDwp5wMFysaLGVKAcJy5ssoszF04c6Bcp8X/x/iDClgu6PPu0XgAf
	 qEeSpJj+3eNbw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Vincent Jardin <vjardin@free.fr>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928-for-upstream-pci-layerscape-async-probe-v1-1-76412d887baa@free.fr>
References: <20260928-for-upstream-pci-layerscape-async-probe-v1-1-76412d887baa@free.fr>
Subject: Re: [PATCH] PCI: layerscape: async probe by default
Message-Id: <179198497640.63727.7466078377590135207.b4-ty@b4>
Date: Wed, 14 Oct 2026 19:06:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=bIScKkSRWfgKMp5sG5Isx9f9wVbp2+a5UTcxtA0Zz2o=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz4VV1pY342QQGnH8cFuzx4aa0fkm4cHc0AiK7
 +xJU8Y3iL6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas+FVQAKCRBVnxHm/pHO
 9XC+B/0ZHyHZhsScilHuWvjjib7MCUyNylWS37lr4ITYD4lMWo+3rdnEyjgV9vXzxi0hpamuRKq
 dquWb/DbCBlgT5aenUd7qndALvWtkTK//owK7DqOL/W4q4ElEKL7xqps5nrJghYX/vZtEId+dEl
 bRjtbwKSiuUZCh19G4f4P4rvwV1UmoBN7wYsWGkH52WEURKKAbPRTjl+Zpc2G8Dn+SLzceMOSK2
 CTlvecW3mPlO5rSLrxADHJuRiDsZatXJYqtv6wzfmS4Nzb0Q8b3l2bM77KOcBInbRzhTeiEHJo5
 WucunzBLhRoRKzKTunS3JDCh5K4sVhQ1WmsLA6CdqSodHGKU
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
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


On Mon, 28 Sep 2026 15:48:09 +0200, Vincent Jardin wrote:
> PCI: layerscape: async probe by default

Applied, thanks!

[1/1] PCI: layerscape: async probe by default
      commit: fd592bcb77f834564e787b8c809fa01f1af81731

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



