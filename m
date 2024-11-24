Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF48E66894
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=; b=Wbrlr1rkezuaaDKL4pKyRVJMCD
	UW1lVgGRK6zbtSEwyf4Nb3xuYMSJvmgqajoCNlrdNMOQa2McInIQa7Rj7DK5fIZkYbJJEUq1jF3kz
	meXjYQcKm3OevhPu+m+KevlVxDzZ3LWMNI7rXt8FmD5UYBGUBcS7g2UxzxIHKaZGRv/C+Fw7d8qTa
	rRcE6BL9pGDcVu1azzpj0YmTqSvoc2QSdY9uOBQqaqEkH7gM//fIlO+P9jE1epdhJAlNinhJ2wQDA
	Zg3LP00WwEma1OUF+GQR/H/+V3Jc5kJ7ujBxj5iBXHb33MAXcwpTnHrUNSWNqw2mf2RVpwwTj4H8y
	5b2tKplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF9VM-00000005bOw-1qMQ;
	Sun, 24 Nov 2024 10:06:12 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF9UN-00000005bBY-1uXK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:05:13 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-aa5325af6a0so148277066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732442709; x=1733047509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=;
        b=QUMf1b7tpaX8oSq1v97YF0Yr9i3X/rFw9TIF7vsmHZMT8ntxfaXkqZkeVP6w/oQZZD
         CO4Nf6J+7TPfGP8EL8DZKuCRWWBQwhx1+xk0LL1e9SKwPp55FMUKrPmoPPBdJ5pEdKZ1
         5UdLQGmuvS/Kh6mxdoTj2Y2K2IN1yKTO/iEMUuDKZvMwwQceEvM12O53+c241xfXmeH/
         EySO9MU6HLL0KBSMJPRrnrB7WFittDXsuYwJL7y0zIPFT7Q2kAXszrYLucfRzDWpRlig
         0T7R1a8kJZvEM4CpmCIVZ8jW7I08P7jWP1boKrU3nIN42d8dgqrNesm8GcUR+21x1C08
         j2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732442709; x=1733047509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc/jEUsBswYkaNb52ief0DkwziwerNcpWx/rdhbBFpU=;
        b=FjvqlGTnFGyO4VZFZJbS7iq8j475UC92PHrZQrjMU+o7zUiA1ZipRbWHAnXApHXOTA
         sbsnkqsFeSV33Yj0CivSdxAzT/Y/7JOZFOsfGDFd0IYrLYs/Lzg7KVMnO3TBxNy3FJeP
         Yp35uwUXKOEMVMJmdtPTH/Y/d8+CptBPX6+FdGSv734gwS55kOJkG5M6tX97fNjAkMgH
         trl1/f9Fl6rzrKtG1HfSqpuVwdtlPHnB/JUVqGt/tfS2sanoiUKD4CnSjDREapsFs6cr
         8BNEzTjWb/AG53V8DOZs2htgYMG37hMlq4QRQthHD0eyG2hqPPHdudSZ84RUHUxVZvvv
         HM6w==
X-Forwarded-Encrypted: i=1; AJvYcCVGIkzxILio0aqwcoS+aX0DbKHKi56QmoJ0B+iwXkx2SJQFa8er0n0kvbGIdjMotA+RV9XVPeO8remdFuiWdR2u@lists.infradead.org
X-Gm-Message-State: AOJu0YzqDxpqlc5ehWOuOqSgP1Cn9IM7Cqreo7dsWWHWrIis16Pqdmlm
	a8INKNPwqPdKN7/po8g5zB4JghD3iFMvasXF1w3ji88ELuVYCMB75jjhoQIHOAQ=
X-Gm-Gg: ASbGncvZx6MJqVHvtpNYhkOLyR3Uiyy6bHkmbNoUmxpGadf4ANeFYNl053b8Vto+C2k
	PaYb9Np8BqL1UQffimzbGKPE802qMW0t7agiG+/l9Uw+N2Z5EkD9bx/OCCWuDFReyCjgODfk6vP
	bnDoWa9JsxX98J3Cp3dnymtSOjBVqT55lIAXi+Gn+IXixYIfUrqSemT2liF6Co7EtwLpROadrlL
	Ht6EkW+Kk3rslFq1vCDP9qp9JoFJFRC6RshUV1orqTBaPJ17gnGvk3a8kThq8LfvdPKOGabN7I4
	jjikTcJw57bHdumRZdf5
X-Google-Smtp-Source: AGHT+IE6n1Sl2VjDnUF5IiR4wNGa1GDW8vw2+O+cu/s3Q+7FHS16Q8BL2O+lyk7mxoO9jBhc7KuPpQ==
X-Received: by 2002:a17:907:77c9:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-aa50990b2a9mr726045266b.10.1732442709155;
        Sun, 24 Nov 2024 02:05:09 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa51759732asm295266666b.14.2024.11.24.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:05:08 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 0/2] Preserve the flags portion on 1:1 dma-ranges mapping
Date: Sun, 24 Nov 2024 11:05:35 +0100
Message-ID: <cover.1732441813.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_020511_519968_A2AF73F8 
X-CRM114-Status: GOOD (  11.97  )
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

Empty dma-ranges in DT nodes using 3-cell address spcifier cause the
flag portion to be dropped by of_translate_one(), failing the translation
chain. This patch aims at fixing this issue.

Part of this patchset was originally preparatory for a bigger patchset
(see [1]). It has been split in a standalone one for better management
and because it contains a bugfix which is probably of interest to stable
branch.
I've also added new tests to unittest to prove it.

Many thanks,
Andrea

References:
[1] - https://lore.kernel.org/all/3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com/


Changes in V2:

- Added blank lines between paragraphs in commit message for patch 2
- Fixed a comment to explain the code behaviour in a straighter way


Andrea della Porta (2):
  of/unittest: Add empty dma-ranges address translation tests
  of: address: Preserve the flags portion on 1:1 dma-ranges mapping

 drivers/of/address.c                        |  3 +-
 drivers/of/unittest-data/tests-address.dtsi |  2 ++
 drivers/of/unittest.c                       | 39 +++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.35.3


