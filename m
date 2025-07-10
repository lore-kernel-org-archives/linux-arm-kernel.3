Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6C4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=; b=NS5tSkZHXSq0vrNHBm876AI80d
	rGAf7B2F9SvwH7is28dHrhliLZgayyjbgVDcLRtF9pT2QMIlt2TRmyE/JZO5lRgL2Wtemg+mFoJbO
	LNXilXprhyvA16gOQYcv5PEO1JCL50ws+FO/it3J/5Q0ypWP279gmiICLm21Aid+sELmxHTbP9NCp
	2w7cx/oeKb+I3Sr5Lk+UA8PD4/05N4Fvb0FuUT5dNBThPeuvY7pH/pg+8A/Tm2Ur4ZxSDOFp38K9v
	ZAIIiySeCX8Ex7kkthUMrKBX9v9yqXxpXvtTdfpLTYPS5OOUPNsY/MUCA2/V1REG2tuWgUPBruaIW
	1mXCRZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvWG-0000000CeA5-1ucJ;
	Thu, 10 Jul 2025 17:57:16 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtXl-0000000CJCK-2JAI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:50:42 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2352400344aso11080935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162641; x=1752767441; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=;
        b=IS3DcuepxlkNZeCMgvu3AWtlJwrMoZc2MrKPC0t58hMMdT9zob9tUyxcrYGkOUG3Xn
         8ZnX67lVi7mu5zz4Q4ckVuRhOTlH/Zg8ih4zDShee3a/VpS+3/o1jv+vn0YQ/F1awlzd
         3LT7nDDjxyMf1p4dXPjZyKbukj7qxEiCUz1aCnlfPqKsNM6+nMv0ykhVrd+MVviSXqCB
         GGuO2kvvNNhVYEE4p8VIizir2wo9kHLyfKjfW1aVaurW2KQZRoBA3NIn4R6TgPVN7e/B
         OrLY4v3yIsVRotBsDWxXvdcQaQ88Oxwf+mmkdVrm0z+RNFjiEQN5GSoCPBUltfysNbIN
         lpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162641; x=1752767441;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYCsUZOP5qNPTOsZnio5Vd12LO4J07mmm0n3y5FcLYM=;
        b=Z98+hhrVdPcHFJAORb4q6chQSqgTGaJoscXly/XdgeBIYo4vY7ApG1e7RDorJsOZe7
         xc/roLAt+CS/VCRTJqzkEVxJlaRWE4zWkhTr9ZvsJTfFvEpnX9k1FW5ZDSpuZWFJ5ejg
         4J7VszPHlbfQfdBu4beNDIZzVRNfgVCgEKMXOlgSiDPtYJXbBp1oEFxG1+fPiWG7mn7Y
         pWITvJbSwHGYPpdLxnFXPeTbsJM7SI5EBr50OUAFAXFzO6z5QqJUQE5p1UKqXaO9rXJs
         J7k9I/SABL2i0gs5tSrtJWhi5HlhkL3+Y9beKyqnA/JWyPCcBvqE2DXABK6ThFCAVLTg
         v2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVGTPAf31tjS1JNz57liIScia0+73StIDHP5anQHU3k7WVpVX+7c7Sqjsam6wr2L9vJK4GmZvGkOGPvq9iyL3UC@lists.infradead.org
X-Gm-Message-State: AOJu0YxQKyGyDVW66qKQr3TWdjGUSvZILzU+fyTq0SZrFNyfcLQaJ9sC
	SdW3Yv9Z/mKUYz6OGKvIm+tHt03ZpZ7Ee2R9C566YFqCfiPvKe0m4zXGuZCkeHVO4l0=
X-Gm-Gg: ASbGnctu/rvQiDTpWxMeVo5YQDT0RxbE1w8zQT+TXBbdn8gmFROr8Z5qGcDFURbNfqJ
	S+STWbrj5CC9IFsOndD+G5lPvw/askL0U+qn8TX52vFngKG6saA6Vw0RmBECAaZGNmfbJZySziv
	7nvacyCCq5L2NJ9pEUnsxio+KxncGnNMeNKWpVVBWCNoiJBCH/4oKQCgRW83YOPGsjFPe6Rz6sn
	CIPUaegDzEemuCHaLfhqVTo8uGNKF2SxtrWrUFUNTbdfkEEmPAOBbkhS/16IwRimA3vgeL402a4
	nFjXOvj8cPV1vuxUl7dnWnD2JyQwgbO5Ub6AyXIfZM/7scEdjyLuUwMq2KuWxWs9o8X1cz8=
X-Google-Smtp-Source: AGHT+IElU/0L8KxnCYNK56yG6cNhASLXsy7y2GFyTBpCgYpyDu8yUDmzKCFyTB8rlNo1biXYsiwnZw==
X-Received: by 2002:a17:902:ea07:b0:234:a66d:ccf5 with SMTP id d9443c01a7336-23ddb31593emr119964355ad.49.1752162640915;
        Thu, 10 Jul 2025 08:50:40 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4284898sm24954395ad.24.2025.07.10.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:50:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: OMAP updates for v6.17
Date: Thu, 10 Jul 2025 08:50:40 -0700
Message-ID: <7h34b4xcxb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085041_585785_64D04094 
X-CRM114-Status: UNSURE (   8.04  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.17/soc-signed

for you to fetch changes up to 0711a8dcea2a928a54bfb40b064d6cab4b327edb:

  bus: del unnecessary init var (2025-07-07 14:17:51 -0700)

----------------------------------------------------------------
soc: OMAP updates for v6.17

----------------------------------------------------------------
Kory Maincent (2):
      arm: omap2plus_defconfig: Enable TPS65219 regulator
      arm: multi_v7_defconfig: Enable TPS65219 regulator

Li Jun (1):
      bus: del unnecessary init var

 arch/arm/configs/multi_v7_defconfig  | 3 +++
 arch/arm/configs/omap2plus_defconfig | 3 +++
 drivers/bus/ti-sysc.c                | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)


