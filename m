Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57000C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=; b=Z0sb2Sf9cYKt+qaPiR/uVuTgCe
	iJt/k9yN7n+kuhloUM9qMQdBF29SgJp7TIn1Xg1Cg4K/JPP4c0pLjljUeMu72gUhQqPOJ1bBAKivG
	oCpPE2/uAnHy1fXZks2y18ocHS2wKF0S5SWBa/YJghN3riSb8kqjPDMs8S34tof/c4X5xxlsdx4dZ
	Z+dSsARVyunaisnAZX091jKTP5m91zB7a+Py3L63GOeXz0hzKkO+yE5BSa2hgB0Ou7OA65brcEXRt
	qAbsEqK3uNCrDLRz/pun/cOBWvJscXmDNK9RZ6krnUpn2zNE1ZLpRUeycXictc38cE1oYqzwznkus
	84fNyPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VPP-00000006LV8-3m5X;
	Mon, 07 Sep 2026 09:12:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VPL-00000006LTP-13lD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:12:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3533790a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772374; x=1789377174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=;
        b=saMurz/JlGdOD4EMWDvAd5mce1FWJbWqqgIauCLjEKPbPC06wgg5xFXdJLs69VDrNJ
         oMdxBDbO0Ca0QaD3S7PKoqv3JQE2NCEeLkt45L8GBKWfojFRnwDkfvnZkOVjOaSgiDNH
         J1wMO47Tu49urviClUU57fTHj7NP29SeVabxcj60O/1+UmMUhqjpX9t9cRgBytMBdrrJ
         As77WKXijQugDsgZs+jIb8sCF3ZFMf5yWL6u0sgSw2typlK4F1NN1O8nY9ybaBDLa5+B
         rt5QsLkBlskoj6oc44One7vcgu65R7T6pdTasf0bu9L6NqXfbwsPEEqONkNCjVugKecs
         Ot9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772374; x=1789377174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5ZUfqeYp04pNo/Q4XLiHt5Wl2L6OXnuVp96rMiPgCo=;
        b=BeaxEjnthfDN/teDOaxGuud/cj+8EQDJDtuHC+gD5zEB4qtJJK6GoIBzwnhEx90M/I
         1sW/L1Ohf6hY6Euh/A79QtkudtmRvGXdMiJE83DnbjVdLoZS6b6bVrBF0CIJjr7aSUcu
         mCe2dcrzwM+Lm9jRlMEpZLGzuXOwArqc3XQQG4t66efH38rhhlgzw6fYDobcqZQa/W83
         /SNUQ6F+6qXrIS0B2LLxDnoo5T3beO09sdXi/SUYsZnsM9w1lleTtnnMzNIxX4xJWktG
         iA1BlRrQF1GpA8+S0MxTKwTPE4J0juLGMSbyVNYgPg7KPyVceQS3nIXLyE4owXeAbGoK
         J1Ww==
X-Gm-Message-State: AFuF++n/QKeriEM2J/7paAr9ZfIikNsDctekorCMLx8v5SvER4haayYh
	7AFzf6+4ins4steyfgHfMBMNm0rHL9lvejC0MnRHmYZQarn/r2QXlwM9
X-Gm-Gg: AYBFou27CG26hO70jY8gLs35OITb1w9u0aJPlwre0ZIfoWn0lb0qx9rO6UE+T/JkcpW
	YXko1llCxDd1dGwzQAz1UcJQHKfNb1qBcWwrEnQVAFU2yZuoJWTDbwW7wiMJEQQ2QS8jyIVRQz7
	0aIY7BmY2oIbsd0+FixbsR4ZaET95iN3feSLKQIp3VRUxN8FIfMGz6f4lzJ3qrAEXAvRB+NgcJw
	XvNXEh8Sfgp53VmtGZNgBJimaOcr8mmxPmuQDmQaSauJtmqqX9YnIisu3eYZqz7yCP0vlzNzGKH
	W61+TgCzfsYb5SsgxeGHiQsx0N9NfKNcE4sRpZkm0yG0NNzyibWv5nXRb5NyNAdBkbHfguDqbTK
	PzPj6RUTgrSfVUrWVQ5CT/Kt8sSWfucUkap/RlgKWCdJH9dzBeOsExArLYbAR6eJEkxqkoJBlSR
	Bi+wui0p5rl33XxeR5WUQcP1nVOgfG+dJLUsdsFmeWiCrCj83cTFPDHt6Edsa2hzvmkWim7a9pj
	O1KLXTdheu0Ew==
X-Received: by 2002:a17:90a:d00e:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39b262409e5mr34469498a91.25.1788772374311;
        Mon, 07 Sep 2026 02:12:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm25086123eec.0.2026.09.07.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:12:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: arm64: Fix typo "initalised" in booting.rst
Date: Mon,  7 Sep 2026 14:42:48 +0530
Message-ID: <20260907091248.31415-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_021255_309682_6DD5423B 
X-CRM114-Status: GOOD (  14.09  )
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

Correct the misspelling "initalised" in the arm64 booting document.

v1 changed it to "initialized", which quietly moved the file from
British to American spelling.  Randy Dunlap pointed out that
doc-guide/checkpatch.rst asks that both spellings be left alone, so
this uses "initialised" and only fixes the missing "i".

checkpatch.pl suggested "initialized" because scripts/spelling.txt maps
these two entries to the American form; that is addressed separately.

Only the documentation text changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..891fd22f7229 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -588,7 +588,7 @@ following manner:
 
 - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
   property in their cpu node.  This property identifies a
-  naturally-aligned 64-bit zero-initalised memory location.
+  naturally-aligned 64-bit zero-initialised memory location.
 
   These CPUs should spin outside of the kernel in a reserved area of
   memory (communicated to the kernel by a /memreserve/ region in the

