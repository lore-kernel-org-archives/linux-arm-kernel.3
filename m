Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A84CCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=; b=FJcgZHM5tn+HuuQmcJUWvw9Iko
	nkaFce9rY7yv0UOPXlTmtMF3DtzevyegwAQBrSaEFKTvKpsWnn0N3gskaW8HEYuJ9zubxE2IgLH66
	hPlhJy8H91AFzz006bTlssfqvY8nheK4J7VwV2mXKRICPaNgjtONW9KvPXg2PRGoWuaXL2oZ7ZgWy
	MsQys/4adktyY6cr2/ZSt5CGd4g01z4xO6v+4OQDZIPQ0Hxj3QpRz99yl8Dm2RKMdKFdSMjs69VSk
	aAQC6jSz7m5UeSbM+BF+6Sl0rw1PQzq6SI0CRg1IyIznlhfX1yDN5Rnmkd0iXwIqYyBeMq8DX4Yc3
	aGUbg54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usi9B-0000000AEPC-24SM;
	Sun, 31 Aug 2025 13:31:05 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usi6O-0000000AE5U-45Rk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 13:28:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3d12c5224abso281323f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646891; x=1757251691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=WHzwbpLvFygP46NmKY8Jw1Xngo0AAAyXtE4eO/mD2CPO7z1lS1ekSAH12b0nuH5Sy6
         YFx1y1ZyEN4Oe/eDWmvzOBaJB6g8nGLbaSZmdYrVfU98IT6A2VVhwdZYr2uYvcHtezcR
         l7xnknexkvYH6Ms4mgA0O/3e2XvyH19PJUaem/bPrK2dwGFyVZFEAbrVrSHtPRF7uG/B
         qbjTrmG0X2oN2YKdoiG9LAYY2MIpJqiX5D8MejUozEvvKRc4A+LtahaVKuh83zVdybCk
         x2Tj8cZhqUvJEngwp5GCp9jwrFY3eqM+GtdQgax6M8tTm4w3c4VnuNHOpVJpt2zL4aIZ
         DfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646891; x=1757251691;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=BKImt4NVnyaxHsBJOX3Zd9kLwWp/ImjWMMEgesyktOlxSvypJuQb5njqiATRJ6vG2e
         o2jDCFpZTHpFmRB8oJPpXikd+GXf+/PSguzfEwlph1tOUzTLPRIFqRfLDq6EpgSgW6VN
         vHR9nc8pGDCDEkHiaQZ7j3k+4tFzfnn7/lLABFv9KOep+qjy1C51H66BP4eF1/CVE9o8
         l+LTO7gB8NsfpOXJ032iL0vVeghwIS/xAdPyO/mc70onGszbA54dzK/65z/kpp212woR
         +CBMunkDrD+CaRXPXDTJePZDDN+pbKLOZucnythT4C5WPXMODFdlrZFR2K/4zWFITkfa
         P4bw==
X-Forwarded-Encrypted: i=1; AJvYcCVCVEi00EVOga1004p//L29nnPHlQVOfZWIznw0sAWXGrVEVvvc3UGWmav6qm4AxVs+moIRtiLRqKNZbqPNV+iG@lists.infradead.org
X-Gm-Message-State: AOJu0YyjyQpq8BKhn6E3UMdP6zB6ZSbOBw1ZE4RXboAvfqIPbW5Iz1SI
	JBi2NZ8de8hKBv2s0qZCGDjfz8W4o/nP/9dxoOp1wyWywq56kL4xcUM4LFwFE+PwnLI=
X-Gm-Gg: ASbGncugUOqBIiJMTxD4vz4QB8y7dTLKhIk94Cu0luMFb7n0HHhxK3qWk3d7gY8fiMz
	7d4COw0S8+V/4aSrcM2KVyIqX2N007kP0oO3pKUM9efQEDLBe3WJzg0VcN8OEe85rZZTKB+JrGF
	8L2BSD4458VV5VJkIIRowPEArA6EEmzjEJAAEQq4/TOiXICg98O5ZMY41moT/A/kHzPKMY2IGTN
	ufwVfINCtHLknr12mqUqex7iP2Wr+zC2X/lXig89UVDyWZoLA2uAhi+r0bJshQ0J75oJ+LSLpav
	S7XUhGvDqtAuTnthqaGxeaCp5ahhWo7yzPg+wqqczv92yNpmDo5706AYDQjvPZKClJYg83SCEAO
	m6H8UlRUpvNfS3eIVddElc3BCC0xxYXqWP7BSYPk=
X-Google-Smtp-Source: AGHT+IHkPBdwt6L3VH7t04bp7Le2oXr0tHCapltVXb93QgdyVU4QJ8bZvFGna7E4/zYnUQGrTwhkug==
X-Received: by 2002:a05:600c:19c7:b0:456:1a00:c745 with SMTP id 5b1f17b1804b1-45b802c57dbmr32352025e9.3.1756646891177;
        Sun, 31 Aug 2025 06:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-2-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed@epcas5p4.samsung.com>
 <20250825114436.46882-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 01/10] dt-bindings: clock: Add ARTPEC-8
 clock controller
Message-Id: <175664688891.195158.13270877080433356384.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_062813_038276_DCF77192 
X-CRM114-Status: UNSURE (   7.46  )
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


On Mon, 25 Aug 2025 17:14:27 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-8 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: Add ARTPEC-8 clock controller
        https://git.kernel.org/krzk/linux/c/91f98de42310c70f9a23595b3b20aa305717d955

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


