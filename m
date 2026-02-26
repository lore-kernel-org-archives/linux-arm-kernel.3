Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1B2FC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OkQSZFFyrrUC2BfgblnLh9wWBJ1YRgIvBo/bG0tqOyE=; b=AbZvggpmZqvjZd
	YLrtRZw8xJIaH+iQwt1KjhseVdZ23KkvJ0VTxfSmxlUZZb6BaedE5zD7+axdlup5pM6xYTZ6/USoF
	PBBS8e3F3MQt/T1X3vef0pgPJlLD2NUuAry6tR+NfdrZesaWVnaIolAa7PmKlK3SmylooF6UlVU0r
	1Nn/gDS7bhhm6wbD87q6Rs6U8+Tbblj8vsDv+O779L+2Jz3hXBbIIPo7Ra6+hq1q6sK34BT9uuqLs
	WEtZp5dBulsQjSAyTaRQDMOG5UIG4RbN9G5rOOKijaJrHhCgCT5tMAQK7K6HQXREtWV/JWQ0qa71e
	OH70hqyKkS/iXFe63J4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAJ-00000005iwS-3cwV;
	Thu, 26 Feb 2026 08:56:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAI-00000005ivm-3IFB;
	Thu, 26 Feb 2026 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OkQSZFFyrrUC2BfgblnLh9wWBJ1YRgIvBo/bG0tqOyE=; b=MHpvMR+HJcVMJsjDNrLkp43Sd5
	MnprUNgUqBeo4hrUKslHXt72xH4iI6q9wKur79cxS46eCmFqQGplZYAMqDoeIFqLRM9AtLGeXyMke
	UyUqAUCwmsYwhB8bf1RzGDnewoHEa/PwpQB6AnEU6qajMDvcTKb5j0ewJFLrrNlSVM8db0reXjWdq
	SiDwU+VVuQKvZ9s+hE19RbqLzIb2JIeAMJNm6VNvghhEs5PUulEzM1vUlCj/gHJmAMeOV8MP5AMyW
	uHamoLQd3roqUVtWqyefA5tLJ/3QvQETfLjBC6Yy8k/FRiFwoqa9wxf5HiNF/Ha/bMrl5wxM9yvHe
	8M1QOHug==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAF-0000000AYYD-2Rz7;
	Thu, 26 Feb 2026 08:56:09 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OkQSZFFyrrUC2BfgblnLh9wWBJ1YRgIvBo/bG0tqOyE=;
	b=2Ep24RiPqzuOuxyGxEdrdJ9YSafyR1QHD1SGv7b1SlZWRRLAQ8UyV4mbAT2pfTYACIbP7t
	LMcrp8cis1QxEmknYeMq4fSobZACGhvKzV3No68xGltcUQl5aaAWTZvK4vM3/dpVsbB/TE
	mNRPX/Z9ROqZyfqCg6A267mUjrhDAL8I1P+xNqIF0PZFrwE3G9vZlsSKZfAPe6TQUo+7dy
	KTDdQcNXyGcFNg44CiN15QV1/fGywS0Ju//Bba89GL9dMiXFW8bzOoEIAPsplaFeld3aAg
	lRJM9vVDiDuPe/W3Z8X8ixW/HCvuTC+QSwdy76NkPlG1RHUQRUrseP5cGesN7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OkQSZFFyrrUC2BfgblnLh9wWBJ1YRgIvBo/bG0tqOyE=;
	b=DO0kT5RxRb5bp2rt4zpn6PXZsmzYU1U8k523a//KGYFu4ouP5GRiEjBqkpo0WWr4wWQbdj
	mMN88RqXUahLBlDA==
Subject: [PATCH 0/6] arm64: dts: broadcom: bcm2712: add missing nodes
Date: Thu, 26 Feb 2026 09:55:53 +0100
Message-Id: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJkKoGkC/x3MQQ5AMBBA0avIrE3SDkFcRSxKp8yGpoNIxN01l
 m/x/wPKSVihLx5IfInKvmXYsoB5ddvCKD4byFBjiAwmp1HQH4pn9O5gxXmydgpV6NqaIHcxcZD
 7fw7j+35X039cYwAAAA==
X-Change-ID: 20260220-raspi-dts-updates-cb11bf3f8742
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=1353;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=C/9GPnXYkyWxfRHbhEaUnI1yU+VgMkJUEetx8Xp81uw=;
 b=w/S8oyhplLSwbQTa/S3z3GEKRyq0wHLUfWYDiu+b5PaQmIsKUpo87C2kRfzLeCZjt4vvyiBBe
 oFw0IBSC8stARtcN+4IF/9Lvfxh43nSrhR5l5UJHBgjgc3BF6MZquvn
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085607_867616_EE1AE6E9 
X-CRM114-Status: UNSURE (   8.11  )
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

This series addresses some missing nodes for the bcm2712 raspberry pi 5
and includes some fixes for the -d revision.
I identified these while working on the camera interfaces on the
rapsberry pi 5. All the drivers were already there. Only the devicetree
nodes were missing.
As I don't have access to any datasheets, these changes were ported from
the downstream tree (https://github.com/raspberrypi/linux/).

---
Gregor Herburger (6):
      arm64: dts: broadcom: rp1: add i2c controller
      arm64: dts: broadcom: rp1: add csi nodes
      arm64: dts: broadcom: bcm2712: add camera backend node pispbe
      arm64: dts: broadcom: bcm2712-rpi-5-b: add pinctrl properties for csi i2cs
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for pinctrl/pinctrl_aon
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10 interrupt

 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  14 +++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  24 +++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |   7 ++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       | 105 +++++++++++++++++++++
 4 files changed, 150 insertions(+)
---
base-commit: 44982d352c33767cd8d19f8044e7e1161a587ff7
change-id: 20260220-raspi-dts-updates-cb11bf3f8742

Best regards,
-- 
Gregor Herburger <gregor.herburger@linutronix.de>


