Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C15E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P+ktxhUGYGa3yNjnjHMajfbM7+ExHdrh9QS4E9J5Jm8=; b=NcbVpQnvcAb1FxMGdLhVY/qFyq
	XYZL2wHlW0RO0pseb/Zbx2PmB1Br3Y7m2MkGUZGRRkrStpGEmN73LMQxNss2iq25o/CBjUs9xPjo7
	m/TFwX9cfIhPYyWAl/x5RESUco28n/tT4/7gIbiEQDSvwFUT8tpEMWTy35smkrS5g4VqoSdtkvQVN
	sbSCfI4LqTSH+vlN4TIQPkjgknGS7PqEzjUVY2zbz7f2PaUAoTkO91ejjV3BGHxEtZ3TgFhhDBUW2
	F7PSKvu+iu1tY0FYnuRdUbBDmAMfeXmAl7q7cOnMBqlq5Rm6Nn0V19feyOmdgEzetg7Kc6eZM+E8D
	T3CfySqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFtG-00000006Cgj-3oLO;
	Tue, 07 Jan 2025 20:09:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFs0-00000006CQZ-2W0G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 20:08:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216281bc30fso17489425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 12:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280488; x=1736885288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+ktxhUGYGa3yNjnjHMajfbM7+ExHdrh9QS4E9J5Jm8=;
        b=FEuSEd5qMkodkA4fGjXRQpcYgaqi3RP0uGmSKDOnke+848v/u2hIRebWl8xJC42chN
         y2Um3Eh81znDZynnjJrgCayW6ml71hMc0Y/CvhQIof9kXFq4OfCYsAt6dt1Q2HNqJ3Os
         nhq0kxojhQD5z6tUHdJs6WViRdwYzRejg47+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280488; x=1736885288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+ktxhUGYGa3yNjnjHMajfbM7+ExHdrh9QS4E9J5Jm8=;
        b=jIvOV3In281Vk9PXu93P6B3oAQLypeUiqJlJHUAv0oBk16psLCXWdMfm1uzgKxG25j
         jSHmeJ2MaOFWls4oLXDk/pp37sGxqj4PPFiRn2SjwXBlFYqJSc23m0dhsumhkkySIae3
         Z/9WprzDAc8SXjqeCifxR5W46EWvFSQXLk6mu5cxhEGBPD3SarJ6YTi2ST4NdLqH39e/
         OVuj963aPXE54JbJU+e6cGD6tNFgQC+RE2k445iMJ2LN0h5dw316CW2fadRUYwN1oEPo
         R7P9HWj/GZR/6biYZK+B87jLtJKBDklsvIJVVePckTvk4Le01rbsGWz3wqvt7jCl/oIC
         5lIw==
X-Forwarded-Encrypted: i=1; AJvYcCXl+PCW/8Jw58ikwHfjzd5T0dPBRcjRAEI7eUovJFdYsABCaJZwql8rCOmIMP1J0vbB25EiUzKCsVLXLvWD32XT@lists.infradead.org
X-Gm-Message-State: AOJu0YwymaAixCADZ/u1zWwXZeDVoySqLypYPFl5x+CBDj3XeESk5bbP
	z09fTQwtoWz1dTySJljpK3hwRByC+ALzJ4/SzgpC4QrmzoTqx7zxXIyrY/B2Hw==
X-Gm-Gg: ASbGncuA/y8b7oAbLlOjfC99hupQfmgQTTzn4zBPsoYmOSv7P1IWWKf9zjyoJ8ujqPp
	xeglZVd53sK4SngUzQmBso+7vc5t91DZJTACz7SLknesR3og9ywfo5F6iwdKjLi7hVbENQnGufC
	zJ8NQuI443O8vGLZdICdi/neuRcp7QNz2iuor9deV47hW9eiAMgC90IZ/C7ywqZvDi7oU7nqUk4
	LovwR6pLTgAJjzgauB3xrWLWt2aodR0wOyCenm9pggd5StQwoxXXFB7UtWT8KgHhKJv/qUq9wze
X-Google-Smtp-Source: AGHT+IFVBn3Ij7LbCn0txABKNdFr2EWfmGyAelW8kD1WcnsSLP1ApJp3uRCtKztZB6YW77FsGgN49g==
X-Received: by 2002:a17:902:f685:b0:216:5002:7341 with SMTP id d9443c01a7336-21a83fde2bcmr3869285ad.44.1736280487549;
        Tue, 07 Jan 2025 12:08:07 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:06 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Tue,  7 Jan 2025 12:05:57 -0800
Message-ID: <20250107200715.422172-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_120808_669560_45B6A723 
X-CRM114-Status: GOOD (  17.28  )
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


Recently I realized that a device with some Qualcomm Kryo 4xx cores
reported in `lscpu` that it was _not_ vulnerable to Spectre BHB. This
seemed unlikely to me.

I wrote up a patch series to attempt (with a lot of guesswork) to add
Qualcomm cores to the tables governing how the Spectre BHB mitigation
worked.

In response to that patch, Will suggested that I flip the mitigation
on its head and assume things are vulnerable until we find that
they're not [1]. This patch series _attempts_ to accomplish that.

In case it's not obvious, v2 of this patch series was pretty different
than v1 because it flips the logic on its head. Some of the patches
carried over, though.

v3 is yet more different, avoiding the guesses (and thus dropping
some patches) and also incorporating feedback from Julius in response
to v2.

v4 addresses minor feedback plus re-adds Qualcomm cores since I
managed to find a contact at Qualcomm to provide confirmation.

As a last caveat, I'll note that I am certainly no expert on
Spectre. Mostly I ended up here running `lscpu` on a device and
noticing that it thought that it wasn't affected by Spectre v2 when I
thought it was.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org
v3: https://lore.kernel.org/r/20241219205426.2275508-1-dianders@chromium.org

[1] https://lore.kernel.org/r/20241211213410.GB17486@willie-the-truck

Changes in v4:
- Re-added QCOM_KRYO_4XX_GOLD k24 patch after Qualcomm confirmed.
- Add MIDR_BRAHMA_B53 as safe.
- Get rid of `spectre_bhb_firmware_mitigated_list`.
- Re-added KRYO 2XX/3XX/4XX silver patch after Qualcomm confirmed.

Changes in v3:
- Removed QCOM_KRYO_4XX_GOLD k24 patch.
- Don't guess the mitigation; just report unknown cores as vulnerable.
- Restructure the code since is_spectre_bhb_affected() defaults to true
- Removed KRYO 2XX/3XX/4XX silver patch.
- arm64: cputype: Add MIDR_CORTEX_A76AE
- arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists

Changes in v2:
- Slight change to wording and notes of KRYO_4XX_GOLD patch
- arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
- arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list

Douglas Anderson (5):
  arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
    BHB
  arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe
    list
  arm64: cputype: Add MIDR_CORTEX_A76AE
  arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected()
    lists

 arch/arm64/include/asm/cputype.h |   2 +
 arch/arm64/include/asm/spectre.h |   1 -
 arch/arm64/kernel/proton-pack.c  | 218 +++++++++++++++++--------------
 3 files changed, 120 insertions(+), 101 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


