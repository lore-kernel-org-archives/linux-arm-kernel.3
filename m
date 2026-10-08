Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF846CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=; b=boG8SwxEQOvmJ4IjL/xFZrnhuw
	+EwpFLZ0L5SdgHE7YweQVNfLSrwM1olI4BiNqcnafk7FJ6ZQCEc9vgOLarNwI0mzwt6TOhWrVX47F
	SIF+L+q5UsZYjQvKa18MkeXQfQxIsN/Y5gGivpHmvWe0CQTnTZADP61EhaQKy8ZuDpznt3CC2CG8j
	kV6NT7BiBu96xZib6g09h3/Y0LKZghU6FcNekTXrLpX6EvMP0kHWtFNs2LBmjOddPFdaIw0IwTIt9
	jU9z7vLeeb/qnUzoyH3QhzFJAVly1L1Xx4wl7LSYgAwRUPG7/slAd4hmvMg7H8QfJNleqFd8To5tU
	9v2Mvv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhqm-00000003eR8-4AkX;
	Thu, 08 Oct 2026 06:43:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhqk-00000003eQD-0sgH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:43:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e81738d24eso1538945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441809; x=1792046609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=;
        b=B8r1HPDl1fDGfrkSZkmO/PPRwYY4bssaEZNReSjSVxw9LgB3UkkHacH46yLqedUeK6
         FVVNtWIQKcRWrSCgsfuFyYdKNuDW2izHDesc54H5DLBqgZ3aEvpCRfAsdtj8hz5VHfJe
         4z8ylfCg03IGQl+yl0Ugaq5hWpnK8mS/BW5qCqEtNJWuXobZ0E7pFFaZQ4GvSFnPboH5
         Kld4+HVmsN73UwfwVypWCND5D3heFRVGdCmC5rCcvQtRdFGT+l9PISk9oOXnJsBo1Vsz
         diUWOcDntVeSidH+EWsQ6cj9KjLxm336qn6ZiqSjSM7oLjN+dUxvkNBAS6dVt0U7Vi84
         aw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441809; x=1792046609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=;
        b=AMx5hqRgtObzCpkrrzh0F14SLnRE3W/x+im1mLiMNEJaxHT5gg1mUYNOKKR6h7qq+w
         MfQUWT8bT0Hi5rcClWSOBrwa3mhK8rMjnk2ZqfOOA84TjCVTgY88nxHbcTAzUuno5JZK
         PSSjZWMk+QywnIepP1ZfO8PB7SZSc+Nrd4tNGpx5LmkOy41YBMrRCmBRaL1OUN8pBy7u
         tO6XBuP/1Ijtg4iHREa+rrGYwSSODER2ggAe208CRf9ZufiIs5FXjZc7TKr9eXNolNAH
         3tL33XhsyfHbehfshTdrwaQueF9t3K2/sno9X29gTkwEAIntVAqa/WaZueRKGxATFf82
         3Hzg==
X-Forwarded-Encrypted: i=1; AKwUvBxATbE2dq6765OGqdX/ZWJZ1TpdvjCcA6F55+b/W2sLsceW96Kt4gF2tWcbC9yF1g+DV7GZmyPw5FiZ5wHNc5MU@lists.infradead.org
X-Gm-Message-State: AFq9FYLj+0DOpn86Z3JAmJHsWGZxg7m81MB7STxMRAmWevfAO61q9gGv
	hBPRFp1OUIHsGcyJbgvgzx1rs7MoIMaSEZLaW2+vZnAfMg+kJknKnQn+
X-Gm-Gg: AYBFou2rCJ6jCwfn3CltNdTCw6kOIjWHnGeCYPjpA0yUJ9XqTXai65Df9JI0oEO4bFA
	455LRE15R6Z5I/35q1E5fxWBJru77FRL8d/j9K9WOX5cvsmtKKWhB7HDVN3LkEJYkK8b3gB+OqC
	A+scMepG4OKTJYFkDGRSGsex4YptSEeDwp/7srVeZFJE8paklZx4aOWMIklWrKQZALF5EV/0czg
	RWLEorsgGgLnA0aGTsNCWRantnHIbPL4calYumhO6pe0XFEjmNMBnYMBHmKL0PtzUJRBrShtVSS
	Ba3IDT+3pLdyfpxEfjCoZenxlRkiIOPAyxulnZAzwO9+2GeLYBCYtFNkSemM0Ka7IjpOS6HUP8o
	xqUX4KwidhYvF8xocQ4DG8rj3ccwnMBNRW/OBcSfm4DLm82t8lfV6HcLVlZFy+1sHRNGUJNSbrp
	UGV+dvEMRReXxoqZQja4QO6VDZ1ppZq3qIuzc4vS018KN0ceqmhJCfybjm14ahbx35OpPgvcp8X
	NsZ+13r1uK+OWABFKJCrGpeI55xF6cKFrkOe1JbeZ0lZzhKsYF+pclizC0fKtXvBPxmuonCdQ==
X-Received: by 2002:a17:902:ce07:b0:2df:9eb0:761a with SMTP id d9443c01a7336-2e60024af5amr39693995ad.25.1791441808967;
        Wed, 07 Oct 2026 23:43:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046feacdsm19997845ad.18.2026.10.07.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:43:28 -0700 (PDT)
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
Subject: [PATCH v2 0/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Thu,  8 Oct 2026 14:43:06 +0800
Message-ID: <20261008064307.2757324-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234330_249818_5C66AB73 
X-CRM114-Status: GOOD (  13.10  )
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

Changes in v2 (addressing the Sashiko AI review of v1):
- Fix a possible division by zero: 2 * rate in determine_rate() and
  set_rate() could overflow for very large requested rates, making the
  divisor zero. Rates above parent_rate / 2 now short-circuit to a
  divider of 1 before the multiplication.
- Fix the mismatch between determine_rate() and set_rate(): both used
  a ceiling to pick the divider, yet determine_rate() reported a
  closest-rounded rate, so set_rate() could program a different divider
  than the one promised. Both now use closest rounding, as the original
  CLK_DIVIDER_ROUND_CLOSEST code did, via a single shared helper
  (ma35d1_clkdiv_get_val()) that also clamps the divider to its valid
  range.
- Not changed: min_rate/max_rate are not checked in the driver, since
  the clk core already applies them and the previous
  divider_determine_rate() based code did not either.

Joey Lu (1):
  clk: nuvoton: ma35d1-divider: use direct formula instead of divider
    table

 drivers/clk/nuvoton/clk-ma35d1-divider.c | 79 ++++++++++++------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 42 insertions(+), 41 deletions(-)

-- 
2.43.0


