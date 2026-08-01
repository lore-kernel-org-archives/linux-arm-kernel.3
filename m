Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316DC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 23:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pEnWzIYL12QKgHz2HhYNYWXphVIGCqkNWfeFSGzqEOU=; b=OaB5KZQfpJpsjMNu2hGMS8NtUd
	UHpKHcRpmutw7dSf+Fi3YO7RSy+IPYdB9DINgQvP8BvyLaBeFjM9Woes8j5xfXlA5U9fyObPKZeoy
	W+Y9Z3e9mxnokqJ9NO9rzLXxOnjGTKnrBBbaoqhfqei9RcaVALlDgoW89nxhBN/5Nm9aq1Fv3tYUh
	vy381sKZyf0LKmA+WGzFhQxm/y6rZq3dbVPXqqyGt3GLmzOiW0mAIZtfbSbragdH4c5tPFHQhrYeH
	agHn1SA6z3/LxeP7aIKllxjkPgOdrPGgvxHFQl9ed3T+XKqX49Eo58FvAWJ3TgAg9W/UQ0hqm3lOD
	n4p4s/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqIzt-0000000FCSM-3wBQ;
	Sat, 01 Aug 2026 23:20:05 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqIzr-0000000FCRk-3fq1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 23:20:04 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8eefd4a8057so20394206d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 16:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785626401; x=1786231201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEnWzIYL12QKgHz2HhYNYWXphVIGCqkNWfeFSGzqEOU=;
        b=IB4LXxDK6+2hsfwOBT1o5qP1JGV+yXITNWx2d3fxvfqKuKOfIBQR/XnvnKR7m7OWd0
         qz6AC+4zMGZpYYqN+5B+1UIfV5qi2AUkkego32DNHF6/XVYHrQsCr6wigv3KrZ0Kxcy5
         +Z2zNL6a31Lcv2MndbC4S+jYchFKFBOyxtORZHo/e+/v9926Tg3bSRg2wffNqZQmyZmN
         VRBZI0re91r25sAO9wyoqDR5/pw2+/6QOToo4qZWHqbYYLTN1leKWmUnZ+Uj8u6j8c1Q
         qZdjZ1HsWWj/xm9l/x5MdjkehxPOGl8JUS0ttFRc30REbephlL+PzPZbVzg6x3A+WU7H
         vtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785626401; x=1786231201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEnWzIYL12QKgHz2HhYNYWXphVIGCqkNWfeFSGzqEOU=;
        b=HYH/QDiD65EtZQd+ZjTgkkpvxdqB3C5CyFy2FHTVCLlTMdk032J/Dnv95/M4+JtWgf
         c4mZj6ohk6a7O2EFco0+MYcGcF2DWYcYc52H5d/SItm0qClH/pLPYwRqwS1ATldi88KS
         M9tdxSfTZQaFaSYtyzA1BmwR8WNS8Rz88GRGLBtIgOAyL009LjLIEXFgNDlZX7iDsRt6
         bgkgxGIcWxlf4EQNq8byFNW3KWLH0aT9iRAPSKikA1RNbQp3eAa3ufhG31mVBExzUq21
         kVNZQe+721UfzsEJlmsRtV2VLXr842Jz+9m4ElS2VyVGs1slCJssj81DflfWsBtAPQgc
         1iRA==
X-Gm-Message-State: AOJu0Yw9cVx4ugaGB5Kgk9TD13B3kWLOl+MkP4pTSjdqGV2sX1rdQK2q
	hM1M8uqEnk3noYawp6ny6Lje+o5jt0FE0QwSRA4knygNfz7X2zh8U2fy
X-Gm-Gg: AR+sD12sy8qwnMDoiIYig09twV35zqe15ANpou+P4TT1kuQHdPFrNptJwmLgt+IdZRO
	GonjsGC37ERiitG5tVzfy8tQjSXwa9KMIKN9k7WYanm4MFQqYkNbv9AXha8KMvQ+lhgqAHMF8gT
	DmuNzPP/+xSvpIbajOHdiUcPtsaWv1yMeI3OtQeh6zmOynMT0zxJc10UkET0EQNvkjK8IMtBmxN
	6ZTTZhlw9nVOeDlFYZqKU2BB63AZkliwgYdJL0hgvf/SliYX29VcsfbtNGmRGyXhSVJAq6qDHRF
	NcJrk28hZyveBQqwZTTt+92I6Wk31zNj7OhZZvVeCpAtXZvbTCLlFuc5DtwlLQjbAFZSO8JDIhR
	Us/iXBiovbFaOb6wXaK3opCoUxP+kl0R26La0WGbvmNGOCaug1RukeTbtGCvgOZTgWtyJ+UOwxP
	y6cuUVr06pRMHhSlDevxMSrmeZ6/sFB3uLx2jgqkevZk/yA9+vLJFI6wj3imq7YyGwmQAHe2/jo
	ha+rWkFVS/Xol1Bvg2QItmQ6CdkWLowbLy1kXWeFMBf6hoElj9mvZ2uZ7V3n4A=
X-Received: by 2002:a05:6214:5c44:b0:8ce:f1b:74ec with SMTP id 6a1803df08f44-9084969c01dmr110634346d6.25.1785626401576;
        Sat, 01 Aug 2026 16:20:01 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a2852sm42400026d6.16.2026.08.01.16.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:20:00 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: setup: Drop reference to device tree root node
Date: Sat,  1 Aug 2026 19:19:53 -0400
Message-ID: <20260801231953.464006-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_162003_926905_21ECDA8A 
X-CRM114-Status: GOOD (  11.57  )
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

init_machine_late() obtains the root device tree node with
of_find_node_by_path() but does not release the reference after reading
the serial-number property. Drop the reference once the property lookup
is complete.

Fixes: 3f599875e520 ("ARM: 8355/1: arch: Show the serial number from devicetree in cpuinfo")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7ada0..2a179aeb637b 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -962,6 +962,7 @@ static int __init init_machine_late(void)
 					      &system_serial);
 		if (ret)
 			system_serial = NULL;
+		of_node_put(root);
 	}
 
 	if (!system_serial)
-- 
2.43.0


