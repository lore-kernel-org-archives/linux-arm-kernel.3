Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBEEC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 18:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1cTOGezMVy8e36fHXgJjqmofKfSDXaKR85GQ8Az0i8=; b=PLcZhzSZXj7AAwPHQaQ4yN3tDt
	2FPN4W6yXPVDV3A1pD69jbkDb8cGDraAPaLwRsfsvT2OSPIAJ54LIXfdHp8RXqC9HEcGaibo/Bazl
	8ElmwZPj3WwIrQml41OIuRJDJhyzaxnqyGgrBWoM8nQA2URuzzDH2HP753OubpT0ShxCb+A8DW2LC
	59I6Shb1MpW/5DW6gNBOqrJ1jj5aE4d8pWtyqDPf5980Hlkpd51VEIUo3jsc8q9RsANorrMfrdPrL
	Lfyyj2AHUNGvzBHiR7g9+JBoSOQVKwTr7Yr2odE0F//Awj7GmvPTaBU0skKqyAx4t1fx4ebTymi/P
	a6wBsmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS9G-0000000DruU-1XGM;
	Tue, 20 May 2025 18:57:10 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHS2z-0000000DrA4-2rzd;
	Tue, 20 May 2025 18:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747767032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VyKadxrfXi/ubHzTvkn+of7PjALh1aKqGB2wzwENbgCo1EeIE5NBx6nvaBnuGjlcn9hMNRVPy32p1tSboynxeRU4TmhdTD78a86pBmCnaeNtYMB2xM1FmatBtY3wL/yVs0Vf/g+MDH6yecpyxqYCEMQ4TdDT+sDA8DGd0wFCpCY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767032; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X1cTOGezMVy8e36fHXgJjqmofKfSDXaKR85GQ8Az0i8=; 
	b=W0ANAhkL0IflDX7V1mYOYNorxZ/VgJjM40BCSP+kmdAt1EsBu8BqPeTQIUHych/iHTWp2EKM4/XPI2ldFaHf/Olru8xZaFa954sieFw2mDmRzMZXTLy/siYEQK5lJPovYopg9BCS02VCtdZNE9A83crkyfRUH8oIp5oAvc73FcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767032;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X1cTOGezMVy8e36fHXgJjqmofKfSDXaKR85GQ8Az0i8=;
	b=AO49ZgSHRmwPKFXhg5NxaXVorNl1MklH4wjJSL4/TFcRAKw1wC2IbTqT/fUowT7G
	2THV9NWbUD4oJlIQQi0GRs8NIEt89KIYwul+QYyZpedpkjIzQnzeLy4hLUFFxEKxqM0
	qQgeJtrPCp0VLoxUdbwddIsvfNEy9ToF65OVGLfQ=
Received: by mx.zohomail.com with SMTPS id 1747767031901555.249516539212;
	Tue, 20 May 2025 11:50:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 20:50:09 +0200
Subject: [PATCH v2 2/4] arm64: dts: rockchip: rename rk3588-rock-5b.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-add-rock5t-v2-2-1f1971850a20@collabora.com>
References: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
In-Reply-To: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_115041_790340_6C25DCC9 
X-CRM114-Status: GOOD (  10.97  )
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

As subsequent patches will add ROCK 5T support, rename the .dtsi file to
reflect that it's shared between ROCK 5B, ROCK 5B+ and ROCK 5T.

This is done separately from moving the 5B and 5B+ only nodes to a
common tree so that the history stays bisectable and the diff easily
reviewable.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../dts/rockchip/{rk3588-rock-5b.dtsi => rk3588-rock-5b-5bp-5t.dtsi}    | 0
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts                    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
rename to arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
index 74c7b6502e4dda4b774f43c704ebaee350703c0d..22c0745eae4eeafdbe4ac5654dd1def15a0cad74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588-rock-5b.dtsi"
+#include "rk3588-rock-5b-5bp-5t.dtsi"
 
 / {
 	model = "Radxa ROCK 5B+";
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 9407a7c9910ada1f6c803d2e15785a9cbd9bd655..206198c22aa6c388c5321a4503fb0ae7bf376af8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588-rock-5b.dtsi"
+#include "rk3588-rock-5b-5bp-5t.dtsi"
 
 / {
 	model = "Radxa ROCK 5B";

-- 
2.49.0


