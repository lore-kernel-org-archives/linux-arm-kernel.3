Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12F11125875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=; b=YuDn0AVXyglS5Vhn5l+emF3j/E
	8SYIYkAv5mfSr7Xw+zmxIs2MwfCXgAvKswvCO/EodNX/B3RS6d8L+o3ypEurzWtpxOEXnbHdm0OUL
	eWzMft7C35VHgmhNfjS5/uXunQYmS5AmzKLlRyimc1BWi3mtMOg7uvdFafgRb3mPvLmwXfPuro5UF
	79E5qFmXDMfHtZ7oDbbaLDkHXQ4P5uF1uY1i24/qxWUl4ZN8ouES605k/liRQn7cEgupQB813fkBc
	Td0KhhT5rWY7mMpoDDNnn+iNLEP2aTWtsc3mzRu+PUrVWw1OntCPHazd15rE6/ztFB6Wz1lLXwv6u
	JGPSvwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PO4-0000000CMnO-3ZGq;
	Wed, 11 Mar 2026 19:38:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PO3-0000000CMmD-0RmE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:38:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48529c325f0so1641775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257909; x=1773862709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=;
        b=jCnPzfkfG38ftEoThRgoLHVPMDM+qQSEPjmIOfob80vTdBjXtAOn+rhCGxSgX2x5/S
         lZd8Qd8509kj8UZPxDTalAvDaV1GSUsWGXExZnn9MlQUbSy3w/y5j+BGOU9XHW1sxq9f
         pISlBNYlamMc9cQJbR5tu2v0u+JYxaducb9GSKZMAAln7QVm9aZuzWrnO4SL6DD7lOT0
         7JSGx+0alBZWbyJqbh425JWmNkwwDSuyCppqIL93N+WO/UNeH7oGQzxyjVBxNUEWJSmq
         YkCp0onQSlmSdDx/ozKxwlCjMqPH1MrXrUyBEOwui/fcKQ8iXaXB+BCHRoagUTZ0jfnE
         iQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257909; x=1773862709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=;
        b=HlD/WBjNbWH0GeMyeVPCHhNHp2WietlpTaTvRJZiHupM3CCsp8oNoUKPdX2K9GyxB9
         0wwyb7vPPsu34I4/doP3AhF82FmXF6nHp+Q7vot0GU3Qb6nRMxnpj1/+tijboQ2KySUl
         fjJk/w9UnGfoa7/Puxu4NQJ1uOUAr2rTkQOJSe9f9POfOkJzAcF7XqB2bkHvoSqRkVO4
         a8TM52UgVIDcdJHJlez23Zi8ukKxow0iJoS/RTxCP36+6e980Yosjj5uHqBD1soRldDU
         J62dRruo6iYk9mVUJ9PYiJSOOz1oxzA7RW/EKxdCtj3CUi1eUD+K7hfEoi8adlLRkoqm
         EGcg==
X-Forwarded-Encrypted: i=1; AJvYcCUgjjaP4OOjSqVa9a2nY/jTgV5ULedTQPeDSVh9Qccil0uCi9zGrfMN7kOvTDVf4xQtI7yOLziV6pSMXmrlvZ88@lists.infradead.org
X-Gm-Message-State: AOJu0YxehWdBRNadXjgPv8GnLZv163NuoJnntX6TwCt+sIo/UH9im3s0
	egBqU4c5gbEN3x5Wj6AnEstfRfx6XMUQ7yhQgqw5fERJm/r+ORUX7AuuEjwHDKCCW4M=
X-Gm-Gg: ATEYQzxHRJs7slUZzSljNQ7Wa96RXN8ow/k8uJjg3mWfXNsLsTUXrvpgtP7SpKk892C
	W+2f97iK1F98kNWneQMOGngGhpNYpjrMvrv/2d9ecLCP3MR/xTQ15ykVUZy1K2ZxTdpXxfnxoSN
	/WyFQzwL0SzSj89xGHiWaDzQoRiA2bub6j02s+Me4qYq8wIqcJTD+j87LEhskEhW9hMD79dE6NC
	/jT5GFuIJmiX3M6ZXl72cHH2O8kqtR5guhHB1ixS4mjzwi6yuDcgL8Fs73ZDiGpAIxSRV6GfHYa
	uvbwuvzyxXL3z/k1oPHTtqyRbJir73epn60kEktfZzF54ATup4J03HGQInVguDANlqDuT0wY7go
	qVleKemK232W8Lnm3OhoUb/bYanRi1RIbCAMnUaisvjJlMn5D62LVJeqQBdXr2P+k7bzrLOXEoe
	UteSb+iN2WqelNRnpIKnhbVOqBd9nzNLOgfPypwZM=
X-Received: by 2002:a05:600c:a114:b0:485:4bd1:4c74 with SMTP id 5b1f17b1804b1-4854bd14ec7mr44737225e9.32.1773257909025;
        Wed, 11 Mar 2026 12:38:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm58337415e9.6.2026.03.11.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:28 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_123831_153626_E05EE0B1 
X-CRM114-Status: GOOD (  11.81  )
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

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Hi Peng, could you Ack this patch?  I could drop it, since obviously
it doesn't affect my stuff at all but it's the right thing to do.

 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.51.0


