Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E1CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cSizeuZT4cpU3hNiP/rAVuNIA7WcfkZd0/3ee9GQoRM=; b=EP9FSAvMyhybtI
	gZC1EnhTz8fQL39Vd5dM7913/BV4iuT4IASp6+cxCcNBhM5/okAr2+6xvRHBqkneypuVmVRMTand2
	Tx+wSmH/uEqoQ1gzMPn0QFTCWWumG7Ba7ZYhVm5YEns9QMGk/rqaPymKDd7wt8zrlPWcqANImzVk6
	0BmNLAvwdeWNOksolgIXkTJ7aXNEd/bkoGXdXusezMQNEKP5dkjOu1t2JzLaDnvLwaXSBN59wjjNO
	WCkaHNcuvhU4PvzxvecNz7soC87LPwJP3eTgfsFXshs3oykqY1U2AdUw5jt3bnkKNKBsnTRVGs5DI
	gqdicd+cNh2Dj235sYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofn-000000067Mu-451C;
	Fri, 31 Oct 2025 12:56:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofl-000000067LC-13IY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so13377085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915363; x=1762520163; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSizeuZT4cpU3hNiP/rAVuNIA7WcfkZd0/3ee9GQoRM=;
        b=QC3OeEsTH9Nkab78P1VxlImi3naBNohIxIfHM9HN4BrK/O/1x4vVgLKDJz0yEGUumf
         kHbmAczCLksAy4tGQRjV/Prv62Rev672pReNS0XJGMtAym4OpmG2FzIIC4mTGCDQWHSu
         fY1yjT9wMDlY4MBqK2yqb5lZ/1CGYti0Xd8qEoWx1Puj9BXdBiDepUpkLX9geN3JV8hK
         6og9PRf5GzHyuVPJd1zAbp0KdLRG2ss5G+3fuUxTYyABxQJLGGH0sfS09rwddyT0ekE9
         pUbSYE9c1EHwCRH2NRmBKB9R17RLrXOd2IuL3u/QeZkbFRoTQahTouiG46Ui5ANsY5pL
         az8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915363; x=1762520163;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSizeuZT4cpU3hNiP/rAVuNIA7WcfkZd0/3ee9GQoRM=;
        b=KCzP1oD3APkYEaN2wTkqXX91oNnd9gA5kZj6wSOQ2erfFQ5PcQNq3hZizvULRHWESq
         rVW49FiUPHUCsxXq0Z7QXoLha6jStS9LLOFXaCbs4ZNdfxb/JKsZquW3752ZgAJ0MI+o
         JXI+dOgAmcyuvrUzqxG0pcSJArI5gHTXgFIWUsJQikCi+JZJTMZYbkp/MRoo/6ofmiXL
         jhq9S97j793UyNXiHwS8gufAYkbtR6Q4HkQZNMKG9sqJCopTWX7XM5bHFD4+T+OZoYHO
         U76mVXdNlY3aZ2Ek312s/H+nIgYU43nI0uArSv7fmr1uxyushDJH9jdsvG7ltMdR/aum
         DK7A==
X-Forwarded-Encrypted: i=1; AJvYcCX9wHhrAXI871YXDXfTmgPQ1Sjdxp6dzkSRRReB0ObrvQpj7rcxoKQV11mHgSQND7BmBU1c+it274iQkMujGyQj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx4mxzF2IEZIQz42cZrRN9Hj3IIu+h7hh3i5mhoGwKggBNL7GT
	9NktKAtu3MmmnYj9W290cdQQfrmnBZkQDkIQVRxDlJZNttNpXtz64vT2w4C/QujHVnY=
X-Gm-Gg: ASbGncvW96qm3VOWuSLT4V7v9FupJGjtJEhnoTd08SkupvnXOSwRcUZxqdIQz7cdqwW
	v4b/yxdBH8z/cUWLQWauoqvBbUixQg+Cbh6s9D5GjmB0vw+J1fOFUlIlVSFaX50dTG2oJmbpGSO
	0uhyRUoKGQn4urjciJ8ec+I1jv5v6Te6wLBJ3IJR1KgkyO7QWDbaYVbKdRhV6uZHQb+cC505NXG
	J1L8CTxBlIZ82A4PnA1wCWiWk358AxWRF0B6+Rx+jxVkBSl3TzzPnVddfCxnWtdiPM/giNaDJVr
	GGix8dLCBDfG3C2/3YjIGzhcaIk4RlsLQUblCk/IRCAS8c9s7MmQ2b1pOeGaS1ap3USOCpJd3b9
	BwL7C72VpVuSMmK5bbgPvmlOLrAVk1xR7UhT5U9fLSxfP/1Wfh3L9zaNoYPvPK7qcsX3Oilalux
	BsPs1yfJK5KVikL6W/hwMSbwboBCvgCKKvUSQJ2V/DoffRYmYoNNMa85qw14lBVks=
X-Google-Smtp-Source: AGHT+IGWxYF93lfuQ/cW7BRqRYwYwuobMFF5l+VG4Chs/3oiv4JkKC1iwBzuzNb9Up1q3LYo95lusA==
X-Received: by 2002:a05:600c:a088:b0:477:19c2:9765 with SMTP id 5b1f17b1804b1-477307da91dmr31824705e9.4.1761915363285;
        Fri, 31 Oct 2025 05:56:03 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:02 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 00/11] soc: samsung: exynos-chipid: add gs101 support
Date: Fri, 31 Oct 2025 12:55:59 +0000
Message-Id: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+xBGkC/x3MQQqAIBBA0avIrBMcK5CuEi1ER52NiUIE4t2Tl
 m/xf4dGlanBITpUerjxnSdwEeCSzZEk+2nQSu+oVpSxoULpEhf2MnizeWtssDrATEqlwO+/O68
 xPkTejqdeAAAA
X-Change-ID: 20251031-gs101-chipid-fd84da8afa2f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=1738;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=5p1LeqfmmwFaeenEnSkkkwhzGqyUgPudlC9tgJJ0jsc=;
 b=d+BPbUINRjy4l2Ym1VjrE6HaCPsue9Nyr0tngMPGtDoQTB20S2dUN9hf3AEOOwYRtOSMPMOd5
 AEgHi19masrB06nuIdc/Jx2kl1prsuWCOWbdWaO8oCSDDIa9mNVnt+f
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055605_315217_43040D6B 
X-CRM114-Status: UNSURE (   8.82  )
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

The patch set has the typical dependency of the DT patch depending on
the bindings patch. Plus, the dt patch references labels from the
efuse node, thus it depends on the bindings and dt patch from:
https://lore.kernel.org/linux-samsung-soc/20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org/

GS101 reads the Product ID and the Chip ID from the OTP controller
registers. Add suppot for Google GS101 SoC info.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (11):
      dt-bindings: hwinfo: samsung,exynos-chipid: add google,gs101 compatible
      soc: samsung: exynos-chipid: use a local dev variable
      soc: samsung: exynos-chipid: use heap allocated driver data
      soc: samsung: exynos-chipid: refer to match->data as data
      soc: samsung: exynos-chipid: introduce match_data->get_chipid_info()
      soc: samsung: exynos-chipid: make asv_init opt-in
      soc: samsung: exynos-chipid: add support for google,gs101-chipid
      soc: samsung: exynos-chipid: prepend exynos_ to a method's name
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      arm64: dts: exynos: gs101: add the chipid node
      arm64: defconfig: enable Samsung Exynos chipid driver

 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |  51 ++++++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   6 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/soc/samsung/exynos-chipid.c                | 163 ++++++++++++++++-----
 4 files changed, 186 insertions(+), 35 deletions(-)
---
base-commit: 73f7017e663620a616171cc80d62504a624dc4de
change-id: 20251031-gs101-chipid-fd84da8afa2f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


