Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D18DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ceenuKVT9zJ9XIykC37iSEzCKLI5XrntZhOTp1GUzo=; b=kg1ZMtoER8Tswq
	YW/J2PCkvBUX38Rmi8dM2GozSij4hxXNUokzDwXhF0zhyqdcgSRvrh8Rtyanfi4aocXNzdHhc/LBH
	eA3UFKcEdwlmdb7R3KOGETSdLPJ3ShoG1Nv32YU6fFHqnRr85J9gc4P12za7jqOEAksMUtJLMKeCB
	S3trfMk5SIWdVUsHcJQWWyICZ044aiEMq9fZ2sC4YIyfXGzmD2TRzvzaCABMCoqOBTsBa3CDoaWTV
	OHocp+KGqxlvN3gQqcziK9Dqz4M4SdtPyo3y4Gpnc1qtBWWtKOJguV5cLuL7ISvV5RR6ckvkUnya+
	T57NotmJEcHSomML+KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNlP-00000003lOD-0SNL;
	Fri, 09 May 2025 13:27:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMtr-00000003bJx-1Ivr;
	Fri, 09 May 2025 12:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746793931; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fJfDGihC/BZGHYWAPMRRQ7ArXPcBm00NUiTgRssqn+w4LGPCKxdPc77hVpJ9pIIp1Pq51ydZqBuhCPDSJjZSNwZNhXKG8bl8h0CVjM7dx3qebNHk0M4TsLhg3DdJv6mgXf3R7OLeKYvn5mNsISKk3yNp9/ncLvm+TtN3KW28BHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746793931; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4ceenuKVT9zJ9XIykC37iSEzCKLI5XrntZhOTp1GUzo=; 
	b=eX13l1ZwaLlOge/lh92a2Su/5Ds3fsb1wIoVUkRY0hxgfLGRlEjSpuntP1Vc6wgafwBkJGYhLHiKZYlQNvQojt3t6foczJxAbqa1UUkyFtnMu6gRLEs80M1XvLMgUl78PSsowennyryKDwGH3rRD08dVsGKbu/3VN5vFUYj9wnw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746793931;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4ceenuKVT9zJ9XIykC37iSEzCKLI5XrntZhOTp1GUzo=;
	b=cfht1BMGXhIgdANTyBcERZUxVZ5o8rZrKQE4Pq49bKawOMbxTp2+h+JZSl5SQOKF
	zjoA9NMBW+qYkBnXwJCJt9QFZFQiU3c0wzxtnPtoeVBWjI+gsUgznbLrkmUaCDGu6vZ
	v6OgKRE9/UtLiUBU39LWjljGRFxjHY5jevHrB4fs=
Received: by mx.zohomail.com with SMTPS id 1746793930283950.4244953090428;
	Fri, 9 May 2025 05:32:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/3] Add RADXA ROCK 5T support
Date: Fri, 09 May 2025 14:31:40 +0200
Message-Id: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKz1HWgC/zWNQQ6CMBREr0K69ptSAggxxnsYFqX9YIOl+FsIC
 eHuIujyzWTeLMwjGfSsjBZGOBlvXL9BfIqYesq+RTB6Yya4SHnKC5BaAznVpQEajWkhco1JVrN
 tMBA2Zt5lj+pgwve4OcMRslp6BOWsNaGMepwD/LyX796i93J/LKPrvzjO6gEaRzAOPhBKC5MAD
 lme8yRRKpZK3DukHl9nR+2NVev6AZmP2iDZAAAA
X-Change-ID: 20250509-add-rock5t-fde5927de36b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_053223_418248_AC011908 
X-CRM114-Status: UNSURE (   8.77  )
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

This is a small series, depending on Sebastian Reichel's ROCK 5B+
series[1], to also add support for the ROCK 5T.

The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
share as much DT boilerplate between them as we can, this series
reorganises things a bit and then adds the ROCK 5T .dts.

Link: https://lore.kernel.org/linux-rockchip/20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org/T/ [1]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (3):
      dt-bindings: arm: rockchip: add RADXA ROCK 5T
      arm64: dts: rockchip: reorganise common rock5* nodes
      arm64: dts: rockchip: add ROCK 5T device tree

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 1012 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1012 +-------------------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  105 ++
 5 files changed, 1131 insertions(+), 1004 deletions(-)
---
base-commit: 19c541fe872387798a25df947f56a26212aa9a97
change-id: 20250509-add-rock5t-fde5927de36b
prerequisite-message-id: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
prerequisite-patch-id: 02bf159533bb53d2cb1b6c8c7caf1d3fcfbfa4ea
prerequisite-patch-id: fc153d1d48f19d63520086a6eaadfec2db960470
prerequisite-patch-id: f445b893edf31ccf3311e146a53e5d24861c2475
prerequisite-patch-id: 5dc410a438ad5a7aa8962e380d2733782f5d7d18
prerequisite-patch-id: c70ae0e30be2a3385d2f2a09f474ff2b76293843

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


