Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9926CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W2ll9eOek77lqJYz2Lwuo/2xHZKLi6mWDDbbpXtd1VU=; b=b5USYydKioPsFpt5UawG7ZN0eM
	1Gvb1vX69DuZSNdkoBDwy3zOf9/1NThKfSqT/Tx5bkMC5+GGA2Yt9KsvhJV/Hl7w8R4z+UW+kzqqj
	dAAbyUd5mgh0l/bzwtKE/4N684Ek7oA39Lylqic2ByXPXshpEFwNu27q8YrMbmEamt+i4FP5Etcnn
	u92EfuwyyoUqllxWuutArAaQGOFDgheWGSz3DaefzWiAaGrPQ0ImTDiS1lQgz9pgXRdq+ffYjy73s
	mvcQ+kHeRHqwzCJo4Z0wckeo1YNSSUr0Kq47rYzMWXU2ce5Mxo3/dpPOmDRS6SsmudRoRyYtGnf7T
	P3ws1J0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsid6-00000009TsY-2Eub;
	Sat, 08 Aug 2026 15:06:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsid3-00000009Trm-2Tm2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 15:06:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so5489415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786201587; x=1786806387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2ll9eOek77lqJYz2Lwuo/2xHZKLi6mWDDbbpXtd1VU=;
        b=R/eO6ZNbbZ6B4LeQUNzUJ9vd7A5Vcshp2FCJvNBArriemT9qX8+Rw0xiwLCwsxV5uV
         JOTvPsJ+E5t/9LnswrpOcMof6BrAFjbWtGA+V/SSI46ncID9LsCBqGp6h17DOr90/4fG
         CQqaAOGuezxbsU45Le8pXAr8yTQ0LyGI5U0lgRj7G5uyNB0+eFFc0jvxHySsCyU8SYcw
         aUkwuQm2piM3Z7V2WFC5N7Is2v3Se0SgL7BpbH1u5xoMyyNBgRXXwBTGjeGP2E3LGkuD
         EncP3FA2dBlOEHOsOPHxZbUB+w0Z7bNF2SA7SdSAa9D1ftHpWxv51rbl/Bo/tWFU+F+L
         yOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786201587; x=1786806387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2ll9eOek77lqJYz2Lwuo/2xHZKLi6mWDDbbpXtd1VU=;
        b=VzCPVPpFPT9e8UEqot9kdPc4Y7v4mSXLfckPkVkcysSbbs9lh4HaIcuEHVCJhaU1nv
         tL170mTsSQJE+sOhzKY3fbOIrg95Msvp5eZu/aHBLj57iHk/HMW+Dmzik9varR7lRPw4
         3dfHZoajssjKx9yzd+aJFp59Y4h9cpKX+Ibc5h8K543SZ05oTbf+FvuoMq8zPVl/Ulzn
         viMsfbUcnASlqjLgxz3hm8xNNLeQJQe4/1GA6GRrEf0LjbQMw60z1aC9ka0vJIR5gXi1
         CGhd0Gri7ZG0MWzF2z4NPCJxS4tUNlCELqoZJsECCSShgLO7ZpwnV5wZ4sY5aqvbA+ov
         LegA==
X-Forwarded-Encrypted: i=1; AHgh+RozEzm+Us+zmF2MzRPSl+/EUBvba+/MNC5jDNrnGDQnhScsRbFnQtdwLUHVHAfhE8pMPP5dTrCDxJjrlguxQw2b@lists.infradead.org
X-Gm-Message-State: AOJu0YxR6oLVetcJHudE2ORZVPST5wIEH+P99a4K21Mff/uGjxnKJ9Wo
	5ucBEfAfEL4yLzkNaYAPhaaI8+/xns6Rxr1dvVVyPE8nWSElPZzDC7tR
X-Gm-Gg: AR+sD11a1OllJTKg0HD4CkFojvStqCWyCHw13Ym3gl2ve7wNh0WZGZUvYN1u4zJSy4o
	uif+V/Ky0WrXSnoHU/LXS3tV1XP11PirLQB9/Wt6WojsWfoUGgvcL8l21jZbxwCs1dCJ2jjahTy
	rw0I3jeJRbz2Y0u2P+Hy+oFpeJfgal/jOPQzArDqvz2fPUOtzaXe0o6wBjkNz2lVAKgVF69eFNY
	F+Cg/Ftz6FtgUvotsv8SM2Ahmnx6ztb/lQddUnNw7AzGaciqqYvUUNUHCrnCUzXVVkyY5ARAXXL
	p7U1krCqF3vaSDHSBuq9BMEWiZ7iJ3lA6H16oHpZdVcKbiBUO1zNMRTDTBp6Ga1fVw7Bgaz8Y1Q
	rrqLkGxFtLI3sE6OVCP394DNST+xqzW4LMKZyp6+Pu0eaGZvMP12+Fq6uUIb5mHYegPFX0Fm0wU
	qmGj3dDUTNu3B2CBOoaW4pb7WbI5cM6dX10zr6LaVOHRHfCOaUbyC/KnU/NV+3/9hAROrtJOVM7
	eXvqudkTqKl+ew76a8G0UGIFyDL111cFmjKRccFTaxgfifKlz/v21EFR0GFFItGVBX+jKeoS5Yg
	ebpcIZ6a5lFpDSIsgtlEmEiJGm8SsuAnaSczjXBzBfWP7w==
X-Received: by 2002:a05:600c:4594:b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-4995f7a7ec4mr138657645e9.12.1786201587163;
        Sat, 08 Aug 2026 08:06:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm17000478f8f.20.2026.08.08.08.06.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 08:06:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev()
Date: Sat,  8 Aug 2026 17:05:06 +0200
Message-Id: <20260808150506.78534-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_080629_667578_EF0D7D70 
X-CRM114-Status: GOOD (  13.24  )
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

mtk_mfg_attach_dev() reads prev_o on the first iteration of its loop,
in "if (prev_o && prev_o->freq == o->freq)", before prev_o is assigned
at the end of the loop body. On that first iteration, evaluating prev_o
reads an indeterminate value. If it is non-NULL, the condition
dereferences a stale or invalid pointer, potentially faulting or
incorrectly skipping the first OPP.

Initialize prev_o to NULL. This matches the intent as well: there is no
previous OPP to compare against on the first iteration.

Found with Clang's -Wconditional-uninitialized.

Fixes: f08e7a4e8d6ac ("pmdomain: mediatek: Add support for MFlexGraphics")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 53bdab66cf157..9a8a38d98cce7 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -657,7 +657,7 @@ static int mtk_mfg_attach_dev(struct generic_pm_domain *pd, struct device *dev)
 	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
 	struct dev_pm_opp_data *so = mfg->stack_opps;
 	struct dev_pm_opp_data *go = mfg->gpu_opps;
-	struct dev_pm_opp_data *prev_o;
+	struct dev_pm_opp_data *prev_o = NULL;
 	struct dev_pm_opp_data *o;
 	int i, ret;
 
-- 
2.53.0

