Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEA2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=; b=W1bZ/Y5vA3yiAd9KzRWUGaoj08
	cPozyi5HJGnZ8xhPyvnawh+Lu9vM5WWWbPEU1oTxCfi2k9+HUjxB7CJ2VGyPkaOlOQgjQmjESJvGd
	0j7LN+xKIjqw64xQKhTi8r4V3TN7lBb+xOxD3W5sTCOsgYqpGwdQ3AKkxDK9myN3QJWjsbwK/AlD5
	Su3652kSepLzxFToMdraX3HQIlARDqN5ojPptdX1bPhwZmuyOhzoQDF6S+YzciqVc+qrIQ9qRZu70
	tn03bXkQxotkSJkBCEOCUkLa3O2TWmKJIgECQ20VuX8WSs/TPpUWg4eM+2ld2qamkCbvVegZKA6qn
	9cLepQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PND-00000003Qw5-0UVx;
	Wed, 08 Oct 2025 08:18:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PNA-00000003Qsh-1CwK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso85650835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911486; x=1760516286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=uoTAmy1OeljuU9rQJ7uteQeaY5v7TbAcpOC0EaYX1IvGESX658klNm62gJFo+IkADy
         iqy5qUKnxGkL03wlxQI/4e6D/vAQApjG9kSvtS+6Vq1bLctYBbpyUllV467SfuEKO8Gj
         TDTN6iRK0ajdsOMjMY+2ArAKGOoswS1Xhxc/Ov0Rx8ep+nSPIs2QRI7pcfCnEz+XRZPf
         hrUcoI1Ugpx483vVqgtALUAiLnPp68bLjQxMR5UYB7tChVu/hQMoTRHRvq/jUiyq547C
         Po8sI5BUuOBbTK8f/o7+mZNS2YGmuTHlsQuvGsC1UtQ4P58cBK2wBdttHs18+JISZj3Z
         aU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911486; x=1760516286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=d4EuYknRUOIfbhAVgQZNZIO5AH0qFbCc0ys9Sno1GIcWqQPghbCK1CD6NXELpa+YeU
         wZqgCSD53eiDHyJvsYlT8dg8t9tyR+v6qiq6ToHVwe0Bo53BtGEaYq88BeLtY6Hbq64U
         Iy/wcQOHljqMB1zDTC/wqHqLSbsF0gTlH4quIjxO1uf/OihrHuxN7li+Etrws4nyQCui
         o0ElwXy9DiZUGn9byn5130H7wdSnAd8vyOGZgTD6BLsor8yDHMlOw2ViSrvFnAdilNZg
         yvjRslr9snT2C/36j9fB2JicXfvRJN7pqCxQjxON3MFWAI8utdpbsPg1qpTXZknlkOb0
         GDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrS3rx7jYupZDiOBALB8CSK5ek0meoM7MoSFvVH6ahX+iNj4FDmPlz28cP5dGQM7l0oesuESC2Nz3B8gF/OPrl@lists.infradead.org
X-Gm-Message-State: AOJu0YxpBtxzMXNakTe972z4wt/j9m5GMIqMz4JbgsFWDoS6XwRq7RfQ
	Em1+Z2kmnHYW7ABASFTcA3tr9RKvNWyKFLZ2uM+U3GA5B9uyCG/EWhJzFi6qp6QiKko=
X-Gm-Gg: ASbGncv8xQ3xmrliwnKOBrTlgc2T8I2egsCHKEAeM/Ze6gwmquCUcSRaNUaxeYyswRs
	W75uLIXpYJgn6gaarKEyPhAp+YW+AftaTmD8ame7TkIFjcjjH/9Dh8wxcMdg4V0TW6yZRZaN2sU
	gCqRmGARXBN/99ujADyKrfpPFTYcHEuct1HgmYgGuLWsEwVYPptY5K70B3ot/L/HRcZVXdXvWVL
	yMqm+updBAGd7KR/DnaFcUa1YysfXogS3wnKvYTDFcibnJU4leWMhfIM+XxD0VcSE6eVLZGGGT6
	6VdYF+iZasv/EzH2XtbvWLAKvmyYg99gQfPfy3ReuvqTv3gOc86JglErTHxzLQCJurymSViBAaL
	4hE2tjYsOV/eR8pT1ZRXukMGbyrnfdHP5e9pBaeUZtg==
X-Google-Smtp-Source: AGHT+IFZ5tJ74Dd8NfGzTg8vtMg1MllO17lT82vWUmOq7OQ3gG3+s+nr7vbc7H7XnZcyQC4U55uDjQ==
X-Received: by 2002:a05:6000:2c0b:b0:3ff:17ac:a347 with SMTP id ffacd0b85a97d-4266e7e11c4mr1568045f8f.27.1759911486432;
        Wed, 08 Oct 2025 01:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:50 +0200
Subject: [PATCH v2 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-3-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XKd4Dvzw0ejsOil4omJOz8oD8d0/SZudynnYpUwSWG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h415mstwMbaW7Pd+AMIYxCLrUK+0mL13oDMj
 r/Lo2JcBn6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 ci4REAC4/wE7bcatuqkHrpg5e3HuhnTcns6CmyWz3AKa2/Puse4ECBVjst/2AarVW1uwOO54Y6w
 xuvwBtYsD5n/fFvMElHuDacPLVuUEKxPAGIvSa2rWXpQDz+/rDz02E618QKXcAOPAGP/udYMrGK
 pCNGnGHYbu3973QNtraN9l/qkIWonjrYC8j2DiHWxlmTG438f/ioYqBN8lGWNgB0gABdFc6nB4K
 8FAfZzZr12R3W/hHlSLye5wRbw86R8tPGuVI8fdB3hHo/EGTEZyhZf5VkYFIm0cVX3Dw+dkR9+G
 fZBw7gcfpi92uN9QetmOSiiFRvD13QpiD26EtbO74cinB72NGOXb6s3Fdnf5mvTa2Hwn87zUQme
 ftGnM2R2IZc8rxslO14U4tNEc5/bKHT/QX2nxSPQ+xA7riXel0xBu2VlP+oh+15E2H3jZ00CyN5
 zoBVnoXTTolGtT/AceoBTEsobWOnHMtodoxIBuwLDCQEn+URSm4esLLlTotDkCuD2dQVdY7MN7a
 dcpeDWTx6OCqZH2PLrk/Vl/mLsD6thI+Bw5BNhNO1pjh0g1zbI9+3Q/VvgEn4BCyowO1iS+6k59
 hoi68TOJV25dXJ73L0Os+xXL+7hQZDY2h5VBG0zeiFi1hNfB7oaUgC0GBMacCHqeveAb31UxRtI
 6gA8uKzLorgErgQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011808_369335_FBD0ED53 
X-CRM114-Status: GOOD (  12.11  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index aa4715bc0b3e7ebb8534f6456c29991d2ab3f917..0381026af0fd8baaefa767f7e0ef33efe41b0aa4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -742,7 +742,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.48.1


