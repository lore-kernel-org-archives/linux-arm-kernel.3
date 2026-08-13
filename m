Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB153C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lh941E03WqQoOdzW0XPuu5W0k5Y6sQxubyIZa23gmJo=; b=3J490hrZ35pZYVLIZI8/1U5836
	Xhda4SEvQpSJyMZD14X73K1pk1UO8cBcIuYtaZLeG9SXh5HfwVqwvr+YbMah47vVcAEeWfSeIFz0C
	2QhHaVVN7fKa4p7oywqoDkG5BCF1FogAx54BdGwjpv5Gjrhgk9RRPJgxEWeY2lQUwwUotyXHq5j4a
	O4mS8AkDDxAeu+gFVoTXW4Dpv9mHYF6GbX20SCqhPFMbAZRakG6/RTrYCG+uzJWP0eH6lG2rEBVj+
	habHpq1zKILvBFIfnpJ/YykaKnvxJWUGKDnWIBevZE6KKjI1M64K1XAIagcVhapkM2KbSvtBNNXvb
	s8D0lAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5A-0000000HQN5-1gqX;
	Thu, 13 Aug 2026 05:34:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO57-0000000HQMT-36eh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1422327a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599261; x=1787204061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lh941E03WqQoOdzW0XPuu5W0k5Y6sQxubyIZa23gmJo=;
        b=F8G+RXF+QK6hQSzMU0C/IUpNgWBhWCwbSa0GgvGHr9AyhzoThnr0nUOOf9XuYHsJnG
         QOQA3s8htMK4HBew1UCnCKaFibM8kXRFvDvtyZdO+yxed0DH5MzeU6JwY2pgRuWI1MKK
         0JxUyvqLmM3RCe9igC9Eqacom1j4N32KMt1ir+7movDPwlJA3i7l/FyT8U2EPFlIh+KE
         BBITKyxtqMCqFGMjCEyhwmzRtBlCueR87FfvGkurIoTFxGkVBIWgEKgH6c3b2B+qdYkF
         zf+TmMtk4BmGc25Gzh5TucwnomxuJjNnJGyiNtqb/rTgoodRGlUL3ugf1TTIBsJe+NNy
         A/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599261; x=1787204061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lh941E03WqQoOdzW0XPuu5W0k5Y6sQxubyIZa23gmJo=;
        b=ZscAuPpdEZOibsHKT8y6ZfrhtZ21i7qQe5wbu+BmnDlQwdzlDBXR4f/KbtMAHzjwHM
         D+oHrsadqPQI5GGLRog2EGb5pPK1couknMI8gg6sxA8p3rC1jpxg5Y5jTZXBM+qJRgju
         1Gp9oaSC76y311fq1MS78PSpoD852bjcBxyPqIDzaZSPjNhuoyJJJ+73ZnrI/NadV8ow
         +dOeNdMA0Fd91SJNPPnH+PzD3HJPOtwKf4MBlDxImumeBSIb2hP5UYWdXhVl9gFX44QX
         FjzRxX3vrMhBoGt5Ol8BFBEpt1Br9rkrDa07cD0HXwO+wOqtsuzmePE+u/BgdypMbqOB
         6j9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoUdWMIPVSoCNWsJ0dAZvRuuolirw1OIv2IzAlDsmUNhQupUCuWvrtSs4tczuqbgySVdBPipVdBaUTcN6LqnaJK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu4Znj2tY/6zt5E5VVqkEYzT9LjEMZnepuiPUItqNZat7axIwT
	bsB6+Y7V5ntFCcFW58ppmLkBX8ubtDK7sNyh2s9FLOUo8VSTIEyYdvGa
X-Gm-Gg: AR+sD10s3GcqDYMMNuZAeAU5HFC2rgAtkW4/xP6Dzss86A6Jr7369w21Och0C2CjOor
	9F9RcNXt0Q8973a1fIJoaG36qxQmjO0XB4dwTVid5WSIiEdEyXY1nhGVbtyE4haKstWrbVJEo7g
	MHoH6hHBOvXSb4giAyeHC0ffSv3CzkPxx4/kNZWYSluzxderc7nQwhfKfLrn2BpjdbxI/Fl+LhQ
	GZUz4QHOLd23uAY0JIHg2nO+LW5L2GbOWIXawY4WlUubdQvZrNbH5RmsKdld3ykMWwNKcDWIGW8
	qIhL7gpBNwUvOURFAHWhYLPmtgWd4xlqFq3P0CBINjFPpzGAueivs+zigwr9LrxdEjpNtD69CN/
	xxwQEzNN1BQcvFJdQ1Ui8hfzJqpxnNCtf6jeGYkkO+cUQhALCr1bpsnMzOZHvoPmHeAUYUATaFu
	i60r5EtwFTI8W0CKNeYMqz0Tu8snNQkiOCL3qVIOI2wMXtgpfWW/EoFeSFKcQ+Z3hewohO2/T8N
	cCOiSZ/Z0sEmvG0h7R4t8K9jfOfKNG4+ZcTvmm9wQMRs03PBJgE7LT7D6QPyxCWFt1W/XsORBic
	SUUqCrCJukyd3pg=
X-Received: by 2002:a17:90a:d647:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3931e04a995mr4154302a91.8.1786599260750;
        Wed, 12 Aug 2026 22:34:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] mmc: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 12:34:01 +0700
Message-ID: <20260813053404.21553-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223421_802671_CF8E3F3E 
X-CRM114-Status: UNSURE (   8.99  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling for optional IRQ lookups in several
MMC drivers.

I noticed that mmc: litex_mmc handles the return value from
platform_get_irq_optional() correctly, distinguishing the case where an
optional IRQ is not available from other errors. This series follows the
same approach in the affected drivers.

Changes in v2:
 - Use parse_fail for proper cleanup on IRQ lookup errors.
 - Initialize cd_irq to -ENXIO.

Best regards,
Phuc

bui duc phuc (3):
  mmc: meson-gx: Handle errors from optional IRQ lookup
  mmc: davinci: Handle errors from optional IRQ lookup
  mmc: davinci: Handle optional IRQ return value correctly

 drivers/mmc/host/davinci_mmc.c  | 6 +++++-
 drivers/mmc/host/meson-gx-mmc.c | 9 +++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0


