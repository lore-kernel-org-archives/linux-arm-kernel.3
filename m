Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4955CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIk76PWOcKB2l3yZdOPVMHe0lxkjQ0sieXJNUO91W+U=; b=pRqg/k1r6SAKhq4u4D0NdOMwSY
	IQQHO4kpTD4iePSRXHr49ZONgB9I+RVoeP6+FHV4CdsD1f32jPpWXJ2E22MjZD5yY5bPcmu2jTVDa
	22lKzu7IifS8aONOxuxmtHk+8BYBmP8+AsWbJMomdWi6Z2S0kfdsOw2dJ7n/GddaurUe4ibN8l7gN
	jdOTNj4PAAP2xGpNH5Ei9LXum+a6ID0njUSKKNyjb+R0+eIhsBBDsXi38x1wJdy6YhNjIrl99aWgv
	FZtgIvbsLxr2iwFAxWujaMOoMCErzlb9lUI4WmLDHAIy61eqB44ZP77Fm5m70m4GETeeatQ510sKf
	ygJJnbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRb-0000000H6IW-3zNN;
	Tue, 12 May 2026 14:50:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRb-0000000H6IE-0YVd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 14:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zIk76PWOcKB2l3yZdOPVMHe0lxkjQ0sieXJNUO91W+U=; b=SM+a1N18GzhM2N+QXKZ6Yr9ZWp
	/61Xkjm7ItgAvqP9xz8mZq7qYQU/QhTAwD/Jp2v9PRd8RiqLReYSazSYjDpHLXeIbHShc5mWFmwAD
	QBbVedSqGxhixNpzDJDtQy2IiVnxjfQzWKVJAUevOB9nJYM5EQPK0jDbFzfgcc1KTL6lo66Kt9duN
	JPA7eVGIhH6k3jGXlGgTzGYhphT4kC2NCTqB2ZdjOMjzbcINNYX9OkHdSQWgLVR9CIOIQDH9tgJek
	OQHLFNMZtxS3iXiO94VakAlgB4PHkOepKxmras6SXsvI/ljsBHX2aCrfPSyIvCfJtuRYiUuyLhqsz
	JPD4opWQ==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRX-0000000F3Ev-3x35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:50:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so4746677a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778597442; x=1779202242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIk76PWOcKB2l3yZdOPVMHe0lxkjQ0sieXJNUO91W+U=;
        b=NkDfzyZHG1vgA3YiauXWE6c5QAJ/dnA26KSvor2J3phuLY2qBCWh5GMdvrd7xV5mis
         9754mlgCCpRAY7w7kYgwxl/9dQgpLbZCiZkmJu8pz0wqA3D41iXiRLviDk0cgyChPAXw
         CizkiwBwCfoKMes5odx7iIwUufTcFcMPJQjaYMbkhygYYdBY474sT+IM2lZUBglQukcs
         5BMvR2Fr54gRUi8S6593GE+RB3Hc3vPto/NuqUgSVkSisjvIRnHmwN3VWRkCH3Kv5n6w
         ktqJyQVynus6gZM52blBIr6TIDGAu5VeoTcHO1du7fMxBUJyFfzHYaX/sm/6kUQjX0oZ
         peIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597442; x=1779202242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIk76PWOcKB2l3yZdOPVMHe0lxkjQ0sieXJNUO91W+U=;
        b=WikYBXSYk6R/JE6d4FI27TIMuOaP6z43/AkJEUDcflKIPKXsNCVzlIS34wPdEyCxS9
         BIBkQFBLRuvO7/MFlrBYhUS/3Va/hrO5Y1yPxFEj2L+XZBd4NuAzTeJ5cKw6LhLrhPTa
         eRuvdLzpFwRmYIEqnKN+7KRAMs+mOFPpI9TdnzuaqnQwKHLzLUhs79RxqHezTQFFWTwB
         DapEaXShjRKuWPJjEULLycz6dixncx174qBQ+6PZ8+yNuh/DYF2Zj2arWL/i7gO29Mmj
         /tSmho9KWNy3JdmXfYJMdDxrtHVsv6X82ILv91/Rp5Ebjh01ZDIknE8wHuS26zVz1V72
         JW4A==
X-Forwarded-Encrypted: i=1; AFNElJ9o6o545r5jr3SKG+V4NJ/FdzkHcCKAHd9m5ljT9AmXIcTDrpIagO4oitz9mCciLShpzbWAxESwxFgscZrMFcJy@lists.infradead.org
X-Gm-Message-State: AOJu0YzagIgpHMLg2ts3tW6N0A98v+j492XZvTPpF+96AWauTTYCYafh
	P8wMqDPWNgc/hDZlEyJjXQubEE0dehXGf0myfhXVW6egwqZM9F8RS79ZgrGyOc86t61RQfhb
X-Gm-Gg: Acq92OFKQZS7CMnebKfS6AN9DomFyL/w8njC5I7LlUUc25r1no1z5sVkxCsYFHwiTIp
	aaN8JSyMCq2A6KvcC9WJuF+KGgPvUwBeMXNVGn22sKCfQYbD/bUhGwZEIocXrKJ0Zc7CiHfCFeT
	/oQTICaf1Km+7uOX+2Y8UubHXQ2eEdMMGHnCz1eEV5M0rI11lkzWJGm/VEnPPXOu66PJMvhVV/e
	0Y8UHb47Xj3hzOqIJx8/c+Ne0mps0SuEwpSvufvIW/lzX0ULc3NyLzuX6jG+VQMk2COQXNyblmr
	qh9lUbErFVJ5rSw64Ke8TKi0mFW8TJoHfLOYL0NrV/PW4bAT7fVERTBUnex4vF0Lo34cHfhIO9b
	Mncf2o9TFhGi1sWrwBFi00sjeupvCVXNzlVVucySHZCiZDc6JIKr1jtSo9krv9I+2U4zgjyRA7G
	2HseclmSzfFew7T8p8bzlgwRqiAmtThr8Oqa7Vhl1c1lBZgRhu
X-Received: by 2002:a17:903:1aae:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2ba795bdee7mr304729035ad.28.1778597441578;
        Tue, 12 May 2026 07:50:41 -0700 (PDT)
Received: from honglab.tailc96cb.ts.net ([140.123.97.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ba2sm146193705ad.50.2026.05.12.07.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:50:41 -0700 (PDT)
From: "WEI-HONG, YE" <1234567weewee457@gmail.com>
To: fedorov.nikita@h-partners.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	virtualization@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/7] hq-spinlock: add contention detection
Date: Tue, 12 May 2026 14:49:08 +0000
Message-ID: <20260512144908.610907-1-1234567weewee457@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260415164459.2904963-4-fedorov.nikita@h-partners.com>
References: <20260415164459.2904963-4-fedorov.nikita@h-partners.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_155044_438418_289296EA 
X-CRM114-Status: UNSURE (   8.85  )
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

Hi,

I may be missing something, but this patch adds
`update_counters_qspinlock()` for remote handoff accounting.

I tried commenting it out locally, and the kernel still built successfully
with `CONFIG_HQSPINLOCKS=y` and `CONFIG_HQSPINLOCKS_DEBUG=y`. I also could
not find a call site for it in the series, so it looks like this helper may
currently be unreferenced.

Is it still needed, or was the call site possibly missed in this RFC version?

Cheers,
Hong

