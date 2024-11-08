Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EFED43357
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SaISgbIGwpAO1EVVDtgSTHmyzi3HxAQHzUJmlDOmvT8=; b=R7ydgtEu1NF0yoH6JlXHuhAU91
	Xt4+LddbJWLcfHTzKdtcQSue+WhNuEug1/sYreJJmQTDLXE61/DUcLHKuWf3gLeyual10FHjK9kVR
	csA8RwpFZy6BCw5VFh05AgXTOrFtoDHaiogCOjBvID0xkF+X4WfdFHlv49TF9W8j3lr7U1jAveszJ
	jzWylSmhAGv1IUWUEg2/d4gsVrIe6JdhOKnuSBKftvSkw+M1g/DfN/GuX0AQhGwWzrf9yJZ23iCi/
	ZpRCCQ1jnFf3RWofSDWINBRSxCMpmqGkR1Et3jcTjTxM89RyuVEFLJ+aHYLFZFpl0I+LKwxgpa6N3
	6hKmAB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NbL-0000000AQY2-32DQ;
	Fri, 08 Nov 2024 11:56:31 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MOI-0000000A9Nn-2fyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 10:39:00 +0000
Received: by mail-lj1-x244.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so29607091fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 02:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731062336; x=1731667136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SaISgbIGwpAO1EVVDtgSTHmyzi3HxAQHzUJmlDOmvT8=;
        b=WYfb+QwP6tVJOqp8XeLSG0C9I2n/VgqVRk30GOhmtPUhOliRdSET1rIjPEmdxdKknl
         fbh6FQl4XAalD9LB3znyYyJXaj07C6dayvFm2SqeMXyGIZ4by8x0XZJNf1Wmw0JUWyYu
         OQ79E04CJQy6g+sgX92crDx3+dAZLmBkci+PN9ENnKy0CWjhJITpO8IibcBEEFQzXfF2
         nu1fqezK9HMB+brUsliw0kemTvxmgcrMI07HCxAID8OYF4Nc3hntfpGKgyWT5qFdFw8A
         MTff7HKDFjAYtXUtfW42cznkKOCyQBybNl6g/in9WsonHlPQs5EW0Ey15dWwLj40hl5f
         SKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731062336; x=1731667136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaISgbIGwpAO1EVVDtgSTHmyzi3HxAQHzUJmlDOmvT8=;
        b=FTZGUCwQOZq+AvwljrH7EZBRTdJ1qtKWiQHb5AaUVOo85LiNQKQAjJTqdHXDpoq4KQ
         7JKEzjr36XHVa6EsRM6LmN9+5ozW658QcfEGiBxV47SN7Cp7D7oyWY3MqdLASYt4yRX7
         ETMtb6DYP39ZgJm6c2a8Tf61EJLiFNPG5inw+iRBjCLDFckYgR0Anjh5trAGfIPMEeyh
         1jHG2iyUAcqtiVbyqL3CPByxskUoZ27mADfEj23Z/Zjn6hJdck3CTwM6/MMKUNkbWF5N
         DQy9kXfw0qEjrk5OVdI6phGUHhsg3expzKZOfPFzuCFbF190Kak5hv8a1V/UK+TxXFm1
         5xHw==
X-Forwarded-Encrypted: i=1; AJvYcCVOXl+3+A44I9ILuzb001DWjT/WqxZzl9kTZ/10zbE11LYNim5O3InUkJWtBRlIPGVHFjhh8iaM+nodtU5HSMZn@lists.infradead.org
X-Gm-Message-State: AOJu0YxDnmD2rndrsNsWtJWPI/PWC/nwmCW77HRER6lHPqXmkkVdZqF/
	QVkZ2I03Q0XQusbJMrkdPAjSgIQv00+6VlRPZ9/NOkpiF8c4VqOb9hfkfjWPB9o=
X-Google-Smtp-Source: AGHT+IH5UNmzHaes0cojtKWppdmffN914U6rvrc+ZzaB03JePe9nRLbAK00wuir/DGJiOezZXD0K2Q==
X-Received: by 2002:a2e:be89:0:b0:2fb:51a:d2a with SMTP id 38308e7fff4ca-2ff20188132mr19417491fa.12.1731062336127;
        Fri, 08 Nov 2024 02:38:56 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0abe6e3sm213730366b.84.2024.11.08.02.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:38:55 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 0/2] Preserve the flags portion on 1:1 dma-ranges mapping
Date: Fri,  8 Nov 2024 11:39:19 +0100
Message-ID: <cover.1731060031.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_023858_704353_46249523 
X-CRM114-Status: GOOD (  10.77  )
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

Andrea della Porta (2):
  of/unittest: Add empty dma-ranges address translation tests
  of: address: Preserve the flags portion on 1:1 dma-ranges mapping

 drivers/of/address.c                        |  3 +-
 drivers/of/unittest-data/tests-address.dtsi |  2 ++
 drivers/of/unittest.c                       | 39 +++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.35.3


