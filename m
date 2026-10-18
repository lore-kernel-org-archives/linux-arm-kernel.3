Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF1CCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNjcjVDRgVo1MMyTUVNWq2nJccrPEQJlUoGpHdejRwk=; b=waxZxBYWJWW8pE
	suZCWwADvlexWBYzXO4bLWRYzQq0yw4bB3+xO9aymwWMFZNJ5Yf93iwqrHE4ZQVpG2XPc3H0hoO1g
	KtXsK6f7wS5fRNz5BiH/iukxeDjZVxa4Cc1dX4XSMEAzb6hzW2CxG9CZtqjsmnaay9hiW2NLg4u9O
	qYerRhgFdVbIQuYPbimbJelgbKvD36MTV/KrOPc6GImP6zRX2LawHNicH1wTRYc1Eqd6lYv8jkZ8O
	nvcO6z/CPzfSRUlS3KwafSjRnlc0XbbBMPHCFNFY3Y4QAk9NErLOV0Na+wXFo/38tLgjRC1xGiycZ
	PT9GAoRDHzLeMSTCKmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITuH-000000063EA-3bWm;
	Sun, 18 Oct 2026 16:38:45 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITuF-000000063Cf-1ZKV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 16:38:44 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1792341505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zNjcjVDRgVo1MMyTUVNWq2nJccrPEQJlUoGpHdejRwk=;
	b=ZhXrfsmD7AmgkPokPNxyvijzrV4PymNsbwLTud/MoUuXNqAvVanj9BTsDWi0LdrJXHbVvs
	cKaW90CW+vPZBiEeC8PiX1gXM2NiaUrw7LikoPzZXwFmdheecUTKXq6O8qNWn4Ki5Wvo1s
	tkT/3uN7meu9IRBzBZgy4DzxKT7wNAI=
Subject: [PATCH 0/2] Add Apple SART4 support
Date: Sun, 18 Oct 2026 18:38:09 +0200
Message-Id: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nz3cSCgpxU3eLEopIyE91Ek6QU09TUFGMDQ0sloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loASRV2tHAAAAA=
X-Change-ID: 20261017-apple-sartv4-a4bd5eed3019
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_093843_619118_C090A748 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi,

this patch series adds the dt-bindings and driver changes required to
get the new SART4 IOMMU on the Apple Silicon T6050 (M5 Pro/Max) SoCs
up and running, which is required to use the internal NVMe.

The dt-bindings and device tree nodes for the ANS2 are omitted here,
since the minimal device tree is not ready yet.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (2):
      dt-bindings: iommu: apple,sart: Add apple,t6050-sart compatible
      soc: apple: sart: Add SART4 support

 .../devicetree/bindings/iommu/apple,sart.yaml      |  1 +
 drivers/soc/apple/sart.c                           | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261017-apple-sartv4-a4bd5eed3019

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


