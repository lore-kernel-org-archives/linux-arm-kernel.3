Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47671CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 06:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFhPLMziV1nj+jGf7ankzrrom1xqgWZNFBcno2gpuA4=; b=oixAEzQtDoaS/kpDH+XJ0buSmk
	BdGmWDiIonVUJdsdo3HcSTTuP/BsbDYc0fXrBIgfhID/gSkI/0OnLNqui9QqYULpyMqILiqB8PmBK
	fCwTCKHqo0rrVjYm3WNsbGvOXX9dhCgiv6AKnwXEXPrQoDbrUvoEyy5ylv/n2aPZh5XZCEtFwVXDi
	tmQmJEql+U2EW+X8t2qRPgnmbcwMy55241y8M6RnM6jpEzLWBxHAfPZj3vp3bi6jYAWI8Rye9rS7+
	ZKYJZ0oHgV45lOQqhgk+YZeF7NQUDwgz2bx0i/vmFE+YJIzdmVQWftMKkf7H/BJ5oR57SS2MKSsja
	IXCw92Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK91q-0000000FGCA-3tyy;
	Tue, 05 May 2026 06:13:10 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK91o-0000000FGBZ-1Pte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 06:13:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82faf871346so2978130b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777961587; x=1778566387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFhPLMziV1nj+jGf7ankzrrom1xqgWZNFBcno2gpuA4=;
        b=HYxajxX71qWAmBasdPOIXBlzSqRer2ZNCyZhw4GC+8i3jX0eNmHKTuARbEBP5SzTXh
         K12aRsOYxI2N2Nit8op+IhAY325DssLs7dMciex3uVWbn8I42Ucsr6eQVSIxkESCiavf
         1e0poFlMFVp1TdKDFkhXagFm+QQ9CxGzVwceUWAFPmixlMD9dCM9mbw6jdy78bnggtPc
         cXn/U5kibM3vzjzp1qa7pFFQV/UFerPljohF3aRZreSxApRhWfCD8AEItCcruiOkCdT0
         uhDudTKI/nYb9S8vAPBVQS2UqEHVc2rTSyL99K13hY9cvJw9LWSaNPGGaEF6b4BIsJrQ
         2o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777961587; x=1778566387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nFhPLMziV1nj+jGf7ankzrrom1xqgWZNFBcno2gpuA4=;
        b=s/2m0CHTqBTDboWayo+U5SsP57yDAjgUyrkvEiPMv5dn4qjL15kxapS4x4ys8mAYuu
         V2iSm9a1EqLzhUiiugprxr+u1+LH6IO43/XhTojD6I7Xo2uwF/ocuySkbiqn3gbp+p+u
         yCPjQawca1zyZCBt6m6TmTopTSHkWCjZoftE8hd/vsT87CLmJDTD/dp1QAna2r9e8him
         9dJMC35HKm23+f8csh1SHSRyq3UeW5UmhsVj0URGidX1+lc0ven59AYen+5cy7fWw2sr
         qehOJF59LTGzsKqbCOs5+fDp5e4SOtiDVRPELJ6EQSdIfeUN5WinqHu9jcJBO6aXUGpA
         bUjg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZWGy5SS5BMMrv8aLCF2DariVneudEdSG8LTaBtEPanIDZ3nmLTDFyBw+IVZVsW8zUkPH0YAm2H2ahv5FGPAY+@lists.infradead.org
X-Gm-Message-State: AOJu0YzsyiZBCbTrHXYQ6N4qzwMlemYm8+YblY12D1SABoEbCuRR8OES
	v0VKcMzCO27PeOQQ2O94cd03WDtjlSHFC3Lc6nGrMA/Ys2/5r9VC0oZj
X-Gm-Gg: AeBDietDVVw8KDHJFUJuMUHlEGIQXmG30xczJ591XoJ07XWs6C8oF6E7zVmna6wbXj/
	wDuI92UOEaEzD8LLFAjF4S1n9VAum+cB5xtBrNhjK5uZWWD9u+NFK0Tm5P99ZTMfFoQwuNG3nZK
	AAdajNMJOhoCrJyqk6P9KptulP3XWO4vvMYZCQKAsgxfIKtoe1gP7xEz2Uhy7l4YPkwqEXqNeY1
	d4AWlF/YT4j3gaQCa8VpuP6XzkVa3WuDCUsdKwmKiL0197O7s9j3/fGy2NZZ1YT1N3KplnvDdXv
	lemXjcE5gRsONq3JPIe9DP7Mh8/NCOkzAqUa7P/LL2VrVlzoxETTdx/UyNhixGqa1/04hQgq7r8
	t0CxcPsPsYdF7jGqxG5SRPf+oLj3l4Wapdn3S3miaWVfdeQcsl3fFN/kw6C5R9TPLgnQN0VfBsD
	winaKfYCaqPekij7qnSXsRV0HwVHdBPGsMOjCtD3YW8lv9xRlPAjDrLMO5QKL6qM+HZq1fzW1v
X-Received: by 2002:a05:6a00:3e27:b0:82f:8b20:9165 with SMTP id d2e1a72fcca58-839249b0ea9mr1813305b3a.44.1777961586687;
        Mon, 04 May 2026 23:13:06 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm1070558b3a.40.2026.05.04.23.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 23:13:06 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH net] i2c: sun6i-p2wi: fix of_node reference leak in probe
Date: Tue,  5 May 2026 11:42:22 +0530
Message-Id: <20260505061222.319845-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260504164750.5eb6c55a@kernel.org>
References: <20260504164750.5eb6c55a@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_231308_379691_E18CCC29 
X-CRM114-Status: UNSURE (   8.13  )
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

On Mon, 4 May 2026 16:47:50 -0700 Jakub Kicinski wrote:
> This is obviously not something that should go via the networking tree

Yeah, sorry - mis-routed this. Wrong recipient list on my end,
please ignore. The i2c patch is already on linux-i2c.

Shitalkumar

