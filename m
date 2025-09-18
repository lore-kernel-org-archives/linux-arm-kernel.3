Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49273CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z4mj2+FYZp/bjZ1cbGcCbQXVFR3CSFUwvkhaQ3JRy9E=; b=UH+yCnmhso9bBSG7gvCHd/wCgd
	ANW5543/75KJOkmqCL03uF6i7HVUlfb8XZQ261Y/e4OBzdu9L99duor8SMOOX83Aa4Z4URynucVqE
	TFVPMN6mGbhOjMsjoObXB4tTSdChFDxc5vXbRWFpWF6nxwKolGhwLOahCufojsYIQsfc+dRyT3gWS
	9nA5PHHNDTWAhHFN0Tr6YEuKFAwfGEN6R3X3nzdkHf4M5Dc2+W83lGY/nGgrV+VfkU2SypJ+DGi5Z
	ZBB+ENHrMc5JRhzgSjEd8DTLUVCstkpT3IEQhhPB3KiwfFVDFHp0p52aPBJ/03POMutcdAy1yURVB
	OoDdupnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDFd-0000000HIRr-11Sc;
	Thu, 18 Sep 2025 11:56:37 +0000
Received: from ag129037.ppp.asahi-net.or.jp ([157.107.129.37] helo=www.redadmin.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDFa-0000000HIPq-2Eoo;
	Thu, 18 Sep 2025 11:56:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id E8C0510A25223;
	Thu, 18 Sep 2025 20:56:26 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MY4fi8Sklhc; Thu, 18 Sep 2025 20:56:22 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id AE99C10A2521F; Thu, 18 Sep 2025 20:56:22 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1758196582;
	cv=none; b=ehhqe+hjFhqsaMTS8tz5pXL5wO9Bwsq/fzdnEMk6JCHyYUYLbdjsJoRI9OdFGndNjQf2x6HSRBmfFmXqMWJ22hr7MEsaiTbT5brvVMtr4ykzj+g8FJTAK5LDo6BnSsJE0kJ3tG6YVfs7rRqRMD9YJWet+UGOLiGCDbxi61ZzGJY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1758196582; c=relaxed/relaxed;
	bh=z4mj2+FYZp/bjZ1cbGcCbQXVFR3CSFUwvkhaQ3JRy9E=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=CWcmOQJGTrjgULdhGI5zjlu34r3T8cCsB6bKs4nrj3kSTDModNsr5RTxM9r5Svi0maj9LyL2Eszy182Too8GtkG30gIJiPPchSxp9+7VBUxES6RIOIA4w4y3uGrS8imfc/ANQh8RCOHHF09iW0QdmX7mkV35WzFBpd9KaJ4GVDQ=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org AE99C10A2521F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1758196582;
	bh=z4mj2+FYZp/bjZ1cbGcCbQXVFR3CSFUwvkhaQ3JRy9E=;
	h=From:To:Cc:Subject:Date:From;
	b=QZ5gpNZsa0DU8wjs4DJxQ1n0+YgxExItu1P93HXdqEVf8msXK9Mra733Mv3kkwyIC
	 OgYjS4sHYdPugA8w4+gUucEnpbvIsn6bvNIshPVHZ2lWedVr9lRLuamMYr4tT+kgET
	 A4Fq54E6XvlREAzztnq4dFxrmgHyv6bcLeUSYpso=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] staging: vc04_services: mmal: fix typo in comment
Date: Thu, 18 Sep 2025 20:56:19 +0900
Message-ID: <20250918115619.1616818-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_045634_990001_85DFFDAC 
X-CRM114-Status: GOOD (  11.36  )
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

Correct a misspelling in a comment ("recived" -> "received").

No functional change.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/=
staging/vc04_services/vchiq-mmal/mmal-msg.h
index 471413248a14..1889494425eb 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
@@ -13,7 +13,7 @@
=20
 /*
  * all the data structures which serialise the MMAL protocol. note
- * these are directly mapped onto the recived message data.
+ * these are directly mapped onto the received message data.
  *
  * BEWARE: They seem to *assume* pointers are u32 and that there is no
  * structure padding!
--=20
2.47.3


