Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90785CD6E40
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43dncmcpoPcEiEFMQK7ZioMfiXdqYQpRQUMq+Ynrrl0=; b=HEbd3pSHdo6AcAK/I5xHSKsKqt
	MkJCdKxu7cZY/QV080maY0DBYmqmlGqW70o1eXaBsjAqv5Fia75N6fJ7CQcSfGGudIHjJmioiRiBO
	gHL7rw0FooqBPuZrVx7gxuCWRDKqWBm+89TbzZb3Hc0228E/MFYzUELr5OhMmsTtrEsEuFtjAHV2I
	RcIngHA+sNBTPCv+z4zDYANRwYY7lCdt/6Sjz4BUT3Ub1/abc7Jh834A3V1KU3h/+Av4xDBTJDUHC
	Dp3O9eilEct9hZAmdiux3bcZTD6VO2tZxn7vVgxUai6REUyHchlSoBWcicKPZtesNJtdjf9cFujBm
	+/4LrKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnLG-00000001OWA-0i2x;
	Tue, 26 May 2026 08:40:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnKz-00000001OK4-2ztW;
	Tue, 26 May 2026 08:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3546F40E88;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBB34C2BCC9;
	Tue, 26 May 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779784832;
	bh=dK6d6cYoqFc3ZfUKf9JNJjrgbE7x6z5aNRmfsd9a828=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NkB8NsjcnV73TcMgKtM5K7PZYJCymRuRmuMxVskgVAZM8r0WiOfQqWbVGazBgjmtX
	 twsGmuXMD3jkvQBiNptHEzJlBYVYVWsDOg0w8v8T1YJn+4hyKaTZalkk3ZM4pLjPIw
	 epk8NdfTE7MLaeoGh2DZJoZ79q4PthIT3geepOHMaB/k7keg7ubhazX4jg55iFKtt8
	 yiEwPbEePlXAtBgBmITm6IXW/ooP5rqo1W026GeD6dk85OZImTlI2mscayw/iNsSWn
	 ywLydZl9LW0aVYQzKa/3eWfa6pEw5NieEGFr6abJXJsYSAX+j+voOw5QSqWDpLwaxn
	 HwP+5gHUMmVGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3134CD5BDD;
	Tue, 26 May 2026 08:40:31 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Tue, 26 May 2026 16:40:18 +0800
Subject: [PATCH RFC RESEND v5 2/6] firmware: meson: sm: video firmware
 loading via secure monitor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-s4-vdec-upstream-v5-2-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779784828; l=663;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=2+l4DUwLwWn2GDHI6LoxkCkn7TDYkl4Sv8Q4p9SlS/E=;
 b=K7DQ71fqbh3rYm2IuWeVYzvl26czXaJUk8ABXFSly1FA93FtCy5MvdN+V97ol5CT3L/Ne6gVs
 uiXU0OZRZ+nAqzEtvPQxyrRgdqJ+VgAZoNl41CZfQc9FQaxaTCVp9fZ
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_014033_835172_514F8108 
X-CRM114-Status: UNSURE (   7.57  )
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
index 8eaf8922ab02..f40867a000f1 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -14,6 +14,7 @@ enum {
 	SM_GET_CHIP_ID,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0



