Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C76C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t2hoVQYicuZ2m33t81d8plIbjrw9+RjXqm/sMzy0VP4=; b=3QnuwWgR9f5aOB
	xYDN/S1+mVjomzhqvLE++ICTGUzqi2C2m5U4Anq94yTccc12TPJYktJgII+FFTgETSdT41/1yUwIf
	wpuB4ei2hQsLtlcQAhRKNWIkRvLt9lJbAaeSjkPr9lVCrg9+gBDrwJ0vVIL8AoQYyOQWowEU6o34j
	MNxLvmoUQkOypM55LnLtaV9pwwt1IWqM2qK8fmrblsWL0chS50QycYFzpn6jO3EpjjRcEgSV+Nxkd
	bRmktDPH/KeJhLmJL9TCDM28rtGLGE+CH7fbAhncVodVm1RGp2N0+PQR4w92+ec2GKWWxLI/GNZCr
	88w7xOIU7vOVjKRMY2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ9o-0000000Gpeq-3ytI;
	Mon, 10 Feb 2025 09:32:48 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ8P-0000000GpJ5-2wkm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:31:22 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-308f4436cb1so2725931fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179879; x=1739784679; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2hoVQYicuZ2m33t81d8plIbjrw9+RjXqm/sMzy0VP4=;
        b=wuivaNbAL9Mzkg7ErYrRmqjmTyhPZ9od4WfRRk1I4h/OzK+wPm6LtHdEaaOTrDGkMM
         22RzckONDUFCId9x/2BB5b6rS3HnjuAxZ5eJxt/sVpQa8Z7qKKbrWl+ZPRBf/oGar0YS
         OjJIMOciBS7TlI7furWcGk2cS/kmiqDu0t/3w45iBQCwZaDj2tcR033bcsX9DcktlCSW
         NmhHfi567NqscUgyDHUIHBdFzcxrZZv5HK/wuC6g7itFcKpKzHiUql9Vl7cPx4AK26Oi
         Ec47FOITQ/ekZwfQeFPPMqjrQIoJeqwKTFSt2HDjj529rpwgxW8z2aWWwhu9e5AcgOlW
         nWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179879; x=1739784679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hoVQYicuZ2m33t81d8plIbjrw9+RjXqm/sMzy0VP4=;
        b=hxiH9fj/9E/qamH9dginlh+Hpww6FGDboqmGcV19x/wQO6T852g5lTChEPFKXuvZm1
         gIIFVHcPjX0elwSFtT5cCTOX2/a3ErUXA7ViEECHIpCOIYhtPsBEwC8drtBc332dIxKz
         6sVcHqIUDqgWjn1dN0xveLj5c0A8CrtVPLlb5B7m1la6lfX88Fj9j4zKdK7odR3/R80L
         R1L+xeChZWKsm4ZlCwCs+phLZt3X0dODossp85oofVxbseyf+2jiUxLQzM7ZLs5kbzyk
         a32wQ2V5OQiUmuLeqxeYaFb8whvqz/+bGyzyHVNR4+G3F128VRwW3TEXVUQ7JvxDDv0l
         6tIA==
X-Gm-Message-State: AOJu0YxcEDUBSUFvdWrLBamrZWpTFY+5gl/pojhQTjjaqY5s5VOdLdi1
	GAB8ohAA3QMNOc05phiT87W/a3ZfsGmO5K5OGK2Qc4cZjO+jTOgS4LrOlJ0nliyGahptMrWZwES
	j
X-Gm-Gg: ASbGncsHLMDQD5z+Ddv7mda84LnQQbhuDBVWyXnMI0vGtGO4SPq549GewnYy2NDcQBX
	SA9+VHyuaMI8gUNSXopdRsH+ThsUJfd6oQYRl4BDvpme3eJ1CHdpgQaIvBW18U+ns/f1KPFbM2l
	bw4wFcKjdp0Hd92o5NUZsPPsdZ4BNVcwK9a08CdKRRupmrjs+FkASGquUxw/htz3gQliypU2r+S
	aT9QKkc8lzHCFKnpL6z3AI/H5X10EiqRpfg/KkNlEkXi4jgwSOA8L8+TayKPWD2SPPKqlozex+h
	NqwYAWLO/4Vmsdpd2NBdqNvh2Q==
X-Google-Smtp-Source: AGHT+IHX0bcCH12vfaXXnoTFQKZGthtl9t6b19AdB1KITvJcWAHBCcPDJAHJV9sCs/EYFlx8O/JUOQ==
X-Received: by 2002:a2e:3a11:0:b0:308:ebd1:ff6d with SMTP id 38308e7fff4ca-308ebd20288mr11721631fa.17.1739179879224;
        Mon, 10 Feb 2025 01:31:19 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] ARM: dts: ixp4xx: Updates
Date: Mon, 10 Feb 2025 10:31:14 +0100
Message-Id: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLHqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MD3cyKApOKCt2UkmLdFAPjZHNjy6QUk8REJaCGgqLUtMwKsGHRsbW
 1AJcAMtpcAAAA
X-Change-ID: 20250210-ixp4xx-dts-d03c739bd4aa
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_013121_751132_4A74D03E 
X-CRM114-Status: GOOD (  10.52  )
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

Some DTS updates for IXP4xx:

- Provide the NPE handle for the ethA ethernet controller
  using the proper DT property.

- Fix up the erronoeus PCI IRQs on WG302.

- Wire up the GPIOs for LEDs and keys on WG302.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      ARM: dts: Properly assign NPE to ethA
      ARM: dts: ixp4xx: Fix up PCI on WG302
      ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs

 .../dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 40 +++++++++++++++++++---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi      |  2 +-
 2 files changed, 36 insertions(+), 6 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-ixp4xx-dts-d03c739bd4aa

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


