Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C544C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qV7xKYxy0jYGd0Qm2mj0JBA759UToJ3LiAjKa48PaqQ=; b=RbQGGEfwbS2DL91oMrjTH4kemZ
	/r8h3jsylQC3YjgVUkrLH0MjYCeCH2rsRUhtbxs80eVuoOMhkcyyBUpEQBFCNrlUqlLw5DxJ8+sB6
	w0tTTunJjlCnZXxBMH5SEaDwmKoPSOLv58uDsxLrX8B/F1SLfAgpvVTmSBTo5nyhVlukv51ca0xH5
	8vWwv74JZh6Otr9H+XDCfUlP1oh0hlnfbybjE73dNyYlo1Pa0xsgA3jrQ+qhvqVdeKSz2UN6nm9Di
	pzGgNRe6AJQ2EzpehZa1737W9PTZa0B1B94nY/klX2pBLCfGr4T1jM6Js9vnU3Z0AJDI6YwDf2kJs
	tTkIKk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCKx-000000003J9-10Zk;
	Mon, 31 Mar 2025 10:25:47 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCJE-000000003AQ-18bc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:24:01 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-301e05b90caso7512561a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 03:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743416639; x=1744021439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qV7xKYxy0jYGd0Qm2mj0JBA759UToJ3LiAjKa48PaqQ=;
        b=aAvQF5gcV+RTMTA1GVG/wiLmaVA6zJwNG1HSYGj0kJSmJ1Qd11o70O2jVD00IK72lU
         v0EEMH4yFD7NJP4fu7b3cUBEVRHsqelTlwZry14J8S/Y48uK6D981IBXcwpHEym/9BQM
         82x5tfepLWdJMqPOzTRaKeMsIKok1Fd+E3nlqRKHytHBbbYWusKS1Z5PnhV1CTWu6/f0
         o1Hd36do3QsY+gWa5581GcxdilQwcIGMV+NeA/9nUC9qupntYRcoIxuPIDDfRrZ2MGps
         HRvRBhdxCxT54zQFQBLFsTEq+7H907A2bNz7JXC0I5cunT+Na34CKYCXQSKmyFww/vDs
         aHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743416639; x=1744021439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qV7xKYxy0jYGd0Qm2mj0JBA759UToJ3LiAjKa48PaqQ=;
        b=tU7jKN5t/qo1DqtBujlBZrMwWIz3ycxjWB503OuBhTTGSr1TlGs79u9P55dGNyQ9te
         +pl0IsxMqJ/U5yuqIfwFaO8QwX7H2i5snur7G2N9N+QmcmzrfKUOavcy/I9v20FfdBUQ
         9ojhb8B39DnBNwfj0M1MBcR3ns3BSGq/UXanUoEtje4jgsKTh+tDMY7OyMtXvWTz0rRu
         0yCLg+GjH3/SFJka1hNLEaEdlB88Y83vEFxEs/1m4WNISUQP5p3+Bt0ptmJzXKzdUtXs
         1ygtzrgUIkUYIMOeHZ5MVPJMErq0eBECpKRnzcbAcxqbcFzNCPJO4uREwfAPwgzAsEbC
         1DtQ==
X-Gm-Message-State: AOJu0YyBURfZyHeCiMobgFM07Z2AQOCCfHUvm9wTBNgx90aEx6aTuOy7
	RKNGfgy0AhIzdcURpLd1IFFRdOqy3nxEThu7c3+FKpCE0kUfDfLe
X-Gm-Gg: ASbGncvhf5kqVHyAWDV+fSG3jU2/98JqTkZVcX8ZZMWR2kDcJqgnYhOhizoKVdO1Y77
	KFyNuyJ0rAyFF/Fy+AucYNTaPZv1l6YyI8I0auMprruKWWD6m10RcT2CQ9Gc66o3tTSkKK+4DOT
	MEk1WxMKTtEv44Nb8KBjPA3pnq/OC036k7emQWfcXxet+aFZ5WcKpjEMF/SHVDlK+X++RYHLRlJ
	482gUk9bb9hRk3GRNHvvG3WQ5gq8WaJPvDm8vLdgnb4HQfodHJDlYFaP0x6+DFIzEIFKq6Rms91
	BBHCWBOwOoWktgBO6gLdGRqTNVGVKm+QsGG8tGNBFlAHaOPOhxR6nDT5L+SKR3UZO4UDOGk=
X-Google-Smtp-Source: AGHT+IGp4CoHfPPUsld+NS1s2r/2vq7ZsLc+k42RNLjPQwX//XT+3GZe04D3h7pNubLVfwGnIeLbPg==
X-Received: by 2002:a17:90b:544b:b0:2ff:4f04:4261 with SMTP id 98e67ed59e1d1-30532178e8dmr11706279a91.34.1743416639470;
        Mon, 31 Mar 2025 03:23:59 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm65873385ad.30.2025.03.31.03.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:23:58 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] drivers/perf: Add NULL check in tx2_uncore_pmu_register
Date: Mon, 31 Mar 2025 18:23:46 +0800
Message-Id: <20250331102346.8772-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_032400_312276_B81FC37A 
X-CRM114-Status: GOOD (  12.11  )
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

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function tx2_uncore_pmu_register.

A NULL check should be added after the devm_kasprintf() to prevent potential NULL pointer dereference error.

Fixes: 69c32972d5938 ("Add Cavium ThunderX2 SoC UNCORE PMU driver")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/perf/thunderx2_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..ea36a82c3577 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -738,7 +738,8 @@ static int tx2_uncore_pmu_register(
 
 	tx2_pmu->pmu.name = devm_kasprintf(dev, GFP_KERNEL,
 			"%s", name);
-
+	if (!tx2_pmu->pmu.name)
+		return -ENOMEM
 	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
 }
 
-- 
2.34.1


