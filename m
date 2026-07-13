Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F761C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ww8rjm+JZiZBaoDFPUpDnonQY3B9G9iGUaqmjxdFhqE=; b=Bu7bvLngZ/R5RdTR4gmEjiIZ4L
	48BqNwOzORHyBl2QqgQRVBzYJQQcARrges1mivWhXL6jZKSY1uu8AnXFO4B8zSCOyQc2AqNoQypDt
	SJl0C7EyOx5PDEwL8Q9G9Wf+mm5jQz6OhyBXsji91IW9kg3Sb+kSRBsXDGNEAVXWJsVcYgD+D5ldl
	JnCvzQfPC1CqLF7qGpb2C3eoN8ggYbfv8rkReMqs/1qBJcBcAsGFARSazZUCfJoyLNDljEp7CloYg
	U/+xVlVKSaxthhhMEKAOWrTBkbBVJ6ft4GKOR5iLn7EUwh/IKRo3iNuSnOEHQDEgN/+daVRuzo64e
	MfdJ0kjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBlh-00000008XfE-19Xb;
	Mon, 13 Jul 2026 08:12:01 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBle-00000008Xdf-05iK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:12:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso720808a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783930317; x=1784535117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ww8rjm+JZiZBaoDFPUpDnonQY3B9G9iGUaqmjxdFhqE=;
        b=fJyfwbGBuQQLstlhLwKAxWwryt/XOOlviujHEkcEVJN2qlJGxuJ0EWunTFgGjgNP6G
         psds2Dk0NhYsUH/cJ/ga08ml64kzZiI0pgd3Mok7hjrHtOGaPgUZDC+WR3qz5x5VYAxf
         H+qpc+tIgnEDHE2hVQHXLb+IpowLA2lSVqDSe0fuo5iXKTUMdn3X//lG4HdlIb4NfRyk
         unHUXtTBv0rNUxF4ThVsgCFigAC41IOYqLT3A90HEu/+Fu+syLes1XDx5OsGXvyGfZ12
         OX4lRN+laHR281YMkRQeSKKQG+If0vMxbRnHf5BEZnVxGwd2y5oJlxkS2me+GPhDDQci
         Sa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930317; x=1784535117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ww8rjm+JZiZBaoDFPUpDnonQY3B9G9iGUaqmjxdFhqE=;
        b=W/FChoznw9jfhycSXH5LZcQCM2TK+zsKRXqElWuA92m2Vejs/dx2czo1IXKkzGlId1
         aswFuBZR/dto+ez/3CmUZ15RJVeLjSQqfHYXhh3yCXL/ZITGIqOKbifETZyoaHfuVZ3+
         WIdhOPG0CLkn5An08tBq/ShMQMC3FW7F2JH9m5TYIPTgO1BjiLIIIs0bxOtrXxGtPprk
         /Je2P6qIvEGgIk+ewclvGDczWJJpr3vuUXrlDX9XBuRZ8w8Se3OiBJ8R7ohW+htnscCa
         Cb8ZXkzzsad4ejY9YS02wfoIvtTOhjh6wpowb/2/o01mhDAIlUlBWxAGa3JPxhDW5kK0
         WIIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmse1E1qc0o0O36jJVevg4RMPeS6CU5TPrpqx80SusMAIWK+qQExnN5AK+O+qmFpoOFhg+V/IXI6FtQ8/fCCdI@lists.infradead.org
X-Gm-Message-State: AOJu0YxbVk3wtH91XiAmeibn4lUbC/MEpsybselKUXzGjCvhrxyCKSUN
	Ao1LDJtnNCnq/pr4ZzTF5ojqb36ZiSLDjtEh9OnwgYL/YkmBZk8u9Z+g
X-Gm-Gg: AfdE7clQ4cLHIkbm/Pry3GQiorTamtjZeuKytnfGSzX3ZZdO4AMMihHdk6U8+PAgOIP
	ptk+u6e/+Fxy/uGv3sDTDzj23/iDjvKCRRscPUQs6E2MLMRNsd7ZMwaW+RmG5QS5KOs2DNjMHDb
	jryB+GjZ5Le2pvG7MeQSuyuihmdUiHRIOG/7e3uivO43pI/o3lrvzMiYL/1x9jhQgxOXmPcOp/O
	qBD5xzPk/NlIff4LC6QEwxiIWN3NQS0aNHmEE5FvAOnbMpo65Zxs+mLQdCr84csnA8RrNsDDGms
	NR0NfFQjsFMVwPbR+kG0TYRbM1V2Xz7e2WzdrkeOV3K9SwISer+vcC2IKAiMEeTvI4Dv6YM8lgD
	aasksRlPXFaxonXvVkr8L6ksuKCR/850xav+HPVmtsordvOVOMwk7Qgs6UObgwZgxS4cRcyMQA9
	91yHwsVol8PmW1XMX0NHnggNS6fT4fOlWEBPs/MiHbD8z0IUMKy4nT2fzxo6NYZgmUWZBTOaFtc
	+0=
X-Received: by 2002:a17:90b:3c0f:b0:37f:f089:c81b with SMTP id 98e67ed59e1d1-38dc8071aeamr6520796a91.3.1783930316522;
        Mon, 13 Jul 2026 01:11:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e0e033de6sm269636a91.13.2026.07.13.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:11:55 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Mon, 13 Jul 2026 16:11:25 +0800
Message-Id: <20260713081127.115197-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_011158_065642_9A0EF057 
X-CRM114-Status: GOOD (  13.83  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds devicetree binding and IIO driver support for the
Nuvoton MA35D1 Enhanced ADC controller.

The MA35D1 EADC controller supports external analog input channels,
fixed differential input pairs, an optional external reference voltage,
up to four end-of-conversion interrupts, an optional reset line, and an
ADC-to-memory DMA request.

This initial driver supports interrupt-driven direct raw reads and
triggered buffered capture. Buffered capture is paced by an external IIO
trigger and is limited to a single enabled voltage channel per scan in
this version. Multi-channel buffered scans and DMA support can be added
later.

The driver supports both single-ended external channels and the fixed
hardware differential input pairs. Differential conversions are reported
as signed two's complement values. The ADC scale is reported using either
the optional external vref-supply or the internal 1.6 V reference.

Changes in v2:
- Update the binding to allow up to four interrupt entries for ADINT0 to
  ADINT3.
- Add optional vref-supply, dmas, dma-names and resets properties to the
  binding.
- Keep diff-channels in the binding and restrict differential inputs to
  the fixed hardware pairs.
- Limit DT child channel nodes to external channels 0 to 7.
- Use regmap for register access.
- Add optional reset handling.
- Add optional external reference handling and IIO scale reporting.
- Use the internal 1.6 V reference when no vref-supply is present.
- Handle differential conversions as signed two's complement values.
- Use an external IIO trigger for buffered capture instead of a
  self-retriggering EOC loop.
- Limit buffered capture to a single enabled voltage channel per scan.
- Rework suspend and resume to save and restore the buffered capture
  state.
- Use devm_mutex_init() and scoped child-node iteration.
- Use the new scan_type.format field for buffered scan type metadata.
- Drop datasheet_name from channel setup.
- Address header, helper naming and cleanup comments from review.

Chi-Wen Weng (2):
  dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
  iio: adc: Add Nuvoton MA35D1 EADC driver

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 740 ++++++++++++++++++
 4 files changed, 916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c

-- 
2.25.1


