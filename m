Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C0C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=; b=o6+Ka7FHD4s8hMTkNgcCvSExaD
	3IDwL6Y5x4XlQ4lb5+0PHiUj4HfWbgebzEAX50jtDtp84Su7WLBsJBvdPxdjQu4XfYvfUFNearnVE
	+HanXs3ym84g9y1Iy1QB5c0xUoJSzfCFlkJbSsP026C8dKBO0q7hRpxo4EP/Ro9hJieaT4V79OY4B
	vxGvsMgrvfp1E++tmi4CrzvUKYhqUxaQPF+UF8VBZB6o/cMOODZnjRjnZRCYLGEIU6l684maFOKvy
	Tq3mf/84zdSdHvep8qI6nTo5EswbRZ5sl9CwkCmVpj/+tdME3EwcsJTNFOUbLHYiCwvOsoHfhFbUg
	L7GfCEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxWT-00000005pDC-01kh;
	Thu, 06 Aug 2026 12:48:33 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxWP-00000005pCY-36bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:48:32 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-66843536f94so2882793d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 05:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786020508; cv=none;
        d=google.com; s=arc-20260327;
        b=gOA80BrkxaxlCVz+neiSD9OWHqlPiTG3jNmPVPDIGH5YipCszS9nLyru9K5RM1r4XX
         XsaMa6AxbODxBpTIBwJ/ifXomO69MUNLFNwrHOjAhazGR3NxwuAhxaLYLtYKN9l23dwI
         ELxbRvvUuKeazEa9i7r+3CUvChfwDfl7DeV9sAlXMf5UAex8hCd96DVkhe2M9VSoN14R
         6onNxWg2xLTDR7py4DBs1oeL81mIjiWlGWLVlUGcdW3Ad+ssS0D3MJoej5AEiZBo1Gxp
         lfzttnSGaEUqL3n35a/yQCVVZCSiFdY30wruMnyYM2qX28NQxcLsNVu/s58dhLiNtqFY
         FvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
        fh=QxdxapHiBlkoht3YWXzAU7yzF3D3DzI0F1zss/cCaP0=;
        b=r8/8QYoFe8ebrI7KglILywanBaZJLEZM+ultPjcdgBglPPr8dFceh6vvKIkg7Q00R9
         J0fcBVjx3K63PUNUD4ozutULLRhcjyBa+WSBDSIoDZITCF3vDvyrDsa76VT6yuDmlZ3z
         0Gzzy8Jj/KmgdCM/FKNZ8xF9xG4np7dNY5hie2MPF4k2ocqkCKs9gQuWDS9nn+J7xL4h
         JOkRcph+aRPejhB+wC+PxzjrIj+6ofn6ZuVDO6NuY7rYr5yW9ohQlWbWZO8AW3wkoTg0
         ota4hIYqXnWOCfWZP6NVgycWLFPHyDgE/gVUxkGR4UOVSv2pLAchEAnvsLuJYk0q6ak/
         M38w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1786020508; x=1786625308; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
        b=dO/5F8sEtlu3PTWbfsl5J7QnrthKjb/wiRXOsyHpxOhgz7UKSNxzTc5b3JI/x2NWcZ
         4mTb9BO0+epWM4ZAlP5h7C8aZkxn2S6iDq9C/nI/C9711Tv6kd82j8mb9/HkV1BA/ha+
         MxDYMaaGtK3+SbQHp1EnKi7TQ34Vf7o0kf5cDUCen+oheYFZ/Edut2ZZX4UTiimZ5BlH
         L+MskwIUNXwIDCL8B4PSUM7PFeEleDsmsQDqzyOjI8m4BXsagzMAOpReUHoZWAIksyw7
         08EAdeO8+kEOPPepK9MOzPbqrMRijXhZCb4BjVKwichf1GL0T8ObR2xgUsi0Pp5QKoOt
         ehEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786020508; x=1786625308;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
        b=s4463Fydid4ClIQLxuH59JHx95iA2lfgg8JA73VixfvvWD9BcciXje6HPSN2DC4kkn
         G5X72+7qBpmKd4E0aASbnNbNnTE+SZ5vB0Mi8nPyJU3tMQikT/BbP321E7yhcD7TXwq4
         +jVpiL3doC7I5DIGtBXxg72WKpaUvJDtXdWyHU6tf0guYvGyKmAYqWD1GAmjp2ypT5gp
         N9pjOJoSMKU8tm392uvJom9A1n6wt3sJpmrRMpZVwpkXLDsV+m662veTakEZDpgDCOhf
         yzcJ5sOE3Blo8LHiQi7NdiOTCKbkIMwifsZNzaOsb3UY0EXdGOk4lEFMEH2IyFM8qhhD
         SDfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoCPIjWJlBTcMthyIef9ywM6ICiHISL9lyUvyPBoL/Lq7HgEI3GXr5o41QUa2UWnhr2NagI3BjLNHyzVZ37hoI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy6kmEJKA517Ts0G1G+vdYkoEU/h0XVKSgeMQO/RYwOqN0gbw3
	5WEPJRnbmERMO6OPKjMaPYOvOdxks6kcHDPaIQGzEDosVi2kb9SgV+HNc3RZUKF7ngIbNWQHq9+
	KkmnjAoiJ0RbAu/6GdSEYiuoLuxZtQoSkqJpwGVGJUo0ofYqOLyGqDWibpLo=
X-Gm-Gg: AR+sD111lHpR1PuJMM2GnN3BeXOht1zl5yFBy2CcHrvg5yl7eKzWW2VFFhjGztjGeI6
	AQZEjd8jaFbsr7og9PY75HW3pc32cALW8gdQOMR5ERj/Y//cmheO1G1Y//kUvmR76iljtqaDRBr
	EBIJKRHQJ9JxH+HpfjIUmq+kyefh0rUO9rEl9zQq/AQov8NPJcTdEVZAi/nVnLT5AHa5RzwCcOQ
	jSA7la9UVrFTpuPZ7m2dcJ38DOSlBgacVqxuuJkbJ0AGc2v2lUwPaaDqYna/SGYYgpQz+lonm4+
	JlZUrP6HRRHSkG86Y81ps9enhercoi8BEaAXv9XIU5V+Po5/nd0vQFdKtxLHAq9U+yD9jwOa42+
	RfG2gu0wOLLBg
X-Received: by 2002:a53:4206:0:b0:660:3426:3fe1 with SMTP id
 956f58d0204a3-6699aa4a50cmr6299399d50.24.1786020507983; Thu, 06 Aug 2026
 05:48:27 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Thu, 6 Aug 2026 14:48:16 +0200
X-Gm-Features: AUfX_mySjTng8JCgS3vhMm8N0h6IDOmP9gM8LKYzLmyz-LQZnRP_UD9sRmPowLU
Message-ID: <CAHTX3dJYaEKp_3WH6Xj_t6qHNGUP_nvRNcASA8hrToadsTeDQw@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx DT changes for v7.3
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_054830_037803_9DCB50A9 
X-CRM114-Status: GOOD (  11.97  )
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

Hi,

please pull these DT changes to your tree. I have put together arm32
and arm64 DT changes. If you want me to split it into two please let
me know.

Thanks,
Michal

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-7.3

for you to fetch changes up to e1ab33a3b2892f56102ce90b20d2445847e758a5:

  arm64: versal-net: Switch Versal NET to firmware clock interface
(2026-07-21 09:53:48 +0200)

----------------------------------------------------------------
arm64: Xilinx DT changes for 7.3

bindings:
- Cleanup xilinx.txt
- Update ZynqMP firmware and clock descriptions

zynq:
- Drop bias-high-impedance on SD

zynqmp:
- Drop bias-high-impedance on SD
- Correct indentation

versalnet:
- Enable firmware interface including clock, power and reset

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: xilinx: zynqmp-sck: Correct indentation

Michal Simek (8):
      arm64: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
      arm: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
      dt-bindings: xilinx: Remove EDK/Ethernet references
      dt-bindings: firmware: xilinx: Add missing example for ZynqMP
      dt-bindings: clock: versal-clk: Fix mio_clk index range in
clock-names pattern
      dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
      dt-bindings: clock: versal-clk: Fix Versal NET clock validation
      arm64: versal-net: Switch Versal NET to firmware clock interface

 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
      |  93 ++----
 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
      |  68 ++++
 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
|  15 +-
 Documentation/devicetree/bindings/xilinx.txt
      |  98 +-----
 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
      |   1 -
 arch/arm/boot/dts/xilinx/zynq-zc702.dts
      |   2 -
 arch/arm/boot/dts/xilinx/zynq-zc706.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
      | 345 ++++++++++++++------
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
      | 123 +++++++
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
      |  74 +++++
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
      |  38 +++
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
      |  53 +++
 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
      |  55 ++++
 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
      | 106 ++++++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
      |  41 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
      |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
      |   1 -
 24 files changed, 818 insertions(+), 311 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

