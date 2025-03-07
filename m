Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42F1C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=; b=ppiklWZAohAycTrjdLuCze2Qtq
	Nl5t7+cBg4gOZPkKK6DT8uyxeF3HgpamOn/N/5H4bD/Oz7Sb+JA/8ZRe/TPEKhReYVdmYIiM/N41O
	ll1pl7Hf6gkOOzLgFsxHnxWj/3f2mfP3hTQ1aKoXoCBx88myXeLO5wiDM2yhxAGQrxUUz7rTI6b/x
	UHutqLqq+Il78trkqBsnDgtKD3IFJ0+AjSVnqsXbYdIPnCioenlcvXkpq5d2iLvAmYZu2u/nl43w/
	QvMzeHJXBGt8yR51xEsfrLBCt8ROls32pdn5BQeRBLuukP2/UBonXA4MDfEFg6WWa4Nf8pvRHLNXl
	0a1cUUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqacA-0000000Ets1-1CvC;
	Fri, 07 Mar 2025 16:31:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaU9-0000000EssZ-17P0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:23:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so20866225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364620; x=1741969420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=;
        b=jiO8fri0Z/qlW6H2O+okpRdP7Naeitg5G2ovufhKiWsb2m/9wHDFseYBBCfHxf/YFI
         pDlZ7i6Fl51fNJN4OvikF1hs4mvp4VN+zxFfvTDIyIABFKb5lFwGADoPq0xFm6wQavsl
         HKBh5TGfmzqECTMbVnrmZLT76U4ZMfp4ulcM8rza0usomV6a2qp6uicBX4n2mipmX1Zs
         bM130wMH0Y3Q6TyeTifOTL6AYTSHGQxldHzy0OaB7DrEz38evHYD1l5UKXEhgulYxCl1
         Rkbc/28GSff+Z5mKptKo7HIJDyBhl5J473+XB7zsUXIAqCjnP8/SRbHmqWQ6ddnSkNMH
         xn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364620; x=1741969420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gzlon5tFuk86yBNYpLrvo8alNNm8HUbC6vvcaymIgY=;
        b=nTgJtqm2Mat/Mj3LTWCTpjf0pocTU4L6LtIId9lmktYn7ySo480ao8IvAtCgAPx8Ef
         npBolvvNr5iy5CQjZJMrHEHomQi/c5xCPQ52Nl93UJYYrcjpd+4KFZGEoWjcxymre+Zp
         vF0XX24EfG14URQUpe9vaVDOJufDSffRpziRDr2P4RUu0XoJFtIOATOnLzGaiKDDXtMz
         mVtIFCQ4N+V2ElhbZfh7bbWotkAre1H4+ldRjzyvtl3V94m6JFUIILIyoKhkimvdC+0r
         HuaeaSegMVFgWoE6wVVjTN+MTm4aKCnoCbU2LkCXToue5qnoc8TCvgrcOztK+SIdXNN5
         JTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeid91g0Ava0S599qCk2WVApiUomHQX+SHGoHijLxL1J//rV1jI0eghI3nE+esF/ksrTbFrAGQspXnkptuiz+v@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ3ntjW2LbKryaNtCggT65c5vXmCuL8h+Q5gIm+NTlMqLUNRWO
	FVJDOautcPV9rskMBDoVVypowvXAlKVP1FqMSf3GQjlpczE0j5vFkJxF7Q==
X-Gm-Gg: ASbGncvOxZbRBYAS8IbfgJj/xFf1x9FEjFQC+twCouNMCVgNA6sg7vD61r9bO2qkyF8
	CGsuNt+1TQqgHjjskoPLTDc4VdJyU9cvJPt80m3ez9E5B95LDaIFxM98dzor0CaHpdnS9prGArn
	p4bEGvdIvnDr3e3XR+OF2xermRU3reIayM7QQOrvCPSqA//1AfUTE/GGtE9GSzp8LJ/G/F6OE3j
	zooPjEEKzaGz3gnS+7GcpVjyKOQ6Wno3rRJcZDdGeR0fguwzF4jYNpcEI0a6iksVV1Iq3ImZEQh
	T0ALtpxtLQoDwgf5WOhdx8rp/LggkPEhj2Vegu/QBbj40Qq2wU0erwJ0ROocHoJK0AuJ+GFuPWk
	alFnfZxz89fb4L8Qm7ki23z5nAyNg+vB2gWMh
X-Google-Smtp-Source: AGHT+IEhX8ZynmyAzFMFULwh+yVEDu1g5TElWPkMZEgTtFM6On/PIukfaMQlBYq9jsNHdbJxeFWLFw==
X-Received: by 2002:a05:6000:2a8:b0:391:2884:9dfa with SMTP id ffacd0b85a97d-3913af01fefmr123803f8f.13.1741364619557;
        Fri, 07 Mar 2025 08:23:39 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dad73sm57497225e9.19.2025.03.07.08.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:38 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] ARM: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:30 +0100
Message-ID: <20250307162332.3451523-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_082341_304067_F84656CF 
X-CRM114-Status: GOOD (  10.39  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm-dt

for you to fetch changes up to 237a868d30e7a744b64479ff98ad86b2e3008943:

  ARM: tegra: tf101: Add al3000a illuminance sensor node (2025-03-06 19:02:23 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.15-rc1

This contains a few patches that add some missing, display-related nodes
on Tegra114 and Tegra124, as well as a small fix in the display clock
used for DSI on Tegra114 and the addition of a light sensor found on the
ASUS TF101.

----------------------------------------------------------------
Svyatoslav Ryhel (5):
      ARM: tegra: Switch DSI-B clock parent to PLLD on Tegra114
      ARM: tegra: Add ARM PMU node on Tegra114
      ARM: tegra: Add HDA node on Tegra114
      ARM: tegra: Add DSI-A and DSI-B nodes on Tegra124
      ARM: tegra: tf101: Add al3000a illuminance sensor node

 arch/arm/boot/dts/nvidia/tegra114.dtsi          | 34 +++++++++++++++++----
 arch/arm/boot/dts/nvidia/tegra124.dtsi          | 40 +++++++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts | 11 +++++++
 3 files changed, 80 insertions(+), 5 deletions(-)

