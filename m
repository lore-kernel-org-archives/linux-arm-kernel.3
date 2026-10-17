Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6866CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BN2a5NcxG91rbh0FFEoErkrQJ4cOoOgg1Ae5R2Rh4k=; b=nlGU4HuCuc2nwhByVwgngk8PAj
	wuGZulmNyKyTnpLahCuEPeC9k50MlZlsOOLtYHpCYhmIl71prlFizp/B2/ySSuO0bNMqjRVO9zwCd
	b5Vi+DesxW8cK7KflxmAN01qh6keA4PVUE4EFfzeXzudKZq2tQHaKpe6PIAlwrq2JKyyQNJhmJ80k
	Oap19pKIGS8BbKjA1itSVXoyK0CPtP4dFwn9Zuh5m0wKvERj9qS5VMGYpPK9Abosns3PKSqZE9UkE
	Oo7Q1mhhCxP0xpxjs8LiM3U5ch+gzK9aP8wfLOINE5YaA07wypKludd70O/LFktgpfV1oLqAFdrdT
	RxjXJpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHwqB-00000004RWd-2RJ3;
	Sat, 17 Oct 2026 05:20:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHwqA-00000004RWU-003B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:20:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B8BE6022E;
	Sat, 17 Oct 2026 05:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570DD1F000C4;
	Sat, 17 Oct 2026 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792214415;
	bh=+BN2a5NcxG91rbh0FFEoErkrQJ4cOoOgg1Ae5R2Rh4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jVhRD4VOQnfBlgQy12tBqMq1npNEpMAHR98MVp0ZLmA8skDya4z947MCM66fnK66h
	 NwmILDiZLgtkjCMgFtMIlo/9n32+O/+erzBcW36+qzemKNHhmWCHQ39ZopgQm9Ha3u
	 9ps8pLqa04AWTT7jFGj4Seofl/YeNuwrqqVftewS/ytZtUXQqf2sfdSrqeGxYeq4Sz
	 LEl5hMyar0JN37r+/Q4Ff73CG8VBCoxMYoUYLYUlVggq2zzLk5fFJakrx5EbtvZO6X
	 INTCae9HuhwL53S3Fvl4ea1hbityB04EJtVlVd0sQArdhWqjgCSgpgRTLtJKCTgHKN
	 Awnqz9CP5LtkQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev
In-Reply-To: <20260924083429.461746-1-peng.fan@oss.nxp.com>
References: <20260924083429.461746-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] PCI: dwc: imx6: use regmap_assign_bits() for
 conditional set/clear
Message-Id: <179221439258.2165.18106999350998009762.b4-ty@b4>
Date: Sat, 17 Oct 2026 10:49:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=357;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=C6xSwQJLZdYpqw3s2Kwdy1fWQP8TOCHAaGWqZDEm7ps=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq0wWH1v8anA90InpGpuoBX7GtYOjmX2ZdUY7ns
 k0XskPTcRuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatMFhwAKCRBVnxHm/pHO
 9dB3B/0VSlMrEBrkhftm9VoxrrNVzlMYISIts298KImUkOKQst5BGFrLG/R/M9HdNVk1amNzAHU
 ncYZYmVEeKlZ+RRaC+iW7DZ9YWEdrMcF91DwPai0J8nGMpD8JHSKtsLOxfVboSOT6KuUwG9JVMe
 sT1+MhEY2WyyT4PNRnU5hJ7L1876Zlsieupda75tgP8lbjfBoQKYhMJVd2pdCHSI4Ues9MQ9Gvb
 1uCZDPH19dqKiTJDpQf2vmHq9CkQHCgEaVc37zXtjd4rUh3kTCpgNNwISOa/LSI8FX+jroY5Rta
 w/SmpkOSNgdOMnqj+O7rwVuMIHfSVEiOu1y7xt3wsAres9xx
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


On Thu, 24 Sep 2026 16:34:28 +0800, Peng Fan (OSS) wrote:
> PCI: dwc: imx6: use regmap_assign_bits() for conditional set/clear

Applied, thanks!

[1/1] PCI: dwc: imx6: use regmap_assign_bits() for conditional set/clear
      commit: 8f509a936cee46939f8bac231066e0f8a5d62bd0

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



