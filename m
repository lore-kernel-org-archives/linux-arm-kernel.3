Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D729C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=; b=bIMn3DJVpLJF7kFx9/bF6lFIcP
	rpqGwn8Or/xg2cAoEkZSgHgrRVwlqa3IRqBJ6uDtP7/dUDD35me3fH0tMpANBOgxmMueS52uUyuqr
	d9hp87tR+AdQZmobf9WB47wqYwUB6y8Gn5E140NxMdKGkBUu54CQhuY60jGLGKN7btugqI/FJElu2
	xXR0kUJ923o2/29OagttlYmpV00bo/UgUnFX8yQQqNM3lw6zZIibgSjVCdm08aHcBnPphV6z4NYUQ
	ny4em0p7qVNs2dwgqBsQzrGi3b7lSYmr7usXRN8UTFD0cw2XSefBzejYTIgPQWcMHrHNluQV8ut97
	wVU8fyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cs4-00000008ZM4-2tAy;
	Wed, 09 Apr 2025 21:22:08 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB4-00000008Sgd-3AYj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so216587a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231061; x=1744835861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=;
        b=sL9RYBqp9VWTe/w2osdMErE2hi/MiCuq7CDVAMNuh3opjn5EHjm+TipJroHKdcME9Y
         fQoPX76ewJJ8itaTBz+K3IqmnkGf70uhBmLZRKIxZ7Lf9j+KjvMawlNHdl0Z2/HJqhcq
         0kZx85byuvfGU3l9fKYKbG5Z/Uq1PgpfVfx1LDRNeGGYmtt2Rm2B3Mfa8smr2L0uLtIs
         zKind3Oe+nc0yhSlM5mVy2Z85RQnUB4RYmwJSmvIgzmnPf1djkRbIVb14lFq0Mh3CKRe
         WzkE8WTl1rNv/B/RW9wSPyDDULIl+eRs+cjRWu1AJqfbQXJF6eMbCIhKwKoZP2ey54B+
         0YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231061; x=1744835861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=;
        b=XnvdE8DBReoHncy7IGpjfSHyfW4Lo0XYjHARGEQIChw9O2y+oIFtrtDsmjl486dro1
         V6WB7vqRrlI0OdECKvZExC3kVOVCsdQ444zUG5VRyGlQ2j6+o771uhJFW2lGpNWm50Sd
         vo3r5+i/zXEffnl9MUbichkwYSA6RO8p7GbQeQfdpoiCAdfeY9yJ2X4EhgUeLNvSw+Jz
         9jpCUkBGW/8EnxOQN2vVnj1T2PJ1uGl9t/9r7WZgrDfE5NgE7t6QiPSsFdjqFxpne2fC
         7L/4JNZitC7hON1BPLf2Vupijmhp6NuSmei2Y3o+j/TJTZ1WjDxr1cRoxaPsokdFZvaX
         qZTA==
X-Forwarded-Encrypted: i=1; AJvYcCUdxCDY4oVjzOXi2gMAHdFWoqNBrJyTSWZyjF7zxQxX//SoddV9MR93wb2Y9DGNk8gKbUSV2AizTbqkGN4qFzrm@lists.infradead.org
X-Gm-Message-State: AOJu0YzRrrB4oMgaXBR9+FfUgmLs68JZ9LG9LJj7KicwakEIwDjgb3vm
	73NVqR4zjfRkRZEAP/SS71PjEmLJYVJCPLh5fYWVUnVsgvf+Zv//os0UzpXXbV4=
X-Gm-Gg: ASbGnct9hx+ICnoNYgKJCk+M3/2p7rElJUiV0QRWYUIGuikixFFPbucwB+FroMmL+3A
	2hTcA+FUaLs7yXHfqWdhqWtBIO50pKY8/red26aA/17q/C6x6fUTV6zBi1kD3Ja8FHXdns0Cx0K
	4h9ntQt8dyig0wZttXolAfokW0h2j0eqfIF4JxTzve13lh33khPWjQCQJX3mZutyKAY/TzyjpMt
	mRYOW8XI7TiPVUHe1apnQhwNtFvYrByEVf4PZX8InUP93z4Rn5SIxmGDgHFIhUFZiWjUjgHZ/WA
	+qCPJLU79vUfsHlglT9HE+rYakRKJYOoA4a6QAI3oq9PkBLM8iLXS8ijiVkD/4r3TIHaQrMqj9U
	1elN4CaBDC7GgOXE70j1TWEpuV3U=
X-Google-Smtp-Source: AGHT+IEBr6kEi5N0kVfrU69c2eMzZPUUcJ4BYVystn83LFyvx9TUXz1zdc7j3nGfMkGEvg+haxQNUQ==
X-Received: by 2002:a17:906:478d:b0:ac7:e36e:545a with SMTP id a640c23a62f3a-acabd3ba014mr6923966b.37.1744231061352;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:44 +0100
Subject: [PATCH v4 23/32] mfd: sec: Add myself as module author
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-23-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133742_794942_FCF279E1 
X-CRM114-Status: GOOD (  10.77  )
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

Add myself as module author, so people know whom to complain to about
after the recent updates.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- Lee:
  - don't sort module_author entries alphabetically
  - update commit message
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..42d55e70e34c8d7cd68cddaecc88017e259365b4 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -296,5 +296,6 @@ EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..3132b849b4bc445cf18b2ef362092137a9b618c9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -234,5 +234,6 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 module_i2c_driver(sec_pmic_i2c_driver);
 
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.604.gff1f9ca942-goog


