Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB27CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H/v/BO2s+C/N+KeMLepP9unKc4wiBqpI25gDLTzhr3g=; b=YLi+TBuCK1Iuo/aandeGmGVvBG
	90f18+EBDJL45c48UaHVB1V6vs0oKc39qnm/7I/ZXGKbnaZBXrh/vSUrfO8e5w9A97tTt89J5L8IT
	DhRNwD3euxgjOaIgIw9g/xODhdo7ZWkSyOdV0tk6YJVEMjeKu4N+jf1mPkzQyEa0wLvnC0O7FfqoY
	uJZAdATrm0yDoQwG+188s2sTjodxvrU7u+S/b3qIQm3FJ9/xEa0ypMOibVtVNk76vf3368sGq0XJU
	Y6MZcJVY0dKrTMzMamv6thYd4i3SZ+DEmc7PVDe9qI4TZFyLMuV+lK0vogYS1CIffjshuFmd8ETY3
	WcbNbmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUey-0000000EOg3-1HsY;
	Mon, 11 May 2026 17:43:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUeu-0000000EOf4-3aM7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:43:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1843633b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521392; x=1779126192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/v/BO2s+C/N+KeMLepP9unKc4wiBqpI25gDLTzhr3g=;
        b=NV+XuDutsVdqC8RMSIFMqlR0M3Rix/lnCrhV9whMtb86kvTtBJ/j1CRXoYidfl5Soc
         raVDxcSAGAdQY6E5lmSUfoecu4XgX0RgkSZyU5rlte+WQmgAfPjoz66CQrk2PHKIZbFN
         hnWr9jcBD20c/8igcu2PsbMpqm0UE2PlYVSFywRhH9qk3KPgocm67g2qe2ezFxJYnF61
         ZGCWRkARNHvJ+LQP+WFP4kn0KI0O0oSOn1oR4Qz5LjGxBsJQYd5IcFD1XCeA9FKPQTfn
         jFvDeHDHkbiXxzgcn4a3NGKqmKnW1aGH3g7fM5Mmr1zeiva+KFFVGSPJSn4QDDEao4Rq
         Tobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521392; x=1779126192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/v/BO2s+C/N+KeMLepP9unKc4wiBqpI25gDLTzhr3g=;
        b=GHwG8KMjGhyu8upJQQcDLB+GCYkqfXYNLCiHvL7nr5krvgZwCwZra2/UMffcwrJfKZ
         SgcGusdnYU7URWXeKaN+AGEMJJ67A+9fN6o09Q2H+AybVBwfFCziREox5xUNEJzM9vGZ
         JniYvEXWS0LJcMGe+pG7TQzCCRb/6qCv/n+6x6TrjkoSlR69uwiZK0BcBeK7AfJkjQsP
         wb/nP96899vbTFA3GlLptybNZsFbNT5Y/IKPr+f4R0GKdnfJXmtIxDuvr6puk7ZKRCyg
         Y0wU6pI05fgKeXj1/ARBIFMeu6LcIkCwi8KuWB1YuLlWy+ykxlJyobaRFuOFKqrDdjil
         LtIw==
X-Forwarded-Encrypted: i=1; AFNElJ8s4EetgEegSgtV0TDun+HYmnjsqdn7wsMGfcbB3ZpWpKSyBtHyHlaMBttE7FCCozNYK+VrqeWMaumUMvGFuucF@lists.infradead.org
X-Gm-Message-State: AOJu0YyzXL+or9PbWaWk1S2lrkCtk0Qmku+mpoOkF2hCJ64fhSU5Sioz
	DxivXBdStt8sVNXe5t6pypV4Vqfaj5Jp78M7uHjnrcgWW4YDVQjwGGqB
X-Gm-Gg: Acq92OFSU9UJVYRvbebqNjubmrjDUJPFdaAItkxVMIie9Q/82cCf8CF9kTj6UT6qaB/
	Y2lOuVH/CgGr37Gjsm3x0owGJtyy2Yhc/nYgdB6iS+RZXxvCzopv+WKOb0o+tnMu/Ar1MybXQJz
	AVVW8ZvhxELfgxzNYK7Zn+3OC4eHGFNhmAaMU4P6HOC/pUQp++r2XUiSTs1o0x4G7g2jOE7lIPo
	1UM248iqV7icD9SJDAAfOcFuJc87abcaoY5YXQDlZvqAxY5Z6iuZ0n/GK4r6CkP2Qg4vicFdluS
	70nU/Yue/KR2MzlbZwPj/8VK0zopV80qmc4ivLp8P21ZeTgIwduWQ6kwQqB3qLUcyVDIYyYbUqt
	i2MpSlen0Un57GovsX/eqeG6T0gCOagAieqGa/9YWWFUDigqeY/RqolK9243rKf0YouYZcwSRwn
	4I/lsYGBWw2FrovpTT+mBluiH81DfFeDFu7/ll
X-Received: by 2002:a05:6a00:4b12:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-83e39c37b69mr9964792b3a.14.1778521391621;
        Mon, 11 May 2026 10:43:11 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm21398367b3a.22.2026.05.11.10.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:43:11 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	festevam@gmail.com
Cc: linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH] thermal: imx: do not split quoted string across lines
Date: Mon, 11 May 2026 23:12:55 +0530
Message-Id: <20260511174255.215207-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_104312_891605_6C5FB549 
X-CRM114-Status: GOOD (  12.02  )
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

The checkpatch tool warns against splitting quoted strings across
multiple lines. Join the dev_info message into a single line to
improve the ability to grep for the message in the source.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/thermal/imx_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb..5aaacbc5347 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -693,8 +693,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	dev_info(dev, "%s CPU temperature grade - max:%dC"
-		 " critical:%dC passive:%dC\n", data->temp_grade,
+	dev_info(dev, "%s CPU temperature grade - max:%dC critical:%dC passive:%dC\n",
+			 data->temp_grade,
 		 data->temp_max / 1000, trips[IMX_TRIP_CRITICAL].temperature / 1000,
 		 trips[IMX_TRIP_PASSIVE].temperature / 1000);
 
-- 
2.34.1


