Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8350CCD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjz47cFF0Zp3613Ye9IJenoOjxsQkT2fNoo1fCKoNSg=; b=mcL/y+a9qUQQ5sxYRgd9tIUUsB
	UJ+JN7q/M4BvRPGSq8sy6GN/hcf60szllogF7SCDX85+7bfM22zPcZY8nrehWtIU95eyQulyM49lb
	Hdnny5/MSaEt10Cb7OpTpPtsN9OnwuqesP9psogCV8TReXin1D2J8wRD4eiYesPk8omw0QOBQKGwl
	SD7Mx7n77P+tZyjIdnUOwKrJ+W96nw9LctifITkbFbzKBXox+8DgrbBm+uGYxGKcTc13GSQMwOVV5
	9P584tCmassKz+TQRq0gUBn8d6ZIFlJh1VyNqm7FznZ0lW7PBLEJKe3VlIYtJa+2idrB5ZEGi9/ME
	A50AZOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmIt-00000001H6w-1alm;
	Tue, 26 May 2026 07:34:19 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmIm-00000001H1M-2VDi;
	Tue, 26 May 2026 07:34:13 +0000
Received: from [127.0.1.1] (10.28.11.83) by mailsc.amlogic.com (10.8.11.35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 00:34:08 -0700
From: Zhentao Guo <zhentao.guo@amlogic.com>
Date: Tue, 26 May 2026 15:33:37 +0800
Subject: [PATCH RFC v5 2/6] firmware: meson: sm: video firmware loading via
 secure monitor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-b4-s4-vdec-upstream-v5-2-c6edebf5ea89@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-c6edebf5ea89@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-c6edebf5ea89@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779780841; l=663;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=2+l4DUwLwWn2GDHI6LoxkCkn7TDYkl4Sv8Q4p9SlS/E=;
 b=fisoGxmpmpD3OGsSymtZjeoHzqY31q5LtOvvKlcXp3nr6ubgkezELz5uqoiy8weF+a6qSHTOO
 a/K/VbOG/dFBDBFiJTO8C+PKqcFqIZhrSGzyUJQ2KYEr8zyz6eUfhVP
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Originating-IP: [10.28.11.83]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_003412_697951_4A82D27A 
X-CRM114-Status: UNSURE (   7.17  )
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


