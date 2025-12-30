Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42752E94108
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 01:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ssd4BciXQz+Gn/vBf6xCjurqrI43qxNxgTkSD8uqSk=; b=18UsQL+236lkw0p1ySBSYcWDds
	1LhBsV+pKKFWK0KvdEcUAnhJmyWgibwSpaQKq7+PB15n/XEmWdelL6MNlHWQmmU7JJA+xFqPUnDAz
	TTvp5Bo11oFhq/kMfIa2bfe5EWn+24nol3oWcHXGHsWpvHteXd3UGiQXqI4UA82wP9a1Qpw3G02Mk
	FJnq1lrtDwuzOkljwqIjmsndIn6Bz7YLE1ISsjrzuh2J+Fk8oq53GFM3pdk57FLMWxOZiG+ugHLYn
	LHGjvfwRbD75o+Vogu2h5ofYjSS/gLiF4b3MMLJWhYnebiAH4QaRHyc96T7/RQYtjj7ZhAL4vxLS5
	UjnhChRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOjY-00000004Gqd-3ORo;
	Tue, 30 Dec 2025 01:41:12 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaOjV-00000004Gpc-3wEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 01:41:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dgG5F1dYTz9tk9;
	Tue, 30 Dec 2025 02:41:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767058865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ssd4BciXQz+Gn/vBf6xCjurqrI43qxNxgTkSD8uqSk=;
	b=jW7ESLbdu/qmz3y8KLDmHascdwS/ghDG4YmiLmZSbD3SoNmpCsVtkIl/C07UNxgX7miLUu
	jt7z055ID4XK47sPptIDmgelRaB0FQN+x+4HwDlesvR1xhBJY9hVep/hFPbatwG1XbEsne
	nmcqCDOawTngP+Esr3STi9bgtpm6wjnwNWow3iYfP/s0G7I5IARhnsefexxLrIWLdmH4aE
	u7K6dK2zDy31SGMJokp0Poq6mShpNY6NOKv93C1mbSkshIJHoXAcB/SY+SwCMB1C8afxET
	RgTQOffXOLMyTUQ6wrQbWNBnNp4Csnu+EdMZRctFLauDjd9CrR1mfTZumcLu+g==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767058863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ssd4BciXQz+Gn/vBf6xCjurqrI43qxNxgTkSD8uqSk=;
	b=Q78Zf77n5wwRLa3iID7PPgeDCHC1zxeDioXek93c+azWJFLA1BWtSs4fhNfsw3IobWtVM6
	WUxf0CdpKZz/P9LaKlBo6+ThpMc52WEo4w5C1xj6J7pUEN0Ccm3NEv3SltHGhKKId2DgMS
	Kjnbpei5RZ1f6qcMr483NzgWGxMy1+jg+osAFESdy/QtRzoTLz4p+WHTZQnfWHkYoDc7G3
	OtwjqlYXtQiEQSpyhCxT2WJh11Sb22EjEZOxg1JV6KG3x93tbvQ5cALJHc4t2/t313orNM
	ZepGBlqyyEIwp6pJ+BVnCJOTSXn5ypG/7Ka37RMwSlLgExO7VF3GYSY2r8FYcw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Huewe <peterhuewe@gmx.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: tpm: Add st,st33tphf2ei2c
Date: Tue, 30 Dec 2025 02:40:34 +0100
Message-ID: <20251230014047.149677-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: f6mz559iybyxjt7ykoyogncmr9zmeqit
X-MBO-RS-ID: dac313bfe24767e9b80
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_174110_143010_D3FD1C03 
X-CRM114-Status: GOOD (  10.22  )
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

Add the ST chip st33tphf2ei2c to the supported compatible strings of the
TPM TIS I2C schema. The chip is compliant with the TCG PC Client TPM
Profile specification.

For reference, a databrief is available at:
https://www.st.com/resource/en/data_brief/st33tphf2ei2c.pdf

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Huewe <peterhuewe@gmx.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-integrity@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: - Rebase on current next, update email address
    - Add AB from Krzysztof
---
 Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml b/Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml
index af7720dc4a12c..fdd7fd874e01e 100644
--- a/Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml
+++ b/Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml
@@ -33,6 +33,7 @@ properties:
               - infineon,slb9673
               - nuvoton,npct75x
               - st,st33ktpm2xi2c
+              - st,st33tphf2ei2c
           - const: tcg,tpm-tis-i2c
 
       - description: TPM 1.2 and 2.0 chips with vendor-specific I²C interface
-- 
2.51.0


