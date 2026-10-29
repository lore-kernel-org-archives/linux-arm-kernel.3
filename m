Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZkOPoxe;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ewjAmSoD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=; b=MZkOPoxepDyrdf
	uF2rL4U578YEvLjP3snEHc4k2Ro+OF17n1rJmFSGhWg3zIa8w6KUw2qdNRwregK2ydd/Z6mX38qnL
	P7JBJQSAyKcJoTCFzpvRDicWE7Iz13IiQzdGajez3EmOxkrPW9AA9a/v+olKT+8fxumdvw37fe06J
	3TLrCxY4+KvVNNzT81osQzMGkPT6K9NjuhFrwM1LRn3sEVqNxNuJ7N7j9f5j3cPOLeOHUiBk0W4ZK
	SxZjKGV1rvFS4mX5f5lGGFWF0SkFFg3xrmVJXj4kLtpU+l3rGAGIPk7YK7f+akN2F52bNkNsfKqHx
	EIu0pWAKtFHweotWjx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMREw-00000009XJP-0VNU;
	Thu, 29 Oct 2026 14:36:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMREt-00000009XIU-2nXI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:36:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so19810275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793284581; x=1793889381; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=ewjAmSoDLf9udMTcld3MYtODJrLZRDaQZZlcLnKpmyRB0h7VRuyj5gU70krmUpEM/f
         ZyZKouyGgKlGd38TbT3ezEP5mUi9yTc7BTTw2yqp3KInTPDljsfJkZ2ZqZ8i60u48prb
         1hA2xxeN6dEf0PFLfY7ckL9PmWfi+JYwys0a3JprTTbx7sN2PnC2omHzeIrteRAXVaUn
         DZVB/qA32xfufKGXcUMzrc6FHWPtBejrLBldMyWBSV7KYYcfVvNa6EPDSTyb7jp+IxMV
         rhO4Q3JEphqzwSvdCBHiPL68TsLd9KRsNmYDTlERAytTv3tWFCUUVyHgE9C7UhjjTzqE
         mCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284581; x=1793889381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=guPvsw1NrSq13eRkybbHNTN74/bTn8czygNZRz5esytN3LXzCPvOJT872IGT3mBFBF
         kXPLSG8PNjh5Rx47zYznnxjSlTr3g9eL/2Hb9JKV0DFECousTvg2CAprkYoXHGGm7NnU
         4RVZOvwWn3GgAvMvakHP2iL+zIifkQkhk45bMwUUQdmlxJrVqI53qNAl0Nb6FF1gd+jQ
         y1yEboc4+UKdOMHbqSVLNAws/2ZQJ7efdA2XBOQdN3tcJdvnPyUjDojCi05fsQGXye3M
         GY8KhIuSOxaW/TGCtpqKIeKixPA4E8qKMdNXkwskpHPkHXeyG8/BRgtiS8rPVn5RkfE8
         t5dg==
X-Forwarded-Encrypted: i=1; AKwUvByVG+O4w1soH+oYxokqFwD6TjNJBn1fp6jN/AtZA9FxJmEUegKf8m5M+IlLc+58ey/T1tKyCWE9yioCYNTofaAk@lists.infradead.org
X-Gm-Message-State: AFq9FYKozovminvPGA8uVnWHCTX/Bo7er+Zd8kEMk+i+ufgkAFkZJK8N
	+hPhce5uHhxfS/nauQjtok60HPaGVgFEMnwsue/Q/fqCShNiFbHTfMZBiZkenbBAK3k=
X-Gm-Gg: AYBFou02DDHoPAshMleS0yUdv6r831Ko6mxXgU7326PoNxJQeR9qV1F4mUQD8dU4/ai
	umEIR5/lWqlcQ99wd+GTRTD5SlM8DhCRQmKfAkqtTN+DqneLTWUCgOCfew9RS1uKK3QCQeW6uG8
	g99/tdFtQdbFCKhDxYYv+/G68/QoqnSkcGNw2dqy1sAERPZXxbe29KtLslMiNDnRMzjQbgO4xN9
	vRq2HLjY3iTb5fDmtw1A1sgp/M61kAFSgzlmJfHmlknbGPrSWVDM3fANjLoP9v5/JcBi91cQHFq
	pwgnMlvJ1ns8KaupAP9NxNpezGgH4HCk9Qi0ih1SumXy4A62m58vfiYXxHe9QYrGWd34RqDRFT1
	CuLZ55EvUPccoTmxOpJriS3vgFb+K9T+wCcS7QWkcGKMwrYjNL/4mCKzW+2H/02jlW3TObxSy1j
	+wagM40jkOWV7aL7kB2dkPiiW1a35Jwp04en7/sKnvG/gjK9hBRjz+aCugAUpLBMTuV51IzIzxP
	YfOKRUjcRmiMiw6PeBrz7tca8jTek+t89vK+3ta7QsCCoTGt51I4bIKddsWJHPZUfNq1UMq4qFL
	1F9M9LdNGx+tmv1yhsJKDmAFsDWkyOor2Ed3sqbloEGHLNnM
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr115101135e9.5.1793284581222;
        Thu, 29 Oct 2026 07:36:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a32eef4sm80612955e9.3.2026.10.29.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:36:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
Date: Thu, 29 Oct 2026 15:36:17 +0100
Message-Id: <179328457778.1865333.17367903644168961694.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=328; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I6EvPRMH0NyoJrkviiRd+YwWhq7FQ66k6ghPBYl+JiM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPIx8LPbxyy0ci6kzfIiapRZva5gtGLNK0DJVjmvol9
 kQC74+rHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiIghojw5bD68TulT3j+8wp
 V/biuueWSxOFT7/cVbHvs/upiYzn51cwMjyJdD/z4eTLD9z51W7b7z/cIHlEU6d+n8HFS+1bvD4
 wSfEBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_073623_715840_4ED0D7DB 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

> The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
> the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
> it in the three drivers.

The commit description of patch 3 apparently does not really make sense
in the context of the S4

A part from this, it looks good

-- 
Jerome


