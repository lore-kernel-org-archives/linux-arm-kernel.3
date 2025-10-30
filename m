Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77379CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=; b=KTHq4+4sOOP0TwtL3uzg4UgHTg
	Msax4K1nmS/DJYsevHcFsR6WoUpCdk5DY2P/9dQtNuY7cVCL4qLpb5lgUGLgYdTqJAiKAL1sDCMB4
	98OLzSQllVvdGmHBRRa0N963diNfbmxoQl+yqazm1B/aEVaVYm0MEUPQqXKMCepdqZ7p1O7OE70TN
	dRBTNmKqt8mEyipr60XPj0UTrkDbj9eqfvHjg8r1REXhm3fmJpFTiTmv0vDxIi1TAm6d6ngTwAAUs
	THXy707o1unbEFomFVaESJBKudt8lw56osqrQg5aoMLqEX29uO5CdjXvOvSmecOrTnwLqvnqztj6+
	Z4N5/f6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYC1-00000004exw-03VS;
	Thu, 30 Oct 2025 19:20:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYBx-00000004exZ-2ioP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:20:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429bb95a238so569359f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852011; x=1762456811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=;
        b=JJ8SfGpTyA71ZvEHKKUzMv8scso4XhaBGUfHiyPMCN77wz8COg8/yoFMp4kwgmC/kK
         8lqbh2C3KWO+Jb4QjI3SAEtNmr3S02Sb4lZYScfSyWx8f+zz81Ep/ivWSODRxa2ccZRl
         0pJs/OMwtpP20AXsjx0WO+oeTboR+ZXRicJP04F9z9WQDSBASbR9UyJUzG0wemuKGdeD
         v+8C9zc6bMf9LJwz2rjei93U9NClZRUFKsDqLv7eP+BTNScRptSrvybTDMvZ9sVgcvQl
         UPvG5tyNBmeQzPEIO6BDKcLsJZBvAnSx0WJa2HzxPzWXRY6NdnzeYw3iigiS+3YZoTkH
         mcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852011; x=1762456811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=;
        b=mggpR4eBa2KiDIQzT7wulbUTuycXOhBnsrTsX2jhaodJo84l7Hoh7UtKhxt0z1BapB
         mnEzQn3Zf0dj6GlsihMcOaYgkHw7A7iww1/U1+3D89pQn8//xXPlzZXI+yfG2t1ZXAuy
         CFRnTRyDg1ZRjaJVRyxotHzfQV1jmz4FgPgBNvyqRDwComlzFRQvtvjiBhkCfAi9+DR5
         8rRhIso4OhtHFcDK6VVrZJpr7HBj5wSomlpvJL0TxQc3qh7SDDPHpVWyv6vvj93p1RV9
         dK4pyiLGTTEOxuUB+nPcz4v2tHufbXX+kCrgl4Xs+2R6TLqTL3CRHMhYnXRaud6RVd7T
         BYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7+Q7rz3iiuwsyw5YUEr24LaZmVxa1b5rglKJxA1h1gsEgg6KW3ojwPss4pxB+ADEYrpTQOzWd92u7YAcujj26@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8AowX5few7ycMRAADzvOrCfWLWib0VH7wbwrb6aBuktbF4eX0
	DTg8Rqz+XRAg02/WUhVCfPc0GHYTntIZ6Dlork0DACqYRg6HEJPY7cPA
X-Gm-Gg: ASbGncvwpg8TzBplafsMHcVQQ7lLyJSXHz/32z7urlvI0p77Ld9utUNvBz0/vWvfIl5
	ZB6xbkuZd5rujEeKdHQthnIYk9zSMwmYPB5kJhAayQn4OdsBBMFEBBMA6GaqrhdSNOMnWyOhov9
	uoLPBBw1OFn5aMTAuiXhz09paQhw3bnz5NlyPVoHDushb+cTpfAMlzOtEkn6dHlzlSM0QlCZXmL
	jFKhdAMzCF9Ik7ng8rUakD4y7zyB/dtMsYChXWMdeWgGrxTaGnjSwdZ49sZXd1UNW1c6cDHVb7T
	kfa36ZJQg1e5qupqNZQiy0WERtqX3Fb2nxKQpLILUAaZSn2nK/B2vXLor1gCCC01XYINpi3hovP
	Ne7dSYbkwWG0s8Fx4W+SMHYx4FRQbvi4kWb8PdlZBziOyQnYcw0Yb9BBwfTgmuxX/onanBdy1Nf
	09KpwZIGeFmmBzq2kzvsk/G2PVhTVbGaZNMV2OMJl/65y59w5YN91bfQ2EoACUJgDI/FbgqFGrS
	ZvPPbo=
X-Google-Smtp-Source: AGHT+IEpSsbR8IVq5Rq4mjP5qqKpcNZKCRQg0psZEZaYxRf2iVNkAiJuhW6XE1AiPQEiDp8LTtGU9A==
X-Received: by 2002:a5d:5f87:0:b0:428:55f2:be4b with SMTP id ffacd0b85a97d-429bd6a4c29mr760402f8f.38.1761852011071;
        Thu, 30 Oct 2025 12:20:11 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df473sm33477601f8f.42.2025.10.30.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:20:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.18
Date: Thu, 30 Oct 2025 20:20:02 +0100
Message-ID: <20251030192007.682116-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122013_697953_6FD2571C 
X-CRM114-Status: UNSURE (   8.59  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm64-dt-fixes

for you to fetch changes up to ce121914f38aaa59504e20a1a625e5988fc6ead4:

  arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source (2025-10-16 11:49:08 +0200)

----------------------------------------------------------------
arm64: tegra: Fixes for v6.18

This contains a simple fix to mark the Ethernet PHY on Jetson Xavier NX
as a wakeup source so the device can support WoL.

----------------------------------------------------------------
Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 1 +
 1 file changed, 1 insertion(+)

