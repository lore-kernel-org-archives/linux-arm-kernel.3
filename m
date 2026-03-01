Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C4FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8GnZ6scY9RatwDOdF0bnkSG216StlRqp+YcA3P3cM/E=; b=vYKlp4u0TBxLYEoUSsWS4Qom33
	kuDqjbBRn5sTJTK/OoCkAA6uU8G0TlJ8VirFNivAlBqZTnyxGijYbcf9jgi61yhf4CK0j8P9IHa9A
	+zDEuIsvP09ysF88VV+9rMMDUhiiUYvIGnTApmn58UxCl9N2tlur9wMVr40D43qtbQPA9IcY1kmI2
	LzY1VnvShTfZbMVqTqwS+S+NYK6n92gWNsHnzkgBa5n1/lGXzy/YNj0CMcDu4KBZMgf8/IdHI+ugX
	k6mnN7hiJaGo5pi8ec2OUVp28glJ/vYwjSIBFIq5FARDHwWwQLrxzQ49Pb2d1DOyNzQW6xTEW5Y/O
	XdjtYoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpl-0000000AQAk-3ZRJ;
	Sun, 01 Mar 2026 00:38:57 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpj-0000000AQA7-2FUe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:38:56 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5069df1de6fso28999041cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325534; x=1772930334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GnZ6scY9RatwDOdF0bnkSG216StlRqp+YcA3P3cM/E=;
        b=k03WiLoRTz40BITzv9Mk0boLO+x7VDaCoq4aE0jhY8uNREJ8Crqr9ghHbCDMfGxP2Q
         k15JfUesyijCXgsAUymF2/TP/1KZpjjhQdumj+kzZQNnhPxeNMQXeYSRz0C926xoYkrq
         NK7bsP2YJj+vSvcS33nP23jZGJjvPV+ZeyKE1IHN6PMzGloO3ssNtdF7A1UQD7Sasm8r
         I3hSrbBC/7x7B0GNsCCuU2MHtbuEbPnO3SWWrq1H1pCbk0+iRLyjRvyVepM7TONSpey0
         2KavhykX1bWKSWSvIqKodm+sJDvJATqNfnVDJrMIE78zmF5IhZBf87+y14SLylrLeL2A
         pLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325534; x=1772930334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GnZ6scY9RatwDOdF0bnkSG216StlRqp+YcA3P3cM/E=;
        b=kC+NRKxHYfqu8sdo3qPaNi6vIf5RuHbh3NSBPj4QKh2YMCTIxk4GGAsNj8SkpJa8+P
         k3ZfrCuwF71b/I0ZFvSIDDhwjrekWlEkrQi8KlJXwCKE+60ZIGDD1ZxLJab4j7qVkCFB
         AxEjBkTM0HPLKnSQ8CVk2vcxZm1LepoL4iMRZmSwqCf89MNHLF2T6/o1DspMWygoBp0J
         6xRV1yjZ3b+5oV71WhrAi02u2mGBuIRORUCUHfPTtQzgX/dH+ettfdnIsDwN+0mMZ0lZ
         l4yHiHtqzPn5k9B3NBJu6Zp21nRtzOU2NsaxDkfQL2wZOYSFGmPO1YV23tslnSApjhqD
         p+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWFxYYLNlOBmINhyvfe+xCk5D8xKB0J8AGT1kSfdRNoE0kGMDox3XRut0gOc6SZYX5b1DTZcWmwJMIqTSaSEea3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbl11ntnmO37I+3f9CNGfb1ob5b0JiaCaBrZ4RFm5XnxnngFM3
	sriKQrsFj2F26400Co9GUJUzfNkcruyoOvNHymTD/JiqPRILlq7AfpQF
X-Gm-Gg: ATEYQzxvxFnXrSB8+HuzFGojrcO3utjejKnhHhjbjtwVoCx6T+q99ffTDU5vPxRXLst
	YZwZliMEVapUjt+BQDELqxGcy/oipj8Fl2+JOFaPRBwsLETrrNcffqwkiHw+ADsmEq+nU28pHBl
	FqK1odAFcAtqhj6hCb1XG4s3Vjqee/mHgm4Jq1XSK6mRGLFbLWVkGHkm/+E8JapbEnl8RDUl37t
	KFquT2plsLN5Z8DHZ+01u7Kd7L/kQx4XE4if3OR/RWBfvKg/XUbfG2EurGGj/tcHeyUvUeqlL0J
	CiQNb45L2vpAO5FkADJHm0pzBhpr0ulsCLnaw4m6VS0YdWmLBR5TR2MwlRDzlrObeKe9urnGiA8
	LcvSE53Hg9B50V4uDM8tEu5Tx9jqN6ZfWpKfrqcH56ixs+gmlggGqoLWuYMFXxaZSm12b405ZqL
	/ywHZb77Jwh/WcVyhR02Gv63X21m9q/gzUsWrVGIqHG+YrlmsnRvDzh/CBFV5Tr8limapog5l6J
	L5pH+40L3KhEJ8=
X-Received: by 2002:ac8:7d41:0:b0:4ee:5fc:43e5 with SMTP id d75a77b69052e-50752714416mr109988071cf.12.1772325534323;
        Sat, 28 Feb 2026 16:38:54 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda23sm82758741cf.18.2026.02.28.16.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:38:54 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 1/4] arm64: xen: add missing SPDX-License-Identifier
Date: Sun,  1 Mar 2026 00:38:53 +0000
Message-ID: <20260301003853.2504449-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163855_574253_D66C6054 
X-CRM114-Status: UNSURE (   8.77  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/xen/hypercall.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/xen/hypercall.S b/arch/arm64/xen/hypercall.S
index ae551b857137..19c99e6bab7a 100644
--- a/arch/arm64/xen/hypercall.S
+++ b/arch/arm64/xen/hypercall.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * hypercall.S
  *
-- 
2.43.0


