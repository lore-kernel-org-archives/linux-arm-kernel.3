Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D915C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7/mEgicejaKA4VrMPZI0e0xkSVHXfl/zPMNtGlu1+o=; b=HxE7LnDU0sbePq6oiiuqlSL8qC
	Kut9UDiTaqIXKaJEYbjtVPvwvDjdn6DAzR494RWQsa8foAg34QB0mWdVpDi5t9Y84Je8M6ipm9pjn
	y2eWaD6ny63E4DHmTZaiQdJwhpXXwry+oaqkyQrEOs+yLrGJMnS+55WjOn2qAn+rEhbVGUTJKsvpK
	ZJB2eqNb3suQvg0o0tt02cuLDTrlgnN+f/CyDE3JiLy8IChd5g5oPcE7Oh9mU9OBMNK9lcE2znJ4F
	0BR+OtYlLHsZFvCS57c6/hPRweOCFBlW4wPJT6xIObfOiX5tPrdnKmPEAdpLrJC9GMLcyTN7VZPqY
	uQP+62pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGEs-00000000XFa-289W;
	Sun, 09 Mar 2025 12:58:42 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trG6v-00000000Wiq-4ASU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 12:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1741524620; x=1742129420; i=wahrenst@gmx.net;
	bh=h7/mEgicejaKA4VrMPZI0e0xkSVHXfl/zPMNtGlu1+o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=biz3TKPnrFbr4v0B8nI1bjcL2Ucg9DsIOi7SuySBUgI2WlHtDnDJoDQirUoaJgs+
	 AA7F8VQbwkHVY3q10XyupSbcmsFJpx8/9Kc+/d/Uhz3mh1ojpZG2qW6ra2NwKlUo7
	 kgJtU9lbRgpTkO7EHZ/4auGDOSUppTHYWr5v/0kmWSTJAunlzRILAHEFQ5HhublpE
	 Q3rZpgzIwk2YHCuTWeMgjZno+Wy4ivZiqHsOHBdcw0xGU+g5JMst0QeUGI0wjHdsJ
	 5T5Ap0jCoYvCQWn8bfj+Bk2rjNzP0tr498gEXNCPBiU6eAhQ58MYVb2CGrCMo8MSU
	 F0J0VLZ+QccNezfreg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1tzopZ1Hn7-00GH4N; Sun, 09
 Mar 2025 13:50:20 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/5] staging: vchiq_arm: Fix possible NPR of keep-alive thread
Date: Sun,  9 Mar 2025 13:50:11 +0100
Message-Id: <20250309125014.37166-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309125014.37166-1-wahrenst@gmx.net>
References: <20250309125014.37166-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WwznDqt6oKXT5S2jrIInUGthm4b8b3T3xCA8v2HsfRauQegO+dH
 UJR9xNK9TSDODWvlF7zEksnZqB/g5CJkXda4ij+b7tTexLA9IyPTARYNPCoJwQXrA1pocvq
 O4WQ4pbkJDl8SZO6N7wyZtlB9IKDl9wMIbZZLtZ8GPV56k3/yvUBq5P6roX3YLxKIb7bExK
 bLHfrZ6p+z2suRqmZZn9g==
UI-OutboundReport: notjunk:1;M01:P0:HFKrSyDKaiM=;qaWKqODarzkqXYJgcRjPbZuykZq
 uHaxkI0emexZIU8JhP8qBhmtWj/3OvF8kXUh8T+ja/WsqODaEwLBPk/iJihLWQAYE/chJfgi0
 3bYvCh606au6m1UVmBmIuVTcAF+oEg8GcVIkZh/3bFa2T6IaaartgGlm+NOqRBAZtFro/zPkl
 UZy5UGikEVxLclX0F116aPR4Pqmh2ht//BPOdKXsXisi+1qhj1cn6OGvKST+CjSar9TCVv54i
 ipcMaDJWyVzkOOoylouIh8fxVywB5mbxk8n5D4HPHpkKQlMO+8xtryeTwyLCfiXc2ntwle+1T
 mAToBNKwEPUobSTQ+rKV6SosuOGyBgi2uUrTnar+POgOqQGVDZVyNkdWjwxs6OXzch5uH8qOf
 TPZs3zgjWZxr1jyNGjjsLs8/CgkWvB25RF0vmlBDVyxhbfqtYtx9uGGf6/xian1fwBPpyr7Sv
 9SqwokTvtNGUKdm5eeUqnQMbPTu+xMQvA8rzwRp0QONdLAx1iXDoacN1b7d300ZbpcNlIdCJr
 QL8CSNMXxtwH6fyr+IsbP2hoE6Sjz/yzVGPhh8o9fGiQswix4nk6lXVcbIEhb2WAXMDiC+grk
 OZlL6w1dDAytuf1s0Ap5lGJ+jaVezjoX5nWqe7X/4zBsWWwJT0QA+FP8dwUwaeNT0Pc5+SDO7
 AQmOfnjBvAju8UDnfZSXKt8ll7PwXIAL84H+yozVQpxNJzmfQ7AJQbGDo/bn0tlU7x5OuLj/T
 R4LMDB3OvtFRDrMz/2s0PyUUEtOa38/6Z9eKOvG9ziH5vTLaZny3Z5dgEXz/rChtZt3qGSoHq
 rz9EEkwVt3EJCjN0c5XcUV8RVtjRM9pQPXGpiSPb3tsspcx6Ew2bI4sXq7kQPKtKOAneMkORl
 MpXTVBIVyLZodntwcGkZnufSwrjnJEVqHftLeqfbL2KHgICMgrmm78P6whqqvxeb8KnlMyYab
 QfGz0rLDkUCZwWIyoNTZeSDDOkSSFDfps2Vyq83VKe7fWY/E8n+pIL8CLCm85B5PYvDe5F/Pb
 lI2dKbQszFttX3ftt1TtbrVZNz5OaWhztOfJzRg86pdWHk4LNqDuqBBUqhsciYcvHj/AZkcgO
 /0rNgi4fc0KAc/pDclT35sAhIf5/2nS+1l8ex85X27cBfLLSTGgIAcPwL92i4ZGL3V0eCKz0U
 gJ2ZZpsQ+X5NKbJ5PFuFB3gLbd7dcEnqHY4sewSqdJrjzFaCDKYQPURrM38pHlY9sPwUnNhuK
 fN3YpIdLTfai4MptOmCewlc+ta3sbwRyAXL3EDzuhm+T6jPicObRs5l9GHcEytlVGtRc9xUcX
 rmpVezJdKEaKT9giF3ucVFwoddqJWvKLuKfXGX8/7Bp5UhfCYMmGlwcmsLr0DEzNzY2rG/uHz
 7vIycBk/QgSmdkliaaG5Mgk1jyfGs9Y+604JZfCq/L+IacUokDfb6OczMc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_055030_331307_488E651D 
X-CRM114-Status: GOOD (  10.91  )
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

In case vchiq_platform_conn_state_changed() is never called or fails befor=
e
driver removal, ka_thread won't be a valid pointer to a task_struct. So
do the necessary checks before calling kthread_stop to avoid a crash.

Fixes: 863a756aaf49 ("staging: vc04_services: vchiq_core: Stop kthreads on=
 vchiq module unload")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index e2e80e90b555..d3b7d1227d7d 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1422,7 +1422,8 @@ static void vchiq_remove(struct platform_device *pde=
v)
 	kthread_stop(mgmt->state.slot_handler_thread);

 	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
-	kthread_stop(arm_state->ka_thread);
+	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
+		kthread_stop(arm_state->ka_thread);
 }

 static struct platform_driver vchiq_driver =3D {
=2D-
2.34.1


