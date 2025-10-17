Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15753CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=; b=bFFQmw23ag/FEoPL/7K+hHiDY3
	+E0Xk7QRd5UVEsXQSEh3jf1fkXbzU/z5rKwuMv78TCmjizciMV4L1/IGHdrotUU9oFJi2jPCdmiyf
	QJdsaJOXaNrnRTfBqXK86vbfshT1hRw/FYsuu6lvN+BWN9xT7y5PNkxgPXpFSG6VdFmXsDCvPr81w
	83T+KX1RjgsJvCqE+Jf5xBD6QIHLoO+87LErKe+JtGTmF0seqAH9L8Md70HhXdNhfYVFIzZBgTb9p
	mwp2A9NXDFm33eP6s268jOEU668+RMFAtfex9PDT7mAYPw2uvKx75uINZisV5ke+i9JKH1muLCdLk
	mWNgVN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWt-00000007ehW-3vOl;
	Fri, 17 Oct 2025 11:21:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWq-00000007ef9-04OD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:21:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b48d8deaef9so349398466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700106; x=1761304906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=;
        b=DDN1VRftEQyGwx5yWOvJLoVRiwIJPdjH9scVCOy6zQND7BLVmVR2VNuO7ruOyXp9Zm
         Q/GVNC4ZMnWjs3faJDDRazmLKoWf/TUHqQcnHx3stwxqDYCEQiioeaL+e4fo6bs19H+6
         QGfcQ1xH57/0bkW4NhDIpkID1uj1EqhZyafkqzXV49l+t4jeVCQqdkCVzdZHiW/hSyPv
         XXl7+KUq+HygjedITqFl+lW8EI8ZeKPcVBf4gyXjKU1TCTFMu9UoWRsWDyaVhwHNHtbS
         s5sjk0ooXgnyhoX9K8cScVn+2gSFhZpdkQOxveZUC8q3+1g4AhgCFJ+WvOnt286wMaUt
         NKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700106; x=1761304906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=;
        b=PQctIwFsobp9YHsAh1Vmt1KLj5aBPE4tmQmFSFpCxNOjv+zD8jKlxhFxKCDoCAo0Wx
         nLDZX2RKL18w8b0QZk+qzLqO/1LQpyaBolPrrH5N3wGmrtqjQolTY4WKoWKmflnz21Nf
         awLqpabWO8Wogq+sVuqg5cTRlmD9cYzyv4mQLJ5VftHeRzwmEqkYXM2z3Hh/T1K0qs2t
         8rBFSoNvyw49Ep2Y6FcjTLHMJT9PN8UsNyvyob3M2EUt7L21mb+TihVPbqD7KBWRV4rF
         hwphOS6YUNMuU0Lt+kxf/K3meRkEegwnZvKRDWmrGu0K33gs8TcYSPzZYANXecypvop7
         vBmg==
X-Forwarded-Encrypted: i=1; AJvYcCWBEjkXbg+p0kJVpS3kS3hKH6WO0ZZHLpJLeVseIe3r9vTfR2MJnNNImwJ5ISP6eACX82DfrR676mAa6xBYGtbw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyir0lQT88FO0QxN3kEKIL3Fh8UEC8hbhg3HkRxy4LAulcWG489
	bHd6dQcbDJeh5TSSB/Vax/gKUg0OBSyDxMzIOTg0Q/0QStDDqY/nbuDy
X-Gm-Gg: ASbGncsEiOBHYxY4mKxH6nqwUI5CwAVUTboG0sAGN1Dn8MrpxLL08OiL4VeEcaE2tzp
	x5NuIDKUDULiViSYGnwNd1dYcucjQFrjRMWD7OM7jz53Julept2jbD3g1qqtGHS6qz7zRy6sMI/
	enNlk48PX5j7mwCF5BqXquvRqMtRMFXyJbH30kKThw+ar43j12TOy3xMGvRYZPTw2D24tCLWBym
	fhe5PJ0N/8kWFkdVj5fQZ6W52Tfd721JqDOIucoYwTAQMw+GzKUnVfTLYEZT5rblbcyeqsowDyh
	13+fUBMEc/QL/K1upWvQ0F/zlivrJoGD64ST+dd/67GXJYQrgWR9/OtCUi4rZlfSnf/Yd7AnkfL
	f1c0Fl+3Ulgj1oFwTeySxDiXJFwsEN+nM4ShtPc52AOd9JbhluHU5nBWbChVuEJSeM549fIjasg
	J+mKOUKtMrvWTcliGqLE6kcnqtLfbCe3lr21YpZQ==
X-Google-Smtp-Source: AGHT+IHd6jblu2510v9bkHq/90oro00PKRRM0JXmjf8CbpRE4cA2knCufq3mdwx/AEKOqtQsu+8i5w==
X-Received: by 2002:a17:907:9691:b0:b64:6776:1ee2 with SMTP id a640c23a62f3a-b6473f42d78mr334179566b.52.1760700105898;
        Fri, 17 Oct 2025 04:21:45 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:45 -0700 (PDT)
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
Subject: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Fri, 17 Oct 2025 04:20:18 -0700
Message-ID: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042148_074119_1B34D228 
X-CRM114-Status: GOOD (  13.31  )
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

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0


