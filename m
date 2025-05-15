Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C7CC10F31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 05:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=erT2m2RCe594SyWJieK4gDZ7RUm81EIuXqR66BWQTUk=; b=d/4QoOTCikwws0tZ86Zl/aVCp1
	sDm+HTfO9XK2SgMujf7Edn8VNzuVOxq35DpoSg9cP3BOTgvwzjHg/0MbJkHY0QEdkyZyrlPvJvR1n
	qii5+bsDKI8rFWf72D830MB28yaTMz++a71W892uy11ZYLToq9hb20MjOeowPefmK/MXr5lki88YB
	n0KlbF9LxctAc6DicnPn6iRNeikbFUavAxGFkSsdymqvqGcKYIGtIcwto1W1QtGxHkHCunZy6Acu6
	30MgCogi6GxmOklImdHf/Q3wYCLE9kegmR1qE7t3aMkmynGRhLmY+3RalnfvUC+Z96GY3fN723dQm
	ZbsuvBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFR1q-0000000H2Qj-3qfV;
	Thu, 15 May 2025 05:21:10 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFQzp-0000000H2LD-0EoP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 05:19:07 +0000
X-UUID: 17f4e4cc314c11f0b29709d653e92f7d-20250515
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:534e0269-6ed7-48c9-b996-40d776c005f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b3f768056e03a57390a9c96ad151fc53,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 17f4e4cc314c11f0b29709d653e92f7d-20250515
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 641998143; Thu, 15 May 2025 13:18:53 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 91A3E16003841;
	Thu, 15 May 2025 13:18:53 +0800 (CST)
X-ns-mid: postfix-6825793D-31509332
Received: from localhost.localdomain (unknown [10.42.12.96])
	by node4.com.cn (NSMail) with ESMTPA id E7A3416003840;
	Thu, 15 May 2025 05:18:52 +0000 (UTC)
From: tanze <tanze@kylinos.cn>
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH] kselftest/arm64: Set default OUTPUT path when undefined
Date: Thu, 15 May 2025 13:18:39 +0800
Message-Id: <20250515051839.3409658-1-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_221905_398328_E8820339 
X-CRM114-Status: UNSURE (   7.55  )
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

When running 'make' in tools/testing/selftests/arm64/ without explicitly
setting the OUTPUT variable, the build system will creates test
directories (e.g., /bti) in the root filesystem due to OUTPUT defaulting
to an empty string. This causes unintended pollution of the root director=
y.

This patch adds proper handling for the OUTPUT variable: Sets OUTPUT
to the current directory (.) if not specified

Signed-off-by: tanze <tanze@kylinos.cn>
---
 tools/testing/selftests/arm64/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selft=
ests/arm64/Makefile
index 22029e60eff3..c4c72ee2ef55 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -21,6 +21,8 @@ CFLAGS +=3D $(KHDR_INCLUDES)
=20
 CFLAGS +=3D -I$(top_srcdir)/tools/include
=20
+OUTPUT ?=3D $(CURDIR)
+
 export CFLAGS
 export top_srcdir
=20
--=20
2.25.1


