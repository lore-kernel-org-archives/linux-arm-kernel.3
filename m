Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57BD43FEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5+U0kq1b3c+GGw5rsDzUNZuSYw2uDdPwqKTihhZOLBE=; b=YA72zT4Y7ZSr5m8hrXfmazjM/t
	UOLeQcvbq/FxNXhUNQSrVnWxMZ4rY8RWpZw4GOoUACuAVe3q5JGUVpkhMrEai9Negijc3EpIgVNsk
	c4AmD3lTBV8/KrvRH4LpywuU+QDdueZkl55/sPSIfegs9pW812u4e/CtT3grB8XXyX7WDuAxMUh6Q
	xUnX7gPXASpJIqtNSqh7PMTpTKYhgasvqpyYGQEoykHvYDSA7qKGczRMCy0pdsmzxXUjohUBwJ14N
	YT5yRMGMPxF1hkZeyR5zDwcr/DFifhkI0YnGfPtD6gyk9+zkISWe1M/q8D8OZWk+n2iVAzi0nzcLf
	iUgA4YVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCxCQ-00000008nFv-2EXy;
	Mon, 18 Nov 2024 08:33:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCx6z-00000008lxw-0eJW;
	Mon, 18 Nov 2024 08:27:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso36889625ad.2;
        Mon, 18 Nov 2024 00:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731918476; x=1732523276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+U0kq1b3c+GGw5rsDzUNZuSYw2uDdPwqKTihhZOLBE=;
        b=k65rWWc8OSrP4+JLgiYY2EQND7GKNdq1UkcEBoHefiaZi+Pd3/7ypwEFhM+KEeEnXd
         0YaYnep0fIWWtC8owKFgoiyMdZ3R3bhbm7Ew4Zj7ixwExcD0XtVEyL9Z79Xt9y2bC+P5
         e/dY6C3sqo3sHblPOnZ5gf88VWXWlMZBfcH7oqHTX+zgbUTOYetzTFJeLJxchbwdMN/I
         YlykaIgJQ6boKhSXqu4mSyO7/9q8+jZeZIhtUfrQsWkvEEdkymr1HCtAFqmOEWkDM80E
         hg8MD5osfryoEtb6oKufRd7JYvpGsz4MtZ72Z0ozZPjxCR5Kyp0JobSoWPlzLNODbyOC
         +FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731918476; x=1732523276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+U0kq1b3c+GGw5rsDzUNZuSYw2uDdPwqKTihhZOLBE=;
        b=Qz2whz68NdlXSsjyOmSqTg9OsicX9mRQ1j8S+4Iy55BmzX+SVq73IktUlXaVcj4S1Y
         zlfG8Qv3oQ/Xm++hZSYiQkk8ceK85Z7REXvmlLqnuJXvifnUes6tkDlrTE2ZA/wu08Kf
         tr2mOgFeetysWrCefUHZyMRHtKwbxbpxt4sevLatBhTBa0Wr95XZxwjTvIGtLEFnRPhf
         ZDdJUX5nVfDYZk7WTVSLm4XksMqNApeINM/SocayMDXUCQViUrIThOPYTi8+LoyfJadX
         Ib1oEVw3Wr3E1LDh+md6QO3q2ocY5t3ahNWUpAPPnnCkGHVL2Rb9myn4S6Db2UZGWBXu
         7Tfg==
X-Forwarded-Encrypted: i=1; AJvYcCVZvTne8oucHBLuaMoY+AwWXbddYeflGW7xj/mL3TROWwO0ftNTCjLdyUBs8mdDOaB/TDqS/RUyXjwRLjLc8TM=@lists.infradead.org, AJvYcCWfPu9I6GbEW1xJ5akyFLYobzVsrOoff9mpWWNuJ6T9s1boBGontJI9GPqEgx6M+wFmbNZSYk+M4PskRuEc3uDy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2mtrRDYVARuXCeFCHT6IEyalcdtdVEAcS4R21OPYPl9nfv9rQ
	kSSPBt55wLCnZXwphPWJDFW2ZAUWYiNDTvNP1K96FX8TJyoq7sW2vsSO/IGu
X-Google-Smtp-Source: AGHT+IGw0jQZ/MrW6S/RKnnf4ocslcGhBOa1jrlZ+Hoh+2XZUAiXC2Jr/ZqOqYkR1RF0H0FBVXczxQ==
X-Received: by 2002:a17:903:2452:b0:20e:5997:c107 with SMTP id d9443c01a7336-211d0ec2dbfmr159737005ad.39.1731918475894;
        Mon, 18 Nov 2024 00:27:55 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21213a94970sm19695165ad.39.2024.11.18.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:27:55 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH media-next] media: rkisp1: Fix unused value issue
Date: Mon, 18 Nov 2024 13:57:49 +0530
Message-Id: <20241118082749.55233-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_002757_190854_092302EF 
X-CRM114-Status: GOOD (  10.35  )
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

This commit fixes an unused value issue detected by Coverity (CID
1519008). If ret is set to an error value in the switch statement, it is not
handled before being overwritten later.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..9ad5026ab10a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			break;
 		}
 
+		if (ret)
+			break;
+
 		/* Parse the endpoint and validate the bus type. */
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (ret) {
-- 
2.34.1


