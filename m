Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543E0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84d8bHxH3SSdWFybl8KBWGlfmW6RpFgzxbE6mJ5HL88=; b=EcX5jpuvTCkuFhWBdzoX5nMs+r
	PkmvbjQR+pv+WBfATHonPh2yylS8blBY1nwczS7BjAKPK9pNfxbFeztEfQZtSG9tHAVQlDqexl6BS
	K95d3deypfjsCNHCB363hcXkRgA4wvco4AwhqcM1ig8DDUHy+qspJ/j8lXWXcTzgvkCtMig64m8Is
	9vSK1g0RIW2kwY/AyqzE6tSMrqAg+GiJLos5CWRN5WPSXQLlpWrfLVL3e9ToMOgp8E6WjHUg+V2mS
	0uzSMLluT69q4mFbCaWNQIOdhq2G9K1HYLzeWmcv0FcxTrjlWKmgWtQ6Yog4Z/4YUTxCkvb3peEsg
	nmI2ZURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hmq-0000000GRTM-0dJm;
	Sat, 12 Apr 2025 20:49:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hXU-0000000GQ2u-0X7W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 20:33:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2578780f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489998; x=1745094798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=84d8bHxH3SSdWFybl8KBWGlfmW6RpFgzxbE6mJ5HL88=;
        b=WRKdZMxhfLthXXIkSCwvfnL0DXO+9EaFWLOmSQsNZJlSHXyEX3gjYNbEMgEqNRUTAa
         Ib6veQg47pV2sAU2RaSC4Y3YRcBtG3OSUg1mYdr580A5WtvJ7BCCCpiGCQ2r7L4p5RlK
         SfmBsuwC3dI1CT465EbSbmhy3vlk/X2Pv40tcbzxDD29YAPUe1HJxz6Xv2mcpS3/IOiq
         g7zKiq402Nb3iTBg8kld2hvzhUrvioK+PtUBpazh4/aXiyhxaLEfG9y6es56Tvpjuro/
         4PaR4JmMiXUGbR51pn225/wrtTKshaHYHH0UPKfe53MchdpK9pdOPrsCitGVLyd3zdKk
         /KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489998; x=1745094798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84d8bHxH3SSdWFybl8KBWGlfmW6RpFgzxbE6mJ5HL88=;
        b=wd7rWEivdB7KVvIiSZwJsrcPAPHVQv0LuGjHSN9Dz9islNZkqo44myHhDU11YT7ahB
         nHFRiMbyRaVzP2UDLqjg2A7RnkUloTKyKHC8V5GkJcChc/lpG18DjuBZsRxGrah8WZnO
         qXnuvtjpII940kH17gN+vZmRNGrOwfMXtkXZ8gVa25KrpCajZzMvf4wXnLlM6oNFvPLz
         0c1V4gNlYeMbZQarAFAcy1cYCTDnkacPfYBa1vTwSiJLTnZ/oV9IKK/af29SqbvCnQbR
         qH1nEN8VluOsE7jktWn+8R/PBP9hKogoxzeAxWUzvExeE87IySSEeMqRowbxWdiW9RKY
         nNZg==
X-Forwarded-Encrypted: i=1; AJvYcCXSTKAJtIJFIA4T8VGXNJNiVRN+McuLEntHAGlKDaVeewlH2BwXkSPyhVVlPYFV10xZQfzwL3vKPHA6DJZI46+d@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfdfqg4YbUb29yeSEqWIBAVFoYAg9oZEefYeIP7rnlwdmNRQnU
	f9+XphoqYdreqrjKzLxZo3M6udzl0h66Q/FSdeU1jHUUBVLFDuxF
X-Gm-Gg: ASbGncsu3Hn5Av+PVo4Cq1ud6iPO7PesFvh3aEhkb6eXu8HEAkr0LHSu4GECkVXfSLc
	Z7u3HqSaFDL4YFoh2YxfocJL/UAJ3wHwykqzbWxRVhBCEOgm/qLfyCjXzVKtJjOUK9faxhilEkv
	TYZ5+0IWZ8viR5e3Ureb3kEYRFfNXbluGzYW9mXqdaEejyRbWHkrWfgDre2mLEmtxx1SS8lUgBG
	6OpvkgifQ0AW9kayFtrmLqZf9weDqm1gSuMGDcISQPPdx6d5D9PViYclEl3Le7Cv4C+dnmFVBY/
	h6wZU1fjZif+8RMi/As3TfLHSmhGGGbuTP4xhk0KzbQ6X3XYGbXoXzTSPp3jWJqJ+3g3u80jJgW
	pDs46FNBvz7XqvAZ24lPHxbVoF7U=
X-Google-Smtp-Source: AGHT+IFNyxGwDpnAe/YM2fiTQZXwhEFI2JvZ+QIPckE8pwsmskLv6jhORu73jTe1CCO3dtOinzRmeA==
X-Received: by 2002:a05:6000:4021:b0:391:98b:e5b3 with SMTP id ffacd0b85a97d-39e6e49f88emr6775905f8f.14.1744489998307;
        Sat, 12 Apr 2025 13:33:18 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm5941896f8f.76.2025.04.12.13.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:33:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 12 Apr 2025 23:33:11 +0300
Message-ID: <20250412203313.738429-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_133320_166582_702CA703 
X-CRM114-Status: GOOD (  10.04  )
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

Hey folks,

This patchset adds support for the Exynos 2200 to the exynos-dwc3 glue
code. It takes one clock - the link_aclk, and the dwc3 refclk is passed
to the dwc3 subnode, as with gs101.

Best regards,
Ivaylo

Changes in v4:
- rebase on next

Changes in v3:
- fix partial r-b tag from the dt bindings commit message

Changes in v2:
- add sob and r-b tags
- drop minitems from binding patch

Ivaylo Ivanov (2):
  dt-bindings: usb: samsung,exynos-dwc3: add exynos2200 compatible
  usb: dwc3: exynos: add support for Exynos2200 variant

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.43.0


