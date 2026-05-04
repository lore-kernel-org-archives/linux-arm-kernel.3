Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614BDCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=; b=gZOp+IrTQDlHpY5N1KTTBGK9cO
	uejLLISVOCCmrfRzizvLHO94WmbL8uNmDA0KRIFxwZmu2q41c904ONJTQmf6+89KY+o1OBOkbEsdt
	tRTFJBrOBcTjE1nL/W5rZrqZcsansujrmdADXubTmOt6JXKD/ZN8tHlC/hFmSCib/l4mXd80gZR22
	Ttm2IoLcm6/DTkj5Bm7GaKis19BfOFqJ/a/K9tM8pHSuf0oEe31OY9NwLjjUDTu5tF+T0QMpavIvK
	edjyguMLddQuc/s94tYfKl+kLUdL9pxK+NxvGfbl7E44Abb2durBU8m7S2rUpCz70LylTeu01w7n4
	RgzkDYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJufx-0000000DWaC-0v88;
	Mon, 04 May 2026 14:53:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJufu-0000000DWZY-2Hrs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:53:35 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-364f7c42c62so1705678a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906413; x=1778511213; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=;
        b=lGqhL6mQ2dC3wNifspPNPwFDqCvJIIXCQPXJpIYcEIQR+327Z/M/5PpBct+iybFtTV
         03QiO3fixklxuwN4fbH7nAJPt7JF9Zr8eG80s4lPtN19MEHNSLe++LcgC+AFsx18CspW
         PfM6zQFgpam1oJnfCaQCZbDHaWaE3bzQ03oYfs1TnbA39ldilncKwQ1gSvGtLz+/TOFg
         FwDnafXzjN0b8jQuHv0HAqF6e8yE5O3Pgb7kVrfTwv+kYBmb0Xknl+QODMt4Us569dkX
         2LYz8kwxshBGhIPt4gh8XXI+Kt/euRAWGs22OrhlINxbf9U+Hueu93ore4mECPIWRITg
         VPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906413; x=1778511213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=;
        b=cF+HmbXDRlBrWrCxHW+Op7PLTFjpm0EMnw8cgyJ40HaxQQrtJSg94ZhC0elLF11B9s
         LERFuZW/N/1IUR28vyJg70ytmGLcVfOXXdUOCv6hkbXABD3kVLW4WV8kCtDpl7bWGRTn
         8b/ILk2xuI3aI6uw10m0d6IsUYEdpe45dQZVBoeBXo8iNqAUVvYQbZqWRWFbCYW71r+s
         RFEnFaC1Hblvx5MCyWvtpdi8OMtEVjhRpyUya7MxEDoLrln7WAFGvwQCJuvpcPc1Fccu
         n8jSYZ0kSsItuCjCZw7Zg9hIQF6YXxlDcHVa22PRyQ/IjD1v6b1XWwT4YSX74BMUFft9
         BLww==
X-Forwarded-Encrypted: i=1; AFNElJ8EBbWMmqn6xmoXkeah4LtyJfpSfSdMdtq9NjMzT1CDEbbBoxvO6ZUd+xe3sZ4prR0Y/MuyUjSoNkD+CW+Be8Vq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/RQ1tqM3PDTSAZpCzHpkb3AOYJR+fDLzaVcuz7ULyx5XysGDn
	kNPCuxXW8keBxiIxdDBneeYH8gpA2OORRAoB24OCyp/l8TQaouN6y8Vu
X-Gm-Gg: AeBDieuujBCiuZIe9Vcj02+yyvAlDYbNqlTsSGQ96MlxGj4q4j8I3Ki2NMJZRvTQGMd
	9uOXqZsilPE1SCSdb7kRkf1xGjSFY/CRHT8ZVMG/fniZimFvTLzhJPfnrbAjCJo+H5BPwtzT+0K
	6dzVkagvAUNYdaWJ7fUKbTns0YZQXvMlhMOfHF4Ahv55jHuZntHQ6qpnDv1gAaHe6GkjGsrehtN
	0OMgJJ1PXRQODzh46yQqGFll3T7YEAkBto1v4QhaMV0BIIpNYBM23B2UCTlGPRX50Dp5fAXtHwQ
	iQY2K5IeMIXEZTLF/EVht6OFfX6LkPv3GETL5G4CHcOku3XfxtfzqghYl/L7owUKnggMX9jUFf2
	kEK+GpYyGud0DAxShbvmqn5oeEjI7B8HYuzaYm6VGmLxjzsJfbS61Fg24yziy85rOSsd+C7y554
	eSNcjT6LCQ2e4D7T8MNCqhZ1eYB5u1AHWUsPw3dhCKfVL4klU03tnp5++dGusa56UErytSWJTvn
	SUr5+d3DG5wy3OcI7teJ/kziFFqUw==
X-Received: by 2002:a17:90a:d444:b0:364:6558:99be with SMTP id 98e67ed59e1d1-3650ceaab7fmr9463975a91.22.1777906412786;
        Mon, 04 May 2026 07:53:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbb05798sm9926085a12.0.2026.05.04.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:32 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 04 May 2026 22:53:26 +0800
Subject: [PATCH] pinctrl: sunxi: fix regulator leak in sunxi_pmx_request()
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOWy+GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMT3eLSvIpM3eSUREtDMzPDZEMLQyWg2oKi1LTMCrA50bG1tQCZt7F
 DVwAAAA==
X-Change-ID: 20260504-sunxi-cda91661c181
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777906408; l=1142;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=KsGehUIs9yjLgFhJm+ALM6CihYTUD9IxFPyF+rbn54Y=;
 b=HeZnzJUAEwh2zXD8lRSUzBtxzjVKqCO0BBfYZRyGOZBJ5CwDrdBrjEiQHQdwkS1QwwsLUSbpO
 6SW0IlZZ5BXCjzD1FqEQUkVaPWVJsfKl5GiXk3mGGLFIUcMtZBXaX+U
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_075334_628507_8F4E4AB4 
X-CRM114-Status: GOOD (  12.83  )
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

In the error path of sunxi_pmx_request(), the code calls
regulator_put(s_reg->regulator) to release the regulator. However,
s_reg->regulator is only assigned after a successful regulator_enable().
This causes a memory leak: the regulator obtained via regulator_get()
is never properly released when regulator_enable() fails.

Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator handling")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..25489beeb312 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -925,7 +925,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return 0;
 
 out:
-	regulator_put(s_reg->regulator);
+	regulator_put(reg);
 
 	return ret;
 }

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260504-sunxi-cda91661c181

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


