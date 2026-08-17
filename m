Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2BAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5Iydu55nn53/E790W1X0ige2y+XDRJOVkvd0LR/QSg=; b=C8MTt3ttfyZLH/1+OaBauBQMpC
	ERcE3UD7XiWucckVCsoWNH3jBLS/QkKxXnc/TejV2ENO4FDdalgP0HADi3TrcYVHg7qVETbjOJ3Up
	4IRa2/6KQ6hrVOqQBY3MN/QaxzdG0mHod0haADpSnUH8IeeuEsRM7ScCyl9gyE/jAl5G3KNP7h88Q
	ewx5rPLYVIbGhHTQwvf9yAUzhRoymmzORQB1OwGtzzJznlEtrlRn5udTpY42otcgGm4Iw+eVhtzHM
	5RYa8kyeHQwAkRpG3pJNGW34h2Ov8297AWMZlONuEX+eTlAO1h9RqZrI+pIMzJA2r6wnoPPBqv+pH
	pN2KW9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvveS-000000062tM-2Ydn;
	Mon, 17 Aug 2026 11:37:12 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvveQ-000000062rD-14Pj;
	Mon, 17 Aug 2026 11:37:11 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 632F513802DB;
	Mon, 17 Aug 2026 07:37:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 17 Aug 2026 07:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786966629; x=
	1786970229; bh=h5Iydu55nn53/E790W1X0ige2y+XDRJOVkvd0LR/QSg=; b=Z
	CXwfYKhXDzkkifmITm/VHWFza84CxYUHQ+mRHyOxECHBIHiSJEAn+aD1BVczMpWz
	GS2Kd6CeulBLgCi8Oh83e4QYRIHw+KKmVZ+jjgCUmcGlKzh8NBNfvupP/1X14iki
	TdTVyz07mlHWzxUV5HuRZht2Pmcp4VmYfADdJwQxd6HeanoZkADEAbvGwiBd3njo
	xpxNAX0Qytv/Jk66Y174oQBu4nNMl8wx5FPQZedxPbPXoEc33Dd9E3RcDVzjLG6F
	QAgwPHaXNub+2jV3HD8pgmpK0Jxi9iE1vleGy9Ru6Cgj5DAsYDqEdNok6RbuF6aW
	90VnHVY8gy0urm0ght6Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786966629; x=1786970229; bh=h
	5Iydu55nn53/E790W1X0ige2y+XDRJOVkvd0LR/QSg=; b=l1L96ZJcQXabD2KSH
	/2UrNOlYRl9XLIiCLA1DapgquvhApr3BneTcP0NvnD83JYnF3jIBzPi+biKUWAIy
	OW9Uf7iWNifcCuox6yEE18iMk0KObbH84gO8GKzk8YynCZ3+NuPxNynqZGhzD3NE
	XH+IDUOjnnsPWBpmm2aPUBD/YiwwjbTq08PpBS7Uh8SYS3cRaXk4EkEvIbk4TrYc
	87fW5IZ1A0+nl6787OyIs7VXnGGwiAf+U2D0VXEQaWIJexL+syasEBsrAjOOQtDm
	stua13BKmXA7KUEVofQ0nubaEVH4s2drLHJvHVXb4kmKjBQt7B807Cv08BCNNTyz
	o6ALQ==
X-ME-Sender: <xms:ZfKCasbgGHezETEOOKnJ7ss9IqXkpaROAxD-MnOFVWhpZ-NEMtm40g>
    <xme:ZfKCaqLkWyKOPW3LxQZq1T11yiEY7sDEXEVbg0A2SG55sneDZp5hYHWtIBsgyle2N
    Iff7WECcv48K-VlqR9WzISABYYjLauKhB12ezordW9KCRNHNaH8PXLp>
X-ME-Received: <xmr:ZfKCaj2APgXsoX3FoH36CUEjn4Yh3Sy-m8g7r6Hz4ITeYhnhmmmaVeL5lBD5yTotVY4P7ydezA>
X-ME-Proxy-Cause: dmFkZTEbo03Dt9gKvRTGBg3KEH1DqaPY/H6zCcSZZeM1zR7Pq9k+21FPEdaywskSvmMkcc
    cHQ2RFBjtPcxhgy/KmNB50Y6FMXUqKJIWg52JZWhqYAF445T2t3cJnwt16b6flTr+Tm5aw
    Oq/F9cwAChEJdajME7GraNUQPPLDINvFa3LSSEkNznYz3dK5thur6LAy+M+kg2y6wZWD8F
    hVtQBPknZHWJriktC5PREMWeO0aUUNzqIcRLR7sfqAfsUY9FxPi1wp6mQNE+eG1pwEmW5F
    9jX9PSrR0OLTHeZuYHwePCiONOa0ACIpucN0J6DuEHfShdx4/NDN52R4lkIf3tcUt4ZXot
    QhBArfqHEFLixy+R3agAnghhvBeeSJ9mUkoC7APNSUj9XGjm9O2Ij7pLcHJP8Ak48us+CU
    i1BipgY+FtRvEGoAoaidkvs91ioQPC7Kts/NB5/pwcD/UXUwi5bg62TV9GZ6BvUzd0BJHW
    j/4ow0uRw1ux6xMbCnpqcbeo1de1atODScsYi4wuC5kxb0M08R//Xgc7eP8CZ0gaRpehF6
    viV7L9b5frkb2+F1MpL9WgnDeq9rrfFRmsbtl+YlRNUR3lZZrKf0i2Qk0efPSkS5ZRYkMY
    2jbXyvrBNKbLP83LDYfEvqUgGvxVVZ16buBNUpSZSW+PptsG1iQ4KNUNjm8Q
X-ME-Proxy: <xmx:ZfKCauIYDn6ksIeuGMXd3e5HyXXmTpIIRIQ4t_DHOONKMKTeemWN-A>
    <xmx:ZfKCavOZIpxvOAgHV8bULtzBL6T8x9Ik3VuiCiecx1EWUCJwjKszUA>
    <xmx:ZfKCanw7fDtP6fMb_9ol21RTGUssyYbxwxmxGZR8BvD_2I6YHhAMYg>
    <xmx:ZfKCavI6iXDvH9zq3cS50kksCaP2uqzhKguHFZ2ZBZGCbuupPbChHw>
    <xmx:ZfKCau4wwMVe3CX_SHnVex4G2bHCpQYsqcf3BzKUtuKhnnSKYpm3jyTD>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 07:37:01 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v8 05/12] dt-bindings: power: rockchip: allow resets in a power domain node
Date: Mon, 17 Aug 2026 23:35:56 +1200
Message-ID: <20260817113603.1436067-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113603.1436067-1-gahing@gahingwoo.com>
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043710_398840_841BB2C6 
X-CRM114-Status: UNSURE (   8.82  )
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

Some domains do not come up in a usable state on their own and need
their resets cycled once power is on. The RK3576 NPU domains are one
case: without it the first access after power-on takes an async SError.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../bindings/power/rockchip,power-controller.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
index b41db576f..83741f048 100644
--- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
@@ -136,6 +136,13 @@ $defs:
           A number of phandles to clocks that need to be enabled
           while power domain switches state.
 
+      resets:
+        maxItems: 1
+        description:
+          A phandle to a reset that needs to be cycled once the power domain has
+          been switched on, for domains whose logic does not come up in a usable
+          state by itself.
+
       domain-supply:
         description: domain regulator supply.
 
@@ -216,6 +223,7 @@ examples:
                     reg = <RK3399_PD_IEP>;
                     clocks = <&cru ACLK_IEP>,
                              <&cru HCLK_IEP>;
+                    resets = <&cru SRST_A_IEP>;
                     pm_qos = <&qos_iep>;
                     #power-domain-cells = <0>;
                 };
-- 
2.43.0


