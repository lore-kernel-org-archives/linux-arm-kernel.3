Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7816C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPEMR8s91oCRNTEPx4cjBv4/QdcijBwc2O/2txPE2jQ=; b=aOUfgm/dDc+cwga21flutAN10/
	opI/TkdUtukxcgOuXLMlmOZ+KGC/xnM4Dm8lLFFszR3bK7kyxL51/qmD8OMEF4GjjbTlUc4S69Hjw
	zKQwUJeF6AN+EWtUWeTS4lL772IfvTzmLW740oYwK52vZWsLgGHZLfVEDw7B7YYl7IVTFWUwWqkOp
	thM1bM188eQ00RwfWXOHR6vPMa+s+1i6RCanXHwNJjFrmOplxrtzBL4M1Lc8O213d3plLF/sB3OsD
	BV3RP5i3l9hKYNF6rkKyAcIm+od5WXwgYmQsq5lgm2xeF4rmvvHIJn5KlFEaInHfTEFoOjm5mkdBQ
	bf2m04JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTKW-00000000Wzv-0xHp;
	Thu, 13 Aug 2026 11:10:36 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTKT-00000000WzG-2EyP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:10:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38759bcd877so754026a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 04:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786619433; x=1787224233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TPEMR8s91oCRNTEPx4cjBv4/QdcijBwc2O/2txPE2jQ=;
        b=TqIJcQf8meSsf9d+mOk0VZkhZ0bBtKODcvlmgLBXigjpNURN6Y9nlN5mMO1Rx0W4QY
         zxTISLRzFp4Umkn3Z4IVt30BISFUne1akwr4agfJq+gvt+2ceU+OCSqCemaxt3PbMPUF
         m9WPTV4tD6hyyKBMwiebcHrrEKvYNC/hjrNjriD0k9dE9uI6vtjPj0uhmGNX2rRCGj9A
         9fz5QOa6Wpeb9AwxperjlxJwge5PAGoOzB9rrWc0eX8dQe3d7Np1WQPoz7zbeCZFfbxU
         y1Hyu9Z/vkVeJBm0qJW1u3syvp49u6r6JwRZB00DGZyFKoUO0a1Nb/CPvpAI4Fr78Baz
         5xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619433; x=1787224233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPEMR8s91oCRNTEPx4cjBv4/QdcijBwc2O/2txPE2jQ=;
        b=E2LIwGtIlSkbgG8tgpNDB1Qv9Asx9YnfxIsY4VHzZb3RJy3L7M3kDsYdgwN2vvabbx
         ziCVGUnL7XLYjziYRmU7GmkWE/igEWUJiFv3jVF9a+HMXnXiZv8qgYh1d+9zNC0zXtjc
         tpf3tZDYTD45G7CA2cIWf4WLSvs1h+/qxWPeZpw9yagETwNXZ+k8q+2D3gYxnf7ICENr
         Z2NQyKyqvkvDmrkS+sBOHEfWIyT2sonA/6Tr0a7Se44lf2gGDoXa/H8Wfi8Ao+MNx5kr
         Q/zJbbiuJfCI91uAydJJthL1F9AY+VYfrjB4S+6vOfSWxx8v2vvtZuJUFn59XaOgUjH8
         iWow==
X-Gm-Message-State: AOJu0YxDLDlPuGxm4q7n0SAnSJenMX1dEXVkA9S6Fy564RJceYIW3bft
	cj6xhffvhTRZNMCaBeXSkATy4Fo5IWN9Vd8UC+Wwwio7VUB5WyWH2tCAVRrAmp6s
X-Gm-Gg: AR+sD12v+wa5QeIuKAMe85uzWXnElTd5W3e4h82RBb4KbKcpWj5bAFpSnzXPyNlbuCA
	SbLL4trlfPArKe3oE+SXzeTKks8tUZse+L86Jif1/rH6vOGYt7ab4ci4QoJWAYlMqql4ZAzyeGU
	l5tdB9Wa/3FsoweEsECd0fpmWJlb/wmt1yRMEmWPj9hDhVQCDIGKnnL83lyI9IefuC8UvHq55Fr
	9IPaIQmFwJOlwXRiqQ+cipdUyPCqSvBiNqWVt4R8HEK7Jnm6GRLw6YKBsGsW8FTc1iS1GccRi7v
	78WE42GjdRMY1QIIkrVaNGi8+RTzMBU4w5O3wxUL0/ux6xegLvJKJfblMSRW8UrGTyWX9i+sqzB
	06/y5OgbfqKpvyXF5p76f61RR42d7ifo54ZGG2tly4lGrtaPxVlk/LM4wFv4KJBGkUWyCB4aoRv
	WEU7TQWhZqLqzjZ91yEfXPEeeV03ldUO+qqihZa3mmwizypTWearoOACE+tdAsQFN1oTZrf9stX
	JWZuSdUA8Adelz46g9giLlOwQzt1O4bd5v59DtO3TDt4NV/sZuD4InWrb7osNINjxS3Vx9SNR7J
	k+J2SYIhO4zN
X-Received: by 2002:a17:90b:4a10:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3931dfe0fdemr4953305a91.2.1786619432138;
        Thu, 13 Aug 2026 04:10:32 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d8bd946sm8358848c88.5.2026.08.13.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:10:31 -0700 (PDT)
From: Manush Prajwal <manushprajwal555@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH] bus: arm-cci: fix device_node refcount leak in cci_probe_ports()
Date: Thu, 13 Aug 2026 16:40:14 +0530
Message-ID: <20260813111014.895-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_041033_574846_AAFFC48E 
X-CRM114-Status: GOOD (  12.61  )
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

When the number of matching child nodes reaches nb_cci_ports,
cci_probe_ports() breaks out of the for_each_available_child_of_node()
loop without releasing the reference held on the current node. Every
other exit from this loop iteration either continues (handled by the
iterator) or stores the node into ports[i].dn; this early break is the
only path that drops the last handle to the node without a matching
of_node_put(). Add it before the break.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
 drivers/bus/arm-cci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571..5ab3d74c9a 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -461,8 +461,10 @@ static int cci_probe_ports(struct device_node *np)
 
 		i = nb_ace + nb_ace_lite;
 
-		if (i >= nb_cci_ports)
+		if (i >= nb_cci_ports) {
+			of_node_put(cp);
 			break;
+		}
 
 		if (of_property_read_string(cp, "interface-type",
 					&match_str)) {
-- 
2.46.2.windows.1


