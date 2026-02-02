Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EA9E73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=us8rkbaDqiFPo9bSgIdnDClrOWuVChIefeA+LRaKMx4=; b=KqoxQ13x29LIysFig9vT6yC+/h
	VDbrzeMmPSv0cyMWtERWxWYJh1Cnk3RYt9ZZ5fNUjU6kQHO9flXpLHmgtBY1yDcISbWGkQFLF82sb
	Xo89Q4W34JkLRA3razQ8fUuilDh827W6mHKBEA9uFJnihtPogM3rYFBm2idKtijqwMfDCokb2BDFK
	QNMlv39KJAYxbi+uz+8S7AYEH3pnH+rq3GZOsxGI1RMTFsGoyrI2qM2vbGuUJq0BDgFyvQc0/wcFG
	WWa6M2XbtD5FE192jsVYcb4ZCh2uHjXILAtJiKQzrLTxZb5PWzGz1UUmxafr3Wxoqqj/2krlfmt0j
	+kYP1vWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtf3-00000004zGa-2Dqu;
	Mon, 02 Feb 2026 13:08:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtf1-00000004zGF-0jKA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:08:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so43224365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770037689; x=1770642489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=us8rkbaDqiFPo9bSgIdnDClrOWuVChIefeA+LRaKMx4=;
        b=UeusBC79MUHAFZ1Js7oeEpHtHSAaiso07/dbelaB/atAw3XQMFU3wMJEG2e3hN482I
         8C2+wNc0+31oukNTWPlRyf7MLT7x6pdJP7uxNLbE+VxEMprIvOkmJ4m8Rbssj6OtNXQC
         1IuYwUIzKRSVGBaHipOVBrLmRW1MniAquFebRciSpO3vOAA8+yx0jTGU7roVrezDTM8R
         vWEmO2ulkJ5Vt11sAFQwCipt6+yyZRFeAV7APm+H3v0oZCqZyelxmgw+ba/5mn8WMTfa
         vbR7DooEoOxrisEkUoYHQ56AlCX9yqrBvSri5h4c6sHVGH/n8AbElCx8dl8ypJCcLrcP
         ZKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037689; x=1770642489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us8rkbaDqiFPo9bSgIdnDClrOWuVChIefeA+LRaKMx4=;
        b=RS9E8I+tEOdFpb6tL+k/1OeTP/mLTF/RzgAQB0MojZYsflUbWzy/IYbmt57N1oigug
         7yb6t3m6+caj3/YgJLgRRGGOhMEJYnKovQHbs5cCgcbek4TpR8gKfz0U/rnwZSVRAqrq
         e0TMDUPATZacbS7pPgj89zURk7CsjuGWDYK2exmBaWFc3fZi8B3lOhcK9TJjlY5QVz+Q
         Ni+oLAGQLCjplTXizBZ97W9BP+YlMNExL6HVj8Vg7xC7I/FmznXIg7bQfj5xlDzjsIJY
         6FO7Dgy9S7VPxoz5Qy/g7j7ZP3I11ioYSo16tprd/tcwSaOIbi3+QUDJCcJJlO1fWoNQ
         Ckqg==
X-Forwarded-Encrypted: i=1; AJvYcCWsaDsNyhx6K0dDWKA+ssetO+f24+4If2iXaTVLFDlBMxmnqf4Xpy/TyL1C/5o9FVz9SEDjsnDxt4+zuEBy3sZq@lists.infradead.org
X-Gm-Message-State: AOJu0YxHCd3/x5sEHKsXmLOR6C0h+N0s1O7w4Tq69fdBOS/RmuEaDYRS
	q/jmHfZK/hY8fxO+R0IQWEMTqcWTT3YEnbPIMjuJd16Apv1Kj4haOCDE3/PODeBeMqI=
X-Gm-Gg: AZuq6aLTOsBjYkXbWPfB45X6rbQR8wEDU2rr5HslUJd+SqTMXz2KyztCX6XmjuoCPlF
	piqOGt6iVMjKtEvCg9JX9VBOmuW2OuzhJr7k8oS+zl2EXVzsPFWVDG6TjJ1BRCNuBpCJdIQczDV
	1rrGqCGxfNSGKJ/60Rop9anoQ+xea289N4mruSQWEOkRClr4+TQuRuLmiAIx8rtPAOFujVPUyTe
	uD3hGoPIZoHblKdCQn5kxFqGJ1tKmVgKZKjKL9t2TU+qyVkRmkhzZdxHK5KWV9B6VvzgQeC70d9
	pclNhbSQaeK3Vrz8O5Y9UQ9IGeG7vI4rM3kWzoxdkfgXlJOje2swo3hle76YOxH+ZEpjnkFXUzU
	y49Q+jw9MY2mZsNtWKhuoQ8A8RQee9U02W2l0FWkc5eMv3Nj7KTeSCLFzeA0/jH/gQzQ7cutdwi
	n3OP9CDD2H+SYcmgU5cCAqu+74a97DXg==
X-Received: by 2002:a05:600c:310f:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-482db49243dmr160135245e9.30.1770037688901;
        Mon, 02 Feb 2026 05:08:08 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:fad5:23a2:cd9e:d80e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066aaf235sm438299775e9.0.2026.02.02.05.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:08:08 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] PCI: s32g: Fix ports parsing
Date: Mon,  2 Feb 2026 14:07:56 +0100
Message-ID: <20260202130756.1421488-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_050811_289388_A07A3A2D 
X-CRM114-Status: GOOD (  10.32  )
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

No error return is missing after the loop resulting in removing the
ports from the list.

Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 47745749f75c..767f5a622441 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
 			goto err_port;
 	}
 
+	return 0;
+
 err_port:
 	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
 		list_del(&port->list);
-- 
2.43.0


