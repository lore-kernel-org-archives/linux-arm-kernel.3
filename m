Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6BCCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8yVMi7V8qTRELGGfV+IcZ9w9BuBp+eY7s7IocvDD4Ig=; b=agHpyFfJVlNBgwlGs5cEXVbCA7
	DhDmsRbgPf5dd8Nyk/C+2zNm8pzgv+p7SgJvHPUwoET5wl24MnJ3bVLmqMj+Q13iqwPtMNHGOepn6
	9XBBCaKZu7fOyUibpsdL6tVaHOHFX39SjUigvLoVxGB12xZmtsFaKjrikIsm7K9TdLQicJ9kaMvy0
	leZfnS1KjbovsQ9XT+tDBZzYxR+e9eYY2Q2nSHxNHkoUb4/lPfwp2/M6KtlZM2viXFVMc/pdwPWHm
	G0MWuDZls/DzQOwIHxj3SD96FoW/HTdsiddhSapUXx0BeRZTUfmgmcxdVdERiUmAxb/AZgkmWPKco
	QG3dCTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOdp-0000000EAQN-1qjY;
	Mon, 27 Oct 2025 14:56:13 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOdn-0000000EAPZ-0Eem
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:56:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7a2852819a8so3128652b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761576970; x=1762181770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8yVMi7V8qTRELGGfV+IcZ9w9BuBp+eY7s7IocvDD4Ig=;
        b=beCaQl02IcgWGtuC+xiTucKlHKQKgHifhHXLpg/b/ihg50//oHmJUS+TY6a+vqxhE/
         ejoDvwDUWdJTtXJKbwZOWVh6CceHgRCrGBe7vmdV/9RYKQWccgXSQjlxqQlkjKklM8Hy
         xJXOZY9mYp7QTxv3lnkDgP/uXUNkK9FxQ82FbkCALZEYaeTdZCGCnMhgzhvBSxzMZIRv
         h9J8emL8ZHabYxS0F4KK2GOJc+1uMAaOKJN/PPzSSMlG69/vi0eYN4e0FkWzxu1m0HB3
         7nEtIJ5f03bjMGlM/+MHu/k8cz3iy96DRJnnOJI/7Oa/YVlzt6TWf7yEw4c+j5OaV60V
         3kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761576970; x=1762181770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yVMi7V8qTRELGGfV+IcZ9w9BuBp+eY7s7IocvDD4Ig=;
        b=oRptWTkAXl4HTz7Mt5+mFkev8dMlCnB/s+CqXIKWLuZsHkI4+u+9Rol/TCL6hb8Hos
         8+OF4sMCyVu1gzdrRejzozoIZ5o5gOEK60jH8fJhpEOb0zmmLxPP5OLStPW8HsFHjCmP
         d1J2d+1wWKsFjHenpForikp/If6dWTyw7cPq1N9EVFCmuBJ+J7vgojzufoHK3KGz6xFt
         +ZrLrN/ZF/t4cUpltqNOuGEUPWLhSTyYsRY/xT+eszkqSUThfAqe9QbTnVIuLbCbDA9s
         Ws5LSWyOEq4fV2PVuF5BqMgG9pwWq39I22lInhqbQDz3Ns1dUt5wI4EY36McGCsZJaKn
         33JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPiSrraC719xkYW/gQwehZRjYiYqUWSPspvIMu6LBwXZaw5wUZHr7WeSZ8PEu2efSul0l60A0VqBcsRqvclfup@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8sKA3rXcdd61z/p+V2Q/QXb7+laOO004+iHMdleOj0rk/KEpp
	Gnc41sYm8MfAA1HyNvrPa/+mbW3EUbu0phYqgXh3zAY5PvJFIImUqnDa
X-Gm-Gg: ASbGncvppeS5y3NHiutj/mAxWnJH8KmCRiy+AdMV80HnQW/88ezeGt7hQfAwHvxF4QW
	ZUgr9JlTAfg/MBdoZ3DGVrYCbal2iMfqRe+Gy1m0DeDPqGqrxpE1Ay/gCWpF9uSHyS6dqgpFUA1
	ZcdrEOKvb4x8MXYPVN6QS21sJgKotSIw2JGH1vsDNHt9FZNnfFTt7ShgYdN3hTDLL6EO8cR5akJ
	l65oN3BP0UaLxmjxo5m8QSMUX9e0TfF2t80AMWTVe+6CupOilUtXQue1XfnujTeyNKVzM+xEgik
	0pfCHjvZFZHTAQt3C8+g5DBO04cw5tt0HNviacpT3sCRFoqhHvQmCL/oxQgZzof2Z2ZPmbqkzTr
	9Lu6xjO5gzxZxpxEmZdXvNOQ8AitGgvd7oeWMJdl10A4f8aWYKXjdgUU/nh2JbJcrj1EjdfanRc
	k5RScpGcystE7+D4eUXjo=
X-Google-Smtp-Source: AGHT+IFNNRsqOAD0ej4MkP02YIZHAarj1O7wDlGaz+jF0eTKJU0nb26xxgTWECACFe3NIf0baZUBNA==
X-Received: by 2002:a05:6a00:c86:b0:77f:324a:6037 with SMTP id d2e1a72fcca58-7a441b7aa11mr318696b3a.7.1761576970098;
        Mon, 27 Oct 2025 07:56:10 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012b19sm8373372b3a.12.2025.10.27.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:56:09 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/2] Add runtime PM support to Rockchip DW PCIe driver
Date: Mon, 27 Oct 2025 20:25:28 +0530
Message-ID: <20251027145602.199154-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_075611_122751_CDD5EA1C 
X-CRM114-Status: GOOD (  10.45  )
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

Introduce runtime power management support in the Rockchip DesignWare PCIe
controller driver.  These changes allow the PCIe controller to suspend and
resume dynamically, improving power efficiency on supported platforms.

Can Patch 1 can be backpoted to stable? It helps clean shutdown of PCIe.

Clarification: the series is based on

git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
branch : controller/dw-rockchip

Thanks
-Anand

Anand Moon (2):
  PCI: dw-rockchip: Add remove callback for resource cleanup
  PCI: dw-rockchip: Add runtime PM support to Rockchip PCIe driver

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)


base-commit: 7ad31f88429369ada44710176e176256a2812c3f
-- 
2.50.1


