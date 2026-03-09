Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34303F417EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=; b=AShFB9L1IE8pOGEtinMckgBHMI
	/bBpghkp5B/LH+cDoqhcAwt05QM5e+9RRh7auCfoC2wPv3xC+yZLrIjBX2z3D1FFU3p3k7uY248vX
	Htq88q3klGrXHHn4B+vkJaePwjhPmNomtycqDoNGlk0ldE/kYq4Gc5RlhHmrZ0qvBNFOKIJu91fkp
	f45CbvwhALLCSZ3lkwjVaQq8lxkk8mnMZoQiqCNXHy74Jf4JPS3HRhOPWv9Nk1P/a+MsKCZG1hMS9
	ZjAJ+FAyury40lD/qtkp7qBiC3vPd+OCboHK+yzLFqkprMWePsxJFFFbb33akMK4ZG7LOysd8ky65
	sTXA7C6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzblk-00000007Ub6-0RtX;
	Mon, 09 Mar 2026 14:39:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzblf-00000007UX7-0tvO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
	b=Ifa35TkTCQZ6V/Lke6It70lf4Y3/R3IBxd2zlw8g6IM17eDGZQkrzI9GAPsbJKzBfi97+y
	zWjnr0O3oW77WkL89gaoqgNxQl4YGblbq7uVTW1YJwOddGJUbRX++p9oiiRltm5pI4OaQ5
	oAmPTqyO6al8pSYTymtg0AhDJdVN/oY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-RLdvs8WyP-eWxcVk9Rci_Q-1; Mon, 09 Mar 2026 10:39:32 -0400
X-MC-Unique: RLdvs8WyP-eWxcVk9Rci_Q-1
X-Mimecast-MFC-AGG-ID: RLdvs8WyP-eWxcVk9Rci_Q_1773067172
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81be6f05so833988885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 07:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067172; x=1773671972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ic9NeBlXF4wU+xW1snaCZS2ez+lmS5fgnxG5sCV4mQg=;
        b=DU+j3ODV3TXDtfJrjhMDZ79dUoMCAj/kQm7GkbhM6Nvt0E0IGbF4P+aMdN1V+8pSqi
         NqPceSpvVwBi5EAhR40ITMq0O50UhkQYVWHH0r68e5Cp5vucBROq8IkMmrHVuKdbd5k3
         qPO+/Ii3tFZ2SjiNK6crVJ4d6j+s5R8eslKhyVoh11oSjDQ15ribqU1wLouuSfOtUTuE
         GmoKY42ZuyxBhg4GrJo6QfSyTDDvjecQFsfNcPhx9UsKi3zpa6d8/1dE6CBu2LuLSMW2
         P8ELAR5hoglCBWkDCB6fwTpqeHbETzXOji5fo1b9csZJeXF4J/L9a/fpK5FmHv9+hubZ
         3YIw==
X-Forwarded-Encrypted: i=1; AJvYcCUJUvmhOW5m7cyOmHdn5HIiXWnT1PLkoJimKbsIgvHIiNOzU4R6bXm9YYSEKLdtIWCm+V6J2od95mPXne6VZWLW@lists.infradead.org
X-Gm-Message-State: AOJu0YzEYMCSzO5QtBqvqBJj4bx+/9aBvkAErDsX8h9Bx9mkRfOL1wxo
	8m4uwOlo+YJzmqy44uc6TVyzQGZZ4Z1OiZjRonvpilB691wJroSwRX4Z3Q6QVi+FpJF7uh6wFXz
	BeJvTVgfBEe+B8xr9HeNxAFGE1UGo+tLMUlGuRI6wO4mPI/gqMJJ52plh/ORZdHd1XqeCk8J/Il
	O6
X-Gm-Gg: ATEYQzzJGfgiU+o9VvZ2APiwHIP7fXXrZDieboGWfkt1czNnno/e+NviqS6RP9jWX9o
	TP42KG+kio2c1T6U4NDz7yXaSz8MhbUwyVMcpJF7eqWKBambIsSFFLAAKZMNLtuA+/k1XIoc3FH
	fBvr3YSm48+O3NwrOzJBP9z71InYJA4dKGKBs8zR2Bz777NjUKmh+hQ7S9Lk2fUBZKBiVrAHq9a
	PDYZxpdh1oqFHHDS4B3ZacbYrgxmSf3HsCNZJCidt4WjLVOz2g0QK7GRyTfUyCfUzjNMfkHWOJ4
	IchF0h8+alSZlCtJ+pJjmku3ITF7U5Hb1W1exRxRPcVZRFo3ylyG0ZnlPtugAFf1ju6dps0oxkF
	+kkXTfLz+UXKYvyu1Gu18mWoIi4xF9sJjcA/WQ8cC62wdAp8xi+D7N5MYggofIw==
X-Received: by 2002:a05:620a:bd5:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cd6d3d9a52mr1391295885a.8.1773067172051;
        Mon, 09 Mar 2026 07:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:bd5:b0:8cb:baea:89cd with SMTP id af79cd13be357-8cd6d3d9a52mr1391292985a.8.1773067171586;
        Mon, 09 Mar 2026 07:39:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:45 -0400
Subject: [PATCH v2 06/12] clk: imx: scu: drop redundant init.ops variable
 assignment
MIME-Version: 1.0
Message-Id: <20260309-clk-det-rate-fw-managed-v2-6-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uC9B74/6YaJgtC1tOqhWle/wJGIWD2whJTfl6Yd1DCo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z7w5nrBvNsrTNMf3kl1rDhwMu7USnYjFrM7VqlPE
 9822AYKd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRJw2MDBM5l//X/rRn0Qm3
 pYasHy02rHWyfBlY6LnwWt3DlAmhvW8Y/oc2pO0tOi6vMcFY/sPuqitLmx1ZUzxdnfMbDDx4bQU
 b+AE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WVq4VcfbmjKF96keK-uFojI8r8p2TvmNll-BPbzc0JE_1773067172
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_073935_338172_7902F534 
X-CRM114-Status: GOOD (  12.16  )
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

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a85ec48a798b58a12f893587c85709bbd8476310..a39c68d664655537e81df55c7e6d32304de9338a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.53.0


