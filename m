Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD237C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK9fnaIgOiHVaMHLlHb2Z36xFm4GtmFoascI593HeQY=; b=toOQIm8M7kWTq6YNzxk0M0leVs
	fCOIHAoJD8uoUvi5KPJQAOUXqOE8+DV8RYaJvgavpG8VWAf5yUY4iUu9a98JIu2FKJmkLOrZqVBAL
	h1WPFjWgdUuYrTfzyMtXUBU1YAIm2de6KKmg/V5H7/8nfs/X3+1NCIxJ0FmFWUtyKxbaQZqRnxjMZ
	n20BhsiLbXSZ0hENIxocpOIfUPZD9ZIyiKfvU+5dVmQFgqg/Uu5gFJOBM7agj+7PzZIAF/cGWAtb9
	XtpIysHdzVxAJ6pjczu/eiIk9TxX4/Hq1r/sPfzfE75La0k/VOcEpEJJga1kuBxKQnYcYEQv0LTye
	2bIAMrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA1c-0000000DZBU-3Q31;
	Wed, 13 Aug 2025 11:52:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9DY-0000000DSBR-2G4Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:29 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so1148909766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082827; x=1755687627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK9fnaIgOiHVaMHLlHb2Z36xFm4GtmFoascI593HeQY=;
        b=bXC98yovhmSWTTZDVO3NrwMZ5ZKsui/1TeGyJXuaFaeCeqjDh/z2jismcaLcEwEYE4
         dLholLLo8eWKEBw/C3f80n+HHqslz0VkmlCZga47ZYYvcx5MwuVCjgJ4sPtVetscTorI
         nb/U8pqPkPDb8o2RAPVqAOgVd1b8bexJw/kPPNj8Ewr+cXu0EAqNui28JrD4ifgqgEVS
         NJNbsuLq/WmTrPWiL3UbnV+A6OlVGslgjwW66HnJTkjtnAoFkdmk3ltWKL/P45ySZqQX
         WJqKSnahR87GLDzMh0MTEB3en8jvvFHnxJR+E/eri9V490dyJQSIf6edfelERoF441bB
         Dffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082827; x=1755687627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK9fnaIgOiHVaMHLlHb2Z36xFm4GtmFoascI593HeQY=;
        b=NIzKlJgxBMNbbfi1s+DIZa685Qz62medf+uS/qKSYz+E1Lj0E6m4ROUzDTqu+P0raw
         rTYzBC1Ec/8jOtOcpWE7lb8DSxwdr/5NmTxME0U3vpg7L53rDIOwh7Ch8RJTSLOUtkhY
         5me2qofjIawpaw3Lc4jZjTo2EjU36W7RsE43lc2NDMoJy/NPlRFU9htl4EJdG2XPptGn
         xrUG14+9bVyxZB8bPRe2T2LRNKJHEc3AtZYzAG443r0YweZnRROrnEDkYwSSOs6vpu1/
         wRcWSe8RBsobsaJpfE+Flttj1yYwIOl4FuB6pJZTCA7LBYHJbYyhLlCjoQA2BF99j3SD
         HUfA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+xT4l2ODFA4KIQYOTkSIQtNAMDn8Byg9qg0sdhtoypeEOFRTVC5iTDsKHtGY1onjrXfScA73ARUSngjKG4LE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9c+/psbPUUL1bDMQsfxhPjehgjH4aQ2RGDieRUsnppZf18gKJ
	dD18CodA5PXgERsvf/OgpmTGEq6GoOCzW++hezLoC+3iDMEJ4ro89O1L
X-Gm-Gg: ASbGnctl/z5LiQxa888o8Rd86rx+zioAwgDQmItRvB8fQ1k+N9sDh2LXBkuexTKW2jn
	f8228WL1rmUCW+4KFa6cWpOP9f5O+/xvupkHEPtPYQxQTj4tgCTM8uszjU1G/zETkhiUNT4A7kh
	t3c9MZ9TlOSahNanwGtOMQ/R60z941NMQHcr73kKhIBys8ENogR6mAJMpngNg8NLumG66QPYWzj
	/0MCrj96m0Sn2V15fIU7zuqVJn3kFMaMB/QyFR7lrY4pmfUA2x1IKul89kPxiFy8xPg5SuSdl/U
	KHqim1sGE4Ce1t0ALHqvTm+aEytKOrnQ+RFemLj6OGdNUvLRMMShpBS5SZZzKbzi+neM/R+tXmO
	dhEEC29txeRO2WNa6IAhSgyh4D5pHD34nN+iXPenqOe7RE/sHrWykZ1F6OVOl1d3X6clgXrKNt+
	gQUZmC
X-Google-Smtp-Source: AGHT+IH/KEBxleXHnkiaha4MyffAZdzDiHfCJLx8dSf0sSo/Y6BkJw1JF1jJKhUAy3iXEr68vACBWA==
X-Received: by 2002:a17:907:7e88:b0:ae0:a359:a95c with SMTP id a640c23a62f3a-afca4e01537mr234024766b.34.1755082826837;
        Wed, 13 Aug 2025 04:00:26 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:25 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 13 Aug 2025 13:00:10 +0200
Subject: [PATCH v6 4/9] clk: bcm: kona: Make kona_peri_clk_ops const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-kona-bus-clock-v6-4-f5a63d4920a4@gmail.com>
References: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
In-Reply-To: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=5pKdf5KCw8Ie22dGIIzf7YdaNoocUlU844YIpUij4cE=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA9H2aGlmoVVWD0I3gb7BPzQbctsPXNk0CKA
 8pGFdCnpw+JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPQAKCRCzu/ihE6BR
 aHo5D/4lOEhU9bOf5fmKB4f8JLms6icz4q6c6xI2X0IOnq6utt2EIFbxrRXPGiNnKFsUtJw1bbf
 mJU0vyVXtHk0vj16DAiBH23r60+8uIQFg9zj5do1L2TrLl3Ip326lEBYgsZeUi93oCjXZtl/zOA
 rLB/yesGJy5j5KUlbMLMfRZxP/sb+rzBX3WGGsyXaF2wBI9HI5ywPm0sF0R+HDJ2MAvSM38S0j4
 eD2exrGluBFHzkGVsvhMAhnyElXtuDWlZUawr16loThhSrlH0O+q+/g9plcNcAys96pdsnHrE1M
 tKeS0m9Yoo6rhyusHWuLrLC0CjdjluSG3YHMSDuH5kKaB/mVCXJ5P8fRQM/U9Bf0vVrOyKzZEGZ
 dhENqj4WINx28uj0r11fvBRirySzrvPj3w55JRDk/qhNiLcXn1aVg1fVUctzAP2/atYpXGwsVT6
 W4dzX1xLNPL9NL1Q2cpaLRePABowVJP0n/pgAd3QuQm1ZqNH4OAQMB2JBxyg49NmHT+IkP+IRIJ
 81LDYpigI12bGFB6HEktBp/b3xk8WMhROP9S/OxCOxV983ikMFitnpazT+zX6QI31AxM2+lqxP3
 JfG439ZrDe0aEbLaAgdSydUahJa0XhHZW2Mqsuppe2oXVTkmhXzlcXXxDRCUHg27bGScsd45KVH
 CiUieBDmsXBHukg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040028_596688_E8ECA11D 
X-CRM114-Status: GOOD (  15.03  )
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

Fix a warning raised by checkpatch about non-const clk_ops by making the
relevant struct const.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfcad51a91adc15f41405aeeb351c260..2641eaa4ca52c2724aa1dc9b4bdcbee5bcac95e4 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1154,7 +1154,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-struct clk_ops kona_peri_clk_ops = {
+const struct clk_ops kona_peri_clk_ops = {
 	.enable = kona_peri_clk_enable,
 	.disable = kona_peri_clk_disable,
 	.is_enabled = kona_peri_clk_is_enabled,
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index d7cae437333c83e05b2960ba8d51e718480e6155..7064ce316981ef8f32cf20cd4cf674e5f0169101 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.50.1


