Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F27C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=; b=1P+zfpMLl8rO4O8+FvuJDL8Z5E
	eitNKOuwLGTx5x9RKqF+QHXSRfq5knCbZtyqI0iK2TqPWePwtASs6XrBcHWCS28noFH6bOieXD1Bc
	cjDS5RZMaDeuKa0eijQmsJ1fpl1t1sXiJeMmQKDJJIeWpMzQ2Pqlt8f+HV699NHFLPsisidGXPIPo
	TXBm6u78O2o98YdQSpjmZENCRgeL0cMsz4SZtQTuNNHLuYskD7zeCoR+GmEVG02xZd82VEy2zSguC
	03DJRCpRCk5snoPuvEZ9yxGyFDwws3rLKN1DHi9i806a7KHyiz8/4PtJfCvfA+/BGUdXW73LAM30f
	xF/wxY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagZ-0000000CSIh-38JC;
	Wed, 22 Jul 2026 17:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagN-0000000CSC8-2uzd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 17:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=; b=bicjNWjIjhGxVxiVK3vSmUmiNo
	twxxQEU65L8IhpQudE3+XkTFpUQHOYreK/HIykWVnKvZ5oBwA+nXZgIwuciXPwtnMoL7t6TGwnzje
	C29ncSeyi3PKSAKkgtiXZPiwZkSRTZ3GPub4DvWgFSq1URjbueZ3bGMNhmVp2pqTJSIiZUPgHhiLP
	hqIymi2we617TEY4/d5krzxBMTcNDcI9sm3+B5zgBYkqQ3i43oN2OAARqDKD8zhn9a2WuJPVP41X6
	WZwYgC+8wtmVGU6ct7QwLyZCWxb6CIaacVMUweDyV4Nc5hL2DPcy+NljLeiFh8l+JysmRRngRx9RZ
	hqki1JVw==;
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmagK-000000014c8-38Ef
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:24:34 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6626b5ace23so6038791d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741070; x=1785345870; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
        b=KZWYWd1CiQKVWmASJqom/3ZjAUUZe9kdHqUsYqNZxwdum4c8EpO3KgNlhPnFQshgz9
         7NAs2fs87yPP/MC0PZOa1hOmo2OnzdijQ2zQ53M0jhNKsaJSGNGxUPtKjz2b9Yt95EDd
         s7Pn/CQ6soZsyB1sjxpz2pXO7K7szz7Mcygw4SXOADQGezwTUivHfCpgy9x5qmhn0keE
         1WiaKGsBB/uUrdrXYK2DSXNh1LtqUHkNDKA9zrc6ORbFsDOr49PKqQRVbVsqqo6j9LLr
         UshuzJE2ighh/81ClOAJ5lONdDd11H3UuwAxTr7OnbQzG0z+Xf+f0UjIMxevL1Z6155G
         G2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741070; x=1785345870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
        b=Qsj2bJNNUn76/UXzVjEQ7bnPTE0gUaSbWdWFcgtPWLgNjaNpWHeyo2Vp5iQqI1U4A6
         DwHHXhvzOrkSkM+z7j9KjyRjiFRRygypgb4AZJxmGlupfBWhXN4huhP8wPNs3fJMH+Pd
         QbhVGVdSh/MXN0LlkWKI28NmEWc2HrDBODBYDeEuKQjsmrK8+z75e4v0xUYv9prBoHxN
         TVfhhf+eGySw8nf0kbtQJm0MmJbM3nRVmnFbiFw+vQwCDymAx0uMuJ0DrrINw1VFGpms
         Tld2zAV/4nUK7V8YgonMt5YHjklK3QHm/BGUTz0URxUAIRFZOT/MGby+qLeIMgXdgl51
         eENQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnnMYu80GDSs9+GdnZWgShIU1gHc/cZ4KVXZ9LWFSZc+9zVNfDRDJnn9tSzf8plIvGiMg37GwLMg/KRb4yzI+4@lists.infradead.org
X-Gm-Message-State: AOJu0YwzwY/VW8eHAN0USSa29RuanNG3WZs/gv1e8hB/JhmRdiJAKFuE
	jMtIFiztoGZZRwl4ZspFd6OkYW/KCc/3raUAF1b7dW9HQSJV93+AbJ9g
X-Gm-Gg: AR+sD11wsF7N80ZOD8FR6Fps/F9FCwGsV3HHQWQANXtTynqwoe0czIiKaqHPJprWhzP
	BHDaWjOWgZSiH1reLO6f/dvs2+kVRi6z+LcnGER0RS6BEV0mmXSuxS7f4uOJk9TDZ5BmKiit9rG
	0rcTJncNv3LU6bd9oWIrSIlmKrasefntaJ9MGS87V6yMAgbBcpTd2MA68RDCV2mpY9/8NYU61Gy
	M+Lp4K80ni1bk9N/VPKNCrytHpQhiK1GDVtIa0EpSY5y0xHMmSe48tgwPpLtNOREAZ12TkTwv5I
	ZEVvN/SNOgehmArZg0xO69BFDFPTbeVEhyyor4AL5aPpdmxIWrBs8GoViWIV5KxqaFMfiA12IEC
	RIc3C95SwIYOGO63RiAGN3icLEB9gBI4tvwAu7Ep/GzVSu6+MbAGAbadLZN26MBVdApNf9sfmT1
	TmbTuUQZYLBDVz39bFLZbAOBjPbMyd713WWdg6
X-Received: by 2002:a05:690c:a99:b0:81e:66a0:136b with SMTP id 00721157ae682-81f33cb39cdmr14100257b3.31.1784741070165;
        Wed, 22 Jul 2026 10:24:30 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33f35417sm16652167b3.47.2026.07.22.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:29 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: andre.przywara@arm.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Wed, 22 Jul 2026 19:23:56 +0200
Message-ID: <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_182432_982065_A6A7C31B 
X-CRM114-Status: GOOD (  13.62  )
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

Hi Andre,

Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>

I hit this exact bug on the Orange Pi 4A (T527) from the Ethernet side, so this
confirms the "reportedly Ethernet" with a concrete hardware data point.

Without the fix, GMAC1 (RGMII, YT8531 PHY) is RX-dead: the link comes up at
1Gbps but rx_packets stays 0, so DHCP never completes and the board is
unreachable. The PJ bank rail is 1.8V, but POW_MOD_SEL was left in 3.3V mode, so
the RGMII input thresholds were wrong and the MAC never saw RXC/RXD.

With your patch applied, RX comes back: the board gets a DHCP lease, and a 500 MB
transfer lands with ~365k rx_packets and rx_crc_errors = 0. So the CTL_INV
variant fixes it the right way, at the driver level.

For transparency on what I actually tested: I applied it on top of current
mainline (torvalds 248951ddc14d, v7.2-rc4 + a few). It didn't apply cleanly there
— it looks based on a newer pinctrl-sunxi tree — so I rebased one hunk (the
BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV case in sunxi_pinctrl_set_io_bias_cfg()) onto
that tree; the change itself is unchanged.

FWIW I'd independently reverse-engineered the same inverted encoding (bit=1 ->
3.3V mode on the A523, vs earlier SoCs; the BSP calls it "power_mode_reverse"),
so this matches what I saw on hardware, and I'm glad it's handled generically now
instead of my board-specific DT hack.

One note from poking at this, in case it's useful for edge cases: on this board a
few banks behave specially — PF is the SD UHS 1.8/3.3V switch (best left alone),
and PB/PH take their voltage from VCCIO rather than a per-bank bit. Happy to test
those paths on hardware if useful.

Thanks,
Juan Manuel

