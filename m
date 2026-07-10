Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A29C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64t7FYB+aOc4n1B7jdfC1HLjfGo79OokY8KIFToWw7M=; b=I94cjIeP5Fgb2tDq1KaR87cHtz
	Mbi2Er4zUsy5LAV7zXL/pZKvxgsqdbCA5lhF+wX3GLMvixrfxtxuc0k1liDYaOrXvNgKMLUBEwEOo
	Acyfg4nsw2UpUELcElfe/qzwhlE1t+J8M22EtkBeOxtWMYg8bFmamvnCqXwCKvMlHsZsuU4AbxxJi
	89qpxP+MfEjiVcoiD0nsbviO7ucnMFymZVqD7+8yvwSau6i5F+VDIW649dUyfjlizLW4LY8FjOsrf
	wtCPxjn0IERP4ls+7dvrc4Pf9AdD51Tz0BLYpEs/D94yAgz2t30F+ohjZGnGSWa7Cmp5Vg2i5Rpv/
	eNtebiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIVB-00000005mIq-0TwM;
	Fri, 10 Jul 2026 21:11:17 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIV8-00000005mHq-3Gyo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:11:16 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so8657475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783717874; x=1784322674; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64t7FYB+aOc4n1B7jdfC1HLjfGo79OokY8KIFToWw7M=;
        b=Mk0SAZ0mLspEz6z5SBtui4QgSB5ykHglgWLwNw8FdAlVAZ0EhlanxmeVX2fLMJS79L
         JgIrnY4rwcJupla2y0FojNzTX2YtwnGzJ3RQMVs2sHVlfrxqkeIvITjEB01NArbRmaxM
         bcIdKnLJ8cdyBxgp/2RLmKtIv8Wy6Ch2UsirfrLluwgb9bkLTu45X8nE6vBs/8Tjz6Pu
         9wilfpmlI9UzqkaxOkZYLUcjFihB/9ha5I2HUbDLPPGpWg05TrshgFbyzrOggSRwj5p3
         doYoCTjnCDx9PvQAhJtw1KOI0/kdu3UZjZI0QX3IYPahHFMtcZazWQ6tATQK12aiyrI3
         gJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717874; x=1784322674;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64t7FYB+aOc4n1B7jdfC1HLjfGo79OokY8KIFToWw7M=;
        b=izRs8bS3knZxqZFHZcuzCzw4Cy9e5xNvnM1N0dpm5Qt9r7mvzhwP7AXk//VsZp9qUL
         C3Yt//amoRWU0qh/1ozKUD1tAxenB5+4lImdmJzRmFyS48vEY2IPc+OWckLm9KrCU0L+
         joL/47Mk0OlU5j0O/JKXl0y1QtbC7M7kD7sRrxJVpTVQqGxks4FOlc/D4IkPzlNPOURM
         BS9aygEOgYnQ1NUnK/+gS2EYdhrUx4iFVrR+7xlMbN+k4pRFwhdyZxX5b2cBtVa4/KKW
         AURFGW4AgS3O57n8W4N2k/VEb8uNMpBE3iOaJfBHyp3ujqMSVt7QVbgbgjxqj/pgBaR9
         Y7tA==
X-Forwarded-Encrypted: i=1; AHgh+RqeDIJtmAJUdjoEjpGlr9gSJ/Fec9MVdrY7NzeqlDfzbuq4ZXd6jz7j1w8UNLXGeO+WBxFayYZcUb4nQ00fFg8M@lists.infradead.org
X-Gm-Message-State: AOJu0YyLzQ2D3L5CxSXJKnpdgeiOvnrXehHQ2hNhV3DdzkkgFMiPHyKy
	8kL6lodq9Malih7CKC05w1MLGlI3J4/C5djAgFR4YiQYbF4gjd6wUwVq5HdJXyqC3OKq1w==
X-Gm-Gg: AfdE7ckMp5ad32PWWv8OMIIZH/gdpOSAKpr2Jo/bUHqeS7guBrGt5nM0fAOWeZtDz3s
	IJBS/jnIUfzxdjie/c+/WHHImAtvWtcx7OyIE5Ga77gvmZPKc969zxLLuOlZczWUuxs53gEPjxV
	0xWKZ5hQ4oyjKoE5FAbKsk5DzGP022ZalEVBEQ+8WuvwxsfqTGe3Azr1+cg5CXOtdkK7mTd2Ppm
	OF8bLJiuVR5aDrJyEYdX6/YdfE85zVsXuMtldD9tzy4A3DPF7QktOorPL7Z5hv2+Uco6ZXpWGsG
	//QD5MIvATMGEvHVzlyFhVw7XTk6bOsp7kp9zoB7dg2PKn5QPlyMvz2TrCiFz39Y6UU+balzOe+
	t6FvOtTe2gfb+fzLlaBNqC4xVIdagXEdL/6Fw8ktnWy+yrJur/p0tj2QrXFzoYpuUyKCIMoqkLM
	HjJicTHWkNMpzDkjnD+XQ1ZFDsLrMyYsbjxsFhFKJlhUmWS65MT4RenwZPHNIVhCpcevG9O+I=
X-Received: by 2002:a17:903:458f:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2ce9e9b4534mr6597835ad.11.1783717873913;
        Fri, 10 Jul 2026 14:11:13 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:f127:785b:6e87:f831])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccdf808379sm52881965ad.48.2026.07.10.14.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:11:13 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/rockchip: implement .flush_iotlb_all
Date: Sat, 11 Jul 2026 09:11:05 +1200
Message-ID: <20260710211105.9782-1-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710111508.917486-1-huhuvmb88@gmail.com>
References: <20260710060513.863714-1-huhuvmb88@gmail.com> <20260710111508.917486-1-huhuvmb88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_141114_821514_58433D83 
X-CRM114-Status: GOOD (  10.19  )
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

On Fri, 10 Jul 2026, Heiko Stübner wrote:
> accel/rocket is in mainline, so I guess the interesting question is, why
> are you expecting your changes to be (stay?) out of tree?

Thanks. I had been treating it as exploratory: single-layer inference runs
on the open stack (rocket + Teflon) on RK3576, but chained inference does
not, and I narrowed the failure to below the software surface
(fixed-function hardware I cannot reach from an open board), so it felt too
unfinished to send.

But you are right that an RFC is the better way to handle it. I will clean
up the RK3576 bring-up (power domains, clocks, IOMMU, DPU/RDMA, DTS) into
an RFC against current mainline and post it, with the chained-task
limitation described honestly. If you can point me at who else is working
on the RK3576 NPU, I would be glad to compare notes.

Thanks,
Jiaxing

