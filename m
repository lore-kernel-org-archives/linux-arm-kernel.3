Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB966E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/sSS+VDQ56vpYCpkE7vAlH0OJ/9adGK5Yjw02tWP75g=; b=mHtH2F7BAJ1zBknkOcMpJCH92e
	IrkzWkOWOSbyKLtfQv2895mAZU9GVmRx50ZRtx8HJAnbk6KG6lSrisyTnz/soTtmjF9o7DyyVpDLH
	bVEqKMuSYatL9e9FVllhL1hbSOWtKRt+wGmvyeXKAP9hFPW/AHBIr6266BAvEbleVHltbyfLjn7ya
	VGmvgWd0N9nG6aiOxiGiuLCVCUr6Naess/q8diaf771CSR+tmjhSLUdTGd7in5CXnAWTf9oPqbqza
	M2iEVYxyfDA8+OrXCU94Myq0ucvzDYEpZ1twyvpVSpv3ihRHQV35v47Lc8gsEw5gyhbWeySXrGi4e
	EMZzqAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tONpH-000000037bM-1Ley;
	Thu, 19 Dec 2024 21:12:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tONo7-000000037LW-3CDi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 21:11:45 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so1076124a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 13:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734642702; x=1735247502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/sSS+VDQ56vpYCpkE7vAlH0OJ/9adGK5Yjw02tWP75g=;
        b=BbWlmaMZjf7FQUFMEogWinV8OoECRG7em1SIkaDiAO4DTY7fz18VWwBTPeKY+2XUKK
         v1tYBhnrny9g6V0OUD77R1nvP+pIfKkWuqVAPQCUBS5ybGz6XYb6WuCwF7iMzovmu6MF
         8nRuJGyBVcszyJmOd1mNmXMLJ9iglUcadNwbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642702; x=1735247502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sSS+VDQ56vpYCpkE7vAlH0OJ/9adGK5Yjw02tWP75g=;
        b=bdMLMELyT6OKWrS3garhkxblPaHDm0PJ6i8QjQ6GFpxN9bzEXEYR1gbnUa/hRJApev
         wDZIN463PaLFOpw4sSba5zoYNs5rPvFyAdXoZWmslMbhoJoeKkunoLAalplqTDMzh3WH
         J/bl+elVwbDdVTlgg3gb/+7FR2NNq6HwWlbNW36hBYVB2LxoxiiikqhpjoBOVGIZKNA7
         djzJIbQNLYYZiWHKRKMBzbZLeRpHZkOr6axm2TUtuFmKzcHJRrKpjuNiplP2W8HLCP2p
         2jCtTLsI+1GT1lyZ81udt7ju3/2h6fQkC6PwWxYpos6PHXeV8flmbXUuZ8RvnARMF0nc
         e4IA==
X-Forwarded-Encrypted: i=1; AJvYcCXk7AOUifh83k1y6FKv4+5VFau7ZsE4lmVEIe4KxZNmGSTJzdgHzU7SpFmzHkTFGZQ5Dm8gwYxKdShczt0H3xvD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd2EqjuZBobHz0RJPlo87dKIJhA8MeyobLZ72lZ0EKHFpTpVPB
	Kyoa3Om7e9qzTUto88aCSBr7En620kt9FgoL5dgkk7d69a+uRoFnvhvTfuZKWA==
X-Gm-Gg: ASbGncvA9LGhjilm6vJKayjfkthM8dfZjqJcl6+9t7A7l64X//h8vgJitOJBEjabolW
	YX/AAJFBOIujrYX6V6ax5ZTJd+QSsUJCR5k9XGh7w5xGZPqQxE7Jj04Pl35Cm2kzHRJEtXJxGL2
	f23bkYwh+VpfA1p6hjachdRQ7oXCR+2murxitQJv17wIiZMwqGlWAV3smZayz8WjaznJ/gemX5e
	ChfRQbK1gywC4sgCbAN4yKGET9IrKA7EmDtHiqxl1uSyD22aNOLtY7zA8nuVtNkq9PLQF9hmoaU
X-Google-Smtp-Source: AGHT+IGkhzCQPV8lorDMXfmjA7b3/juLtvk/PIrlhRwbN39eCpa4HiixAvg8reFLAOw8QF/aoxeEow==
X-Received: by 2002:a17:90b:2cc7:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2f452debcdamr740134a91.5.1734642702669;
        Thu, 19 Dec 2024 13:11:42 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm1880887a91.13.2024.12.19.13.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:11:41 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: cputype: Add info about some Qualcomm Kryo cores
Date: Thu, 19 Dec 2024 13:11:08 -0800
Message-ID: <20241219211131.2389091-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_131143_821131_EDD4589D 
X-CRM114-Status: GOOD (  10.09  )
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


This series breaks off of my series that reworked Spectre BHB
mitigations. Originally I needed Qualcomm Kryo IDs because I was
adding "guesses" about their Spectre BHB mitigations. Now that the
Spectre BHB series no longer has guesses I don't need them there, but
these two patches still seem worth it to land on their own.

I've still called this series "v3" because the first patch was part of
the v1 and v2 of the previous series.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org

Changes in v3:
- arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores

Douglas Anderson (2):
  arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
  arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores

 arch/arm64/include/asm/cputype.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.47.1.613.gc27f4b7a9f-goog


