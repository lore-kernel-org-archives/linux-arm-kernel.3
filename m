Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1479D4922F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzHhfS5PaWMsOojmjdMcQvZwVu+U7bnAwRzoSZ9fvHY=; b=HdVz3KvsUGCqksEY9/ZL/nCR74
	S05GCI23KajT41xm1Kc13bXHdJxpDMpzvu4kifepo66HKiNJOpgMRcvie3D9fpQkATbsQknYK5n04
	vRGIJgtDVbFm8viDeBZqgUfB7eh37eF6wGixAkRfqHFZ8kJeUDIWUAK4eo3vCZBPIgV8GecLqAMmv
	RoPvlEtXhTg25+iRjC2RwJpTgwa9wLWtFs9GEnQm3IGtXLZoi/DROK5Ax86co+wpOvmJv1rA2tga7
	RczljIOGE0fBLkNWW8UCq0trub6eGtYbC9je2BigbxLuYEkI4KwF19pQkmcvY1LMCNWtGHmdTZ6x4
	eJyRfR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3KE-00000009rp2-2pkw;
	Mon, 18 Nov 2024 15:06:02 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3HS-00000009r9p-1D01
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1731942187;
	bh=wanikvVx55Q2iWKAifFPxcBSccEU3MSG8wjRU6lkedA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LT6ozaV9+SGX3smbiroyIdiAUyHy3jO21OkA7bT+dcEWMLfCSw7UPjd2DUcpnjWCB
	 q3ojNF4XT/+BdPuppdYcnTMF23KfA7q7Gxg8ZJYBoAcDdzPT1ExL/ygKqN2zLaBmrr
	 cnzpxA+/iatbg8lvXf99+zIdzWq5AiU1ODeV2ugI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 18 Nov 2024 16:02:47 +0100
Subject: [PATCH 1/3] perf: arm-ni: Remove spurious NULL in attribute_group
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241118-sysfs-const-attribute_group-fixes-v1-1-48e0b0ad8cba@weissschuh.net>
References: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
In-Reply-To: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731942187; l=835;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wanikvVx55Q2iWKAifFPxcBSccEU3MSG8wjRU6lkedA=;
 b=dbOlKuFnLw2c05vLlE1Ltp5tRxeYtT2OdfOx1pn5ntPiIvPkYeOAOwH7VT1+GPF+SMEBqtiKO
 GEa0gd4UCDYAk2yWqm0N3bLAqgTZyvO0obImcIL/iVwISKM1sJIb8IN
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_070310_481437_AA15C58E 
X-CRM114-Status: GOOD (  11.67  )
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

This NULL value is most-likely a copy-paste error from an array
definition. So far the NULL didn't have any effect.
As there will be a union in struct attribute_group at this location,
it will trigger a compiler warning.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/perf/arm-ni.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 90fcfe693439ef3e18e23c6351433ac3c5ea78b5..fd7a5e60e96302fada29cd44e7bf9c582e93e4ce 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -247,7 +247,6 @@ static struct attribute *arm_ni_other_attrs[] = {
 
 static const struct attribute_group arm_ni_other_attr_group = {
 	.attrs = arm_ni_other_attrs,
-	NULL
 };
 
 static const struct attribute_group *arm_ni_attr_groups[] = {

-- 
2.47.0


