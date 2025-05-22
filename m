Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFC9C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=162PHkNGgQO3PjVXfDykPBsa+evqNxguX1rebBysG+k=; b=sG/m5bSFily3KYFZIf1iSM5Bv/
	7fQsL2wQ93q9y9W/t3xSg+s4khnhiC0bAeB5h4FuWs6TY2YRFjbAUUC/ybOYRySWAJMFdztbZTHeS
	AH5eUbeGT3cHoyQay5DigX1WdmMnzLKf9JRAoZwyeWBkFRU7Fj5vXugkRW9uc30lDz0I5yFR7VGR/
	e0y3k5zHpvUBpdY7A0dEkd83JFML+8SzTXYG4sdejIDW6gXF9z6kv20aJT5PcSo2xFB7966Y4uFvp
	ThzgATGqmLl4eUh+sw5VRBWcSHt/4brCd1Y71c8NjM1hJBZ4K6qqoIhgpU0KagFkgSzNVzumM1/9q
	48mKrpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFir-00000002VyW-2Wrt;
	Thu, 22 May 2025 23:53:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEYp-00000002JGs-0m9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 22:38:48 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-551eb58b707so7644413e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 15:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747953525; x=1748558325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=162PHkNGgQO3PjVXfDykPBsa+evqNxguX1rebBysG+k=;
        b=F1UhQYuejGKWBN71OmdjYO17l9SarxKel0zkIysQAV6L8GtdEPL/J2DKFozYT+gL8d
         bqqUlR3/cJ23cYKGKIgKQaqorCFZB/4t2UrKJ945Wo7V6Ql3iiGueZJpzSc8Fx+m2jzd
         Wk8ap3vArZjlH0KLuEH5bS7Ga4mVDkir1FNUNJ6/Kx+xb10Ahk1w/J7CxzWh0zS86ee/
         GA+/XZvaAYvMVuDmYOxZ2LQeYNuy1G0Xtf8dujKFQlAszTbr9MIcP+4I+Kpd6znhalt9
         dHx7UGmH1x35eMnumpYWT139CLjOpAZvrty2LIHVr1A0XuzW/4lExTrr9Y1yE18OuNbX
         fOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953525; x=1748558325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=162PHkNGgQO3PjVXfDykPBsa+evqNxguX1rebBysG+k=;
        b=ZLjaoNEI2kH9aixvSKha4LF22xO77iNTbStwNouPIaNtZKiOiHf+W4fo4T21aQ73iR
         HIvEE7WFTfNjF6DqQDm9DvipWYfQdk8dN52MYXoclHFF5nrbuNCUufwNZjrJsQTWJeAI
         RISkU6wp2SoV6nZ7bEof60RtZYOe2YXYJDRVVLxLVBrmQKMa7pKGYb9EHguP3gRzdLgQ
         pgXyzTKnMAaRGZGk86WQQY3SSC+JC1NlJOBZpCktX1uM9fdRRRIz+8MwtYVKrBd8rSop
         u0/Lo9V0etPQh8A1oOHzeEVPJYaY9uYZXlYhqRvq4jWrj68ve3iWvRY3dtnktpJORqxa
         120g==
X-Forwarded-Encrypted: i=1; AJvYcCXw441XGim02MZ2WTDlIP++wOLCXQ9xASa0Y+o6NthKuplkymiis2W1kEjCkOCkovL/SwRTuE1Di1f+1KhRY7c6@lists.infradead.org
X-Gm-Message-State: AOJu0YzifT2kynn5pu/Vnlmm3MJF7mcjLeDsY9VBHTmHdRnDoL/Jsjcf
	n1ejKMjHiwUpjVq9TZb7UYKGMhhOR1RcuUepikMYqQSbdI9iVjem5fw6EZnG6ZA4kCw=
X-Gm-Gg: ASbGncsWgfiflJymMjl9AazlUpyGBcXRzT7jk9/Y9PfMudCszxwy2LIrx7YHnwEyG0z
	Lu+zCZ8Bffp//Yqu8X4Da5P7kFDiC6JzTc8+BKeL/lu1+efhQP9hWX0om2TjvOpuSz9bhAdIdeP
	bCP1mGwLHGzD3b7UHuVTaGfzR+EajkFNuoycx6UWXq2WJISssJFtSenR0JJySryc10wWMHRLij3
	zj1LvPNfHIB9C8kaE/YSeEkOzb9qRTljcwL6+d2Tf/iAXKnRP3Im4hh0LVejzmeBnA5A5DAWsOf
	BNttuYasMjq+bR14N7DfIM9O6ZRGJqA96uenNH1H06ipRf2uVzecdf2V0ONCVxyl8nAgpfNo7/G
	NYujK3sOaHNndJLSlijF1QVhz3Q==
X-Google-Smtp-Source: AGHT+IHpKvG7QTF5JMFQRfjxHS1e4Hh60oqpoUmBhfN3NuDv06qvqDXaNXWN+vdIaPYvt1ahDgUnfA==
X-Received: by 2002:a05:6512:22d4:b0:550:f012:966 with SMTP id 2adb3069b0e04-550f0120ce6mr5060108e87.39.1747953524641;
        Thu, 22 May 2025 15:38:44 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c78sm33932571fa.36.2025.05.22.15.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:38:44 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.15-rc8
Date: Fri, 23 May 2025 00:38:43 +0200
Message-ID: <20250522223843.171621-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_153847_233823_98CFBEBA 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi Linus,

Here's a PR with a couple of pmdomain fixes intended for v6.15-rc8. Details
about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.15-rc3

for you to fetch changes up to 0f5757667ec0aaf2456c3b76fcf0c6c3ea3591fe:

  pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id() (2025-05-08 13:29:30 +0200)

----------------------------------------------------------------
pmdomain core:
 - Fix error checking in genpd_dev_pm_attach_by_id()

pmdomain providers:
 - renesas: Remove obsolete nullify checks for rcar domains

----------------------------------------------------------------
Dan Carpenter (1):
      pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()

Geert Uytterhoeven (1):
      pmdomain: renesas: rcar: Remove obsolete nullify checks

 drivers/pmdomain/core.c                   | 2 +-
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 5 -----
 drivers/pmdomain/renesas/rcar-sysc.c      | 5 -----
 3 files changed, 1 insertion(+), 11 deletions(-)

