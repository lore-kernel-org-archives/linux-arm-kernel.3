Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6491EC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=; b=jBNV5uuCkZ92veDzkQSPRA+7om
	hO1rZG6zEPw9AUSiyin8H9VLStVDQuRgyZcSOncKdlYtwXuqWdpJQrntqX1sab2n2WlygHd3q6uLO
	yuE7Q4GejMtVwP4cHUDqZ/s1KUoytzHKByBv0dTW2S/WzmQZ8/K6GxVHYwEyFqXu36QByBcaQYy+k
	PnO1aupkubEsDnrUf7GEH5l/ra2HHULEgp93lC8Y/ukYt/TFt+T1yXIvZro56ExSGLgo+fE2aRDnK
	xlfipqFVS1U99JJIQ94K98tuu2qKpTS84YFU5CS5a5LDENWMXsb8yBJb/GLUC/AJnIinz1p/nRCVx
	KS2bmTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWDr-0000000455I-3QSD;
	Thu, 31 Jul 2025 16:33:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhW9n-000000044qg-3bsu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 31 Jul 2025 16:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=; b=J525JXiLW/ikXiNLJsl+3rHH/4
	eEpJi5pb2gTUgQlqQSqsuaTyFmps+3+Fy24cjtyOSD5cL3o2E/FQRrkOtGcd/OyiOJzS7NWafiOuZ
	vP9jcXj2vGsXOoAYTKxcTU5g8tlKBW9GhtVt+vNm4D1eQ3y7wpRA5eVNKlOWwuB/6iksfrcmiW9un
	vx2W2Z4Fc9BQXc83m9Pht9hsFfXG4R88DStRfzZM2uzcRWZG6j9v/E2itEvOz34vhVwViQ3NgDd7J
	Kd9iCM4iHbMyYI4YK+4zjl407Ug6afTmC3/S1Vx5BxIYNVa5S8tjY3lwZA0z2CQYEaNISoiNaudGH
	sV0JYeJg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhW9k-0000000D6Rl-3e71
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 16:29:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b7825e2775so570388f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979362; x=1754584162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=;
        b=lLJMy4t6NIUpVHadLoyHyDDlnMPogOhyZmjj1Lp8a6wowaJWibUURhvRK9BWpdyF/j
         T0mso8vuI3X5EEyJngpuqU5qYno6027OVSde/jckZMBg09DbMFyHE+hj/SPTdjwTKUHt
         VvpvdV9BaJwc67gPjsizsDjOzqgjr+VO/mkyFxlrCh6485yhqARoPYS8sdlNOF+UPVu3
         lkNTcAAXag+CIJqssx1T+ukPMS3FI+xMkYXWI1vIBlPvd//7amhJMDi7/5td8WR1S+gW
         BQcIz1J5Dpfp5tnjFNl0z6GlO4tkoPBOMqmHwWxe8ucgkHTiWPRzYGHAVMfuStzcYsYW
         ybmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979362; x=1754584162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GrfhnOllGO/ZBhleTB8LJWdBObsKh2pIJ95KhExliA=;
        b=J3N74jYTJ+QL14MidcJEbkAAg6qd8/sQAgQYAZwEnil75vYRXGP9HSX+1R8kwZw6xb
         jLvDHN6+vHB2X4UQCaFZ4+k4p3z4axNPljD2Dg2ty5v7jfKElkho8nO6hZjqqubZ79L5
         5UhTj+hs4qQNpkHT49HC4Gq443kdv9X9UYQBXSrFjGnKh73gZHbaQu7zlcXJ6kRzV9+O
         hhEnDoVpISykckFzrIrqbcpi7MfWVK6y0fczt2dJLHXk0fRjk44NkqBKzWELiSVi9S3R
         02w3F81l9COwmd9Dq2E4YQ1zUlGGdM76SG1iuuUiQgyvGKukkrel3d99zZfr5fSpWACN
         Cy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZmqZ/GOZTHaEXLjM2Zf1bIFNC0Z+VjPg7TQ6QSg4037UWIDT5D+VTYxkgO6qcVG8GI7LSJsOcINc46hCCEZ2v@lists.infradead.org
X-Gm-Message-State: AOJu0YyMDpAxw1Or2HiY836vXot5Qm0MiY+ZztiDO1QnFOCQ5C6lFhH1
	g7v0ipFtdLhb8fpo+EZMGBer465U/q/rmaczeW7t748p8LKpmhKLnT3T
X-Gm-Gg: ASbGncseTJZOt/4ScA1vJRXUP7fjOTzhip4x6PMXk0MIUOrDfAYC7aZ3v/eBimFZ0aF
	T+7rqYxQ/WGaRb9amEz0ydQoOn84ju98c0gUjzbNu3IjXTk8PmnIAZhU+SO79Mcvl1ICWYlN4jc
	mcPfF9ZaOMI7KIyxXNFuSg9acB8Wv/gkbJidw3zUqCsVNOc5WT2QKpcY+0IEEeknJ4pkKXbHEnF
	XH6+OI8Q6HJRtG0Grl9aOAaWolpAmzNfRvs+a++Obr3T30HlCEU7R+ar/L15CNB/Wlw8D0Zwz/X
	3JcYXnvc3VZfGVKl9vmtakRlbSQ2OF8Eu9ec8368/8iJy/wn638t7PklTo8mJWdoNI7ceoBPcr8
	8nbWGIIexkr0lDDa7VVAszoLGM/SZFWju4PogoN9oCnDajUC+M2ZejpaqmFDgQ5kD/7c1MJamAW
	yOTYSP417KWCGH/g==
X-Google-Smtp-Source: AGHT+IFgEWwFjomsToqFVgplkYJcpc+0XO5/g/a4wp5+gHc+xPLMaQiVmjOvF4+UjzxA5M7HDt25xg==
X-Received: by 2002:a5d:5d09:0:b0:3b7:8af8:b91d with SMTP id ffacd0b85a97d-3b7950286f0mr6927192f8f.35.1753979362041;
        Thu, 31 Jul 2025 09:29:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm2849619f8f.47.2025.07.31.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:29:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v3] arm64: tegra: Device tree changes for v6.17-rc1
Date: Thu, 31 Jul 2025 18:29:18 +0200
Message-ID: <20250731162920.3329820-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724060202.2942616-1-thierry.reding@gmail.com>
References: <20250724060202.2942616-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_172924_999734_BB1C4E0C 
X-CRM114-Status: GOOD (  12.52  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt-v3

for you to fetch changes up to c36049da6c903b732f238eb6fd13c2051fac96cd:

  arm64: tegra: Remove numa-node-id properties (2025-07-31 18:18:02 +0200)

This should be equivalent to v1 with a patch on top to remove some
numa-node-id properties that were added by mistake. This should be
equivalent, content-wise, to v2 but doesn't have the dependency on
the extended dt-bindings branch that I had added in v2.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.17-rc1

This contains an extra patch that drops numa-node-id properties that
were added to the Tegra264 DT files by mistake.

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (5):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support
      arm64: tegra: Remove numa-node-id properties

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 ++++-
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 412 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++
 10 files changed, 701 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

