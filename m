Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956BACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5jBBtH27kqbFTX1MrIF55iLAuenItTJhzKigqLVUXl8=; b=D2tXu+RayEf9Ef0hY/uaKbG73d
	C5zp9sjaNPx8d9aDUcG/W1Mk69+nuzVnvRLtpLHJ8XWz1gdpH31MEOLZo4pVGQ4hlHIfCaW7zZTn0
	faHyBmfwbHCYi/eJwOtfKk0lZTXC6QVTFfQ6B2ffKyw/lJi8O14/hM17cFu/X+YvdTpHLSoz968YV
	wclTrky2gT/WbrQ9YgjtTumkwcn4D265+DpcD+oXr3JxQEKruYf1R4RE3V+ktDf4sSCbJFD7VZcAR
	qlu9ozeV0DS7udHq27cc6JOkUebT9bYEAIC1DZWKMgGINf39FTeCBYmxHzWKL8SxEvPhOwTSXOOTX
	X8mDbNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHYW-00000007acf-0UlG;
	Wed, 10 Jun 2026 11:57:12 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHYS-00000007aYp-0lXH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:57:10 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8422f148dfcso3841913b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781092627; x=1781697427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jBBtH27kqbFTX1MrIF55iLAuenItTJhzKigqLVUXl8=;
        b=ni305ImW4dwlTJ9aPMjcirpC4n2YkL/z6DF9SjVcT2eGC0KgaqSJgvFJO089M1FW8h
         I4HhQt/RLokqGhirHY71p/m+tQzmjd+gUGPEqQyi+J2RTO5IvFqHxzeKa9DPyNqE5T37
         ZktTyjSjPTYQBxLUajNWf/K2Q7+wT9GEpVdoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092627; x=1781697427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jBBtH27kqbFTX1MrIF55iLAuenItTJhzKigqLVUXl8=;
        b=MPjXfGEJmfp4jAzdX+U+2maBnQE+9P0LKjOxP0eFANrtdv/qbcWK3KjJGaKR5lw6iT
         5bv11YdJYmOYvlBPJbOCfGdKHsPA+p/uqklw7DAnArsk02RiIb5ekTZLOfM99sSwwMOZ
         j+5g4m5tkk3gZayjofSruEqnvR1KJNih4m1PLP4YCY1OZuXGU6Bu+3nD7Z3pSBVVDh54
         Fz/Avz+aHx0Y13jkO1rqOdIPnqIzw19TwWDKi6FA2Sj7DmaRwm/NAFSQe0WhRGHLl+fQ
         cKr6jOUBHIhTQGfu6YowHaNeBiuo72ULjUlGH/4cK6zrfHK3zpSkQa5CshICPuh2s9oZ
         RRSA==
X-Forwarded-Encrypted: i=1; AFNElJ9DfudGBqt6TszNGa/+M3wJpiRmn2yMwYDQCK8o63gazCSfxSJGxUtulJ0zA2sfohewhEwCVhZS6FXCSH+sw0q2@lists.infradead.org
X-Gm-Message-State: AOJu0YxS6lniA9FMb73gPo5Pvi73IgSfiSu/RviuXkyVfZJ00bGXlkJv
	CYaW6eKSiPsFhH5hvbvVySXL63RJd+LAkpi3S09SKRqG3T2HVuZx1VP6XB4M5tj+E2I=
X-Gm-Gg: Acq92OFq2D5i8kW3IqBb+Zn8XqCzZWLf5d9lGdH5GGRcXCRD2U8chz6ED53C+jNWFn4
	RSnT7kJKl/E6xsE2BkpH/+mS2rgW3YEA+252FoDc4lQJjViCHWWrEMz+RF9XhicwE3wSkofvu/s
	BAWHMIi8IxIzrW/cKnjCoTUyKC/Y85IPWocqVhe05jUf+jID6dZrjDP/T8sVGCDGriFWCNDC+6N
	2qJO9m+a+TPpfmqYKxr7t1HQOg0JwA6xzQj941ncpZ+dyi+3Mz14a4meNHj2CG2N0PC46p5pctC
	1aiwIkk0qTQ3KkP6daRh1Dky+c34fUNhoRb9gw4Rx0d8rTDosddcI+iGmHuOBPAnUXj94FTSDqL
	nPuTYvP+wt9tGilD4WEYeniBsVh7oSVk0Wmj2MiocSj1tfgnGQLlqsa2JFCsO0nWqCGSnepJNLD
	6g0YCtgNXd3cTTF+ub1Q98bINb0jslLZs6R2nral/ydA51owSD8h+UZ0ZwoFkMgHV2n+8=
X-Received: by 2002:a05:6a00:a10:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-842b0f52ec3mr26405130b3a.24.1781092627121;
        Wed, 10 Jun 2026 04:57:07 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm24249042b3a.31.2026.06.10.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:57:06 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: iio: adc: KASAN wild-memory-access in complete() on early IRQ
Date: Wed, 10 Jun 2026 20:57:00 +0900
Message-Id: <20260610115700.774689-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_045708_232520_EC6E21DF 
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

Hi,

lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
spear_adc_probe() in drivers/iio/adc/spear_adc.c register their
interrupt handler with devm_request_irq() before they initialize
st->completion with init_completion(). If an interrupt arrives after
devm_request_irq() and before init_completion(), the handler calls
complete() on an uninitialized completion, causing a kernel panic.

The probe path, in lpc32xx_adc_probe():

    iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
    ...
    retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
                              LPC32XXAD_NAME, st);           /* register handler */
    ...
    init_completion(&st->completion);                       /* initialize completion */

spear_adc_probe() has the same ordering: devm_request_irq() for
spear_adc_isr() before init_completion(&st->completion).

Both interrupt handlers, lpc32xx_adc_isr() and spear_adc_isr(), call
complete():

    complete(&st->completion);

If the device raises an interrupt before init_completion() runs,
complete() acquires the uninitialized wait.lock and walks the zeroed
task_list in swake_up_locked(). The zeroed task_list makes list_empty()
return false, so swake_up_locked() dereferences a NULL list entry,
triggering a KASAN wild-memory-access.

Suggested fix: move init_completion(&st->completion) above
devm_request_irq(), so the completion is valid before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung

