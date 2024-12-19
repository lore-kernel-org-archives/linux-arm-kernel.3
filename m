Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9CBE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5v7hfAH4N73EaPycyY4X+uvT6DTJlai0fstZvBNoD8=; b=huh5vJjMpj9ZaCVwj1Xh2ZbiWd
	JHmlKWS1/fpftT2vNQzKzrWlzb/pM43VoKOlKBYmCffjfrUPCzMcmjVDAhtIVeA75k/Sw/yyf82TL
	I272ujklDYiwgkCGWh449m/S51T2SeaLtRX3FWmYHjmJMBbMas+pedRCRK6Voqo0LSCYRKBpEHriR
	NmqyxGPo9lB/1zJUfp4zj3uQGI/2SmQJrxsmNkum8v6p9X65n+otjukKx+3/1lHS16lrFg8hwJcMj
	sP5Oa9ChCSk79n4dE5RvdmOtArf2yWmN3YVMM4Jz19K6jS0+T6lgdFIRdsULH8DltV5TeQf1ut6Vb
	ALukxQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tONZS-000000035Zy-2u2m;
	Thu, 19 Dec 2024 20:56:34 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONXi-000000035HP-1qyx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:54:47 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so881246a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734641685; x=1735246485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5v7hfAH4N73EaPycyY4X+uvT6DTJlai0fstZvBNoD8=;
        b=PapanFGM2bhLux1HDbNbUTHwYXUq9QiThSVzkbi+4KaP4YEGmRNcmN9LfBtg1bVEJF
         p/Y0OJR281sk1Sum6JUNPPDHqnQbChV+1Y6/ONHoiS9toHBhWMxLvz1nelHDmVp9bZ7q
         mv6fJDiOF8BsHB6GHbK9UEDGNvvMHPUUBDxIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641685; x=1735246485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5v7hfAH4N73EaPycyY4X+uvT6DTJlai0fstZvBNoD8=;
        b=O5gGyHdMCiWjOu5yY2Zzp44eJxDVLfABGbXAh1HwzZYvZJ5UYo77Yerf8A4UZtkKsa
         L5eK25NgCz4dWylRaPw7wHS2Kaj3MKg9s1++o8Ek/pi4g6NPE8E9TwGb1FnLDXzIb6BZ
         sHVgxk2VFmMBtdt78G0vwkBnq0uqZtEz1Zztva4KzjMi8SedD0bws3B+Oy/KYkwxUaVC
         xbQfLp7BVjsYouR5Vbm8In7wpEaC6B/CYkwHbXucyVGGG22s4SJT08Zvra4dvQUmvhds
         xauwJnsTG5pYDPj1jgUiQqtR4xnej18kmlLpoMzjxxxbVmVVO6ptfGfGJVOa8N0c5pEC
         D7GA==
X-Forwarded-Encrypted: i=1; AJvYcCVX9TVBgVOWSSi1D31uXj0GsSezE79Y+ZzWCfz3TN7IYYEbOmNqneIr0syOfA4dPsfuHzXOmcnNN8W2eNc8s4sO@lists.infradead.org
X-Gm-Message-State: AOJu0YzvVPWeweNE5ZVHNMIwi13c+y63Fv6I8zsIbORDTKigstBMUAr+
	z6QcqVZg28z058AzknuTH/q+K++FHQ+qoUhQtQoekqz4lLvJIVoDFJhuwXqRbA==
X-Gm-Gg: ASbGncve1xoxUZfapQiEtpr3wDZESwaxsnvMbj294XnDzvQygSU9/bNecMGva6j6TMf
	moNxA4zrVF3TUJkNwL0h/ImuxKQgc9B6rAn+bNhtinaHJWNEI2DXuPilxHKyNSO5ECkfgCWmxkq
	SRzShshrYIJWecW/0kRviesyxzI+XVPU1cN1YYVSx/nubPxQDLmttJXy1FGM5TQ5UESWmA8VRbu
	sEqNFiF+z01NteW0BTRFV50rVB26LJDBBndK5SvNc0Y6ityzzwuGzD0NaWgZeZQ6zdBNzx5Eu+P
X-Google-Smtp-Source: AGHT+IHWXfuT+FExiN0Vomei1Ie+ypbmcTCfllGKeexLjwl+IkwfMzKXfy9eURCKtst9HmrQ6/5D5g==
X-Received: by 2002:a17:90b:51cb:b0:2ee:b83f:f876 with SMTP id 98e67ed59e1d1-2f452ec6d8bmr512995a91.23.1734641684949;
        Thu, 19 Dec 2024 12:54:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4126905a91.27.2024.12.19.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:54:44 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Thu, 19 Dec 2024 12:53:20 -0800
Message-ID: <20241219205426.2275508-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_125446_507571_4083B014 
X-CRM114-Status: GOOD (  15.17  )
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

As a last caveat, I'll note that I am certainly no expert on
Spectre. Mostly I ended up here running `lscpu` on a device and
noticing that it thought that it wasn't affected by Spectre v2 when I
thought it was.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org

[1] https://lore.kernel.org/r/20241211213410.GB17486@willie-the-truck

Changes in v3:
- Don't guess the mitigation; just report unknown cores as vulnerable.
- Restructure the code since is_spectre_bhb_affected() defaults to true
- arm64: cputype: Add MIDR_CORTEX_A76AE
- arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists

Changes in v2:
- arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB

Douglas Anderson (3):
  arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
    BHB
  arm64: cputype: Add MIDR_CORTEX_A76AE
  arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected()
    lists

 arch/arm64/include/asm/cputype.h |   2 +
 arch/arm64/include/asm/spectre.h |   1 -
 arch/arm64/kernel/proton-pack.c  | 157 ++++++++++++++++++-------------
 3 files changed, 92 insertions(+), 68 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


