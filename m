Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC57CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=; b=nAWn7xbQoxCy75t33Qe4cMRxLu
	lBs6dvgu6uSDi2UfCAiFIoq22ZsELCjAHaynXkrVSoPavI7+w6CaK021A6ApcNhp2SmjLWHyk/+tV
	WhWdNo2P294ead3YCAK0qTeSYXwDtL+5bsemU0TaFRVsqE/RyDe0lB8iMYr9n4mLUxGaKDF1TDpYh
	8t3ofpPvA+woNe50cQtuB5NmWFqDkKNiuDeYjrEySIKkJoT57fJjMaQrxqt4sIq9SRkt+mIIP1T+R
	kryr28XojVeJ6VdEuUzSVVz1ggAbVuhHOhMW29MpIUfMOZW7j++VFK8+kxUFvGKRTwOaIsfUDYjPS
	BzBFkOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iX2-00000007eoE-1l1m;
	Fri, 17 Oct 2025 11:22:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWx-00000007ejM-0erb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:21:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b64cdbb949cso156688566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700113; x=1761304913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=;
        b=OiKJT9P9F910dy2JoLVLwar3TJ3uzvw6pbKm7xKdecHcewYvsri364EZYopCLE1kvt
         5rn0GeL6OfcuZmIRjpHYwqrP7RuZkn4uAAu0uSHdJ5MfVUR4fqCyr0c6ZLFBzux9HtG2
         SvJWwMk1yG5WanUKuF/Q0G99sHfrWXX5Nzmq3ijhR+aynVBqMv+N3MqNfnaNzdNI/2UR
         706HlfvOplk0Ih0c/aqAiXLJHhiWFTp7wkryTkjcTIhAH/jqIDhafSP5pSwGh/KxZutO
         pGWMrkYaP+NBvYKdgDfd5Rczq97IURUny2efsn1vR8o5gpezMUUazNsB5iNMC2lMTbIt
         hzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700113; x=1761304913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=;
        b=Z9aDCRC+BVoI7BAu2sBrjcR7Zy7YwFS0Z8+26ak4KMLbG+oozR0ibFhLGsP6P81JtR
         1UGmxocDMRqQ4g20Tv6E8zv46BVhRtQ+dEaAx6r2n7Tq61AqY5LX42IFS6vUwSsHdKal
         N9aedFh1tn9ZzZw2IdygJyKnaLRC6OcRbq9+V8+lqqsrR4kv+TNkZhU3oAZhrxn2loGu
         RYkyAGWuS0fjRqIx+4x2UYQa7q1faJcEn7XC9pi7//fpkNb6UZ4jqNQAm45EVQREajbC
         eiE2SbpmzvOCsbXZs7+Md+l5D0cSCoKxjg/tODsO8cuwSMOp3PQpik0/y63ueZW9srQB
         BwEg==
X-Forwarded-Encrypted: i=1; AJvYcCX/k/s5LKpHgi+EYHoLkBAaqEOWM3aTJYLjEMMJLFokqQyUloRFk9LEL/SfNU4Py8OempvalVvag/Resj/FSaDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzyEPnyLBXe/qVWutAffTnTkwatxgJqOiXBCni32xGWpQN119l6
	PaTbStN7bK19w2aLIvdaM3LRTT8XgaSItHX0hCpHRtv1pgqXdP6BLOeO
X-Gm-Gg: ASbGnctVkyoPHf/3wiauSlk23oZnxnZgdhoMMbeXnFZWoyW7bMybAUOt120Ee4V3ThB
	lr3fkKNHCQZHBON4n5xKl6YCfwKs1Vqe71IoHslUZK3Uew5aP0LGMHhzDNi7H1Uq5Zs01tVJzGp
	UcM6KKTMGlhuYf+7A9svF5UkDbTJu/4cPyOlX2A/P6bQpGbWEZoRsQKqsFZloJGF4vzPFbEQjFw
	PEWREeQeW7Y53ngWFOPV2TOyzuo5HeK0GDaBiX9+TqNe7Yk/m2FSkhLOGBfvYK2gWWuIMf8+r99
	mHusQ5LRxAK6ooJE6G+O7e0FSt9H788Bf4NkfVCf4VgLX5+g0/AgccjKc0X8zQVDyxNR1kvuHRw
	1D20/8t2pzM+CPH0LkwhRT5FwvOqNOW0i34Wb04ggOy1GkOXoIYQ9onrBRZEmzhZxTLw+R/WmuD
	7P2kyKzW71cHIQtTMxHwGRGpQvwcc=
X-Google-Smtp-Source: AGHT+IFNwxALXcNX0FiT0aapuBu2Z9QWfQyDyDhYXyKBSinI4TH4m3Od7Om7Ykt8jQkZG5S9C0wOAQ==
X-Received: by 2002:a17:907:86a2:b0:b40:f7dd:f8ee with SMTP id a640c23a62f3a-b6473732c83mr382329766b.28.1760700113139;
        Fri, 17 Oct 2025 04:21:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Fri, 17 Oct 2025 04:20:21 -0700
Message-ID: <20251017112025.11997-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042155_219143_2AA2330D 
X-CRM114-Status: GOOD (  15.05  )
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


