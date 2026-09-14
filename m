Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B29C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=; b=pEH1Wzg3l7ZrNc0tLMDZt9V5qP
	DgvY7Chs3XDz6HRCInu5RM0mwUUF0WdpUmtpO7lYVbB/aJvbve4FZa/FIn1t0r9hAU97oUOTmBW7M
	tQ5yhesWtdojorHquhmsmxcGeFPwBcXfpPTtCo0ijrme10yxw0iBnKTwJTeEob88HdPqt0kl5cF7L
	C0BGJC1om0/eEo/m2l0UCg1IAILnizPXbvXmt5dVIlunbiZoZRLs5evAKLsXRAlz2pdACv2SAWdkc
	7lGQX6yL4W1i9kBkCi9jTCTw23QIhp1ymoSfFdEvxX6PkiQQGLMs8L7w5Y0HF4XPb+g5ogoKMkqRw
	8sfNx9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65yR-00000003aqf-0DBN;
	Mon, 14 Sep 2026 12:39:51 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65yO-00000003apw-2hoq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:39:49 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso19005255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389586; x=1789994386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=N9SSkecekyfMXoROWJZigaIvsLgLX8gWAKLKtk0W0CXJGRUd0um8zi9n6murU+PXVt
         E8ct2yjwlWvtT1cG3J0+otQ40Xc5YDCcuDNI/3OdhbGUgxFGCdxjHT8thl6+PP+HUJQN
         yeXk6WkGX7pCQessUC+K5AFDSWyzwoB2YsCo3bnToGSgNsjyyOODeyAmBsSCdmurbKx2
         xZeWe410yjkHT014JVDeLqEx03nVJa/ktEEgM4bgAMMJf/BI7+r26MzZ0VXmV/Wwzc5a
         Ws/Vvz1IaXZme2EMcbgFa4HKDmg152nVImARVLKgrDZYEoVZowvuINiM/GPpFKRtxuSF
         +Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389586; x=1789994386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=YvmTS5Ekmhx3X/Tv2I5K0V9w6qowFH5yQFi3qi/frQnKdHI7NuPJ3IHQr88RtHjzpt
         2Odm4B8gQCBTLFchn8DBREdzPhckUhZpdTMB/LtR4AbT7+6gfDKryHjkTIMh9CdKDsi8
         a1fqDdUpohj98QN5YONSadCxRmBzsiHFz+Et4Kck7u80+Whgrp1zXL4yIHrduaveuz1e
         9RigRjLxbaeJyC2EuVzFCkJCp2QOWGimIzlzTb9dnmKqpAXe0sfRG2ow/VhYZ7N0uoCI
         C3MwpYpTkX8ED0f2gngaGlEQZyU6l1tyzqg9+l02JWTBvmnTdeXGrCR8t6S8YKzSU5OS
         lukQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX+fZHo70G6JiVq169DsFu/aKPUd07+znmNPdl0qf60eSlZqkz7h9SIMcXMzGRyg0eHb2YKKtlyltHO5hgMUHS@lists.infradead.org
X-Gm-Message-State: AFuF++mbjz3W4SYMbl1cykVnLLjTYGWwWCseLgNuJOxB+yzrNri1Nmgk
	IfB/IDzcB8E4x7LuNB2/GN6hSImBnDYrnlLVPdONroxrya97AAIZ3D86
X-Gm-Gg: AYBFou3nklB5ufW/51IFtn/UWNLxapp3/xqnIGuZxJfed/e59/BI7OXOVN4rrXCMfI4
	ZL7kE5H3J1WjLHaXpQ2kavzHOZ0B1BBBcAoI/ypIgJdMl7EribJ+J1j0FZwywbk5/kybsysSMFY
	Tmx3rpn8TNdzjumvMfLBQuMG7M6WV3AzxvMQQtlIfZSWYPAt42UwjfIW5KnKCHRNkAzkZQkWApz
	KaPitJZFXFihwexLPZnzKMmaqvUTKvvIvsx9djT7njiNWUMtVIPciCmCkBnwrh/8X7TNyCyQsDM
	ljP/m91xgV0qjQ7/iKd3CMc3EArEvV1JwOTyITLStfzyOpvFzvSW1zouM01oAUne1YgcA9svjFg
	xZn7fk6CNbEHJ15iDu/4g1UYtvQY3b/Kl5lCqSN+YmI1DWv3m+p+x2NT8CQU+/OEBNISN7czHHy
	hqHjmirbt8Ff2AcHiVE3aedKgpKxdqG6bFa4C2zoSGCejiHWXRaqzANRJXoODLN/huPjOMleGRt
	HJ7
X-Received: by 2002:a05:600c:4f41:b0:49d:38:afce with SMTP id 5b1f17b1804b1-49e7a6868c0mr31405635e9.22.1789389586006;
        Mon, 14 Sep 2026 05:39:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm26035194f8f.26.2026.09.14.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:39:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Mon, 14 Sep 2026 14:39:44 +0200
Message-ID: <20260914123944.149806-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_053948_688878_9F8612C6 
X-CRM114-Status: GOOD (  13.18  )
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

On 2026-09-14 Linus Walleij wrote:
> This looks like something I could apply separately from the rest,
> can I just queue this patch in the pinctrl tree?

Thanks for the reviews. If it is all the same to you, I would keep the
three together until v6 has been looked at; gpio-mmio depends on this
patch to get correct answers on Vybrid, so I would rather not have it
land ahead of the rest. v6 goes out this week with Haibo's comments
addressed and a small pinctrl patch for the CONFIG_PINCTRL=n stubs
added. Once that is settled, this patch can go through your tree and the
gpio patches through Bartosz's in the same cycle.

Best regards,
Mehmet

