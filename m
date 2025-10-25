Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7526ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 07:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UoVebdxoYndvuY8RSJNbECBWK/xtYB+Fdm+CYMdRAlY=; b=T3hw/BDCOkaxRcQcd9VHJtAx4b
	5lJYw+UrhIr7026R732A2Sy7kL+AH/1y9bkXUkeQ3Dq0oR3Fr4TxDXkliTOm0JZDOiUnjHKG6AtJ2
	Z0iUQ7EYSSiVxMszHHpgKkB1C/ZWyimk7HDKryQ/k4sbvtMbb3H/6BrwnFQC8KgL+pNsg4gdTP7ev
	76KkGm4O/AXR3P/xfjjG9l63S0aHPO2BsF6QwnVpTi+dGLHIGN4gGD2dYX9C1aSFGJSBJIpEc5W8C
	8KcfnTyHXgUX218iLSu1O80erqibgEly2k4yVLg7FuyY9wqKEqkjxL4G7Bd2Hdx3o+RuyXLb6ndJJ
	sgFR2mpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYwF-0000000B5LF-12sT;
	Sat, 25 Oct 2025 07:43:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYwD-0000000B5Ku-1ZB9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 07:43:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-781206cce18so2952679b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761378224; x=1761983024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoVebdxoYndvuY8RSJNbECBWK/xtYB+Fdm+CYMdRAlY=;
        b=FWvPzsdtlSnuuXUWiS9c71OdJ3s2dyVEhjIKMro+HCA8Hfja4sSwsJ2kap7NMtJ7TR
         Xz45U5Mpsl3EFxMGKcoVfrvIbSGFefP6FrYXfNV4eu5tzo4AV9Sk16CK3+mj49qP/ens
         DHKOao8RbNX6d5abeiU/+OnvmgXFTtgznFsSWMJX5ILgHqP3cRU7hSs1MtzDMMjSeEFq
         N41NSkvuwhPawYHnjExvnINTEgagfYvuKbvIPjq+tAhnqQe+pFgjo1tEUlcbLBKqtiI8
         4Uf9hD/D+j5Sl1fJblLwtT+5qxDifLYlL48NfNF1ANnn6jYhckrG3IHlPKQILAt9dhBp
         mxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761378224; x=1761983024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoVebdxoYndvuY8RSJNbECBWK/xtYB+Fdm+CYMdRAlY=;
        b=F6J+57MWigRnePDEfDvARb4yMKxx5xF+kj0QNpSoypknaFkTfNtjJgR2sE/ND7JKdw
         PyedX73QmFFIjfwAReZhnnvqS6g6uIh8+JqbLwa0oWuVeJxJJ/FgK1OEWwI0CA5apl22
         cuPNMCi1FMJbyeJs9fC/1eaqDqp3cXz1xpEch4CZRrNrixHDSFN/VcU0VCzQIS58V7Ow
         7I4AFr5tIGrbC44AjCJq6b2u9fZ9vZDenUeHzYpGsmhoes/JVKLj+U+4YefvdSr8J2Wl
         vqZtLv7SM4v8VTGaYYEQ7iWu+ebou+aCSMarP/Yd2Fo/53Ng6GrBGTITDR1k7YuNdxM8
         fOsw==
X-Forwarded-Encrypted: i=1; AJvYcCWX3V8pmQvNGBE1o8PyWEaQZ0rvx7FfqnvoyGmhDlFV+sr+aXlzj3UeWroePir/4nQU6VNoNbm/rPSAIbuGxtg7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4aq6sIItitTrBXpgjeoB3t7/XxCJ2Q80mVg8xc9jAHWBePLd+
	cCpvBfu4C99n6DXw7LIyEXlm545/fJYQV0yN7mPHdgYPN8fLJeK/SNIQkBc1FQ==
X-Gm-Gg: ASbGnct4mtlyMD+Ki/z55nMPe+09TafyIpscPDQifdwB3l1n+j0KrhtmBYz6Bm4Yvqs
	Qricmtqjne0MpDiZO9o4g2PJ+TLdNcQJAaRIeRxCuE1p8fIB9r8TXTNNWCS/Y3EO3HLDEazuuuZ
	CyDEM/MJl3fsaA4C3kcYdPqw+dOzwlGHjoosyu/FbCiQbKweWW5kjZyXkTL54J1cvMSMVwr63Ob
	2ubmG5SdTc+YbDkEnb3mQDJbUSr9zXZz0tX7ODbWegX7vgxVfI55CXaHQvYigsjLM25/q5+ft5q
	X7z+hrURFrAsxdZctfgmn6pWK9begxVX461zLJ4x3NjH0vHggHs7t30e3AlJPcSe7vynwGrgmFN
	84+fbaBrv7pfKm47AQQ9Hs9hRtuF1ctQSE/X0ZwZtrGbNadf54tvFB6NofGsKhYLZHSpqySAdmA
	==
X-Google-Smtp-Source: AGHT+IHbg6uahjG69hu0gzcYoFdfbPQ0bsi43jxp57hXpiuURUZytGc4IEe9Wj+GeDsVaOYDgbBBYw==
X-Received: by 2002:a05:6a00:2b94:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7a284dcfee5mr5115661b3a.10.1761378224061;
        Sat, 25 Oct 2025 00:43:44 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404d760sm1395083b3a.39.2025.10.25.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 00:43:43 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 0/2] PCI: j721e: A couple of cleanups
Date: Sat, 25 Oct 2025 13:13:30 +0530
Message-ID: <20251025074336.26743-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_004345_414781_A8FE1B90 
X-CRM114-Status: GOOD (  10.99  )
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

v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/

Changes
v2  Drop the dev_err_probe return patch.
    Fix small issue address issue by Dan and Markus.
v1:
   Add new patch for dev_err_probe return.
   dropped unsesary clk_disable_unprepare as its handle by
   devm_clk_get_optional_enabled.

Thanks
-Anand

Anand Moon (2):
  PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
  PCI: j721e: Use inline reset GPIO assignment and drop local variable

 drivers/pci/controller/cadence/pci-j721e.c | 34 +++++++---------------
 1 file changed, 11 insertions(+), 23 deletions(-)


base-commit: 566771afc7a81e343da9939f0bd848d3622e2501
-- 
2.50.1


