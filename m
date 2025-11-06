Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168D0CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=; b=4iv5R/ukgqx7v+8sKMiK6tV3/O
	KTPrdrRL2/sjT7Cd0ji+Ior5uNy7NR3MPp/vhSOHquyJ0F/QATSgTRJNzE1tksHNn3Xj1+WDME1sF
	63nE32dfd7+GiQxoO9Viqw/6ADzq3+wCFo6//wNdD3kWghgIabkmTtQ1mpZszGcB3R4hQJyBav4kP
	c2sLY5KEX/8DpXSvma+xb+zRBpJxpJ6HVTnPdfiVeSKJHBLRdZbSnBhcORqRAg27SfEACWqDUvSus
	qWESZKj6YKKXdxzaay8z1umAIS/27i9bWf5uYYVI7nU+YPvbm691cQO+5PjTMvy4sxyKVyy3exUvD
	k0vuR6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9r2-0000000GQ7B-0EoN;
	Thu, 06 Nov 2025 23:57:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9qz-0000000GQ5u-2n4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 23:57:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so756575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 15:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473439; x=1763078239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=;
        b=W/fivJq6BTP0FIZLIVKPGzNFTAt2muFddhZ/SxiSv9KaBztT4JkmxMe01hnsKfsTl9
         VcSg0Pu05Sf9LexO1XzRDEPeburvmx3HSnj9jp22PbeFq6/3kyFBb7qqIW4V5t+VexaA
         DFeMy7idvXgpglUAdDgRalY8ZgasgyS7SZ3R5v6QQh8JxafGf3OhpmW8kaf6PLahyKdG
         Vqn+dw2eQYeXvwUZG+B1+OC/+nmZOfTIYb8Z1XRXQh71A9nBhYYlX1ZtId5kRA+5cRSB
         L/Q1HwLTnVjZeTLT3kXn9YnrVzAVfJtkVTKykxKRtuFfBhAk+wf2dDBTm3FISS4hCJ/K
         qK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473439; x=1763078239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=;
        b=kA7E+NMt/S0DLDu31eB8CpL8S11/ujaAiDFMgE/fqFBiUl63bF6AwlheQNJUjTmLRq
         Y7wTXErjUJV7PPZQxfjq+m3XkykXwgFgZXWUf1L+iO9u7UPE4X380hQ2WluodZ/2yBl5
         8sb4BB4jB4GEcB8OUh+t4IFSw2o/AcTx+t2Mn5r3LCWGUyGseUiHapVRvVjWrEps0F32
         pWl50AgHOMIXYWYJzJx4gLAQtt0LzWt3EybhzcOQOiL+JoLj6VNRPFZFbwbu47tzsFJ1
         BGpwTomIspv6Xw2DLrvgBTCPjZqB0TX680nksGrwnJ7ZdjcgavDF5aWhv5BEDnaTkiwH
         I0pg==
X-Forwarded-Encrypted: i=1; AJvYcCXsGoY4snET17OCVhwduqk0Q10zoJdTWfwPW+biUaGXPORd84G+ELpskmu7BjAV8tj3Nqw7fHg6zrqGqWFIJMEQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCc1ZhaZyxA+XUbIOJsB2v6kiUOg8GHNm/5rgxPe5Jlo0wvfzT
	tTQL2tilc+WilSKoAzWh8yRuac7suj+BxJIoOR+pomSCwLbvl3z/78kA
X-Gm-Gg: ASbGncu+drDYTwQuUcWum6Uwr9W59hJX/IJYc4UU8QJnD5eB48Uu6n/OPeWmFglVSHx
	4SvpCb8rteIkunml67RKZRqJsqf+LfkzAfHN4neDgwXVLkyfnZx7PEC5/VZZ7Wbw0JY8BoVgbhE
	6p2TYWM6H4zTRLAkuppSLV9f8LtRhbl/K52pkQxangRPbMvAJbStUkkUHE1JQo0bQdJovMiE+Lp
	2/sgiXp3HDnL8l95anzlY7MQiKcaJ8MvFTyZS2xs8yp9CuAY5NGdNch5uegE7yXSsoAhbeeO8GW
	0M4Ohb3r2CbpdpUttOU1Rn1s/fTilOzboxKdLIGPzBseOcP7qr6Z/fmQN1HBCo0LT60oCIyOukT
	MCpbNQNOsu+jR3aodVHlAyz9Yff3pqBElNaO0+dD690K3X0F9ASv2Zl+qWpTxbDATFH8NM5w9lK
	tUqKof+qJVYk5gzmIAwJWVMzedeRbmzA==
X-Google-Smtp-Source: AGHT+IEkxef+2RXJnVv1MDtMP+PBPYplJlT6jEtLbLvDmINhz/OHYKIorQbjuGU7uu0HwrhH5KQd7w==
X-Received: by 2002:a05:600c:1381:b0:475:dd9d:297b with SMTP id 5b1f17b1804b1-4776bcd2cd2mr7382915e9.33.1762473439445;
        Thu, 06 Nov 2025 15:57:19 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:18 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
Date: Fri,  7 Nov 2025 00:57:03 +0100
Message-ID: <20251106235713.1794668-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_155721_730278_E76C3F91 
X-CRM114-Status: GOOD (  11.08  )
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

This small series introduce support for Airoha AN7583 pinctrl
support.

Most of the changes are generalization and cleanup of the Airoha
pinctrl driver. These are needed as all the array in the inner
function were hardcoded to EN7581 and didn't reference stuff
from the priv groups.

Everything is changed to match_data and priv struct so
adding AN7583 is just a matter of adding the structs.

Also the schema is generalized where needed to address
for the small difference between AN7583 and EN7581.

Christian Marangi (5):
  pinctrl: airoha: generalize pins/group/function/confs handling
  pinctrl: airoha: convert PHY LED GPIO to macro
  pinctrl: airoha: convert PWM GPIO to macro
  dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
  pinctrl: airoha: add support for Airoha AN7583 PINs

 .../pinctrl/airoha,an7583-pinctrl.yaml        |  402 +++
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2523 +++++++++--------
 2 files changed, 1706 insertions(+), 1219 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml

-- 
2.51.0


