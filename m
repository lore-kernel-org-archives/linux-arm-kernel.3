Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 00:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=; b=sDuoWnSzU+kG6PeqOpF/FTXt8t
	Fwrkk85jzj6CftaeOnSh6hreMP7yzduNm3a+9G0tzl6Unv31+5EZG7rTtFTs71iq/TuvFmmkloDWe
	oZpCyUhP/KRbxI52WzGq4lz9EzOtb3HZCl/XZZd1u0n2F98nESTowptkSp3/o8Hvhm3tx8fkHgw30
	tnQuSMSv186OwBNDc4/23Fgghy2QiW4wpT5tEz9xTCauUNQP2Lk7UM+0659jhIn492fDXrOQMvvVj
	W4YdQ49KMkCmm8IPs4i14YkcgxxSDGxDvRgenaYiOuuhB7LrBbVulHKo9nblweKNpoHBU2fR7DETf
	QTKuN+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRR4-00000005mCk-200E;
	Fri, 03 Jul 2026 00:07:14 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRR2-00000005mCP-2K9o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 00:07:13 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e663c828dso726185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037231; x=1783642031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=rscLpSf0ZE2F2gKI78VQJMPXxTwlnQU2pA1FLZaJnJHaPqb+O1FUn2jCHREdVurWs2
         xFxLpTmQFgb+yFdJVO6ijs/eUcJ/pNKsm6iNsTuUsuTeu/zxzenwsA3ZMaGT3ViY0l9P
         8yT8NvO7GCPVFpx8b6tMdxFNXQNQoHr426Z+aEbbWNXGWB57EJR+mo1V9EJ2+mzcW0O5
         R/hs1hk/DSSBq3bz0zJ/w/snBIc/59BHtH/5J0Bu383F4ZVwiLehYThmKg1kNqPo4IbF
         NtcMm7jPLYXbVUTjbBdPzLk3cK9bDkdsKYYFc/dd1Yw0C1MBgQeJGvnG4Qu/Ue09Dpgg
         tYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037231; x=1783642031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=Oo+fdQJHNpgDCJdx9pjI38C9+vC9o+0jWQFEqFVCVDczfuhMltZil2/hf+FpV0PTMW
         vKbGZ4HlRMvJdKSCfSdMdnAjKwlQx5T/wuGj6r4sw4+b15raSkUUkjVSAoL1fV4Y4P5r
         Ki8K4AhlIEJ42HYt+B00RiNk9xrS3etZTvgRr5OAXJxmkQ8EV9g2dISyUQg3TZpnkYPv
         bK/+BUlhNOEWHtfLkEVT5nYQC01sTV3NEt/DZjh6q4I+5+RhYSTV6+HbeNfW0kPe62TI
         5lwKRwrMytqnAuOI0x8s/ofnyr5kpOptYSx0iNLea9/A6CYvRzXtCTi08ClKUcyTHhKC
         IENA==
X-Forwarded-Encrypted: i=1; AFNElJ9WKsVIi1c0/YcPPDSoJvAA7x7T9mO7Ni7rxUlz88m3uC/XNNLQWINfyQ4+/1lMLwz52dd1muDvyYFkashSPVtS@lists.infradead.org
X-Gm-Message-State: AOJu0YwTyfFK56XmIZRAHdoKKZ0BH6M3O6Il7RyZYnp4ua6pHcIcr89q
	UHpdqns04TgYaRSdW5WnyWUTEmcglexZayE1FjLy2gCvDCyNU24OwCwx
X-Gm-Gg: AfdE7clwwx7mY1WPzsmNkapkbadhdUiXmBOoW36wiP52NQRmc9kMA5OWq9xttSDLAT9
	oQVFQfo0rdbHRcDwiwEsT56IkhNJcCdDCdClShlcv4KiCsP1bFB3/2TVwa6pR4IcwTrhQSRH+m7
	eRHaH4Vog6NPpX4uRDZucB4+GZ4leYvvdsLPp7j2zI+qOP62MNBAmHwHbclpnOGBeu1r4ZB29nm
	amI6hFYkaxLaHw3TCnBk3QL2aBJr/bV1sNCM2PZKSK0XoaxQ6WEx9YcwjU1muegKK2RKj3+j7VK
	fYS2y28tL/okVPxOzvu0D09NTPQCpGCdjucJFqzRiieO8ehlWhEVRQmsnc6o0pWBDASOPr2kamG
	TW+D6rZnxfzUQzEAsC9tCs7I+/oZGEgI0t2r7yo0TgFhjU3oVMFl3cNlHBcLMejOlZGkQHvflsp
	IgolM/7Hc5qyBLKqyPMzat4N48SKQs7+UfZ1KDgHM8XeatOSYnZ+hpmgSW7lyG
X-Received: by 2002:a05:620a:4044:b0:92e:650f:c392 with SMTP id af79cd13be357-92e8b275355mr264263485a.17.1783037231297;
        Thu, 02 Jul 2026 17:07:11 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cbd6c9sm12190085a.33.2026.07.02.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:07:10 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Yangtao Li <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu,  2 Jul 2026 20:07:08 -0400
Message-ID: <20260703000708.1238530-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_170712_596597_23CBA2A5 
X-CRM114-Status: GOOD (  10.04  )
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

Hi Andre,

In case it helps when you next spin this series: these patches have
been part of my local A733 boot stack on a Radxa Cubie A7S for a
while now. UART console, MMC, LEDs and USB all sit on top of them
here and I have seen no problems attributable to the pinctrl driver.
Happy to turn around tests on real hardware whenever a v2 shows up,
or to run anything specific in the meantime.

Testing here is AI-assisted (Claude Code).

Thanks,
Enzo

