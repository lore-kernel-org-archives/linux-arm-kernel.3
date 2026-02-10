Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6021EB26EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uS5dkroWDYoVr9gb0lK7EVf1IOyETk+czez2T6E0mRc=; b=a8UZGS900HMnYWjuqGvH/AuGf2
	85HTORGD4AlL0R4sMnSsldNOBeakkGFvAPbWnlqcchv7pvxGHZAIY9myM1XTrwFpU0KvMt3cTs7uf
	POYYx2vd+/7dJe/r5mroac9G+FzwGVQ/PQytmf5U5bLBfz9PF7zsjohguvNlKAXCw5PsdlH7Jz5JB
	rUbqBhAzRRwSdpFRg6YyWUoT0QA/kogzhIPHbYXzMYXx/DyI5KkwUh01wxIp1jcd8IwwL4odwLtte
	fJ2ejF7op3cSVzlh2epjNxhsbI2R2KSGMuOhyeEzF4FGjL+7OBpn2tEO9+OoHsd/WSwvtIVJa9dK9
	it7ZxYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprA8-0000000HIOC-2sAO;
	Tue, 10 Feb 2026 17:04:32 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprA6-0000000HINf-2jBi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:04:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ECF487A00EA;
	Tue, 10 Feb 2026 12:04:26 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 10 Feb 2026 12:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770743066; x=1770829466; bh=uS
	5dkroWDYoVr9gb0lK7EVf1IOyETk+czez2T6E0mRc=; b=L0+6dQfZW6kp7ZdOSr
	zIQW+8Hoy9igWFIk+Zq9DYFsxLR5M6wyCVa27Zv0IwZt6mdFnYINNDG/Vuyo94lj
	5D0hQ9boMFTElasP0En+24Cqe4Yuih+W6g5F4AEO49d7jKWLqW3fFr5q4csXZJ03
	kyU993fOAElorchwhPD+2P5gMMWFvOkeM1klo+SkDIN6h/bdguVTGmM/Z3uCa0da
	0C7uV9hyiYom2Bx+GVzLc6WFaN+6pVUN6rMZTLUn3qGdNvvThhzrwHbNqJv4+Cyi
	9I10AFpMFKt8Y2qQ4RZSKrpC/JrC33iHlnta35WDFhHXEzjI1MMMADppkgnwXjCS
	XdQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770743066; x=1770829466; bh=uS5dkroWDYoVr9gb0lK7EVf1IOyE
	Tk+czez2T6E0mRc=; b=E0udqLk9kuMXBOmsns4AW6z4dowYBs3os/+QDf29xJxX
	NtcCgZoLkC86r7WLGJxWEhlpGDi7qlk8w9yNm8x5cP3mqHC1CX0u/xCQOHPAS5UH
	pV9FJLdyUtjkuVh+axw+0Bd1LV2vkrnb6PhFH1DUOv4ePEXRTGT2JsmPAOxMdYs4
	G04dX/jCGC+jzlB484b4Qv8anMyDz6b5jOTISoNhLTPYafr/rtDs1me5bBUBrijp
	xsNZxaWIn6gQ1zjGbJ7tIYf2vpoIXCwlKFT4Ozrxqn/5ByOrJit/CGbygRfWSrm4
	lEKruVncwx1a7VcXZ5YqAxqs+ATeFyFmW19jdbJ7Rg==
X-ME-Sender: <xms:GmWLac2Vc5EU1a-OxWmhmduqF825zRzPM7xHVtEJ6HxlunMsXkcf-Q>
    <xme:GmWLaR7KV4G37VC6ZN8MESSdxSkFtLvWzHorGvquuUM6GU6hW5g55S4rdkaUS4MCG
    qDIIt2WpdC7xxFVnPi25-ZBmK5TFCYGMP0Eu4oC3DDWSvvM1mCBN3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epffffffehuefgfefhudevgfelieejkedtffefieejtdfhvefgieeiveejueetfedvnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:GmWLaeiaA8O-Posj8_LG7AcD3NTOcakKFdShayuWFI-Ao2amcZzm6A>
    <xmx:GmWLaV5Lwl4zKpIXg4MJQHnDh4KwM7IqLtTk5UPsXx9nxmqj8OaitA>
    <xmx:GmWLaeYdK4rpngCRdVfonh28W28Zw8O6l2x77LfuPufNoIoiuN5BcQ>
    <xmx:GmWLaS6J4Roj04gNQ0cQ-B6FAvxwH52NuWHqaASxS4ZmCxTfXnzoaw>
    <xmx:GmWLaUKlxR3PxrCo4t-e-AhNtFauJW1FZ6GLENq-CZkL3apoyaYmzYGR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 470E7700065; Tue, 10 Feb 2026 12:04:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYfK9ZjhzOaF
Date: Tue, 10 Feb 2026 18:03:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
Subject: [GIT PULL 0/4] soc updates for 7.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_090430_732220_A1BC77EC 
X-CRM114-Status: UNSURE (   5.34  )
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

Hi Linus,

The 7.0 merge window seems fairly quiet for the soc tree, with
only 757 non-merge changesets throughout the tree, and three
quarters of those being arm64 devicetree updates. A few new
SoC models got merged, but fewer new machines normal.

The most active developers this time by number of patches are

     37 Rob Herring (Arm)
     35 Krzysztof Kozlowski
     26 Lad Prabhakar
     25 AngeloGioacchino Del Regno
     18 Luca Weiss
     15 Vladimir Zapolskiy
     15 Heiko Stuebner
     15 Guodong Xu
     15 Cosmin Tanislav
     15 Alexander Stein
     14 Peng Fan
     14 Alain Volmat
     12 Frank Li
     11 Patrice Chotard
     11 Francesco Dolcini
     11 Dmitry Baryshkov
     10 Stefano Radaelli

and this is the overall dirstat:

   0.5% Documentation/devicetree/bindings/arm/
   0.3% Documentation/devicetree/bindings/mtd/
   0.5% Documentation/devicetree/bindings/riscv/
   0.5% Documentation/devicetree/bindings/
   3.2% arch/arm/boot/dts/aspeed/
   0.8% arch/arm/boot/dts/microchip/
   0.6% arch/arm/boot/dts/nxp/imx/
   0.2% arch/arm/boot/dts/nxp/lpc/
   0.5% arch/arm/boot/dts/qcom/
   0.5% arch/arm/boot/dts/renesas/
   0.4% arch/arm/boot/dts/st/
   0.6% arch/arm/boot/dts/ti/omap/
   0.2% arch/arm/boot/dts/
   0.2% arch/arm64/boot/dts/allwinner/
   1.3% arch/arm64/boot/dts/amlogic/
   3.2% arch/arm64/boot/dts/apple/
   0.4% arch/arm64/boot/dts/broadcom/northstar2/
   0.8% arch/arm64/boot/dts/broadcom/stingray/
   0.3% arch/arm64/boot/dts/cavium/
  22.5% arch/arm64/boot/dts/freescale/
   0.5% arch/arm64/boot/dts/intel/
   0.4% arch/arm64/boot/dts/marvell/
   4.3% arch/arm64/boot/dts/mediatek/
   0.2% arch/arm64/boot/dts/nvidia/
  31.6% arch/arm64/boot/dts/qcom/
   0.8% arch/arm64/boot/dts/realtek/
   9.5% arch/arm64/boot/dts/renesas/
   7.1% arch/arm64/boot/dts/rockchip/
   0.3% arch/arm64/boot/dts/st/
   1.0% arch/arm64/boot/dts/ti/
   0.4% arch/arm64/boot/dts/
   2.0% arch/riscv/boot/dts/sophgo/
   2.4% arch/riscv/boot/dts/spacemit/
   0.2% arch/riscv/boot/dts/
 775 files changed, 52313 insertions(+), 5630 deletions(-)

