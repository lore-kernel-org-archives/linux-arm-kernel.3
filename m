Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D394CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TBin7H0Wt7Oi8P0z8wsZgQQjqhBwvW2vxMHjxdsEcyI=; b=d9vMlEYQckI91xRv2XD/+aGlhj
	gmRYHll6pfHYYatGJXGvlsGWm5Ev7aJ5/5nkuVTPi+clqxLtGcLlM9b6CdGSLzKP8SFYL950p4svv
	izahxpu6HfrJhrkSraQ2TLoIkg0OhPIO0dgcGMRtUdpPxyndiVSbHj6kHtw7hQZ9hc0Pp3MYDNlKx
	Br9WjhVGmLQ1EzJI1hDRZRMDzw+jRk6rKur70DqITyeXhcsnhH87Zi5aTMZx3ASxOr/FTdzeZx1Ef
	kK2s7m1l0ZcPDm1fzGqDbpbm1Zdxqf+sa3tcHK+k3cuPA/rBluBIKcd73jhv/YyzD12PlJ5iWi/BM
	nHE0IhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgV5-0000000GXBE-2bSh;
	Wed, 17 Jun 2026 02:59:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgV2-0000000GXAp-42RV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:59:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-842848fd613so4527986b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781665172; x=1782269972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBin7H0Wt7Oi8P0z8wsZgQQjqhBwvW2vxMHjxdsEcyI=;
        b=EV35SucQ74Hre9eXucqx2mTzb8C4imdMkFgSReFtcbIzkGzgljmwFV9ofP9qIFbjML
         HUAvSpEDXfUH7UzrNjCdHaC5cn4Mmnn3F8Th/HwjmBycTT1Cu0WPlbHcgcal5BUJWWzp
         /49lyfh7jJjlVfj64eaQqnP53OZotMj3fpfofhzKESbjy08pAOW6TImWPAFFu6YC14AE
         n1kWc/+069vVmN1+YjLzNlIljR3fq7JfL7mvc36vjVj+7nmk01/vPEqY+wEm5eB99iMT
         UBu+zBkDFslIPSu3EWMBhDrKfi+/gW+tNhvZmtWzru09eSTgE17vFGWtlgetvStatHbm
         rm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781665172; x=1782269972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBin7H0Wt7Oi8P0z8wsZgQQjqhBwvW2vxMHjxdsEcyI=;
        b=XWsSQK+WcXATSCf3JGVoXMBq9gJrwq079b11oqqWkRE0e1AHfGsqXaAla8+XV/zPCU
         EgqNL33lxsWq7WkzIHoSPe+t3OlI2csZTyKsWFkp09MrhqijsSk+XaQq3kfkbwEYN1d3
         piiHqWZ2MquqZIbtrMSHQp3ZZMtxPKdYZ4T5qq/u8FkM2Ufr6ImIqpvIqfA7TFstceQH
         KCz3E6k3+ANfhrOO63FZ9vDOsF6NlD5UjyYwnIlQFyMMOT9hMvMQPZcfLcGIVXKdDozV
         sCdEbsmoaRis3qZCQqvLF1m96xijJzdyIrGIYkmvaFNvkhhhmA/2VhSYu8c1nJAllGzw
         L+jg==
X-Gm-Message-State: AOJu0YzB+1XKLzMHFufX7M881wFlswZgbr9qgyZXl2N1UijMR9wxQelA
	DAH/G2FLfogOEfC00QWPxwyvu6jyvwlTIuoomXcpuZqlU2zQmrK8XzsA
X-Gm-Gg: Acq92OFYpHdhvGKd1aETGJXXU019BqZuHJxTN7cevvz3aO1FM45LwNnGS5klPhh3tlk
	U6oHP0EN/o8Y4wJ0Tj1fsv3mB0izDFwj/fEpWI+NuM29KDs09zg5EoFTEJpeOsrLMeUMa3MAgTU
	5F3jgLLcDnhljP5V1/V2ZL70i34wDd6ZsY9EmlEfIlD1v8sJJeQw8Yndez8ch9ZfdAt4mo/KIJC
	B+aN0OtaQStG7ly73OR3kJO2Pu0kMr7NbntL9FNdDJNRmpWbbg5T33IPCjBjc6uITZ/iSEyn4Rt
	cMY8AcmjOs6ItaNRC7BUrwnSSxdc6FLchYBkeGUyeZAPxqxnWj/+bP3iAe8NlxW+UBsX5sXhiFH
	kFwpsoa9XVf7yUBTVOnFOmxzmiCYiMfG8gavWlHrhGm0wZLSDUTgn593PNMiTnKSc8ui5VFGYPR
	b9iYqu/4dU7TzHOGvvPC1nqTk35jZaRy/xlOe5C3le3oW9fiUzC3Xk5h2Q1M9FFVjNFB9aSmB1/
	7A=
X-Received: by 2002:a05:6a00:2987:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-8452454cd35mr1655165b3a.26.1781665171696;
        Tue, 16 Jun 2026 19:59:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc825csm14212821b3a.36.2026.06.16.19.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:59:31 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Wed, 17 Jun 2026 10:59:23 +0800
Message-Id: <20260617025925.2539334-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_195933_002785_95B11793 
X-CRM114-Status: GOOD (  19.54  )
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

This series adds support for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels. The hardware supports
several counter types and output modes. This driver configures the controller
to use up-counting mode, auto-reload mode and independent output mode. The
waveform generator is configured to drive the output high at the zero point
and low at the compare-up point.

For the up-counting mode used by this driver, the counter counts from 0 to
PERIOD inclusive. Therefore, the programmed period is PERIOD + 1 cycles. The
hardware can generate 0% duty cycle with CMPDAT = 0 and 100% duty cycle with
CMPDAT > PERIOD. To keep 100% duty cycle representable, the driver limits the
maximum PERIOD value to 0xfffe and reserves CMPDAT = 0xffff for the full-duty
case.

The hardware buffers PERIOD and CMPDAT updates when IMMLDENn is disabled. The
driver keeps IMMLDENn disabled, so period and duty cycle updates take effect
at the end of the current period. Polarity and waveform-control changes are
applied directly and may cause transient output changes if the PWM is running.

When the PWM output is disabled by clearing POENn, the output pin is put into
tri-state according to the MA35D1 reference manual.

Changes in v4:
- Add a Limitations section to describe the hardware capabilities and driver
  limitations.
- Add a link to the MA35D1 reference manual.
- Replace register address macros containing the base pointer with register
  offset macros.
- Add readl/writel/rmw helper functions.
- Rename TOTAL_CHANNELS to NUM_CHANNELS.
- Use unsigned long for the cached clock rate.
- Use devm_clk_rate_exclusive_get().
- Configure polarity before enabling the counter and output.
- Add controller initialization for up-counting, auto-reload and independent
  output mode.
- Configure the waveform generator for zero-point-high and compare-up-low
  output.
- Fix the period conversion because the hardware period is PERIOD + 1 cycles.
- Limit the maximum PERIOD value to 0xfffe so that CMPDAT = 0xffff can be used
  to generate 100% duty cycle.
- Use CNTEN and POEN bits to report the enabled state in .get_state().
- Disable the PWM by clearing POENn and CNTENn.
- Fix error message capitalization and trailing newlines.
- Fix coding style issues reported by review/checkpatch-style tools.

Changes in v3:
  - Update nuvoton,ma35d1-pwm.yaml
    - Add maintainers entry
    - Increse "#pwm-cells" to 3
  - Update ma35d1 pwm driver
    - Make include header and macros definitions organized alphabetically
    - Rename macros REG_PWM_XXXX to MA35D1_REG_PWM_XXXX
    - Add macros for register address

v2 resend:
  - Remove wrong 'Reviewed-by' tags.

Changes in v2:
  - Update nuvoton,ma35d1-pwm.yaml
    - Fix 'maxItems' of 'reg' to 1.
    - Remove unused label
  - Update ma35d1 pwm driver
    - Remove MODULE_ALIAS()
    - Add chip->atomic = true


Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 344 ++++++++++++++++++
 4 files changed, 399 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1


