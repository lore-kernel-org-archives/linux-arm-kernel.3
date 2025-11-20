Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790D6CF64BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 05:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XK8FGpJd/gRCbg6Rh2iKRhUNOEC1c+hhwCoLg8DxBR0=; b=365Z3RZDTLZ6/5
	W+tcWCnZWT5FE1genL5M/z+w9ufm6/zOw6bWvblO3bC/SLsOOmaM3w4WrKoFZVhXaW1AbSVOx3kuP
	/4Jv0jLfWQPXh/VO1YKZvhQuB9L4g8jH+H6vAHip2h8CYKIuikDk9NAOz17Zgsk8nLqIeLomQiel0
	yiVfitbFOVuvDAbqOQeC6HBqnHhVE+AwW/1aJzqhL9MwNaU8XFTmE3UCLchI36vj2Yq0Ce5ZGieMJ
	+AAz/nbVxr3RSLoP2Sv8Lv0EiCTiIez9EZBtO5nYdOVJccHG7n7HJfl0g/jY1BZtzLYVoLVck/Ku7
	FB7hUZRLeM6glSjAA+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBL-00000006B3z-0K1l;
	Thu, 20 Nov 2025 05:26:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBE-00000006B30-443E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 05:26:10 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2955623e6faso6409575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763616364; x=1764221164; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XK8FGpJd/gRCbg6Rh2iKRhUNOEC1c+hhwCoLg8DxBR0=;
        b=NzXQ1CwVB2GAYAXz8kr7O2eVqxtCY4vFfBktTS2FrULNMz8u4LdFO61LVFjCmEGWKk
         RM9Y7e8XtVimWIsy+1Pm0vgyrAEU3kdSpG+mI1z7s28QfN3NyKpSbm+u0lZV+ZsEj7NQ
         wrPGUA6imdNi1x7GXMtqrRzbZVbk+MvZUhKoJB8YhaN/D5dRsDCnGlkHuQIIg4BOWVXY
         tIBhm3Es5rH3mrOrGe4NOLA9CfbaliXggMldc9sWSH9KNh6K9tCAJvGSLdxz0ZO8Y7ak
         0zPBzlyiO8/U54Dh5cI8YkqVnAHdYUD6V8rgEE9slt9t14GOFK+n3aSTANDtc9i1lJ+W
         dnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616364; x=1764221164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK8FGpJd/gRCbg6Rh2iKRhUNOEC1c+hhwCoLg8DxBR0=;
        b=wmFZo4iLm29qY+gIriWW5mjRgTDQLojaUEYCIV+DCZlX+M9vORpizR+VK2zl2so0uh
         U7JtmViNqF7+MALUSI7tEFO/q+9IEG2t/IF5d79je1VYlV8zTVrIV1r/hkSAXxlTqtG+
         mV95mpP/7ejkhHVHFDtWqIOE4UMJVwZfLgdCH18Iw9M4jWIM99Dk0HLFZVrn+tvqdC2+
         rDEgVMrrtD4kLDc1ARgJ3JGDjXLzCacIeydVDti+OgL/CBKW9t2LmmFaK36g6g+D+LVz
         /WjCfpTr4eenu52K0maX3MosaMUCxV6MhrKE0/pKv0LCwWuZr0YmXDv9F4msa766iFrP
         nD3w==
X-Forwarded-Encrypted: i=1; AJvYcCWit16aLPOqiG2XOxgSBf/gdiXNMHSsRBZvvp3f8U6XZjT6w+Vo57Vn2kMdTBMBurYC2oZsHipJVNsaLsEy/NbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKXvUw/DSnR6QAFEbDw90y3eoFREpjLZB9HZmsvbej268DQBgJ
	6vNRUUEQy0/88xCBhyFWeoOILb0fh9r0VFKhWeqePOcIHtD8m086lXKb3WiPdA==
X-Gm-Gg: ASbGncs2Ofsy2+rxl7DwTENODAQpzg0/GYv76W0iKQeRW1vSeAff4x1C/ti4TT7q7w6
	y3pOajFerpGJwdLdc41qY/PRuDlJ3w3Ae5gHNGv3Brc4YPcrQXi6riwTCMspjQFLMe35LtpFYME
	JggDsv1eizo6kdIhdQ5cRPOicGYql6BRqanqdXQG+3xJ7oCWkDN3/vt6WQ8WQxJbf2vPkU3LZR6
	X9U2+7fyZa+f8uDK+xsQnaLti7Mpduff6ndlzgGU2sAd0Bur8gxC1xCz0M0++bMQshr3tEFzDYh
	I3mBOfRDevZ1Md53r6rRsavERfvW09qCoVfhkvVs3PkuAgcxGxHCgRc6aH8171lnFgiFOSRv6vt
	yzpARwuwMNq3JULPaLE5JRk6ZrBzQBUY2XnS+RDsw3HfEnhCWbpDFwLgNstJLUkaddDvXvP2J2A
	jnJhpCRTiXjW3k79xbb0MMA+juK38lFIj+P9kPR4zAHwg73/EbIAc084ZJYh2iVlSR/rxUtoEY4
	OnbngBP7lWdLQb2ZvhT15VfcMIt0CtDBmHrxoB2bomq3dHar4KCtQw+jOpD/G0m4JeIPv+vvyPB
	bs+5Hamvw8flScv+0Ngmug==
X-Google-Smtp-Source: AGHT+IGRKwLmW5TfFmdLBz3341tnXeMORxmdp+rmYdWoNAuomZUITEEz1HkqEwACgq+mI0ayc0njuw==
X-Received: by 2002:a17:90b:2cc7:b0:340:b572:3b7f with SMTP id 98e67ed59e1d1-34727d56695mr2083615a91.20.1763616363754;
        Wed, 19 Nov 2025 21:26:03 -0800 (PST)
Received: from 2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net (2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net. [2001:b400:e301:38bf:be0d:b72c:6bec:2812])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1221342a91.9.2025.11.19.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:26:03 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v2 0/4] Revise Meta Yosemite5 devicetree
Date: Thu, 20 Nov 2025 13:25:57 +0800
Message-Id: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWmHmkC/3WMwQqDMBBEf0X23JRsMLb21P8oIjZZdaGakkioS
 P69ae6Fubxh5h0QyDMFuFUHeIoc2K0Z1KkCMw/rRIJtZlBSaUS8ij3qvgypt1sQqAglWdtq20A
 +vT2N/CnCR5d55rA5vxd/xF/7VxVRSDEa2zzrOqe93Kdl4NfZuAW6lNIX93AXBawAAAA=
X-Change-ID: 20251118-yv5_revise_dts-12e10edd95d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763616361; l=1026;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=lg2jHrJxqbgoMaTKC4ITbkxnQHARHKleNAEPRdJp6v8=;
 b=rT/dVjbKgo2z9etA2QhmDgpnEgtLGOvLpItmQ1ufeR+WHVaWVtYQ8Nhh4/3EdyX0Cnixja2eV
 Q8efbvA4UxrBtX8ICLtcXY24k4Wq4dmaXAAKyzBKi7nCsPs2xXp7q5c
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_212605_035050_63354D60 
X-CRM114-Status: UNSURE (   8.02  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Yosemite5.

Changes in v2:
- Add ipmb node for OCP debug card
- Link to v1: https://lore.kernel.org/r/20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com

Changes in v1:
- Increase i2c4/i2c12 bus speed to 400 kHz
- Update sensor configuration
- Rename sgpio P0_I3C_APML_ALERT_L

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Kevin Tung (4):
      ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12 bus speed to 400 kHz
      ARM: dts: aspeed: yosemite5: Update sensor configuration
      ARM: dts: aspeed: yosemite5: Rename sgpio P0_I3C_APML_ALERT_L
      ARM: dts: aspeed: yosemite5: Add ipmb node for OCP debug card

 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 25 +++++++++-------------
 1 file changed, 10 insertions(+), 15 deletions(-)
---
base-commit: 111e542d267576de402d0836603e1def2b60316b
change-id: 20251118-yv5_revise_dts-12e10edd95d6

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


