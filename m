Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A8C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=; b=rK2EHlnHcPbt2Hm/CGI9C1t+Ta
	0Xb4IRfMNwMV/ubHmzIeHVDBQ4PcnoK90OeERzjHXYuKMEQrajtJL59wkuLXVzGn8wOHU5OJzO8j1
	B2Z8qDpRtIWxjz+cmfU2SijzVMX7cDiIRJjLT0nit4gDwGEDPFEmiQGRFCKC1okapai8C1Jyuh+bw
	tC0wU87sfBEazPlMiP5w6kioc/Av7AaWV3jqcx2bWMF58qMY/KjYpfQcz4+R1lOsq59bDFf9Y4FzX
	DnFOB6CtzKHX7/EQoOp2I4mCrT9cthaBQDfMLYJHqY/HPtzdd+yP1KiSAPDerzgknLRz4u5vqGJbj
	sp1AvJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmasl-0000000CU38-3A5t;
	Wed, 22 Jul 2026 17:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmask-0000000CU2i-1amF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 17:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=; b=iaCWCYNNHHfbkCQTzstuXyPC5M
	vpNKJjQ0WkaMBHsHt7yLbxbhGnmb4cfZPQVWee1GfaEJgaIoufPfeFW71NX+/qL+BbBaSdit5HqYs
	547KMzaXj5yKmgWk4WKQ+McSzOaTVKv5ZBe/RP3bPhINK68X2lhQ6p9BZN9ohNqayJXb7ojmOD6ZP
	rFbRwTvaM7Lg48YCx6qiPccWz7zSZJiHuRolUvW5pFcv+rnF58DlIR/X61ZI5M5qQuZNAc3VORBrG
	B35EJJma1O272b0NOuk3kwKruvgaQdfC4lvAp9KJ0ghWzOvKh00kJWc8tc+WMuXrsR4eiZJleZglk
	9W0gBISg==;
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmash-000000015Ay-2XOU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:37:21 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-907ae240ac3so13623136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741837; x=1785346637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
        b=f1rwlm1dr/nzmSJyL15nUYJULi6Lpg7d2mLG+zfLlDBEzZ9RLsKT/N92xhnCyPPla1
         mqdpMICceKVCs0qMl1HpZCP7SDSubiGwN0tpONYe7rcvR7wCTp3C74tLZeBKmVBjm9JF
         eXjouf71fCR/s9zrZOhHnHcQ4OXtzeQLOfLMGyKzmjk1K45Zp9eDnFUlMNIIBCPNJsSD
         I7+/dDGNswhT6eRyfbQ0MooWw39N+G7bo4tuS61jpkgoRza/d9hPnBkVCjlSvk+wrq2t
         HotYduB43JWsHS8tlF4VOwzG9RvCyn8MuCnt7cCssjI+3TGFUC8RrixaPQzAXvvfI0NE
         PwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741837; x=1785346637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
        b=mO7NJqPjSXotQbyRyIm0826QQgFzZyMPoGO/Qr9vnlxuUsUGpFi71LGzYJLUNC27+V
         JmDNLLM4RM0SIFeehLlAwGQZ2vCLkMGu2wb/6SSyA+kNPdvHrEBB+TgjNZWJXvxzfZu4
         p9V08yJ5C9jH48+FTp+5zZELZnZtx0i4DicmIvAXL4yfwcGRcGHHCGhE3hnNA1q3eTp1
         YQm5bjCgfyXd6vAps/dm1X5DMQeD3pOL4yAS8rjuSOJzUY+QPuo6jS+iHiQrlWT18Ps4
         xhqMe5fH2ZrM99f+J5isYpXyk/zF3qKY6dVlz21YBloyo/B766DvFGZB3DxQBNKrMHkP
         sHVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps8tWUkCWL25sy5BzcKxWyThu3j5BdusFYn+pud5+CWR5ffsmC21Q+soo9u0ZXj3omhl/zgISaTFfMMgKG6sG6@lists.infradead.org
X-Gm-Message-State: AOJu0YxWEnKN6QjhuHtzex8H7Nx/sgoWyCdis/SLQ2wuxuguNr3jhXnU
	OxM/YNDH5xLZEbFVnj1XUmkUt0gYwvb4JuMW9+zgFyHdFclpYJo2sJPy
X-Gm-Gg: AR+sD11uVZHOMMxmMpJ5ULo0DNRKrQhIJqEM/xsbGf6yb2YDFFY0/bE+R7MMq0299yE
	FwwfOLYWDPO1/Fij5sC68Edo4ols7yUr5Tupq7S7kLfXMXlQOENjf5UOvgwM+WLBgIA5dgfuYhF
	dSDRFyaSVJ/5kVSozqR2tvK6TjXhlj8erh07eSmWLSc2Z6UR3ZPPykC/FnzlHLrC8TC9+XtIm+j
	OJSbqX947U0vFfzoGB9D2Cb8HWhnkqNQC+p5hRmrF5sa1tlN/K0GxPVqE32jrvK7B8XTsBcBoe5
	dFD5fpjh5UyC4Ce0SNTJt9MzLEoh1hj4q1/lDPm6mpZPz9kLW/Af37PTDInCW/plNax2S1vuU4s
	QKUqmMPaobFtSSC6Q2LZboBsrCFUBsC5sSE0HXwbeT6MkCkXiQv1n56ojEavlCPGhZ1wcfuTDnI
	FrXYlHQIMHikIcTu5YhqOd5tSY+sSufasVqv+ZsoOBi9rXgyeuNSYPvg==
X-Received: by 2002:a05:6214:e81:b0:8f0:275e:8b3a with SMTP id 6a1803df08f44-907783cdb5fmr251226006d6.48.1784741836919;
        Wed, 22 Jul 2026 10:37:16 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b3e96sm26521476d6.1.2026.07.22.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:37:16 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Date: Wed, 22 Jul 2026 13:37:14 -0400
Message-ID: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com> <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183719_768363_80D0C900 
X-CRM114-Status: UNSURE (   7.53  )
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

Hi Andre, Chen-Yu,

Correct, this was not tested on hardware; it was build-tested only.

Thanks for the review. Chen-Yu's point is right: these one-divider clocks
should use the single-divider clock class, which already supports
CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will be
no v2.

This analysis was done with AI assistance and each finding was checked
against the cited sources.

Regards,
Enzo

