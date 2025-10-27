Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B083CCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=; b=QIk1QXGNSQm9Vkw1kW3pBTtTTE
	80uQ8q+MbhW8VAdGYqz7QDIqDfjm1xOysG+UC2OG8dPnQ8tsBYAKQLrVC8R7AH9+1wTi8bF8J1209
	7zPXna8JQzGi37Z70Ekf1gW8QYWNwIuu+afuRNLZlmu0SOzBoocaUk2AVgqOz/g/ojQ+3IBVTID08
	uuEtMty1d7ZZHXDGwDzRI+jhcHLwv5yuNsK4n7+VhmRwhSu9GJ6tKdrEcXwiSTji243R2Gp2zG62Y
	84YjiazDME/0c1Q62W45rVaYSV5owfL570K4es6KM3ROXXeLy97frJJi8OQx7rTlrDsB6qHkXsRa0
	JpA8vqxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPP-0000000EFCg-2Oir;
	Mon, 27 Oct 2025 15:45:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPB-0000000EF64-0PGf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4711810948aso35215055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579907; x=1762184707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=;
        b=gGR3lh5BHv1oeEdyv7FBWvY90nekiZlgxDKKQHxTNIW4JrpqGdTNd5VTJ/fFxXi9m2
         oodwKd8dwuDxzGD8ORl535JZUQthftUoPlbzJJGjz84ik/lDp3qNDrPt1gcGIQYiiPUh
         HVu/PutI+uzuXPeGaeIEHhhw0aGOk9d9/6j219exOro0lqgKOLA8qql6TGll5s2vJaU0
         5JgCzTPo00lZ4mM37oeKjjh/zBdxh7FQEHWHeK3b5BXSQ5mSJmi1ni8DXyzEYEE1miGd
         Fo/i9aSEseUfzCVisbPY3URgqkCnWJjRLt9TyQCM1MvB1fPx/V/L9ehRTYpbRjtQCr9s
         6ZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579907; x=1762184707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBmZV3Vyg2J9mVCwrX0FEpMqEZn3TiFxaC6u7B4A1Dw=;
        b=hWUVFWeU758MWIq4Um8Du0jLDp532gBhhf0hLN6g20xNTCTqTJeY0UBHZ4G2o/ikRv
         u9GEnIXwVPAyTUj0wRZlMNq82hqzuB+D75mci+rcuSAqLYquHW+X5jZiWJjpcr0e+6n1
         lwwr6PJLrU765lnQjtnLekav8SxOupaoZ9ElinGppk6D+dmPjbokcHSYaA9mkxbSh6Po
         uy/GEm1JOF8WyPConsTHiX7Q1PQW1jU7Dsx3zsI919gQGOS6KXPwLw1EAXVz/FK06N2N
         muUAetkI1QA6GDuU2XmMWpm6KFw0plz1RONlznwpQquuSec8CMj0FixCAOnjBJ2Mva4E
         z5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU9kjZ24SxrpmQO82adnv9rPsbMsT130wAA3SztRuKyd1YD8tbdFCG6QVB/FVN71CPR7fmvOAZLFYTZ/lNWat24@lists.infradead.org
X-Gm-Message-State: AOJu0YzZPQ5y4A2SSLz+PXTrfYQ5EqP+IGHPezHVVpFjvQ9+ihjQvXgW
	7aUvHxhZGsySzQANaF+MAE+R73OX8jQRQt0J7IZj/ZY/b0W+91BwJbG354Vsc3751QY=
X-Gm-Gg: ASbGncso4BajbyB5/mHqsqI7A1JfHZVe0C2LBZE+aYSjHI1uM+NiJWGdTXX1rtTgW6l
	6ZtrdR1piG6RsbCmwkngbNyFrScjvm48rnfwlwh0dVsxx4gvgD+qmhZiLwO52CgpwQTHRkwSCcx
	wCnnXQy1Mmh2ezSTNGqAuFtZ2FXWJwt7WWInBQpBmdeZ5aRnsK1BEc8UBfBo3vxHhZ8+QUUCJnw
	Vaf5fdRhxXxjRkaMIWZUTm+cOZ8rwY1X+7nRbkJizULKRYwxfoPrTFub6+j2AQW3Zno2qNRrHc4
	dyMcjQIjjq3k6IY0wQe1JkQobSBiADcrL/82KFTT2onG2kXhMdvPZyZTMeRsHgziT0wyrCcjsfN
	Cw4o+MS8kupS5VY1PbwAWa06/92no2MFwfUuVl3YrJtKwHqQpLJG5T5/C/etmNBpZIEpQO3Xkq5
	46CO8x0w==
X-Google-Smtp-Source: AGHT+IECWyoE3V6eNyQ+Ni8Ig1arWy6NtdUV/t1u+09OLLf2glJJDnd/F8BXPUeWLSqyq4r2HXl0iw==
X-Received: by 2002:a05:600c:3b1c:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-47717e633acmr828955e9.36.1761579907219;
        Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:51 +0100
Subject: [PATCH v3 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-3-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
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
 bh=mTsLMd9S404QxSew2dDaObEMEcD+rURz88/DzU+Cui8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7EtUYevy0KNURGjAbWD3ayjri7A65CXIjY
 quz63CLKUGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 cpbXD/4rW59U3OyLKQKSjyyGQZLRkkV8UI/gn6+DtitezsllRAWiFL5xVrZxt57QxejnFAXi8D2
 ES0aolYvT57xfwVmbnieVs//EfL4Nq2ufUvnOJRYovEMS8cCxZ0FdtbrDV55ZFA2xHFcRUbpeGT
 +kcbYMDKWwu7pmV+biu9VEX6h1ZsuN6inepunZO6CYaGeUQOFyxJgf7ZY+nVWGvFsttL39Yai+d
 47t+qO1FSkpLxuakyURveQR1OsD0K1NInybeUmT5ApMUTKH2qNvpINsML4eTdL8yQN1zDL4mJjO
 zvN7lHjuKVJzogJnKQ078cHKC4hZ37wTHXuLwlHMG6URPvJbZj5MC8vvsU+tYoAnlNa5og0EUSZ
 R6gp5VYDQjzuERZnenBkmnx1WxQWAELVzPGpjwiUZ4J+UjIsk924po+ncs6LLXVCzuZx2uVzOEF
 y3FOVDZJSxf+vY7AR+vS8gkmZX/d1ZK8IqdnG5pOqB0wClGIfY1ZHo0Fqi+HqYfAvQocNAD6Bds
 m11j2pa6BtW2jcLPAxKE0gGZK397ZfEijSV/fIFP+LU609n2HiR5LiLaZc5BfPjYZgBAezW96l3
 0WyQf+SCZ6+fviTWrnZYwhzrLPFBH/4e4GWB1aWkoTnrXpLB9ivxHseQnnGvlI6MPkZ5n2/WLxJ
 /yj4Q1OMbOUwjFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084509_157074_E3D94FC8 
X-CRM114-Status: GOOD (  11.94  )
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
index b24134923fdff0de8b608c140dfb8ffaccd19303..ed799da4e4079b4da4b555dd119cce8c6591aa39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -740,7 +740,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
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


