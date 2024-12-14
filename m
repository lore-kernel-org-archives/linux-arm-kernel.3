Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC14E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 00:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3K5RBtg+xGFXHj6YDf/Bcn02yaBD+GLsVm3JTeRYXpg=; b=s3t+h43ADOCmO2as1RwQ55K8H/
	3Wp/U0mo7Z64jz4EithESuQSiU65eUSSI+E4SUrYx5AA4cMrdF5K1NYVx9owpF1uufvJozzeRZM+K
	QYiYvljWwANhA50XxlSkqQH8JCEhNQe0A7XjykKniiyN70iv9dlpBKJUtdlylhth10UZAD8cNeuhn
	8QONmjq4XUtFmzIXgPZLdHqWmYmRD6pi4uT0fH/ddf3htzDSkH/uvQYfKnqwZj8vIoZSxI0VRgonF
	dFF8ZfSbShGRmfzuH1NIKzeYde4VU+DezJRWT5eqSG2sSBBTEf54A9NeifQUM8bIasuntxcy8OYrl
	HFGk92Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGQB-00000005Qxs-2kUV;
	Sat, 14 Dec 2024 00:54:15 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGP5-00000005QlO-3cY7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 00:53:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so1528515a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 16:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137586; x=1734742386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3K5RBtg+xGFXHj6YDf/Bcn02yaBD+GLsVm3JTeRYXpg=;
        b=CtGIaHOo7Mqi1qhDEKtdULJdynGjalQZ6171QmoNupAob6z8YEzgMl47HB5gRIHitc
         9Z6YdKUneyLntjJov+j1RBuFrlix3urU0SGb62zEmoeMvFBBPCsh0k1jecWL1ZsEpY2d
         dRQQ5APDmsVnoZKlKLZK3lHUz/AgYJzTZB7iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137586; x=1734742386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3K5RBtg+xGFXHj6YDf/Bcn02yaBD+GLsVm3JTeRYXpg=;
        b=GMTyP1d8isWkR90/4RTAkICQSXanN3bdpEqgSwn034JyATx3RuhmPSMHOOopbGQBNe
         KwCw2Oktfdvg12jv9wJZrbH+g+sNGpBS/eZUa54XaiOvOtLyub7Gdeor+kHgRfqjU+R0
         BuvBDzJjFU3WMvbSGTK1KszbGKgsghZ99M/omNwVkJys+OhAN0oybC8F5FgsbuMMY1M4
         WypQ4psPeGE32Q4YmrlQ67P/mOeMJ5/0V3FGPDPWgSlOhHBlLY0xJbN27ZFHhyD/zA9+
         AWOBBSErYjMH+Mf/JYwWGz8zH/tY9yz9OHDBhLZ9bh1Otnt8WyPFsh1se7GoCuoww3Fk
         TXOA==
X-Forwarded-Encrypted: i=1; AJvYcCWlI/Xxyo4tKvYm+cpeKlMdy05H5MyJR0/nO5bizKETLeUoeMcYNVavqljAbLaGv6lsB/cIlirvobNV6bJ3SyNn@lists.infradead.org
X-Gm-Message-State: AOJu0YxIOMNsImwuYXxw/j7vcYphY+5b/jJFeHdTzj5pZET1XOJJBmz4
	UmE4UTPFgfeyya5Xa19rmX4Qd9X+fAqgiBHkQWx9ESkxKtXk/qP15MDxLX2XF1ma03VCCidBFST
	LgGb3
X-Gm-Gg: ASbGncuR5yqOeq+q7mg2NXJ3DeDG+4TjDTSsC343p+sMrlwZwgmHG4FVkaHTvLTFQHK
	hgmxsEwiHt40UWywagK6POXNazyFM+9LzAWQeY5p2JyJC8H/zjKwEtOirK+0/q8SHniE+q2tixE
	g0nl2EUv0Kr83blGqWJOFI47eYPytTQ+1ww1CXjlnbunsyEKNOiflYcjUS6Z6gPo5QinH/YReQB
	h8H1lP1rv1S03jRfqSjXTzMxym8jgrg6KncPXOKA3TTQyPrd374gvukTGckGBu7obUCm/MrnqZt
X-Google-Smtp-Source: AGHT+IE2YrqkKpATv2ql0bO6AIUnbqRYssgrXj6tpnlBoXs+JhE+ngG5QFI1yRxn2LJsxV5LcLo/Nw==
X-Received: by 2002:a17:90b:4c0e:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2f28fd66bbdmr7577820a91.16.1734137586549;
        Fri, 13 Dec 2024 16:53:06 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:06 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Fri, 13 Dec 2024 16:52:01 -0800
Message-ID: <20241214005248.198803-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_165307_899372_65A1F2F5 
X-CRM114-Status: GOOD (  19.11  )
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

I've tried to do the right thing for ARM Cores and for Qualcomm
cores. I _think_ most of this likely to be right except that I don't
have a lot of confidence in the "k" value for the Kryo 4XX cores.

This patch series is _expected_ to cause some WARN splats for other
ARM CPU variants. Sorry, but there's no way to make this "default
assume affected" but not cause problems for ARM CPU variants that
weren't previously listed. I hope the WARNing here is better than just
slowing your cores down pointlessly or assuming the incorrect
mitigation. If your core is mitigated by "loop" hopefully it's easy to
just add your core to the list. If your core it mitigated by
"firmware" you can add your core to the list and get rid of the WARN
splat and you'll be left with the kernel reporting you as vulnerable
until you can get a FW update out.

In case it's not obvious, v2 of this patch series is pretty different
than v1 because it flips the logic on its head. Some of the patches
carried over, though.

As a last caveat, I'll note that I am certainly no expert on
Spectre. Mostly I ended up here running `lscpu` on a device and
noticing that it thought that it wasn't affected by Spectre v2 when I
thought it was.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/

[1] https://lore.kernel.org/r/20241211213410.GB17486@willie-the-truck

Changes in v2:
- arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
- arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre safe list
- Slight change to wording and notes of KRYO_4XX_GOLD patch
- Rebased / reworded QCOM_KRYO_2XX_GOLD patch
- Rebased / reworded QCOM_KRYO_3XX_GOLD patch

Douglas Anderson (6):
  arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
    BHB
  arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre safe list
  arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Add QCOM_KRYO_2XX_GOLD to the
    spectre_bhb_firmware_mitigated_list
  arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
  arm64: errata: Add QCOM_KRYO_3XX_GOLD to the
    spectre_bhb_firmware_mitigated_list

 arch/arm64/include/asm/cputype.h |  2 ++
 arch/arm64/kernel/proton-pack.c  | 52 +++++++++++++++++++++++++++-----
 2 files changed, 46 insertions(+), 8 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


