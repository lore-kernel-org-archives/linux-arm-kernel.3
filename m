Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38411CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 05:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b3CpnFZIswTmx46IHEllxJUjuRhHOeSrWCQMJvRMBV0=; b=jkGl4cJ7XRUG+T1sSPbLIh1YX2
	1CPNEUs7fLbgH6USrtnyDuFjH//ZIwkaExInUiJnMv69YYw1d68+QFTrawxneZ2ZEmYrDgFafKz0L
	jgfM06dE4xJu/IB32u4X8J7wwnZuiKInoUoWlmvt6FXPn7o3lvo47QkOFqikueJQi8VoKKivRlIdM
	6pSGB2TwU2bcB5DGseQZhCh39ffF0IivGsOHhJwGrTB7r8Z4Y1lmaQsOXR/VEPoAe/vwvSjvoNvsO
	XkFn2c3q6VdYV8J3q2qsLDq/ckuwmm5+1ZDLknkfV/gxFVgvowLfdoIrxH3x1waAHjSyHz2w1T5dn
	K4+eytvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKrYI-0000000FRqM-16EM;
	Mon, 17 Nov 2025 05:13:22 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKrYF-0000000FRpb-3alZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 05:13:21 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-882390f7952so41429806d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 21:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356398; x=1763961198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3CpnFZIswTmx46IHEllxJUjuRhHOeSrWCQMJvRMBV0=;
        b=Zevyutaz9i5PUAul+IVKUDwcjpJoKpvptM5gEtvzYom7GENbxgC03hX2TcwP2uqQWE
         7D8RWiCL/qrT2xyiNLBTYf7NPaThFHUuJ8Ike4riDMBFX/RN8lLNDGxoqtAEVqFq6wHc
         J3KfgpqOwQgbfwF/HL8c1Kxmi8uKLqh/gB+b0fgfPtxk5K34l89ERYVAxWv0ELIsDF4C
         AcucuAVl37ttWhWUQYi9yiVszL49dlAJ+sJdX5L/HtT+v+aR9IN+veHF+oCUKWZwQmQA
         GlNjKgCM4LcXef174RHMfTaSWN3QWiu8PVlOcnrPw/WgnjLg11BvlLhiuh5cvjWjLMEO
         UyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356398; x=1763961198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3CpnFZIswTmx46IHEllxJUjuRhHOeSrWCQMJvRMBV0=;
        b=ah+JYaJCCUtXiXwecliSWylhcsPnOByuRQenRgTEJlK0wA7M+rg9Ik4X8iZ6g1PnpR
         IBiZ2dQvZ/Fxrw7Q2y3rZdXpHMikJ6ZuuIY48+15+6HRl76nrIfa6bOFahJC/4EyhoUf
         bthhk+pB57cCaMkQccMfGuhfsnBWuYFRR+xrFml2nsL0m/05kVCP1J8FYTy8av8K4wxi
         884rn9tF+BqLhsI3NVDvB3S8Xop4PeZSrpZItBbdhac2MjYQJv0YuLFuYeQWLOxBuprg
         evKAV4apX3EwvijtD7pMUvcRyPHZVJbDmIbtskuyWInB1quaf30TeCui5uWHlod1g5rp
         3a6Q==
X-Gm-Message-State: AOJu0YwSD98v6oGxZybdlzsfiluVfhrF/ZTSPivkeF8hY2+nb2fg2py/
	NyKr0L2dRs81AtDQyYjwFCrW5vR2S6UnhAwK9zwad+NQ0/wFquqvK8Izb3DRp6BJ9MSEjfLI9GO
	Zg18O
X-Gm-Gg: ASbGnctQbZd/Q0czU3b4KKxOMgC35afwecfZ4LMY1U0e5WYzTOcSbx/dcQhUMPJR33S
	KAC1EhtqQcwuJOfG0Ma4yPnOtB/bMiFudCHh2WG6noETYLps4twXlVn4J9STUTSSE4J7cDJAf69
	IrDqzlwnzUo/jWkf0At5/4f+csPAgrar0y+boE1NSZph/xSSKm/i1rY6b4jbVGcOFtkSEXRJSva
	C7ZfHXZAPAiVUghjrEG3S1cISSk1dtuex7gOeepgb28keKPgy2meOPN5yhU1nuW9lUs8jg2ZgaF
	sc6ZW0bPdekZXCNKC439DClRG7dFzzRR2wyMsOdMQIRNfrPmiPLQDE+DUPzVxsqM6yDNYJzkrM2
	7YC7hp2zUF8MMfZjQ8qX04vY7pffEjiRKG/0pcNOxPdcXwrr1qlbdQgD05k/2Or3XNZlKe58hHW
	63a+HPVDhpPRyCxHcfV4vfuAu8bE8MBhN3XanXXe0Kg+RamADqzVCBC44=
X-Google-Smtp-Source: AGHT+IGq2WsQPMb7qfx0gg4MyuBaUYc+lTNUBWA/UGwm1nH3B6U4nLl/ZoJrKWqXpLED6Wq+WzFUpQ==
X-Received: by 2002:ad4:5ccd:0:b0:882:63cf:3987 with SMTP id 6a1803df08f44-8829270f3c7mr158140416d6.51.1763356397631;
        Sun, 16 Nov 2025 21:13:17 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652c882sm87366046d6.32.2025.11.16.21.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:13:17 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	shechenglong <shechenglong@xfusion.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY
Date: Mon, 17 Nov 2025 00:12:08 -0500
Message-ID: <20251117051211.16108-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_211319_986032_09F872C0 
X-CRM114-Status: GOOD (  11.52  )
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

The "drop print" commit removed the whole branch and not just the print.
For some ARM64 cpus, this leads to hard lockup when
CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY is not enabled.

Fixes: 62e72463ca71 ("arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY")
---
 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index c7d70d04c164c..80a580e019c50 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -1032,6 +1032,8 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 
 	if (arm64_get_spectre_v2_state() == SPECTRE_VULNERABLE) {
 		/* No point mitigating Spectre-BHB alone. */
+	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
+		/* Do nothing */
 	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_HW, &system_bhb_mitigations);
-- 
2.51.0


