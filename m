Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8EEC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=; b=egabOITGra/ndD0A4UMfYKvJx7
	9OocisViuawOgVRZluM90NFfzGtlBi9LVA0STGSbOPy/S7lHkBfjHSuCWI+C0zN2uLYyqx0HEBlp1
	9Ul28v+dF60e9HMv/mHhsDzPxauy5bR6t/6i01xSmivJwwvf75P7Vr1Omdgsw5/CYy5muH6vJ6LyU
	+o6ltgTrU5Tp13rKEkiljAiNd3hyyYPqqTie00gn0mqPBm5Jph9tsegrftA/w1+kl26yKQ3Dk9WIX
	dE+oAwA6Msedku/hnSJebAF0vrQWjPGyeAvz2bXFWvwn0aqSGdaMKnRluv0zs272hn2OHTXtdcaSX
	ZAyMrEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61lk-00000002fWe-1H37;
	Mon, 14 Sep 2026 08:10:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61li-00000002fUp-2Ux1;
	Mon, 14 Sep 2026 08:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9752436D5;
	Mon, 14 Sep 2026 08:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC84FC2BCFA;
	Mon, 14 Sep 2026 08:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789373425;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/HNsU4m8LqTruZZRaHMQkGKpRUaTLsaZ/2ovo99zwSJpLJJX7Zikha+tyW3LwDXF
	 e4xvPez8X81IjfP1mWdC7csamtdnvmEkxRRVKiRTd2dh83J6t07h3W8stf0BO+/iAr
	 02kbCyiRxsHb0ity25IqCHTJdDtSFG9uu+jVt8TWjF+3mOzWispVEqg/qV5xalcM2N
	 MQrnV2ACoiw29BcYdbSrRCHf95ODvoZ/5dpRDon912LNnEbTZkIwWjS6PlFxiAQnDy
	 +f7Ghqt8JCeVYy4qurZezkzup01dNBYiRTtSiWOVCUWvRWOUn/WEE8H5aKHoVylsr8
	 VdVoQuXVjW+4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D70FC88E50;
	Mon, 14 Sep 2026 08:10:25 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 14 Sep 2026 16:10:18 +0800
Subject: [PATCH v9 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-s4-vdec-upstream-v9-1-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789373423; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=1CLo+30Ei02EhAt7eYtDaRQEUam7kIUmL7XvmRwXk6aHWi4zjcE3akmc38tmGBx2hq6J7q4C7
 156ZgdTps3XAKtCLzTAFq6TxjHH9o1BBCNUY+hE6RBYnAj7dGXJZ3Vc
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW to the secure monitor command enum
to allow decoder drivers to load firmware through the meson_sm
interface.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 include/linux/firmware/meson/meson_sm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3b90b49d0552 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0



