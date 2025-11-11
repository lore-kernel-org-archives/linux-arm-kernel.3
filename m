Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c9M3cMyzoNu29tzKfw+UGIVH7zn3E+bc2pWo8lrVlBg=; b=LvKn9GtcMj+/7hcB6l5H97CYBH
	qat9Bc+FMijcHHlis3c8UKv53EpMYKe5OoZOb7lVr4wTXFHxVtbpjiV8LCtowsgcbmXdtczQHjNHy
	8QUjJwm3vdgvYFANdoBoPt1lHiZZTLRlCEzO6BN6AbGwHJG7Z9cp/jRUNtVPJCbDNToQH65ci8NOL
	PzOW61wmcEMTjdbThLX1jkRIwSdu/TwdNr/lTbeVp6M05UPywNfP+/H49hFxJxMxFZ5198mIHpUyq
	vE3LKvobKGpGSO7fBxkVwkYrRC2BAOM+outgj76HF9o/2FPOTEgL+v2nIUrfF5Ys4EiBxN9Yid1JB
	T2h5yeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3a-0000000780x-1wZh;
	Tue, 11 Nov 2025 12:01:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3X-00000007803-0HUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:01:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b64cdbb949cso699828366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 04:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762862461; x=1763467261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9M3cMyzoNu29tzKfw+UGIVH7zn3E+bc2pWo8lrVlBg=;
        b=kzouWhKXX91dKjgpwlwdKI6Wu0Tiyoq+QtevQ8GSD2A6jLZL2J8i3uooLb4AOu4+y/
         BDw6Z0QBwNv8maZacrekmx8Mhj6H9nKk6B0F8lYXPbXEHIW01Fj9tsWpuJbmfdCqtw2G
         CIt+embN1cdKyghubGgXDZ4LA2p1VtNxIxYioGi69wcdlHxKBheTWHIWkTZziewn7GD8
         V8g94hEKNfIpzzD3ZNcfDSMj6UK8kDmmpanRnkBZNQFWpLHZNEBOn0Fqqjv1bjVBUIVL
         VMhsXZZOPlC8hFk4yFEXpIGYC+2GBiJxDrp9Ns3q7i5aIkPrsuXKO8HxGK4C2fYDWggw
         8ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862461; x=1763467261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9M3cMyzoNu29tzKfw+UGIVH7zn3E+bc2pWo8lrVlBg=;
        b=WdBmICDrcj53I2kYU8cPjV1xWd9lagNwHUMrh0GRKWit4nvpEqzhMieoC4z1ysvdla
         hsiSCte1/LZ7keTa1iSZb5HJc16qrLqM/MBMep20kKzAMKuTpjhyOjGEESmH/pUqlzQZ
         SulJ0hPvIrBtUDnrDSvOFjYkp3+PvZy7QI8tf/RwcFHInHu4DaNBz0CglrU3PU0JQ63R
         Xcmj/eJLFdaliMn9PbGJdj1uhhNqC67oIgQYlqR9vGzH4xBiz9VM2hyux7+/HJDAIgG3
         EUUTuqqwwXHv9gnLf5Z1j9zZFVOgEYaIwDnycDtlc4okglYCm1JaSTxoHBWFQvSS9wcY
         rbvg==
X-Forwarded-Encrypted: i=1; AJvYcCXcMeKMJ6OluEdmQEaCoM8prnLbsm83h4QDzs2JzpAZ4ZvMJkPUn3DeZUj7botCE3nPgv1t3MUt4fy4zsac/ng9@lists.infradead.org
X-Gm-Message-State: AOJu0YzSeC2/XaQ3RgrNz7sVHf74UwG97Lx+9YR5IyTGwfJEJvPcax7N
	zHbQm5FEqluLAhW1WMSNlZ2nWWQegcDVvWpaowTzncw/0sbifoxgQ2vn
X-Gm-Gg: ASbGncvLnHrh0qGgeMvzTIFHaspBggnyuGncsj/S+iOJXi3KCyMopWS3w1HSg+DNn69
	5YdU1bBSEc3BACV/6i0+BGrQZe8VJK+Xk88YDOk4Gfz1HzIgTEfhiorIlpg9FcdsqF3SAKuT8Ua
	BoLlFoyRROTqRFhB5PdKPZgK5wWNkVr51f/HpftjZB+Kg1nl0AnRAds5LrfGV81im0RK7ulpZ7I
	0s44yCzvse66SAZp8/uf+iTt4ZAgiyjsaMejQkPdn5wtQRJayypu0CKnWATTk536wpiMiyGAyvn
	Tqb9K9R5zBhhlWxFx7La7vpfPtnJ20clRJZUY6eDDNj28DyVOCIjRsQkBf3QxquPWZVfGi0pBI4
	mQbzkuMuYe9MUYnfET9ikjvMeNSY0VjEfbkvh4ES3RSlC3CSmPxsX90SF1je0NUe437qDCDFS03
	R3fqOHjnFBUPfXk8UDYhtpPVaJDw42ZUyTGBajIGGqpPfrDRo=
X-Google-Smtp-Source: AGHT+IEv1psFTLLIn3fLR6zBNaC1O4/uKT3iU2N03Fto9nCIf6JIXdox9iEwBJ11RCWUIzocGYmgaQ==
X-Received: by 2002:a17:907:7212:b0:b72:95ff:3996 with SMTP id a640c23a62f3a-b72e02d25e1mr1281562866b.10.1762862460597;
        Tue, 11 Nov 2025 04:01:00 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf407a01sm1340707466b.22.2025.11.11.04.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:01:00 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Switch to using AIPSTZ5 on i.MX8MP
Date: Tue, 11 Nov 2025 04:00:19 -0800
Message-ID: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_040103_128897_AF6E42D9 
X-CRM114-Status: GOOD (  14.65  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series is a combination of the previously dropped patches from [1]
and the config-related patch from [2]. This enables the usage of AIPSTZ5
on i.MX8MP-based platforms.

[1]: https://lore.kernel.org/lkml/20250610160152.1113930-1-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-1-laurentiumihalcea111@gmail.com/

---
Changes in v3:

* enable CONFIG_IMX_AIPSTZ as module instead of built-in.
* link to v2: https://lore.kernel.org/lkml/20251104150612.1874-1-laurentiumihalcea111@gmail.com/

Changes in v2:

* squash patch 3 into patch 4.
* rewrite commit message of patch 1 to state that this driver is used
  for the IMX8MP-EVK board.
* rewrite commit message of patch 2 to (hopefully) better describe
  why we need this change.
* link to v1: https://lore.kernel.org/lkml/20250821105634.1893-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (3):
  arm64: defconfig: enable i.MX AIPSTZ driver
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 16 ++++++---
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

-- 
2.43.0


