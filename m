Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2963CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=; b=EqhSrb/p0Men7lZalKfyVMr7lp
	4oVGbOqA2HQAYZdy7XxXJofVpNZZjLYfk+aTQ7C1lGFY06u3eSMFVv1h9dOAo7xYqVN9ptQ4s4BfG
	xBmv2MT3afva+qX+SjDVw4lrZXVo6CVCENkKFurWOdyyXYULNaPH/YFYW1XVH3tEM1ZrGPBGGMUSh
	pAG6OYS4L8koP4rf0qS+1SUd75ogfUXQwJAwyYtbSbViq1Z3FymOKI75xpwB2b38Roc07xaMQz+nW
	7T5gYjyzBxs+LUUNhzWBMiIPrLjaebVt2krFjOzi6FrQM3muO0JinRLtKGMXVbA1hDgjV+Ga4HaKq
	m2FVbk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKBk-0000000Gfbq-1MuX;
	Fri, 10 Jan 2025 18:56:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK95-0000000Gekc-1TdH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:54:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38634c35129so1827934f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535249; x=1737140049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=;
        b=VYD/qU1zxuKwNEajBnFffXaqbg2YvLrA1C/LEduWTWzREiZfjlio/jwe0yFpT4fYHk
         jxxMlggr5qrr8m63QAXTQPcAWLCSsGNwNZdn9nXT2q/j1Yij3pPvQmCZ5v6CYzc+PfIa
         eKtabqfsJTW9++ELhHsbqcfm6CirLt/bfncuCnCBYuGe/fyaEtW2gIQfJLdkDueeph6y
         SXh3RR21N2/DMy6JQ9M+BHL3Za+H7H4c7LDUV+ozBA/0C5CJUgJkYfRUeEuN+Eempwuf
         KFBXJQKR5glJe67ogTUsYod6rnkm9ZjZqJyUyLlk4uqCGBAjkPVjmLq6umqa8VlNbnoj
         Un2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535249; x=1737140049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=;
        b=cwHHQsr+eWjS4yXT8S+1f1WWG3hHlSwqaD0OF0oASw+8dayrB7uLdNtk458NGcnRqE
         RpZrmZUUdOowuxCO/Qx1aMxxiv14J2aXSvIeAs5dLQY+CUL3DJyH0kDlj37ew8Z5L6au
         /jwUjo5+3RC4OZ2cf2MOK9OXiTUSp1UJevJxk3VUs2jJB27Sob/hhMUGe82D8DoY/cMY
         Bj+UEhEebThagof1Kz0yL5qrW43+Puv3Sq7/H+4Vu9NoY//kJLRHb8BPA8cxxtZNCzrT
         p9D0IsqRbDyVr7nkhnYF2VkrZYnWi3qqwYkBoD37yjV8XRz3ClnLjwZ0s3ppoRkw07ZN
         SNBg==
X-Forwarded-Encrypted: i=1; AJvYcCUTUxi9+UQ75nHCHzAM7d+D49AoM+/tHFm3EIb6dHR++wLw/b0R6WQ/dU1OTymcZHjB36xJqpndYUI1CmAGDin0@lists.infradead.org
X-Gm-Message-State: AOJu0YzxMaKNKDeXmlqkpzgqDy4a30LdiyP09mhIZWwp8uWu78eAhHqd
	SShYwyqeA9XdEb0yelhtdxg7nM9cEKL3bgHdonc5Nc/Bfn2TSjiULJZ7/g==
X-Gm-Gg: ASbGncvG4zls0qNkJ8Kcy0zdgObpKhkObkaez7t9NXVkAK80Zphde7/00shzv1fpkCd
	BQTMROY085u5xAowplxqWyDXNDV8ODw0P4eXFYRJkVpYbn3cRdnCXURFK1jNXRbpViYXzbjOpHB
	cC0+5mDYCZE63q/9Vkmcbk0sfVnKsnNZJPRxCEbKRmQKJEF6hr4x8CLb1CkpI/np12bz6egh4zC
	rbOAxbaj+pCLEaS724do4q0593kxV1rlNbNWbXG7S78FiK52dAbsan38TquVpqZ8kaUs3HrfWja
	j6/pBv9gq6F+6oCPmKrML5J//St60/ZIR2yIrl5+7iVPq3dN
X-Google-Smtp-Source: AGHT+IEFi3PtPR7G4voP3OPwlBAD74nU6hgLY1gXbKic/LuJz/motUj+soaJ5WE95z00Ob/Xtqkqjg==
X-Received: by 2002:a5d:5f82:0:b0:385:e9ba:acda with SMTP id ffacd0b85a97d-38a872fc177mr10677053f8f.2.1736535249366;
        Fri, 10 Jan 2025 10:54:09 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm5291450f8f.94.2025.01.10.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:08 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] ARM: tegra: Device tree fixes for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:52 +0100
Message-ID: <20250110185355.4143505-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110185355.4143505-1-thierry.reding@gmail.com>
References: <20250110185355.4143505-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105411_388507_75B45CB6 
X-CRM114-Status: GOOD (  10.25  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-arm-dt

for you to fetch changes up to cec785a7f25d9ebe3a151ddc4f3a4ede7fc0dab0:

  ARM: tegra: nyan: Maintain power to USB ports on boot (2024-12-05 12:42:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v6.14-rc1

This contains a fix that makes sure the power to the USB ports is
maintained during boot. This helps with booting from USB storage.

----------------------------------------------------------------
Michal Pecio (1):
      ARM: tegra: nyan: Maintain power to USB ports on boot

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 2 ++
 1 file changed, 2 insertions(+)

