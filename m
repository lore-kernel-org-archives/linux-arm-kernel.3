Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709FEC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 03:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ojFTK86BOKHs5Sffk/1VcJDUeg7+bF9Sd/43yKdhw7c=; b=OynfieQU9FNi4dkmD28dhTHRJ3
	ZF8Pq0NyZHfFofaADnw5m8Zru+KbLKKK6oM5AOzUMpfO7zWiACaNnM6hIRCDgZLLMN5HmvYjIb/0d
	0Mn6DsgdqqBYynbMm+5VkIk3d/QGCJt65FAQ2I9AMwEmaWFN7u63LXAqnCOxBRDSa4qD/17yoRPSs
	zrJumAYWVR1DDqG3NzKVtyjCRxbSBTxcPO0Kb16xbH1GFY3HcqDUhHpEQeehrlCp08ynbSCV78Lxs
	AHwhsQI9I1jsRDQfb8n6V38XDovxjJ4ISiqsJt6OwcwumD6HF+XtBiGtRVKoqLa9je3uHffWPpTvO
	g5CurQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhVR-00000000ioh-2Cp0;
	Fri, 02 May 2025 03:56:09 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhSe-00000000iXk-1ETz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 03:53:17 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-605f7d3215cso820373eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 20:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746157995; x=1746762795; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojFTK86BOKHs5Sffk/1VcJDUeg7+bF9Sd/43yKdhw7c=;
        b=QMvjEIhIJ2iFe+zR8MzD+jhY1vQ1lOvK/a4HZsmZpUkANd3VIYwTjwFk+yOkefLjcb
         UOnGIATVRoyl0z+LviLlsuyxvBBtxhg4Pnw+n0blK4l6kPzwaq7xnZH5mOSjgbYS12u2
         DmLVHUQwUHwwEMzhhoBLa5597PnJGqDltdTCbkoASQtELbAhhgd32A2d/XOIYmtZ4CUG
         NZUqSoAGKF609/BeZFGwE2Ym45gnIE82q9TrqFT8iMb/TLT3p3Z/LCiUjnEzN8WlrE2t
         HZ3WmZXlRaGoJ4wuwVClYy5hiI1NKNF8aIwfcgu5wH9jozU7+y45d7p6MWEUsY8AfE7i
         5FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157995; x=1746762795;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojFTK86BOKHs5Sffk/1VcJDUeg7+bF9Sd/43yKdhw7c=;
        b=ZZlvBhOPqDKRyqZGEEdESkXZQoCcDhzTf5lRzD612Tp7zAQ2nSqJ5mzyoYf3fABB1/
         lJzo295cy1aYkl60kcf5pMPvJojVYkRjkH4+Yc8yD4QxOTsWKEZ8nHMmAdIyAyBEphB7
         Rtpfoh//v0mqWIQPZmADK3ctWg4OTWFnS4g8oOVfyzgI3wF4Oh7u3f4QQtRBF4HdOBjJ
         SdR2XFSPiBRVyO/91oKDZJ8H9Ar0SYTywG7LcNHyS2YQP9Pt2Jc8s7ReIfHLSSDuKAPM
         ykv8n8e+UCev7IPVFXflLtacLPVXnaRz652R3TPbAi/ffxndLpkFRWz9kgBdDCfs6OAg
         69Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXG6iw7s5KtWQduc4d0dougV9GTGdf9leBE2Jnprao16cpyD0SWys0nBllHqbUY15w8D5Lowp0Jt2B+yOmqVLJ4@lists.infradead.org
X-Gm-Message-State: AOJu0YyeJUFJyXcTVj/PCZUMM9rEv7M2XFQUKD7I7oUmbPocfercNqZV
	q/VwWN9/CBBncP06mwwUwA8/Dk0A4q9go5BQ1b1uFkAzLsZT7HS6VkvK7qx6YuCbrDp9ybL1CPr
	qdr+pFodsJiqAOPT/OdlAu+o2/yUWsKvxS87/MQ==
X-Gm-Gg: ASbGnct93YAbHMICztgqglFbfVlu0LvHmtFPy3Z682QQx8WMElmLl6JhOYXKUd4afHE
	cEtAZexvORyAXoh6R+XWQtaN6V4jOyibp/uT+KCdDoX1z768kF+l8+kpkdL63QTtpqkHW6PcaQV
	iycUl2RAOnMOqawonFxg==
X-Google-Smtp-Source: AGHT+IFCtscwV8O7+W4yBswaX+xL5CU0m6pTn37NOQZAybr47eZb3GirbpP/+XKz7nDZsXAaZlthUftbLpDAo4xDjtQ=
X-Received: by 2002:a05:6820:3104:b0:606:5531:d903 with SMTP id
 006d021491bc7-607ee6d2206mr788932eaf.2.1746157995308; Thu, 01 May 2025
 20:53:15 -0700 (PDT)
MIME-Version: 1.0
From: Per Larsen <perl@immunant.com>
Date: Thu, 1 May 2025 20:52:39 -0700
X-Gm-Features: ATxdqUH0icFH_SkqozKpifraM3UBR6tR1qCNPkxonjxJAJvE10BR_u9dZ27wUdQ
Message-ID: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com>
Subject: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
To: linux-kernel@vger.kernel.org
Cc: "qperret@google.com" <qperret@google.com>, "sebastianene@google.com" <sebastianene@google.com>, kernel-team@android.com, 
	"will@kernel.org" <will@kernel.org>, maz@kernel.org, 
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, yuzenghui@huawei.com, 
	Armelle Laine <armellel@google.com>, arve@android.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_205316_338013_D44E856C 
X-CRM114-Status: GOOD (  13.98  )
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

FF-A implementations with the same major version must interoperate with
earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not
backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).

If we return the negotiated hypervisor version when the host requests a
lesser minor version, the host will rely on the FF-A interoperability
rules. Since the hypervisor does not currently have the necessary
compatibility paths (e.g. to handle breaking changes to the SMC calling
convention), return NOT_SUPPORTED.

Signed-off-by: Per Larsen <perlarsen@google.com>
Signed-off-by: Per Larsen <perl@immunant.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 3369dd0c4009..10e88207b78e 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,

  hyp_spin_lock(&version_lock);
  if (has_version_negotiated) {
- res->a0 = hyp_ffa_version;
+ /*
+ * FF-A implementations with the same major version must
+ * interoperate with earlier minor versions per DEN0077A 1.2
+ * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
+ * structures and 1.2 relies on SMCCC 1.2 is not backwards
+ * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
+ *
+ * If we return the negotiated hypervisor version when the host
+ * requests a lesser minor version, the host will rely on the
+ * aforementioned FF-A interoperability rules. Since the
+ * hypervisor does not currently have the necessary compatibility
+ * paths (e.g. to paper over the above-mentioned calling
+ * convention changes), return NOT_SUPPORTED.
+ */
+ if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
+ res->a0 = FFA_RET_NOT_SUPPORTED;
+ else
+ res->a0 = hyp_ffa_version;
  goto unlock;
  }

-- 
2.49.0.906.g1f30a19c02-goog

