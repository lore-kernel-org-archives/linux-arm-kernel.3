Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC87C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dBd4keV6GHjKXAeUM2B2XqfYvbATAqEFB8R5AEVswSk=; b=h2KmwAwyKRfCvKa1jCv/Cciu4R
	oitaX81OnF5uejcGzApviawq19q2MVpNRyD/cysJ2pjeRrohl+h3VURHr3dHFGNQzKds7oNlturQb
	XJ1sUkok7sKtszuqyziUOgi1YjJrLLzhDno6YW9NL3zk5WRfTK6lsDSBs6r33kY325BvWvYbIEWls
	bDl+RTiMyLEMXuQiKmIjPabUbIpZZGN3UWs9uEyTUJk1dHNdnlsH1fgnKls4PRnS9xZCL4jn1sTuh
	g1zSt2OwFonAJUcLxQOPNigPv0VvCTIbHSm4vHnkBn8WhspXgvY7ttrBZweUz6bzPpCfrqv4BLLTS
	SfVpvDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqe2K-0000000FS8R-2yya;
	Fri, 07 Mar 2025 20:11:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdz5-0000000FRZj-3CLR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 819855C6094;
	Fri,  7 Mar 2025 20:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E54D6C4CED1;
	Fri,  7 Mar 2025 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741378070;
	bh=aL+XZM/7p7Esweo3/w1A7NMI9JjtTr5G50MAaH4HdCs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FMnuoiV3Nzp4OWlLE5VAXd3CJvw2kMN6G5vuInuDGb1BTQZjtWRRmhrJnkgZsGlVG
	 t3a+I7DdNGJ7wLbv+gm101+uTjike5WDaHuEDKGyS9u98LBkU2x7J/L9fcCnTOOg5/
	 1cCU1DIQA3+2BF+z2xbtojsvjraOrINpOctX9uAbbRIOaD9IVA8cuyGWQ2Woy6ezHD
	 EDByOkK6GLydLpq3HI86PJHA8FcX4KmKI1pMIFpiUP7GfHXFj3tmBR1I3fBQ5oe+hy
	 9HnxCzIeT2Hke50o+yELn2Qup/WHwGm5sABvj8JvdrOoU8MV0MYF9YOYK4EEJAW1Z1
	 qI6Uy2S8OPBpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4373C19F32;
	Fri,  7 Mar 2025 20:07:49 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] iommu: apple-dart: Support the ISP DART
Date: Fri, 07 Mar 2025 21:07:44 +0100
Message-Id: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBSy2cC/22Myw6CMBBFf8V0bU1nQARX/odxMdApTCKPtKTRE
 P7dwoqFy3Nzz1lUYC8c1P20KM9RgoxDgux8Uk1HQ8tabGKFBq8G8aYlTNqSn7Urs6KqibipQaX
 75NnJZ089X4k7CfPov3s5wrb+iUTQRkMBXAG73OXFo+1J3pdm7NUWiXgUy4OISTRMtgSqDKM9i
 uu6/gDB3Ik42QAAAA==
X-Change-ID: 20250227-isp-dart-f8369baaecb1
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741378068; l=965;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=aL+XZM/7p7Esweo3/w1A7NMI9JjtTr5G50MAaH4HdCs=;
 b=TymRhGh67bcUCvfAFG+jHbf8FOmhN8c2DfiA24iqbzxriblvi9pdbes4+hbhn2xAcjeQY+Kh0
 8kPtqo0/QtbC3iXPTr7yVkK78hCipfoGXZDbX4wZYDkoP3HBpq6usEo
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_120751_860945_EF312A3F 
X-CRM114-Status: UNSURE (   7.72  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The ISP block has 3 linked DARTs with mismatched bypass support.
This series adds support for this setup.

(The ISP driver itself is sent as a separate series
https://lore.kernel.org/asahi/20250219-isp-v1-0-6d3e89b67c31@gmail.com/T/ )

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v3:
- Just added r-b, effectively a resend
- Link to v2: https://lore.kernel.org/r/20250228-isp-dart-v2-0-0ead81a90e2d@gmail.com

Changes in v2:
- Made comments and code a closer match for each other
- Link to v1: https://lore.kernel.org/r/20250227-isp-dart-v1-0-161e91ef4f46@gmail.com

---
Hector Martin (2):
      iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to 3
      iommu: apple-dart: Allow mismatched bypass support

 drivers/iommu/apple-dart.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
---
base-commit: dd83757f6e686a2188997cb58b5975f744bb7786
change-id: 20250227-isp-dart-f8369baaecb1



