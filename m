Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4053CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=; b=I62EkOIj9HAw65MC8SuWFyKXcU
	lrD7nFNl7EKxW0va/sAcD+Vlhb6ilhClgNN2sbHh1ALadigpFhwXCNGtSRUqxbivg50/DmJQVowUG
	LwXI5m7kVGEqyQ4rtVUh55Ijw8xj/MIaaQq0U7k8cYK+BjUqVkOCniKuNc8l2QJVDcdRoKi0cWKyX
	fg2qcw66dQwx49qrGlQaATZYqzLJeWlwYbn8QKjDVq6SWdAEfFKWLRYsw5YXZrxIEjjeZryTIjadw
	+5m6Y88+37HGZ8W66fOb6hlvFLxmjOJ6OBeTAp2wOLXy+zYHn+ZFJTzG0pzrmjiiGH2gmuu/snLdH
	xY7EjQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFtY-00000009BKf-1SvC;
	Fri, 24 Oct 2025 11:23:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFtV-00000009BJZ-08kx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:23:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4711810948aso14629865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761305019; x=1761909819; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=;
        b=dThp1oiZAxZTOC+aDhH+ILjZipIkDjA+fUmJX355SkvwCsTom2vYY7sqq+rOhywJiv
         TnVz1PlKsaMqHbn9tSFEMV90v4HJ68Rx3Zp/Yg37KnzIyQwR5FbnY14n/BtfqHQZ1YTS
         mwpgIrwKEJ2h01pG6VNuShLW+noXj344q3rN/Fg9Werjd0ezRTF2l2plWcoZ4uPiOyFn
         /L7VUW5w+LOALPw7TS1rm4+D+Zn65jsWxqmXNpLuMHPovwBEsK8rzGXxCTOqVBXEQfjS
         COXMiIXWLma11s4lI1dolYaq/FtbkepQ2c+DkQOoNCl2CEvaL9MkQAX3HkV8t9NPH5+M
         KC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305019; x=1761909819;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=;
        b=lthRAtwnxZ4vtIXGyCu5ziN6PLxJJ7hgf6evisSSwJFU28jV0ebUcpV83vs8We9iDw
         mYR13wLUzlvYfo+aScvZxpDkxm2plq8CDJx/RfUDSYT4r/HiqvwYvFANFkhL6V/0LMVD
         pw+5TrpioK2zOjxlT7CjQOGfvSDBl41MN5FKi+mGNm6DGKPQGP1Wn4q/ROF3SIrFFZt0
         xrOjK8mkKKs0yqDkIKGP0Zq7vO0xE6qAizKxSbz4FitchY+SqYabqET0Yv5T1jEDQBIA
         1jX4shIwNzLAVxqDGdjxKT9P+hl9tjgczw889s/I3G+k7DqPP52gq4nInnYnUuLOTEiJ
         r6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVdrnHXQaParo34y+M07M+OiwjI7YnP1Ocy0TvFKKTE62d6FC5xCLFAm9kca8tz/jBzb6vhcgIUP6qKhEBgD2UV@lists.infradead.org
X-Gm-Message-State: AOJu0YzDtZe1BF455MwGsZNuqyAplE860iksYVowNTauK36YtYMRXkaJ
	YwSf8OrMN3nAbeRHFvC4wEINBRJqgT7ZLr5By2UJ4W9aRxL49vmYndUL7tm0jEVLPOk=
X-Gm-Gg: ASbGncv3N8ywZiyaLU2NOj4VdrV8VsTD3Cfvj7hSf4V8F29DvXj78JOPi119w58rVXV
	eZwaQLZMkM/QGn70Yg819i+1fesJjrTz9Ga0wzfD6l7AcnHQkdEQEisefxfHhJ3FXGSXzDn0/Z3
	Ta8IW/GDjudyBQZ+CCiKyIeTCIuKpMyGCjn7BeBOb6YMOtdytTggOgBi69tLVMgzWlz8T4lyzg8
	TK2mzcnPNrSTacY8KtcQqUYIn/izk1M3qhb2qxcUeYLDcmntlo++Z/1qd9WiMYEuyNHrerySUe0
	QGlDrJQ/OBjQyOL22SO2AQJtfPql+TAhn1aISu5uTBA/hVLTllzda6umDhJmt+EAEdFv5CkG+NU
	DA77hyy0dfbmAZ9V7yagCpxwdJg5QSW3f+i5eXbRIYxeamvrmoyUmbYsRsCWTdTS98WRCoirXOQ
	dFCYPwBxPEAfCHbefp
X-Google-Smtp-Source: AGHT+IExQzOyk4omzvi9Zz7XZjs/LOOnvxM4yvkC9gtz1IfMXQ9aSiPVkXwgXIxJvNBEVGrXMNkh3g==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr22219100f8f.33.1761305018812;
        Fri, 24 Oct 2025 04:23:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429898ec1dfsm8923611f8f.43.2025.10.24.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:23:38 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:23:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix a copy and paste bug in probe()
Message-ID: <aPtht6y5DRokn9zv@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_042341_211337_B64B8738 
X-CRM114-Status: GOOD (  13.82  )
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

This code has a copy and paste bug where it accidentally checks "if (err)"
instead of checking if "xsi_rsts" is NULL.  Also, as a free bonus, I
changed the allocation from kzalloc() to  kcalloc() which is a kernel
hardening measure to protect against integer overflows.

Fixes: 5863b4e065e2 ("net: airoha: Add airoha_eth_soc_data struct")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8483ea02603e..d0ef64a87396 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2985,11 +2985,11 @@ static int airoha_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	xsi_rsts = devm_kzalloc(eth->dev,
-				eth->soc->num_xsi_rsts * sizeof(*xsi_rsts),
+	xsi_rsts = devm_kcalloc(eth->dev,
+				eth->soc->num_xsi_rsts, sizeof(*xsi_rsts),
 				GFP_KERNEL);
-	if (err)
-		return err;
+	if (!xsi_rsts)
+		return -ENOMEM;
 
 	eth->xsi_rsts = xsi_rsts;
 	for (i = 0; i < eth->soc->num_xsi_rsts; i++)
-- 
2.51.0


