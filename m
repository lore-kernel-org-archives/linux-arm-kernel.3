Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4593ED7B9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaMfn/m7remtrif+yId9t3hIu92WbVw+I82upsfo5Xg=; b=waxcnuJYxzXZ0swxQdEy+T5D57
	73kgtl8SsvIqBPV+81SXPPH4NVKWZH6bFygz2qnvgT3pu4RDNb+emx58vRh+FvJoGmJyb6EA32LXy
	Rfy5vIz3CVWnacGqXah0X4saYE6ccC7Wh3iDUw90hgpr8Qqbz6AtweuhtJW8MClOuwGudxTaW+UTm
	be7LxvBxmTbFLT/01RUnZnJLyxPKvvAvavtG5dy1WtMX5yzoifkvZaJU6q+8RJ/a0/CQxe5kZJIRs
	Ycu+yoSPrqOu3kuuLJicp3jMopXUqv63cVScp7w7S5emJP+9D/FnkdOhcc+I08XxcijMl+iZdu1ku
	S3LC+trA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5Q-0000000H9RE-0MwY;
	Tue, 14 Apr 2026 10:33:40 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5L-0000000H9Qu-47Nk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:33:38 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5556476eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776162814; x=1776767614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaMfn/m7remtrif+yId9t3hIu92WbVw+I82upsfo5Xg=;
        b=qfpgiwnE1U6gPsL4P/4wqoVcDofRFtcXMwsNKcMuYTkq++xNYJtpDqF7KGKh1brnma
         FiMAILjnfVVyRplLNprFEDfJvNkWEZNVaCZuYSWW6BMejA98CA84Avwkdopu6jvGiv1C
         lob5efbNb8K+zLdLGssAZP4YIYJQKrYWA7AmMsioE4CNuREWFX0R/Xcyr6xQ59LarkqS
         TFtRANgaoINBxD0WBCn8RwEU+u+Kj79rKDhZJw74IEf4UKZXiQMjnQVoK/84h9pvpeXo
         cpH7J2Sf4+MQ389tALcib2GVhvEt2sB6rLMO/iH0Yp9MwG6qdiZtKZD0rrGDGbL2keXO
         8DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162814; x=1776767614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qaMfn/m7remtrif+yId9t3hIu92WbVw+I82upsfo5Xg=;
        b=FRhy1L8Y0GWh0111XMtHcb6klindQzzeHsRy69aWc/F1LWhnU2hb72NsUWoG8zxOWV
         YC87zdPtQzP99Gyba/ddEzyBmKzd3nW7EiyqBwWrHkYPduZGPtZtTjYz7MhUi1x7lHWR
         GhlSGFZtw3vBsIAZ39vUCf2lK2nFlD30UKcjV2k80608Rc9MRLGqfSgMBELka1jHS/Qn
         +hBC1zJTIbhBXkO/IxD47g3KmyI+817e70WXFqFLRWXxBiDwfzMyVhy+gNV1eXt8prC8
         B86MwlahTpeYjTE9vRzl+1YkFOHxpj1tbOOfNm3tlZUvJ3ZM2PsQBGlhnxJaYBjGPaDb
         1nWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Aly8h+jrauYxXg65otu0Y6Qx+FyPbnoq55MI+y9YHkTnDAnmud8gQglFf19RoQEJxg5MeAh1WW5Dka5gQUZLh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf+t+G8qpV2BwD4IxSu5E58B+lC2wIPjWLDc2m58HrPSmXuLQ5
	EtYtCuab5i7VpO7q380hSu83/o2mAfnT0gh+cXAtXjyuajcZnKFW1aEsf0+8ym+2o4kalR1u15f
	lRsy7x0+qfw==
X-Gm-Gg: AeBDievObsvA/zrpriX0AFR281VLxl9ef/boJ8XDN9HoaS26CKbo9qn4bVE6Jspu5+K
	mDC03WbwrQbHQNU5hbZKhuzAe8DV4Nf/7l7zyE7Fsdd8fgA8JebcN52mSScIBuhNtk/J2P3HHaT
	s5LKNY5aQriG4i23UdHE6aXwj4+TY9FaNkmjfZmaKpoANx3QDeao/6ZeNIoasphasSwKo+0H4pb
	0pNZXV+OSmcbUdZtiJ/xbcGqylI8CmYrQIiy6fq6BU2DETxmwfGYjB8u1aBT8AVQOMZUKZ2Y7i8
	oxRAMwG6Mc9/Un37BYCqHhkSb8E07/BgqfrOf2ScGB0gxXC5dFXWUbfTQS+4VTZ//pnmhhIKgWk
	Qs3Aw/HF7wY2Dwqs5awr/lcM0SkiCYHDEpZxACTeSNQgFc0GkTjvQpKCckNlUD84kL7a2qIOy9f
	zIIQeKJTdnL2cpR/+TIVgXb86kmSVr67Qx0IiJCrM8gZ7BGiDcFfzcr0bDUu2wPFggF8WlcoMN+
	2sIpCpC86bp9jYtQJiyTtUsdCG6mhT/226/iMNhKI9F4v+LHw==
X-Received: by 2002:a05:7300:5727:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2d586380990mr9041281eec.5.1776162814479;
        Tue, 14 Apr 2026 03:33:34 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d90ae89e49sm8735499eec.31.2026.04.14.03.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:33:33 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Subject: [PATCH v2 0/3] iio: adc: xilinx-ams: refactor alarm handling to table-driven design
Date: Tue, 14 Apr 2026 07:29:16 -0300
Message-ID: <20260414103316.18455-1-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414093018.7153-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033336_559167_99EF1E04 
X-CRM114-Status: UNSURE (   7.26  )
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

This series addresses significant code duplication in alarm handling
logic across the Xilinx AMS IIO driver.

To address this, the series introduces a centralized table-driven
mapping (alarm_map) that replaces multiple switch statements spread
across the driver.

This improves:
- maintainability (single source of truth for mappings)
- readability (removes repeated switch logic)
- extensibility (new alarms require only table updates)

No functional changes are intended.

Series overview:
- Patch 1: fix out-of-bounds channel lookup 
- Patch 2: convert mutex handling to guard(mutex) 
- Patch 3: introduce table-driven alarm mapping

v1 -> v2:
- Fixed Fixes tag format
- Replaced AMS_ALARM_INVALID with AMS_ALARM_NONE
- Changed alarm_map base_offset type

Guilherme Ivo Bozi (3):
  iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event
    handling
  iio: adc: xilinx-ams: use guard(mutex) for automatic locking
  iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach

 drivers/iio/adc/xilinx-ams.c | 190 +++++++++++++----------------------
 1 file changed, 71 insertions(+), 119 deletions(-)

-- 
2.47.3


