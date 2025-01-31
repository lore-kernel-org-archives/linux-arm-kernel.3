Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A923C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujZdT65JgU6NvF/G9jRMjszw2mjGT5YQT3bs1UnrWcA=; b=YFd1EnUzTPUEMeJkEmu7c4zzSk
	lT8pU3bsVS+keVyRYAYC5riGMjY0tezpIRKorlsqg/Uazkg0qMq3DLwFXLJV/TXhlHJDzlSo1LICI
	bfcM6jaa7c/Xwcxko8l0M8/NL7fZ96NIoF+oykEbD4gqv/bNYQDBroBS1s96LJvu8dF4Df5Vnawys
	hMB4B0Ix545PVRE8tqF82LmYC8HXByszlJaMRjzoWHYEb1B7x/qM/impL14vi4LLS7M+8GzJmhffz
	Fi9R4zE8LoyW1it0O5I0PkXq7jWo2K4RguxoKKI8oH4ZOOjpR9Q0TWYEJvcy7jjRBNWngNrq1f0pg
	k7uRNsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdo1M-0000000AMtr-0qhl;
	Fri, 31 Jan 2025 10:13:08 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdo01-0000000AMqB-4969
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 10:11:47 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so3001285a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 02:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1738318304; x=1738923104; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujZdT65JgU6NvF/G9jRMjszw2mjGT5YQT3bs1UnrWcA=;
        b=ZoG2PRatU3th+CYMdYBTDnCFlS3MOpEMyhMjIUoyUuSE/nIFH6FCUaMQnOu5DoWdEe
         izh3SL3xyc3TXrD7TWmWnPWh6hZUFX9GYKPU4Xe/4qf+abhA10nOKATga49OKUyrA/tY
         z4YaQDMtQqZkBUZHHreXx6afRiXZpdW3dmOAAL/Z6Tbx2RmXr3XXCqYAqMFFBGSeM5t7
         N/SFNufZx86cFHHX2dBwM9dhnwDTCTaHJHmSHJ1BEVkvJt6+U+Npygsy26LePtIykT79
         AKGQ8PxsQ9nf4mmtpB/is9+e9m8sihFmiTfLDFYHmflToX7sxhE8frYI1c2bk+KoTP1q
         6+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738318304; x=1738923104;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujZdT65JgU6NvF/G9jRMjszw2mjGT5YQT3bs1UnrWcA=;
        b=dPCY9wANC4OEYvYe/Vzic63K0REkEpr91ZALilG5PzT8usQkMypfs3bdAsO+iJBDw1
         gnn77dqqthZiSMxLuZWXJnkwZVfEtjvZ8BZePKhQrS+VRs3XO35yCJAFicW7aNeNq7Lp
         VGeaqISD8vXCthYAMHVFK5Eq969XG+XNnDSN3o/x4JASLyH0ril+XFUPptpOcCSATaLx
         HX7izdjtxg/817blz80/MY2vOKlbdRRsZ3D3AM3iUipqn5kbxLgB1vTrVgFMi6I+hvVj
         hnz0p+jLqGxPfLuvaCWnuMAN8jgt5IxjT7jZnDlmZAvGmqwQiBDdXu51d+o0vjdpwa+R
         oG3w==
X-Gm-Message-State: AOJu0YxnNAQxl24JYyPBwEIi3bNYP80WUdaAKBXmVRYwgi3jH/G2LySn
	vyvgbzZdm+HQWvjiT1KWigcLW4Bz9/IW2TrJDEyCyDWPzz0K+PU4ixZq737n4w==
X-Gm-Gg: ASbGnctjMJc117Urf8LCV+TZqjvnVWGpd0yGKCBKprRZguexUqUj+4pBp4zEUN2/ehi
	RysQ5Wb0B8/Z8mkSR0J8RDGZezolnMJcajainbkADz9oHpwzWM37TjbF9G7TWo/oLleBuA2bR0h
	oGQQ1BNTVzV4e3a3lNtijuDnH92rfSZ9PU2tnStHmQyCqbyYq38Ej+wg87RDYzlvjaiwrUwZMqf
	tI6HOyEvPIkxe+TnRq8uZ80f7zDPz+97r3bbBALEzRMimSjzZrQDxTXEg35QfV8WSuYGpUfnTYW
	8kvyKRgkEgFKriHfBQdHVIQ=
X-Google-Smtp-Source: AGHT+IEfxj4SBp1Oe2MZX7KsD9D/+jkJVHcr5vCM3jpYYXxEkDvoWJB97EEeppveLHhHQDQ0D03Azw==
X-Received: by 2002:a17:90b:53c8:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f83abb34f2mr15086370a91.6.1738318304559;
        Fri, 31 Jan 2025 02:11:44 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd0fbasm5551977a91.16.2025.01.31.02.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 02:11:43 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 31 Jan 2025 15:41:33 +0530
Subject: [PATCH v3] arm64: defconfig: Enable gb_beagleplay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-defconfig-beagleplay-v3-1-f556b851ff96@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIANShnGcC/4XNQQ7CIBAF0Ks0rMXAUJS68h7GBZQpJWlKA4bYN
 L27tG5caFz+P/lvFpIwekzkUi0kYvbJh7EEcahI2+vRIfW2ZAIMJONwpha7Noydd9SgdgNOg55
 LWUspjBFKASnTKWLnnzt7u5fc+/QIcd6/ZL61f8DMKacA+sSYkii4uL6PJuhojyE6srEZPqnmB
 wWFklo1rKmFBfhCrev6AqTYWlIJAQAA
X-Change-ID: 20250127-defconfig-beagleplay-de4553bb3882
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
 jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
 Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=TOpTfUj4QcmOfbWajuCLJSzlivd9P5SjC2vU9aSgC5o=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnnKHbwZVB+mJgzK6b/fOc7tfoWTD5FhXBGeElc
 cH2iLgf9kGJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ5yh2wAKCRAFzvXHieVa
 dF12EACzMtsatvuCRyTm/BqzXFVGMr3+L/pvRJdX+Y/8xpDVYAO85+U0axJohgsCoW6dPvrEjbq
 1DfTD/x1JQvsyjL+vDY4yA24CmWhoOjMcmAcUAJj+6EftzVEUUp3lZWdcrd2ZRA/fLaq9an6lht
 NhMUQklLihSw1XsDdk//WxoTryyU5nQWtSQzVe6hb2IKhe7ezVlwAUUokjUZGs2W5uyhxnBlWjM
 FH9bolUONCnPr09OkIkCSG4Kv8jsqa2VHfzApU7OCQjqnGgzoNw79LRF/6z+jwVSr55h9os55y1
 c8AJTdtW8GtxmRqJpsL77r28/KdSZ7u9Sx9F1MxEUtzQnQdAOuZgNZQk/y3WPrIj+hVwnb4P5zd
 V/ii1CvKu1HkqHdy/A9VYRKJfrVk5cU4YIJhq9tsBZgwSRpE7Cv9k4aBNgL4Ah6enZO6h3MQDVB
 OQGmNIDqv+ufkeZ8UblY7iKOBWCNCN4Zhw2wx/pdHkpOwhMZoU2/e01yKWY/wccNuMZt0KaAWIZ
 5qwM1MzMwKj4i5/fz/hUPigYc7kHKRIFZdmg/8DMNcYOe46bKEIJA2/1oAf7d/Inj139T636ksf
 WVPFpNQ8BwVSuNtmdQtV3OLRKy8CCjdyRMpQirLc34uz8YogL5+0BbThc1pon4RLV6NW2baUSUs
 F46w0tC3lcECehg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_021146_253320_5B476778 
X-CRM114-Status: UNSURE (   9.77  )
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

Enable greybus driver used by TI K3 AM625 BeaglePlay.

The driver communicates with TI CC1352P7 co-processor which acts as
Greybus SVC. Additionally, it also provides firmware upload API support
for TI CC1352P7 over UART.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Enable greybus driver for TI CC1352P5 over UART used in TI K3 AM625
BeaglePlay [0].

[0]: https://elixir.bootlin.com/linux/v6.13/source/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
---
Changes in v3:
- s/Ti/TI
- K3/AM625 to K3 AM625
- Link to v2: https://lore.kernel.org/r/20250129-defconfig-beagleplay-v2-1-5a890943d223@beagleboard.org

Changes in v2:
- Add hardware name to commit message.
- Use savedefconfig option to update config.
- Link to v1: https://lore.kernel.org/r/20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..62309fd2482ab35e917aea2e63780c45a4347f43 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1270,6 +1270,8 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_GREYBUS=m
+CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=m

---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250127-defconfig-beagleplay-de4553bb3882

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>


