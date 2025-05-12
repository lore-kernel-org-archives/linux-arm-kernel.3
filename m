Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B78EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6O0jvL9bp0RhLH3gFStx+IoQOSIzReGN6we6Sj8t7oo=; b=s+WgjQ9qPCblmFKtS4thPmJtPb
	WpB3nh6jbOrziIaPJNEmksqGIR2hwq9ldv/fBvgJjuNpbSv7y6u/QdjJkoPUJBgTmZnQFz0IV8e6E
	r20QaJcDcvlzRzUZWBfc4tU2alY9lPXtrI2Iv6kheGYSorUtINNPV2OMUvuxFeQT3MLRG4P/t/tfr
	XqhScIDYbo2wR207hK7MmE4Fcw55V+onfzONuln1VTUcy7FAA+wIHfp5IAEe1SRMA9ab87qwoDizc
	II0t7hpz5saZxYdhkfhfdVwX2YQ9Si+/u6OjHzGguoBGWIBp5bJRLzzrpoORr+TjCEcrwe8fH0e6Y
	1r9mfM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETwN-00000009goS-0dlL;
	Mon, 12 May 2025 14:15:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETEX-00000009Yqn-20dd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:30:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so46658055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1747056613; x=1747661413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0jvL9bp0RhLH3gFStx+IoQOSIzReGN6we6Sj8t7oo=;
        b=E4FkGBw2+W6QDTXVoWmgziiZ2qP1zCfPt2d8SAKZYQ+6560jmPculc62EH1l6F8VSm
         NSp/NnB6P96f8SV4CyMm28nuiD3H6+1odVHxCSUZRYNUJLz7IbdC1Ms0CGXMbMzH5+iV
         p9CXs8lCuffYFha42KaKwXqiY80U4T2SDp6DceB//LTy5+UrrToVWfuQTuVgBYlOjkOd
         NOGwPS3u6mKrL18D7mNsYyTD6HyLoQagitVDNzWWzercok30t4a7s2eq364Ffc6CE6BR
         9LwuHzT37GEHT9imsIQ8lw/QIzxwEV5p+IxnDlUy5Zek04I1vGVGWM6LnBBciVTD4V2E
         7Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056613; x=1747661413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O0jvL9bp0RhLH3gFStx+IoQOSIzReGN6we6Sj8t7oo=;
        b=nNE3R3XYL6oeUjjfBsDMJhIB988CLRXJR/SvnyD4xgZzGroFNS1X8HFL7vER2ZXoV1
         wxgL4DKj8ht4fIfrjfSFrYwMH5F+zcGYntgzHYT1NcIhUO6wOkaseKJ8Z29jSQv6eaMh
         68nZbimSGdDlzBDNazxj47xlMUTYxnN2nSE+iqzQ3e5k1UxAeOdoWBCkLHfpjBR6DtAU
         j1urAiW24pvJMocxEs0lU1rZL70f6pXTOzFdqJjVD30Hh8n7Qqxo8GcTS1EzYEYaKEte
         F2hUUKpD/wmTarhzuSZA6Yj6xVfiHiDaRxSj03Zfgid6wRi/YDh4AQd8/92zX9vpFwA5
         imqw==
X-Forwarded-Encrypted: i=1; AJvYcCWnV4iBOo4Or4DLAoVIxzpftpGo7yw+WQCXGVejJQeh/TCrg8Gb6rje3ORaXTg3DPpykyLuW8KN9/QDxV2VHCVZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzARcxTyQKLyb8ENH6HXEx2nswtoN7LLVnUqejaK2f7viDArqbV
	zDlz7hIrCeu/MW4heu41eriJKoYsIqeXdXvNe9mbhZM0fWFtZ0hvzgGHRMir18DGFjZKPqH59YF
	Oxbb5LGlVmcRvNlKqLBdBT1+XlhBSO9Dcf6REbXu1LWJ98VNZWWZ3cccvdAxJYMWEiNc3GcSMax
	TXzQdJKy1tSWY=
X-Gm-Gg: ASbGncsaFBqaB8fSPugcjK4sklYtUXpDiud3xtNsxT0fpFeDEBJPatpsR3zQVZKB4Kw
	IsnmvZ+Nl4gqdtzzQTp4waJjsz1r9KznwgtDph7RDREQ437XVtdByZIt3R/uSpsA5hZHu8PTqKR
	Vwc6jcl8+vZuZiJwiDXp891psrkkXsaIqGcdo+8pEAD4uGqFqV/5tfhE+gIu42aeFeBTgoVVatt
	izA2Pinh6Fx4UZQ7UfbdGPcOhEbxR/IJlzQyMcBl+i8raJlgy25EAprVZ98GkNhqP45UEVylud+
	088NHacD79vZykeHWYtHRFUMsmBsw07Qh41NX8nrGEYaYMMtgP5uUVpi/UI0zJDS1r0H2i8x
X-Google-Smtp-Source: AGHT+IGvjNxhAX66VVq4W0wV6STryscjMOGjWiI63Myou666P8Evc1sc/t303qv3kgeVp110Hjntxg==
X-Received: by 2002:a05:600c:5250:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-442d6d6ad52mr105665795e9.18.1747056612621;
        Mon, 12 May 2025 06:30:12 -0700 (PDT)
Received: from localhost.localdomain ([213.157.19.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ee33bsm125593325e9.20.2025.05.12.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:30:12 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Subject: [PATCH] KVM: arm64: nv: Remove clearing of ICH_LR<n>.EOI if ICH_LR<n>.HW == 1
Date: Mon, 12 May 2025 21:32:23 +0800
Message-ID: <20250512133223.866999-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_063017_808190_E7D6955C 
X-CRM114-Status: UNSURE (   9.94  )
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

In the case of ICH_LR<n>.HW == 1, bit 41 of LR is just a part of pINTID
without EOI meaning, and bit 41 will be zeroed by the subsequent clearing
of ICH_LR_PHYS_ID_MASK anyway.
No functional changes intended.

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index bfa5bde1f106..4f6954c30674 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -240,9 +240,6 @@ static void vgic_v3_create_shadow_lr(struct kvm_vcpu *vcpu,
 			goto next;
 		}
 
-		/* It is illegal to have the EOI bit set with HW */
-		lr &= ~ICH_LR_EOI;
-
 		/* Translate the virtual mapping to the real one */
 		lr &= ~ICH_LR_PHYS_ID_MASK;
 		lr |= FIELD_PREP(ICH_LR_PHYS_ID_MASK, (u64)irq->hwintid);
-- 
2.49.0


