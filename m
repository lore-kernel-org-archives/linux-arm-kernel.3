Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E97EFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1qz1XwK5bgbF4fSDLGldtnnQW+IDkK0wUVzSv05ZMs8=; b=SjH8yIvLJExEyJ
	yzOax7D6Bb/unrJfuTUaq5KJZIEN0Vd5EYDqH2vxAOye4sgGULNbdwuaYy2E9TDAhcBjgDiUVdmhC
	UgLRd0a/mMw2i9WRtaSp7e7fgtfWeH9H8k3t/p6o3nq3avdYvfbZfPvvUaxKF19HMW2Ciarx3uOKn
	TO16Guu3MPUzBuSx5Mu2VhVP8SIZ3s4Y+Nt/nmqhRzm3RLAuXpKgnuXt9Tc2a5F42h3p5SdpgW4ww
	Ty5olp6d8f/u8H3O8OnrGM3SujQ4SNZYxgQ+7M9mXAOKiGQCtWc3bs56hnq3kps89zveB454dtH3B
	m4vYF9CKEqzQoO8rYLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sS-00000003f7U-1t90;
	Wed, 29 Apr 2026 13:22:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sP-00000003f6t-2XFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:22:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488b0046078so113453165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468971; x=1778073771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qz1XwK5bgbF4fSDLGldtnnQW+IDkK0wUVzSv05ZMs8=;
        b=i1JbYE0Bq3QxcgXm/mVkZ7HqA+hrZITCyK97aPZgTp9xE2tYbJBvBMq790zp9rj8W8
         0LfefPWBJ4UkCbC8mR/xGRedERVF4L6XA2FTrAIiyP6zfCcCRFzAY/ZTgwcUT61nKdzj
         J6/HMwvMGocCgiKf+Go/poSEnAHKMlvo8+LOYvZ+85sGlDoW8oq0NSvDfvYJNsR3Nm74
         Ep9IXTYeq6bNinWl9SeOcpVfhDHjodTobDfOv4Dlu1hAofvbQ6CseAKUQOQgXhqiL2bD
         dsKEowuLLrys3yndkgP5spzgWWuq13QCncYsOfd+Te3fhy/JsrWkdxopBQA4CaD88e14
         vGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468971; x=1778073771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qz1XwK5bgbF4fSDLGldtnnQW+IDkK0wUVzSv05ZMs8=;
        b=i9QQv0gqgIDPqU1cfvwI3FdhqpXZNfTu1tnWULRIeqV6S8J8WVM1eaNGD+Za4XpTPd
         m5emqVP//WxoA+WEqK1DSdCtLYlOz6Nt2tNZqZ9Ze97mfpGyiF82eN9wzkqC7B1seGzB
         2q3UCsz6ntdLrq6ndD2tiAZoaA67h1t0dPYEhnVKGKCPp3KOl592JQGm6W6tsJCvg7ds
         l9W+fqh0rbq15Oa9bb0CBDuk9KhFklKYwhhhZaaioIVbNAPU/kH/qKCawUH59JraN13N
         bk5JV1jR4FsTmaWqm/SHQGbGEGeIWorZO23JE3X7rhrf7eHr3ZDtZpVvDQ3KQ9i3MWya
         Hm0g==
X-Forwarded-Encrypted: i=1; AFNElJ/C4kRtGlbjItS0pXVXOr08fPd6WClNC6LiV84qSDukJoQL3mHih/uFg1VA1Tc8DDex+nt/F8hcMxPbPxJvI7r2@lists.infradead.org
X-Gm-Message-State: AOJu0YyrNSMsaOFdFjvHfOcYwejSlDgiPwnTBMypS3YsXdcvspyv/klB
	mdx4jyw56UPS3R6yLaPbgiSiRTJ7UblWgp5ZK6gfJOwMoWcIgbnssJgY5jt67Njdgoc=
X-Gm-Gg: AeBDiev5ormx+RYpMczPTwX8CkBtLLLmE5P4jul/S34GfVkPurBjeHqz4hIpcdxqmmY
	4Ft0sHhZJZOHDfu2DOLMRIKgfRNVhWqg1w7KGLZSNBFKT0/VyKACPfgxbts9cyhX9EERLoeiKoI
	qOB7PZgqopI0aY5tTZAyUEB5bkl00BOcmqiZppwPLAo/4ZN6mUQziZ4ZKnVZoAkq6hRTEtBiml2
	g5aoEXASJTflcJ3YvklyDYbQVBpjvWSR8KwRcO7wKul2zginF/eJxdbOcYyPvR+sxsXhlGYqcGE
	TCPGE5vJa3eXcaHT6dL+/Xlx+Qz/a68LwkiddC7Qn1Xc05c4q99GCBT9tmdNm9fOlT0gDVjXHTg
	QvRvIubF7bZ+G7p9ds6EMQBIGa1SOeXRGgY6AGqv7HuHifihSyGu92QEojG9tcz92RRYveabvTs
	AvXEyCrLp1xLrWdEm2VryFlu2pRlLcH34=
X-Received: by 2002:a05:600c:1382:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-48a77b232femr117816745e9.25.1777468971146;
        Wed, 29 Apr 2026 06:22:51 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b91cab9sm28569085e9.2.2026.04.29.06.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:49 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v4 0/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Wed, 29 Apr 2026 15:22:07 +0200
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8F8mkC/33NQW7CMBCF4asgrzuVZ5zGKSvugVjY46GMVDByI
 guEcvcaukEIZfm/xfduZpSiMpr16maKVB01n1p0HyvDh3D6EdDU2pCl3hJamPJZGcKxpwCaUyq
 QJqg94DfYFLxHsgMmbxpwLrLXywPf7lofdJxyuT6+Kt7Xf9ZZt8RWBAtIe/EUY2cTbWK4/mos8
 sn5aO5ypScNaVGjpjnP0bMI91/DG809a8Oi5prGHXbecSTH7kWb5/kPZXoAkGMBAAA=
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=msp@baylibre.com;
 h=from:subject:message-id; bh=+7e0qQOb7xNJ1GonbhJehRvqndv8OQWX5XWwzpXYTbA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbMz9GtdfHPNUnsnqmedka7px/412lxsP7fne/yuo9
 LT/z6zUUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABO59YyR4bz7z5WGL0peNnBb
 d0hELloR7ux82G77sk1FnR71+6JTfBgZfmgn9EsvnK+a8eLlLHmDCvNP3o+THKV6W3xk9+Qd2l3
 JAwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_062253_676637_FF21DC04 
X-CRM114-Status: GOOD (  13.90  )
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

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

---
Markus Schneider-Pargmann (TI) (4):
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 42 +++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 42 +++++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 4 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>


