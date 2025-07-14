Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0041C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sbexDFjpftzRKLUMFsoZCD327x/JPVEAr4KstWx05Qc=; b=oXcUHUJvPhbI29
	3w7N50XLFWpI4Dw6KE4hJoO55cZ2zHh2jRl6DMjeVSttKZdU09xOP3R3XMU3XypoVxklLeRFuxBuN
	jXEu0TlWTg6QddPZc7K2CHRVK8Fy9AUZ+1uytpVNfk48u9drRgxrF0xD08G9eWJVQIEu79l19IzQb
	wnUL0fJcpXVRJMfGaGdXJ49PhFatd44njNH6Vqw/PBiHtSBgkALKQOfwT7gkmUEZgk9Fzi9dX5Uew
	iQ2dehGV7W9YD2R26WaAx8dfBOyOi5LLaHUtL6rpz3irSVBMtJXFDCNu76JWBOEcyZQbK332phLOO
	iMSWEExl0k7xeIYcpUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJht-00000002OlB-3Hzs;
	Mon, 14 Jul 2025 13:59:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJdj-00000002NNp-41Wr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:54:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2846329f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501282; x=1753106082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sbexDFjpftzRKLUMFsoZCD327x/JPVEAr4KstWx05Qc=;
        b=a7DPr05ycI0/Mt82UxlHJw8RlcyKo5pQSkczWcoi7kGk7H60zRc7Ee5PDrVLYDgCW3
         VQ/QeKpnKVqaWM2yDj+9NheOwrxCDf9NIE4yQewFoaSRTLrsauqnk+fJEaytQVghOVtR
         CZy6r9QnmZVAvATDe21GIBhfxG9vGWTmesJ3aD0LBEEouHMdxn3cl6qxztpCrEBDIgAA
         U+/ld4nezzbyuAW2wTZveA3ys4HdHqfa69gEdJmTHA6PkluZH6ee39FIQYQZaauDoPzk
         0Wb/EeGgEnX9WUQn2V/iHiFgrc8SrCEPw4iN4mJd6W2Ul5SxCL4G1Ll9kEcsKCBr78jI
         t+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501282; x=1753106082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbexDFjpftzRKLUMFsoZCD327x/JPVEAr4KstWx05Qc=;
        b=OXxboRYBcTe/cS1gD1QN5IvXSFa4WN3ucyqSz5ppAkXuZO8dkPJ1eCwiKPQXzp/yFv
         Ico25vGh23DjS/LxHEcoqIG+AjGIh7w+Q9jbpdebEmbBjDVjWeEkOAPh+w6GqqHTzt/f
         pHc9tev0WDBuJIc5sK7XQpwPRt66oCg1Roo+uRS5QQ7vw4mM1sHRtKL1CjlI8c9mmx3B
         +j1Kr6rbWIm9kkuZqZJEec6wnSabRY1oENereJfteMvd/gR7osq/NX/h1pmrczyKrH+T
         ssYxsvxCBYgOcXGiK2idp+1x9lPI+zzFdHDtFbKhnNSm0Uy+xM9qcLQRFYXisjzeruHJ
         qfJw==
X-Forwarded-Encrypted: i=1; AJvYcCUJA9n4J5PXg9mk/jNGERjyAsgok2JH0tA5orSP20A1YLqVpfuiyfJjq40q+/3wqMczVhIuSCHKH0NcxhVIMRqo@lists.infradead.org
X-Gm-Message-State: AOJu0YxTvHH6A+eVGlCBgBZe8LPYaIWNSg5IbQ1ZEH+R3BriMD30E+Sd
	Jw2SS6gt6wR7E3hfEhSaXf4HBTvVFzNx+1Ogd6FCdO95s4hS6vyZFVrS
X-Gm-Gg: ASbGncutzJHJQWR3Nyfx9E9eeF/MHXtuP/SLwle3st2Vl8bldLJGgIZGt6StKP8kjmd
	2eOatKHGG1WQ80U/rY3m7AwzbNRnoh+VQeg6gGFpTGQrELtXaYw3o7P5oENCjIOIFaitj5RkAgm
	lEIRGEi+NADZ5irByadky5m4S603ciKq1GfMZwHTcgs3e6Q01xWn2n3yIQtcF5Ki+c9yLu91WAI
	w6wu69/Ix3xFXfaQkE2j0A/wBo/AqEjb7q0Ftr6L6Wgjag51t9LZg4gZoJjEHL/XvpSUfZ2yr+2
	01PjLwv/O49e2WJqdR7sJXLzNbEuVsX01tXaYXBVU5S45NO5ggbgkwBqebOmzN/R0uLdZ54v0pt
	92vIGryPEpcFw6tilKwNv6pY=
X-Google-Smtp-Source: AGHT+IF74DQCzwwIomyBqEdXXOD1jj69Vn57eaymRaq7JEtoCmwGDdu6w5HfwaY0Mnrz+k2RuQo+dA==
X-Received: by 2002:a05:6000:4907:b0:3b3:9c56:b825 with SMTP id ffacd0b85a97d-3b5e7f34e3cmr15791519f8f.22.1752501281828;
        Mon, 14 Jul 2025 06:54:41 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd241210sm134773145e9.0.2025.07.14.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:54:41 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH v2 0/3] STi device-tree cleanup
Date: Mon, 14 Jul 2025 15:49:13 +0200
Message-Id: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANkKdWgC/1XMQQ6CMBCF4auQrq2ZKbQIK+9hXBQoMFGoaUnVE
 O5uITHi8r3k/2bmjSPjWZnMzJlAnuwYhzgkrO712BlOTdxMgJCQAXI/EXfmad2NVwCFlKhTJWo
 Wg4czLb027HKNuyc/Wffe7CDW98uoPRMEB95gpbCtIC8yde4GTfdjbQe2MgF/aY7pX4oxVTkqD
 YWR6anZp8uyfAAsKuob3wAAAA==
X-Change-ID: 20250401-sti-rework-b009551a362c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=H/Oh3chBUpLzn0eNy+IaizkwixT6SipYXq6A3XVjTHQ=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBodQwRRIPuR301IFBulcUz6dbFJvnew4dfSC9PU
 wW5Rs/nstqJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHUMEQAKCRDnIYpo1BLC
 tVoeD/96W9cfUoDitYxPMWeu9TTXWFUqavcyUyrp94uDntgeorRswvVTA7Ngg7WUM+OxuQJI5mw
 n9nAtcJPvweseKDZEMha0vMQj82TdsrTKjueo3EFs9D1KIC5mLXlRZP49llMM+AFv+zyEtAOAz6
 2KrimlM4k99/goaLhuMbkvyytEtzIb4OyAjX1UIzp7wkUHD4gCjBfXnIuL5uPHajWXJkniKQw+K
 YX42XDn6Z0Fgk7MKpDEfDYbSZW9453swASYm+DwWWRpJioyS6xKY1qum7JDPaqnMjfIHX5+k35g
 onaE96Aep7OoGwO9HIlELNwYJ+r4L92Xihm00HDUveVw/0QJDYpHhzlnSrSetzI7BhGzNwkFkX8
 6wIxS0icQZU8S01Ed+mkDbxPXwH58bFTNDnVvlLQeQxSL1F8uBhPOuxv7i1V3PsAQoAxJyvTBcx
 DSP8QrngMgqw4J003Om7SHXsP7AH0+NQCebF9iIujBfT3vqYzGlgUph1L2Lkf3IK4JRebCIygAe
 SN/qcDCfkN+NAnhdBdjM0xxWL70A8zRGn4BWHmptZkz4FUOgKXzjZcOmwWIKMzySEdKcXkOTIuK
 PL7XDiC88zGj5zJAIr4MPY4IlMTVIrzB2j+mIt9eAgkxd6WCUXNH3bQ8l6ws1hcDtbWwJ3WgU4B
 QKuezY3W11wgpAw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_065444_003384_38CE7825 
X-CRM114-Status: GOOD (  10.25  )
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

This serie aims to cleanup and rework the STi device-tree.

STiH415/STIh416 SoCs are not supported anymore and B2120 boards are
internal boards.  Update the documentation and drop the related DT
files.

Patch [2/3] has already been sent by Alain several months ago, but got
no response [1].

[1] https://lore.kernel.org/all/20230416185939.18497-1-avolmat@me.com

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
- Fix typo in cover letter s/[4/6]/[2/3]
- Reorder patchset to be bisectable as Krzysztof mentioned
- Add Krzysztof's Acked-by where relevant
- Link to v1: https://lore.kernel.org/r/20250713-sti-rework-v1-0-6716a09e538d@gmail.com

---
Alain Volmat (1):
      ARM: sti: removal of stih415/stih416 related entries

Raphael Gallais-Pou (2):
      ARM: sti: drop B2120 board support
      dt-bindings: arm: sti: drop B2120 board support

 Documentation/devicetree/bindings/arm/sti.yaml |   4 -
 arch/arm/boot/dts/st/Makefile                  |   2 -
 arch/arm/boot/dts/st/stih407-b2120.dts         |  27 ----
 arch/arm/boot/dts/st/stih407.dtsi              | 145 -----------------
 arch/arm/boot/dts/st/stih410-b2120.dts         |  66 --------
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi        | 206 -------------------------
 arch/arm/mach-sti/Kconfig                      |  20 +--
 arch/arm/mach-sti/board-dt.c                   |   2 -
 8 files changed, 1 insertion(+), 471 deletions(-)
---
base-commit: a6cfa4c8833944f8912c1fa7f95795753f6376ea
change-id: 20250401-sti-rework-b009551a362c

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


