Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5E5606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKuAW/3L;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n51pWjjK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=; b=zKuAW/3LjT4jIE
	DkHYeie8wSfu1ebYC/jC4zcLN5A/6J+Ib1Nt3yndaESUncFaX0qUo3jjSh3mz1I7vM5xD4cfD+QOY
	5vzhhGKOvKFq1lCzR8Ah1BSZIGj4/7bcuHofb9vUKcsWUX+jAl53fVUBIoIW/IFYGIUbYfL3AZ/oK
	gn880jKCa36kHEcsyuPwfIoD1qaLOSMBOX18kyvpKm7iv+YezuiWI3frT00jWEXSW836nh2+quy5W
	KjjIQMgmUHpzVZfKKZJVc+iyRIZLD4CL95yFBSM7gg8BueEkhQ5S5Tg18eo7iOof6XOUcXZZUkEdR
	+voJKft5bpma/6dP0Llw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKg-0000000DNhe-0dON;
	Thu, 22 Oct 2026 05:27:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlKe-0000000DNgY-2b3o;
	Thu, 22 Oct 2026 05:27:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AF6743CD4;
	Thu, 22 Oct 2026 05:27:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646834;
	b=ymq1EzUq0X7rQkIuKjcRG1ZIhM7zGktD65QRcLmiZOa8p6uR3qgpsEohyU8U0Rm0ABhK
	 D2SrRQfCAFNZFeC3kM/qFqzCEoVJyLEK9ccU/IBe10KMcrBULp0gBhYSRQe40rm+pfTDu
	 qU4YyZwKEsnG4KXfTn1FjIHZEKbFsgLU7op4yNmoG88t6NEri5DG3PF766YLZz7ob+WEb
	 k7mesMS2mpp2d3YT0Qlsw1sdzP0RoDwOeP8sR24owoz+992Gwr1ZkREUGDCArQwYGDpSX
	 1FlcTzZGXRAbhvRh+WFihT43Bf9muVJ1tQELUmh8UyhaHAcoC+PcmrK4w/zfbKJKXOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646834;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=;
	b=QXJibFfJpboUdfxFdj0/fBXm2shiSRzkrCX0Hz3INaLc02Pigwm12YK9UmtpTwdNGS7t
	 XpMPV0pgtj+XsaY4uoWMe7cxWrMsuqXvGP5AwJ4hfUvqNaqdmcSMWzOcX7oKXGqRQmYIT
	 IsPLQb9SFXfeMvksJRCBNr6b3mpQNf2P2PQ+TgIS+G/1g5YiNCOAR7zjXWKJ6TgaA6Pe5
	 8ABp5+L75QYVwBCySldcqqITODGG9Ey5hhADwijmnK0MwPrV3DVu9mcfWo1jsL7YSKJsq
	 0HvdyQJ3QFDzNQWY8FQmpfv92+JjgMtNzVw47//BntPOQXZHbhOI1aN9XsoXTuyAALQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB3BB1F000C4;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646834;
	bh=URiF75PNgbvs4L4xvvh1xNL2wlNAAM0wHsaHCGFK9LE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n51pWjjK7n3iA1u2YBScMSudXl2Acfmei/E3qd1k4RJ4t1CE7w7W8K1Pvab4dfJxg
	 iI79BCk9RlGKpfWkd9DEvlbXYNstuvUBhC09J3+5KD3IrOiqIcqTIpWOn8Vi1729aw
	 z/bFJXQmsFsRlFymA+sz51w63BfeQ8J1rwcGqwR18T8BrJP7ym0mSYPjMGXEZB3/Ts
	 ggVuCRlViUVN3+cPLCqhUNaZ0bjJXFxQOHmCnOiwDRfOj3MWBLlAjG1/SQQNEa+LHV
	 ysg563bzZjq+o95invY8c20Q/ZwQKLNKQCyEx9Yjb2fMngZnPd89gHSLhSG0hzwVKi
	 XisY47NvjxWPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 417A04349A;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:26:59 +0800
Subject: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=jzgUszAuPQxlADtMxlXBVzmt73Um2B0VB0t/v2Ql/XWYmaugmAbh0CBi/5x+OaoH+alwOziwb
 4GZjXe/RwItDc3A6vjRRm4Xdt//iEsBfv20O2XsS8cnyZgIitdMBMFf
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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



