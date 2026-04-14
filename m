Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA20ED7B8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4SIzmfde5277ChYiQL5qk9STfDI4POt60DO+vrLKpk8=; b=rsKLC9Us/nrd/KkbwGsmgA2BY5
	HHTnIC+rkGKIb89r2RaceqVYQ8n0OrDEG3obQ5uoWH/Tv5yM0GT+xoz5fHvKhPxi+wpbFVekf5z6J
	QmxqBnSN3RGBNGyymRIbRDcBXnm5qVHYwlrkFlnORguDDpv9qaHYdzf/9YpMTRN8uhwEhzIEke7E4
	JkBTqgDhilFtsJu7f3KO3AZyHY+a8NqYq8L4qHJDX3k4IlzkUAYfCVzcETLIHbtGiXUAsPqzuJgTN
	btEf/+FG6F9qFcA/QUNPbOQ2FRWjF3TJf0/GuhbXues6/6S03rKL1noly2YZiTIAOUqtXpXskM+to
	M7drDjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6K-0000000H3VL-1xbm;
	Tue, 14 Apr 2026 09:30:32 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6G-0000000H3Uv-3Mcu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:30:31 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2dbb4ad19a5so1208891eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776159027; x=1776763827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4SIzmfde5277ChYiQL5qk9STfDI4POt60DO+vrLKpk8=;
        b=D6iQWSKU1Y/B4UwMrxZwUqY/hkSVMmRhske1uMIAHN+Isn8eKzxOFH6fp/4/7EGpNt
         wnV1ifhkR2i6sLDpkNr/UaJdlVEZcfC8kMLLZfvmh2mOBOR8sQt/rVL4PeJOjus3SRsW
         Pk4wnTWavRMcbpCg24wr5F0Nc/71mwx1KuqzZyxsYRg1PlcsDtCzLSNrLk/L44Y3CiNP
         U8iT3maSOZYWk+3oU/r1ogghDUjzepihgWY47iNEuO4favYLf+7UY8c1vuIgnYBxdxWb
         8I73JtlvDOPAp9MuRfRsVS9iyl1e7xTBVmuHpsMyKutGuPgNhOyKbXDC+aQGm2oEDa55
         JEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159027; x=1776763827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SIzmfde5277ChYiQL5qk9STfDI4POt60DO+vrLKpk8=;
        b=YpbzDOIvlwNepS8a+HhjW1UEz1ByH/L2VnnqVCvHi0aFTXpT6a+z6KpZw3JtE2W4Us
         rZ328aHGF8jkcTlNcDwUoCUHFxOJLBy9vtF4mlB9Vu2kygJy8m2khMZOPYU4U9nqox7S
         Slu3Reg7zhj3c+FYOZ7+ICHY34Nti0j4dN9BrqbDJfiLa7qrn/eBupKqJt1eJ62qmaFI
         WX1kb//MnWXa/4JDe9iSbr1x9O7R+C7VpBql8ozAQ8g2CKHKrty1xas4M3jaShx1fP6X
         S5IaGhH9ogEHQOlopxGCiCGCYPBIVvkSsEbB6NQV5Mjl9M+skrseAKCnS8dWUN+uOiU2
         n+cA==
X-Forwarded-Encrypted: i=1; AFNElJ+ow7Ht5BWkjGzWXSPPx6x5GalMmoBr/Wb+EH+2IdEKuGhNJU+B3/HM5SkFgxAqCSFhIs/XXv7xaofX9BuRnRa/@lists.infradead.org
X-Gm-Message-State: AOJu0YxIGAatqa2KIqseVWB3MJ2qgRABPBc0TySi5bl4xLmOVXjYlIuy
	cxSEhzhsflukYLCPlNt/fGCQCvlCOCVWOcIShvNwgC4jPE26R/EHvQxk6SNsLc9kpQs=
X-Gm-Gg: AeBDietXm2se1jD/dPbfWyvFsbIZk5NQCnkEAPwPFAz9/w33HCNArc4zV1KVs4XdDuO
	Siy7J9JSR6zpimb8G3FCiIlVSrSVHnZ4FLk4AITCcX7Lxcf4gjz9xsOVlUjul4ZXs+7mGguv+tV
	87gMUeUM+yrCekLH55gEKNA/OyZLDmJ7TlGYLyfTrsSMUDUzdXCqIfh5d0hEPT1Sy8LWIkLFJW1
	pM45rQ8meNVXeEwD42QmeKWchXF4D42xmEoTsKK0Dk6SvxEK7FKlNqtRnMg6HqerZvyJupWdUME
	y+uNmBy0G22QTioGAGDAQPacuF8T739Pjj8BQ4vVXXNfMS0nxqw81/7i0QjDVTuniG+8ZGTkWVX
	8cDnRuLve+qcu8bQHZ32gqMUNvKJGY9xbiE014tOFs24Llevpva46H6A2yYFj/Rg1JS5sRQOoaG
	5ImrMV+9QLVl6uDFN3+uLYY9WKCHHrFJJchQX00tObIMzjjUGjt/O3JFThuVxIggXHUN2E02xLT
	/2CXfGWuFMyPIeXI0LLohoiP9g7rKg7ZlA7QdEogfs47LM+rA==
X-Received: by 2002:a05:7301:4089:b0:2be:a2d8:e9e3 with SMTP id 5a478bee46e88-2d58a2a171fmr9796479eec.29.1776159026550;
        Tue, 14 Apr 2026 02:30:26 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm20327599eec.26.2026.04.14.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:30:25 -0700 (PDT)
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
Subject: [PATCH 0/3] iio: adc: xilinx-ams: refactor alarm handling to table-driven design
Date: Tue, 14 Apr 2026 06:29:27 -0300
Message-ID: <20260414093018.7153-1-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_023029_390015_D2241A46 
X-CRM114-Status: UNSURE (   6.39  )
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

An analysis of the codebase (ArKanjo explorer) revealed multiple
duplicated mappings between scan_index, alarm bits, and register
offsets.

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

Guilherme Ivo Bozi (3):
  iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event
    handling
  iio: adc: xilinx-ams: use guard(mutex) for automatic locking
  iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach

 drivers/iio/adc/xilinx-ams.c | 192 +++++++++++++----------------------
 1 file changed, 73 insertions(+), 119 deletions(-)

-- 
2.47.3


