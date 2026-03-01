Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A22FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA+onLgMMepT/141GKbghkHUwVEHwiBzeeQ+OO6+2KI=; b=Y23AF/jF0Dr0p30+JtZAB1kSBd
	g4Cgk99Z5BGxa5PhDhTzIEkmVZr6nbqM7iJMf6/i7nRJNltDLUPsi2sgRlns+MNEsrxYxLVpeenRc
	7F2gAvSOBm45xaWjHBRtG4CGdnP+mabFC1v8+vgD5TtQEk9YpS5k2orqtwJimPmFAF/MrczTAHhWX
	7jR1Q+SnDIqOaCtAf9NFAKR+WrmhJ6YyiLROYkC0uwxqCm3dmpXjjDP5Gz82wcnoT348hbKOQIhSN
	9pV0y8HHDmivdOs8XleehoRWWGEsm8y+S82i4zPpbpYCcVsrNLi2kRw4OVq4RkfgfIN18LMUoeWm4
	iaM7aAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUlA-0000000APfh-495m;
	Sun, 01 Mar 2026 00:34:12 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUl8-0000000APeB-3pBq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:34:11 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-506a321cc53so38742221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325250; x=1772930050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA+onLgMMepT/141GKbghkHUwVEHwiBzeeQ+OO6+2KI=;
        b=OV6ZUoRUT8vMMqFVtccbvgG1dTi5huz+vu1udoVd9I3ix4qAkgKcXZPcZ2SCuURxH6
         6yA5aNFmIglYwTybbyDvSkmx000tz9ZF8chjkVBsm4CNmodB8YfB1V4XAexxy8qiLF85
         RJZP4yLow6vAObnI4MuTtjBNx+Lsr8J1KQSv8Hwb50tH+BhRkIppPQAZXZAgOOkhlr+n
         s2ByCMbOVbfCFiRS0gNI2mJrqE/rzPZpNYJ6+zYehUIuc5HHSOlu825pIPmLw/q6hQT8
         HmxZWS4MBWzLfZmE4gNwdrgnGSyV2aDsKo9qieGJkIyArlTx2hlGNzCEp6WA1jJ+NQXY
         DWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325250; x=1772930050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eA+onLgMMepT/141GKbghkHUwVEHwiBzeeQ+OO6+2KI=;
        b=Kxj/ApErOTrY5ScrdYKX4Sb2YQpO4ukdqzrMrsxiXAlFg2baRI498Zyoyf83mny4cB
         cKyrIBW347765BK4ovv9gjkdNx4+AwUbyo2HnidEqMIMzNcFEKvFEnsI2yOc+PKksTrQ
         DUvsms4Coo+xMtfuS3Xb6C8aluxaSIs8D0fukr7K9CMa+rPHOBHUb1Foh8h9mC31a+nx
         ve8lqoGR3RNYboH80vClgXMbewOmQKp65kFS5QWPzv1f1CaiLHjTZJwucGMd8QhnGCpA
         xXcyOhKkpT8XR8mcQu8FNKqEMz7QEG0ruv+iDTpDe2KdfAeh36SHRLaGvxo5xwajAM32
         sIuA==
X-Gm-Message-State: AOJu0YzyqkVjZSrlIENCcZR6QBzWdl+jH1LAEVxIBBcBx2LB9Ge1FOmF
	7ipaa5k6brWNcIOKyvqFlh5AQz6NWhcNLBlYV35JlxNhoAtvdHP0PYh1
X-Gm-Gg: ATEYQzzXf79qP3zSbCnZFBNCTg2k/BCtT+IRlDMVpXbzX0NdpRJD+L8ogeMsI+mVMQg
	AMjbm1gOBPnUaNND3yb2f2ausfxZMnCbaj1CMBkqZynvL5lbrc7AV+JIWJBlScKvgNnPe0XAZrU
	tpkvhitlMX5epnGjy+ypFrLBwjacXGr1qZOliy5p3x3nUPS0TVOtwBFr0cmk7PNkimmWEPyGM5l
	AMViEXW6Y+ZUyLx2LpwxYqmHkEr0dkKQSxz0J5ZwAQEdblP0Xr3o/adswUzK45EqqsduL/ED7s1
	zSArLOkgRbXpGTHztpimAuv9lbCqJbxqOuJ8VV7KspFQ8gxzIvJ1I9AZf2hWhrRnhDXWCDT+UgE
	x1WiYVvviKaSvUwyEzh7ncdpQ9cI2nvWXJwvCsz1wT6axy+1JVpTKN6up4QWDfnldACpkSAvabw
	NmhddZU76TWF6QFLTa73qAJA01l/GBX3JGqcqQ7lMF0DVSvW+/O1Qp2EYR9eq+ctFrRMJXJCWb4
	UVp
X-Received: by 2002:ac8:7d4d:0:b0:4e8:b9fd:59f0 with SMTP id d75a77b69052e-507529b9a60mr108561001cf.61.1772325249650;
        Sat, 28 Feb 2026 16:34:09 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630a0sm73258381cf.6.2026.02.28.16.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:34:09 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 2/4] arm64: fpsimd: make stack ctl_table const
Date: Sun,  1 Mar 2026 00:34:05 +0000
Message-ID: <20260301003407.2493781-2-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301003407.2493781-1-objecting@objecting.org>
References: <20260301003407.2493781-1-objecting@objecting.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163410_951135_E1B5FEAC 
X-CRM114-Status: GOOD (  12.33  )
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
 arch/arm64/kernel/fpsimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 9de1d8a604cb..86035d48ed27 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -549,7 +549,7 @@ static int vec_proc_do_default_vl(const struct ctl_table *table, int write,
 	enum vec_type type = info->type;
 	int ret;
 	int vl = get_default_vl(type);
-	struct ctl_table tmp_table = {
+	const struct ctl_table tmp_table = {
 		.data = &vl,
 		.maxlen = sizeof(vl),
 	};
-- 
2.43.0


