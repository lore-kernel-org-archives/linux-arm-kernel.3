Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D108C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=; b=Z5jpMuksbIzZ/nXVfxUQLfCG6g
	LUTCS5GnA3DDuuz/t9xXQV+X/sDuY7ZNwUL06M2+p74avX2tFBUwsfriuEPwVSknjQ3LtXgOYTtvf
	SOTEmziovU0nkyfsV5W3vefTKHrHxIDqboFYa/vsjZ8aCQAiRWlq0T/YZOiNd9urlesQx+kSuusyI
	ZspHodsJmMWdvJZQLcSutQbxA3C9aLUT8ZjYaonBNN/ht+RJ6Alo4GaEyWspT3psGJgcE79i6L8Re
	HS5GULuhwuRveJW9zXUeWlb5Ea0MQoW4iahe2zBb8pzE5QeM6Xbitc/AxZJpPR/MRVbSPNYpyQbQ9
	3h8eqLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMCS-0000000Fx89-44VQ;
	Fri, 11 Jul 2025 22:26:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwR-0000000Fw2e-0zKI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 22:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=; b=LvpKx8HdMDTg1s7q8Uj3Ctrxn9
	9WoQpldcUYLJkfLVcbAF0WfhO4F/7kKZfniT9IsjVYoWaW7rkldJmJT+H4WMI3qnq/CYJmdZFXvlq
	6TN0Krnuo/sDOvNLoOIkN4GgGDfpBhQbtUh/Bm4kq+eQ82an0urb7LyGmpG2Inn3ZWfTW4zYCowq5
	nljNFIcvI1DaQi1VVtfm6TL2BmCJXLuVRJav/fXff7HKs3BbRXlG1rxqhAZw7t9x+LCbbCCj73Rok
	YGOH9Unm5CYOPQ97+KMpgWBonQ67gr9/7vioOh7ISjHvRP93FgmpiaihNLcPuzRuJeARdiQ1jgBif
	gbtDgALw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwN-00000009Mtl-15FD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:10:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a54700a463so1495675f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271798; x=1752876598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=;
        b=Y3sN6yEvMLEWtd7StGm7uLcRyww/sWWI2FEdDYeishQ9Y4hzKQO0cOzwGUO2QwORqW
         qA5zgR2QNWOYUwVkEUGuRMMKYxxiRecshntBTrR5l6wBgxExsqOMxEraiBR8xXpb60Rt
         Wed5npc1Lv8iNHDThkMgUeuAy/4V5cx7ACkbDUay92WnOlTiVYtENshLTU2nQl5+fF+D
         gHodn8NEU9WkV/PTUJsUGKHBb4SBMlpJGcSsfdEhm7eXVK+HfpwvjcH5+EBSAflTTh5j
         xoLXG5dn2e8BISSLsHPlLA3FJWWrrmShHgdu6LpWEGeQvzYNb09zyqRsycSaIGCrSkOj
         isoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271798; x=1752876598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku+08PMO7/vjq2Tw85ozrppxDpvyl6Hgmrcst5Ryypw=;
        b=eRWNWz58NM/ow88rGgy7vOWJXXwY4h3jIekiP2W2QZG0sl9XQFA85lYQDvnLpN8+uW
         RWyxbznxSyPeGDFvy+akkMIoIOGCeSY7IBbOIL28y/e8WJZ41G5LDx+1KYuKIxr0mW+J
         id7kpRN8r5kzNA0QRy2/r95Sh5gkKli8j0Q3dc1Tc5qqSYUlFp82BfNHTy5Mp//IAwos
         lmYP/bwqTEtJNMDcteyU3lnADmi0eEhjjqyXgTBIwGmdD8hHJZXP+oXyQoSiuiUypwuV
         HrIhOy80HTGsEfotiifmeqv2l50v7YYMFxKxZxogHEs3KwJi+eWxL/gEAuLerpI7zwFN
         Aq0g==
X-Forwarded-Encrypted: i=1; AJvYcCWnAPsRDJNxRfPPYYDzf7XE9Hs6a18R7fH10AsPBa3TV1LhPZ9oOVEnvgZrQ7OaSYecSWdyeak6Svl4C8uZcg11@lists.infradead.org
X-Gm-Message-State: AOJu0YxcO1iRcuML8m0t6B25HjbUPLcaOt+3z9olXv/y1nAxyye6GfQJ
	Vpf0DkMUWPH44R+GHXpDGEWEArQHNsN6rWHU4mGqWqbWARgpWk4CkbUS
X-Gm-Gg: ASbGncvx8Fze6Qy7gNtPlK+vb5roqOw3pfAcjJKR8IB8OwWyV9VG/s4z1rJ+J+kCPU6
	XXcAPJ6I8BOwYG+9FT/Ip9VQt+dtOvoV6f3eO9vTTJ4RXZ8jdMer8cn9id7+5bUEWO5w2Lm+2AQ
	ydLGT4AfoSPrRmfpTlfToHqKI6M1NPb81Za+Xoy08hm6uUxefk5EYlZUXCf8bvqQSlKgp8ID15g
	OKm8lpU99KQ1CdXgWhKFEHchGK+rHAXUuaImWqRBQNMl5HrZUqOFghVht5GISvxal2Gp6xconK9
	oj/uQN+D6OAixp+Nb0C0M5G/CSNHMJPqRN199Xx+VjpgcgXgRyNMAmfkpaQPAbCTdaeR5yqZ/kn
	BTKqyHk6L5x+1RNkZ2R5rIseNhBC5ovx4dtFGLYFepQ8SXJHtqQjcqixUI+BJ0asWBMVlJYE7rI
	XFMZNL/VwRr/+0Kg==
X-Google-Smtp-Source: AGHT+IHipbiPzHtHT9lAlbF3iUj7vcZpxHsOY228G614wvileARaAiUqQeN6JuMPlvDPl0+rJezgFQ==
X-Received: by 2002:a05:6000:2706:b0:3a4:d9d3:b7cc with SMTP id ffacd0b85a97d-3b5e7f3d0c4mr5790806f8f.28.1752271797634;
        Fri, 11 Jul 2025 15:09:57 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d5f5sm5633411f8f.56.2025.07.11.15.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:39 +0200
Message-ID: <20250711220943.2389322-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_231000_429662_2BE3F939 
X-CRM114-Status: GOOD (  10.24  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm-dt

for you to fetch changes up to 3c2c00572fc3e0b128f75c7ce9c3f70ca457cc3b:

  ARM: tegra: chagall: Add embedded controller node (2025-07-11 17:11:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.17-rc1

Add support for two Tegra30 ASUS devices and enable the embedded
controller on Pegatron Chagall.

----------------------------------------------------------------
Svyatoslav Ryhel (3):
      ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
      ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
      ARM: tegra: chagall: Add embedded controller node

 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts  | 2087 ++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   | 2500 ++++++++++++++++++++
 .../boot/dts/nvidia/tegra30-pegatron-chagall.dts   |   16 +
 4 files changed, 4605 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts

