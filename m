Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A067ACEB2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=; b=cTaQ1Hyl8YXIWS3gfY30kbTKNc
	v3x6KeGRlghslG2o6hvFioTOF+xVxQdSRra6U1XfLjV32DUT340WH4GIpiveao1ilBt85vEPUw2CP
	WaypUpomMZUmRtnbYkHv0vePAglgZ7c6Xylfe4rv4oG79Roz4/9N86flvK2nuyEeaWerdNELeHi5v
	WqsInw9vw5Ye0ZCUCVP7KirxFRtMzXsEbLjRXxLtpghnB66f2cDX+eZbIN6Oj0m00yY5alLc56MrF
	lvKLnNUk1YTaoHZ9xqVChqOhzhy2HVMeVgO81RsZjp5HA4dEIr8vj03/KKjnFhhes5nxRzwVPmHlV
	7ME3qg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9W-0000000Dbxm-10zN;
	Sat, 15 Nov 2025 09:01:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9Q-0000000DbvI-1Iod
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:00:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso25395355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197255; x=1763802055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=;
        b=OV7nPik6XNNVbmh6ta44E2RTZKxVobNKEaD4ytdEL3isedIX1Qdbx8/kYWMUR2LBOe
         Cy99zxumiafKFvXy/oZduJ4D/zOHE31cI5wlyFR8/re8iyhnqOzFpdUURR7bCi7qeowX
         rpGdiV6AKXtDrTB3mo0NRZQBXuovoGL6O8Z3/MAmKol25+hEY/R02U4USAwqFA3q4yT2
         QnRWtWr4RIzcEE4tjXy4PkNo9utnFSSjXCg1N5UFR85O1HNTQIvc2twLidv37Uk/5w1R
         t6r9hTHHooFtB6jb7pXBHjOa+HhpsddsMvL/98x3cTdZIWkqsAQFqpWJkqy1CTdmXOSy
         cubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197255; x=1763802055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d6wDKFHjzRV7Jb9Tke0SbxVpJZc5zoZKHJ9dk74LvD0=;
        b=jQyjRFWgd/6gNT/RtOqA5dcRC2qX9oC78AuEyNTLcCrBSx2X6GFEuzUTiItH+t8p+G
         74WA5CoFfAdbaBlDTAEAdvYmO6zMmlcC+CeDA8fmXqbHyGj6T88sJjyAYb2XTC/pHjf+
         FREZhqBYMrsKT39UOzZiyzJdSpfQU0C/C9aQDSHYGJvR5lCpeCeDBvQ0LEzNNc3Ava1l
         s1efTv822b1yR+goypMp6rIpJRpKKcCPSOLuq9uuFcwcrzeeHY13aTtWQTARK+QIRNsD
         SK38btBe20Mztk6ojH7uAgM2Svv0SdmMmfagS2t3yZuylzzmlAmm9NONLxu9GOxgtZ+6
         CJsA==
X-Forwarded-Encrypted: i=1; AJvYcCXL+5FLH7I/nz55lGHxLa0rBz207B0tIDkZZp1gLhqoMlBZWx7DXo1ouWiuGoA35rbt6BKYJBohnOOA1mJA3vAN@lists.infradead.org
X-Gm-Message-State: AOJu0YxSd5ZxZY0ovv3xHMNaHV99QWdTZ4pSfZi9dKio8CQf7FU2oaM/
	wYicqZQ/WzqgIXywggq8+d8LyD5uL8J1KzkssmFiYlrVbvgKDpcWKBMK
X-Gm-Gg: ASbGncuSNe9Y1O+yw5p9GDsFGRk4Mlj0i+IVaCUu/k9xl9w3WCj+tw7dSyfCEMGYQyU
	Z+XTnx4Yw+N2hHuHHGg/la8Fb6s7IsAQSnblL1BnuWVIj6gLTS35Gq0m3m728M887ZYGO5krk12
	awGFmSEVJnq9+uDnrCHPYKxOe+JKXeDRccWBKD6XjGU1aVrTfsd0G16c4YAmiKtCfZCUKMxS1r9
	PPbk+4BnvKHuAi0cn0P2VpMyVDcmpwbHxwK0lIdd2V69rFD4KEYj0gAeu8pBYwkpOCpJRaXRQXx
	8sdTwyzzjDlrqcCrtnLUP/cGqFnZ7taf+NKsEbbZraktmhp4A3LRINcd7Z/FF0Bf4IVijTwwR+z
	OTGzJTIs+02v5uPceHdkBScYDhbM8a4Wj4sfKHoB9e1IIggUqcSeyHazLCbIuuatLEtNC39nJp4
	/0IW68wJ9y6p7VYbbMdWeDNtBjERVhPynb76mzgBf7Yoov2fBpQXJoNQ13RGVPdrlCbWbOb4DyE
	fPwgJE=
X-Google-Smtp-Source: AGHT+IGbQ/s7KX7f/xqyB1QpfckUbUgWDGGjMrr2y1kPsnMSCp8R/Hg3hnEJQs9ahhQaY0z1VQA8wQ==
X-Received: by 2002:a05:600c:4685:b0:477:8b77:1575 with SMTP id 5b1f17b1804b1-4778fe5dcbfmr55442485e9.12.1763197254489;
        Sat, 15 Nov 2025 01:00:54 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm8331095f8f.14.2025.11.15.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:53 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] amba: Fixes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:38 +0100
Message-ID: <20251115090044.3140331-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010056_373013_4D92CD23 
X-CRM114-Status: UNSURE (   9.60  )
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

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-core

for you to fetch changes up to 500e1368e46928f4b2259612dcabb6999afae2a6:

  amba: tegra-ahb: Fix device leak on SMMU enable (2025-11-14 17:49:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
amba: Fixes for v6.19-rc1

Fix a device leak. Could go into v6.18 as a fix, but since this problem
has existed for a long time and nobody has reported it before it doesn't
seem critical enough and sufficient to get it into 6.19 and then
backported.

----------------------------------------------------------------
Johan Hovold (1):
      amba: tegra-ahb: Fix device leak on SMMU enable

 drivers/amba/tegra-ahb.c | 1 +
 1 file changed, 1 insertion(+)

