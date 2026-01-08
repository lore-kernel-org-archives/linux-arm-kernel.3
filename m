Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5AED1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKs6oAZCQbgcF6rh1H1z28GAjZqxIUJQTytIqgMl/jk=; b=BOehlPYgL/02xyLmcrTmFp/6+6
	S04UqE2CGjxsGLuZgH9quRYW63zwpcY3BrDwxRe9dKSAFeDROywmUgVmNt8uoVD0YYvHRfx2tUaGW
	qlsvLqyvss9bvAS2PjV3Eus1PBloAsw5uP9E5kDZCndCAgKskg+zs2ihEDMd7abP5hpwRjR1KTwgg
	wxe9OcgJLnrzoUp7/HEU9WY02VFenfZlfKP8qxLwq9c/z2g6sVdNkIfcUW0Ah/jCb78M1PqvYu8BR
	7N8HjZP2Xq1p3mjg0NJq2aHGTLLCzDc2L+c07Y2/BIpBK48X2w1UahVfZlVB3VWTd8GfhDYiE5lmI
	MHEbyGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxO8-00000000sc8-43qd;
	Thu, 08 Jan 2026 21:17:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxO6-00000000sYc-0s7O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKs6oAZCQbgcF6rh1H1z28GAjZqxIUJQTytIqgMl/jk=;
	b=F8Bme78d8wCpten+z4xL3hoJ8Qu1a1MQU8Lv4/d5HYUDotoUnAnypOwR2D2tlEIIsbfMHX
	AiSzXdD0UaTZtWn8FB+SNpwpUvSFJTpma0mFalK+LLNKs0GKF7rC0BbM8WVd61baX8pxrS
	CH4rhjZA3fv3JWuns6HGvZx+Uhf5I1Q=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-jnLmavS6PXuoNaq2LeiwGA-1; Thu, 08 Jan 2026 16:17:44 -0500
X-MC-Unique: jnLmavS6PXuoNaq2LeiwGA-1
X-Mimecast-MFC-AGG-ID: jnLmavS6PXuoNaq2LeiwGA_1767907064
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5eb8e7b7b40so7755029137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907064; x=1768511864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKs6oAZCQbgcF6rh1H1z28GAjZqxIUJQTytIqgMl/jk=;
        b=M9u5eOcgj6XwvnvM1u8F5QR6Ay6Sn/X9UD3bdPqlXZzxzGxDAoLyOngcXmiufwrVRN
         cslBM/loZ8r4qszuW7QQIyCSrqISd7I9bgE0cEU1S1mS/QxvcciRAKLZ69N0zZgPXcci
         IpAQXBgnmdFY6t7Ch8IMK1u+YvdNG2KGIneDzpKCtrtwFzMrs262i7snrY6Jjjhn8S8l
         nfnfISz+IVJt6JvA21DPH+aIOr6NCML6GZFn9g1MaEsfJ3B7aPIKZPXMI5IVyWnUBH8P
         krRS9TwwQ05FrcTzxZInQFBYY4wZwhjMBATmAM57M8PHI7mSbbHJoMCkWsOHN50+IDv2
         C/kg==
X-Forwarded-Encrypted: i=1; AJvYcCXyaRBITEqMeiaK3Zg7GTXFcehcydoaO/5ywCfubgK2Fn4ce6EDELP/VFiFRGFo2TCex/jCyl9EeSPSWHcY+A8R@lists.infradead.org
X-Gm-Message-State: AOJu0YwnvMRqBAzE3gOtBqpkc8x6tcw1caX9X3W318/w0a96Fvr3/t8m
	jwCz3hxWJHFDANa3suxnn8Oji6Pu6xh0jmdca5KZ3CfI+3xfOO9b/Ko34ulVWrCsBh/RvNbglkQ
	KWBfIuPJHjfKk+7H05CAf6HW7/deWD2Q97FNjpmnGMutV+dq+cAWIVtprevuXduTz3w/PhfS4c8
	bO
X-Gm-Gg: AY/fxX4CglcbV8zN1ey0QFNA0NhvCE84Yx3vs3KDNi19U4C16HUiRzEt4pvdamqpc7v
	2XR6xSoRaDr7NLOTS8rvw1UyyzFuY5NqfTCa1a57octNNqhAfBtviSG3DSzkeYibKHN+Ur2B7FG
	4OfY/I6Kv+EEIEUfAiVvrzA4gZhnZ6OoZz5ty94y0f0gXwxT2A9jBeoDfGgciPBtBhfZHB9zTbc
	cG8eMI6xS2Q4lXtqxH6zxZamL0mzCQtl4/4OIRzZ0MJmadYUAbihNqyUJKrSKYqyyNxioaaJA9p
	cOWGPuucV7e7CmTM3/fIzc44DCsoufJJbOzb6jaQw1z8JNzUeR//YO+bRMbQD4na6FNgqReUlQ+
	muaaS0nmLsC57wFE=
X-Received: by 2002:a05:6102:14aa:b0:5ef:23a3:205d with SMTP id ada2fe7eead31-5ef23a3214dmr142760137.31.1767907063645;
        Thu, 08 Jan 2026 13:17:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyfz4L8JiCndo8FBpm0+M+LRB6QOmq1jfaaNaZ6SC4zPZtZ4JarI/3vVLEaOtB78YN6DHpow==
X-Received: by 2002:a05:6102:14aa:b0:5ef:23a3:205d with SMTP id ada2fe7eead31-5ef23a3214dmr142751137.31.1767907063199;
        Thu, 08 Jan 2026 13:17:43 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:25 -0500
Subject: [PATCH 07/27] clk: bm1880: convert from divider_round_rate() to
 divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-7-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RuQmue0KXVswNj/US68xhO/UINGh1ZD+21QN33aw3ys=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LbNl/tnocy/bzOTXuBUpW/VnydbLT+UemmHiefCO
 SYGx9ezdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRzFcM//RYak4qdxV+3Lfn
 akG04B6eoMV8k9I47ms6uJyM6zpVeZ3hf4jaCeeJX5MrqsLmPuF4MFmHYWbDx9U8Z1rintjkFcY
 VMQMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ja_v7hsl0chZsECxUD3asxQFrDUtA6nTn7pOy_BmWsg_1767907064
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131746_414448_F0263DBD 
X-CRM114-Status: GOOD (  12.88  )
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 64613d7fb42f ("clk: bm1880: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-bm1880.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 536df8e828eab83fbd3812135139c703aa7a1ce3..1bdceb36fa87e8250c10a7fc0791379e1533bb38 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -625,10 +625,7 @@ static int bm1880_clk_div_determine_rate(struct clk_hw *hw,
 						 div->width, div->flags, val);
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       div->table, div->width, div->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, div->table, div->width, div->flags);
 }
 
 static int bm1880_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0


