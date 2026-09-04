Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A6C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ0+R6z1eGmwIz9sAFaUEUApTH+cEU6FvzDuPLwSm70=; b=i9HOPin6yGPkDysOdBHZvT8gwu
	Xx6k8C4sszzQv09o1kCJl7aIVwMeaKsI5z6q05zwfCltbW3a6GA2NYiJUvRVmXRM5ME9l2+wjzrIL
	NRzx5w2MXRTx1wcQYz81aDy/KsusSONWK7ued4VtVgLqNwin5HvX1AvVXCs5AQcqoJ4EE2BGR7IgM
	V0KPvEfkph00CaAj+3hLrlekQTfbr8ByXZZ+KbIs7dGMCFQfu/j6UF/d9MGSRfGWXgY1hh4dgxCFc
	bVHmbOURExY1uw0QR/RLsG3sGt21W7Fmn0MsbIKYuPkz5yBkEsHYppzdgaKXyITWasZctsBmfQIY2
	DgJCAXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RWE-00000001jrK-45e2;
	Fri, 04 Sep 2026 10:51:38 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RWB-00000001jpO-37j8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:51:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-398a5aad413so648067a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519095; x=1789123895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ0+R6z1eGmwIz9sAFaUEUApTH+cEU6FvzDuPLwSm70=;
        b=GzLvOnrX+EesEfNlClcFKjdAzPjLzpir+EnMPCkE8fxb/F16KQX2nq0f9uwu61z507
         G+C7WqGpLUMO2wDCckxKzRHiaSXQ9F88sYKqgVlN2dSFDAdpv//uGzUkuVupL9R/+5+E
         ZGryA5MKhuTK4wIGOqtomVjH51lmwq6oAzYQx65YaUq9hSZpsN8aTHAU/Nt9ohEm80Tl
         g3d/eDsB+bzRfqXt+CE8DYIpkPa+cESprCcr7KKXG8BkHpv0bYwgsS9tax/INefsWP1+
         uNa0nmspn5ljW34oEAIPIrjuttXALBtDOrilRmkJvUzdJ1876ID0emy33NrSTnrZBNNv
         eKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519095; x=1789123895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZ0+R6z1eGmwIz9sAFaUEUApTH+cEU6FvzDuPLwSm70=;
        b=kIqKx67q8RuuJWlXuDNiQlRx6gaXNnHWBLWOtkcDB28ugXm3UT26M5blRU6B8B1Wub
         cQv1AtUI64Kx8HKZMtl/9DRgcRFPPvLld7NbNNK31w2XlcpXjv/rVyRTXoJXpu3TFcxK
         iKErqUA/1MQXI7c4nQEsiFhK/yKagKVjubBMU91ZlXCUZq3zA5VBvgcSoqyydip9tUzB
         8qhGSfLqhrY7ckaquL+Z3R0K1heI339yzU5SXFBTe0/ZsirKkx8pIX0Vf7Qg2rFpxIu7
         WRGQXbF5UqRMcQ8HEJA4R/FKxD6gYN44fgMr7XZzIFtHMaQPvUqCPXRG/Fh/9JCgtJ6J
         IaIw==
X-Forwarded-Encrypted: i=1; AKwUvBzpdjy4ve3CElGGobkVDnzg6iVel+ByJZ2J+kkf/2+oFDufXEKoBsFjPyc2C7ioc7aH+vDBGWy+VOUhxd9M6mQR@lists.infradead.org
X-Gm-Message-State: AFuF++k/QCCRvstKVkQKlBSFmUdTMYoti4QoHLxiniuIoV16DfBWnQOA
	s3AQ+1wkoyb44o53AWFp/hcXrg85QXq91e04rJbKz0FbxSCFDisnJk6AwiEzo7lnubk=
X-Gm-Gg: AYBFou3XRpVZQE9F6Y/Ddoza2p0YK/kemWHWWbnMJAtnpSRVMSjNM/HgG1g9dxq9h0f
	OlaTDAVcWXTdfN6ZGG9xDjTzsVBlncNmNeWoVpl45O6+Fre/BaIEdi1Iiw1Vbigwfst53ZOZ2+D
	FScLKARg18zwjnXqsikOIdXOPrYgb0WW3ujKhp/FekUKr58NQGcP+E0u2eEtLt4YPghV7brf5Vz
	aPOS9DcjWXpuKZ1MraArER4Crml48A6IwbvIDB/aN6SNeWQC6vt6GOPGFAWRncbsLrFdbducJYQ
	mJwdiyrtVVMiaFshEKsTU/v++hcWgXgWQ+MgtcTqCOzCcU+mD9cT60nrUe7PYnn66+fvOFrvD2z
	Xgp0LpB+xdnToxXApPkNBfvvISZVCTZwGfnhysFR/WgzGL6NYK2DhNj6Oev9mWmm11TBLHONLT+
	/bVB5r+DaMNxO8hD0RFr+kZC7H3ZAxoU8fhzy4P5jsUpRlCDaTi3kvewPk66KN7WVeBVNYZertC
	pdg4Y4oohaxN6M=
X-Received: by 2002:a17:90b:5826:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39b261b07b6mr8253370a91.10.1788519094870;
        Fri, 04 Sep 2026 03:51:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: include: fix repeated word 'to' in comment
Date: Fri,  4 Sep 2026 16:21:10 +0530
Message-ID: <20260904105114.29474-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035135_813921_C58F8595 
X-CRM114-Status: GOOD (  14.06  )
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

Drop the second 'to', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 09d7c00cf405..526ee54c0d33 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -139,7 +139,7 @@ static inline bool __pure lpa2_is_enabled(void)
 
 /*
  * Page types used via Permission Indirection Extension (PIE). PIE uses
- * the USER, DBM, PXN and UXN bits to to generate an index which is used
+ * the USER, DBM, PXN and UXN bits to generate an index which is used
  * to look up the actual permission in PIR_ELx and PIRE0_EL1. We define
  * combinations we use on non-PIE systems with the same encoding, for
  * convenience these are listed here as comments as are the unallocated
-- 
2.48.1


