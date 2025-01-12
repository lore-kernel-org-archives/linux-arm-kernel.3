Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54606E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=; b=ELUljNbn9aN6y4Ri18AMkL/+Z1
	i28OxzxeNFwNMrdIlGPwEWESd85HZSoqfrYwwwAG/pPrHJvyHQPReBF2Iebvypx/sjGnj5zeUoGIi
	zkHMOjQZAGVNZY+safTnFqSohmxQ9rU0OyzeHXGyK+1KxdKVu2divl8aATRVQIx1h0nm4rlpNvF3L
	zWLxRapMEJ8ezEM3JDxWZtquoNBJ43JozmJR4xqgwWhn724QSAUiSxUF9y+W6k0XndefPutKd90V4
	477nSlzBEQ2z4o+9dUWHxMqARddA3xrEvXsTEwTANEFN0T10LJ1pP4F+pnh05lkz9eoNYvtZBMIk8
	AQu21Rew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyAH-00000002mdn-2ZtY;
	Sun, 12 Jan 2025 13:38:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy5T-00000002lcz-1LyM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:33:08 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so553427a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688786; x=1737293586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=;
        b=wb9+ykYdfRlkEs6qvnMJKWkm9lu+3rUX3bYj0qC6QDb3g/VrBv0ulWz+eOB1d7RvXC
         X2MVCvsXRaJiH44SiWf3vD9v1Qqc+/jsmdmA6vHuhbFtKpKN0w+el1oQdF8KL6s36+Ya
         VOsUUzWdAIGOKeu1o+YziiGhLt5k3BGtsb6TAwAk1VQSaiiv9Kdxn4ISt5vfbXMDckyA
         0baPOcx6qczZ6FrRM52motCfqvfN2q8QKUsyjF0j0Ep2NcGiEp6gN0P2gW7XV758yXQi
         LRsYuW+DBZSWnYuBy4FlGj0df90SKV9nSw1BsYNb1+GJ0HccL7suSa8VYEGrAIcsepFT
         OvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688786; x=1737293586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld8ZPAnxgwhvLaqsgPKYU5t+3ZDPQJl13t2skco9HCk=;
        b=eEKY2Drsc7fVjQ7R/tnH9R4YK5HZl+zhlFuWk//QJE4VB0LzjwVSXraVeu0fM8NQRd
         JaRnqjfTQycpotxeamMEhDQ0Uge59FEmHlG8SKugxvqhSZVtvprkWo5CiMZuGUMKlKku
         YShnaCrZIKwGtn1qAtsTjPwG9mQp5NswclRsxiP2C+48YSLcHFy9pO7PCvCh+yO9Xo7j
         KPyqk/z0i5QSM1chonIR2JoBpVyJgmu7gsQ3KNPvcZCNKRysSF6vzLry+qRGh+fQX+AO
         fSt2DXwaGa3Jw8yh+Eb1iDJiqzuhg9EDb0QZ/lVVL7R2NYmFreEV6wSgM6huJird5XiI
         RyRQ==
X-Gm-Message-State: AOJu0Yxv/sft7HsnPYiFU65AKQ27luWg0kO8Q1Bi8WNWQ/uMNlfMgcS1
	8KfF1C4RiGd9nBYwKCqdwlLE4Hz87XNTq08l9HGYDkka9yKAlyJ+GC2qlc55UbI=
X-Gm-Gg: ASbGncs/A1u2AFLKz6cWQ6A8tm8lUZ8PzCLf097X/oN1ohJFG690B+q8i//fiU9LUku
	E9/KJEf9gqOP8IqIOPKEyNoniph3VXEjYp0hVBaYQwWUuOtt2dzg08UpFOOm471HREsg2QE4psu
	afocJjLxPzCqzIDyEegQF76nD8MQXqKHGrwhzqyJU5TJ6ee+9Gvhsy8Htyw7fPYHIsnQi8/yqTh
	GP2b5RdAl/s8tzdU6GaHRIhKKfkberxZZllq2+Nw3f/7fiCs8/Rg2g4haFEZ8DrLwqZVJ91
X-Google-Smtp-Source: AGHT+IFHwHH4KKIrysGLvqwXWCgJxLn+t19M/gFmLmYbS8NY9BWAcFiBlWXc9XqfFSlrFDFKeUN0GA==
X-Received: by 2002:a05:6402:13c1:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5d972e65777mr5439603a12.6.1736688785817;
        Sun, 12 Jan 2025 05:33:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:45 +0100
Subject: [PATCH net-next 3/5] net: stmmac: imx: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-3-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BLKjHvMGwRWG32GZtZYj7md0qQ8nB6LVGjC0kEjtJ8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SDFkc9BxhB/j87J5OokfF6ZsmgjWIg1zax0
 EyCdFlFVjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgwAKCRDBN2bmhouD
 1x8AD/9Aau/f9uUdyr+OxKVQyIA5u+wnl31VUsMUYoZKktqRD/7R89XQcAZ4Ihv5P8LoYFUuGSk
 Ietj68aVH4LJP5HlzhkuI0R7ergp7NNod0odUeR15RVmyU5WQ9YSj5PvBGpfHdFPuefkEFt1kfw
 6FNRml6vfFv9oNkE/EcY+g5RtQoSyyAzH5P42KSjH5G56gOJaaeUOQzRP45DP89NXKhbwdOz+cV
 IoU4HZYVAU6EnU0frwulSeum1/Wg4j+Je/kk8DjnQqGSTYQJisj6bKHLettlVZ900rN9Kbfcqow
 a+1Xr5Ja4Lh/z7Av0ogch3QekPRI6lnIPkOX1TpY3BXstIKjyO1KQqVuNTO3qUzj7qlei8hNN0e
 kzDgRqCIU6AqAvU+T43YltB33DLbadSqmwoIYu6ezF7TxsYDGuMmqp9DMpPf0sZrlxHKBI4kkYi
 rX+2JHrdxNjwS8F9F1y2KD6jCrNdECHTMq8e9FY3rhyHN6HQE8kVCV+/JvnwQvxdDbtT8dnjQzX
 /7r7MIXSBoXplzcK1f0vBwLGGxL5mjR3/WmzgH5zpEQth7DJvvIj+FU1F2ZZlZ45Tr6t9pStmgb
 P02MIOsocH27LT2DgRYEF7Qv0xxUSKyva8FtwrioyZg7dKpYTmtz3UkJn7bGdPUxEGY1A5W2OKc
 ophfP6EMaGl2RVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053307_373568_3A2F0840 
X-CRM114-Status: GOOD (  10.67  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4ac7a78f4b14b95169787538b56dad7f7fe162d3..20d3a202bb8d16743ba4f31fa8ebf19a246e8236 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -302,15 +302,11 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 		 * is required by i.MX8MP, i.MX93.
 		 * is optinoal for i.MX8DXL.
 		 */
-		dwmac->intf_regmap = syscon_regmap_lookup_by_phandle(np, "intf_mode");
+		dwmac->intf_regmap =
+			syscon_regmap_lookup_by_phandle_args(np, "intf_mode", 1,
+							     &dwmac->intf_reg_off);
 		if (IS_ERR(dwmac->intf_regmap))
 			return PTR_ERR(dwmac->intf_regmap);
-
-		err = of_property_read_u32_index(np, "intf_mode", 1, &dwmac->intf_reg_off);
-		if (err) {
-			dev_err(dev, "Can't get intf mode reg offset (%d)\n", err);
-			return err;
-		}
 	}
 
 	return err;

-- 
2.43.0


