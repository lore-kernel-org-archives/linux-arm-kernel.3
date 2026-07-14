Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1AAC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfKdTJ0UW1n66HS6tgSej7/MevFTojdr1dMFwbyGTJ8=; b=s3gqvXRAvN1T1YlRA475aN3kDJ
	FCrZ9Fd+hF8A8PnG5r9z896nffNdVcVof/rJOrOcCWHsgalBPpJPDnEGCgqDoKL4iG65m8MA7cjBa
	0MuazkDHLwpzzDlsJfUNrY6hxXVfdgkcXC/ikzTIOAg03M6+YBZmOFP0aZ2KPfvdP62vq6HFpT4Wc
	wkPQnOUVjN8LgYXlyMaZN0RE5JDSMSJR405IWe5KhWMX6HOoOCvq5p0l+nnSkQrpcVFDW0qQQgsu5
	dO2cH6pqHQf8q8vFlY/Q3xn+wwc+nEiOMiqvl18s+BPCRTNFKVg700yhjoBrtm5okD+K5/26bZIVr
	sjXIo5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhat-0000000CrKK-48N6;
	Tue, 14 Jul 2026 18:10:59 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhar-0000000CrJm-43Fx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:10:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493ce08a6b4so40979615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784052655; x=1784657455; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfKdTJ0UW1n66HS6tgSej7/MevFTojdr1dMFwbyGTJ8=;
        b=IsszCuW//iMVVenjC0QBJyH5UyDqx65blZjeasrdoFz7hDelruVDFKgIKozYjeWsxx
         eblO5t1kx2z/SMjnd7JKovmnMZNFAEf543kl31I2cEDlbHHO3c5avk8+g/ZlptwlNHEA
         +doo0JiaO5x84Ln8B6RN6u9dE7XMwBtDV0HzsE/lHapGfa1SzDjqRCIUgIgNxl9cPj2T
         m7krm6JobbhNKwGIcKrqIe8HTW1cor7Btc8X+01uBdpFV8qF93oR+rkSdD+UJ67RVokz
         7ZENNaz4xndgbQhjlQwYsPqFVkmxdhkQGwfY5ItpSCJ2MXyPi269MymWpolR+cKnTgN0
         RRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052655; x=1784657455;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfKdTJ0UW1n66HS6tgSej7/MevFTojdr1dMFwbyGTJ8=;
        b=f3fr5NycIl2p7iBCNkn0pE0y/Ra7YfUkm6/2cHSWjLDd8fyihcI0WPQhAOheXc1BTK
         c/wmr/6hNqCpJw7mPG43rJFpk1Roru0vlBPjJcVs99jVxDgZz/10r40Kxb3iKG3GOw0o
         MbV1GtqbpxjlC7rbmJv3QpLiqrVmzAdf1STAuBqcj9aDhEFougJ6nwt9PNHVVPNhLX2t
         lnhuJoNh0yevsuJ3fFGLzc/oxYv1C+cg5VcFV+bLU5ha4A0qO86GPtlrMD+CGgxM0Npk
         j5lrlwfhFstVJJdnzf5fp6sfh9L0FaTdHQQfnWKhRbHSuWn2LWJ+JJck7ak2X2DdehAY
         7HlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou27sxBEpaBUj1Jn1tK/50oElc/NPurSMWa5jwWhh1yIBh/kSsndJZvXIDbVNbvqe15NpIgm8BkhPs/cfQWSQy@lists.infradead.org
X-Gm-Message-State: AOJu0YzpfTvEqYE8CAyzUycBCCId0+03hCsm7zR9o2BVijdRh4DF40GC
	wxbLG6F4ze1tAQGUZlAoNvgv29TzXY3CcY/Up6DP+l9z/LGK8Riypp/L4UiXcIT37HImorBcNie
	3t6FB7fEpJxrO9RaxsiNACw==
X-Received: from wmrk19.prod.google.com ([2002:a05:600c:b53:b0:493:c111:8ed4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524c:b0:494:df:8895 with SMTP id 5b1f17b1804b1-49538a0251emr41049885e9.24.1784052655128;
 Tue, 14 Jul 2026 11:10:55 -0700 (PDT)
Date: Tue, 14 Jul 2026 19:10:10 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260714181010.2527225-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Fix hyp_trace clock disabling
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_111058_016183_02369B74 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Fix the disable path in hyp_trace_clock_enable(), which fell through to
re-initialize and reschedule the clock after cancelling the work. Return
early instead.

While at it, cleanup hyp_trace_clock::lock which is unused and
hyp_trace_clock::running which is redundant: the trace_remote framework
already serializes calls to the callback enable_tracing.

Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..0b03117a38ec 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -37,8 +37,6 @@ static struct hyp_trace_clock {
 	u32			shift;
 	struct delayed_work	work;
 	struct completion	ready;
-	struct mutex		lock;
-	bool			running;
 } hyp_clock;
 
 static void __hyp_clock_work(struct work_struct *work)
@@ -110,12 +108,9 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
 {
 	struct system_time_snapshot snap;
 
-	if (hyp_clock->running == enable)
-		return;
-
 	if (!enable) {
 		cancel_delayed_work_sync(&hyp_clock->work);
-		hyp_clock->running = false;
+		return;
 	}
 
 	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
@@ -128,7 +123,6 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
 	INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
 	schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
 	wait_for_completion(&hyp_clock->ready);
-	hyp_clock->running = true;
 }
 
 /* Access to this struct within the trace_remote_callbacks are protected by the trace_remote lock */

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.55.0.141.g00534a21ce-goog


