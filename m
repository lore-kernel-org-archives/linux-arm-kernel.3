Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6012606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O4DssJxV;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cT5lrhgr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=; b=O4DssJxVXhJtvQ
	D7tmC9nADHKAnxwLEt3t22GKAhQh+NVp2lcqVS/vn7er9Roif5VorDCI5a/XXUJ4u4AWR08Ps84oz
	lYkkfwBELAm0D+Uv0UQhBxQVYj/l0PW6uB6MTkIxzT2NkQi+2MpwlwSJ4y5zWlCGTPxIhRc63NBKs
	KWhaVQPiyXe7KTOWYoZkcQ2OPl1QwO//OATYP6djXB+giMS+1C6DOtzGyzeM5gxcpgVknWLSPrmGy
	5Tz8rJbG0NW0fk9ybIevmT5c06KlhnpgGnQfe9oU2y6d0jYhSbI5WE1K5EgcCXvYtjjyEoM+eGqin
	mkGgbk809MvyI6umarIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1bv-0000000A0gl-37VG;
	Thu, 05 Nov 2026 17:50:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1br-0000000A0ei-0GQV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:50:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so21255405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901045; x=1794505845; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=cT5lrhgrdQvD6/f1fBVB5d1v6P3unBgap6oVilGKqxEQwPI8KFLzuGjlNGo0x4Z4Rn
         tt82efkTqFpuzdy/oRo+TIfHFjqg+qqFN6LszsxNWhIpvVPy9zZ5GemwF1N/GLcj6jKW
         o5veuwbw69lybBmSx9Rsr9JXmCXZfyZgsStZxhZBMnkSce7JcET3arXywG99NuzuUySO
         ZKaQWq6Dls/wvlhn5jX7wew5G0TxJvKeqVC4qn9VJinzdw9go2R/MhBr2bIWTlbgFeVd
         CBrEYViES0xLcDsWyQPq02O9TSszqyYSjG474otg7RFyVovIqrvV5VqORAoGGroyf4HR
         M1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901045; x=1794505845;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=GgAQ7cY9MJM5cE3kI2jwDAii/nMQl2Du+Gpe0XRtAIBarcyLXFMsGBMRo6E4TuCso7
         R0phpuREPFZ2RdVsnH2ah0XMHwXfNOaNMkZCxmaKqJ5Nmw0+bKGl80T2wdQyUtSbz/UI
         n6ym7RFXCGXlUJYGkM1MSbFKLo2qLrGmv6JN+hhz4fmr4o2hE8W6+p+gwMmYkqZNhh2v
         50dld3v2z7BRieIyEuJOjLYzVPS30uK1fDJiTJtCormMqH28pWn0Oj5rUxnpRtdHLQvH
         htM2qZqv0XQlt1XDyfEr7I4/DCFcSxkkqxT7vn65cou1rwgq9Bb8tDc3hj2HVwFPHVff
         Iq9g==
X-Forwarded-Encrypted: i=1; AKwUvByIEW3ooUeeUxZ2quwTRVmRar0nF5yTZOEOyxRU7RnW9dMAWL4fUDbXQRYT2hLzp5D/i/Ep53HDVmgl7C4vOZq/@lists.infradead.org
X-Gm-Message-State: APuU4Z9UwGZZ1dPn3CXuVcbtkqo+O7tLnPtfPlCHB2RDgljPuisW+6UT
	lWjuQr2vVaGIq0oAu1BDlZrmh5wqcXwkZ3pRuAezHjQFZL0K+QbYRKmtAceEL3rPq2A=
X-Gm-Gg: AYBFou2LVY74alR1XAXEsLGK1/WbowhzjuKcR2prTO+WrwVC2xvVML3VtdNrxhnXq3O
	pPCrsGgn4y/yX8OBecHrtUK/W3pKiRzOe/yRj6YEltv1fNSppEiLN/8GEcJC0Uj9E+tN4024ZRX
	NTCrqr8+/utxYYAznic9F5S7MNE1FMapKN0OZvZDtjjswXOX8MpZWfebb52OeV4EMSvcLlw5FAx
	F2jyReZwyBtQctFbYuRoZCsToMCnc8BQAdrKV6SbZdZzHASTzkFqP5L+bsVEjXbFyrhkuYV4/dn
	YUouaG+R7rdPG5RWuaWZ3p5bWN4m422msyCLkHkvY2uzbHUOaZEdboUiUKYfPWcMqrjKEIozuGC
	hKoVl44HpVnXrVHvTkdgDFfvLVqF0UGVQT9ZnL3voBJDsWmkL3IeEBgLEWcgzkCF7sFAWfjwLJx
	aMU4xGuSCl1yRdbiy3Y7iRzwA0mGUytwKp7slfZ2rbYpiwczKY0NdQQ+6NdyyG0p9DlDIDZtLiB
	LeVyev9xfkjT0TOf2Y/4Ok43PM1sNsCG8qF4JlnOB1t61OKU+vy1Gaamz1HdGPA/104bXI93b7s
	xAMzZrqfzpX0B3RESCrmYI43rz0F5/6y1eM6Apk+BdYlVHwz
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr390804805e9.16.1793901045109;
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200497845e9.3.2026.11.05.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as
 a divider clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104084.2573818.1569105668888286892.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RepJ4XPfeKmVot5v9YpoyqtS578offaAhAsWd1iXvqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn5uK2lTkH16raHEndtv5saPH5IMuqqOZpy7sclwE
 0/l/tmlHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI37mMDJtFdLed2ra09Lmo
 zrWDh2rO+B1+Oq+XJTNH61xGbjJDpBTD/3TGS63HFoWsmzpr67XN+jMYOd2f1k7Z+adJdorCzW3
 tiewA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_095047_123655_B77A158C 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
> 
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
> 
> The pre-divider is not intended to be dynamically adjusted. Each PLL
> has a fixed N value as part of its configuration. Most PLLs use N = 1,
> while a few special cases use N = 3 to satisfy their PLL input frequency
> constraints. Modeling the pre-divider as a separate divider clock
> removes PLL-specific handling and simplifies the PLL framework.

s/framework/driver

-- 
Jerome


