Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98F4F53D67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=; b=lWlivwhkCV1shYW8i6E4JsLiTK
	YHN3LJbC+Eqqr4uMAF8cAdHUcnOEZYr0EahEnJLFiTkjUF2652XGt5NdHz+9+cCrYp6jOJF0XNCsT
	Ej0IGPzIJBHTSwRd1JUx2Hi+B2mmG/cB/qpyNGhoYDMVxY6rqscmVd3uA1CYmYthrPpCeajSBp7/x
	x5hhCbC4iq4maflUhjkeymVulC0TkUINsMbZ53wPRGuKNooJ5uWg55nZF63YK90FzJcN/h3zGoRnl
	fnmzIrKqsxPVFv1liT6IKzNR3zlEb0imR6kHZB2qyw+YtNF/JUK1BdBzsk1wUHcLOtuO4MFdiBUDz
	Jp4PtUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29ta-00000004LET-3DrB;
	Mon, 16 Mar 2026 15:30:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29tX-00000004LE2-3jIj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:30:17 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1606764a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773675014; x=1774279814; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=;
        b=FY8lYvLHCqOqLFYI52+q9iI76ijiX9jdRLiUACP9wUe0OWc+Usx85UevwCupXpShFw
         rKJrgQxK+f7YB7ahzG1mcU7fJUnn1DRXxbUCrzn1FQ1Mc873RLSlSNzR/dUcpCFnj787
         x1kM2ZIkMhaOEeoWYj/0O2/6h/AWFZyiVqsL9/rnKlFPKrz+9OAmRpoMW54CVLvY/MA/
         9Cko1gbRr19m5EDtvkSR4ucQ6fDSPrtamUuHlBAf5moO+cp+UkN3nb7HYbjknoFOsWWY
         WTIXhdAS0DjTZU403Ys5OmT+SDX71EORrG5tQKy2ljcAtZyxh9v1GIRzQmvZwgt/PeAJ
         Z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675014; x=1774279814;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=;
        b=pOVetm9L64mqxd9PC0JRIs5idBgozokuApIhLpKLAl5PQtGd1CkNFCT356gyYd34tN
         6PXsQXRfGl8YnLTTZXd+B91tfhbFIbmcvVZkVzrdNQcO/nkUWokP6ejK08LUy/OWyC3t
         28dat1+04r++qX/f7O/1dsly69XQlg0/2lDgtBHFB/yIDMcklpYl9nSfogUG4rHigMLr
         ASSg7BFHE1VpsPAP5zfFhb21Vkir5r3waSoiMQlm8KSo+jHlcPLQ+FK8il+KgJ1lY62X
         tKtcWspRU0l31lgHU7j9Vmc7EgqZUJiMZ+xJpjMpUU89KCEkkzVZG3mi/HhOsZAy+lSQ
         ZXrw==
X-Gm-Message-State: AOJu0Yzk4sUgqUnJZixRyTJ7NMD15r9C12uG6vC7MPrTeIchOEG7iROL
	YDqzzTNxDrQBtdGIpwclGRKqP4fS+EXvHW6t1kx3WPqkEkJjdfvIutFy
X-Gm-Gg: ATEYQzxboQyw2cxlFOqqSFkgqyfZ8NDAsKIpVkVhR27M4UqBl34Fzt9GF714BAEJTxZ
	8kwPLCUua3KcccRMLoLCMm8LFf0cIifpgol9hUuxp7CfCQ0hTBQ2Ro1td4Q/NrWV3NKtpexxM9j
	SJWz7BjL8thavtIVb54s6tNWmlCbbbGuhJnvQku8cqA2xBlpht7mg7VfJyW+DFU/K7g1qHU1bmp
	IeDtp54cbJn1QdN30DMDHZ129GlUJ3weyru44WYTFqdboEM+nsOCdJJ4l7PCQ1k1Ws+Cl2MPrqc
	sCE3AUmPWav5aK9Mj8Z3Ykmo1K9HW6yjT8hmGrFx9sn7r+gc/8p1ZKsoFK4MWEggkDzaPVTTb6v
	CYgUFO76XvAKQjKykhxhBiWDVeP3ivaFKzTjj/eM/Kr6qrolv6ht1dhG8mG1W1UP7YtoceDgHKS
	ZHSaCsQicO9iooAjjeilyX2lDUamZuv8fc65Yu
X-Received: by 2002:a05:6a21:7a97:b0:398:9379:d04d with SMTP id adf61e73a8af0-398ecadb5a2mr12165818637.24.1773675013707;
        Mon, 16 Mar 2026 08:30:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb996257sm9392478a12.9.2026.03.16.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:30:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Mar 2026 23:30:06 +0800
Subject: [PATCH] dwc3: google: Fix PM domain leak in dwc3_google_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-dwc3-google-v1-1-c9bde1b02f62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP4huGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3ZTyZGPd9Pz89JxU3bQUM0PzJOMUQ8s0UyWgjoKi1LTMCrBp0bG
 1tQARqXqVXQAAAA==
X-Change-ID: 20260316-dwc3-google-fd617b3d19f5
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773675009; l=1291;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=M9kVaC+3Cr459HgO4DubNcbQRmLEGq9666e5ZHFrwxQ=;
 b=xHLSPpZk8SHQGjWfG7//LJvvpOEyszCJ6PrI6sz+mE35M4OL3AD0FVkQB0UX0IaWqxHIQQNTy
 1FneRQRqG+nCC6L0vSU1H/byaZtGy+/ZuQ8rHdQkf3v+SDoHlMMHEt2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_083016_044478_2BBB5E1D 
X-CRM114-Status: GOOD (  11.67  )
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

When syscon_regmap_lookup_by_phandle_args() fails, the function was
returning directly without cleaning up the power domain initialized
earlier by dwc3_google_pm_domain_init().

Fix by jumping to err_deinit_pdom to properly clean up resources.

Fixes: 8995a37371bf4 ("usb: dwc3: Add Google Tensor SoC DWC3 glue driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/dwc3/dwc3-google.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index 2105c72af753..4ca567ec01d0 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -385,8 +385,9 @@ static int dwc3_google_probe(struct platform_device *pdev)
 						     "google,usb-cfg-csr",
 						     ARRAY_SIZE(args), args);
 	if (IS_ERR(google->usb_cfg_regmap)) {
-		return dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
-				     "invalid usb cfg csr\n");
+		ret = dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
+				    "invalid usb cfg csr\n");
+		goto err_deinit_pdom;
 	}
 
 	google->host_cfg_offset = args[0];

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-dwc3-google-fd617b3d19f5

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


