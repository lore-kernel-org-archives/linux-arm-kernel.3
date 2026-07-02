Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925E0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1eeHpCHy2amylD5gAFQ/G5VWDnH0phiGEsKBXqG2BM=; b=zsGONH2y8JHw1U8SARPO5vbdtf
	+cR13USbwHwioMSFNCxmZdjUotSXr4NyPj1Z7kY0eW0SR2X5M4pVyjctZ7b8/wyXDc6XlCayK8AGk
	QF5WfhF+wPxD7HVXdhnTe+COFAq8bHC5Kt+zZ7XoeJUJ049shl42xRSqS5SYySM/IEL655LxuixxA
	q/YERDRc0mTqpNtAa8MAJoSquFT/qBjeSx40wayOaqd7jleZ6SEJZhW4ak0Zb2isJ03R5jRMc29ih
	AoxTl89T5hgmZkrFdiBhu3b7pxfxRNxQ1ySstoRydKePyfp8gFZDnBi49mpHicZv7OXl7ZEsrHLZb
	KjLi20tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLKU-000000059Uk-2h0P;
	Thu, 02 Jul 2026 17:36:02 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLKS-000000059Tc-0V8T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:36:01 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-381065a7a03so519398a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013759; x=1783618559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1eeHpCHy2amylD5gAFQ/G5VWDnH0phiGEsKBXqG2BM=;
        b=NHp5tBs0EZCq9gzYdqPxxQObSp4EYHWUqmTjN+LAWTa0MBsYQY0ricT66AeGE8yS6d
         i7zxmxi/bA+BGQM3sLEvHqNAYOvO5CHykLJi6EEkO90ACo02XfeILY1AVTuQWU6IkPhd
         PYDlZoYivaeYYDpZnhLQUEI1MxLeZVpI/whe/Ntj8u/zWzmKbpig6yEWBg91fO1CeDdN
         AWRRHxTV4kViWRafuUObT902Nh3CPqyNb54EazCe7nplLy90npkJEYyThRjwbJkNhxlY
         NC3TZJFekUfwsQfJA1w1FRlTw20VIJqumso5mLXGk3J8skkvvUkQ+Sb7zMSbckSGY3Q6
         NHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013759; x=1783618559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1eeHpCHy2amylD5gAFQ/G5VWDnH0phiGEsKBXqG2BM=;
        b=W2xhW58PRLssZimZvOjDinOjvqEHdfq+T9E9PRgqLMHmzqIbPVsRaVWH5tN0gKTOa3
         Kjdh6dbMujr0DgPBQm8gX5Qs/9jWtcm+bB7pNcin5zdFqjb789H+7yS45Giu+4DuCzwr
         4lRgArU7G2OAdq5nBIeA02XL2gLaOke2gvy9MWiwkTGKn2/vXWzfQsLQR+u4OFk6buMd
         pOPr6lv0Sq0ZzuZcqrUeDQ/rMUYTHI+qFw9u9BIwO+UVrNHgpobuKPGGq+slwDTDlpwF
         yCqdVlDW8rJekc7AOSbjoqoZeoKA1AXXsA3ffJVc6lS8+QTo52ruAB54rX9WEwh7vwsE
         NowQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqz+K+0WVyM21WUHMDQBvMFOm9QVJVlEsN4BRoEm0Q52LoiexHWYFmZLX5TzB2DdAkM3gCU9+fKwJRoAtZ/0FgN@lists.infradead.org
X-Gm-Message-State: AOJu0YzuHcjombkZ2IY285z1cHPAZJyIrt5YydJUWiUtCSPwykByPdCi
	Y3x4rFasAt0V9txCk9yHRh4GbjHUR8/VjB2wqi0SPnJIIwKelovmCfL5rFAfti8j
X-Gm-Gg: AfdE7cn8cPVWbB6wzk66H4bgV3x/m3EBYYA18Ad8wFy+xB89BRqABq91NXpmuspcNXG
	3ZxjVo1OspqYFnqfmKmVrkU1XOZU2trmE1JkTg7ZNXfv8efzMJqi6TGaMykgTzafMcyyFboCRvx
	P75AIHkVMJbB4cKovobbxeLaYwDtSaophWTHeOxQAW3n21+vMPZvM33i6gJ0qVoC1lS4zkwBUNc
	sXjn6YNBqCF5+oHgRxdKJjRh9L4PafsW3G89055tVHP+ijd9GY6gFpe21PGzv3q2iaoJpD7Y8cf
	YWIyWTWcIMh7XiCsP9wdCrVRBGwhxMCr2GyqvWVCo+H17RGJta82O66haEixrWnkwiURWKekvcw
	A8C6YZ83cdBqxcvWctb8yOqvHdgYgGdaa/lXo76Aoz7gQIZEagT2whyh41Ba00GCU6NE8rQ42ip
	J62vrkRCsp4OdGlw8QR3MkGDNenaAk5hZp7K9QPA1LWXTVd8MTJlmVVhU=
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr7412581a91.13.1783013758621;
        Thu, 02 Jul 2026 10:35:58 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.201.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm10870313eec.8.2026.07.02.10.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:35:58 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Thu,  2 Jul 2026 17:35:50 +0000
Message-ID: <20260702173550.10779-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103600_159359_A8A4AF59 
X-CRM114-Status: UNSURE (   6.30  )
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

Hi Andrew,

Thanks for your consistent support and guidance.
I learned a lot from you.
Much Appreciated.

Thanks,
Karthikeyan

