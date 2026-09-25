Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC50C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=; b=Uh6vHyaOQWDFHn+381D8PFKmmd
	eXjbbe+VDc19BPZdb+LnjMiYnf4lVh2SZl+6XndzC9arTlAz+PRQiyJnD3XtMmOdelWar9htwvlwz
	YeWurGbUSEZjTMk20PUSOy4C502bxgLt9CCEk2Auc6ngANmYhZ8cdqEYDvEFksIe6h+Hz2yc2qvdv
	DmrcxuHLRvXFg2sw46U+gX/ySr4Dg9YkMsqmwdTf5MjayoZEy12CqORlBbRTzVNkgIkO+M6CQjdYT
	wzoMau84CgoUPFkGygkm0JB1V8h7OPCdVFge8QeKijWmzk/CZj7KJ6mQY2j1UlqPCYK1BJW2KW58C
	gfcJCeOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6qP-0000000DZOT-1Z68;
	Fri, 25 Sep 2026 14:24:09 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6qN-0000000DZNk-0Flr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:24:08 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ec6188so4091105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790346246; x=1790951046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=;
        b=Ho6cMfC7dhp1rQ+h4v+1olLNoJ85jIPyJ/YozX0QHy7ITvNxt99zo/1JjCdxN68ZsB
         QARZb/2VK7FyOKtn8hizpBUzenAxjTTKrK+SSLXwG+RQPf3o4MHz5spQDjcAmFUVuG7V
         9g+eJBgz1XQ67uiWFDOtvuKyZW0jRCPNZ5MOwAl7Gh/X7m20PQMet91qiyTphUgOEmnP
         +BWvv7Yol62H/OSr9e1/OVm/YnVZ5/a8cQqX4BVvbPeghfgK2hrFJXEEC6MLuuU0LAmg
         lc/i9CHMABXDHiSar6MqVa8Q1vUT+bNNrstWsZ6EuvJhxVmvnOL0fngfoeOBNPvm0uTt
         SQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346246; x=1790951046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0I0TIKEyiasgHy1ngA6HhdOkD8Gr+np1P2q8hO6FMM=;
        b=Ml2dwda6+2I9GhVWZYI26ruRo4BDMk/HmZofQnjbww//ZlZlVzgC042A+5lz2nPxY0
         j61CqtQ9dWefNZGYjvtpBzj0luo6KWC2rEUjjE1zwMamDrmSI3/pE84ubfLqPU5eYDqI
         yjtFUxID57OkpU8RaJkUIQjaL2Q9grMrmmVUqfk7DH2uY6KY48zL/IMlQHIJaA8Qo4az
         9Cm2gtSBpWCX15NL/Y8FEOQmWpQlFAYX/NKMjhHklVMy/FuLEZmQX5G3+nvxETcnDhqN
         c+792iwMchEy/fmCwBv7n6/GnSVn/nGSyp0nMccEoA07ij6BQ0Ow04tLSiFUhIDaOis5
         As7A==
X-Forwarded-Encrypted: i=1; AKwUvBznM5a1oEGXRfyvtNuWLLKj0rCFqky6MjbsYlHeiMpF/nCOA9ERY/DbZVVlRe6fP/IS/adjQCdhSLBTBEYbVI77@lists.infradead.org
X-Gm-Message-State: AFuF++ntgV4mGpEzw9vndAum/siatF/8msQzK2ue/ItVd4IeKbWf0fOU
	PLdKE0YRXxBgSS9bQ4ppIHh3b7VJg163fb5DT7iGZOKx/54rg/VKwAdb
X-Gm-Gg: AYBFou04CHcC2/gLftoQ0RT9OKr61onW0SToD0Ul2UUxHw8ZsSDt0TrW0QWiB3VhEHF
	2yZa0mWjIgOT2ndfU+gBU/IGviLHet2y6jKjZzlUM+da62YdFt5EyORNBhdeq1Gs7OpetE5LDdJ
	xHzb2xPFc0kNwqVAeO1DkO5NNGMOPPFynMGfkgSPs5D9Lv7trDTMiunQPbFPpwl+ydvEZLa8ESp
	WGgJP5io7FEBU0oQ4rCEX0ZkX52b0AdXebLzYylxiHJJXWhVERSFYlLkw3Vf4NaxGW2Q/ZZiF6a
	b3IlwiGCorZn/N7QozOWiHgEeffQWg61GJ1hrcGlCfytKIPsSzukMvWlnbeckv/98XR9UJaNjyD
	QasUt31iKi6Dwakg15iNzq0/Jk3KwIDsK8owKW8zEmCJY7H7ibMtFpmMpypOGh/M6JTjeJZYikS
	whLGGmjycMF3iXB1pcwTkMBrdYPW8VGrMBH9g3Vl42iKzinM8WpyV1UaVsjjttvuXoo5h4d29s+
	eAuuCC4pFJ2
X-Received: by 2002:a17:902:d481:b0:2dd:b83b:fe1e with SMTP id d9443c01a7336-2df7de9309fmr49802315ad.22.1790346241220;
        Fri, 25 Sep 2026 07:24:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e032bsm11754115ad.27.2026.09.25.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:24:00 -0700 (PDT)
Date: Fri, 25 Sep 2026 07:23:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"freddy.hsin" <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] watchdog: mediatek: Apply the driver's mode to a
 watchdog left running
Message-ID: <559c625b-8191-439b-b613-d35afe24c4b1@roeck-us.net>
References: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072407_165500_9EE7A460 
X-CRM114-Status: GOOD (  13.93  )
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

On Wed, Sep 23, 2026 at 10:10:41PM -0500, Ryan Brue wrote:
> When the bootloader leaves the watchdog enabled, probe only marks it
> running and sets the timeout, so WDT_MODE keeps whatever the bootloader
> wrote. The Amazon Fire HD 10 (2017) bootloader leaves dual mode with the
> bark IRQ enabled, and no pretimeout is configured, so each timeout only
> raises the IRQ and restarts the count: with the 20 s timeout systemd
> sets, a hung system was reset after 37.95-39.76 s, and after 18.25-20.92 s
> once IRQ_EN was cleared by hand.
> 
> Program the mode as mtk_wdt_start() does, which also applies
> mediatek,disable-extrst and mediatek,reset-by-toprgu to a running
> watchdog; read those two properties first.
> 
> Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---

Applied.

Thanks,
Guenter

