Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26932C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 04:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arAQKO8UQM0dQfXie+8D2prlulJwIsVlpZ53Yt0ULrw=; b=MsyKHk9cootx+wua+4nUBoBf3m
	r+2zKxEycwXuG25D/+9qMck4zW9Us8ey4EZUrTJs57+vrzB5QaaCo2bFWqdvzDKn+wbkX1ATACXzM
	HyEdGz6Rg+UtvNqLjUxW5vRU913zDEQ7eOtM0fAyZ1/wVIge0Gg020gDUfEqd2yt+P3oOENcRxLTt
	xEh47ejHSUqT+RkOweQgzvjxCOvK8CNKtgov1zTH/gvxKb5mgwrFu+rIqBXwePmeoycaSJUmmwzjg
	TyEbwOO/Lr9KNfFcebmowYPgQYseidqPE+SojeP6qkNZD5KrF701yU+ZsDS6DnbQxRdW3TgeORguA
	E+Ths8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfMc-0000000HDmD-2Z8X;
	Sun, 16 Mar 2025 04:12:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttfG0-0000000HCAR-3HU3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 04:05:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2176542f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742097947; x=1742702747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arAQKO8UQM0dQfXie+8D2prlulJwIsVlpZ53Yt0ULrw=;
        b=dDWrlm1QOAhKANFdb4zvSVfDAhQw1LmvwnSFdRl9M3jUtKRnEe03Fa39ZdmfJJympL
         AwHVhMjoYtWTAtwIS/mf5IZcnlWn6habmF1V0XWAVIfHRFdBmWU10dTqdnLc/QQzv5L5
         HpMvrEQqUBbZD4VuluHcPWt6EeF84gSvs0tyoUh0mc5EqxeSAgKZyZIcEQuFWihCi9gl
         mhaIRSmAitacHlgWQwCrS58ZpEpQ44RhMKGd66kUypWYSE8QRmIJNeJ6lRvjePX0yFv3
         yOGPB4OpPq0eGeCXxd0ZUBRWnWUF3ofoyPf1Ex2xSrPu7T3JDTSUWYXgPp/mAUWTuRT1
         jEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742097947; x=1742702747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arAQKO8UQM0dQfXie+8D2prlulJwIsVlpZ53Yt0ULrw=;
        b=szle70Vq5sSdGF5AVHW4x/gmaMRbP6icFS5VvE7rMH+m6k2BUdxR7JW4zkhrdD6UF2
         /Vl9s1YLHUdr+ubrN7Q6Vh3aHGBz9uaNfCbbCPVHCZMsiq+68iXCkPeHR13WuvZQMUaJ
         KUEbgcZx/icC7O50BUbmu2ZkMPalzNgW5z4Jh9AJYSy4+62yGwGTh7YECgPSIMb1Ry2M
         MZUEiyEMo0YsR2V2o11+t3tJAAz9eEtyBpBQoKvUL8gpyPgzTXnFmHDslaxhaKwaiHfE
         T5CIwt1EpU4ruwWJ0/BpvvPzM7GggtL78JU5BX5eYI1ySHLj8KuEnSfUKB9zX3i5LEXF
         L0fg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpJE89tlP22DN+L6pkjwVqx2ESjbHqj28ytKUbuoMCCkCgJ5+VUq5V/fhyVaXiGp8uZAZgJ4/DVc6rRssE8gb@lists.infradead.org
X-Gm-Message-State: AOJu0YzpUfMcwBaM8QS6yzDnEL5tk0r1xZCQNMK2qNIkLlb15Aw4R0zX
	c+7lC9PkOVDdh4KwhPQlIps1WVMIjuIJfsnJfJI+m3edGIIvSFrf
X-Gm-Gg: ASbGncvd3BTRLyLCAMhAIUUtdA0RLuIyGP69jGqIK7eSSGyuXQdAXEAcvbZBzvL89TO
	1iHmtlfKC7RuS+QpAvCppY6F308FmUFZOxL+OTDBUEexr/UTP525BilzZZKyuefB+wUyucEE9EB
	fTk/QIkKXeIASWNjnqO3jgtwKhN1XyDj2rF4Ni82aQcN3MBOSp4RbxZA2eNMByybDypoZioHMYg
	GW0H6eN3ldJrTuy2hMe+HXFTbud0ix9N0NIlZpdRbZWo3g9BMLYNVCfzotYw4jDe6t1Z/609IYQ
	XquyTkVxmmBbnkor7PSntPipFdiO4Ky0XF4=
X-Google-Smtp-Source: AGHT+IGeJzY3eBGexLcsk1yze9S3oNLCw88EaC+mhaa9vg5SAERJj6XSK27DdfLilXTABNLSoX68Ig==
X-Received: by 2002:a5d:6487:0:b0:391:4999:778b with SMTP id ffacd0b85a97d-3971ded24eamr8650576f8f.28.1742097947068;
        Sat, 15 Mar 2025 21:05:47 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:48::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm10936707f8f.62.2025.03.15.21.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:05:46 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 03/25] locking: Allow obtaining result of arch_mcs_spin_lock_contended
Date: Sat, 15 Mar 2025 21:05:19 -0700
Message-ID: <20250316040541.108729-4-memxor@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
References: <20250316040541.108729-1-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; h=from:subject; bh=bCYnbE+K73lTBoOLttYSRrRShne2EKo6ypzNdER5dO0=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBn1k3bZVJO+UtaXh2ksd2ygsxMkhcgERBwBjs9FllI XcQQD02JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ9ZN2wAKCRBM4MiGSL8RyrE+D/ 9mak4NXwqkExtA6v4P4pv81udcNOxwDMXUb35o6/CJjxArzw0HvdY428jcentyE0WrkYShVveSLa8v gbZpOY+R4DxGLAG9A7vhsHWyBPTG4Nm/fz4K6mql1dG8Rn86G+pi7KNm9DUbA8dhS79edorwxQ74w2 ZgfwIKcHyHKk//0Zzo+3TqqGOY647CW2eelFr/fOUbVF3aHHtj3H9SF2Cn5TYkGwX37s0nQT08NeRC 6lC3cRBakQV16GrBRvnzuxwKCr0riv4WOvH+At23JAXrPoKxRRCJyHthJUB5AjLXXVpWjd3vQRZ84e m4j04JXHSKMor4vL6CJNdPbQ45sjOyPq0IX85pP4AbEnoRaoWA17Z6Sc8YfUIE7vO6miyigFrZ/abj THdDEqULYZgI9XRQlWB8yDm/grvuD87SrkKzJWdCqZOqs254FuPsbYcY7KBd395/gAGmRcGdmPdBEn vM+vkNfbds7UMoaPYMZ25ck7vCMuPGGuBlKCj7EkeTPCiIB0tGsLZGXd2YsjABChEPH7pPPLS7CnTm TU+UtlJRzlhncgkJdmlb8xaZyibSXEjKB9b3pd4fVNDotHhyB0wT74fhCqGrDkuRX7vV7yNHq1zr5J hr44cNlreYhdVZJm7c3j0JwwYDA2zXpv5B2N5U9pbKtklVtFtNJa4aT0axtw==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_210548_880345_A62195B6 
X-CRM114-Status: GOOD (  11.04  )
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

To support upcoming changes that require inspecting the return value
once the conditional waiting loop in arch_mcs_spin_lock_contended
terminates, modify the macro to preserve the result of
smp_cond_load_acquire. This enables checking the return value as needed,
which will help disambiguate the MCS node’s locked state in future
patches.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/mcs_spinlock.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/mcs_spinlock.h b/kernel/locking/mcs_spinlock.h
index 16160ca8907f..5c92ba199b90 100644
--- a/kernel/locking/mcs_spinlock.h
+++ b/kernel/locking/mcs_spinlock.h
@@ -24,9 +24,7 @@
  * spinning, and smp_cond_load_acquire() provides that behavior.
  */
 #define arch_mcs_spin_lock_contended(l)					\
-do {									\
-	smp_cond_load_acquire(l, VAL);					\
-} while (0)
+	smp_cond_load_acquire(l, VAL)
 #endif
 
 #ifndef arch_mcs_spin_unlock_contended
-- 
2.47.1


