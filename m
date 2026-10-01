Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1461CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=; b=a58w8FDHQ42WXOq5sA7Z3noEe5
	lpSanmLjl/lNa+2uOMNvBzsaQ7N1PpizlTPH3ax5lF/NHvd0uC1k+9uEyfvbJe7YC49eSh67Qk4Vf
	jcwZE6g3YahCdHdWX0hzpUp6UBVmKexuxe2wtyJ8vkc0vUwvcSK3CbSi+mOuk2EG9Nqxs/Ups9tTt
	KKxhn7GtPmjpUOsonCTFAbw8H/0UW8xYSa+4FiyJ2Xo7jL5NIFF6C2IekpUuB24F6Slt31I/oZeKH
	DayEtF6EypxeygFtFGZTFiufpC4ACcYb07FG1rSNzh4bu21WFFY1PYpQS0G7SP9Qwga0Y5jjvzea0
	PNT0WpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDTg-00000008ROE-0Yrj;
	Thu, 01 Oct 2026 09:53:24 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDTc-00000008RNf-3L6K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:53:22 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so38779345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790848399; x=1791453199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=;
        b=FZmkYjFguH7LzzRJ5PnApj8WMm936hOpJ/yYnlpfqogyoyXEwkKuDsh13ZPGUkYvR9
         CnaJmVh4my+/VgPXbeJurVKNXVkfsacrUrmhihQ3n6bmeAgIIygvbwvFj/6g9bXeUX8u
         lUTGW6aQIJz+YFjbdbHE1YdP8BKbB38EAX+OLHVUAW2i5D1s4jg8JKQ9XV1DKCPkGVGP
         /Wxmj8HFTakYE2UJU2RMKAAx7lVejSrUc8s97HJNaRTIuHPelbs/YxQOKJohG4dy3r7n
         cAAXXIaKSzaBULkyXMuGfucABHbj80aAbnOFTD0w/Hq6yxyrNHz6YIG+8AOipltQNIjY
         u2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848399; x=1791453199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=;
        b=tfykXPNeRo9GhwpHM0Jd7bR5YSB6r8jQRrvhwsJzo3Il7LP7xdEzVqqc5f+1bGSoX2
         okWkmlTR7kKv1Qyvb2P4xp/ya2IYh3rFYoL0VgbGO3w69+xe/0AI5psHl9DD387bLCPO
         GEo4DQ0lw9KIjOC06J6KceMro2fH1UReA3V+wGr8FCvGbMqwWzRhkWjLeQzYMgkWfRlO
         o0RGmG42Gra1sJaH1RNXDuIRtAMDtj8ZyQ3/o63sOgKt7dJiMlyg4JRmtU9KLN3t3WMN
         Zpp1KypjeiTbGgUsucmaPPyFfVBM9KQyy94N2zzLyZ7M4BbLNcCffSJqrNd96pjrW7tY
         NNqg==
X-Forwarded-Encrypted: i=1; AKwUvBxwosARsLH62HLoQnlWfJ+b1m2FgYsmlUd6UPRi9bioBx4PXxRqj48ef8l9HMvhBNUbmmpiMdekyyUjyAGrz6/o@lists.infradead.org
X-Gm-Message-State: AFuF++m/oYRdlulrfUrDRiVysy0BahyrS4waCVc1whujs4RtWzTk7ber
	UUtSqoMm2fVolD5Q7Lk0SHXFcABeAGhPMo3Cn3I5fTWSbkdIRj1/U7QTRDS2/+/DB/8=
X-Gm-Gg: AYBFou33PCI/pc/PwCLBNz2z4QcrzdENalqsd7W+UNEeKi5/UM5VIwskjP/SoY9isNz
	InEDCDXsdat4gXD5y4rB54KtsetRp86jHuRUSg6KppCZ5+5aIdsaj5lewB2X3f3Jr8tFZ84tZmI
	0/LEP+4COr+5fd7fZbOW54h0A4s2KtZdEnA85J6m+7DEbW3fKpK8LaClzDODr2rYr0wvx0woM9n
	ITPFhweGPdodOfSsdO8SJ/XMuVBj3thiSzIZGayzm+pCFGjBiC91/DO68J9MmgL/LABWN5twqOt
	VAM9eN0Pt+ci0LzRx6/iOnoD9+K+QVDiN0Oh+nTsQNKZnkI1uKOIsHcybW+L2ie4Rx6DVfJlc/3
	unRAYT39X/4jhdkpAed90NLkE1+FO26thtupusgh1LFv2cvi3iZ04jYhIszQ/rYGKVQ23xm+QJ5
	FrVzj432PUqRsXOC4+rHxCU6S6XQJ2mET/2idd50l600IurWX6uO5KVzGo92NCCLfHHRm1BpVbT
	U5qHs6PZmcEAhTUX2I8/aA8xcBw
X-Received: by 2002:a05:600c:3b23:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a01b119661mr72177145e9.19.1790848399085;
        Thu, 01 Oct 2026 02:53:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9248ccsm41237625e9.3.2026.10.01.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:53:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
Subject: Re: (subset) [PATCH v6 00/12] clk: nuvoton: ma35d1: Fix mux
 parenting and peripheral clock rates
Message-Id: <179084839794.49633.10441853107934842069.b4-ty@b4>
Date: Thu, 01 Oct 2026 11:53:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_025320_857146_D3B9B274 
X-CRM114-Status: UNSURE (   6.26  )
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

[01/12] clk: nuvoton: ma35d1: Keep the clock count in the driver
        commit: 6c8177988fcc07bcdf2991102638b7db80e92bb7
[02/12] dt-bindings: clock: ma35d1: Document the missing crystal inputs
        commit: 2d9a942a7562e3cde3c9de0335147c5faa8d1eaa
[03/12] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
        commit: c8a24538bd57ae545e7b8f9c8eb1c2f19a65a085
[04/12] dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
        commit: a05842820a01081012c3df0db3fabe07e36b163e
[05/12] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
        commit: e9b3fde31626b9c5725856417308598ce1cc8541

Best regards,
--
Jerome


