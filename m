Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9F7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=; b=wqUeYgLHr2fATedVZLzgSQQHhM
	XCvW5FeeyPkf8f5Qw4eSvsTez+pRo0D5f859JnOZzFVdOOM3HABTFSh3CpliNZNpZ/oecaHIDqhuv
	OSxw4iJcJVmhommrGm2QuVjhPRz0xT/w0bCXy6/Tayfow1ih0KuhFLe61ioeAdS4BzAefbPvSF339
	1VGFN6zzoCNFn1pHtAp0eU91sAKAnJtnw+XBou4+FA/AInUtx0DJU+C2ofUrl9f5DDezDBCxgv1Qr
	ZYiABuzpnNvl66VqPoZR3GwcpxrOVJuBVetps/nr/Bjvxw/YDDIJhi1Nt+HjYY2SLJFZbgmBljLA4
	5I0DQkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2ey-00000009Hvi-2Klu;
	Tue, 09 Sep 2025 18:01:40 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2ew-00000009Hua-0rVr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:01:39 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b00f6705945so72894566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757440896; x=1758045696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=;
        b=effXUmLY4J+RmzruyraLzbhN2mBcPLkBQvkW/Y0qb6Uf9BnAHWdlAkbSjYNZpftNg2
         0wweIw34IcbNjqfx/wnsjaMbdY7LQR3hkY/D1cSy6up9UkF5ZafxYbloHaSIYuUXUuaJ
         +Dj9QmrcLTtNXW3i8PkW9mSkoUosnewpmRmUeOqis8mviLqxf6lSC5Du2DE1I8qWhNHO
         WmVypnHnwm45AobLcY+1fSFkUIQrX7ukLt1LpmJdOuMPLbfupdYMlyRXC74O06IcBqJK
         DBrbtpJA9hBxYhrBcGBumUjg3z1en77g91IcliOBALHiKaqhbHwtAJWbaiqRBDvZ6ADZ
         949Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440896; x=1758045696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=;
        b=rKzzt1EQGjLL8UBb6nYY/Gbj3/JILnCxxmCYiPPlSch5AthF074hr/4os1yXxZO5G+
         oA7X3ZTSYDDb0Tz1xchMZPwfPCwgctAnZNEh74G6aVSob4HhIYIv/EHsWzpP6WAIWb7W
         SRsmTd4DtBSvSLqwYD+Mqjf4EP+w+WPeIfz6ccTmhRDHWEBruAKE9efYbP+vPcYsxPMY
         uf4zPJNoNTJx4ZwlIYSPp1z81Tc8EXh0aGSwJ9jgpPB2gyx8W6Ah5A7YCAc66bnz65d1
         EC37dRpsxSIN7ECXg87LOP02IMyh2OT6XTk8lfPJBDOskBVOvnhM3eHdWHBfWYHuKVAJ
         be5g==
X-Forwarded-Encrypted: i=1; AJvYcCUErULFnYHElNdOR0yzUw307VCi/51ErAdwlCKtd+Z54dCv2qilWNjrAtJVey8/j27usPeL75oeC+yPR2VPRrRr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3jwRLyg0/9nTT9at5TM6igkexu35uYiLTvMKQxRULC2PG0eod
	Sps8vRmaUq/uGvE0va6mB22Qq8uKez7Q9VcTjqy4nKlib9wc9giezGg76FrTbxi1xGQ=
X-Gm-Gg: ASbGnctF5EHYFGEjIWVD+4du/VG/J83uTTAmstHC0thkNqDXPnA2MmMQ9Vvy1gFZRC1
	3OEBVHel6GcZ1rvey9+j81BddupsmkfpnHMYTEH2CeCYZI/E0YKRwYuKYfbg1THng2edumhc5Sy
	2my/FjhHU582pvbgrszbGx8quKMECY821qA+EjB6hIcJtQk7ZkJCE9uLHTS+XXnFzpBO+y2MRq9
	MaE5JiweGg31g92t436jDCZ4PVItTY+21qRxAw3Odap+oLugSsUziKGUM72RDBJsQnYvuUVIWvj
	yDDhsdabesjhGOmN8Tpi3MfbKFR9EW+/oonUldG9/5tyc+aXv1Iw9kXqzPKnKBgnV3vZmjAZ33D
	7f4GNRBmTHnruZwGEf9zc9ZZBKqjK+8qaKMqGJlxT52bStIR2EK090yk=
X-Google-Smtp-Source: AGHT+IEiH+nmvrwhayI3HbM5/x4e5TkLk/RKC28fCLjYZn/wZHTfmtWJ39TPSN3Baj56Zpj1yrngbg==
X-Received: by 2002:a17:906:6a18:b0:b04:57e7:b1c4 with SMTP id a640c23a62f3a-b04b1007b33mr621356666b.0.1757440896219;
        Tue, 09 Sep 2025 11:01:36 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e899sm26294666b.64.2025.09.09.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:01:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm/arm64: defconfig for v6.18
Date: Tue,  9 Sep 2025 20:01:26 +0200
Message-ID: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=z7stafhZYkYX4fyP6Uo0x11l37pExFzKqc00XYTP1Tk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowGt3dWN1F2E/oAo07Sev7IogTOAGCAVnRfrAE
 tAIRR/xEx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBrdwAKCRDBN2bmhouD
 16K3D/wM2NurN0pcMDt1sn4GtZ+UY0RjSV1g6m5jXzx7W9wpkCf6AgOqOkCgrlial1N3Cg6nyut
 n0f93rWXhYCkJEdySaS6Fb/Kd19ssb/EyJa8UwpNCtvOYhq9OcXpuHrKV/FA9RqOY8gKnCpl7iS
 CHrUCwBEWsM7HDURd305LXyUvW4D0NqopERgqnFT99F45YzfjZgc5cAJ3Ikt5hsjTgCm7NwKKvd
 +AkY0qUV91zPPtxF4HQ+vriYWjIFcj9sktWO8ADOVdUo2lamNS8l5sle/mV1Q/dsctKBwlbgjW+
 l+KOKgj8ad0+UeSY3meSiKUE5PQSsjqKwySarxXvq+cIpeO5VeWNqf3d4zuBG+mj+U5NymVc8GE
 U70TByD1BklEtmLmlS/zgr7kB7YhJtl2voV2h4cIetMcfa3MjtRODCU9O4CBD7uoEkyL9+hgcg/
 J8D0+7TszHaBOu7/7Y0eD9+ucpMj2bkJ9Et4voZdNpvPUvtTWv+Z/4JVH9myOAEP5e55nVxRP/8
 lX6CUAVAdx9ERGwXrnlo6rwNfpyQGAzYEOCVw4JjwnePwiPQCd1mWONsHs5Qn5Ne9dBQ5IXA3TQ
 xtk9kQ5D1jHD0XtdHhGlBtInRQuuF67uQq187t6HO+fqTHUQnfaYVUbBvUMxNUbDUgvkvWowRqt dROa47FJgYCk9sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_110138_273259_165548DB 
X-CRM114-Status: UNSURE (   8.67  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.18

for you to fetch changes up to eca86a61aedaa40310135c8799b28187afbc677e:

  arm64: defconfig: Enable Axis ARTPEC SoC (2025-09-04 15:44:49 +0200)

----------------------------------------------------------------
Samsung SoC defconfig changes for v6.18

1. Cleanup MTD_NAND_S3C2410, being removed from the kernel via separate
   tree.
2. Enable Axis ARTPEC SoC in arm64 defconfig - new Samsung subarch.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

SungMin Park (1):
      arm64: defconfig: Enable Axis ARTPEC SoC

 arch/arm/configs/s3c6400_defconfig | 1 -
 arch/arm64/configs/defconfig       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

