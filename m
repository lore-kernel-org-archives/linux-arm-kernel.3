Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF67D5B14E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3i8ZVoRAFRIcG39qTK0KnwlYJJ890TIXmlFUPFB081E=; b=t3M8tY+oeeq9nRh4QwXHRSfFah
	v/qV7JyH46j+84GE7bt2UAxEXTGFqpMg2QUGHUR5nZI/0REEmYUMKUL818dMKAxXmcVeVeavd3Yi3
	FyhcxFT2nJSyqG1eGdf3pusFaE5i6MXqtRMmv7CPVWX2BPgLOx12cVVUIXGgaJOoxgsJ/tfv1LwFA
	xFDPH0sEhNTgeHtTWjCkUu+RwwAFyzpHPguIw2k6F2GDTP3De4wy/6SOmxaYeIhM6lVx0/S3YpX7c
	yU3R7qMB2dqNXKj7FYKTpJedeSUKIpA6cgpY8zJc8FbJwoMVQk6z/uSRgQtEEX9Zne/Gy8DxooaRR
	AdLPSWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wpg-0000000CH1x-1rqx;
	Mon, 28 Oct 2024 20:59:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WJq-0000000C9WP-4BuE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B5075C56B0;
	Mon, 28 Oct 2024 20:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930BEC4CEE7;
	Mon, 28 Oct 2024 20:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147190;
	bh=zpkfrQGx3HEw4mQkvZcocv9aZkCal4I29KIfJ/D2G4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LVoJOtnls23eeaY/JLQ9u58NUppI2xcVbHSx61MBQzlwCA9cvWdyqkugW21ljicTp
	 RH5u8HEe/rDyPYo/EblJOSZGQxmDcocD5anHKnFeehpHn/l+6rF1IWo74bChmbKR0q
	 DqCV5Tc8g7HmrzOqxD7Yeca/EX7a6nSKiDGxV59PjA4RTVSjsPToxhFG/TM/80lHpI
	 z/vCkmAXAaEQAmKRT0MWEJjn4sOIu0v0mlXvqOfVsiT6DFYO/UKXv8/jY4bx9llwJv
	 gOmslRVjsSxFhoE5FH/zwk7FPnV8g1/fVnuLC7gCYNDe1Tkd0vqhLNF0W82w+IsRJC
	 H4GJjhKcNtPyA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:24:11 +0000
Subject: [PATCH 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-2024-dpisa-v1-2-a38d08b008a8@kernel.org>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
In-Reply-To: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zpkfrQGx3HEw4mQkvZcocv9aZkCal4I29KIfJ/D2G4s=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnT5z+lfj//cpOPFHn0oY+PzWrl9shuCzibou/z988Bh785k
 A/WVnYzGLAyMXAyyYoosa59lrEoPl9g6/9H8VzCDWJlApjBwcQrARLaHsv9TPs6/mcEkp99f6M+uH9
 v6ftW3zZa831Yfc7JL8EpTu1CmZO2ePOeLdQGLlj5cm8apEblc5tLXtddZHBUWBEg+uu6U2JLq4Oip
 sDBshbhOZrvR5z8Rd/OYVe3z1JIntqpIn4g4oXH1qJSfvZ713czJNULVEe9+TQpw4d1Ypif4Iasm78
 d3lluHUk4tdt7PYmY82bT0/69EJ+7omQGFHX+9zBpm/rzaN6Eks3z9ros9N4tktwT+ifWMelwvfWfh
 jKl8Hro+dXlMX3iNZy2/wvRTRE5mYq9WOONCtg0uoacjN0WJFn/1P87By/CO9XFLWNfxGnWF5080S7
 ZW7rBJMu9KNJWeFyXd2vY5KfYvAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132631_116703_7480987E 
X-CRM114-Status: UNSURE (   8.55  )
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

DDI0601 2024-09 defines several new feature flags in ID_AA64ISAR3_EL1,
update our description in sysreg to reflect these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 72d6ff1a9c7588dc4894ec6d673791fde108a857..c77343ff0901bbaee98eb76615dc7b81a563c4b0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1531,7 +1531,23 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64ISAR3_EL1	3	0	0	6	3
-Res0	63:16
+Res0	63:32
+UnsignedEnum	31:28	FPRCVT
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	27:24	LSUI
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	23:20	OCCMO
+	0b0000	NI
+	0b0010	IMP
+EndEnum
+UnsignedEnum	19:16	LSFE
+	0b0000	NI
+	0b0010	IMP
+EndEnum
 UnsignedEnum	15:12	PACM
 	0b0000	NI
 	0b0001	TRIVIAL_IMP

-- 
2.39.2


