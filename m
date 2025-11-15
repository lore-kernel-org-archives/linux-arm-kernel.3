Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2FDCEB2CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=; b=T+f0jk2fX3GG++bGXC+8lap+kj
	fi047lZYqrva+CKa9N1Sfmi5OJ7y8JjteGgfk2pcQi+iAnO5xy2KiETgRg0lGJAExyUxGFPsiVHy/
	HrQ1nz/g3Xtyl6rWT5aqESUJ4nbaJ2mM63jT7C3IkDbLLVZRp1fN0ajV4Semgk/4D34gZ0UlAirR6
	hZ6HMD9wOWcSSfjwZrSGOvJzQRaXUFLoA46yOVo/g0Cj6PwUBvnLK7LABYlJkqlRB7dqM2qqLwvui
	EOcds2YK1FcBfWWEwQicJeg+NRcuOXHArvGUA8EnGTWO1RTMrxvanLcoNjrgttNy+F1UfpziCnfi6
	QsB/e54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9b-0000000Dbzr-0BEg;
	Sat, 15 Nov 2025 09:01:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9S-0000000Dbvf-2LXt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:01:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso18890855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197257; x=1763802057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=;
        b=Y1fNRgA8ie1StIt8TepA8sOG47bUDo99LomPHG8mvj9SuG+uhqub3kt1F82NA7STjL
         D/5UzSNmgIPDu5Zcz0mJQl0CgoJGWerdJbEDJwLKyO/xh/9pzWCx5zClUARGr3XrnTsa
         AJLNFlArcmsPpSCvifvxzfVU3AIJ01iNTyB7ZRfr296MvIErXjhbaRNl7tST73+mpn8N
         dbpegj9csC9cSIc5YxNVyh203GhnM3p/72jQtbT5SjIC+7T6JRS4fLEhmlHjZE+NHAaK
         /43i7NbRBZ3etiC7IJc6ZR2dTE5fEPzs3MxyYKmCWi5ssBnNI2V4U0W6/1pCy8QGzWPo
         OqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197257; x=1763802057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fx2ts+fHPLoBy7RLDZLOGCht+3l+lrN74DzhJ0vF3ag=;
        b=XpjMGBepToqlYGTzxU/DvybdIBXyuixrrLWSLvEKEpvcEoSb0ICGzWpImbcbWveBMl
         aPMb4MAUBn8g1rRwbf5i3PhcK6jQOuTtvMdGMFb9yTf6cM+kiFd3R1Kg+6T7iKPYIynt
         ig68h/XvEuwHe0iwJcJJTGxDrY4YR21D0BtdvSe3i+XTrOKU6h9QRxyNRhm7uJUCHcZY
         IrWqc6UjdIwDhozglOcL6CEBvO3PurnMkSs9ybh9+3Q19DRadzw4u45whRaFbvPOHOxs
         VwylnM4n6aCR0Eh9rjNfyHC6kM5VGFK/zJYp7tlapHguiaJ0euhVl0kBh9lBmDuvYjNJ
         GqWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUYKCJAIbIk1DX8xJp1QK9TnBaGF1g5poGvGI+Hhi2qsSDiX7Tkjqb3A+ZVYxY1VPUKrWfb3GMMwh/PHcc8wUc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0n1zuu9eb2MyTBHXA4pmExxpqCgP9XrZ71G21Ip57Y3/bmPzl
	yJ/N/xvDkkUklcgjSD89MrXnmsf5TTTIoVbXSjH+Ljhc46TeqnkgF7zL
X-Gm-Gg: ASbGnctFmMHHB0vAJ2PaosOYvHcp0N8sxkT8HWWkapjos7rq5acm+2L8WPfK1AfzdTN
	UQrfcVlVrO+i4sFdhEz8mklsORiOK+za1ul2mlOd2+OtmXQNm2QuVXKHh8YvgPfhx7iF4pC0hhO
	PhLFYkaC3+/+VuHSBC/KTEZ+ES66nZfxWiJelAOVLw0P2r3oYJNxLmHrQUmU+c3Q00lAIu/ulp6
	Dd0aiEZ4Vs2oQ8HXM3HdSL0LeF4Jk0d7tL8fkr7CI+hM04O4mfhyYBzKQ619mLiaj1FzwmzOMbk
	p0bWBbvLZ2v141XueYD2C9B6Igxx2XmGcytAIFWjh9UtTLyv2SvlZF4XANIm4M2NA/szzDSRNsv
	Uqqq+MfxZnSHuwhRVWo8qhcEGm1vabq/IgBSiSLVF/lPiYJyzXEWlr90UDWqHk1IS4m1g8RvLjh
	EezdEpDICOgK1vVCZBr4SnFa+T4TYsra7IGxrGTjVfsEWa5NS7XPIalHTlkJyoVUT0g5IX
X-Google-Smtp-Source: AGHT+IGyB/RQW9MTVswcGv4cxhGmARlI02larXZ725dOtFz0GZlaFld4CKIv8l5sOZoudOnpPEm27A==
X-Received: by 2002:a05:600c:35c9:b0:475:dc98:4489 with SMTP id 5b1f17b1804b1-4778feb568amr61956635e9.33.1763197256667;
        Sat, 15 Nov 2025 01:00:56 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm14443659f8f.9.2025.11.15.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] soc/tegra: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:39 +0100
Message-ID: <20251115090044.3140331-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010058_627993_54EA6417 
X-CRM114-Status: GOOD (  10.84  )
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

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-soc

for you to fetch changes up to dd03d34d6d8e7a3f62450fb7a1408d86fb35487c:

  soc/tegra: pmc: Add USB wake events for Tegra234 (2025-11-14 19:29:50 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.19-rc1

A couple of small fixes across the board: ACPI support on FUSE no longer
exposes duplicate SoC information, speedo IDs for Tegra210 are updated,
some comments see typo fixes or kerneldoc additions. Finally, support
for USB wake events is added on Tegra234, which allow these systems to
resume from suspend on USB activity.

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: speedo-tegra210: Update speedo IDs
      soc/tegra: fuse: speedo-tegra210: Add SoC speedo 2

Bruno Sobreira França (1):
      soc/tegra: Resolve a spelling error in the tegra194-cbb.c

Haotien Hsu (1):
      soc/tegra: pmc: Add USB wake events for Tegra234

Kartik Rajput (1):
      soc/tegra: fuse: Do not register SoC device on ACPI boot

Prathamesh Shete (1):
      soc/tegra: pmc: Don't fail if "aotag" is not present

Thierry Reding (1):
      soc/tegra: pmc: Document tegra_pmc.syscore field

 drivers/soc/tegra/cbb/tegra194-cbb.c     |  2 +-
 drivers/soc/tegra/fuse/fuse-tegra.c      |  2 --
 drivers/soc/tegra/fuse/speedo-tegra210.c | 57 +++++++++++++++++++++++---------
 drivers/soc/tegra/pmc.c                  | 21 ++++++++++--
 4 files changed, 60 insertions(+), 22 deletions(-)

