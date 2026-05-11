Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3733ECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=; b=AKUV+Y/4VyQK4DSimjqQSBTv+e
	iqLQ2vbfE7o0jEIkgxaJRGbEYkiJLwADSJENV+IMgBgDFLFJ5wnmOaMKBLaiAAXdSgxSnMuKhosdY
	0dx+xwReHPBC+B5Ez4OXCURY01oghXHgfrUiHc0a77IOFTpHrVaLxI/Mjumi1WXPEAOakhSfhOVLz
	6M4N4wt0TqRMo1nvhqlg37CRkkjPMZzB8WZdZZpv9rPcA5JxmJDe+2N44kxKGOcnxmSqb1Abgzlif
	glHqLM62hURHbo8C/gU8zOseRAqe12hoS/fao+wM+zeN+N1mxMhikq1XWG9ZDfW9xk9A1qbfJMzfn
	LsCD9aLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO65-0000000D8Vm-3OV0;
	Mon, 11 May 2026 10:42:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO65-0000000D8Ul-13JD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 10:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=; b=tUtEoi3Po1sFfy0sWyeuHG/zwL
	33NEi4xqaz1k9t/KHpV56/iisoDy/CYwx8lwGSe2dmKtJanznF8uoSToLaaO/hCozU1SvBcD9fyHG
	jF6LacM2tQYsCU4l5hiMgTkfP3oFpvBTzR6HtbOGNo+ILpkYcrTQ26L+0TDUveAcMbdQDjI7GFql8
	O3PkvX7qeGTxSUb2blxPxzE6pigYHs55+OFwUzjnOwXJgE44iRFsbw6vd2YpOoGSC7vxcqieqksYX
	73kdseoOc0UYpGOk/zGr9keRUX90jOZ8Zc4W4h7g7yqo1b4PoSYWVFdNQ9ePr2gE71mPICBBRTli7
	wML3D8ZQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO61-000000080gf-3hnu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:42:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso380640a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496163; x=1779100963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=noMpMQH29nujt6raAxYLOV3cOquYIpYTJScc/OneQJ08MgFjTsCaXupxMzDrRKDBIH
         8KXu/8nwwDkBzaNGu79xQN51EUoH9flh323P+INtAKgdyiYtDe99cVyg7/N8Kez3KMiB
         NjdL6YvhBjvGPyiVo7syp7o8tUvT6A9UyQCrTDB94VCWC6L+8qAOiS8vTs5vUkevvYWA
         eN+OD1oOh9cxe7Whyi13ZfE1iwUK8BF1YtReJGm9dEaZiySLrz/ISqNE6UFYXRBQ92gr
         5uKmabMDNObBn4pL9NbsNLHu1aruDCvTyusL1X0ZSivwalAA0lJcMEZunez5ScE1fZNn
         15Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496163; x=1779100963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=Z3vvy/wrpV2ZI2bqIKyw7G4vVMvKZ0ecOXcAgk3ulx5jgClyI+3ZgT3+TmWeiObzw8
         Ja4VkaIY1Z3BSxHxWF/aVd9ErlUSx8GPtorjLJ+6QhW7/KEh24A1C2ezTIVAGZRWvg94
         GlPOm49+xD6E40jDXgBScdHAqOr1A2x1JDYAprwDLh3EomBNi2tKYd7bsgab7YsYR1k8
         9n/MdEa9KQfUQh7Dbj3bRZeSeL/UeYybOGsspKAePgCuKwm+BnoKOtr1b5tKfzy6LLpy
         FlTAWYMCVoDa6C35/mJdR363WgW1H1ypAm49iuNFxe1cFLqWrqRPXClMr0Q5jMIBjQTn
         O2oA==
X-Forwarded-Encrypted: i=1; AFNElJ9wA+5m19y96AEKRldnkKbO8CLzSSzAQ5tN/shWNRPzNoG0ikKHHAGvmi5Is+jj8bYgJ78oOLbRBkg66Q8ugXuO@lists.infradead.org
X-Gm-Message-State: AOJu0YxW3r/eMXCvtt4PNBrNgJz3lqWZOn3WxJ8+F673zbPBG4kKySZf
	mUw4Xzr/hqyJ3QtJczBeyxpZWk4wZ7F5Pp1oYKRudWlool1OyehImBsh
X-Gm-Gg: Acq92OFOhDnnRsO4uuqeQZWcEI3o4XmAsWnYoMTKnNpGUjjSpXburwKoqykJ9bFT7G3
	zTd+Z7gMxl4aMMCyrsSOV6uiA1QY3kmhjMjNS8bA19d5KumhXsgkc62t5lBC0bOtYi3L7AkoDDw
	XEdDqGppqs3Y49K9LK5mzQVGum0ctbN9dToNCCphUUl5NOe4Y2LlxMNRQP/hqStfRS+avOpmnuB
	fWEueti0y7y4rs81PFu9nuF7TGt25OKTzSqH8zjx6wUJV1Pve9A47tBPfb/akOHRR1qe8+faTjq
	JKUz5ujZhiQ+0ZjbthX2RWeNpjeLmxBLRkUlAbMi9domyYgSJ1z/FpdOvlaEypFVRyT6o4fszMM
	JXLwZUaicui6EE9K+5TYkwSOcne10Oknf3MhWdfSan0tmN5EvuQdaAsdyYdzdRja32IWFQnnZbD
	fEqXb6gCDNzGKqTndlmQ==
X-Received: by 2002:a17:90b:1b12:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-367d3c75385mr8912429a91.0.1778496162532;
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 18:39:22 +0800
Message-ID: <20260511103927.279550-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_114246_071718_65A47C30 
X-CRM114-Status: UNSURE (   9.35  )
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

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v4:
- correct default lane cfg in commit for 'fix link frequency handling'
- fix messed header (the Media CI robot)
- move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0


