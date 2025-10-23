Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87039CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2hwEhUqYfYT/qHtg7r3dYTALVK2W+Pk3Q38aU4IIw0=; b=Y3drcmxx+zOwpytFJO+cH4n4m+
	x3CNeyohyr/OMvTFykpN5wzDX8+NNU1j+zt5/bd//Xb/ZQqJKAUiQZasdSPrhGPlx2KOBe+0QRxVA
	tHjvd+nS1bnNUYEIFVMYhPlv5eOtLyEbhOFNSWDjgTrRSdRKp/uEvzko7/CtY0c7cF/crUV56gD0N
	3LGdMBQCAw3FFVbwLwwDjAdWyjPgLSljsOaJrRGAZ4bCbzfyJHRf81ghCnumIhhbh1vs3eXatIN9u
	2HEYiTtzJep+bwVQd/xKYgmVMkt8vvJaLPcXySwyil/3IClCBvjGk0QhoKmju7OdsO5f4xy6DfA1y
	Cfrqjf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1h2-00000007VVR-1bbC;
	Thu, 23 Oct 2025 20:13:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1h0-00000007VV3-2SSS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:13:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso1194481f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761250428; x=1761855228; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2hwEhUqYfYT/qHtg7r3dYTALVK2W+Pk3Q38aU4IIw0=;
        b=K/P9snMakFFnfkSbGSF88nWBuACN4n89UuOlUO5CQGX0gmjQPANyGIx/4tfBskKKhQ
         CaI/ipC+mU0Y8OgEeHtJXTjP3JyyVue2weUS+lmLP70QAzYPNKBmE7vPHRbzjlNo7/6i
         fs47h5nXSMXnL8F8BQK68bNeNx9lrrhs8DtrQ7SHTd5phjX5rsGMYI2oXIK1ILyzIY0G
         PtdZrUhERSl1kzeFMa7Muyk3YVbsKvvk7aOr10RDvRHXMyiOsf1YVZgT1A4ZSUIzd5ov
         lzj+V+34vHIl9O3maPMM/FnCGPKKwGOxlpCkZOJvmzIVEkkf7zqzu9NIqFkVU0EN2En5
         +pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250428; x=1761855228;
        h=content-transfer-encoding:autocrypt:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2hwEhUqYfYT/qHtg7r3dYTALVK2W+Pk3Q38aU4IIw0=;
        b=Sgu3+1jLCAoS5oOGA6enIAcf6UcoEbUHaQr4gCeyPJ3GRFlbnzFLpz5CTGYPvZ6WNZ
         S60wioR84ShXxkfMYzo/AZkVUHBrsS/AOJc0hdJSI5AmNnyQde9hPySHYFN4oT3C5xl8
         3Spo/yoHhXfgr3ksUgmkR5Y+wuaCfpo69FhDk6yfCrDkvOgz8uPW7kKWU/mgE3F9H1UU
         SJXSruS51E0ehnJqAAhACFV8+79GxQ975sO65UftXNJHBVIGN+EvRsUYHezEYxafuq0i
         KteYbta0lL5mH+xSq2D1nqNhiIHwI02L5o+/lZUb8DP8IZBpXctPCUkRsodpV4Eq79aA
         9LzA==
X-Forwarded-Encrypted: i=1; AJvYcCULPynHPysZoP92PMPSQ/8EBrr2pac8LED0Zr8NxFjn2chkQDLeMEa5FGiEaSp9wKpnErPpgtfXaar+OcV+bogy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5sRhch1GoJMG59XSSdga48A9vbodVnwlASbsYxhtMtHgKlhjq
	68khKpuH8KfZ741IbdqWLiuuC9EwpYfwXAGt4rOCAFDG8cbH8jT6/ciW
X-Gm-Gg: ASbGnct2tLBgdeCuwzFavrs0ymoo6gBDzPkMmV9Yjngw28X89TnDr70bCj7brv0YxZz
	EEIEIyf0DxEao/HuazdDeUwj2lUvXMs9jHCezgfumtb8r8UmuLl4iZEfgBsweJuriRemOBu+LnX
	O8UlJ9S/LGIyxlXsdZerc8NK4Wqp9A5FSvt7qv5VLCxdwGCQY8HTY1m5vOd5Rdr60IEuSIRgU9g
	GHzvnQCkAqeYxsGQ/+8JF17i+7K9Hv2uDW11HUn0dd95z1AxiVjssXT+0SShDBSKxyEb6tlQWZe
	/QHLKTt9Mv9tiM75JOzV+3D4nE7DeZB2ci1ZmVAE+z5FhR0R2DEvlaF3G42EvRQ8zLjLobQyzmY
	MnPOmVprjx19FilUAcVn9/mbtHBlmjtOKo+c9s+2HiSHRvrGUqg0P/neiqKedFklpAgXmJh50ju
	7C/I12N1B4RJoznb/y1iP9SH5/2RsgN4iaG50WpkeM2G+wFbhlvfsNYilCTHiehx6GoZRJ
X-Google-Smtp-Source: AGHT+IEKK+zOGpZATsQyS1d6e2LRz9SXFTQ+r2qeVseai2EiIfrVWnlXizPcB3r0/oW+AW+IxfnYVA==
X-Received: by 2002:a05:6000:2dc9:b0:428:476e:e0ad with SMTP id ffacd0b85a97d-428476ee1dfmr10606701f8f.18.1761250428146;
        Thu, 23 Oct 2025 13:13:48 -0700 (PDT)
Received: from radijator.localnet (93-138-224-9.adsl.net.t-com.hr. [93.138.224.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf99sm5889072f8f.28.2025.10.23.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:13:47 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
Subject: [GIT PULL] PXA1908 DT changes for 6.19
Date: Thu, 23 Oct 2025 22:13:45 +0200
Message-ID: <5048490.31r3eYUQgx@radijator>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KUR
 1amUgTWloYW5vdmnEhyA8ZHVqZS5taWhhbm92aWNAc2tvbGUuaHI+iJkEMBYKAEEWIQRt/0HWDf
 MUtbdrpjCtMZNSRY+tAwUCaJ5XkSMdIEFkZHJlc3MgYm91bmNlcyBhcyBvZiB+MzEvMDgvMjAyN
 QAKCRCtMZNSRY+tA/N/AQDth3Xl3wNcETvWPqqfYfyw4BFqbOD05A/W0/G0ZIjFzgD+PZVts3sN
 p5WuEwIxUrWxwavWJQBJwhXeWdru5ol82gmImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60
 DBQJmiSH/AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw
 8A/i4lPOL7NaYoYePDql8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xq
 h2MRcNmJCHA1YhWAbQoRHVqZSBNaWhhbm92acSHIDxkdWplQGR1amVtaWhhbm92aWMueHl6PoiZ
 BBMWCgBBFiEEbf9B1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwMFCQlmAYAFCwkIBwICIgIGFQo
 JCAsCBBYCAwECHgcCF4AACgkQrTGTUkWPrQPUYAEAlVKitl0w6Wun+hC0JIf8bnc0TnrH8kcDxV
 f5lAF38fcA/j8RxR/p558NTFUyHZt2Sa5AqxVkaA4aJekySytWe1YGuDgEZokhzhIKKwYBBAGXV
 QEFAQEHQMRz0l4Dnk6Vl9YqC+ZGDDpr8SkFDyYOXqdBMGad3VccAwEIB4h+BBgWCgAmFiEEbf9B
 1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwwFCQlmAYAACgkQrTGTUkWPrQMbkwD+K6jiXYYMRnV
 l/5dpL//wXB1cM72ceR9tXYweMXg1lfABAOugzMF0xypW9zwYAEWVNOAaPsqtEPPYfBY3IXxl6m
 sB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_131350_661729_8B064617 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

Hi SoC maintainers,

Here's the first batch of PXA1908 DT changes for 6.19.

Regards,
Duje

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.com/pxa1908-mainline/linux.git tags/pxa1908-dt-for-6.19

for you to fetch changes up to 0e53b0bcad00107ce82968e86ca11a23f8a91f48:

  arm64: dts: marvell: pxa1908: Add power domains (2025-10-13 12:11:38 +020=
0)

=2D---------------------------------------------------------------
PXA1908 DT changes for 6.19

Rollup of hardware support which has accumulated since support for the
SoC and coreprimevelte board was merged. This most notably includes
eMMC, PMIC, backlight and touchscreen. A few QoL fixes are also
included.

=2D---------------------------------------------------------------
Duje Mihanovi=C4=87 (10):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector
      arm64: dts: marvell: pxa1908: Add power domains

Karel Balej (3):
      arm64: dts: samsung,coreprimevelte: add PMIC
      arm64: dts: samsung,coreprimevelte: add touchscreen
      arm64: dts: samsung,coreprimevelte: add SDIO

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 267 +++++++++++++++++
+---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  51 +++-
 2 files changed, 283 insertions(+), 35 deletions(-)




