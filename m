Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A50C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=; b=1M43JBh225ubxrlBu3acGLY5P5
	tWLV2L4LXrFtxcL64Mm9r9WRXZ9tn2FiFtpoKHbHwekqu0EQPwnpdH5qKERrlpVykoQlwX+lcMwKs
	Fb5zWULeB3r1KRfhsxejRDaUBpfWr1TI+njyYJ3+ff1TtLahAtDR2rhvd262MC5cwGj6a5V7SUsq3
	BjOKzs6oM1kvf9SaBXVt5iSRhm2fsh2lFA01Clio+oK57uVnBcFyj3bwoPtLnwuVnqi73Td7T3cHq
	qzkLUBcACLZhhVj3RQ6mipgYgj7gTmCayPuJhwxag2Uls/BombvaxIjz7du9FWHtAFqh5LPBadj1h
	znyzx+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMyt-00000003bxm-1VhR;
	Fri, 09 May 2025 12:37:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLWk-00000003NAk-38Bf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:04:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so12510915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788665; x=1747393465; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=;
        b=q8/nO7r08csdMJlhau5sGskZk2IgnPIA/uuGqBQ/FSf841DDMRfr7CNzM+SqKe5cWU
         VSZzMjD3/fi+XF+/fVQ75UzWU5C6zdcgv/W4TSnLTFq4Phy0XIlxy52UQQ0ep2oIQIOr
         qIRkzwhRBFBzYSRi+z/1d5mXrpFeEHxO0F2oXjXd4fzkmBI9p0mANtUhPZMPY4gtSAEc
         bhnsgkDRWts6G6L1zYwNwhEIinxg9/s+PwO/qD5x89eE4obnWFSffdEiBnH0wt+VeXpi
         cPXDr0BnqgQ2MB6ZRVu5lAD2a3u0aLoRqPhDbrkQWsjp6As3gi+khLGmCWjU4lFWHfKm
         yuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788665; x=1747393465;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yJCNV9ygDRNtqgzkE30hTda74O4Y8KfcrRRQ3zGk4A=;
        b=QcovcGcHxtSk3FotqNaLFveyt7GeCQUABC7k3s2dbY4x3AsI3reRaKy1/Zd97d8Z8P
         5e0dgtYFbUzI52g8ShpHZdaeC6DZdXPw16C0GYOHwb1zrPtDa5yTf6xxvfHOBNAX5H+L
         wd2bRE+74vUfpBgWChiQ6cUpbjAC9dz85yaPxQkhx6XEfjzHAApZG/G4mRy8lRX9e7mV
         x3O6+x637PiGb1MQa8EDKjab/CzH6IlbJzaaEr0wd/0zO4eZuma7HpQ3tB42foG1EqDn
         b8otOCrKeXuN819bpdZvdzTqLanW0VQAGwBqbAgDVttaKru8BpW0lMoBU97n7gYXoBmD
         u1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUYYpOeQuxZmJ7R9QtjoZ7XEOYGTrShHPKoxn5UEH73/d3srFzQxjeMIhD5sjiYaIo/fuJdFSL1kbQDa3rz9ZcR@lists.infradead.org
X-Gm-Message-State: AOJu0YxlgNmETNpLrRxf22Vn3upFplW/mZV4GMwZl8RkD33E74GyRBGm
	miVCapbY12eNPd48TEQy4n27IdD/cmbi+bFzKUL5aiHsC9+HtKqoI1/gtoKs7Nc=
X-Gm-Gg: ASbGncsaDBgZ2F4BqE2v36H0ABRcsY6wRCJY3kXx1i+Sd7aqc3Y+BB2s1EVHW08o7N/
	pvJissBD7+r0HWSupdSjBw70DdmA6Mg64rJqW0LjBWsI/LRblADZO6eTFsfT5zUQXhzxoy1YJ7Q
	PFBct7MfQ/ZhJAVD1YZ8e2aQ9OMyK0W5NHFNXpIN2NUQivYC054S6UrdKgSE7APit35emzWJiWn
	dlXLYtg/nMJCHelBOizRj9bg/H/sWTeMnTVJowe/LvDTauKufgErF6UERLhmIIFyYw5/i2LAPr5
	Y/x4QlqM2GqqGj7GJnWGw4ctisfJ+EZJQqoJwc2AbKjSsw==
X-Google-Smtp-Source: AGHT+IFw8W+AkGKpeFKjDzyDOm27ntxoNpUsFE65aEkWAInoVy+JgWVEmUmGVOr2GtLsFyJO7gfMIQ==
X-Received: by 2002:a05:600c:8205:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442d6d98a88mr23417245e9.5.1746788663606;
        Fri, 09 May 2025 04:04:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d68585d1sm25970195e9.31.2025.05.09.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:04:23 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] memory: stm32_omm: Fix error handling bugs
Message-ID: <cover.1746781081.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040426_792850_58A66C96 
X-CRM114-Status: UNSURE (   8.30  )
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

These are a couple bugs which were detected using the Smatch static
checker.

Dan Carpenter (2):
  memory: stm32_omm: Fix error handling in stm32_omm_configure()
  memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()

 drivers/memory/stm32_omm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.47.2


