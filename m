Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E95C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqbeODdYQEEftgsPxXsYkF97yhYGAJosPirzjv//pFQ=; b=F4ZdGoDPpiNejk/Vk6Bm910itb
	qdv/CkwlcMpj/ecnHv7hQKcI8x10BTP5d9mD9RW9yJ5t5Wu5Kxfb1wRwAiRl+y2TC0IGS64N1bs+U
	4NrJjj10W+Q+rSWmO6tkwGxhRfuqTS9X41I3kGVQdWiqQ1QDZRyXqfyPuHYD7b7I78xgZBcjPcGK8
	l4r0QoOzcDKO9dYMqYg1lIQEiPD/dlk7p072V5SxlQBoQoAmaIu3qOAAPOPKOHuVCZ/x9hJ9vOCon
	QzdJV4Pt6W4d86hI20wcxkraEq2CxZW5mzJ8UhLSVmHxmWZJINQNQbZR+u8GUJrFaUx/RevV9NdM3
	aK/rNmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ph4-00000009GJX-18wd;
	Wed, 16 Sep 2026 13:28:58 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ph0-00000009GIh-3kbj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:28:56 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49fbc3db5fbso139645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565333; x=1790170133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqbeODdYQEEftgsPxXsYkF97yhYGAJosPirzjv//pFQ=;
        b=iZ7ygLsCSNJexHvSk6quL72jXCskCMMpP2leItgIBjZBXKmzclR8NFFsLpMjrbaptn
         doz4GkuHkzRq0zMHmdFErloLFj3Yb3G1xsh2NK6WTNY5aKmQ3rqOtslBP+efAoq0+YTW
         LUT9tSYQGAKHqIt3X9N3BwwlSJQ3RepVvkC27El4ILZxuB7xt95OD6uJQnKcEQQOhH6E
         pfETO30+R65sBGKIn9KO8z/DneoDJWNNogMw2UYYxcOj5wIerwm7odAsM4R48HTcG2KV
         /jT75buwH3Ey6bzCPxg+vwHlXd27dCeMotcgVZznJT6fZ+/ZPoHecOAKx/HQs1NRC4G1
         /NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565333; x=1790170133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqbeODdYQEEftgsPxXsYkF97yhYGAJosPirzjv//pFQ=;
        b=HyVvp3zrGBgduKv7EAhJO5aXIdnApaMvxBC9xwJ2AwsKujv2A0oklE+tEmcgQjS2JC
         YuvcSj+xfKQnWu48x2T9jP/Jt/8VfVcEf19EZZoQ/pOUOTZCDQkFiC9rP7/RJGU2BpAB
         58+KXx/cJFGGMINs7yHoXlvzsi4JGDCdoA8ZTmvOarthSiCiyXTws9ZORCOVmqU2U9m9
         XLde2CPfSG1976B4qlxBLkku0x2DEJtvJGdM/A9L8SNDWER/avG7J/m5lr7fmUv+4AkJ
         tdnFCwo/PVRKjkdNCwAPSemPmZ4bE0EXUuq09Q9+JB7X2xBFNGrZQUSo5ygxCfmJ4bGc
         2wog==
X-Forwarded-Encrypted: i=1; AKwUvBzt92WTjJJtkTfbmDk5UvamIw3FRnsryWEaDcMaBZIyFieH86gBGVLB/RcUKVi0k8ianbDS6xv/AlmvXaq9igiV@lists.infradead.org
X-Gm-Message-State: AFuF++nYyI9E9+ydbj9vp7ExR4qyaIjBOnueyrEB9pqGPFhiQeGnYw0v
	p9jSjoQKgZPhQbxnw653FkEnt+wjFFVbgNieqQo9PCGLP2gBxGCRBVaK
X-Gm-Gg: AYBFou0FohkJU335BxGjYPP+HBcMrqHrfb3rO3jeS52HA0PHfZFnTudom3SE3ollfnJ
	mcJWX/IXZG+6mtZPWLnSw9eJctep3O25M4aIulucb3r83qC7L3AS89llWp5T55zFhnnrSzXfYnu
	gjrp7nxRka/QrtBy+YguYP+wH24lBWdCjpLvXpb8OtAEeOiscndmsBaE1siK7tOigABj9C5tmLr
	TXLIzfhN3ExNeeJAqWpp2jWLggzhFzcCwZz01pHsv5nJ5nUYC/vmJOBi2qfcLdRj1mHk+4OdiCX
	HGpx6GCtKn0cYZ/eJmUies9Qtiw5bD0uS9r79B5suschGfq9yatMxjOl5+hcUKF7WBZo2AHNDaf
	kIyW9MLxKynC53aAy9nu4XMUCtp3IaeCw9zIYRX1PDI3hNAAYrO8XN+xj35/91GO7DgYClXiFac
	jkvkWvqovLPpQsw29mbmiGlhr3z9ApE1on8v+DWXzb3TG+oQOoAS/B9nRJTB6K2gFybTLi6KO1e
	WX5aMYdBHjIzm1MuHbDmFgOlAlvAoGDf+v7MuZTgdImpRJqTSYk5dbdl+VzyjmMuWKf7DwekDDT
	b30=
X-Received: by 2002:a05:600c:4e89:b0:49e:745d:5768 with SMTP id 5b1f17b1804b1-49eac4112e9mr27160505e9.0.1789565332521;
        Wed, 16 Sep 2026 06:28:52 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E02001A623C292D45A2B3.dsl.pool.telekom.hu. [2001:4c4e:1b8e:200:1a62:3c29:2d45:a2b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847da0cdsm594135e9.2.2026.09.16.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:28:52 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Oded Gabbay <ogabbay@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v13 03/14] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed, 16 Sep 2026 15:28:24 +0200
Message-ID: <20260916132824.13527-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915104328.45901-4-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com> <20260915104328.45901-4-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_062854_949471_082DE324 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Jiaxing,

Thanks for flagging the job_lock change in the cover. I re-ran the
same protocol today on v13 as posted, 2+3 and 2+3+4, three runs each,
same board, base and config as on 12 September (JOB_TIMEOUT_MS=2,
PROVE_LOCKING, DEBUG_ATOMIC_SLEEP): 73 induced resets with nothing
from the driver beyond the timeout message itself, no MMU faults, no
lockdep report or warning, and lockdep still armed at the end on both
kernels. Of the 126 inferences scored, 118 matched the CPU reference
within 1 on all 48 channels, and 8 missed on all 48 with the channels
the scorer prints reading 0x80; in the two runs traced with the
kprobe, those 5 results sit exactly where the 5 -ECANCELED completions
do.

The limits are those of my 12 September mail (all resets on core 0,
one client), plus one more: the model is a single 1x1 convolution,
which Mesa submits as a one-task job (one completion interrupt per
good inference), so hw_submit() never ran from the IRQ thread, which
the race you describe needs. So this shows the lock adds no lockdep
report or hang on this path, not that it closes the race. On that
basis the tag stands for the v13 form of 3/14, with the same comment:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2

If 4/14 changes shape in v14, I will re-run that arm. The scripts and
the tallies were prepared with an LLM assistant; every number above
was counted from the raw files of each run (scorer output, kernel and
serial logs, kprobe trace), not from the scripts' summaries.

Regards,
Igor

