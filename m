Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C84DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=; b=CR14Xj68HGdmI6KfC3YgQVaA75
	v9RsPRFmXkaiZa3bbBBEx7F6mCokDnrNBEWnDecnPMHiZblXDMdbq+RjiwJ1nw0ZKLRPGkkDbmdOD
	uR+yl+GwXvxPmTPKfYkhZ7ChI6g0YbYma4W78zylnFVO2Lp63A7WIVwpYMzPrnS4VDX87cYnJL5yG
	koh0g6BojIdLrZK7dtrD8F7Fm8bFwlUdCDYtLt+JC4kFqs1buFm+iVS/7ZFSFg9B3OHTbERuE5RDC
	Neaz3OjE7Pj3mKo0oJ/aIkmfKDJFosCTTVGARzxsBrYwAufkiLJs8Vi9aZO9/1a5B9u2OKEE0f5mB
	8Xa8TLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXRx-00000002Ni4-0oiR;
	Fri, 19 Sep 2025 09:30:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXRv-00000002Nhf-1Hu0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:30:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3eebc513678so669567f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758274237; x=1758879037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=;
        b=TN00CyChAb425949SY6MoB2extPOnqVrtRaU5ewgZm4ComXBxtFYHkRD1N/vWOjvqH
         Qc13GI6eLIhn3pZqx3+g8Kde2kpzZj3QEvILUQ6/28/K0zQsX7K4SdZcJD3SEUsNhPMH
         nJbjI+bWic/pdRwI+6JvQTTybYaK0E1P7SZRMYOmExNRyGmIJ3gOjLbStPqDp7HKXqTY
         XfxneVO+ry5ElCG0VKdf4ZLlMdmz6077YtB4D8G1tkGpmBZDiVy2vMtcol4mW9T3pya6
         wMzaVq45PjY1WGhrYIm3NnvczajKqduZlQVSEvdxKg1GsfTY0aCP9GodzHNOUxz2OxeG
         6tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274237; x=1758879037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shAUV/4fLe8epMbZhEjkFrhPpzpShVnyKXxo1s/wp4I=;
        b=vhKDrg4t1G72+f/7rirt8WhzMham6zn0Y9MDsIhtUQPSzxOhCbG3KFWdEi+EWst8Jy
         1DsJGKJAJ2LMzVXl9AIhubZ/+bUbjV3cyQORce8bxXpZ9fHQgi60lzVml6Uq3UCx2+u6
         O/4/WjgW01+kGZgS6Iz9bFv8g1opbTnpLO4se8UB2JYIwT4enddUmRV++4i2BoM8X5yS
         fj07EBC/4ebpj2W7rescmCDkrTWS6L4mQGUPTS//tS4TFXzFPEt0M7+kWU3mora0rAhu
         a2qtgqAIFA/cwTXN0jba64jeK4xtqX9Lwc0n+hof9ijVyZR84NwzUFfBOXd7IUJCds+B
         1nHA==
X-Forwarded-Encrypted: i=1; AJvYcCXCmnd2+oapGiatLvo44KgzrBf+SwmnZW7BYltMAmFy63I9YBxJ4iPZT6m3z1GCYNfKDaypUT3VRxbi5AbaQDoB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9O2JeGS3tfDRiTuL3AIXF7e1ADLdoQ7YgMQf6qVJk4WPHpcpD
	PO67di9yKCtp7JZW/y6JiHUzqYSyjF2SUAzPgEmNAqGkXmLxTF4Pz64N
X-Gm-Gg: ASbGnctmYOCX/7LpL7FWuw7NVmhzT3OOYPUy3L85kBXrMdbAaL3Tld/Hau4d0RhaAlP
	Jf0UOYA7d46PHyDXT0SBqbjgmyps9yWo/GFzo/ZZyznXTPsg+ykaQ0EbUZkfsqqPFNsnKBE3kTV
	HboDjEfIqln+LT1J51gSC7dNkxzhyvBa+a7cA7PKDreQZukFrV0HWo/x8NWMJVqD1Z1wLoFWtx2
	B+jHKujZSbSO/A39KjMNsgNvmNMKQjWrtIXMkPSPmx/409CS5XllPkC/ygQzLpXkgmngxx0tv5G
	kNQrbE/ZIZPlCFIwfwg1741icATWsTg4GQ8YwNC4+eX7zsRxjdil6Tl4Qlkv+AwgoQvOWXnmYi8
	FoccS9yOUxqOT9NeU3AsIpukBUtHFQI/iUwHjeegsK8uXKK3sHzIYXwZUnZVNHXH18WQ+QG8z2N
	OiyLzh5b5OaPvIsg==
X-Google-Smtp-Source: AGHT+IEc2Z9yh5Xo4qu7XSr+O293iGaa2p4oGxQBjn1/Zv3QlzQilSw5ukGaWfDe5r0j6EsTMEOZxQ==
X-Received: by 2002:a05:6000:1ac9:b0:3e2:b2f0:6e57 with SMTP id ffacd0b85a97d-3ee83da0688mr2182377f8f.36.1758274237120;
        Fri, 19 Sep 2025 02:30:37 -0700 (PDT)
Received: from localhost (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7284sm7083373f8f.33.2025.09.19.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:30:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] firmware: tegra: Fixes for v6.17
Date: Fri, 19 Sep 2025 11:30:33 +0200
Message-ID: <20250919093034.2747884-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_023039_357227_B710FD27 
X-CRM114-Status: UNSURE (   9.87  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-firmware-fixes

for you to fetch changes up to 6131690df4adae33e01c0b51b9b78b3e8ed3b76f:

  firmware: tegra: Do not warn on missing memory-region property (2025-09-15 18:28:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Fixes for v6.17

This contains a simple patch to avoid a warning in the case where the
optional memory-region property is missing.

----------------------------------------------------------------
Thierry Reding (1):
      firmware: tegra: Do not warn on missing memory-region property

 drivers/firmware/tegra/bpmp-tegra186.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

