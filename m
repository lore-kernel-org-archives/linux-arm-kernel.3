Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C60BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPbxwCyH4yC6dtOlRIW7+ZjzgpjAHcZbbIEzFv6rlEs=; b=4M2Zxecb9vxplkV/NrfuaZhylJ
	PAKhFgQd/1FL08fOvs6FuHwmkMiBxp47XaIC1LXJ11VH0gIVS0lBalCQ3RXC3K9JAZq4DRj1ImfyV
	8RXLxlBKUOpp2RO0/Sbuu6gBSrnymJ4gweGVgea/11upcNMqJZelTQa1lYG7eSbXnQ96lOLs2SNIW
	MnSkKzXvU/vvDgM7lU6aqa9oIdT/YBFd+WG65x6GhSuJua/2Ws37j0aSUJOVhhcQHVEuKXgqDLrPC
	avMxS65Z7gQT79NYF71sJ+BhDODw0s/LpvaHykIv3WFuMZPT20awmLKLV2klbI12KbSP/l4jnjDBt
	7ufhKfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbEn-00000001aEy-16Ww;
	Sun, 16 Feb 2025 09:46:57 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxE-00000001XQg-3M9K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:28:50 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A55842540115;
	Sun, 16 Feb 2025 04:28:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 04:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698127; x=
	1739784527; bh=gPbxwCyH4yC6dtOlRIW7+ZjzgpjAHcZbbIEzFv6rlEs=; b=F
	iAUkBTqZVGRLSor4M03Bu3KKk/saSl/IcrnSJEoje3okIHchFotCixmrDte60R8I
	8P4A1oS1heh3W+lGH8a5GHnW3wvijn9v3iRs3xV8EHIbRTucigLQeSmyO7xT2zuo
	/htnRI4cbDb58NpHQZXCVqqiUVhfqeh8YnlKAY4wcEAb+lZuZXI/nf9SSJE+Fh7L
	zVNxKhdCfZ5+tHJ2BScJNpBqotfKPA7ohShdlXI7Y/4uKLXWJX82JyVwqfeQYQ8b
	JfNZGRx30oSTw/ajVaTfsN37bj4qHR/tdRp2s9Bat1KIwIm8wk4Yh1KZLRsRATwh
	KJXv+8/adUA7vZFjpZD1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698127; x=1739784527; bh=g
	PbxwCyH4yC6dtOlRIW7+ZjzgpjAHcZbbIEzFv6rlEs=; b=gQGO6X/vUUa+tvRC2
	ESUcAkkvEtpili0EgtTkDylvMcWHyNbAsjZqdbfWqQetWG65plUpIV3j3mqAkOXQ
	l6ZmcmHyUM6MWSq1GDUtURIhP7ncCp7ADeGCEtUCJnfelyOjqdDiHx6iltllHshp
	5EhpziKFPL1pqUz1wftyJGvseqxB3drAGvRyxFdnQ6OWZiSTKle9yKyKY9lurBti
	UjnAYdDUJGDKw1CchKubzNvxhysSv/MMw0jGOmzGSl53YiMJ1kQr+xDLz9P6vv6B
	G8qiRp5SCsZeOGsfeqqecyNNFWmDE1eS1K2R/n7CK0GU4pc2SQCTvC3nM26iXb0N
	LzzfA==
X-ME-Sender: <xms:z6-xZ9Ly0kuZhVLDNkR52nxmQ1IRaH3JVBr65Qg-_4o4EpCKVxNbLQ>
    <xme:z6-xZ5IriAxKt5bu_doDV4tVP1N3_fvVhw40_751ME5DdFCRtDjRMkldgvzUs7HQ1
    oSvLnfD0taMvnXEhQ>
X-ME-Received: <xmr:z6-xZ1sRGGsPV6_LrRCMAxyfU_12DtG1zyQVaD_WsB-IVwCs_o3N14wPDovcwfTr1i5F2uNG-mdw0bLqXTy1n9I_JTEt4joLN3nqePFCGdzF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:z6-xZ-aRnmdjcjTnRhPr1biK7DcIWSdEK5Mky9yKrdGu-LN9UIsjtw>
    <xmx:z6-xZ0aH5MU_7RdG4XMKzAw03oQjJKrnDNQtyEGUB3YXxuIeedj2zA>
    <xmx:z6-xZyAZRX25bxCHcrCXP8Leb2irXvBa7DuL3Mdl33xh06ncllZA7g>
    <xmx:z6-xZyYEHMf6p50oQJo5Ypruvunzgg9qMLlgOuH_N0OeRhzen9dKog>
    <xmx:z6-xZ6z3PR5AMP95jkTIAtqgWlUOMBjntY7kDKqbR62DVVU5IBPkhT4o>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:28:43 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 1/8] bus: sun50i: add DE33 compatible string to the DE2 bus driver
Date: Sun, 16 Feb 2025 22:27:08 +1300
Message-ID: <20250216092827.15444-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012848_947833_78AE4616 
X-CRM114-Status: GOOD (  10.06  )
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

The Allwinner H616 series includes a newer display engine (DE33). Add a
compatible string to the existing bus driver.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/bus/sun50i-de2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
index dfe588179acab..47c87d51a603b 100644
--- a/drivers/bus/sun50i-de2.c
+++ b/drivers/bus/sun50i-de2.c
@@ -31,6 +31,7 @@ static void sun50i_de2_bus_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun50i_de2_bus_of_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-de2", },
+	{ .compatible = "allwinner,sun50i-h616-de33", },
 	{ /* sentinel */ }
 };
 
-- 
2.48.1


