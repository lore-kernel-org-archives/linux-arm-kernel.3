Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945D8C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B1WpV1mK/ZfAGKlbOl9xD+Zq1+n16HpY+NcEojw2DPk=; b=O6bvNQLyS/tEEx
	a1ADnhM8Gj23h6QU8NczvRJxhqoE38ERPIwybP/drv/s1D1bUpbU87CWoCIKf3M1JJjZ0BQm97+x4
	SQub/5s1jV1PUak3JFvxTU5sPHZxY95GXeHuBIxWIgCtzfxRp3SiNVqtG7kw7HGUUtV6zadYlTahK
	7RBI7SfA6sbAxp3NkGc1vjj8IiwVE97PvbIIaZMjHx8wuF9y2heFwA0Umhz2XhjYe2iLTLw9L0hCm
	2LU+f+ckG24oGbOdajZGLtz+cZFyRrg7UjNDI0aGkxMHuq+/RNbKH7He1UwgWKsALfyV25McHqpPO
	4154NS4KcwHd18Eu+hcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvipg-000000058UG-0Z4D;
	Sun, 16 Aug 2026 21:55:56 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvipd-000000058Th-2HKB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 21:55:55 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-394f4397662so175478a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786917353; x=1787522153; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B1WpV1mK/ZfAGKlbOl9xD+Zq1+n16HpY+NcEojw2DPk=;
        b=Tr/NOQ2rUFUDGl84H4fj1GS6ClUTAbepyaErnG3KSXW6e1rN6mnBZDw8DprJlfYyFf
         zBWSJp2Ovt6JoCSk6nmfTLYoeM7KDrv1ufj96JtL/7f0AY8oeDafkJ+jAQQlAk4MMShT
         N8H+Bu4hI7yzelYzAAtQGDAefws9ZXhM26yMzSRo6GFtRKXKx1qAMkIl8CBGWTEiG8ak
         rsP/sVbzvkT+gf/5DVirhJVLFF7o6pb/ySD7qFnKN5ldJIXNW+EIjfk12NzbGNElbCGe
         SKoAAsKvEwePiEDBHjwypgjqMOS/nKnX/xmNnfg42Vqm9AtXD9Rspv1YL3xJi/6Wl0yK
         4BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786917353; x=1787522153;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B1WpV1mK/ZfAGKlbOl9xD+Zq1+n16HpY+NcEojw2DPk=;
        b=mVUDrv1k5KJY6pUf4pOWPI+GInmQa8+PNjTYrRmZiJ0z4J+WQcO4LQLH0d5FnpO35Y
         sTlGP3HMipTwT8VkarilteIQg5PRHPYY2X8WGrl1RQO34G1XFt2aHDD2MJ5xJbFYUdqn
         rKRIJTgoVuIu+P1z1F9KI8FgUswCnpBHduVjcBIEVbeT94yOf8AXNWc6qnfWkOnVtGtU
         +A78vRjcGIo4IPU0SZ8vNEQp4mE2ZYJkfJbiYACsPFMFRneDcwilIknwon0hvpvKCs+S
         MayZz4HLIS4vgDrQjhfaxKj6AfoeQOAAeeYYDT0SRztmsZcF16mfSK5dAv78HtxmqO6u
         EbxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQCPpZ8fZa2MNcvaX2iQsqzhy2zfy4fL6l27aRFpddab4uJRwJSSEtw4Kf/AUf1uVGovGdve8sJTaM5i4Jv+W2@lists.infradead.org
X-Gm-Message-State: AOJu0YyH3i3X8BUeldH+5PKXT2/WdZdoFLTuHgPM61b/oyFt2YTpv5va
	m5+wxf08sM1apPt3QVtwrgoF77OGJQXVXvBx2+bbJT7w8BG4Qi/kfejq
X-Gm-Gg: AR+sD11IrRQ+OYJ8q5P0iAorpiCr5/G75u4emP6io1noCXTyt4c7ZoeUbUK+PBfp9p3
	1KkU1R7LjUQT2M6ltJSQsrGYD4OsaCFPgbA8Z07o/hO4VvG39LUSZjfNDAMuzFp2YEqZqdP0Otz
	h/3Xq7IBLpwBRT2Y6hxgRXNVVD6RoaCynRCdNEQQAFBUGx89SmORotT4YAtsAOX4YoZjyYcSOZq
	+TtfO6gWXk9TNW7n4b+q/HkPYkKc9zT2/MlbI3mBi2EYw38jmaZ5yZSi7ggR/6uMbvRQ2DpMeKA
	jQ5IRw+tv6o+doTQ/5vw2oh5Hgh0/Vdccrng072H+sVoWPLVAqt7pPyMcn8EGKEHjQVb0VocSeQ
	oXvPpIu7D9xlRo23V5ubsrhh1lgZGhh8YYSwfvO9wJWcbzoNN/UROl4EwJUe6CDqpCUImcSMUO7
	PSU40+mWsqju+gR2Pcg7FmSWh2nCl1LpKkBrvjqnmfL9TeOjICt0FL5bra/EE4NVL7s6keHpzkL
	Q==
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2d3b04fdcb2mr164306085ad.0.1786917352596;
        Sun, 16 Aug 2026 14:55:52 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504e:1c5e:cbdf:b953:2369:869e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm30168318eec.10.2026.08.16.14.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 14:55:52 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/2] spi: davinci: Convert bindings to DT schema and
 clean up DTS
Date: Mon, 17 Aug 2026 03:25:24 +0530
Message-Id: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Myw6CMBBFf4V0bQ0dYSCu/A/joo8pTCKPtKTRE
 P7dwsqN5q7OTc5ZRaTAFMW1WEWgxJGnMcPlVAjb67EjyS6zgBKwbBXKhaXTiUfLMs4sCSvKaw0
 aFFmaA3l+HcH7I3PPcZnC++gntb8/U0nJUurG143zrgaEWzdofp7tNIg9leC/DllHi75WjaoAz
 Le+bdsHebSGPusAAAA=
X-Change-ID: 20260816-ti-davinci-spi-e64e4e48b6b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786917340; l=1857;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=wnvFaFSfPUHo5q23p4OvlwaDUECNLrAx79wkpH1U0R4=;
 b=oDGmhQUVyB+xUum7xYfs20IrjfgZaGulpadBS1m4rxfHPkdNrIypL0etLP+GhRaE/1kbq52+W
 kskeKebO4qwAsGUdkeYMD0LT0v+7X4qpKYHUOo9CuNVWeu+IeVp3qUV
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_145553_590410_BC59C975 
X-CRM114-Status: GOOD (  12.25  )
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

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 renames property ti,davinci-spi-num-cs from keystone-k2l.dtsi,
  as the driver uses the standard num-cs property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- patch 2: since old text binding required num-cs, #address-cells, and
  #size-cells mark them as required
- patch 2: davinci-spi don't work as spi-slave i.e address-cells 0 is
  not applicable and spi-controller permits both 0 and 1 so explicitely
  define #address-cells as 1
- Link to v2: https://lore.kernel.org/r/20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com

Changes in v2:

- patch 1: Instead of deleting ti,davinci-spi-num-cs, renamed it to
  num-cs to properly preserve the hardware's intended chip select
  limits 
- patch 2: Removed  maximum: 6 constraint from num-cs.
- patch 2: Add standalone support for ti,dm6441-spi in compatibles.
- Link to v1: https://lore.kernel.org/r/20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Rename ti,davinci-spi-num-cs to num-cs
      dt-bindings: spi: ti,davinci-spi: convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 124 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   6 +-
 5 files changed, 153 insertions(+), 103 deletions(-)
---
base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav


