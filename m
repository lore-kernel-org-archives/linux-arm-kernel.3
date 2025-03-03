Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AD0C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9Q1CGP4dTc4ReWFNLDCwkt5znmDQGNIDebPCmoEtHE=; b=qh16pfW5naVkr2nzMm1j8W60gv
	U9ohdOWfFh/xfEvlI0WzOFz8U3y4eBNZxcq/wnMLQHnbOGxkYWHXbZsPiz9y3uv9suJwq732pe5W3
	Ea3otEtV3NwGZi7khXqDczy4+UQk6gdLKbBj+E/AeX+uz5bpkUOAif6EfuYbKno+OQ+9mRJX1hx2h
	6qoW8+x01dJfDEu8La7rix7MJBmkJTXzXM+ol0Sdr+7SU9NP3tHruauLCsdJ3aaM27vZYuJ/NP7nl
	Lkwm/DcmdBUUUr3i8oGqaELvzGvMOcEcBWsNNYgogUxQ5QnkDQU0bTCISf4LaXJ6yjfYnhgdvhwKA
	IcGudsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8Ny-00000001S1p-1Pj3;
	Mon, 03 Mar 2025 16:11:18 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7ue-00000001MNy-45yC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:41:02 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c081915cf3so612710685a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741016459; x=1741621259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9Q1CGP4dTc4ReWFNLDCwkt5znmDQGNIDebPCmoEtHE=;
        b=bUy+pr1X2k/DMueXP0Y8qETmKD0O41SFtZFvB9uCN/qpnvE4prOvQiRgnJJyZCPDNf
         1gvFOzNmuy8Pb2d67Kbur+aLkTHROly7LOkFOmwYCdLE4wSFS5x2nzJe0RhDeja8yKdf
         f0jyLmLCMQa1jiBiGYyXGrro7EgoMLkr9rO//T4AwPmgBczDlEdqZs61DMwjNfWeNSiw
         VMnyeLZzseVu6lIrMLtiB0iyD8Xd5wPRsbCYrQkuGWbEheGjcc/pMCp9LbbiZGgXsTZR
         hWcbiScKawDwIuFOSpdlRGfdh66qq475FGhFlldN0W2VrTLw94RcDSX5hLhQbWoU55rt
         07ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUBEmwA4cOwqWBF9wH9y31Uy3ItkRZS0iWeKqJ4Yb/+6xNcY6h16tDqQpdzIcBfv2TlH0nHBGhkIrZ5GrcHRq67@lists.infradead.org
X-Gm-Message-State: AOJu0YyQPdpNG2Qz5RYPMRcgYyi3FEQ/UN4aEpBdUuefxk3dPelKLwLT
	6h+XsSFLwZafJ9kZKz7g411vpQp4MOA+3G8+FtJxBaWtqMyPPpzG
X-Gm-Gg: ASbGncs9DgZfG8cWh/nb0ju2h9Jx1VrnfUXyUdZ/gvqgZYg+YplfULFtAeelOo6rs/s
	IQdwWuMZrw19BFlzDnop7l5U3vgcYF6w2sCKTDS20dp6rCanUNGoVL6sB1Kr7dRNbTrtKnY6Fx5
	Rx/0PnPLuGkIbJUA8jIdyWczwjQdoCvEFl8C2koyqiGJMsdyFRGiuc0RcsIFiH0ocjWmNLIABi4
	maS8ObKx7HRKzr9xcW6oXkCirGABfKpYGmiHupwc2XqlPkimqNHiPpMf9Oi3b/wSrM5ppszknUu
	pdJOEN4c2wmR87IJYVeoUjbuOUY+oVGnYAFmjl9vSJcyuDhgcejHg5w=
X-Google-Smtp-Source: AGHT+IGMYW21aDwHdBh2fatxOmmOzXnLq+QcGm1yyhgrEjUujkrtZp4lmeRrA3XkLXCqUwF33zdaag==
X-Received: by 2002:a05:620a:5641:b0:7c3:9d35:2c91 with SMTP id af79cd13be357-7c39d353655mr1526898185a.5.1741016459115;
        Mon, 03 Mar 2025 07:40:59 -0800 (PST)
Received: from Skuld-Framework.gompa.lan ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c36fee9d22sm613629685a.21.2025.03.03.07.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:40:58 -0800 (PST)
From: Neal Gompa <neal@gompa.dev>
To: asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple support
Date: Mon,  3 Mar 2025 10:40:10 -0500
Message-ID: <20250303154012.1417088-1-neal@gompa.dev>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_074101_014198_CB583E43 
X-CRM114-Status: GOOD (  11.79  )
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

As a member of the Asahi Linux project, I (Neal) have been involved in
reviewing the patches downstream as part of enabling the Fedora Asahi Remix
distribution for years and have recently been reviewing patches for upstream
submission as well.

This formalizes my role as a reviewer for ARM Apple system support patches.

Signed-off-by: Neal Gompa <neal@gompa.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..052e6e997817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2212,6 +2212,7 @@ ARM/APPLE MACHINE SUPPORT
 M:	Sven Peter <sven@svenpeter.dev>
 M:	Janne Grunau <j@jannau.net>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
+R:	Neal Gompa <neal@gompa.dev>
 L:	asahi@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.48.1


