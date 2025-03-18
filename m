Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738D8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82xqydvgKJEdTD6AS9zEoISi5ga6dIOMUMPwBL0TAWM=; b=iorDlfNCwN9Q78YD/U1H/et7Dw
	+gb1w4t3n9d7Rt99nAMnBx8+epfiBzzCGlaZo2OhkX3r0JMSYiJq7ZTpPrHah6Fn1V4lJ9PYQFsH7
	KWR2zNdi5yZYIlUm/+wGTvtan3pMP/MlY1B9fjEjNTqo/J3Z62iZSMMveUtUnpH+jW7JFAIYfTjUI
	ufCy/1p32Dc9lQmOK3q29HbB8rFSa0A+NbGheAn/Udkn1IcInsEMmAMUCuywwMFFw4ydeu/X97bCZ
	cS8L9ihu8kN9X08sNc6Jlz7+VGL/MALUHs9KFl6J3V65JefDpVsJjdnYJMU+kDPfmp5DqkgmFrCAn
	ACymeNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua0J-00000006ZSI-1XaB;
	Tue, 18 Mar 2025 16:41:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZkz-00000006WVH-1mEt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:25:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so22408315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742315132; x=1742919932; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=82xqydvgKJEdTD6AS9zEoISi5ga6dIOMUMPwBL0TAWM=;
        b=D/wKpSCzTTwIYNf42vxxGrxZUdTSbyFXT03xccLz9asWP8lUSQFK5HG0CrB87kgULw
         YL4ISFwTww3m4J75tjE5L6zbcZyU/EWJFeAuvkX1dmnPLMTAB4vb+E4wb5+f6K70w82x
         X3vS6dwqcDjiiMG5T8mvNpK10xjy1bh2D6AfSmuE8AOt4V5fltr8pJQ4zOCDYVzXK8Tf
         9wovb4Sp2afCllbbJpYsqjZJ3lTWxUn44TgshlfVzXDk7+1YZTwAcEeDh91HMyPpp2qm
         fbSrUcFGCVo5qBHyuFte0T7uafhq93NNXH+UP+sNEdmkTSXnofj47cqfZS5IMxd/Q3KR
         Lpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315132; x=1742919932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82xqydvgKJEdTD6AS9zEoISi5ga6dIOMUMPwBL0TAWM=;
        b=CnwtqjX5gIGixJxKzQKB2bcCib8pC/rWTHeCwirEA706WxNTyEBQEjHBixqTowGrwD
         aY5IEnlGInkY1EMsRzSJxegoda7ublw3GsHr7x1DZdoO5M3iSsVkaWJdfXMwGrEaDRmt
         O7vntxKcL/LPXMKdEKmi16NWczgq+L54uhDBN0Oj8g4p0fKzgo+LG4ivPKzNeWDP/bxU
         Dum+uE4TAZwK9pSSXibZKG7JvsDQt2G7jpKs/4iUD3RXKhgCsPGLiHkfIfTYPjJTtMy2
         M1y337nwtTW/UF2w5339EHR6mUyBbODY8QSSIGXUzWMmJxXNVE4WzmfhmY6A0s5BmHbN
         BogQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbeareTVrys4e0e6FkKPaq8wzwRlVTsFsnijBbte+91GHe7a4AQPZ+FoPYOOOa+h+TQ1xxpDlMkVW+cHh63Ptd@lists.infradead.org
X-Gm-Message-State: AOJu0YyJdHMq/77PsWjydYerrDS6j8lUcjj+uYwMDxluF9ba3FMpzsmN
	ocfT6+Fmocfd+IybJKFbf93sHeMuLKeX1h0jQqdzt2tB6BgRxxU/Nu/WzAvtoq0i6F3I/RzkRjh
	8l2ZQy1mpeFQyn5PfNeEHa1RhlA==
X-Google-Smtp-Source: AGHT+IFqbXkqs2Mp4b7p4DEZXKXsbkJMcBqeeMGJEs4JUgbYXZRQtxNivjVbKfH+2JB9M7Bhly80ZxRnTmUFvY4cw9c=
X-Received: from wmco3.prod.google.com ([2002:a05:600c:a303:b0:43c:eb09:3784])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c02:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-43d3b951acamr22481225e9.1.1742315131880;
 Tue, 18 Mar 2025 09:25:31 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:25:08 +0000
In-Reply-To: <20250318162510.3280359-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250318162510.3280359-1-sebastianene@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162510.3280359-2-sebastianene@google.com>
Subject: [PATCH v3 1/3] KVM: arm64: Use the static initializer for the version lock
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092533_460688_13C7E68A 
X-CRM114-Status: GOOD (  12.10  )
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

Replace the definition of the hypervisor version lock
with a static initializer.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e433dfab882a..6df6131f1107 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -69,7 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
 static struct kvm_ffa_buffers host_buffers;
 static u32 hyp_ffa_version;
 static bool has_version_negotiated;
-static hyp_spinlock_t version_lock;
+static DEFINE_HYP_SPINLOCK(version_lock);
 
 static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
 {
@@ -911,6 +911,5 @@ int hyp_ffa_init(void *pages)
 		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
 	};
 
-	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
 	return 0;
 }
-- 
2.49.0.rc1.451.g8f38331e32-goog


