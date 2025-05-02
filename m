Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA446C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fB5WC809wTl4CZgtJWZZ9LIth3xEsvGA35RJbEoV80=; b=sVkn6vL9hWAn4vcqLS9yLFS78j
	AE0EEaTRnVYo2cmffVYwTbjRy4vD+niXxY4GEsHnHNHIr8s6xRFekhTDx24c4sOgrynRz8HN6URAL
	QjhKCG3FaGFSE6AppwySzMD0QOcExiQjpJs969SGiuIwyad9dPBtuy2meZ3NJ0CabcfqkQVNxewwN
	Nsm/QfOqt6icHGO6jbHjq5l6ecV5i7MFVNEqKgxTJI+TH0gn5q+GFQpyygemSfV2aoxVag+Nu+zI/
	rlHTnYJIIIzcZZwRp/otnb7286/9por4V/yGofR9U/+yjqLy+IUpMNlPisC7k53d4jeANJpcRTLmW
	kcr4wNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmiD-00000001Lxs-1wFm;
	Fri, 02 May 2025 09:29:41 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAma2-00000001KSV-2mPe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 09:21:15 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e6e2971f79fso1477291276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1746177673; x=1746782473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fB5WC809wTl4CZgtJWZZ9LIth3xEsvGA35RJbEoV80=;
        b=K7UAGgDBPZ4Zdc0Q5Dbf8YaIQzgW4TRantGzh+XCHWCNEP6WLt6NZmU1x3RC8E6Mr8
         tVK3IzB0L+Te1rBBza69NSbxLvrvrKYTjG2viK0tgwwJpcZyjqvK2zFteeZziiQVjd20
         ti8BP+7FdQN2xRTOl7r0JJxR59TEMrLq/H7QCWuDpTDUF8GqzHX6XnBanWaohcfb1g8k
         rvhXZB5PIMEFzgs9IG+XNc6MaWY/jCbFKeZzkwoGg1OOeXLf37UjJ2YrWnh/ZhSvetNv
         OfgGKpJkFpWviZeV4gUpSKZU+3YlQlwjoeyEshITDDYOMSWYBdLuAJvwWwUdRjGEWv5O
         i1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177673; x=1746782473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fB5WC809wTl4CZgtJWZZ9LIth3xEsvGA35RJbEoV80=;
        b=DU11awkysuUUkaNAz6WFvDDp5LnziO2WtjNhDC0vpYeUg5eAVv10gT/Vdjbl40Pq4g
         hMXxCVqMOW1ERvmPzqSrOuJ0OgTdmC64RmfC3QCgH24LNq1fnzBNmVLHOtd+l8mribJu
         jhl4YhVCyZoJSBJwkxY8A1FTHBWZ//ylZK+Xpi0EuXbLrwl1nhTpXtqqpkjKVWwCQePG
         5oMiBNrcP9xUB8Wx7k0KSetw2cZwWB5KXll9bBkXBTkwI8wwSSMg4HpOi3euJfDAr09H
         Ob1jqvMLtqQ72XTnOQNOqFrhJhEddlPm6TiweAgIPsKPzK+X5ZpmwXdPDNqdORx8mWED
         HsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYsVtdbosPqKY3aJ6lqLgn85ADmCDbBj4ClJaydg8jRvtWY63A+2vKBiQEVE32FR0I/WmbbDVh2aXjMZG4IFF8@lists.infradead.org
X-Gm-Message-State: AOJu0YwVhCtGNrIxBil56+TBnLk5qUaB3Y7ZKmBPfubJp822jMl/lZca
	XsXkHTqzt4Oa17/hoEZg5QistF71bx6yEXnYhLXcdvvHlBSNgh72y0rKFqOjDTU=
X-Gm-Gg: ASbGnct7/tANbZkdkTRuXaCp43wl3qiHy1yh9PhwpBkYWwQFEgOXvi/Z40LgfETW6VR
	+elleezKrmwmaDpvJvMBfUv5Dgn2p5B2M/I8//m1PO78wwFmGCg2p9hm2lt5mQixSCVRau6DPcj
	rqIBZD+ebMoowceXdU91fcC4j4SF4N4FEADFS2NrlPqrp4S7HzWopWseuPd2eFQYoyzS9YjEsRh
	JeBsmkuUVPTZgqunDFj/awjXCIr82w2cj2J6H6TUPpsbZ4sGEeBBpKR8QsIrrRlJRZhsj61YgDk
	8pfr3gPKryYrA9DGo6eDPSq5hSUETRsG32So9VG62fmavD3RmJil
X-Google-Smtp-Source: AGHT+IGQUPnvqf/qgEgSqRGNA98GCO3ipomvK0QEj746mMZOPYN8VysAcht5q3HIlb1fWVBbhO3x6w==
X-Received: by 2002:a05:6902:2085:b0:e63:ecdf:4d6b with SMTP id 3f1490d57ef6-e75655490b5mr3096136276.13.1746177673505;
        Fri, 02 May 2025 02:21:13 -0700 (PDT)
Received: from donna.immunant.com ([12.9.190.3])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e755e7d92d0sm556427276.55.2025.05.02.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:21:13 -0700 (PDT)
From: Per Larsen <perl@immunant.com>
To: linux-kernel@vger.kernel.org
Cc: sebastianene@google.com,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	jean-philippe@linaro.org,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	lpieralisi@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	qwandor@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	armellel@google.com,
	arve@android.com,
	ahomescu@google.com,
	Per Larsen <perlarsen@google.com>,
	Per Larsen <perl@immunant.com>
Subject: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Date: Fri,  2 May 2025 02:21:06 -0700
Message-ID: <20250502092108.3224341-2-perl@immunant.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502092108.3224341-1-perl@immunant.com>
References: <20250502092108.3224341-1-perl@immunant.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_022114_698773_B5626911 
X-CRM114-Status: GOOD (  15.23  )
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

From: Per Larsen <perlarsen@google.com>

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
-		res->a0 = hyp_ffa_version;
+		/*
+		 * FF-A implementations with the same major version must
+		 * interoperate with earlier minor versions per DEN0077A 1.2
+		 * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
+		 * structures and 1.2 relies on SMCCC 1.2 is not backwards
+		 * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
+		 *
+		 * If we return the negotiated hypervisor version when the host
+		 * requests a lesser minor version, the host will rely on the
+		 * aforementioned FF-A interoperability rules. Since the
+		 * hypervisor does not currently have the necessary compatibility
+		 * paths (e.g. to paper over the above-mentioned calling
+		 * convention changes), return NOT_SUPPORTED.
+		 */
+		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
+			res->a0 = FFA_RET_NOT_SUPPORTED;
+		else
+			res->a0 = hyp_ffa_version;
 		goto unlock;
 	}
 
-- 
2.49.0


