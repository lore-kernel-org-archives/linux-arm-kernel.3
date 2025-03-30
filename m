Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CE6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFZ3SyUnUFP6g3RoNH2rAWHWsI1Dx6a8W3EREPo/yvE=; b=Y/+x6NOXewKgyxos6BcCQOHE08
	EZrIT5OQs+4Gr2rdb1l5K9dEReVYQM2WRZoYguv+2lDfRiyZYnwtQ1fz00ATn3WMQpiSA5LEdxQsg
	htFBXgm/lTsEjk5BWIfHSxlkIOO5WCOx4wVDZCXc9PzvURs+4c0MWLnetoJsnqqPT4/7HXHfLTjeZ
	+TC9ZBStcDyZQRhv/xf4nkFZKtyUD8uq4LVyzImmUXpCpEKCFcPa36KGOSGr2AKRQPejy3t3A4vA6
	VfeTuR6eDqmvL6WtuNUW7UZ9H4rWlltoYmTp+Wj43tsVgnO4L2nxWHw4fStkjuiVEuLuIlrjvUFn+
	29U/90gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typnE-0000000G5Q9-2GRh;
	Sun, 30 Mar 2025 10:21:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1typlU-0000000G5Er-0mnH;
	Sun, 30 Mar 2025 10:19:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so645859766b.3;
        Sun, 30 Mar 2025 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743329978; x=1743934778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFZ3SyUnUFP6g3RoNH2rAWHWsI1Dx6a8W3EREPo/yvE=;
        b=YFRaB4+XdWxts9PLbcAa78ytlPUbAJ65yMvXv+GLlDKvMMBr+u2hP5zLDNg+6GX8/F
         aMcVcL/SXmFyjtxgC4IV/nZEIUEUTh4Qm/jSOBrPuELczYYGgsG2uH9X9Jjqg+DLa2CZ
         nQH0xnFBfAUzcGs41GUXbETtIZr7cw0G8cTY3alJ+cSXSM3ZtHgB/zN61165ogXy+V7O
         4Ump2jXQwhSshtG+j2AGTiHNKU5XKx6FOVEEBiZSySdGFWk9UqDgZKkCXpKOrNMnuiUt
         Wf1X9MxytxGIeAb9H13xsWSepnAlMw8vEryehUaN2HftnFEEYu7HHkI+dL1Bk4PkGDuu
         dKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329978; x=1743934778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFZ3SyUnUFP6g3RoNH2rAWHWsI1Dx6a8W3EREPo/yvE=;
        b=Vd1Vku5cXvIGtBAuukVC5B0tedg6fsMEklLRiQePbPCpBbFDg5xyrjlIywHC/SwCVQ
         VLX/KWCUaoIC69t8wOkqfYuGtJ+2BgKiqPaor09wU+J1PwSttFheIypzRzLFtKesJ0Mw
         oWdGGF3r/LRmKcuUPr9+jHc9X/0u5GjEtgTQQcvIwO3HBWlzgVzAceci0zCvkqyFCSTC
         abbwtMmdi9IS1GqmFoYAcZokS6ysre6mg6xWll/t4tcf9VIMZLcqfGSQ1VbxPNe59fA6
         gxTIqJW0NsKTdtDLnK51FwBqxDGu+QFO4K4yOhZS/IXC4sVB/qlGrW/RS4kZbr70VtSe
         MOQw==
X-Forwarded-Encrypted: i=1; AJvYcCVrZecVbLoWY83tLNLnYL1Cg9+khUVQZhVi8z5xdjsJiXzq4QXiUBDW8TIUsix90v6s5bfdAzGxbcJ88eO7byX9@lists.infradead.org
X-Gm-Message-State: AOJu0YwZaC2MRjnIugAmdolGk3bdH9eHgtIwCJEIJ3bwRPcAPTheT42Y
	BByuz5ezwHEU5TKwiCDvVlzrZjNrhcuJPA0E5bcchgpd6p9Osr9fDiatgw==
X-Gm-Gg: ASbGncuPJ0+Iy3Jvs+uAVo6muWdMJQ9U8Q0fWfhdm9BFQ/Lg4m8XLa5R0/VQO6Ul2Yr
	5SDmh9ZXYOWJ2MZ4LOSbUXBaWhXEoalYjeQClbcekXSUnDMZhBA6aZeybDtcQQxWTYyyjXWTNJG
	hiRaPdmEz5RSlfNEOiA5j5YVdNZQ3/njuJjofmH5v9P+W9WbRZ8r5PuvgxRnS2LhO1jFmtH87s/
	E2Sy6nz6RL/LprZH0Udtg92L1L1LcEll7VPAVsqOKVUV0R40ZoTMzsjy8+aWwnDjOwxYjKrnCmW
	b8YFeAhNyeDQNxZZnS0DHbE1j2u2XMZOjSoZCjdONrdBZEzAf265nVcuQSObq67g3EUkQQsgcqO
	Xch/ks7Ds9g8nLBjFN3BXw3JVAzu5Oijgluez2/lfb77It//FsnbxU1R/Tp4zUDtLYZ8FZSwkVg
	BzLqtA
X-Google-Smtp-Source: AGHT+IFzaM9D7vunf7JlSpNngmanlgLm7dWuOj8JtuMc99YkDjuuRnxWZlzBdqnKqounaNnHZZeR9g==
X-Received: by 2002:a17:907:7eaa:b0:ac2:d1bd:3293 with SMTP id a640c23a62f3a-ac738a66928mr601365666b.19.1743329977947;
        Sun, 30 Mar 2025 03:19:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac71922bb65sm459288866b.34.2025.03.30.03.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:19:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] iio: adc: meson: add MPLL clock workaround for GXLX
Date: Sun, 30 Mar 2025 12:19:20 +0200
Message-ID: <20250330101922.1942169-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_031940_229301_A72D1B90 
X-CRM114-Status: GOOD (  13.97  )
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

Hello,

Amlogic GXLX SoCs seem to be mostly the same silicon as GXL. The only
known differences are:
- one less Mali-450 GPU core
- no VP9 codec
- and an odd one: the three MPLL clocks need a bit toggled in the SAR
  ADC register space

This series attempt to fix audio output (which relies on the MPLL
clocks) on the GXLX boards. Unfortunately all we have is a downstream
commit [0] without any further explanation (or anyone who wants to
provide details on this). Since it's not clear if this is a gate, a
reset or some other hardware fix: the driver side includes a warning
for users to update their .dtb along with kernel images in case we
ever figure out what these bits do and how to model them properly.


Changes since v1 at [1]:
- added Krzysztof's Acked-by to the dt-bindings patch (thank you)
- added Neil's Reviewed-by (thank you!)
- fixed meson_sar_adc_gxlx_param to be independent of future
  to-be-upstreamed patches (fixes a build error)


[0] https://github.com/khadas/linux/commit/d1d98f2ed8c83eb42af8880ed8e206aa402dd70a#diff-c5aaf54323ef93777c5083de37f933058ea8d0af79a1941e0b5a0667dc0f89b3
[1] https://lore.kernel.org/linux-amlogic/20241231194207.2772750-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
  iio: adc: meson: add support for the GXLX SoC

 .../iio/adc/amlogic,meson-saradc.yaml         |  1 +
 drivers/iio/adc/meson_saradc.c                | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.49.0


