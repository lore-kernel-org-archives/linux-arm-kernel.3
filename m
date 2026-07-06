Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3E0C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=; b=V1BEjdiZA13ctSTC2es8mxX/4y
	IZAPdaVHVNlkt7L0HWZKWlrSby5YpFG+4ApIP1qFKCz4DJ/qxeMW6tXNCz0LQY5bQjXuQ0TAafGud
	Y6r31UBlvQ+bZai21VFEZ/pNG+LpofX+D/BpH9odJWsTKfPxwytnv5CiVlncgWxaCpJgsj2CF43wA
	e1/4q36BNHAiu7kwADQub6DgqjmlYXyZwgQlSjUqBHbkfUkLIUsdhiXzYzVELToKPvjiG8zk8Hbdb
	jHvfkwtYt0nByoEiJQWvB6qx0YBT8v6fTYctJFpU4EafD5ZrwWSOs1fHkBA66m76DLF9WwbkyjpOg
	VJp1xPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfh8-0000000C25X-20QE;
	Mon, 06 Jul 2026 09:33:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgx-0000000C1u4-1FRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso26827755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330361; x=1783935161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=H20yjDsd1IDhodMc4FjaEjKaDxm2aTWHeQjr+pknYFVz4dCDmwKGozykekPLtGU9AE
         NKK402Rskh6MtYUtrPFZQRglc4BZ3nbxMsHL8lPy8RzrJNba5z8teUFtAL8uNdgYMocr
         bNLJE/Hl8U73StqFZuwV3v8EGf3fbMYDjYcuyI/ZS9o/ZaEhLotSeBZEOYC+hbfoOJ2S
         HaOmyqID6yCHXWcYQq0JciSWgdG4Et6RzOvBiNICOVjhbUN+edQ/y7raLoXnrY6+z/Dx
         d7V625yq1iVvehb6sNH3WhD2CPDTbcnZTmHjCTpETwGz7mMCvBfJS6legjfSUMLnE7zT
         U4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330361; x=1783935161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4sV8eYg/ZL+s2Al+u7P5bf0VrRg6z5DzP1Ps8nBcME=;
        b=YqbJ50YHlk+3C7sXPcKxwvevCxl29OooI50Dyk6a+mVH4XNBYSOgwoxgUjuiN5nn0o
         HvWObpXkmjtZOAsLiXDt7JhF//kHfoGkoHShDtbzwZGAmrGX0kEhA2NuvoHq+No+9Lcf
         9zDpayar0RlzPKNsXltC5CfCn/lvxvyVEpsFi18GiBklT5XZDPaUuw+RVwjIewyCoT5U
         tF+MrNkSNyg9e+6ctFMZK9L3FZ06ZS9mBY9OJpmAksyvV819QaiJ3x2ZH6HYhugOgCCW
         NHbYv4XPMMadoh874zbvTFt9ndm3ZSGBg/mbvmWn3SKVVEtMe3fS76c8Z/5pivDqqg1D
         /E/A==
X-Forwarded-Encrypted: i=1; AHgh+Rqjno9+F29OpB4TnlQ+vHBjHmA1bYDZu5rQXn8jqLBEI8afoJAksyT7PGyiUwpoOLS3gPTQe0Fwmlk/WV3/k+ZK@lists.infradead.org
X-Gm-Message-State: AOJu0YxBNk5BIPo27WmerkChHmeA7HizgPUm59SVmWQBqsuxHpSTMThq
	2+TosNfxQHFdsiLOC6z4v0/Xe8pP3vPANM9ISbgyKdTuXd9ChQ8Z6EJ7Net38fOpKQU=
X-Gm-Gg: AfdE7cmz2LqLEmxWnAlyKx96R1abiPLq9N4Btv+D9Woi5U6nIUULTmQrp4P+ZkAeSgT
	KjzPo8NfbxDGcmR3bGyd2Pghfb6C32zDz5JEG/bMdDxwUs7OLFQiCpXcIzzkyXLNgvhPLTQN/yQ
	SyKTBwaKSDN+59N20tzK815p2Z4fV8YNZf1Tnai7EYNRYVL+Z4gA68BS7+86wmP7Urqv3FEK01i
	M6izBeuzR2LQ9I0JdZZGkb7OX3K0XzAD9Ei78krCfpVOw+qd+G3lNS5m0Z2tE4B6C8QqKcLRW/l
	N4w69v4C3wYNvyIraaP7B8fzLEI3sHcLjp6XlYh2YRXFiEjKoNNRj+2OGE7eqHClNDfEW0tmgA6
	MIGaPPXpeeedQj7/9DpcP+pTffWNzrB7Wvc8RRkRsK0dwTCxOFNbLgssaXcL4OackNF3k1WYI9w
	u4LWADrPNsn4I=
X-Received: by 2002:a05:600c:154b:b0:493:b6c2:cd96 with SMTP id 5b1f17b1804b1-493d11d9d42mr108969265e9.12.1783330361468;
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef1807asm313598145e9.1.2026.07.06.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:15 +0200
Subject: [PATCH v4 7/9] clk: sunxi-ng: mux: remove unneeded export
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-7-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kzpkNVHYIKUHVyZbGK6pa3WRAS/uHKJWiKBBr/HRbXI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YmfyJmVNfRc9dDNX3FlRKXkCm2eEX+2FSO9
 mfy8XRdF/mJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JgAKCRDm/A8cN/La
 hdH3EACDjsiUBV1SbTRjs1G5s78KTZ7oS6GSWyf2BTTtMn2V+5Nd2ocIN7/1OTU7qHO4E9aL3rN
 IMb4bcM6XqK+z8uxaQbFr0DrRbOlRiKi/XmUhyDUiIWESP6KvjBz4nHc3tmADEMTfUurLk4i8ZC
 jJI5yXP5XGOJnxN5gv6H/ys6bWkTwHvLwjtiQ2pt7JhjX9iygJIpSePXEJnUIU+Pqb+NX3VRZ+P
 DIbcyijahmDuqlXmLX9kEGF1ERLFAgkKu/NZxY2mlpYaii62SDIeSyTU08c6lU6dNgBjkQrxDSd
 lIaWjbHZ/aodMn8hJ3rR4fQQsQxH4qHroEo3j04r1zV1EblJSAzxUEZoszz6lVI1Fr7uwVWgauq
 mOvMReWiwP9yClUSeooOR7ImTXwXBAQomS3AymvWdRLuVg8E54+rxShJLJO4bU2mcX8JQbb3sZG
 fNMmPCK3wUYK5T//1e/Zz+UBYDuzWKPCkp+IHcyKZ6S01hoSp0BKHyPEpZUenx7vvXGe1NiKvEH
 Gm5iLLR+PbCJYa5t/+jroacHVeaXyBlh0jZEeg/6BhNaxisiSOcBgH/JV9VR3ZX1jeQxjmDb6JV
 0OOwgs/kUxvIwbg7N2dx8FjWocPUJJKqJGP8lCym5w6a9r/kNPszSOSMaUvhWJQaw0NrtpJhxQc
 kUIvmMxZfVwXFxA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023243_584230_0739F3AE 
X-CRM114-Status: GOOD (  11.13  )
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

The export ccu_mux_helper_apply_prediv() symbol is actually not
necessary. No module other than sunxi-ccu would use it at the moment
so just remove the export.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 775d396ccf31..1a441745e796 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -66,7 +66,6 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 {
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
 unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,

-- 
2.47.3


