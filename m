Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C05C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eA3yl5qbMrv9Pl7Gju28idPgTrKUB+D3bsjesOdUayo=; b=G2PO/nbcwhYlHK
	b9MdFqmwWBlCksIodXjC7T1IedbPdQOo/0IBm5pPNolm0A9+AN1aM4RJpuZkv4p7Rkoe5cTkn9Gxz
	aRGUNL8ds17tazI1NUpb/37D2vbsu1r9zHWTyLX9xkmpF9Wxbm4/roDeyLwVQPiscNzF+c8yQHUw6
	6STwYOHrKt3V+xiRVWPCP/F7Xet1DjXhSZDXAJCUHM+jVC+6P2dGnXQUOLSbt+Ar3lkEZt6J+wJjf
	0q3aYjY6ykVcY3USxDICJY4IusCKQ4aEalJfMxflOMshOw6TUE5hnK5BMCXf0JEQbUADfvsG7b8x3
	k5xJXKTKbjUjdyQEX6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEos-0000000FCyi-3DYv;
	Mon, 29 Jun 2026 16:26:50 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEoq-0000000FCyJ-1FUk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:26:49 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-13986d61b4fso4899057c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782750407; x=1783355207; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eA3yl5qbMrv9Pl7Gju28idPgTrKUB+D3bsjesOdUayo=;
        b=ASDa7fc8pPjKYnPpWmWxan4tqnkGhIS/FuKgTr2TAN4tl2cKr2Z8KILJoB++HuN4WK
         ml6Oeqof1EiC6fus8uAEAd3k0UZpe96BGA8P0gA0bzPEbk1wiEnQ8gUZQngDPaGRy/x+
         1/SEHeDbkSgu6ILxA8c2L7kCe2paiYc5E4oBlj7wpQCYGYs5SvfDrYDuIN6gXiKEeNpV
         XygtnOhuqcutUR3GHQmbRiUCzchgbOWaiqs55OvpPr+b8zZu75nle1WoFO0drcpZGH4f
         p/GjhL4NwD0AQhOm8i1yg+g9I3d4c2tEIviZZ3uDadJeaQUzwKoKqywOthmgc9YbEcc6
         mn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750407; x=1783355207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA3yl5qbMrv9Pl7Gju28idPgTrKUB+D3bsjesOdUayo=;
        b=LxG+v3KXzHuMitQzZa/fEpWUskoG+3PyJtRSRFtwnu9hcuA/I2k1IPGztzgdEqi4w4
         OwRxF5h2KcBrfk+AegmH4BZWS6b5u+HiXKgeNMcPCC1qdp/Vg5lgxTxQ2mg4MZ1js/KZ
         fK7a6XRIrCeIeXtWhx/4IUB3r1wH46sffEZwHmtn4n1MyxTajlfIlmja78N9lJ8/RsvG
         xs9L2y7GNSyaIxsQzI6pulNF5PhNdB9ANYaR9T4utcgW4IXcuUg9UNXFQxGhFoxjAyfn
         Cl20PcOxtr2e1kpvpIvL+VK9oDv/nSucY0Oh1ApI2otk77KTUlt4L6bJB8Ims4Lk75vk
         aEfw==
X-Forwarded-Encrypted: i=1; AFNElJ+FJY8ZMFDzIRpSiALB0T8CYtMUetSxHCmoUBOU84gRPh4DX1NvH+Hq2ISpvsWhmIbGXTThF9hKTxOtnH5Ccvl0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy63XzjOdM+ih57fGnwugMbAvuFB20Lua5bzBgT7jO4vAPZe2Nj
	OMhyvEFhckjk0XW9cbRPHs44Eo+y9lRD2ox8sHMa5qD3HlbNqgTRDlU+
X-Gm-Gg: AfdE7cmiMznHziW2Vkki+rIFl+l475ai0yF7/qMH3XR968BEu5VqA0E4HHzPdmG2S7+
	RdI3U2Acgw7QmcJ4iMXn4NQbRUL4GQOZg+jv50I30horc2Tas15TcZfzjh+gT/wQy8RkAkN/ZjY
	VelM6bu/PP/gVeR5evKtmdYWfrtY4c3ThNl4lrXBJajFwX1UdmPsDabFBDTP7a//RJ0upSODsUp
	ZBtl7T/lqI2UBG2fTnWorkiMx6v40eq8CJKTgiH20dh7eLTmkROxJ6VcZMsiIIUdRkm47Vq4vnK
	Eo2xCfZqutm3NyFPd5DFJhI8Ntjf/zp6JSQXwLH5/b1tKXlogPPElwfsIFUfGUx67QfnMRvXDcJ
	60lURYhqZV/ydrtFT6PvwTE6EEfo02Z9gUxlYBJ7rHDFsXTrmXNfgU+Tc1jenFkjKNGNajA5rRl
	Jd6HpOIvXvbGglpfxeCNK6tkKQecn6iqcSacs=
X-Received: by 2002:a05:7022:3d10:b0:13a:21:e78a with SMTP id a92af1059eb24-13b2a16109bmr81343c88.16.1782750406983;
        Mon, 29 Jun 2026 09:26:46 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-139d912197bsm80851896c88.15.2026.06.29.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:26:46 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v5 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
Date: Mon, 29 Jun 2026 16:26:38 +0000
Message-Id: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6cQmoC/13NQQrCMBCF4atI1kYyM0lMXXkPcVGnUw1YK40UR
 Xp304pWXL6Q75+nStJFSWqzeKpO+phie8nDLReKT+XlKDpWeSs06A3hWqebbhrWXBhfVoWr60A
 qf752Usf7FNrt8z7FdGu7x9TtYXx9J6wpPokeNGjLzhICkyO3PTZlPK+4bdSY6HFmztCXoTYao
 JTMfIUs/4x+WfgyyizkQ1hIhUHCP7Mz8zBfs5kdiCk4D2sG/8uGYXgBRfkHR0EBAAA=
X-Change-ID: 20260327-st-mmc-c906ad95ff83
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_092648_341270_67A02CB2 
X-CRM114-Status: GOOD (  13.72  )
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

This patch series converts the legacy text-based Device Tree binding for
STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.

Note:
The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
depends on the patch "arm: dts: st: align node patterns with established
convention". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v5:
- Rename the sdhci@9060000 and sdhci@9080000 device tree nodes to mmc@9060000
  and mmc@9080000, respectively.
- Introduce the max-frequency property and add conditional logic to include
  reg-names when the reg property contains two entries.
- Modify the commit message to explain the changes done for both YAML and DTS files.
- Link to v4: https://patch.msgid.link/20260613-st-mmc-v4-0-b3c385617c16@gmail.com

Changes in v4:
- st,sdhci: Add minItems: 1 to clock-names and reg-names to allow single-entry
  configurations, fixing dtbs_check failures on nodes that omit the
  optional 'icn' clock or 'top-mmc-delay' register region.
- st,sdhci: Modify the commit message to explain the changes.
- Link to v3: https://patch.msgid.link/20260508-st-mmc-v3-0-81c329ed28e8@gmail.com

Changes in v3:
- st,sdhci: Edit description of reg property. Modify reg-names. Add
  "minItems" for clocks and clock-names properties.
- Modify the commit message to match with the updated changes.
- Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com

Changes in v2:
- Fix node name in DTS for the MMC to match with the estableshed convention.
- st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
  "clock-names" properties, include an allOf with $ref to mmc-controller.
- Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@gmail.com

---
Charan Pedumuru (2):
      arm: dts: st: align MMC node names with established convention
      dt-bindings: mmc: st,sdhci: Convert to DT schema

 Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------------
 .../devicetree/bindings/mmc/st,sdhci.yaml          | 105 ++++++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
 arch/arm/boot/dts/st/stih410-b2260.dts             |   4 +-
 arch/arm/boot/dts/st/stih418-b2199.dts             |   4 +-
 arch/arm/boot/dts/st/stih418.dtsi                  |   2 +-
 6 files changed, 112 insertions(+), 117 deletions(-)
---
base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
change-id: 20260327-st-mmc-c906ad95ff83

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>


