Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XVdGlC73dpgrqg3jmTOepym9CG4JSTdsRd09/R/VHZ8=; b=NzUapo3wvbabP5kNVHiSpw4wSE
	xW+jC0UlBvETCiP5H76ustnM5n1F7fNh/+6JcWg2kwPOGzQocrIm4rQtrQuTrsqKsKErFq49N1HkV
	MtFen0fhMQn+LHv+hSaLKl8937cSUQjHGO0FNOp2FCg5Y/rh2czjb0ajKk7AjvBv2yqA19DkJhEqC
	jU3qnmn53plkx/YblEtwE8OIIHymxIFSdqhWk1WBraXaXAtmoILrXN/XXLaynxUsIXLcBtRDfgLI9
	fO7A2NGL12ckLt09dMkPaM3Fc5CBpeomTocZLsyx/Xt5PDn0kyvmvdrJamstiGUYLZuI+nyh2SH38
	hlMflP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnph-00000001TOQ-0Y0N;
	Tue, 26 May 2026 09:12:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnpe-00000001TNn-3V8g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:12:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-44e5624c053so6177662f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779786733; x=1780391533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVdGlC73dpgrqg3jmTOepym9CG4JSTdsRd09/R/VHZ8=;
        b=HCZEhig2S18siCZ88yz4WEDwD64prKQhoxFbOlaY39wPEH3zUafSlF7kxj0QpMjrNM
         GWx5hQmeJwv3sBKB7sLmRyW9CkYtPIFFDh2YqkpJBMwMEOgjq+E6olFi3mcTckm5Zlss
         rN9ONinbhS6sPs7PlAvXi03/KAxrtoGfqbFEnAmT0qk0hsQmmlfPSmLykQvbOkFt2nUi
         +v6VYAzx7UI69ldFiQPADLXa6NLZg9gvp1NHlmCf6m7IT2tw0lX/2gfYNLU7BfHK4pdt
         3+WOeSY9QeM5qx+h8J2hnfhw8AH7405Yerm5LWxzhcbW0+9R3TuhlFcXn8sCSbZkWAMK
         wt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786733; x=1780391533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVdGlC73dpgrqg3jmTOepym9CG4JSTdsRd09/R/VHZ8=;
        b=riTiUYkGF00LOyiIFEFCrwpOslzI8DghpBHQSJHcwzo5N+rFLi53sJOgtsUjJBjF/6
         b/CKarQ2sN0BGNRofWvo2AHgTt8HYT3l+2I/zDCoOOq3fHDGwztc1+qh7fZ1l+pMz+UP
         IPn4ENY1kb+Xm67ObFV6QiIjN/zkShq46dHOSI+A0019ZIlNf+Shsrqqpu5mWwg5Vy/U
         nh5GbSxzbYsj1XPzkf2aG/T3Z9QndwAlhUh/F/0wrCC2JFS74JhPGlF9+1uoslXwRxC5
         33Ca6Zv5z+uLLqG6UDG9fD7qsdf4B+yNP+syXdEiooF1yud03asiPkMOyv5h5ANAk4tc
         lO1w==
X-Forwarded-Encrypted: i=1; AFNElJ/KIXjylzZaHlprK5CWy4wtwRLf4qTpEwzcwZrLiFwcYRlXa87pblFevSKHW5wtwujixplTwAiYvu0ycov1T0oh@lists.infradead.org
X-Gm-Message-State: AOJu0YxF/DuZ6gPLxqKGGyE8sHCkdcm4Mr3Ic7mGhi4OvKuowaNF/zkk
	P+eGOXt9QaQsFMMHvdURzbCz2gmWsus5w0xm3iM2d0JHK2Zm6fOT77nK82jPYZwd
X-Gm-Gg: Acq92OGm5OTzWR6kYTPu+IeUaoVqMAOBu1v/hrRF1fS4jIT3jEIwXxinqHjAZ9T12ki
	kneaXZ0yRTRmDxbJySC3VHSRGJjaLQ/5EBuSktEdWXTUkV9FDJpRhblZw0Njypd8UYlR5GHB84P
	06kKeU8KpWjUbtmzPSaGytlA4NCakrDYBnyVSyxcZTXxLiMiq6rTaCEtUlcamepqpvsmFvIU4sj
	Ieml9Gs7ZDBGncipVWVIGUCQHYJsTDvp8WMSjiF1fr4sV0RQNwBC64IepAv1QjSzy+dXRUxqtEB
	hWXATrIPteMh6SVx0rrfepbUR08B6uG2leRkztmL3f/vwW0yLzxhTyeE36cG97RQTP2gRhB7ImH
	geIOzyzqxEvQn3RK7xKF8ai3aGUZhr/c2xuTz+nmG04lPTTaoTABG/szdTpsjIgWO9hsSKMzfZA
	WfnDddrSn9YL6KpISzFWl86eo3zDTHlDUS2p3+CDImrZZsTcddeP9J+mLYCxpt0Ou6PBNeXG2qF
	RnARYyFuvZk5g==
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45eb3673319mr31634787f8f.4.1779786732366;
        Tue, 26 May 2026 02:12:12 -0700 (PDT)
Received: from localhost.localdomain ([90.173.102.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e363sm34749267f8f.28.2026.05.26.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:12:11 -0700 (PDT)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: stm32f7: fix timing computation ignoring i2c-analog-filter
Date: Tue, 26 May 2026 11:12:09 +0200
Message-Id: <20260526091210.20383-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_021214_936262_83CF33DD 
X-CRM114-Status: GOOD (  13.10  )
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

stm32f7_i2c_compute_timing() uses i2c_dev->analog_filter to pick
the analog filter delay, but i2c_dev->analog_filter is parsed from
the "i2c-analog-filter" DT property only after the compute_timing
loop in stm32f7_i2c_setup_timing(), so in practice the timing
calculations always ignore the analog filter. On an STM32MP1 board
with clock-frequency = <400000> and i2c-analog-filter set, measured
SCL frequency was ~382 kHz.

This also affects (widens) the computed SDADEL range. At high bus
clock speeds, this can select an SDADEL value that violates tVD;DAT
(data valid time).

Fix by parsing "i2c-analog-filter" before the compute_timing loop.

Fixes: 83c3408f7b9c ("i2c: stm32f7: support DT binding i2c-analog-filter")
Cc: stable@vger.kernel.org
Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 53d9df70ebe4..067af255bd22 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -694,6 +694,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
 		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
 
+	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
+						       "i2c-analog-filter");
+
 	do {
 		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
 						 &i2c_dev->timing);
@@ -715,9 +718,6 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		return ret;
 	}
 
-	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
-						       "i2c-analog-filter");
-
 	dev_dbg(i2c_dev->dev, "I2C Speed(%i), Clk Source(%i)\n",
 		setup->speed_freq, setup->clock_src);
 	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
-- 
2.25.1


