Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94759C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TENsUGes5Z3fy2akncUuJKhJtn2jCzInwDk9YfRh4i4=; b=Imcl8H/RKP8QdeBrvctVOfN8+C
	e6Aa7DUwcbchiDVYmQqYEoJHCuJw/Pa0/AB5nV7b3TttX4OLh3NLnTcB8iEmfTg3a7V/FAnwhw4BZ
	nOOhQZ0XZuj8CzDM0n+AojfU6qrrfQlJeZLvHyiBDef+a7S0j/lEl/SCR8vK0jKQEjXHS+3EhvKiB
	NAaiZKasKfCuZDuUypIFiR43Azi2hQmRWfk5h9nFOgPTF08OecY8IjS7WNW4m/kwfAU/KB8BatMsC
	jP6eaiWXPxK4LKUm8wSxy+DcWgSGP61HOY6YAbEoKxgsMeH83zu8wXH81Qvuai9Z4juqZ1CBTEkPg
	Dk9ZI/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xjc-00000006gnY-45RJ;
	Mon, 07 Sep 2026 11:42:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjW-00000006gix-0VQ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:41:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2740577a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781313; x=1789386113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TENsUGes5Z3fy2akncUuJKhJtn2jCzInwDk9YfRh4i4=;
        b=fQCCTGwyzq7OdvLHG7qUs9gVu4+Tm1HL0hKraHn1Tc3KLYnhaBBKfF9H69iCACEuXq
         7sVv3s2lubVM1H8ZdHacNK6b6WAKM5CNqzOQIg9nee82ewqftVDP3G0Yyl/IXHWpbVNF
         w02Bga34VEQ9hO3Pl+xiwIEK/GNvK8nigNJ1VtBzZvYiZgoqld3spvaYgyesD5Y0WhMB
         mTnPLUVkpZuG5EyjVXSdFfWmUMMSzn241M53o302P12l86wYen7Pw+ZvPkBIUy+G2Auq
         DWxvia4g9+ED2nOimT4jXdzW7YxC0eR+WJvCQdrgY3Lg972lRmcO98ioQZNreV1T4cbR
         IMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781313; x=1789386113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TENsUGes5Z3fy2akncUuJKhJtn2jCzInwDk9YfRh4i4=;
        b=Fkr3tz8vqg77YsX0fOeymk0xQHk9DI1Yf+x5jW0b0eCb05Gw6SbbSuPPJNHc9cRsid
         4cJhbkjPwxAwxS2O3fMtW0x0ZqEqL2Q/W3nz070wEr54B+kUkJS+BAfSkp0uIwHUZY0L
         Itc7Jd76JjXkinSHgcYAK4uUpJdG/K+weQDGPPt3DGrWOpGKXriH2MUt0WGiEn4fyZIl
         F0u6xLtRFqaZYCPh9XU2Ny/uS8NLxfHAjfeE14HAqf1eUOJfYOL2xDbFVt7U6vZ6ue/I
         6ABClP11DKgizK09oX6fvzxhugK2FwOXFF1cJxp9Su5hx6SZjsD5cdf1dVnOAU+ynqYE
         giDw==
X-Forwarded-Encrypted: i=1; AKwUvBx7j5GcWJd9xHRC2LrsL925flUpYZnLFV6dHaVqC0hgz3aFsnLb6Rl6fKwvDpM0QNe0rqMWbc44yCBB1AiYne6g@lists.infradead.org
X-Gm-Message-State: AFuF++mepHsrgW2zAOwYhh3mvskhzWfriARFT4o6E7aaD/RJlOo0GVtt
	0mwooq4qiDxwm2To5ztI/vZoiu7iM9diLYynvp2VuqcyNnhbHcI8whqJ
X-Gm-Gg: AYBFou3gNOZSLH9aue7dSwLuHtDIowKyHN4itvw4V3v2WIk3iIcPeotxS9xqk7xlCa6
	vl7PMmdDb5fopbb/iuo08m+viNhxIuAX37NQzcflKnnCj//F2Q51k9Xzz9Q42lsEWeLncSR+26w
	oCqxsrBbrkkcSYFFsWVb0ybW1ZTEypMf462sFjlDc/+ncstTfXsl3JPIAFV3mbuIP5t38DMSKQp
	MN9UOkZO0fIvwhKWmTqyfjdPrd9gSAQd7V55518x/GGY1NWd0GQjmHPJ0XQQwdQSGBtmUU7brtM
	fFJ+mI1wjUDVGqZXpBw8fVUVfOcwGIFePZ1+cOPp+lZAAwEqoft7a33bfyv6r1WJc7VNY7E30PU
	nByYuKz4QstRIyNV+8Ur2LirsI+i1DlVk12uU01+i9PfPI5QottMT/W5k9SoadJVSwuXLESXAbt
	MPH/P6fT3byDvSWzI7IH211WENlgv49nTXea99kBhOXxvaSvI/HgR5QEMQft5BJxEkkDEQfk3iy
	ab7B/FVS5M1RbRBKHHRpiOY
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr35731550a91.9.1788781313033;
        Mon, 07 Sep 2026 04:41:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm41100152c88.4.2026.09.07.04.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Weijie Yuan <wy@wyuan.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: arm64: Fix typo "initalised" in booting.rst
Date: Mon,  7 Sep 2026 17:11:46 +0530
Message-ID: <20260907114146.39715-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044154_165962_2262A49D 
X-CRM114-Status: GOOD (  13.07  )
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

Add the missing "i" to "initalised" in the description of the
spin-table cpu-release-addr property.

The British spelling is deliberate.  doc-guide/contributing.rst asks
that both American and British spellings be left alone, so only the typo
is corrected, not the dialect.  checkpatch.pl suggests "initialized"
here because scripts/spelling.txt maps this entry to the American form;
that is addressed separately.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    Changes since v2:
     - the guidance lives in doc-guide/contributing.rst, not
       doc-guide/checkpatch.rst as v2 claimed (Weijie Yuan)
     - drop the v1 narrative and the redundant "only the documentation text
       changes" line
    
    Changes since v1:
     - keep "initialised" rather than switching the file to "initialized",
       so the British spelling is preserved (Randy Dunlap)

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
-- 
2.48.1


