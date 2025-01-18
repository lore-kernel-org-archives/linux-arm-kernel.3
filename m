Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB053C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhhPsyyyRSLm26HDZBn+CWRZFfO6+xG+OhBZMJX9T5g=; b=sq2W4uUofL9g15GW8nQOFiY6fk
	+FIm8PtndWHvqrmyrWBEvuyOJUPC7pqxxMcfLP5t8YUss/6jSMA5BVwBGjv0ZlJ9DYiuEIwjHjRZv
	5ZX0FGjYg9LZKPRRyCa8uSVII9985Nysc/ZTPmGna4ik+vzbxPpvVe+j3wJ8OG/Te4zl7Wm/ql3Ay
	4swomoM56SIyk4qQqlKr8nY9ml+PMZbmEbgdxAvsm1p8UR8Mo4BWTAQ7cUBomm2tzUk7rij+R1EOh
	cNxKn6wNd/rjcrKmUcqhxHwSZkbGFmKv9lmxVD1MylkUNTkzQvIB1/pzkBk7gn1SuRp6sC+hVUV3C
	Se0GtdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5UF-000000028Ap-2pWG;
	Sat, 18 Jan 2025 09:51:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5Sx-00000002853-39t7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 09:50:08 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaec61d0f65so618743266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737193806; x=1737798606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhhPsyyyRSLm26HDZBn+CWRZFfO6+xG+OhBZMJX9T5g=;
        b=AHHWVda9De8HBKxCUUzED1XaNp9uvhC9SsOpcRngdqkcjjtesdvs0jG6cxpfnzvHd6
         +tdckDq9AYRE3XxEteRhPTRnNggfxUqhp21c5W5ba/2BNoDy0hROHsj3fWmGeLhRLhzn
         NEjd7AF3/bMUzcJIrvpT9TxgLVOqe0xA0dKA75BPcwioHONa4Q30wDuQEM2TZwI0vcDx
         UN62FhIRUNC9IMlCk4p0yDXOWxb8vUPYwtVl9DOe3UJ7yIQ/AKplgwqhIEktGdNtGSdu
         +OneenPWgKWXxDXtvthH+wLHmmnWCgytb5qRRx7ym9U0NccaaxAqRME8X+3vap1YWCX9
         e1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737193806; x=1737798606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhhPsyyyRSLm26HDZBn+CWRZFfO6+xG+OhBZMJX9T5g=;
        b=m5g7HgelTuZGeN6Cc3+XNsB0EE1gTXgtNerImmQOG0HsS+lkyxxRSVbTOc5i4V9wDd
         GHKX9A4irTcGPfiOlDlY+iKw9XNfSqjMsPS8UiDCFea7dHymLAR06eT/5jAbO83JmCi0
         12ITPxvaN8q8VtfiVvnctpEBNMz+TS3HUYdfeAi3diyqg3rXRROiizbd4Qr/2Lxp0c0Q
         9JMPXg9Bderuy+zXb8R7HFPFHrK+nmUQk5sBSYwqNKgVXb/76buy0kYaj5cfrVbB8DV1
         ptMFq24qKsN1nNw6BqeUl1L7i0k9iNIs8uNroPzYIMH2u0Gnc8ZsdpTXm8MMGVNgYfGn
         VXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG4TDcWpU3uuitcePr9WEJ7iIRo0WuxLO/zUDPFp1Yl7xNFoeANkp8KTGfFX8uu2nxzrurP/xDCwbl/YKRt72Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzIAowWUi21pI/crPk9B/kM+wwGUYZJwp5bu1Gnqmij6hTYeG7J
	Ez3QohlDYE9OAgFu7BUMr3xq79UhIya22H7A8yPOCKsmcoYJ8M7F
X-Gm-Gg: ASbGncvNszcO1x4tWmtqyOEiEY2xICgvrmWkfJUImsTJHR6JP4LZYzv2DQmt2SjuoaC
	8GLNGY2ri6YhVsY7a4u0dtdAvHtrkg/PNmdfkqvYYwrLba8OBmpKxXR2xwjRsG0+hWkrVubmSqN
	d6JAy3WnYQ2+RiaWw0FFpANu1wvbNWEcs1/gpfdSpmf6zg1H8pdE+b1lHt8+GQ/Ax1efghDPWDY
	Ihc2QBw04cbdztRsvmxzbRKSR0x6pyQcbuhe7CRFfvNeWe1lHzUJRQNhAIx3r06gpR+zIEpfHzQ
	IIckcXd7WlsJTVk=
X-Google-Smtp-Source: AGHT+IHaNlcsc4OEmrt7TiQegOYBfODCrIraAE0UV1fgtoWTxbEJfDVj44pe49R0MuM+IUWNGY0pXw==
X-Received: by 2002:a17:906:fd85:b0:aa6:becf:b26a with SMTP id a640c23a62f3a-ab38b0a13e6mr479360966b.9.1737193805433;
        Sat, 18 Jan 2025 01:50:05 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d69fsm306520966b.79.2025.01.18.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 01:50:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bence =?UTF-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: Bence =?UTF-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 Chen-Yu Tsai <wens@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2] dma-engine: sun4i: Use devm functions in probe()
Date: Sat, 18 Jan 2025 10:50:03 +0100
Message-ID: <2217419.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250114100505.799288-2-csokas.bence@prolan.hu>
References: <20250114100505.799288-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_015007_795111_F4980020 
X-CRM114-Status: UNSURE (   7.93  )
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

Dne torek, 14. januar 2025 ob 11:05:05 Srednjeevropski standardni =C4=8Das =
je Bence Cs=C3=B3k=C3=A1s napisal(a):
> Clean up error handling by using devm functions
> and dev_err_probe(). This should make it easier
> to add new code, as we can eliminate the "goto
> ladder" in probe().
>=20
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



