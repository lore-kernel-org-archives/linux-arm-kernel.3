Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AF4CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2sItBj+QU9qdXvNcIECQjyDp7nGnsVveQgohkd3EYmM=; b=dGaOwWr7lMHvoy
	ID9Qd6TjVa8bzIJpHsOGFeSllzK+YZjBNIhjmRrUCF1H/wb/cE8dhOVcvITCj8k77AAdzyIanFMmF
	CX5KXQRmx5AbqwL43lGsvKE2g7PRBdaDrrpLGEvivdHvPn0dyk/B/Z2QYbByNqbe9YASOx72kFfBo
	1xPbsydBMl8OH0GG00lHJvpvfPl1oJKaGWxRkY7mAyAiv/9t8NYJ3h8dU24Qo2ZNMU6+DTBz+QGoG
	yii/Xj1VR80OPs0n5S+TWQFcvxrxIWo+5Rcl32UQ38UNX4A546C93nPt5XdohFCpvzsQOnd2OYz/6
	JANw5m9JadODe6TteNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12qX-0000000DSgY-24O7;
	Tue, 23 Sep 2025 13:14:17 +0000
Received: from phubs.tethera.net ([192.99.9.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12qU-0000000DSfF-3KaC;
	Tue, 23 Sep 2025 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tethera.net;
 i=@tethera.net; q=dns/txt; s=2024; t=1758632774; h=from : to : cc :
 subject : in-reply-to : date : message-id : mime-version :
 content-type : from; bh=2sItBj+QU9qdXvNcIECQjyDp7nGnsVveQgohkd3EYmM=;
 b=fhY2a8K3+6Pqc7obdcyMoOLs2tg8wCZkGhoAXWA9670cPb67vtaRWP6JtAARfUpFAZs84
 IBx29vHM9Jx0C1WoHSU3HOMtKhfHw5OnrBD+qJSNuOiojlAoGPpdI0n1yFXcRmoPpqvBWqB
 LSjVz2iXNeb1Rls66wn8GHXud1K2QVXMf8Y4NfvWZTcPd9lLXJU0CS5b6+ufgxB7chZsJF+
 6SjHwRsZcTCiego5lqemkQ0b9qFxDqd0YGom6xqLJf6fADTwDxQ3SGawi7Cgsn5CMrpaTPN
 0ljaoj5ya23LZ0i0WKjwBoVlytOr/Jv7PCE/+FUWnn2ho0ZGTF7eooo5zMjA==
Received: from tethera.net (fctnnbsc51w-159-2-211-58.dhcp-dynamic.fibreop.nb.bellaliant.net [159.2.211.58])
	by phubs.tethera.net (Postfix) with ESMTPS id C93D818006D;
	Tue, 23 Sep 2025 10:06:13 -0300 (ADT)
Received: (nullmailer pid 1548093 invoked by uid 1000);
	Tue, 23 Sep 2025 13:06:13 -0000
From: David Bremner <david@tethera.net>
To: devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org
Cc: bhelgaas@google.com, cassel@kernel.org, heiko@sntech.de, krishna.chundru@oss.qualcomm.com, kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, lpieralisi@kernel.org, lukas@wunner.de, mahesh@linux.ibm.com, mani@kernel.org, manivannan.sadhasivam@oss.qualcomm.com, oohall@gmail.com, p.zabel@pengutronix.de, robh@kernel.org, wilfred.mallawa@wdc.com, will@kernel.org
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 10:06:13 -0300
Message-ID: <87ldm548u2.fsf@tethera.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_061415_024791_1B3626A5 
X-CRM114-Status: GOOD (  10.61  )
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


I have been testing this series on the 6.17 pre-releases, lightly
patched by the collabora [1] and mnt-reform [2] teams. I have been testing
on bare hardware, on MNT Research's pocket-reform product. I'm afraid I
can only offer CI level feedback, but in case it helps

1) The series now applies cleanly onto collabora's rockchip-devel branch
2) The resulting kernel boots and runs OK.
3) the resulting kernel still fails the "platform" pm_test [3] with
 "rockchip-dw-pcie a40c00000.pcie: Phy link never came up"

Of course there could be other reasons for (3), I don't know that much
about it.

I'm happy to test a newer version of the series if/when it exists.

d

[1]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux.git#rockchip-devel
[2]: https://salsa.debian.org/bremner/collabora-rockchip-3588#reform-patches
[3]: https://www.cs.unb.ca/~bremner/blog/posts/hibernate-pocket-12/

