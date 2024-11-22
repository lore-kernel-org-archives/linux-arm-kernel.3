Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A735D75E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kECXJ3tt3b+Rzl33FyQosajYwVB2nbctS6FkdLVf9NE=; b=4M1XbmwHN4p1H8nqvNIXSxa8uv
	Tb9GXCxKczeDm2K8b/V779tqPEkrm8tLvB9RdEOkfkprKT6b+3fm1//rYJq9XSWVgU9oOq/zepKxz
	RegeXmttZ3Y+Tm10N+mfEduRNoo+3FngxkyqWoryIUhHFGuOKPK5mYlJDFha6Oam3GdUQiRSq46OM
	3ya+B2Zfz7sYX0H/IzfzatELnM12knk/NFSZidCO3kXixqjllUbhOtgA7EhB6ezYNNnqktZjUKh/3
	PzAbFa1N2ekJ7zVGbKrReCnpHB3Z5Gb5GnOpOL9Fmc38hDlcwQ39nSIGA74dKGrlRsN8yR5ZHX7MW
	Lj+0FNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tETwH-00000002YPt-2ks5;
	Fri, 22 Nov 2024 13:43:13 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tETvK-00000002YHM-0nit
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 13:42:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so2453031e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 05:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282931; x=1732887731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kECXJ3tt3b+Rzl33FyQosajYwVB2nbctS6FkdLVf9NE=;
        b=F+MrUQfDyeWelj8/4xTbneWVoBqItaip/IsFjd6sfocotwjUpzAMrKMxbNPDjcMkhL
         nd+NQntglR9sBBWSJU4Yem3TRTWJb9MRzVgHcYiDwJhy/EqKor/hXWa3c9fJqjnivOwz
         gMIoJhutGmSP/9FzRB0q0G8MfsCOKlKk5K8I3NTukJvPT2iWL8zxH1dkFyqoISzIt2M/
         gJ9Zeh2nxFK9mTjW47OcogLpe0WLxbU7U/Uvr48EJM9ZJau+ghD1v91Pgl/yEjFitRl5
         H5z4EGVugtpN1xWTo+dogBXyFspsKTbK1L2WkC90fymn2xHrTa/qQwbTsY+YyNAKYtvk
         6seA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282931; x=1732887731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kECXJ3tt3b+Rzl33FyQosajYwVB2nbctS6FkdLVf9NE=;
        b=TTaEivLwqzGH3cb+HKBfLYz3UaGHEWITZUF46WXE4ltB53MUKniy1sxx6UPwMVUzwn
         sEgtqCYnxqEoIHNJm5Wnby4Bpp7jkbahskIejOtpP+TUZucqXzAM3neFGriQI7Jclmpk
         leLQy5ev9zjqyC/ZboaopmXSdvcE/+oBpjrhhmxwh2ZXfbl3zTsnXhIFxAYJfXh5wZFI
         IzrUECkeQF/LmcTbS5UmcwJgxRCE6vaVvx7tR1F5YnW3bOTcOnqVBvEBeiQwGL02BV4X
         ei1Yq6pgFgXolTuaJYlPlYU31XRNZF5tIfI1nfOngCzgW3PngjY3dwFemO/7cAb7OcL2
         B8Bw==
X-Forwarded-Encrypted: i=1; AJvYcCViDUU7/HGt6IHT0WgXm4rR16kM6hfVdAbyZv0UjY1JvLp6D2ilWQvgCVuxryxxOMG5/68bNthUB9/y3UyKSvCU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0+dGBJRTc/HVGSq08ihPi65mIQdL6/xPI++0ALPaBJnBU0m7C
	t+Fsg+tbb24Az85/ELqdCevZ6SsvmKxjOwYsjjDOqveE64xMIq8x8iGDg+kF18U=
X-Gm-Gg: ASbGncsTqpPYt3u7JJEd5g+YL1yEHrEtVxchrFXEgfBb1/Nsuh3evUe9wXHhDz2U03a
	vzFCjZf/e9l/Aze+QiLcMtes+rj97mynW0lU+3t5T3S7V9aPhrXSPr2vcAIWAAt8/4gW2rzuJwF
	MH/CCqHbxO8fGib89GTaswAycu3a0LoN++HCVHCXxDNOX17PZOp9Tq4Enb1LyjX+Iyypa1Yhlhe
	AGN5lc6K66Vs7SFs++JVGSzXjwugU4Bw0x/n1QrxvxaWOxBeuuUX8OzV6xRPwrlrTDfN1Ezi4GY
	F7F4kMtDDDpXsq819ke1fFoM
X-Google-Smtp-Source: AGHT+IGlUj819yfU1NglS9myUqpv0uFLKQ7u9TuPUIL1bbAcBAmi8sjSJvBKcWX+TVn+XB5jFJ905w==
X-Received: by 2002:a05:6512:3d22:b0:539:ed36:eb8f with SMTP id 2adb3069b0e04-53dd36a1498mr1694046e87.24.1732282931567;
        Fri, 22 Nov 2024 05:42:11 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2481e73sm376432e87.120.2024.11.22.05.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:42:11 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pmdomain: core: Fix a couple of memory-leaks
Date: Fri, 22 Nov 2024 14:42:01 +0100
Message-ID: <20241122134207.157283-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_054214_254169_3C37560C 
X-CRM114-Status: UNSURE (   7.55  )
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

More information as available in the commit messages.

Ulf Hansson (2):
  pmdomain: core: Add missing put_device()
  pmdomain: core: Fix error path in pm_genpd_init() when ida alloc fails

 drivers/pmdomain/core.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
2.43.0


