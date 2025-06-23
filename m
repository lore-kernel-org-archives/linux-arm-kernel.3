Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F5FC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOO8Nt0SemsIfmPf8xeaFPvh5XIj6witwEVqMY9r1+I=; b=qmW32gpx0QPKGsnKw1Ws917ATv
	m/mxVsB90B+FiyyP2msrDTSNuUFLcnJ0v3bXgpSeKC66dQaxCexdal70d0PmrPU7Ru8SWnwTBczTp
	iFY5l/GmAbkd/CrywbaaFoc425aodAkzt6tSuPs0sRSbTnDP0TNvbX/0KbNJqRyhljf88OikvmNte
	0GKy+r+IK0qDr2NOieG42Tvb7GMPepYW06l2Q9FGxZ4dvYdal3VTu5/qLnbAYqk5t8yUagiR4xy5E
	OQTcbfxEIUVZW/2fvRpwMrOaq2RqhTE8I0ADWCmDjdy2StGRaYdS3bzQtOfZmV76dABiplbn7Ta60
	PG43lyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThCE-00000002s1i-1inx;
	Mon, 23 Jun 2025 13:26:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfjt-00000002ZSX-0hNo;
	Mon, 23 Jun 2025 11:53:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 536796112D;
	Mon, 23 Jun 2025 11:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5CBC4CEEA;
	Mon, 23 Jun 2025 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750679608;
	bh=l78T6d0rVhac0qoO9WlfEVxu95VKyR0dZVkQUB5NHpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s/8JD0Pbs7L0ea7UysC1tt6PzIvHh++2KQZ2hHdIqnVHpHgw869d/o8D0gbH4kI/O
	 6MQIN8XGARuX7wtMvvdWunutPAd5DepDIsuWEtHGv5y+Tt2F69URD1eNBgmt9ZMOJg
	 Gb+w//+izsZIhvRar86VkH4/zjcTcu5w/ftthUpVBxefXYrIRnozObtlZ/3p5lZroa
	 iwi3Ev45TeCTh7VhlVyWNrOxGakG8JmD3/61t9W/lJ7+4yGzednGUbGCv/ZvAVWFMb
	 YZF5iFrRFgkTKhnwQy2ouycmWAkSofna7Z199HkIEcxQbBqq5kKSdU15uTlzQpxgmq
	 QW2CBIb5FjsbA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, 
 jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jim Quinlan <james.quinlan@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250530224035.41886-1-james.quinlan@broadcom.com>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
Subject: Re: [PATCH 0/2] PCI: brcmstb: Use "num-lanes" DT property if
 present
Message-Id: <175067960711.8006.9074251471563711510.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 05:53:27 -0600
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


On Fri, 30 May 2025 18:40:31 -0400, Jim Quinlan wrote:
> v2:
>   -- DT bindings: Add default, maximum values for 'num-lanes' (Rob)
>   -- Add 'if' clause to clamp maximum requested num-lanes
> 
> 
> v1: original
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
      commit: dbb1258daf75f2b98e465ba5a0e26073eda6e539
[2/2] PCI: brcmstb: Use "num-lanes" DT property if present
      commit: a364d10ffe361fb34c3838d33604da493045de1e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


