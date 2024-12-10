Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6C0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbMZ1XEGG9+iR89acIoDRWlRdmkKPe5qHYKAcY8LBOk=; b=kJzzHo8J59NGbLi4RFkAVqvEox
	p0vsLiAHNhYHMEk1Zdvl8M0A362flg0xZYdiJeNPAnnFJgAb4IFcd6NtQI0FXKhDlGfFHygU9z8uP
	/RJAD2f3N2s4QUg2jQC1rQi41ZEYgjI9oapMuFb1E51l4m2f2cq7VXLZ2D8pMmI+4Xcv0wvGIk+L8
	MlpZK1aFdm3Fc56VPkEufAU6lyjbXPe9gog3/acJp7z4oLQ117EDHUb9f/frv1F4M99F9NZUcY6Le
	JBJ1Rz67a98njUcxbgM5BxLSm4pb0QyhzsGCtgBQMp5b+eX9BL0VfOJyAByqbG9TsDWHW3gUcW79g
	rQkIkHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp86-00000009qWQ-1u4J;
	Tue, 10 Dec 2024 01:33:38 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp53-00000009pss-4ALQ;
	Tue, 10 Dec 2024 01:30:31 +0000
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d87ab49423so49438986d6.0;
        Mon, 09 Dec 2024 17:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733794228; x=1734399028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbMZ1XEGG9+iR89acIoDRWlRdmkKPe5qHYKAcY8LBOk=;
        b=J14ImJTwPQ7M2FqqIbWQC06kaAXCdyBKecIb+X+UmID6ROQMu7hDZ83Kf/Jjd18nw0
         8JiQxATkorkOSyhYbiMbJiouVXU7O6OJa2jmfjs34afejtAc1RBT4jBrxd039mPjIZtZ
         g57HC8AFA9x/Ea9ksvAcXKlSS657q1jbSqoqwSSyq2PpEysNMYDdt94T00NkORH6Rmrv
         kfHoj3QGoE3z6nfulDTt76GL3f/pfSMI+Rg6O1PUbPyh0+PbnGCAZc5YkJlYIVp3WxM0
         Js2mC022G1ki7zZTE3Y4ZaIU40y6q+055xXEUdPFIh4ft1dNjZ6+4I6W8zLy4FqjuDef
         v/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733794228; x=1734399028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbMZ1XEGG9+iR89acIoDRWlRdmkKPe5qHYKAcY8LBOk=;
        b=TGUAtrg/UnHHR3XQaYbnDkyQ7PzQr5HQ2yuufOjNU9RgsW4SMdcix/pTYy7Retg3eJ
         Ry5lFWhg1C2C5e9kYdXooFa5lVwYmEf5amOgoY82Izy9ud3sfulYDf8O9R114Ntpc53k
         hCKPGWCj2RhOPz6Wa3w1q+byLhxahT0HBUxeR2SAq8/otrGqp67A6WosUQO07fEV6pOz
         wG0AI73kwsD1lq3E+R9f7hXtDOLggz/4SSFRCTYv/f0KEjaM7gpRB6ygfRNv4Gz2cHv1
         b7nBcGc4lqZFU/ACSizqyF7vUJ0gRC8ug3hAOwkJzGnDiLdyN4dE2FB5D4XRkqnPCN9Z
         tQLA==
X-Forwarded-Encrypted: i=1; AJvYcCV/EaxKRYKFsoAYy7u6rZTvDoYML+6f7bdlRh3aJlF5WryPXL+/s/RySlVYQMrV9MXpfGRyMroWMoRj9zEXHkE=@lists.infradead.org, AJvYcCX4kZ0d9Q1O1xw1bk6a85Y/DoqcZTGKentnhNjfX8IYbj6uvXMMXZ6JvGfFMdntzT6JAyTll8FCTV9sglURutBo@lists.infradead.org
X-Gm-Message-State: AOJu0YwrfK9U3uh192BddwOBwE0SlWCuxCaT7/Sv2FggfLQQpnxMQKB2
	Lo7O0dTCLNDYtD/wixVgdv0e9FnXZCd/wcw7ga6Co/f2DbnZF/w0
X-Gm-Gg: ASbGnct5Q4r3S7QZuE+v18O9St8DAN+DSc+8MJ7MWQqb36QVvAWOr74esah5AHAzQMq
	j2TRVm+b5QWzrZwhyZbhcuXOvJIA0EynNlIPpkaiymu7nJx7kofnUd4+U55+n6L2n7dfc+bgrdV
	kPOIjuPlnoKoPTYpZOKv2XSuurR8K9VB0UtLBU5ZGipazaK9BZtqO/FRIb9h0jxbP8KUAMsMHYV
	VjyJOYXzqcr4pe0UaA+OMpTZCV6pGp52q521StQi2nvyTE+llQLtyfLBzqWDA0D9w==
X-Google-Smtp-Source: AGHT+IHtWOPd4M5xIQAtOFMGvJ2WXw5oVrlCvjGb1M5Y3tJlywOZoegb0SMUWVqBgkFNZkQZZVQ7Og==
X-Received: by 2002:a05:6214:d06:b0:6d8:850a:4d6a with SMTP id 6a1803df08f44-6d91e2d2bf2mr47042826d6.1.1733794228302;
        Mon, 09 Dec 2024 17:30:28 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm36834346d6.72.2024.12.09.17.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:30:27 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Geis <pgwipeout@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
Date: Tue, 10 Dec 2024 01:30:06 +0000
Message-Id: <20241210013010.81257-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210013010.81257-1-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173030_032422_EA5456C0 
X-CRM114-Status: GOOD (  10.63  )
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

Correct the clk_ref_usb3otg parent to fix clock control for the usb3
controller on rk3328. Verified against the rk3328 trm and usb3 clock tree
documentation.

Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 drivers/clk/rockchip/clk-rk3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 3bb87b27b662..cf60fcf2fa5c 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)	= { "cpll_peri",
 				    "gpll_peri",
 				    "hdmiphy_peri" };
 PNAME(mux_ref_usb3otg_src_p)	= { "xin24m",
-				    "clk_usb3otg_ref" };
+				    "clk_ref_usb3otg_src" };
 PNAME(mux_xin24m_32k_p)		= { "xin24m",
 				    "clk_rtc32k" };
 PNAME(mux_mac2io_src_p)		= { "clk_mac2io_src",
-- 
2.39.5


