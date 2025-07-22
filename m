Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749EFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o9zVmz81PD3EcDqh5BGdUlKDbC/PBBgCXACORglCMmc=; b=E5YuiSSQgUPcW7V3kzzN70gvVk
	1CxL1o0Gl/ADJW3idHrTZDH3zoY29pc+VTJr+Z4P6yW9CqopbFkgkTHTpWv4gT15MpkwLQRC3XVjo
	QDyVIwh6JHHMk325f1NIMD8lmwPilWr0Zr6mzBwEaNom1bi/1XN4KGZoXP1qa8mDuo53kNmYmU6Ok
	lrWlejIwyZ95But6RHeG2TvGa9ONL0sdbRYPBHogqUMShRj/4R1jtR9RSZZkrExLWiILfEqu/qoRb
	p6+m+BhRFAjC7Q/xnzXl/ZoiRBNLjJtZmv36UcRckhyyy4N4NYajozJGCCz9YGD1bPjcUqTzohzoT
	fCNv1rMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCvx-00000002XIa-3PPT;
	Tue, 22 Jul 2025 13:21:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueC2G-00000002QBC-2KVK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:23:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1066504366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187035; x=1753791835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9zVmz81PD3EcDqh5BGdUlKDbC/PBBgCXACORglCMmc=;
        b=SuKLI+FNlzJnfwt8lxkuM7a8hzPEMi+jrwUOyHEoRIp6dF63tHJH47xjPyxTvQLv0U
         2akurGsK4GUMDtID91Bh75z6dB2qrO2KchA+HBCBdATdr3XXxTuF2uF3dUpKSi0zmop+
         Rm/4iOpbNMvF0QhWkfb9UlAGO8h1OrbpinmsrccdqNky7YmXcK55daiHRtM/yfva5xlV
         J/ZNiooKwFACbJiPHqz8/Yj47jPULnN0AYgQ8Bkn9gakyar+MkpD5ayGfPbMcgxyZf0j
         Lrtz5NYcJdmOeJI6mVr7xrhPCQyw8s7HvKCvh927JU+NfyPqLMahkbtvgLSmUyNSfUyb
         nNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187035; x=1753791835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9zVmz81PD3EcDqh5BGdUlKDbC/PBBgCXACORglCMmc=;
        b=Q6T7zN7+GB5xRCt7kBlxbCz27FB1vWJQp/aP07RkCFghq2Olgu+Ppv8Qqcc0AYyjb7
         if4mxIgTNdZvRW6YQaj/OzwKWBDEf7Z1LWMWQpB7VTNQIDfpg3W/X44S2kTbcOqwx8ai
         CQnNuI3YXAeKrq0fKWI8chG7c2RSeJYr2AuPTWt63p61gf7NVNqFh4DMJV5bXIxO+/qC
         XLMgptX8GFVjwpV/fIGrlp9yx3AAgY7mInBAVkhAH/05SA65KSYjwRtWgl+KqhytHKsU
         mKzyZcO64UAsAMlBuCBMUVIt/aV3Iu2kCEg2HRrimPitXexqG4DIJt14cdHZju1mHzUT
         P16g==
X-Forwarded-Encrypted: i=1; AJvYcCVjZwPc79QESH3n4k3wxPYc01Mkkw7DlHHzixsHOT5uFPJug/Nk9WAFt7IZWpb9p+uhK/rWtq9fGOCA7gsuwVSH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj6eFxsCdK8b/Fg2CNJmuOwvx2K45ifdckSJDEyYRAvX1qExCR
	a6+OjSyxlssvzqgMvZMUJhoBDAEn5pE7XIZILDJHJQAD8VLJujieSoxq
X-Gm-Gg: ASbGncvCnfp4Z8sdfBL2snnV+AifIxT4+1oxsYa9wriwAD3FrpElkK92AP05Mz09YjV
	D9wXbZlHCqQzPg3KCOgNBk4t/iVR9/FpcuLZIFBPC71rP+KWXIcBqqB/IjHW68OhF0eNQT8TZZf
	SDNeWSh1IX8caVWf+yyE7X7YeDECQQNmyTq1U+NRR4zFd8lYvPRJIkEWSLC9IxwGwxFrVpYauUW
	mjE+7bM9gDE2behxGO+qJ/SIZpJnXO/u2CQI84/sAA5rUpCHpUowezwtwblQXZJe2eL9uKLys9S
	AJjrvo97d5feR3tEeqUamZ1wc8+ErFeSUM2rP9icQwrWGRsmHBdtwEIreqFDjyd5E1zUcWSp2lh
	vWy+K7S8U+vcj5W1EoDDwO7W0kRPQJRf015L2MIxvXR7asDmDs6JWehXer3Z9k6C2uOLRWWrSVg
	==
X-Google-Smtp-Source: AGHT+IGLZ9hBnU0L+6iBn36Ar8EtrC0DggxduYejAe7GRNOw5gatUgZQ863G8i/REynVRkoMww08NQ==
X-Received: by 2002:a17:906:c00f:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-ae9cde31899mr1973204166b.25.1753187034636;
        Tue, 22 Jul 2025 05:23:54 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a056sm861358466b.14.2025.07.22.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:23:54 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] arm64: dts: exynos2200: introduce serial busses, except spi
Date: Tue, 22 Jul 2025 15:23:46 +0300
Message-ID: <20250722122350.444019-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_052356_592872_9DF5D78C 
X-CRM114-Status: UNSURE (   9.03  )
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

Hey, folks!

Before anything, this patchset only has binding dependencies, without
which it will have undocumented compatibles. They are the following:

[1] - https://lore.kernel.org/all/20250722120859.443283-1-ivo.ivanov.ivanov1@gmail.com/
[2] - https://lore.kernel.org/all/20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com/
[3] - https://lore.kernel.org/all/20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com/

This patchset adds serial busses, implemented in usi, as well as serial_0
and serial_1 for exynos2200. It's missing spi, due to me having troubles
with reads when testing.

Best regards,
Ivaylo

Ivaylo Ivanov (4):
  arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
  arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
  arm64: dts: exynos2200: add serial_0/1 nodes
  arm64: dts: exynos2200: define all usi nodes

 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1391 ++++++++++++++++-
 2 files changed, 1390 insertions(+), 3 deletions(-)

-- 
2.43.0


