Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EBAE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UZxwDfS1oPS90ifu0h6kKEX5WvdE1VG547kjfsTBm2U=; b=AglGoNOeui82Oyvlcr5OlgyS2x
	TS6LO7T0Zk5I/tD2kbRRjLUgMU5SsDDnHgWpzWU6mJ5UjTwtC4xIrBcAycvD2NIkn+cA2HVIq1s2q
	MWZpt38jv7+xNpgHdOO9VYRIBBjMbCg2jkyzEghxJHttOA0ZRIw7Ghjv4r6Fri04rYXzjOwfnftnT
	goJ48rhOnA0NcwwuDSn/dTJYlcY0Fnf1i81yUfNE/6TaWXlpWWvYoN9zxnClgEkOdVKcf2m5dpZdc
	kMJtUwzi9QZthGsTRBojmuzEHkXt2Wbf5oCVVEaNvsBf/kxlG2GZ70U5tYBRa44bx0x3AJstvHUnM
	wiJmUqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi15-00000009uyY-2hjk;
	Wed, 18 Feb 2026 13:54:59 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsi12-00000009ux3-1Pgf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:54:58 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=UZxwDfS1oPS90ifu0h6kKEX5WvdE1VG547kjfsTBm2U=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771422885;
 b=Pm7SO1ll0Q4LcNlh0GkzUHw/Z46csdsF1ZZ899L2UM4fgpcV15TAAwR2RkAbdiLbnfVGD+m/
 7LMgSvEeUBjZuNLn+i970pHjCmqOPMpbTH5FPbg7SMaCYWGoiBvpkbuj4GeMTYeYDebxCQ7vVqA
 2LCaliz+jgMRKc9kLVtDyB3KbIA8HRRyxhEHf8NS/gc/et49SruwUTrUUveZncgg8IL/NPsikLo
 e1JWAB8B9cE8MksoXoAN9o6TtoBkRHwk9UGyeU22NlEWFc7qaveDAQOzliBJEqloNCBf22RAD1n
 fgNhfr+1tQloVjHyx8w/oTmLwHYdO49+VBs4GaQHRPeUw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771422885;
 b=KGYx6TlYH3Vtu7t7A0HALWoU8DjGyv/bAnvQyxLSCVtJH4Lo6Uxm/E6weWU3AFHxuvVFz5tR
 CKPJq4tgR38KkUZQksp1Z1AsjwEFkpgbDLk2bl+/Q51uY9BJ0voxXkL/ux0N6BQ+CYUZDgsMerf
 fAfNDGgO9Z6a7jcY2i9DJq9ci5L4HSC7Ds27usffbekwoIp9Az+xETRYFWufNqBXBTjvqI+rARS
 H5l5z/K+KY3PKNePYYqhc8ZEjN8/mqUCsBTt4WBajIqPsJjryL5SpuXplS24uJ+lY22O+w6kl23
 aDLFbRn7APEFoU5Z8Ri3Or4OcZC1XgivmiKcYFYlPdLTA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 18 Feb 2026 14:54:45 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 40A72220568;
	Wed, 18 Feb 2026 14:54:26 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM: dts: TQMa7: modify for use in bootloaders
Date: Wed, 18 Feb 2026 14:54:11 +0100
Message-ID: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fGJ0M0CGxz3ybFB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: d82c1795a7bafb33397f842ea10eaabf
X-cloud-security: scantime:2.092
DKIM-Signature: a=rsa-sha256;
 bh=UZxwDfS1oPS90ifu0h6kKEX5WvdE1VG547kjfsTBm2U=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771422884; v=1;
 b=OFBwvHyLCholNALsxY8qv9yZyRZZsBtl/ftjhPZ3tclminUFI4FxNmHA4oFec05CLw98hRDS
 pH1JspqBGeEJoPqL8YZD4nVz3Bg7GMwfa6ujhnXGrWo7KTqxuKunWoE86m/M5fJbaHkfJ6cuh+e
 HDC/Zk9COEgBDHczbRI6n9I8PflgOv82Ll4aGW8XstHTYvw3dmmNKi2rCHOyT6M0nHNiLUBVFQT
 hp8wzA7CLGNsqTYRmsQfqm/ZSFUW9zhsAG3if2ZE5jLLJG+FLoMhhdOM+/+B/TQtuf043rYxC3m
 NzHMK0sqDvMuGbN4qkvOOHsGB/JdfbWdgH/SSTrAXxQEQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_055456_516273_0035BD1A 
X-CRM114-Status: UNSURE (   9.38  )
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

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.


Alexander Feilke (3):
  ARM: dts: imx7s: add boot phase properties
  ARM: dts: tqma7: add boot phase properties
  ARM: dts: imx7-mba7: disable boot_cfg pins after boot

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  2 ++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi      |  5 +++++
 3 files changed, 20 insertions(+)

-- 
2.43.0


