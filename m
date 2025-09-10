Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A40FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=; b=jWUG4616+bCYoRpg1mq9z3WdR3
	Jv0t4iTqBHiufJU7Yuhd4myDVfJkL1gEgZra4Bjwdb29NdM4ksikhhisLKhXPS4UlQJ1l9l9naIun
	v6cRb/qaYFOXjqUTLLUqZKFWzw40eepBfsl4mKysBB2UIYqs3YrbGlQDCOld7ekQH6A9kbfe5/xSv
	aRct2mCpaaOXNTUtmvBY6UPxSg31Z1jLlYnGnl/jD8xhZKVfsCvcKd4ek5f/aNSw469eGFJHDmPXb
	CTYilCPACbh6Oi0hI/yjXiO9yJCnCoV/1p6C8eJ40ux05tlRVvXDR2AFqpp/19h1rhV0dkRehSdX5
	WgMTbGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrz-0000000Cn9u-22n1;
	Wed, 10 Sep 2025 08:07:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrv-0000000Cn5K-1C25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:07:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45de6490e74so29435725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491673; x=1758096473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=fb9nhRo70eK5itlG1H93epHZWm86QTH2rOuvaxFnR4XZOVxJjmvQ8FWO1SMytd/upu
         zMTE5c4uS2j0T4PSwjtluBTd9Q5spzrnY1+nxIMAOIhHORiJLXd2Kmsit+T7BeTobnwU
         sm7sqa8CMdhhOtWIg0l9mZCdLuF01c4aVp9hFn2yDfbKSMO2XtmWQ97/GEpXKCpJlDmu
         NA3wM1m2M/GjRxRmnisVrSLRj5E9NaYjcze1R9QpF8fB0c9+rWXRTDdYcp1HP19OaC27
         Ocjn93Uhg0gPd0Vv+h+llSYIFo/U3TBjKjSfKSncM84jyT0Va/j87cGrwXGRRYByLTDI
         ymxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491673; x=1758096473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=FE6zzV8RjIUx1sNW+8V/hRT1WHvFWX0zgH6+rpQaBrzCoClO2TIhHXO/f8j4sZtZGu
         d1QhQzj+Afy3tSozB8tGVYav3DtNz0Q1X3X44qrFBmUckvdgTVKYEdymVX1nLY5Hrnmo
         TBZ8XKB4earwYN3UlaFPRBnRnbS/EPJ+3lxqSimWM0boLL2fpQKuY+PJdRsFGEPD60YE
         WNJFrSe7klyfpOBzBoYPcdr9PrkUo9rUBshjo3zkecOhXvm2urWmXi4s8s9GJvqVWNaG
         UOTzycLeBLHeTZSLKEjTbrzJ9fQ9Y5KCwttj1GJcBrPv+ov5gWau8KBED76B0X4MarRI
         vC6A==
X-Forwarded-Encrypted: i=1; AJvYcCWDqJDHLz5wiMwAfRwwYRR4X9h8jjMie4iYv6lEzBa3vHi+RNi+DH1kFiu+Vs3JiDs4I2H2Fww0AmgRDJ5Xd+Ai@lists.infradead.org
X-Gm-Message-State: AOJu0YwiE3U+gx2tQDg7dVew5kfuOXcNFALffmN/memCBad0rHwtcprO
	k4r8TxnVUs9X/B62fb7IDARoSmX42tTHgI3wyGDR5vaevJR558C9pfqe2ao2i6I0z00=
X-Gm-Gg: ASbGnctiM03GFIjSMUmladwVKK58ZC8FXUndDme4jMqAgDTvc2bOPQwxQPIt+hcWn64
	snRN5umJGXv0LD8E2hfgrk6ffGyaEnXrL+EsE6BMtz5zN5UVAond1Waj67YOsBMkJCEcWlMk3Q3
	EcR0XN3kPlfR3Kh+vmxLhvwpyzofroq0WcxSLGNqF3VYmCuzohTqcNEI5p+7akU+9dwDDNYJeJ3
	KcylOZkq7nGBP3NlfqhAnBUD70tsNQIANFWO50cV+ZYVZi/MBISH62tYNWjdUkZiaPJFWVI1YnO
	dhFsko+1f2rfXJd3XRomi6JpeZ9H3NMxxGzRh5eExTH/m4mewLF7MBDh8Xv2QrlkHETpyRKSQOI
	Qrf2RIG4hXWhj32nYfOdvPQGV0dUS
X-Google-Smtp-Source: AGHT+IFjyHooIgPzsIu5mjEBNXpXbM4EqzCxFwgK0R45SY2NiW1XrpvBRtE5XdvWfXqw4HoOsFUisQ==
X-Received: by 2002:a05:600c:6305:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45ddded7652mr141100805e9.24.1757491673453;
        Wed, 10 Sep 2025 01:07:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:41 +0200
Subject: [PATCH 4/9] net: stmmac: qcom-ethqos: improve typing in devres
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-4-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNFd6+XtHbiUlr0CBiyUr3sDo3TcopvUbxA
 Cez11/GZEiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 crSCD/sHgzl01Xm7vNRAaVRSRvpCpLopzb9hsEChofm4FjfDYUIcvTtJaJuDjU3XhHdNDwZV9Zu
 Jvj61hgts5CXRzx2EblTpQ/3DuiqYeDUlYoRNrKZ+bFnX5AXAVq/TA2zOzyXsWrNbUAaV1gNLOz
 VTz+PAVZGKpiWFDBpYusQE8juIR6bh0tEB17WWbbhZV6l0uK2fFCvllZG1nNk3SqJ5qG36efTPj
 /6VjOG1kimbc6GRwk5dLbYporMJimuedb5ycfMKxPqv+u3sJ1GTEbnxQDx9BxF/u562rsqfxazv
 mXGxtvtw56tQ3NaUCvLlWl5uxCMVhqV+jt0c8yiUxhssWPP6jK9r06eAybsTAVxChagDzakxs01
 n65RPiOgqoEuSqlYQpchL/l6Vjst4EKT/9xb/qi3pqlJTpBqcSyxiri6drcKDGaxihhe8w8gmMs
 sYLzxlL/oqpOYFfhL0aeFEA1WTGBYIeYQwsezafFr0CpNawRbrT5V8AuBRhSVZkNelEuFmYE9SI
 oAXG5zUxUzYb6LOW9qQ/LhFF6/plZCYbBsZP4cWXfzas3rXBaTecTfEcRctYXDXFmc596Gy3CTw
 eDYk7Xqxz1uDVEZOr5HoOdY/3M6E7CBtmpvBdIIMuVmWW43k8aLvjHK8ZWqdpWkIQ7ijqwOkMFM
 DCJTB/f1x5kcYUw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010755_350274_F47B20DB 
X-CRM114-Status: GOOD (  12.21  )
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


