Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA449C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=; b=w9h9FT6YV6XfuAXp/fX/SG/fX6
	lFYzKYEdaOYL8e40gSQ1P0JN6ypRW/I7iwNsirBB4uWyil/W0vZm4odvaGcO1+uZAMj0Qz1FaKnhU
	GAegjLd2UFHvtLzGFB3BDYfm0Wi7/TMVLNVZLPYqVQK9/LkqUvbX0t+SpCR+aBLlLmAkoQ+LE2cTR
	Wlh3RW4zKlPwArOUpuMp4/I669LfPqOiP9YmwR/L08+miaWKhTy7V4UB+5l9W1KuzGbKw6Is+i4A5
	YSfAopSLA3XBjy2aD9CXPoK37nZZgyG3kpLuQKslFjfyJWCjse5ESjwdaCSlu9CdWn8XZlVr4qlbK
	wXZS/Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9y5-0000000FeKh-4AIe;
	Fri, 24 Jul 2026 07:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9y3-0000000FeJ8-0X2z;
	Fri, 24 Jul 2026 07:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E8DF44FC9;
	Fri, 24 Jul 2026 07:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3B27C2BCF7;
	Fri, 24 Jul 2026 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784876709;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qp4YbDp2pbskxINHfKEQmsupZSTB1CJhLcVFLu/rZycH5Yuw7C0+6rW/OXfM8GUaU
	 s84skxjU/KnEB+qoZf1/Pu/FIK6LNp5SmmWvqAUX7AyfmCBDOCiJBbFO+Yy5/2RLXg
	 WMsxzfpi68qnWdQAfRx++dI3/9qkFze62zroJV11Ny4GQmT/kF2UmVMiV/mEPyDlLa
	 b2uKw8YKop/EH/0MxAr1uxpqVdLYcWyT5YGmbmVbJQbVmqSu04u1kJQ5PkXSkWshSt
	 p4InFwGnVCVvtZ/mbmqbKDZCDjPdTKWQZGN77JTE95uNMQp5dG0VzG92QfKBPx3j/G
	 dx0XmjH5MQhPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10DDC531FC;
	Fri, 24 Jul 2026 07:05:08 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 24 Jul 2026 15:04:52 +0800
Subject: [PATCH v6 2/6] firmware: meson: sm: video firmware loading via
 secure monitor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784876706; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=qcfpqpSp3ZC5wFR3avhVMWEutkAoM1I34FyP0uVQKalcPtM+UXDhBWzE3W9F8y+jPQ9VnB9bZ
 DFGrGKpLLu9Bdqvyosa+43fgRf7ZMuAThuNkS83dCewLvBhyDjSdVnS
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



