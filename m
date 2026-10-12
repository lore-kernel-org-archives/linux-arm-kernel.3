Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50F7CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=; b=haFxKjxqQGPay9V54mM5EXu1sO
	aAfLZEDmlOU/xJIgJah8SurWXLgutloEQP2I6rz9LiN+4oCnSIdLjwD7OEKujfiWjitdmbdcxMcCf
	7nbvaLM9DqcBWVgf4KrE+jG155lNK7A12glkIAm+5rS63M8ZOy+8E1H8e+V2famiv4174PxmizN4i
	Xzhp8XTpPZAqbq/hmFKTWYly6njobAWL5nUFp5nO1AnzY+KSNMhdOLTQZtPFTWVj3BD82NHCRlvo5
	UPRpWnXOm4UWQ9wwuYYD+q7gfVDTGFGGRLV6MblstBHMpuhYFa7Rs8Ujo7OJWJCwtWbg3qvPdIVfl
	o20W2vOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGZo-0000000AcxX-1oL9;
	Mon, 12 Oct 2026 14:00:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGZl-0000000AcxB-1jUH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:00:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so15677835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791813623; x=1792418423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=;
        b=l48j/h4qbwXSB5RSQR+poXwPhSZSyX5L9cuacURiIYtrnhezaGYhqgEkGlXV6L2gfx
         5ru7oaI/KQHTfvafcJZOs2jpH8FvsnxLaqHlazIEDii7GMC7xKuh8veXuyqrgiVJ+UNn
         GkHGVJ1vIhLuMXAiKjA/f6SsKUmejZwaNRxZPaQ5t+WPBLNNr9BzdFHXRhqtQJ7+77Lg
         gLUWOssARNBoMrDpaYioWqpGURJcNYdrHk6ccCpyDgOZrplx5ryTDL9F7cIy7WAY/+Q4
         cXPpre3Qd6HIBM2R6RtEeuchX6zoMPmRN/bP8PEskz5RRUg7l1vseo5kLn3heVWO/AZP
         VVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813623; x=1792418423;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=;
        b=0JOfT1AmLC7Dtq19BR+9o1UtUigIDZw9f1Lirt06VYKhG7W4PL01NVWqCEuw9x1BfR
         QLVT/6C+1nwEcKV/BuS4hrynygQQ51dwZHTUy/muqDe2nfW0DknPpjdHokbwf+WmCZXg
         cR3PHiQdZ2v9FEjiFfyJrDbBHoDtcMrSKgrjVpk/zMqVOF2R9M6tINtM3kpjAASBEdiR
         vim9svly71LPQquqP6tlHAfVUoPb+gi2etcvdcebo3+eU+KlIdesLfyqIfUhcU3J32ZB
         IdBKL5PcekQ99qKX5Gu/Ji9PHoVS1y6lVDmpEsmh3ZlodfVzyZxajatMKyhnOQvwqC3r
         oD0w==
X-Forwarded-Encrypted: i=1; AKwUvBzOpVHh+KSsB2LbMUjnvjGXXF+6QZlnQ1WjhSn5UvcR/NEEY0P0J92j2SkZR+QgdyHqVuiz7LugYtJkug3QGqts@lists.infradead.org
X-Gm-Message-State: AFq9FYJRDlGAUd97UPD4N0SqnEbc0vWQ8YE1LRcskaOeMcOIu1FO9i4A
	cG7awS4N4SGPHYHmDjpTNRAl4jU9z7JOHRvdn0ENsa8c2GFUFSVdI5qka5CsDSirSEk=
X-Gm-Gg: AYBFou2tn+GLLzbQZ4i2Id3nTdXF9HO0MBMyxdoHREHUxjUYS60AkstWML2lSm0qdQT
	TvugjPww8ydxsESP2uoBiGB3nS1VRj60NLano5cVg3+n+5RIDnfIG8woQOsb9Y7XGNv3KX1oFNS
	lf+YubhE8CIwC1fRXe0ftETW9rvrymCX51+Kj0XkPfr5WJEnsE29baFd6Z6fKE5scTx8+qzUgnb
	8LCaSPvvQZqG/Ukb88Atg/3eJkkzDSS0p581HaxfwDwGr6btU5YGZWjCbO/Mi+XG/rmFqZw9x6v
	Zs002H2koAE7pLA/4uQvv3qjk4gYRb2WF9nvAN7m1OrIT97rZOLtnD7Uu0DfZCEAXybFsRwMVcD
	PuPlPlXLwXm633TVKM9H+F9IRp/TwflMbW2pO7xUUJY4zkQQm6YbHv8vG4XIL6y0SZDnFxtsiAF
	fi8zp/6bwD1w9RpWI41SsykRrIHZpbcdA591MmFUd11AH/HgGrx8SWkgjlhS3GcfU7mkUjsCGNg
	anudq/OAvHStqN1rw==
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a18e4d55a2mr179206085e9.35.1791813621497;
        Mon, 12 Oct 2026 07:00:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ab981asm20197430f8f.30.2026.10.12.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:00:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 gabriel.fernandez@foss.st.com
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
References: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH] clk: stm32: fix clock array size for STM32MP21
Message-Id: <179181361097.33566.11163084689857836132.b4-ty@b4>
Date: Mon, 12 Oct 2026 16:00:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=186; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aa5DERomGGvC4qLnGZLTEOZG21c+T/FPi1X9gvZMK+c=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnnn/a9NpW/ihXqd0BQdk/jza5dC680t825+WcdZfjt
 KSurgu83FHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJKE9kZFijtTo89LBn7NeG
 3pPeBScT+vqqkr6F229zO/r80GTe2FpGhn5urf3rMkKSGfcaP9r8Ze/FWpc9tyc92Lk0e53QOrv
 j31kB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_070025_464322_9F7D7BDA 
X-CRM114-Status: UNSURE (   5.03  )
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

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: stm32: fix clock array size for STM32MP21
      https://git.kernel.org/clk/linux/c/57e9b2c11056

Best regards,
--
Jerome


