Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CF1CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wki4wD46J9sHWa2HWv+VTuD7xLgHt9zo+ivAkfQcV1Y=; b=uoIGv0y/ShehYdV1+d9kvdU8Mn
	WnJMecEIWEQ23uDvNCYGtJClrXBtBp7boHGIZIPeMi7skjhwngRJvBSL0N+a+69+CRpl9AYmoNAe3
	mtYNxgwBmj5Vl/SVsDMDnXcjsMat9cV4oz24lWQtl4DnHIxAGRMTqBEZlJz5kBfS4+rpq5MUaHmBs
	lBdmX535xX/WJLOwvCmDSDE6BzXub2nhbufcMNCWvXC4FGQD9qYyb3hZMCoId60WUsPQhQnFJ4NdY
	b67dcZW3fOnPBw6o26h76q3T2fdwS+S286fuGasQplhH+tXP52VpAlXd7z5/Ix7rJGPYFpzRLcobq
	qICUrgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fca-0000000Csqa-3nwe;
	Mon, 13 Oct 2025 10:17:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FcX-0000000CspQ-3LKb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 10:17:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3383ac4d130so3453873a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760350656; x=1760955456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wki4wD46J9sHWa2HWv+VTuD7xLgHt9zo+ivAkfQcV1Y=;
        b=JzXVt3IZYxeSrDS5wFam5DjkK1cI+kguEF4ZZMszmw++2mcK79Uq84bxJZRheepkkJ
         wZCCugYAj2h2X+dFDdg9BQROKBpRkdy3nIHHhg7H8dmFrvgt2Q2vvm2cfqo2nu6MXe+w
         q/I/zZl/qTZ55pI7QIYMBOf8jtjUCjpOzTfzp/TnpV8wlkMY9dLX/lSOKnHg1BNyBoSy
         VKjvkkmO2P/bxJoJUFJf90aPj4tW2A/5m+1Py35+n9UyvQzF9nT6YNuGlp1Hgez1hwIH
         QgF9KPGpR6KvNpW2zPzDJQp4yiXkPFc/KsBBQ563fzQAgHNF1NwfEpW24c+RrUNO/89D
         98Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350656; x=1760955456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wki4wD46J9sHWa2HWv+VTuD7xLgHt9zo+ivAkfQcV1Y=;
        b=b/RyOdMSoQYM1YJFreK++kthGUn8mJ6OekzIU9f/Z0ulcwLyPuR0ZDvp8Imy+6GRGu
         8kFLEgs8+09lkM8igxSam5djcmTFG5EIVG8PmVSv6LgZSMMtOuVQ6yDOJCtACPRS3l4y
         +6ueAy1/JjK/LWIK5luXMSBTA2MqICNHTYqNkNcReSB7asKyLGDvMRg08ydRq1fPSosy
         4bL7Bh+hhbjy5hZDtJqniioTgroFymIx4+Pvs1MDuxCS06+7UzG8TAqyTk9nS65Oc3ar
         4VOmuXKRKIG2f0UiT/pvZ3b0pV6RqcgeTfeHHomztiAvMlxO2O3j5A17OK1mzPMnusyA
         fEzg==
X-Forwarded-Encrypted: i=1; AJvYcCUfSZ+jZrOmJF1Ue7LIHvtS1ZbO+heGZ22+1PWaSn3aJV0OfvYxfu+B6caD70WGO8xRw1gQsqahNVNwKA0ZaMkn@lists.infradead.org
X-Gm-Message-State: AOJu0YwVxVgXmgNHDal/TLiNpYtTT2tXHRF3vXW4CHbE6yiv90lG9HTT
	dtVgK2uybW2TXN+PxuzGTpn30BOlJLmLyBeVxforxufsaYseb47CZ5ju
X-Gm-Gg: ASbGncuvuq+34rCWDSTgfJZrdGUXZfW+w/PyPXOWzTE3jcda7xJVFZLicdQnYgYEoyM
	N3oQbZ1y6DcK5JENBnjRNkphfEyjpkowzms/+vQqLrnXJer/08aZCYcmhsdLkI1w+ZSSfHKHjuP
	5cmQRUwxov/5FYZtZlTFEc4Dpu3H30SdXunYMEiVF+GpUDFEHPk7h2PyiEXXMMLrvnhhmKynyYF
	m/9xSM02CMslhiI5aTfAdKM2tWihOoRiPv4XxEFtKnObP8SphugLyr4ZKBBLja7vr3fZ3vawB5F
	kgPHtkbK1/WudW1+nj28m3ziIANiXxOAjmPkwHX7HS+ocVyFPB0XZ64Ifo7I6mz0F0PY85I3j1i
	diNj/1yEI03HTvPMF4UslASPlbr4uoCOHYt/57KVbqFrOKmm8Qw==
X-Google-Smtp-Source: AGHT+IFWUyq6JEcHtp3am/7eUBgtvhj0qj3bSnmWO1N5QwdAIzZeISWAhKZhiB/dnKtHDfPJBcdWEQ==
X-Received: by 2002:a17:90b:38d2:b0:335:2eee:19dc with SMTP id 98e67ed59e1d1-33b5138401amr28464765a91.28.1760350656488;
        Mon, 13 Oct 2025 03:17:36 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a5656dsm7422864a91.11.2025.10.13.03.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:17:35 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 0/2] PCI: j721e: A couple of cleanups
Date: Mon, 13 Oct 2025 15:47:22 +0530
Message-ID: <20251013101727.129260-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_031737_845964_080B0261 
X-CRM114-Status: GOOD (  10.51  )
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

Refactor the J721e probe function to use devres helpers for resource
management. This replaces manual clock handling with
devm_clk_get_optional_enabled() and assigns the reset GPIO directly
to the struct members, eliminating unnecessary local variables.

These patches have been compile-tested only, as I do not have access
to the hardware for runtime verification.

Thanks
-Anand

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 25 +++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.50.1


