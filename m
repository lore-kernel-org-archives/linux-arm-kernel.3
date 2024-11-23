Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14418E66885
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=; b=ot4i6GsNIZMrUXWK8gAH3xt7y5
	h0LnFyzGsPI7zNbAHyXL4/4KtUf7RODv9ez/V7n1yuGqTpdvgr8e16RsXwqoz3U7roF2xrZv4uxVQ
	ShcdHqM5QynNMriF949e82NZUaRSYG6qeVHLA42kp4NeIPfD/XAwEhZ8CYQNgi/IDoK0kIHFDotIy
	URuB4mKQo46flkakuYULIPLWi6mULgvUqvz7+hhGJE9zOzDOfeSGJzKMtPdlEaTAs0PLFzPseuBK1
	WJC1IbK6tdxg7WGrV3KLhZ406307re89R+C2f8fHSo+fLJ1i7Sr7A9h98ocoNISY7yfsujTnUP5Si
	VTB+HBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tExfz-00000004uEQ-0Tua;
	Sat, 23 Nov 2024 21:28:23 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tExe9-00000004tzL-3JTb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 21:26:30 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-46677ef6910so5777001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 13:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732397188; x=1733001988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=Zxd4dmp86ECJSu7nyxbQOQ8u+WBus58bu+v4j/WvWjWsiHdFFx5mbUrkrKdjdxoMdn
         EE5kLME8eUd19QnZHak2C55MHM5Thn4SgTPi9qpbUSWOIeTVo0LJEOzr5RXgyG2koewM
         zNAJm4kwpOqcNPhuPI5rSDBSITMk7X8wKG2k57/Nx2U3iVvRf2mGqGBfMq7xsA/Iv2z/
         fhHfdnHf8avTdU0zHzXzIbbd3U1WXjuch+fCk+Zrq76WWRizZ4b3mZPqdAbyL8HSHwKA
         OZS0gCXXD3y00u2xrTC+zInpqCw2GI4yfO9do/lPHMLHwRVbC9TOx4xA3EUBHVxGTfG1
         6K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732397188; x=1733001988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=CfcArurJBNXz8YkYdg2G424E3cNszFr85C489ftQGjJDO8UWp07zxNFpWxHESHpZWy
         9qbOJ+CuplfHuGVkvYqgrrrub9wFQregAnImVutpMuFL8+5eo7tbzWD0+REBYVm1FcKl
         /EOSeE+6SkhCil8XwLStm98iMl26I9cu8RVnoTW2VtBqklRqDLNTblAz+o5pI3akt8Lq
         buFXm6GzbSFleJjDzbAHpoxBN2uYFTUbW80RiqSnzFHHXlihEZoi/8BW6XM4aD9SlLFX
         Vc8owGHf81VAOirNroY0TZGLziY5AiBh9Wk+tuUGyuk5lG9/sfQ/ZJq/UI8WaK1mswsQ
         khkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlGsvzCPYsRy44sA+PU4YrWtcAprVELx2clUHvj80BOI0qbKEES5JMVWevkEJc4xtwHGNmpyqo4Yo9/UUDrHjm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzne3qW3RPOnK0TF/wNxJq/IlmJApkVNf/DoXS2S68lj/8mSfHL
	OQul4XgY+NT1JjeAleNoKAx6qUDSuYLjJfK6UihToPJijXStu9yX
X-Gm-Gg: ASbGnctPk+SzQKptcJrAuUy5KVFG0UGI3NT5gJ/O/W8cIgxrK/K9kOA8iqPY4fOGtvP
	Qk4NBYDH58Mm7MR8SJsa4KocWEFt5k6GBgGjtX5YhTdy8VuQNdVlicojQGcKR3RHQGuALL/tqBF
	1LF7ITh8Z4sGW2if8q5AMsWWncF1QSop9Qo6GtSJLQH1HQXuHQJd7sTBVo/35t7KWeAnvA5/7+v
	9e2bjg/L1EKjLtWtwtXIo9/zGLk09ckvZ1ePRgwlNDTu4HlzvSeZKIwMjQn/9HdmptG+Wyk
X-Google-Smtp-Source: AGHT+IGVeho4+d3L/Ey18kxCOJChbkbT+3uU9PNEA4MwfJkMBnoVjxtA356iLEH6xkrsXSKgRSWvdw==
X-Received: by 2002:a05:622a:5c06:b0:464:af55:64ab with SMTP id d75a77b69052e-4653d6367damr127407211cf.50.1732397188592;
        Sat, 23 Nov 2024 13:26:28 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3d9c14sm27763811cf.15.2024.11.23.13.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:26:28 -0800 (PST)
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
Subject: [PATCH RESEND v3 1/2] media: mipi-csis: Add check for clk_enable()
Date: Sat, 23 Nov 2024 21:26:24 +0000
Message-Id: <20241123212624.6237-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
References: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_132629_828883_C2946F59 
X-CRM114-Status: GOOD (  12.40  )
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

v2 -> v3:

1. Correct alignment to match open parenthesis

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..452880b5350c 100644
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
+					       state->supplies);
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


