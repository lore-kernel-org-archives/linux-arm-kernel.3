Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98964CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=; b=BgAKdAcmLGf0ubClVj6mFhci/O
	4lZXlgUAE/WJU1uxHcTwM+/UlSriXah6HUCxBIbnwIj3Krm1gKCX0EQwG7XsXPnQKa8/SXaNqHK59
	raUADcgg1ML9EUR0OaF55vB7n+/WzTomUS4SvzlOUbu/2be+nMvtZMpircVIPJJOBMPpokU4uhIdI
	U8je2YMOfHw7RELe6+DRh8wrNPSNClEZqshuXV43AuCNuc78LAVQ/MvYO2TuaGwXD7V78wEkIUdBe
	Hf7C7seL81Q28hOOiY0r3MZQtxZxc+APALAnhLRg5Poo+kIisXHOkL3UqN7YkBfYeqmk7jY70h8dj
	lLfUhENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlg-0000000BkvF-0AYs;
	Tue, 04 Nov 2025 12:04:08 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFld-0000000BksF-2KB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7200568b13so178912966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257844; x=1762862644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=;
        b=HqEUfu8lWHoheoPqzv6Q1DYWgL0JrLowsbfW6WTFt0bvhNs2sKIH+f2QDZF4+b8dPq
         6PIBiIsp8CMxSJa1O4IE6IUxub8ZHd1Le05V268TFpCPTQHlAc7HE5AF5ZRfXVTaCLyF
         Uo3cFuM3z+DBDE1QafFfI7+U5H9pfplsL4QQV6BZQPxtl5NTofoH/l5R6azTP6BEa9/0
         xczRqd6aDLzGqQRpGrKbiasoQQkRPcoPNGC2rPH844p1xTu2GPdtVdN5T712uiweXl4Q
         xMMYBVG+ajuVjgY/oekvqrkUlZH50RqTW4t2rcDCcumQcmEKGxiZmGMLYU6/o8st/hDn
         aiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257844; x=1762862644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=;
        b=jWlK+meCw/0TMcaPKeLQN6aRDgk6kQHSXl2/uG01/kiIxKrFSk2HmDFE7IEcHcBCSY
         9LAbVZOSkK6+Ac3tbhBUOKWZrN/m0wO/Tla7oxndRfFnAVIkgAkJujbrjmuGOlYdRMo7
         Q4nyUoSV1KNc9t9aXc93c9yJWy39JYI5FlN7GszcaRe4lMlRsWV8NZ6UnB2/u+Y+A0nx
         Lg7i1NP+iuTNs76wyiOhINC3GQBuviQopQCIfce77lrcUhJkaHYkfoDdxu9eD2b3HvZ+
         a0jvoZsPvxDrSo5EANZ3N74SHJ9MkkE5gvWmxEXsT/OKOt5xQFSVXU5XauMSDTdLlX3h
         /tVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJQYIsClUI1TMNWZQSumWN1/hLxA6aEWv8+QvDJcJplX37ETVflHJrnuvR008vGhaNMGBvHjkBSa3hk48fIzjI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn1+6vdH5XjijIxtgjoajW9gOq0DQFDgHRH3w2HojjGTMjmQDK
	uwSOvHo6acefvH80WFED8iYN4yM6DR7+f8n6VaYn93gTp239J5PMPtik
X-Gm-Gg: ASbGncsxJ+a5haEoJVkIUbqX5qZHFOtkizyHh07gq3TWrgnol2QoNcISmr0IqwZ3He6
	IVtLeC4mRAPrifhmhqLxOEowQIztIQZiH9o0DBNQIASBMAAkToU9ZYb5u9IX8oRl1yz/dMA54xF
	xq8OD1jK8vP6djcDe6t8DfbM4JiJhucXe9Krcw4TRePdzjblxUP/2sYyKv3QQG+QQWveg3MjkNS
	TRviyWcCau/0rNm7LkMRVEhBQB3fy1CPfdHhsRdALt2/kirwQevHinwnjBk5aB7TEUs2uD13I/y
	j0z+B7tffz6pDF5J0GZ0mawASXv9FAYIW3PD5tTWFJu1+v5UDZ7LEYMvM6/oicKl0OePM0BC1j/
	whnEMlJpH0JK/lbVWByziYGcSFX09zBQpS+SB2NYhqmGn3iuXSxtJiSUPDhrK/tGY28v7o2YqQF
	SvdLiE0+pJkCSy8NN0rt3zUA6BhQ==
X-Google-Smtp-Source: AGHT+IHRrE0o2sdiIAqRFi5TYM4KHbBFm9RA/54j9UR13Jtqc+5S0hJxSBlIU42MxJbJO58DHC9lVA==
X-Received: by 2002:a17:907:3da7:b0:b4b:e419:9af9 with SMTP id a640c23a62f3a-b707018cfa3mr1722945866b.23.1762257843561;
        Tue, 04 Nov 2025 04:04:03 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:03 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Tue,  4 Nov 2025 04:02:57 -0800
Message-ID: <20251104120301.913-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040405_617892_35DE1FB1 
X-CRM114-Status: GOOD (  15.43  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index eceb37ff5dc5..e9643365a62c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,11 +14,7 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
-
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
-#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -29,17 +25,17 @@ struct imx8mp_reset_map {
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.mask = BIT(0),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.mask = BIT(1),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.mask = BIT(5),
 		.active_low = false,
 	},
 };
-- 
2.43.0


