Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25B8C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LksaQirVyyRYvWZqZp8juYzuZLaLOR8yizwcni9laKI=; b=iAZj8S2m343sP+cuuHnWpr0JHY
	TYD5T7oJwe4RBdHZZDMVH/9fKxS86m03SfdoTI1Aiif2p8mhw3M1UehINDuGbo79pTd6TU1phkS3i
	LHNzdR12xERuybCf/cDfFUh97JA/B3IHm7CL5/f+rgje+aJFVtqZFgG6Y9U/voCSwQ5ZC3KmadYD6
	s29qxuERWVmrBwpxwUJ1jq4wrTRl9frshhwM5kRwUnMabWbKCWGwuNwY++18/bIG8F8qw/N+v8Whc
	OQSD0MV4xs2WU9MhaIJbCh1PcBI+Ms7haljUhEA5y6E6O7r7W6V99GAk2BDoLEUDOkIV3OqtzK+ES
	fDysefBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaQ-00000002Q6v-1VCN;
	Tue, 04 Aug 2026 17:05:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaM-00000002Q1l-3F70
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:05:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-ca80d708489so101562a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863149; x=1786467949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LksaQirVyyRYvWZqZp8juYzuZLaLOR8yizwcni9laKI=;
        b=gwSm5+zxwp/wysVNPzNmGts7E/Itpd2MjjOusk+siDQmf+6RrJGZDGiTdzU/iW6/zh
         ne3u/DLSukrb9tszj2JG5QExHuUE/kvbKwXuUyM8gJmwriGwUAoO5SmkbawTQDPMOzpi
         4+5B1103Ps94JWURi9jJhAQu8U2DcQJF/P7T/ZcbBZ9F4rds+pJuE5bDmli7ftYSFSdQ
         2WF/4vnYUpfzUKkcJjNZyi3pxcgFr1lrscGnDU9EU5E61Au51Jy3vk+jctZCktJ6Siyq
         nlC3fGmKGzNsB8KPbHhejDpbRxyPxFbHNseEWgZFE2fDMTLeLkYyjc7FZyh9ptF5/acs
         pDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863149; x=1786467949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LksaQirVyyRYvWZqZp8juYzuZLaLOR8yizwcni9laKI=;
        b=LaqQb6PCcpK6SgOu69ahXLZFT2It+ZzK+jqiBz9UYqC6qYpAZ/m0oQN+8ZFceBP5UL
         gRXum/P136V8Nni0gptJkipMY8lY/rpdn/23EJT4zIrPeYr1XUzmWofhmVHupckCrmJV
         RCRM6qfq9pJOK5Z0tpyHkHBAE5JHvd+6S7ASgGOGMXDEym5JjLz4kNVfYBpLm7H1FzwR
         P6QxEBgyrwHg2o+mhNLD1UwjQ8J0CbnkR8hE6evsb4LTCNyEI10xWyPet/dl5rDNOn2A
         FzLtb3MIvrbasyWfI975nw7bUJztl4XAJDvCUfaQvdeEOpj4LvTakN6AGwDCIgW7verb
         O+8A==
X-Forwarded-Encrypted: i=1; AHgh+RrVLXKCzym3KykXC8Uz8gwHB3Oq/JtHb/JunSP5ZERedkvYRN3zPtLLlujHGF9fa4iHMErPcM5gqLhx5LYwE8tZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwL8l2C68j95FwpvWm+h8c5YJmqP1YC7k+O/p6Fzgna8K9HJPyb
	+m4HVvPLE5WexKhwTaI6UnQWluKqX9ERHpAaIYobbiIrZnIgaBKLB+jXl4MEA3j+MXA=
X-Gm-Gg: AR+sD12lZJegGpGNH/2cW9h++llW+tPsiqfr62HFFHDfWtT6OA60qGChAlBq6+3NYCZ
	1a5uE5TLe4LLHDcYW40AxJucKqQZY9egdBFkfK7OLHhLq90TWt7gyR+HdIi+DV4ac5Dyd6rBnMB
	fxZMuDEHxStOeIv/2WtOsdjYTvms1GXKY/CiiHoe/suv225YmTjthZkwwGxPGKRP2y1Qe983crY
	MoDtsGGJJDbumMlrSAodGWDq8mmm0O4LJtUaxqbCF7J+AZkCBsZIlDVGvD+RZ8dyGuBTlSKrUhs
	/8YSf1SsDqH0Mt4bLMvAIRmIT9NyhM72hfVsSYVaC6E0OdMqFSVe+LG9BHdPAZPc7MS2vqXrlPZ
	eM+zXOGVR7e0zwy1AH4TnAOXmXACy57Ls7eBoFKQtbptZOoQ1nUf1cmLTHmPdG6wcsPWugnWZ8q
	UvJXLlir9z8jqEYFyBCh7SwqRyoyQzbhoEBr4wfNxLQl6t3dZuBRxuuLqIVdQ=
X-Received: by 2002:a05:6a20:9392:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3cb6c7536cdmr5854873637.4.1785863149251;
        Tue, 04 Aug 2026 10:05:49 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:1461:a94d:d559:948d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm7230582eec.0.2026.08.04.10.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:05:48 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v5 0/3] iio: adc: bcm_iproc_adc: Simplify probe error handling
Date: Tue,  4 Aug 2026 22:35:18 +0530
Message-ID: <20260804170521.196393-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100550_832235_60D7EC77 
X-CRM114-Status: GOOD (  10.44  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

This series simplifies probe error handling in bcm_iproc_adc.

Patch 1 removes redundant probe error messages after
devm_request_threaded_irq(), where the helper already reports the error.

Patch 2 introduces a local device pointer to reduce repetition and
prepare for subsequent error handling cleanup.

Patch 3 converts immediate-return probe error paths to dev_err_probe()
while leaving cleanup paths unchanged.

Changes in v5:
- Keep Patch 2 focused on introducing a local device pointer with
  minimal code churn.
- Convert only immediate-return probe error paths in Patch 3.
- Leave cleanup (goto) error paths unchanged as suggested during
  review. Those will be converted separately together with the planned
  devm-managed cleanup using devm_add_action_or_reset().
- Improve line wrapping and formatting based on review comments.

---
Mohammad Shahid (3):
  iio: adc: bcm_iproc_adc: Remove redundant probe error messages
  iio: adc: bcm_iproc_adc: Introduce local device pointer
  iio: adc: bcm_iproc_adc: Convert probe error handling to
    dev_err_probe()

 drivers/iio/adc/bcm_iproc_adc.c | 48 +++++++++++++--------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

-- 
2.43.0


