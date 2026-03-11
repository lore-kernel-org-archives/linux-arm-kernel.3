Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F011125854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bzi3XIcBxTFWoz5//DP6Xpv7izpmnkI/JfV1bUZEMJo=; b=eT7cr93mggVsOC15PUYx8Y3fuY
	JfHgGK8I57zU51Mg7LkkujR/ukRAyCNewKzFqwl609aWnQ8KabuihiL12Ot/pLylo9/dgFFETpiqV
	0zSVoIpFid+XljQQUFHjgvOXHY6mB8j7/S67GE6QkaIMQ5CNYaiTtT09SFAOJ41i4vIIVuwICyY6g
	CO45Pc8hC2VpqyO3zOkYTWFXk0nHDS0XBgFO49vfgdQExR7Aq+Pw8OthOPj3J7eiVjQ8RgLW+nMYd
	MIrx0OMJESpH9CNBMs+RWUfTWM1NQPZ8Odg2bds1CkZ/lYIENYSchP9DSaK/8YT783X0O7aBDY+Ul
	d4bo4xRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MIx-0000000BuWX-1mvt;
	Wed, 11 Mar 2026 16:21:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MIs-0000000BuTX-32Dy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:21:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso57619f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246057; x=1773850857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzi3XIcBxTFWoz5//DP6Xpv7izpmnkI/JfV1bUZEMJo=;
        b=oOmt9SE6MZYPVzWvHzvGhNYRhwxi6hjCFr5pm1RUtxhd4z1G9XpsE3YkQbo+KWFEvD
         Q/bqc8lzvd0X9LrIW3A9G9jKYfSfU+3tbWy8zLsepmDWdvXvyf3EoLZSEihQuwCK772Q
         x5Z2R+jx8n5I8e3fa/m7OC4bq7NAvip9HeUp+wn7JZ2FKvDSIeRKZ3mwTPakK8D1NQ34
         ID44QAEtCM9aKdtp9hXxFEiX0OJQ3QLyxWig8lOBs/l8iHkxgYaGF/k+esNfrbmt4GTZ
         Pjw+vGaPkHZwCwqfQkZ+wCaqLAl4mKCv3NGJ8jMT9iSX1okGNEs0sTy9iro1MfWOTAsS
         qxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246057; x=1773850857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bzi3XIcBxTFWoz5//DP6Xpv7izpmnkI/JfV1bUZEMJo=;
        b=xS92pL6e1tERIkPSfUY+tSt8PTmMrE2W79knIMCf315qGpFnhzJg+5g98r4TXBs0JG
         MAXHvPMwGiLZ2GCRI0xeTjixsDLE6sRtBLbcmq5RL6ZqbGukZgiB/v7hAtbsd/W7Qlpk
         F/XL/Gqj1Ar7P4lFh4gJK7QmS9NeP6LQX6Vh0FqOf0he3Pw6D3Bw/df4/k41oKH+IBJF
         AmFZQYxgeq4T9LLh8qg+Se5sL1x3POa5+3zKojfNI2OKR5wkv4gNP2pmXuFFzpRrzV0c
         1huskyutBYzGUFp6l8DjLlitW+QfeYBZvMG87bRPdMC51yUNnKiGzaof0WJBkxBqY1Vo
         ygfA==
X-Forwarded-Encrypted: i=1; AJvYcCW6fD2BOEyz4iZ+iTaC9pPzWU719jBXMOpRf4ci6IDeqfYwuXAR65QGJMJ7XPzrACOz5DExDwLuTP7dIlApEcaj@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJWYSEVWQdzl0DmLkhW8yC9gRHKPvhMlYBnAeMdeuB5HvQw44
	YxyvTlYav10VTCCc59oVoVHCEagOmf+MOta627vjP6YYHxqSq/yNzlq/56+ZyVOveGg=
X-Gm-Gg: ATEYQzy8MrJaW/ro8aA0/m2ZGShXtH76agKAxq5bd/YQ4xUBaYrtHLmZIfM0LDswRBA
	N5VMDqU7zZp012jck6TnB7K4cDjlqqCwfDXKqeMn2r+r2gMuc1/lbsEF/XyNH/ex6/oHTVM5ole
	V/a5/lYQKs/jnUAZ2q4YN6VTetKAXUXjgNSTf67eh/nM3w+MSILeivMihYPov1+R+G0vA9CsxiD
	7FQi+H0WuYaCEjUERiONkSxIta3eQbozW1ISU72e8a5POk5cwaYbdhphc1HG02FuMoOd4ibdPQw
	+xk2cghRAIbdd55fk4pCjnXL5NNaGaShI/4q7uHDaE2g8ZCUS65Q28kK4uUtRooB+h+YRX1x75c
	PPjsiNNW3TYTxxDWFQmcGJWhcB/hx5BcytEURKOs9KvlE6iPbRN1jqQal80IJZr5R8zXCi2Nynr
	xSAouqn8cSJksL+UodBVgkcwsMA9h9syqkJ4cF1SoODVMbhkj/aPrciPuCMtHHr+lgvLxL4o04V
	V3Zkw==
X-Received: by 2002:a05:6000:4201:b0:439:c78b:cbef with SMTP id ffacd0b85a97d-439f81f272cmr6543942f8f.25.1773246056849;
        Wed, 11 Mar 2026 09:20:56 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:20:56 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:44 +0400
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-1-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=alchark@flipper.net;
 h=from:subject:message-id; bh=KSJSNgctAT7J2Xo5Q/xEeeommaFbrWm35Z3cp49EY7E=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJa8jPnruenhO4qty3d46i/c4Za8Xlp1wd9Dwl9Cy
 9Ljxdee7JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqn21lZJiWauzu4HTcXMNidtGSk6x2WkHGOgHr3worfSmJMbtXe4bhr/iENRY
 LX+S1lX45u0SDvXlB4IVylspZEVNenpZ7EVJtxgMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092058_781473_BDEA3DBA 
X-CRM114-Status: UNSURE (   8.72  )
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

Hynetek Semiconductor Co., Ltd. focuses on intelligent energy control
technology, mainly for the intelligent fast charging and digital energy
fields.

Link: https://en.hynetek.com/
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 04b7d1aaaef1..f1e6b1d03839 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -745,6 +745,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynetek,.*":
+    description: Hynetek Semiconductor Co., Ltd.
   "^hynitron,.*":
     description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":

-- 
2.52.0


