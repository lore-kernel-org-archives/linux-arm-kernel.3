Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED15C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HqVASaJxCqTvezKR1/7pImOEJNTa/8ze2+bN0p0ybM=; b=zfo9976TZJcr4l1aPTf4HKVlSi
	C9BgqaWLTDN2m0+XNX7FqpXmiqIU2nGvDWyNMXgTakU3PFP7uKGedYn+Q5wiLzwLMzFcsYcHOqZ12
	2ltSBCzVTO6m6sbBRtWlGz51fRSsiaDucarRQSahzwzKHbl5qkQkorEQEiDMNRz4FE6v22+v7bY7m
	axVfL2t7OUUttq+QblAXNqjujxKsafwJGGopGJy0TDz+DtVXri9+2XHVJO0d9Z5SZ37X++AaqdZVW
	mPXBW6uEzeZrRWKrXEwaj//1zeUrVLOXNBR34HzsFwYOboEOLrXck3ouKCECWUIpkj2SlmGopyVMZ
	AKaXJa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7w6-00000001Mey-25py;
	Mon, 03 Mar 2025 15:42:30 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dd-00000001IFV-2x2a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-390dc0a7605so2500898f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015404; x=1741620204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HqVASaJxCqTvezKR1/7pImOEJNTa/8ze2+bN0p0ybM=;
        b=EYEVHDIr9jRkMvNvq3ivV7jHqHIM/QPOL1RDvZnOyIKUUKPO1KZSQNtdFZoyJ9/FSV
         2r8rUWtBa0uhbeGEnPSAeAUJ7U2GuFAR2cy6eMBmNU9IKm/fGCI0ovqh4wlDBtwwf0ok
         VC6RsUTiF0L58CKXlWl+0g7t4Yk20uMqmqRQ1ArxZZeUSxmr14Gtj0DiU/n+EsRAkwzk
         7pRUBUX2CRZeKA/RnPW0c1bNCJjOINCdYDeFGCTXYZvM0YAE71CncEim6OCSFtNGBUmX
         ASH6lyB5Io6550GWgAAiHuAAdv55/Jew9uiJSdB/7oedIYz5expxUmXkuI31UHqvBocW
         L8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015404; x=1741620204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HqVASaJxCqTvezKR1/7pImOEJNTa/8ze2+bN0p0ybM=;
        b=IzOIUSl5qgVxZ41t3wk26xFGG/P4N1qHl66F19jMxbk8WAkkGqatuMJ6TRzLnaVj/L
         ZfTaa5K9obCQjs73QRh39T/lQfeCrLJoiAJkuE80DwbklAVdQCMyGIZrhmF90vPeEK5O
         FPCbEhMvYb+mE+GpTABnxN+B9E7RV9nwhmo7CqmQrmZ9lldV/ZoG4BXxRrGw6FJfKzAG
         JWZypXSBaayuZ1GlUROilH/4tF/Ys3H7HhHBrxN1PZSTuba71mhQ5yos8XziurGO/Xqi
         b8DMMGEjIMvJCTMXGGWUzRLurJoUA1pT2twCCg/YeQxMQcVJfVBcaLp81/wZXiWTEC0y
         gAkA==
X-Forwarded-Encrypted: i=1; AJvYcCWeI2Fc13Wu5NpBbf9dVnf3Y6/ET/S2B6VcLO2Aan8GQxWMVSH3ItP0k3jS1kTlub5bE5+5M4QrbA0/hQ1iih2N@lists.infradead.org
X-Gm-Message-State: AOJu0YyywCJepdmH2ticY3nvKKkUACrqEIabtH7LkAhukBcFQ4YIE68H
	b8bsApY/qM6XWa77SM84h3JbHjIyIXUsMOM9ov+yCs9Eon2uhsFF
X-Gm-Gg: ASbGncvsXiqHUlblccV4apWras+BSoK6lc1KELDr5q7nw/E2GIiv34HE+RWpXucII6y
	zfiUkbTe61csQG/Gx1c+RILdA997VEeQs+6E2gM3qdRXOrnmapde3xR+brd7y+po7KJsxMYdeY1
	mAd9YCl0x6ch4kkmh7lyTsM/1Eyp5/BNip2QV9aqrTT3RIDCxRiW37QgNtWMac2i6qOmBbOs/Ae
	SP22ye5pkrPq86Df6JItYR/OHAFIVlMu18dvDasWYiIhwBW7lPK+iE14XhW/A1xTKcqa9CR2Aeh
	I2CJquyTwnyr/xs3ZLKOAePuI+rUUOsChPE=
X-Google-Smtp-Source: AGHT+IGJtvDm6QNWOZ/Cpj2mx/hKnagicnAIvDMSVdaEmiufPdG1r9WWQB7409X5ARNMd+GMAA5o0g==
X-Received: by 2002:a5d:5c84:0:b0:390:f1cb:286e with SMTP id ffacd0b85a97d-390f1cb2ceemr5781942f8f.27.1741015404157;
        Mon, 03 Mar 2025 07:23:24 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:44::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a7473sm14977125f8f.38.2025.03.03.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:23 -0800 (PST)
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
Subject: [PATCH bpf-next v3 11/25] rqspinlock: Protect waiters in trylock fallback from stalls
Date: Mon,  3 Mar 2025 07:22:51 -0800
Message-ID: <20250303152305.3195648-12-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1845; h=from:subject; bh=Q9a38BvImlUP8RKT7WE0lh2B2I6Iy4KpJSDwsgIePN4=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWXG8w8qbawJw3OszHwUL3Z+OsS55BpLQ/c3hWE /xTGsM2JAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlwAKCRBM4MiGSL8Ryn5oD/ 96RVXMaF0ne5BLzCBhyNtkJBr6CAlauxQ3pblR3jmHlcP2GkKE00BZqXSuo5K0M0W8hzmyVBm8WZpv QmAprnJvjPvw3bTmZO232VjrI6ST5tJSd6XooAlRFPv85J3lQFS6z5IVGVtrJ/t6kbOg+xfwatWJVH JpGj9jJXyCIiXjHxaK91EcYxqzLOnLljC6WmGxE1N0lmh870+qkXn0vCZjMQ0lyW8wHEBbZ6Ywy8Gz 55T4SsC+beWbwhBNCJn02UhnONKtZqi0rm69Mb6AY+eRzPn9ZAI/n8F3jYqkY+yDCFq1Z4mdsWAsU+ UcxEA0xxZEA1gBVbVzAhkYvCHyFYnA/ZKE/8EZl6+ARIPGiQVPEqYETfeYZTVMxznw060kQAguI7WX WEFHRA8OzFTHycOX3/U8m+f3+9dgBhhVfpf0wJJHSMzNPR8J1we3rcdGBFiA3d8MdoQPth0iHEU2zP AGaEkhSEo4gXrUXNZnLq3ZpLEB+nn1ImiZ31A2o/3uJ4Vw9/x4a0iPKa01RJjV83Kjms2TGGOvbW2N GPkv4fOWnkSZv94YXDW/lzuzDng6iHB/gMJzFDkesuEjSysN2zSjMlyomMe3ja5puRwyFe2tE80jLM qADm2HxuhDZkxotSHNpoBoyUppVvy95LQycs0czfCa2Iqw1nW/eGWv4P5IYQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072325_755968_7272B211 
X-CRM114-Status: GOOD (  15.12  )
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

When we run out of maximum rqnodes, the original queued spin lock slow
path falls back to a try lock. In such a case, we are again susceptible
to stalls in case the lock owner fails to make progress. We use the
timeout as a fallback to break out of this loop and return to the
caller. This is a fallback for an extreme edge case, when on the same
CPU we run out of all 4 qnodes. When could this happen? We are in slow
path in task context, we get interrupted by an IRQ, which while in the
slow path gets interrupted by an NMI, whcih in the slow path gets
another nested NMI, which enters the slow path. All of the interruptions
happen after node->count++.

We use RES_DEF_TIMEOUT as our spinning duration, but in the case of this
fallback, no fairness is guaranteed, so the duration may be too small
for contended cases, as the waiting time is not bounded. Since this is
an extreme corner case, let's just prefer timing out instead of
attempting to spin for longer.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/rqspinlock.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
index 9ad18b3c46f7..16ec1b9eb005 100644
--- a/kernel/locking/rqspinlock.c
+++ b/kernel/locking/rqspinlock.c
@@ -271,8 +271,14 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	 */
 	if (unlikely(idx >= _Q_MAX_NODES)) {
 		lockevent_inc(lock_no_node);
-		while (!queued_spin_trylock(lock))
+		RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
+		while (!queued_spin_trylock(lock)) {
+			if (RES_CHECK_TIMEOUT(ts, ret)) {
+				lockevent_inc(rqspinlock_lock_timeout);
+				break;
+			}
 			cpu_relax();
+		}
 		goto release;
 	}
 
-- 
2.43.5


