Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C7DC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=; b=R4XU1aABoscehlOlWbPHSgg+zW
	FbtkpoOeQPnFQN5z7S6AIw/2sXBl5XVM72cxAuXDLNJPZBV9VM1RUXEOtIqOpLzOPMTQ2r4R3nHF9
	ofMVY4SKwqF5+Lizqd6VReP6mxMhGwuQePd18LmK7+CjOQPflou+krAoOyQcQYE9J830q/kdOyaCa
	Vg4xN5hJY7h6Oc/CfQCO+wv8AO6ZEkc5P0IkOTdSn6epxlhoILUrFqd9lVmfLZo2HD8RbAgQlcKxb
	iedPY3UV6yy3xkxqeqtX9RGzcfG4K0zKMELo6zWGUyer0u3GEiYTkfMWjTiiwolQ0TD9LmPCm8vhH
	tG2NEvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UW0-0000000DG4P-2GqF;
	Tue, 01 Sep 2026 19:51:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVu-0000000DG0u-1j8a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:51:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495590dde14so2132435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788292280; x=1788897080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
        b=jw5IHllMu9ItFbhbWLZ7zuiytuyhs63OrKlmkwwXnUYXZF9wWbsb0MQu7pGEE9Dt5Z
         4ymRejP4rjqtJ0itQ8HbBhDDb+G7qnwGtRf01HYtM/k8CDfn85KwTA2ohDhDf6ykycq1
         KkYzY/hzGCqVH42fXI+kpCaFtaFi6zdQ7DbpFb41Q6IPzIakTKteSK8pXZNsb1ddDdBI
         tk/jchdogYuwdmwmrjfqdzL4yjKXzj9lCehUP8KAZWsKk1/7XxGts+V65d6RoC+ugicr
         HkliRnyoVljuwTTHxO68c/yOpFJ3Ys8iE3k4Tv2iyeZWo+uh/BEB6YH+130pjugaPciJ
         rTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292280; x=1788897080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xrxj50UPOiAaVvLDQBKaDhxwCp4EpiwnDcNCbB25YKw=;
        b=gJhMmCQVJDdVsG83qPHN5P5e2kbTRIp1xDgyhOcUX86UlNDBWwJND6hLuPF4GGnrSE
         UW3fiF9JbxApuYJqeDA25cNt2a97MFbswmUFXj3uYtzpkfmR96cr++nHbmtpPLONwXu0
         f2ZWRNG7hrIzQBHFMaPvI1hwVshrvlnoTDZULeYs/TkdZ2ZuLfXkSCD/A5yYU43h0Dov
         HpzNV44qSiE45Ww7l0XKoFvjWT36ENUu6c3ekKb6IC1iP2quIafxcEmmGcxpLp6N8F2b
         vty01FHuUOAQaoOEsChcQZlTSTgIBgParDsVBwtm4XnzJ6n4DKYZX+Fr5Dcnnslf6uHr
         ShWA==
X-Forwarded-Encrypted: i=1; AHgh+RpJC2avQ2VrqBffYeZyq1z2ZkngoIWrWdFb2AgGK7/8ErVHz/kskmZBT64yDa/NaJOaxHH63V9AyJaWa/xUjB7p@lists.infradead.org
X-Gm-Message-State: AFuF++m83evLlooZE/BYAA4ZMtHAt8cnmOb+2a1SkpgaD3YwlrfjWoTn
	g4bVHCutDBpNmtOIgJanJSs9IBYttbGLAVX9p7o8xL/8BYbfzlQrXM7tcJS69RASqsI=
X-Gm-Gg: AR+sD13n8APRjd7zMe911D+pcs+GjS563F0tLjKwy176Qyj2xzcbmogQXe+0r6dg+W2
	J9lD8H3kefuLLThe91tEMy7clw7VbiPax5RA1kbDlkhZOLGvQtK2KffRiuUHb+jkXcwSYTcScBK
	Cgunnx9zK0x91qrQqmUQcb7JYSHiR8f8x+hAgHW6AJG5gu1oIBq+2IJR/G3Im1/NRL7gncSkm+G
	aSYCgzKsm71tHXattotCguLhK73g8MfzMBoecPbrfvoKnQ2uwGF01kYbWhwd73Ti2IiPtHtXgQU
	sqGXSxKR8zZw8CzxonPMosCwMWGAmp6xN5V5udYPDi0fd529ppP6GUNj2vVhi7jMVT42fO1gzl4
	ZIMUAwP0Q8ZKCdyM6kTEvcWTG8EIneHkwyHWrPIfzF2g4ZgSHfEn9i1qsMV8e2YArnN2mq89tFi
	2L/rJbEhW0NYDyBp5ESSuW3s9us7MndLBoic8wnQU=
X-Received: by 2002:a05:600c:4eca:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce5816892mr62765e9.4.1788292280497;
        Tue, 01 Sep 2026 12:51:20 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm82484315e9.10.2026.09.01.12.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:20 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Tue,  1 Sep 2026 19:51:18 +0000
Message-ID: <20260901195118.37238-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
References: <20260827211652.63504-1-f@lex.la> <20260827211652.63504-2-f@lex.la> <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125122_494429_5C9B6BFF 
X-CRM114-Status: GOOD (  10.57  )
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

> Clashiko complains about the above:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260827211652.63504-1-f%40lex.la
>
> @Andrew: WDYT?

The raw LPI_THRESH plumbing predates the phylink conversion: before
9cf21773f535, mt753x_set_mac_eee() wrote tx_lpi_timer straight into the
field with the same 0xFFF bound, so what ethtool showed and set on these
ports was always the register unit. This patch brings that path back and
does not change the unit. Settling it needs the MT7531 manual, and the
EINVAL-vs-clamp mismatch came with the conversion too. Both look like a
follow-up once someone can confirm the unit.

