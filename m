Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F6BCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=; b=eSbSPef6zSiqao
	2EwmbEfBYBd03DSMBXVVCPopiUIHtHLbl97Iw/jevrlEDAWubomSndrIiC59cr0nN1J5xG5LC3leu
	PnwhSX7EjFP/zMftFReShcX6yWwb1zMymwzAUTjnE+AAZ3DdivaVSE9ofsgn4xt1yXDuCOtzhD4Q+
	WVwDUDVVnRsQJ15xGTYokgSpUQj0bx21+CHyjYzjWodaa5bDOk5CmT1Pfalj3IRu25UPi46xnhtUJ
	+2HHKAJUGCsDmIUPvjVY9eD5i+RjbQy4tYvu+WAa+q93cnLbnbxUybrAoM3om9u5ujiLvIBFXMZ7X
	lnuF3vtaDcJN7LTpFdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgW-0000000GJMp-1fH7;
	Sat, 13 Sep 2025 21:21:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgT-0000000GJLX-2y5u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso2302285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798484; x=1758403284; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=;
        b=iqnaWgOZ9KrCrvNwq6jqc36DQodu1uLQmhSXd5OGVlsF1IwT8iNzVraHuSmL0djSxo
         6mHvpKjevDbWzj/U/ubgoFKf5++TPfyf+HxvVEQRt+NO1uKQXhJlalMq3hnlgpgeYuwe
         g34mY3wqYbA5v3I2s10+yjju5DZXzc5p4M3T9eqMHFc30Y/aAcDlcTwM+/LN0/Mv95+7
         OlORZJ9iLa1rYwN8v4X5S4cUPT9DmoYazgY5zr48A4APeGrMCOF+0UXE/SKrWO59tVXu
         6o+ElBDPvKs6O3ZVsamBJQBbPHLTXlyMeigiFJQHVeTRh8gD1evsCI6rVyXbOn32Rm5L
         PQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798484; x=1758403284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUfEoumCbzIEx8AGvj96Z7JPRJbPQvAkGwx1CilBgwE=;
        b=fO8sAdHtYyvM3Hpz1roPMoOuugNmZCdYPPkOQXiWb88vGQ3WtQhl328RpHci8gRB2u
         X/btL/BRtfo/SW8o3gfsG7TK4dClwf9JzDAeaVhFUR5bVfEbEcbc1FDY8dBzBvILdrWz
         YrARtlJZD1YZYSAwyVLc+ixRDSFyWiPma0mhsMRnM4BO6e0jzt2Q9SmhRMNQYicErc6t
         3VWdSmJfl5+7KHTpnmIL+e2S6AHtR7i1IZoJBEMHaaLtJf8SHhYlFinIV6qlT2vtwMbO
         sV6LUwGSh50Wdrw+gwDHQZlv+kcSc7ItBhZHniAWtDmsdZck0/uTlXtq5T+a8BcsGRWa
         pwtg==
X-Forwarded-Encrypted: i=1; AJvYcCU4WUxFQYOsz/FBVFNI3ujeoBPFizMWGC37FdpIMeFMJhx7g+CElHLZ4cl8VGMrlGJUBWNpdo5kGESWc3k2af1w@lists.infradead.org
X-Gm-Message-State: AOJu0YzEHotlOYST7AAZPqWnDmjLVSMMy/2kDrjxrqY7sP+TpscZxzc9
	UNMo790NWWGOxf3q8+Yn8qEAzsNaOgWz7b0PCpstzT0toHDWZHbGnkMt
X-Gm-Gg: ASbGncvzht2ylwFNr35nC/FhqPxkxHcupkyojbH7MLaeg56t1keBr1+wVLy4IAtyr5W
	pnor00dfABJG5+7d7oGoV/bINS1wVHSxlb/0FSP5tiu5qFPtYkdy2l/CHhikGeU02ihR+5w6Yrq
	LhowPVw8Nl3Ba1wtQWrhE4FfDPzjB0Ugrz+g0VBexCRQucXbFqm0KLPkQ8O4nMCaADmbnlBawGX
	RMrRgSQcPyZAi2Og9Au2bFAhdvQY468VNxIBgGHxHRtKBxYWNG1PoSM0wv3BAg5dR0iFSA4zO41
	jUt/gFbmy8WXYWSsNQhQHS1BW6L6mh8ovBih6V/xJ9s5rffzAQliQVIeOah4W8AgdhMSi4q56GX
	1mU4AbonlLv7FwU5GjrPoZrIIKMgk82WjPUHGxDPInvih7xJK6dJN
X-Google-Smtp-Source: AGHT+IG1Lbyz/LuhSCMvFaFvWIQA+e+oeS+V5WfPI22yr5MxxdIQ2TC5LggKVWnkSIrVed1aQHOliw==
X-Received: by 2002:a7b:ca5a:0:b0:45d:e0cf:41c9 with SMTP id 5b1f17b1804b1-45f211f89d6mr50232345e9.22.1757798483764;
        Sat, 13 Sep 2025 14:21:23 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:22 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH RESEND 0/9] samsung,coreprimevelte DTS additions
Date: Sat, 13 Sep 2025 23:21:02 +0200
Message-Id: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=TYNRK4+bphtWM7te51Y2NO2PW29CFLfANZF+pOwh/qQ=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/jV+J233T/1YRr7LA/+q+zzuV2uNy35qlfiltS9f
 7PmHwmdjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZgIexPDXzGZg+FHP2t9rNgW
 nql9ZntQ4APjT2v3POL9smtm9o0HgUwMf2Wkwv6F2M472b7v/66Tv1cwKEc9YfYV6PBy/Faiyt6
 1kBUA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142125_763761_1516E917 
X-CRM114-Status: UNSURE (   8.09  )
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

This series adds some hardware support for the PXA1908 SoC and
samsung,coreprimevelte board which has accumulated before the initial
support series was merged.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (9):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 157 ++++++++++++++++-----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  46 ++++++
 2 files changed, 169 insertions(+), 34 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250902-pxa1908-dts-65d86a5d2d85

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


