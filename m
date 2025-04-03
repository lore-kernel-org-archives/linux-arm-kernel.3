Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3FC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=; b=bCOkRC5EX1iU6XfwX4lBr/+YC6
	yreO7e6We2IIxOKyrxSmQDChPiIIGtILgT1SaFQ+1NqOkQytT3pRAz3+Du+/ZjjtxXEZgqom0hP7f
	WvP+xevz2uIZF9zSouAZK/mMXddTaa881J/J1swqn2ELpqchbvz7egtD7uBIKN9LGFbC8FsPnzVws
	ClUCrrc2h5s2dooDxPg7Tu6PRpPQ+aAYnhJvtuVcHoXSGP/Htx0FZMFAqDb31itnw94Dw6UaNCibQ
	1FbciPOKPAWQEeKNNSh288VfdeaAgy7u6x7eBqyBDhuzsf4hnS33MQzpicvXi+98+tpraRjVucQFr
	hFwQ2iNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GkR-00000008NyI-2MqX;
	Thu, 03 Apr 2025 09:20:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPl-00000008Jjx-0IMW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac298c8fa50so107773266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670747; x=1744275547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=BgZZ2gaiB9GHo2Gq205xKUCqHtNUJTddpJrNN9QibrVBC4E2sJ9vLIX40tKRMvtV4h
         FxP3UDkSzLaxIM6u5GRA2d3mQ2jC/t6QE/vWvKw/Mgekyy8vwyG6VHwELKTNdmVH+eSd
         uaLlAkjqMGmdSRD+qNEWN1T9sWIwkhqHkJBzt9OCCv9h8f6gYqfuLVw5yZVMiasYDXtQ
         UjcIdVa9DPmQnUQD6GJBQUDaL9L3xBNfACH6TLZfx2tYZg7+UjOFy9EX+Yol/q/cIZXN
         6IdCGl/Z7EVJGeDGZxW0KXrAasdPvqZHQqKjtxloNilZwhjBQXWjNmT3vu50k2+jGEEY
         lrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670747; x=1744275547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=X0FzzVAHPH+zgT09MiMW/u9CbUSAQNMt500EkpzUKBpIX4tfHINgsiVnwMKvR3RAB9
         JxoR9SM/yU1i6hY++BbJu89Zz5MXEqKGParyN0PAPQ6H7kx18reFQNP/VX1HuVWML5ao
         ctXUdI85HEtvBtiyBb1FOlqBcV8PU0KSS9PoPpmp8gMUM/31edbb9OJTl1mL7lEzkk5d
         khBMBh96TU4B9CKKEFgBxj31tU0ZXNTYj0IWx3xHxFX43/1IjwBPIoMgpBpad5OOhG71
         /9E9U+DfLXfZDpIEeWFOPMxrBxW03PmepVu/otWE+TF3vX5Vih9/94LyLyVuYQUjecM+
         j2kA==
X-Forwarded-Encrypted: i=1; AJvYcCU0sRXv5ubWvYWBiyAYuRAcCZOgdZllnkCnnTTurVCrcOGfxgq8NEXWujSQfhEvxv1M/uQOrhkPnEvEIose9JgJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyCM1kn+A+DRErSmFp0RAHh0QZdgpXiUvJGaKq09i+nvJTt3WyM
	fhOLs2EzSlgTL5NCoLF1TMM3PS9BwncK6kZyrswO33qa05DC1GsmVqPf6AgkFao=
X-Gm-Gg: ASbGncuexZucw2voGA/jjxDNPBZHgSLQJeRa3hTlwqZF2SuACGIc+vpTpLyH3lSmUi3
	wCLrTSUU0ViX+lDtrNNz631Aciivyqa334qCyNTGfR/tLA7hZh4noatzKYfn7RAf4JpvfI5eNAk
	G32GxCGYvNAyDpHA+lgORW23kYHZ2W8gXavfS6O9cP7j4q4rgplspzGRum2JxcPVDoyKgO0CySq
	vakDTPbHfd5JehsoqljRhBGzki5IVuObpWt6dbr0t90KJ1cU3Wz7tdhrZKWbmlaP9bT4/1TE3/H
	0Y9ROBk/h99TQCjc30G8KC1OkKG1aO4WbD88kfVLWsVJv0QERDAXhb7FhTqteJEkn1Z1Cz84TcH
	IMLe/z/ewvh2NROOZz/DCxP/tWeEe
X-Google-Smtp-Source: AGHT+IFNqZWOvo+Tv4vLHdGRFBjU8kF7IIgTkc+Bnj5l7bb5nmPkogO1xX8561qZ+CITxdN2Zb0Cyg==
X-Received: by 2002:a17:907:9710:b0:ac2:cf0b:b806 with SMTP id a640c23a62f3a-ac7bc26ec1cmr186829666b.56.1743670747337;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:03 +0100
Subject: [PATCH v3 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015909_107934_A57B88F7 
X-CRM114-Status: GOOD (  11.66  )
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

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog


