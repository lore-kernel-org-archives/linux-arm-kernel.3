Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77259E6918F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 19:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CF/HRhep9JBi7dLu2TPvpQtWrqcbCsu76aTE4DvPvS8=; b=ujFooHcqhuu7KdI6i3qg9SLTaM
	fnMJfbfLBvi79sJcg35YB04OevqgMTEa1lYVdsDmWF0nDu+Rst8zXvw5nocTCwOY6l3ZhyF+L3/+A
	zlUrds+ymaseQtbuRwZYXnLVONE2jP/l3W/vUKWhTe3lBKQO+iPFPSdtQJEI4dYlEsMoslVu6GmRs
	i3BSjuCL107+GqQKvk22kv0qrqcLf8szWcXqloDpA7qBP8u4SZDWVcqhdBh9YqE+g7poCWHXRv6TA
	fByvA3KGbXfxz5ypiPB59JoAIr/6HXdFCxtxGO5MT5DfxHVqd7tH/awRl7ih/Hd8RqmhmYHOX88uD
	0Mon6Xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZkQ-00000003Efy-1Jgj;
	Fri, 22 Nov 2024 19:55:22 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEZia-00000003E9A-2SSa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 19:53:29 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-460963d6233so15262251cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732305207; x=1732910007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF/HRhep9JBi7dLu2TPvpQtWrqcbCsu76aTE4DvPvS8=;
        b=QHD2dBdCuhLEyAbFJNNr8wIf6fjJdBN35IX10sLdRNlME/9eqIi+lk9I3/GJuXdW5N
         rgtuJLAlaflUv0YTGEmByZE30MEpnxg4IEXUuH4GjQAtIZzXqfaxDcpXU/oCOiGO5Lsi
         RFmMhnsGsf8m9h62r0ZfGGqkrQhtl2DlHfAXbOrPffnp7m/3vwp7cW5/XFvSG4lFvnK1
         k3xZ0ygJkfmJLarcwsUq4dd/lsmsLLpWBZ/HdQshc2QyJTW0HgLb4DAb0S7G/CwerVmk
         aMLpMlGUC116aO3q+ijm5uj4a+G2H9iyWB6khi6Fn39vOFAab7odTtjRdeTuf+xmlXSn
         UQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732305207; x=1732910007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CF/HRhep9JBi7dLu2TPvpQtWrqcbCsu76aTE4DvPvS8=;
        b=KzEJgUG2unmx6RdZb9YejP56dRwbKrVfc+SIoGceSrX5x8TUMRGCVyGpYCn35DrvWT
         +qDYilp2F4aI8xircyUZGOAFuRKnyzWS7eo20ffZdzTspBwqQpkY1IRksQlneB/FMacS
         1Bl3k2d3pEoQnycq4YeWgJzM8f7vYLsAXjoYj9a+AIvUrX+yQ/JEZPcpczemWr7/6AC5
         TqY+Qj3Z6WgnKW7AzXvAqTCopcXgLEf0e4FvtKSPIExBNBbBSkluaIoJprEnfOmWX/N1
         rpD7PYdJJv90DCyPE2gjMJ7UNLkOJRK5DrrU+pUcCTldNRJhmjz5EiNfi32/1bz6FPTX
         AazA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Kqzz6PqivTU04sp67CjBZGo6nT2YcosfQ2AndMLR7fmA14xSKIg27dmb/UlWhJf3wobgHjEkSCni7EOMtSgE@lists.infradead.org
X-Gm-Message-State: AOJu0YwnTInhddygWHNT16kjB6yrzPrTUa/UzHbAfijvfB7d1iws0fNe
	v2ElPulbLwTAU2Rw19HgepA4gjQFbmHtnB7S47Qv3H989VyAGtqs
X-Gm-Gg: ASbGncv6rl3q7maoyCIFvFN0obr1moNC3mPQGjv23HrrkVZBpy7N39pc/KAY0Vt/yd3
	gnRGqlwPepiU3V0SoPCvY2oTkORvI+NAHiO7uZZYDJyXLCP/GtHGFVGO4Mdn94SHvgLiGvIembP
	xq5U4gXigR6xAVlcnEF3lk8zyy0BjsNpP0DJ9rN0XOKDIcwZXCT9r/xBR6laE2Xi+1j5NwZUpFE
	rnL1fmgDyNdf9Z6Q9GiWyHyT9QOANtUQRhlgWFAKc7Rg0X2oXl5YXW31RjrflYS1FvVVXID
X-Google-Smtp-Source: AGHT+IGWS/TRquPL6ThkLaNpCv/OoH1M5+ix8LlZG/vqWDvFWeRjvAxoJJc+WnPkQLUTQ/pMdaugqA==
X-Received: by 2002:a05:622a:5c98:b0:462:ac16:e72f with SMTP id d75a77b69052e-4653d5302ecmr60216091cf.8.1732305207048;
        Fri, 22 Nov 2024 11:53:27 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ee8cesm15535781cf.25.2024.11.22.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:53:26 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2 1/2] media: mipi-csis: Add check for clk_enable()
Date: Fri, 22 Nov 2024 19:53:22 +0000
Message-Id: <20241122195322.42289-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122195322.42289-1-jiashengjiangcool@gmail.com>
References: <20241122195322.42289-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_115328_620757_91E7C8F2 
X-CRM114-Status: GOOD (  12.74  )
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNOS4 MIPI-CSI receivers")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..47b8e043aae9 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,13 +940,19 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret) {
+			phy_power_off(state->phy);
+			regulator_bulk_disable(CSIS_NUM_SUPPLIES,
+							state->supplies);
+			goto unlock;
+		}
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
 
 	state->flags &= ~ST_SUSPENDED;
- unlock:
+unlock:
 	mutex_unlock(&state->lock);
 	return ret ? -EAGAIN : 0;
 }
-- 
2.25.1


