Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16323CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=; b=fbeMfilR1vEG79iCItYVf4AFEM
	eiBdLKadZdF2+A87lm8ACvPFBuEKLI0BXCGOWDMVOPCwSlYj0KlAZKPO2JsP9fKYRGHQEIJEuDAdk
	0MN18K2XQlR7LKHH8vDdkm4d46RRWZdo3Wjw7UF5e98bwwxY0TY1xigriFiCAEghYgpO/R0zh9OHO
	85E6h2KxbGUKu6FqHVzGk3+6GOMzZoRfpQmkl+v1sreOm4sLH6FUKM7pNiLfymP0pBHgkM/5tQKGt
	Beb5Yfnd6XEsodB1qNg3nFkRVKxJP00VsWNFRiQVNImzHVQlecuH4N+JoX03a3WYVdX0M8o2uYakQ
	LsXGte0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS9U-00000002bHw-35rF;
	Tue, 29 Sep 2026 07:21:24 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS9J-00000002bCl-0hwF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:21:14 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso651119a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666472; x=1791271272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=;
        b=jEfpxO4No0742JDM35MsZdftWsVVYU+m6/qNz5K6ylytTx5mDj81Fma7nJAljUc5+5
         CRfecSxAP9PR90JoY1NSRUxlVRseX1A20grfneyRw83UWMZTyx8gmJUghWs0zSZzueIN
         FQuiiF51iADHhE1lusGV4WdJwHKKtGvFeRsrLqLwqt8gKeELbYUdkYLUYHcKSgKdcPaX
         zMg7t1qT5vgDuXFszBOS23r3eJT0jGH0R1y+f3M3AZ55gMn9hL8KMcQuZ3HO1EZ5NAT4
         YeSOwg3oN0w/kd+zxIm8qkgYcy9at4/IuaBHsYiNfA/yGnVEtS7WQVF1R24YdiEMORm0
         rqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666472; x=1791271272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJVHdovO8wYi2ya3zic+FBCx84rgCtsdjBQID1blqec=;
        b=0RhGConhWudL0TknvyhNnA1navM8PY9PtB8Bd9o/XTfLxr7vUpfm0/uZjwnJueef2n
         4NN+rKfeouO7hb7x4cIcUbjyya/Sd2EsiczJDZ8JAkDzg+TLT1p9mR+tO8CYGHHvaSOA
         gYla5D9WZ3TverDpjmVgYCf+nrmXXkYPCI4opwKRbCzDPdYr27CH/4cMBvL5d68aMaCw
         WzzeK/w9Y7X2hYdwJNbbc0CXDylAlfFbo+x7Wqd5MfYMNa7FEnXC2i4JEbd+1Zi2VkNB
         3CwLrO0LLwVp8ws3+yJndGBezao9j8MMMDfvpYysn+h+mLIae2bhD/1eG0EndUEILJYj
         C75Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHT7XAMTaVsgBsH3/fb2oMXdeJRvWmK9JmrxX+C4Wg3E3KJrbLJBPx/UV+nFEVPlniqsoBVypDazdc2XYzwgYC@lists.infradead.org
X-Gm-Message-State: AFq9FYJDcqyWrbeIlKqlYwNmP1TcYkQZzeNL+7ZAsPx7ZHty5it9RA3D
	CNHpPbcafyq04g24Gcmr0UrhV2QqKpAUZMMVTj7CXQ6X9iI1871OoYD0
X-Gm-Gg: AYBFou2QkNBjoZY2t01Bgk4IsD5dSwDbRzR8hNRNt/teQCr/mlV1jBeH2ZT5k3Ftg1o
	Te5rAv6osl37vm0HM9iZ9/mw0KdgqOXWOxWVqYne+ET6mOXdV/Hhb5FA7jiEQ7ak4aCiE2xBv2T
	r6nmge7k4wPD2miDtirrMVj2+aUBotN/u1eaUzWV9bOSUtnhF1r4pOrrNSQtbMQ6LDs+uB4ZVLt
	33Dz8h2IQP7fYVrSKNRByYFiALR/Mtj4moS7y4cNk04GdPWl7hja3M04LFnE8yGQTN58vpxSljw
	Tl4WeYo2QQLUHp73uwtVPiIxG7wDbcrCK4oJLyoguLslcXeIS2T/hV4+MCY24J/5WlXQCKfrfu0
	k6w/Cbul+50+26PAEWrPLpB0ACnMRBAgpgb+2N5Ldo6/SHnRu5vvDgGe7VXCnjuJkzVSRRF3woF
	PV0+G1Ai9dsptjA4kSL21AONva2QgSDboycu87KeVlYi7eRGNJAW+FazxIQxJkYP2Eo9E/SAF0p
	ST9ULOh90cuB+QVJ3N2OF34QgzYveSfVFjprggZ8DLCcU80yNqsj3Zx+CnfaY0=
X-Received: by 2002:a17:90b:17c3:b0:3a0:bfaf:2ae with SMTP id 98e67ed59e1d1-3a0bfaf039bmr9440530a91.43.1790666472157;
        Tue, 29 Sep 2026 00:21:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm3833931a91.7.2026.09.29.00.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:21:11 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Tue, 29 Sep 2026 15:21:05 +0800
Message-ID: <20260929072106.175202-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_002113_232826_D09261DC 
X-CRM114-Status: UNSURE (   8.90  )
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

The MA35D1 ADC clock divider register implements a simple closed-form
relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
by building a clk_div_table with one entry per possible divider value
(up to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
set_rate(), and drop the unused mask_bit mechanism, whose only call site
passed a bitmask instead of a bit index, causing an out-of-range BIT()
shift.

Joey Lu (1):
  clk: nuvoton: ma35d1-divider: use direct formula instead of divider
    table

 drivers/clk/nuvoton/clk-ma35d1-divider.c | 73 +++++++++++-------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 36 insertions(+), 41 deletions(-)

-- 
2.43.0


