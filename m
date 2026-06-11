Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F2ECD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fij/oQvu/2UXmQt0RzKkHVGLvKBTwVHkKcJT+NiS0dg=; b=Mof0jXGXaEptU4
	Cqzm+1m0Logivt0UdlKqxaEGYS8yKPxzcz1HUEudBOh37ofk8CU1jujqX32JpMt5W+y4gy5tglzVw
	J730HSBnTPsI1nQkFr8Bzhv8FoxcUBRDicpcQhcyXIfWgumeboWvV+OaKj0AyQ+qI2wFEpQh3XQA9
	JB30Ham0h2pkuJkcZPFmbcqmolywTXS4HOqtU/AjrEVVdW9fTEJ/HIxAB0GJS0W1g+U3ELa//InCL
	qW9Nk167oG20PWq8GbHeErDflFsQnL5w/r8z2r4wQI9PnX/uUSzdE/JHjL09PhuLbEWHf6AnJxVqo
	3lSzYs/o6sSeqkiXT3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZr-0000000AA9U-2zvL;
	Thu, 11 Jun 2026 23:12:47 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZn-0000000AA6P-3Lbk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 23:12:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8424b6792efso205647b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781219563; x=1781824363; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:subject:date:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fij/oQvu/2UXmQt0RzKkHVGLvKBTwVHkKcJT+NiS0dg=;
        b=YqsKgKnCes1bi3clZt4nh+XT/dspSawe1cKcKdnHp9CApbPWrM7lJDZIyyBhsJnMjX
         cm75szyAMx9YShvF4iyKtRPBI/cP6z8Gk9C824OH/S0ySdFwgM911pb19WXC26e7kSPt
         Ykt0l0rpeOP8jA/HI6EClw1MkTU5ScVzt1+vFDoYd8oArdG8+TWKutKA4qD1m8vpglxR
         u3hkRNQWX1FPX3jTYjXCm9+sPSArHxqLCbmvvNs+CElj/9cQTi8U5iOklYRb0Y8gxnTN
         GY2Bil1cqHeF8wIFALCiD4/oVXbp4cfwUE6KYbWfASVy3/D08JSnHKujygltdt+cIZCO
         pA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219563; x=1781824363;
        h=cc:to:content-transfer-encoding:mime-version:subject:date:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fij/oQvu/2UXmQt0RzKkHVGLvKBTwVHkKcJT+NiS0dg=;
        b=JcoRGcW36PchG2I60HoCytvnItGYLrWSBgPwK2EdiqqoCl8KkkSgsK0BrhoQY4qU4A
         cKT68V6pkylwEqf7tn4PYfbtbvqd8KP7bZcy87l8+tamNanEuywUn4FGdyE1dlf87FpA
         0YGlzQECf6Dm6aj0ogitTqvK8GjU4BbLNhhMCOEKgLzsteiSUgQFGNT6U54Ec8F2lEY4
         FJnS4DD4zT5MRmN1JNXkyg1ovDoJyx0XnWHpPjhc/srpmiDhKC0qC758oLBKduqRg3+R
         IljZKsV9Ns8sVFZZHk+gu3SEaX4BuxGwo1wMR0qiENr7PXM1xdfUw2ccYKV0ESqhxuJL
         8POA==
X-Forwarded-Encrypted: i=1; AFNElJ8jQYMbAPjWHChJjzNq/FlFYgJIV4SMDdMHtI+iJV+3A7L09g5iDtVr3tJzUfJcV1dkHA/zwj1/kbK9z6JdGgoG@lists.infradead.org
X-Gm-Message-State: AOJu0Yym1RN9zS2xfynKZk61TCGosT7q9G0qxTWGAykhu+pCaNMv9Sv0
	VUOiCsvdFNnjLPCZaGqLc0fpN4h06ZS2rqwtkZHmPjOK/sBFROr1q6r3
X-Gm-Gg: Acq92OH9Rvo7VHI3vMgK5lDDNFinrLqIPTONjyH05sSGz75YEUHpmn+Jb47MBi/puCB
	P7zOiWwloNTqiHQ2A60Og7mN5lp5LkefawS2howz2QBguJLPLBzud6I4fqHpmd6huEAoa9mXxBD
	WrzgOabRN7R7yhbS7VtaE0/IUHeyp3kqqzw4NuGSegMNDjDI6F8bje6jkqLz02cqSlYk9j003aa
	k+ofPhD9BHbQE9QVw7/h8+mOePGIrjVF40K3GyCcxtZKvpoGwxhZUfutIyTPskz+s2I/akPb0r0
	dWJXLJT/i/pWiBFdwC2q9I6oX7p1KSff4dxB80xjAwdfuQXUqB2SMHdN0vPlsrK7gTJ8LT2/CEP
	bdxGSDLE4A9Fodv1/PlEozxErox8+woGIe4fPoxTJD2OMpasQEfytithi3HFvqgpkb/4uFBP/ob
	K/gwWlTVyfIUuyVipv
X-Received: by 2002:a05:6a00:2351:b0:842:5712:c2c2 with SMTP id d2e1a72fcca58-8434ce5eaf1mr123505b3a.41.1781219562783;
        Thu, 11 Jun 2026 16:12:42 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm199571b3a.34.2026.06.11.16.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:12:42 -0700 (PDT)
Message-ID: <6a2b40ea.4dd82583.3a5c46.e5a2@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:09:56 +0800
Subject: [PATCH] net: airoha: Fix debugfs new-tuple display for IPv4 ROUTE
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_161243_895415_203434C1 
X-CRM114-Status: GOOD (  11.34  )
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

In airoha_ppe_debugfs_foe_show(), the second switch statement falls
through from PPE_PKT_TYPE_IPV4_HNAPT/DSLITE to PPE_PKT_TYPE_IPV4_ROUTE,
accessing hwe->ipv4.new_tuple for all three types. However, IPv4 ROUTE
(3-tuple) entries do not contain a valid new_tuple — this field is only
meaningful for NATted flows (HNAPT/DSLITE). For ROUTE entries, the
memory at the new_tuple offset holds routing information, not NAT data,
so displaying "new=" produces garbage output.

Split the fallthrough: display new_tuple only for HNAPT and DSLITE, and
add an explicit empty case for IPV4_ROUTE.

Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
index 0112c41..f9c12e7 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
@@ -121,8 +121,6 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
 		case PPE_PKT_TYPE_IPV4_DSLITE:
 			src_port = &hwe->ipv4.new_tuple.src_port;
 			dest_port = &hwe->ipv4.new_tuple.dest_port;
-			fallthrough;
-		case PPE_PKT_TYPE_IPV4_ROUTE:
 			src_addr = &hwe->ipv4.new_tuple.src_ip;
 			dest_addr = &hwe->ipv4.new_tuple.dest_ip;
 			seq_puts(m, " new=");
@@ -130,6 +128,8 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
 						       src_port, dest_port,
 						       ipv6);
 			break;
+		case PPE_PKT_TYPE_IPV4_ROUTE:
+			break;
 		default:
 			break;
 		}
-- 
2.51.0



