Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPBNquw9bDve05ZXRyZElIGNn95SHQ0uPV8Ww/9iWX8=; b=y6orgBq/S4CxMmr27GGvj1pDpT
	KGEJB7+CMUWNDGTevGD/cnL06vHBSIYbMYvnYgMnAfiAq/q/ui+cTVyZdvXoXVGV8/nmzZ1kdTBu8
	Zhzhx23t+uZqKG/1BOEgsXtmphKQYXhnJvE+eQ4PlvYHrfHOBNxnF4i62IEEsllOk4DsBn0A0DlPF
	OYrvnx/3NvlhlTIOxvNQgvpSxjh+Wbv9v4OMO8tkZ9QCZYO8bOYcimT+LF+OdX4FbJ4r65UsjPVaa
	TKry72LtTyQnt5IdIQkYJWFJDxp52MF1mQmpcRiItYLSJpJnxmVCOboI/YdCz1oZDSmuKR4JmWNiA
	7K5fPChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlsU-00000006E7i-1iVK;
	Fri, 20 Dec 2024 22:53:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlrH-00000006DxI-1rYn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 22:52:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2161eb95317so24024585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734735154; x=1735339954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPBNquw9bDve05ZXRyZElIGNn95SHQ0uPV8Ww/9iWX8=;
        b=jEqbnhm9RgiPpdKEODAhWlvOmnK18AWek0AKiUBqUbVSDxRbsy6lE9VKJy8jZ8E6R2
         CMM2Rrqu6U6XLx4IB05tplVOeBp9a4tGoLqOl356YWC1MjS3mc29ITbN87fSvXgWUt7U
         vqPDky4pg35kC5OWd+8ziOyC21mklsqmMTTSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734735154; x=1735339954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPBNquw9bDve05ZXRyZElIGNn95SHQ0uPV8Ww/9iWX8=;
        b=s4y50QB3p0ARMrdqjWWwa7KBvTLjxeYt2PakfXEYT7G6hkrcLrvNEXjpl1Q6CA2dic
         tzyPxaS6SH9w/J5x4qoRx/IIarJgjK80urB31qIvKHLq14xPrwHH9/iYCorn6/T6A6GQ
         uDqa8C7uzuD3pT2FGX+7D1B0KgHAJgTbWFXhhrQXVBsBtiMYF+9toidX9Dm2aJqX9Xsp
         7AtPE4g+t1UHnPcmKKyNSYVhnFKNBD62Tkq+1/a/ncBabrAkYIac/e7dn5o/9glRK4Wm
         vp1QpnGeAzECVM61GnVfziiRARUyPZzQ6Ha0CO594v7LpSK7d62E2ZjTBG2s4zCUUvtY
         YyYg==
X-Forwarded-Encrypted: i=1; AJvYcCW850IPrZkvGRxAaAIvqH35XtD6xuiq1mHtjbDplAd2iRtA/RaCb2vsCSwTebYkZZoXXsrklGIN+T97T5QWfwGE@lists.infradead.org
X-Gm-Message-State: AOJu0YyjNdunOiMK899qZQhmvQmpTSwIMCXYWewkbdVkn4OaTaLKsvHm
	m5l6IqYt/OwIN+qzjuct3XeYgdTF1N29KC/ETWKlBO+iN8oI7KJ0R6xOcSDAEsjvhnLlGHkqTlK
	QYg==
X-Gm-Gg: ASbGnctHbVQ1CxHe5Iu4l7RIv2NIJlsBlowrmIOHoLWd0dlu4fYaj45j4HLyiGhC29E
	j9XQQFaes48KQJda8pwdCkUsTmEIBPhQxSJ7z9blsXFqIvkzdjcroSZOCVm4IMUdVHVO8najsdg
	qgCrDfnPUbSFaFIpjVHE2PhNbSE47IUc1iiTwxiHKLBRs8KKzJLkjKThm5+HGH/P5dZeTZGi9F3
	qu/TumEVnHesxQHPBnxERKR6YvPkuHRvul8tp+ODAuRJ3cpkSs7vyybS2tdCHLE0Jq+QKdmjhpo
X-Google-Smtp-Source: AGHT+IGAQkf1R3nFR0oaCc4mviuMrzg5Lh74UTX9WYEEnS7yyvUzZLFXHXFR6wAwBwTUIv3/nUaYnA==
X-Received: by 2002:a17:903:22c5:b0:215:7faa:ece2 with SMTP id d9443c01a7336-219e6f145a8mr61141965ad.35.1734735154069;
        Fri, 20 Dec 2024 14:52:34 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ac44:423a:e4fb:5757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964b54sm34177065ad.1.2024.12.20.14.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 14:52:33 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH] PCI: mediatek-gen3: Enable async probe by default
Date: Fri, 20 Dec 2024 14:52:05 -0800
Message-ID: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_145235_486738_FA924DA6 
X-CRM114-Status: GOOD (  11.21  )
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

Like other PCIe drivers, the mediatek-gen3 driver has a fairly slow
probe. Turn on async probe since there's no reason to block the rest
of the system.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index be52e3a123ab..49512786d5e4 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1301,6 +1301,7 @@ static struct platform_driver mtk_pcie_driver = {
 		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
 		.pm = &mtk_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


