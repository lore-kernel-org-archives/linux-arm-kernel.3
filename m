Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C223FEE4EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gYJtdbq92lJwxAY8zEz41rbLPgrr8AqLw2l7+cG/47A=; b=N1tBnY0qSwPhcQE1m+2mJLJsaL
	aeGLPDo6sY5+8lD8HkkfobhV7DQFlKH1QqEPbX/xajlz3lFZz/DJTs5U3okbEEApBql6A8RKdSHOA
	UkZWNQC4RO06vdqKqYHZZ9e1R2ke3SIBP6JwnMWuCr1p4eFNvtEWX75wc0+PUR4mLfCAN5Qtjsdyr
	yM+9tQYtmU73eK2oXQqzUNoJ6e4UPsiQyC3q1PbJpNAGlUBnjKyEnFqT3HVWNxhz7iXJtSAAagmal
	/qZSGnkOA9YJkDroEQBkb6Wxn6wd13qZNJzjkZcKoSn2c2Q7DfEdrABzpeTyZdPfX+ch6PFngfGkW
	2DB5WXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQNH-0000000ADmi-0sVu;
	Sat, 28 Feb 2026 19:53:15 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQN9-0000000ADl2-0eVy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:53:09 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-896f8feee14so42083706d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772308386; x=1772913186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYJtdbq92lJwxAY8zEz41rbLPgrr8AqLw2l7+cG/47A=;
        b=Why4kzl94nzprkJSDLXBUtK87+2cRSw8qwNC0Ds+/KUlri0qMAgoeUnmGxbrHhBXg/
         y013OeeIsikJKEnCBUaTol2akpqG6VT4TKT8pt2RVSAmDpwUcPLTAAAPOMJTVX/R50rn
         oBfdTl0L0/VqFDbJSGDOMqv9pbZtbd2Deaq2tEIp+eHjf2NTjj848lULcKQ+Oj/qwW0e
         jJyKjOEBzw/r2hiAEgRAd/kMkAs2mejueDNKsyhG74oHfGvCWdUJwvgGpJEz00+UzSQl
         WXKEOmEPrMGKvfBUbLCz8+b/bAeaK9KpvI31CFOURQ5INSYgI3V+GJpgQjAucuPg/WIg
         Zc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772308386; x=1772913186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYJtdbq92lJwxAY8zEz41rbLPgrr8AqLw2l7+cG/47A=;
        b=PaYhjnSUbx8Q3Zk3c0FU2WMQ9F2n/+EbmRII2eKCjUPIP3miyLrV+n+l1UcOHpG+4t
         ddPY9J17TKoaWOD5gTTTQDv8q8zlD2gMKJEkD1dYLqWosZ/YYZdugJg73CWsrB1GI9hH
         /p+gWE/nPWxa1Vs1GE/sQm5Iaq55wRc87+FbWg/Xycjxnqj0/HVISIzM1sDV+SnJwmHX
         vP5qR+9G53xsQSrCZoZa16DGDI5hhh4osCgBDmi94U8Ankdu1AB93YgNiUfTg5s1gcUA
         9o3EXa73cnfYIl+r8zNKtO+fRjF6Q6Zt0nEykKZ/MDl+AWoLvtqeurmS2W0ShfKh6GTu
         Ef9w==
X-Gm-Message-State: AOJu0YxAsKS5KduqKh6xGSBtpSPQMYGmkq97SAtDwES+Bqnuvxw33cBv
	U9o6idYfh5mICMH8K08NqooaKxcqAn8GxKcmv2w1r8MVMa3l2MRTedyd
X-Gm-Gg: ATEYQzwmqWMMIDwMFjDNwKK28r3LhPwLdUrpr4PH7E5aSoQMMUZYOzz3TapkLzZflVy
	4AVRIkgcb6yuu/gJKid/N+qTmplNyMB08vKagTDqDGHoTl+dBZmYq/+GCkdcVJlXEqsAYZbP3gS
	RIRfXcVJIlnxbVlXpATj14ROkB87q8gCbekDLtG2Fcrtt4dbGu7mkLEj24yFWGQP2goqhcceE/4
	9K4obpRo+jVElXik3O7q+IWWTIRp2bUlwbASwPvTt2hg8qv2moEhyDP6V+Grd9ITHc6julVOZvm
	y2bghczs2SDhsv3P4IiszqKrKI++AkfHL365sXzja0RE7HH28u6t1x4whhXau3Rrp92cIUmFxGB
	463hTCr+Szli1gJkySCuvlZU3+SEbOuoXizqWwayrGbkmK1ZlHqMmxjdNSllRgmOT96FZ6l+Zxu
	vrD3OwYGCiUmo0p2NmLFHilJFsowUCZ98Lqa0aLNW6lwFINSO3/KPLS5CcHz4iTkKAAIAALhoJT
	A6GNwpgHG5JGHM=
X-Received: by 2002:ad4:5bc5:0:b0:894:6eea:709c with SMTP id 6a1803df08f44-899d1e030f3mr105018336d6.8.1772308385879;
        Sat, 28 Feb 2026 11:53:05 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716ccf5sm87224906d6.17.2026.02.28.11.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:53:05 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 4/4] arm64: lib: fix space before tab in delay.c
Date: Sat, 28 Feb 2026 19:53:04 +0000
Message-ID: <20260228195304.2468340-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_115308_159235_FC51AB05 
X-CRM114-Status: GOOD (  11.15  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a..35e0ddd193b2 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -52,7 +52,7 @@ void __delay(unsigned long cycles)
 		wfit(end);
 		while ((__delay_cycles() - start) < cycles)
 			wfet(end);
-	} else 	if (arch_timer_evtstrm_available()) {
+	} else if (arch_timer_evtstrm_available()) {
 		const cycles_t timer_evt_period =
 			USECS_TO_CYCLES(ARCH_TIMER_EVT_STREAM_PERIOD_US);
 
-- 
2.43.0


