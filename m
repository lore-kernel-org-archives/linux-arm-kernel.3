Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13D8CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=; b=DY20JtMdH3QUNOlvlyGVr1mi39
	HhwsU3iM0euneCrTljUSbtcmf6TXC8XxSyWO+0ubAv3W3q3LJX+EZNO/6zaQYO5GTj8/vrGBKAO1O
	lv39lciaMqZ6eRpeLEtjWLSlI121JRelWHm+HWUCOZCVyJ+X+429NGzJPNYFGaeKmI3+Be75itNHA
	thpI4atrEyVI2PA4Vb71h/rvSMn2g8TUfw/Iy8C7Bi4nW2UvBw6/RLmplkeCTd8z8OWm3PCzH74Pe
	/KMQoraKDo2DA3kUa3rUARrghMHP4nHZ6XYxQaq8VJTf8D/ewuyWDqIN9xziGe7gk3Sn3OSCqedXw
	OC/dZFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4q-00000003A4x-2zUS;
	Tue, 29 Sep 2026 10:28:48 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4j-000000039z9-0SXK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:28:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso9694745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677719; x=1791282519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=;
        b=AKv8UDXxRqw+yjcdtsaPeHG5GuArlJqFcDOmNpTv1aNBePnydvUYbIExh6aSxSokak
         FqzPq2dWjpkg5vLRTGQnrMBRR/oqUyu4/tarMnP1kLZPhKesQQJ8+NLyRjsjAmMAOXmn
         Ty+pczrhKnNtWrr7ZlZAer9qRknFOg8f6Qh1OHXgOulL8Oo6MDOMlisxv6v+WY/kobUK
         gYZuOVwTcpc4LotbMuYD1gRvT+Kinbos8yJCS3eT8zfqC81BWrJpDWqVf6IdHDqAHozV
         dWTSfliPou/Tl/cCboOaF3QQdSmpS1ihYQgB+lzdFDntm6Zfwv2jEqRDLFBWJyOUNEYW
         hOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677719; x=1791282519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZTRsHj0KfhwDqKEq7QsxYeKNtzFQI0k4FjiWBg73As=;
        b=j7ZuOIzmGcrphSMhFjj+cQRrkE3fR80nv/+rD1jEQoADNM0TvuTB93mIdJfY/mEZKZ
         VgifJweIAiYNyGTxbw5YPTAourLZWtx5/+RAq5Z37SGf+WZ2r3y66cENEo8XdPD5lSvV
         Oophb4xATvfQXvBhPV7q4a0x3XTXuUS5AVBi+zFPrKznhWo+CzSCLMtRq/FQWZNerKwy
         rWLcO1sITy6fla7/doGeJZEZqmP8mq2NQMd7Lu8zL8y/pnY5Sr/JdDW5qORdXiHIxZVx
         rJTOqNKiV4fNfG/cNO8UqbuldK7ZeLwDTkM0fgAE8e2cGWbIETAQfdqMGxZPNnJWNJXC
         2mzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDHWKBLL3OKXfM5VehJ9y6Eo4KQM3MAQKeLzFoBMjT8Dg/uPZyol1n828jDUaHb4jk8DbaNS1MBrKdGPW7booB@lists.infradead.org
X-Gm-Message-State: AFuF++mS4bhbLWLUYdS662ZxNgQFLfpNf4xEHwI+XM14Nmp4W4XHXsnD
	RmDGV+fv5ZVAONlW69jdqn5OAKRmbH0tkXqi317g2DTBl+tKD3lHRTARVQO8nWXwRn8=
X-Gm-Gg: AYBFou3gszpc+SwrnIf6WBlbg4HSvSVkBjfCn2kI+3dUOARojXKeF4V1Q+oA6EKpTFN
	040eXBo8OE/N2MggEF21JLpWa/+tU/T++5k28pXF6BPZ/Ig9ODlV75aYaieJzyIEuF+hSvua/IY
	5uJHCPcSu4hAPFWApWSvcdoV/gpA9wu7f9YfucUOdTYm478ryzmkV0ZNzD5LQmwTAi0b9m+kb7g
	4IX8LVuX+NnpxV/IMGKpTlEb6X9/nPsHf3S0xuEq6pUVtyi+S/YYUZDqeH0XAOLy7BI7w3yEY4x
	FI5CJ+MBdS9J8QsLxhQfEDmMJw8WmapcNDoP9heG/TgzWkDdZniNlzYYquzpeYfiyzZ6wwBUbXL
	MstTLPjB6uLqyXMeyMngn8b8blWvnRgcgOFSgxcFB3fxyY+W54geYJhWIe7pIph/urJa1Rl4vu7
	+7bz32BwAlXxeEeyrmM0+zCMYwSLz9AOPJMXfRE/AMmGNN+5Sg53nOd2uWqp7G5Xr5r4cg4MMyc
	EmUScUN9BOPHl6VYA==
X-Received: by 2002:a05:600c:c16d:b0:49f:cac3:c68a with SMTP id 5b1f17b1804b1-49fe66f9ff1mr251267355e9.31.1790677719072;
        Tue, 29 Sep 2026 03:28:39 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:38 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:19 +0400
Subject: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=alchark@flipper.net;
 h=from:subject:message-id; bh=QQGLNQvdHfru03RYinWVR9vfNnySQYKGE1jNzOfXc3U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnTx1Oz7jZ82Be+vas833B3yclvwKsWj6+zvTJzy7
 ezV75aMGzsmsjCIcTFYiimyzP22xHaqEd+sXR4eX2HmsDKBDJEWaWAAAhYGvtzEvFIjHSM9U21D
 PUMjHWMdIwYuTgGY6p/6DP+UGuJyZT8kqW4WFf796lPHnY0+KwQrdB5kcL7fxqwUEdDE8M/I7Np
 NSdvgt7NEXh1LbsxIXixqctRkZr9Q6hGeo19OCvEBAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_032841_214794_963C6C30 
X-CRM114-Status: GOOD (  13.05  )
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

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
index 79ffc78b23ea..5ed70c87269e 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
@@ -36,6 +36,14 @@ patternProperties:
   "^mode-.*$":
     maxItems: 1
 
+  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
+    description:
+      Supply that has to be powered for whatever program acts on the mode.
+      That could be a boot ROM with no access to regulators, and a warm reset
+      leaves them as the previously running system left them and not necessarily
+      what their expected out-of-reboot state is. Any supply described here is
+      enabled when a mode is requested, and stays enabled.
+
 unevaluatedProperties: false
 
 required:

-- 
2.55.0


