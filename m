Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98439C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opy2wfIX1UsOOE3V0he+g+lIe+f98SRccSA9l9haeqM=; b=i4eluBNmBXatD4LTqsWEQLbTHh
	CDvlaxmg03O1gK1grx+mP0uRV7FL83hXMOUqxD4I8vautWStLNOWxsZ2Vckk/1IuuhhYzoEfeCAAl
	JN1fmpL1r+sbvlsIY5wUyu/VJ4oWlVe8to/ugrMdbD4VreGDFYzcm/V9Rd5i11VGwj/77Je2GYqTb
	9mB0jOiM8WTgIXoH9Eo2aQLDsoGrva7fi6d7389Z9hfCQflM6oqyZwoYDnhWa0uzC0HZuXJyc00Z0
	uUNiiauTQDyl6PLBx/Pe5uiiS/CBr52MYA19Kqm0locNZqifE37B+b0w/ewg94plX4NsK/5ZrcmCF
	tVgocChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3h7-0000000C1kR-2xrk;
	Wed, 15 Jan 2025 13:44:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3fr-0000000C1R9-3QE5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:43:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43623f0c574so48173265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948590; x=1737553390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opy2wfIX1UsOOE3V0he+g+lIe+f98SRccSA9l9haeqM=;
        b=bW+bZtov3QFGk09JqVCuVw7oTZ/TBQ9KPM7gR963HCDclBtO3NVzMxRH/kVSTq9C6p
         17mTeHLV/H+FEYtTEywcmIoJ/dYD7ANNKYN+lnmUmvJaIs603ihoK/toVgKUgL97FV0A
         jON9/2RiJg9+DWbvT+2NfaAdwVi9kriWQRiEqLmzzUZv4HRx+5zbq0HZxBpNslLi6dqX
         PZQg7sl+XCkkPaC+b4x+zXaglWncomadWyDhapOSL2Dd6doULeMqvGejPelLgJpcgZk9
         hpKRheWbW4SzcbwY7STJ+D64d8OFJ4D3rZz04ZTZt8ZBnmnouqvDEmWlTiyp4JcVFBX4
         8U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948590; x=1737553390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opy2wfIX1UsOOE3V0he+g+lIe+f98SRccSA9l9haeqM=;
        b=vMwkz8zAZuoyWoZOYoRu/Ee14m3mdeNfNTMbCKJD9mffFF+ygsVcM+QoSqvLMWch0o
         dqxHfBhxqBIoROgi/TBnQwL3Nl4hZfv+1GsfUPwmrQ22o5GnDwGlM+JclKmdzvfIhcE5
         4IHoKvfpkoapHSUc7kC/GZV2nfBzh7F96YG7QjKLggURDomp3qrZ7uYHIWRphUzQ5CE8
         jsk1Or0ygR8RQpmmO/GslxmPT2+aaRIS8eIQvNyEBI3NQZc6+/L4DRyq3T2TCzmCdhNV
         uxDBqUQBhk23VBtNkd7cUx8TXlboQSK+/LAJVvaDgv1+S3CasVsYo+edeyMchep3pWI2
         bsPQ==
X-Gm-Message-State: AOJu0YzLdnXrTeWKtS6CSQDvMxgdJR7MqNCP3XuU28jOoR6547GAQJpI
	zOdsCpA1xH5QZwxlfu3Yw9Rs99QCso1r8ndtlJza3SRqP24J8Q/tVk9+rVLZLqN61Qtgb7x2wS/
	k
X-Gm-Gg: ASbGncvzN2SgcA3lP29wJ53ZkuM40KoNKBbVJfcWTe8uJ36OtY6d+fs8TbsZjNQelNe
	dXT71cZzdEPoRx6T6VJSwiMQcQcqozM2UNo+sbRH6buFgr/4N9cpHM/3eV6Ckjc3cJXMQ48D0Bl
	qDamtvpTACFFg2eKZfVurIc9nrSOnUqtCFqi46Gh14IwgijgPGGDcOlJSkNUOKOAP2vA8BWrWUs
	9lEAh755ALqxfFpwJKwe/w1qSEyT5/alxJ//+2Vna3bsmV7gZDDnqA=
X-Google-Smtp-Source: AGHT+IGAUssfFDmA6uSWk+r0sDcO4TpyWsYgsMkzepElPCBMNBmhWYz/RFlv4+/LZrZyWS8dDqZx0g==
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-436e26a9045mr283566455e9.17.1736948590069;
        Wed, 15 Jan 2025 05:43:10 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm24853825e9.3.2025.01.15.05.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:09 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64/sysreg: Sort sysreg by encoding
Date: Wed, 15 Jan 2025 13:42:52 +0000
Message-Id: <20250115134259.1864060-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054311_854548_F88709E2 
X-CRM114-Status: UNSURE (   7.18  )
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

A few small fixes and then sort and ensure sysreg remains sorted due to
the discussion here [1].

Applies to next-20250115 for the review but I can repost after rc1.

[1]: https://lore.kernel.org/all/996c7843-7f51-49a0-9122-e688e37f9902@sirena.org.uk/

James Clark (5):
  arm64/sysreg: Fix unbalanced closing block
  arm64/sysreg: Enforce whole line match for closing blocks
  arm64/sysreg: Enforce whole word for opening blocks
  arm64/sysreg: Sort sysreg by encoding
  arm64/sysreg: Enforce sorting

 arch/arm64/tools/gen-sysreg.awk |   36 +-
 arch/arm64/tools/sysreg         | 1010 +++++++++++++++----------------
 2 files changed, 526 insertions(+), 520 deletions(-)

-- 
2.34.1


