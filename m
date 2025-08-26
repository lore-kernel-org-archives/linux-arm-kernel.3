Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48553CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Xc/PHP79K7OcUXYd9xwXOEeSBAN7ZoHnn2wNUgop5w=; b=NtKXVLAGAunMNY6SEuzYlxtXUg
	BK4oF4epVfB/MudNgc3gGOCWtHiCBzM9JbaKXqrr4WsI7/jARxmNCVRNHlQzBBrWyTBLd8yIyQwk0
	pQBDV0qn3C0yungHr76ypotBnNNOz9FvXYhivenSHU4N4mCBUAUqCMfS7kRSPEmCxqSyT/RvymKy7
	eiLnG78dkKjxPV73SqcEDFSZqlolhqq9nGThbtRywxy2+ShgAlctSukSVm9g8DAnda9V3sw2VEWMa
	812MZdUojigz+yTDz0PkebfeSbGKNWZmkb+QCnGsocy01Xq/CT0nOQPW56bP6IXnAgfe24uzat5F2
	DxpRM6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqut8-0000000CJ07-41My;
	Tue, 26 Aug 2025 14:43:06 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquc9-0000000CFvI-3DwP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 14:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756218333; x=1787754333;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4Xc/PHP79K7OcUXYd9xwXOEeSBAN7ZoHnn2wNUgop5w=;
  b=pOgjSZHX9SwieE0fB9iaw0NVUMKQJnLAD1h6iJhO3oyHsELDrqaWO5qT
   33G0OPbjzKEXtPwjcWwhgBUyReOpC/WCRI/QYCafT7qrjZUcyU6v8JY7n
   cbIkQLyt6TciepC8kpefjCJAYnqiKzbDIw+2Auotr7BYhKp+bmHYNBKO9
   yNRx/oO+amFRDazTQXMQf1lNMULnQnDdMxA9IBbCZNfKeoI766uyZfdvO
   JoCDGoEwe93PNbHDEfiCEIM6ff/V95FN8zKcu/2Urb/OamY7BSd3gNBvW
   xqH3wEEjLJLPVUom+0VuGx3HTt7YARdjKIroifep+t5SFU/d63sx1V9/d
   w==;
X-CSE-ConnectionGUID: QgH0+YLUT2S0IoPcBAzjFw==
X-CSE-MsgGUID: LUGeoco1TlihimYj8UbQUg==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917613"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:25:31 +0200
X-CheckPoint: {68ADC3DB-6-20CAA7DA-EC9DC758}
X-MAIL-CPID: 7FF6881006BC76F6B23B54406A99D6C2_0
X-Control-Analysis: str=0001.0A002101.68ADC3DB.0098,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48B63160070;
	Tue, 26 Aug 2025 16:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756218326; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=4Xc/PHP79K7OcUXYd9xwXOEeSBAN7ZoHnn2wNUgop5w=;
	b=dq63S6NKhMPNFSXnqmQZ4o97qDL0Ib06Qn0S06kKyxLpKxHKl+wOYHN0mTUK2ZDmCzLcLN
	FDPelSed8/4wuItVd2807hfNjC4cDUL0gNYJjddxgMJ/axEvrq81lKvNofDNHUi0F0htv0
	KnevjU6vVABvRenctfStGpIHE1YreXeAflbFC34prp9FEq+yOgaqIxU9g0nF75+CtWzOjR
	2qil9Hy1oAWjcix2b3FCJbO4iBmfey4USIrzS26yReWa6zD7BfuUKVAcyscn2KL2UecSrB
	/TE2OduvoX2bXxtEP7jmD9jSmsN6+7R5VmAtR/rSabH1Y2knE6m9r9b4necuVA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] tools: use basename to identify file in gen-mach-types
Date: Tue, 26 Aug 2025 16:25:17 +0200
Message-ID: <20250826142518.2583999-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_072534_110415_9D68222D 
X-CRM114-Status: GOOD (  12.58  )
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

From: Bruce Ashfield <bruce.ashfield@gmail.com>

FILENAME is replaced by the full path to the executing script. If
the script is executed via a fully specified path, that is captured
in the output. Although it doesn't impact the output, it does trigger
reproducibility warnings/errors.

So we introduce a basename() function in the script and use it to
make sure the output file contains only the name of the awk script.
The motivation for this change is Yocto emitting a build warning
  WARNING: linux-tq-6.12.41+git-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-tq/6.12.41+git/arch/arm/include/generated/asm/mach-types.h in package linux-tq-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/tools/gen-mach-types | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
index cbe1c33bb8710..ab69d408f9e12 100644
--- a/arch/arm/tools/gen-mach-types
+++ b/arch/arm/tools/gen-mach-types
@@ -21,10 +21,14 @@ NF == 3 {
 	  num[nr] = ""; nr++
 	}
 
+	function basename(file) {
+	   sub(".*/", "", file)
+	   return file
+	}
 
 END	{
 	  printf("/*\n");
-	  printf(" * This was automagically generated from %s!\n", FILENAME);
+	  printf(" * This was automagically generated from %s!\n", basename(FILENAME));
 	  printf(" * Do NOT edit\n");
 	  printf(" */\n\n");
 	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
-- 
2.43.0


