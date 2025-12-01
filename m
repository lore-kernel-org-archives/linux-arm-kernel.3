Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B75D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K96yAKM+xcrHhzOcR0zBqIliZQSixR1YCX/rN6x1xxY=; b=dt9F3b74lLmE+GzzMF77AIsD/M
	WFJk+UcYsRv8iKWbwv+S4ar0c5pAvfujb1ADe7wdevpYaj5LJZwhAZEyA4c6u1B/hrAKE4WWG5cPb
	NFoL9Knb3xavxfRIDOVP5cdopLHF6hcidz6BcfvZ7VMvdTOAbflj7VeYTu9BXd0wjv8cLBmkzle+J
	pOg4R0GIadukLd5vDGLUkdGMKgRYrPjygz3j1tG9/U4wSbjTNxn385Hwea+wjU/dUg/Mhw7TOZy7N
	5Hdo1sceXl/9fPFRXk9mXnwhHyPqjcrI/Jmf2ophKu42AkbM/Wm5tZHiU3ulAtrl1ZmEmtM9q7G39
	w8Q4HJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vz-00000003NGg-2yXE;
	Mon, 01 Dec 2025 10:52:19 +0000
Received: from mx-relay19-hz1.antispameurope.com ([94.100.132.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vv-00000003NE2-3eLu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:52:18 +0000
ARC-Authentication-Results: i=1; mx-gate19-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=K96yAKM+xcrHhzOcR0zBqIliZQSixR1YCX/rN6x1xxY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764586323;
 b=YtSGBM08yXCgEZ7mMdGoDv97xsZoRdfdQ11M7zQqAyKR5VxgsN6LLQ2xypCGeNzm7MRp5zSn
 gDttA8jb0pMTAB8hcbtDbFaInHCBf76cRrNL3rCZ1Hg55gOJt2YBPPhJWh7kVFTR7Od5kCHnArJ
 zrSL9cHoloTqVVui/+RnopM1Jb6Ko9pWQSdvxN8brVjU2euggkKs9ZsbWCQbqVOFvzr+BVL6SBh
 KrdBeNWNi4o65UEdJbPKFqA+s7VOcvSHDxsh1/ekQ+/Syk0Sb3bEWcBQnsHNuKZifoRa6NzRpkF
 5/NLXZsaGcTiPdh9gl9+AfAflbrmOlto0dYHL+a+rSwNg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764586323;
 b=ITnxO3/pKU1YWmdlCr0FBNrVh+IKalUyoQEjCF/lHHGL7EWKFHPNRNNL3+95WJXxKWffcw1W
 CnqtnJ3JQ4Rk3WpM4h8BDHclFAhum1qzDmxKz4d9x8Zt542p1tOPV4tQS1ilWoP5ZnUEGz5jwc7
 py/FFHsxMAMUCG/n9LwtvRge5moFJiKic7MASN+nFRVTj7z+m3n8ZS+eC2Plb4tvQxd3/X/1GhX
 paVyWeiDi2IndGTAbGDPwt+J9SCay4PywxpHAzAoPY6FSJgbuAgJW7k495geMAIlKePPdBd0B25
 tipte1EZxHnadAR44hK0u3u4nDzWWvObcimQmmk1FCxHw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay19-hz1.antispameurope.com;
 Mon, 01 Dec 2025 11:52:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AA9ADCC0DC2;
	Mon,  1 Dec 2025 11:51:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] ls-extirq platform device conversion
Date: Mon,  1 Dec 2025 11:51:39 +0100
Message-ID: <20251201105144.539450-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay19-hz1.antispameurope.com with 4dKgh927gRz3DJLr
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 690fad471cfd5f66c6a94f5d6552821d
X-cloud-security: scantime:1.904
DKIM-Signature: a=rsa-sha256;
 bh=K96yAKM+xcrHhzOcR0zBqIliZQSixR1YCX/rN6x1xxY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764586322; v=1;
 b=VA3Fw4Kb5RjB8mSsyyErhoiCjiYfd3HNIjES/JPDqN/Wpbtjh36gsu7ERpJI6j3kMVeZobcZ
 e3Cm58yUOGIHoW334AMyD4l4Frc/mgNqX1cm6sU4BALPtTs4xoEzBzaMBaDhTgZlcjZCLc7ELNP
 HasE0su6NTLuIRiZxrGLwkPgACMJDBnmhRxtDHotrvQd5MvemdVM8wdL4BHGxGP5WeTCPAFkGFh
 HDtCrQV33fp2r5CljdV5sOvujHS6JlHoPgLD4VrqTMuPRo9mbd3WcPBaZapwvWQaxPJZCQSPMfU
 V2rRANGqH+ZgBPZ7kh8pKk9CMQOWB98NpUj2ekaR+ALGg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_025216_046960_2F0866E7 
X-CRM114-Status: GOOD (  14.11  )
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

this RFC tried to address the problem that sometimes at time of probing the
parent IRQ domain is not yet ready. This results in the error message:
> irq-ls-extirq: Cannot find parent domain
> OF: of_irq_init: Failed to init /soc/syscon@1f70000/interrupt-controller@14
>  ((____ptrval____)), parent 0000000000000000

Probe deferral is only possible having a platform device so the driver is
converted accordingly. It is inspired by commit 8ec99b033147e
("irqchip/sifive-plic: Convert PLIC driver into a platform driver").

Because the interrupt-controller@1f70014 is a child of a syscon node, it is
not probed after platform device conversion. So it has to be moved outside.
This DT change has to be done for all layerscape SoC .dtsi
This is an incompatible change and I don't really know how to address that for
now. I've done it for LS1088A as a proof-of-concept for now.

Comments if this is the way to go or a different approach is more suitable
are very much welcome.

Best regards,
Alexander

Alexander Stein (3):
  irqchip/ls-extirq: Convert to platform driver
  irqchip/ls-extirq: Use managed resources
  arm64: dts: ls1088a: Move extirq outside of syscon

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 42 +++++------
 drivers/irqchip/irq-ls-extirq.c               | 75 +++++++++----------
 2 files changed, 56 insertions(+), 61 deletions(-)

-- 
2.43.0


