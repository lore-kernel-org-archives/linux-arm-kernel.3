Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE9510D149C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVSxqj5+EI9WDl5Sz6NGHvDhkfU3nzyVbqnqzEf09AE=; b=LVWLW2zASh5eixt7NfeKci+hQ1
	w/TuqOhJ5FgQQ+kKbGZ+qu4VPlOJFfMEg7wS0lgg3+4ahCJbq1UbNu+DAlslSekte3IUr2SWSaIJA
	nW4oeN4MrjcMg95gdJqU3/0sQO7rG1e0/Sx1IQpZljqr9Ei3YGozzqL+4360h91x0fclrwbWu2an0
	Akh+vZKX6ecJeXrt2oGtYNJ9lQMQO8iS0WGQsXaSq0MI3hkaSkQ650KSpHi9lPY7/lX5RySopR7Hy
	AgnIrfBkGVpWD0H7mYjnVSim7r2EhGm/mtY1JtmKQee44y3O5aV3mUUhf7LvRuQ1Me59EQVkFXSAP
	csWkrCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ANr-0000000B842-0S4X;
	Mon, 30 Mar 2026 11:02:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ANj-0000000B7zJ-1FJU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:02:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b24fdac394so10294395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868526; x=1775473326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVSxqj5+EI9WDl5Sz6NGHvDhkfU3nzyVbqnqzEf09AE=;
        b=bcrkij+sWeYSiTW+LrNrA/vFfxH7R9p16Y1Eh9htXP9bVklaBMvu5o3pxR8ZO4W4ST
         9S80Hgmf1/cVq3dl9LQbA8BxG7cGOUxAKR5/6PiwqNSVmNYCOfer9TIRvqKO9fYan84T
         NWur5AsgmiwboJG/zhOodC8c3REcGZ+zHXG1IbJe+GWYIYCFysZLznV7SzUvTcM4tN+t
         /2ldsD3BkZmqO/2W4vER2O3NGZx9wIgHqBTwFCzmCOv/D0pel+RXsPdEfL6icpoolbgj
         HaPW2Z0cCs5fc+RBDlN+fHi6S6aUaoEfGdjAsg9Zvp89W03fqcCJ8Lh744jxCwCyf5Y0
         exyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868526; x=1775473326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVSxqj5+EI9WDl5Sz6NGHvDhkfU3nzyVbqnqzEf09AE=;
        b=Tpa5sTjVcdm7QHWYj/FHeZFtYHpxU2b5nu19c3iRoOayt9FmQnYxrzilhBuwVOdvfI
         a2g2+deugumh79rhr5Q/us2bydFIzK5R+zo4NaSb6ENd87U6UeUWZkoZ6skB7RGHdOw8
         nMhJ9MtDmgieddl7LyIWPDCNlnrAffmo6UVPteXQP6m74fIogSmrBkJ2thir+Pmar8Xj
         q9RuX34b681KI76VcH6nF9RmfOhDj1rDxiXDWh5wBxAhTeQH4yZDvxsktI14o6b3Tri8
         SqdHNBGVXajcskx3BCe0CHl1muk0KbH61GEpZ6yUdEm9CGaigYzalpWr5+esycxLEi4a
         SZzg==
X-Forwarded-Encrypted: i=1; AJvYcCX7aqj9KLbXGJ2pokm87al3hvobtfFFRDO6kzjRJZ7lrARC3a81AuD8AB8Pe4ZmHpjfyYHgbC7Kbb4XyZUUt8Ym@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkw0vUd71SYRciVUFxNarMeA/4F53AVnkZQ2xhrw8HJujhjyiN
	HcrKJoAQn84g/D2LLVIYB+V25LDeR2rxMMOLdvkhgk6ANuH3llqZvKob
X-Gm-Gg: ATEYQzzo91YKb+DAsswaxdAnAYVSTwjjQZpchJgWj24Q1d/7rYBLElKrnEwlhpQbChD
	dGEoiafrSEdYySawOx8V4FhKOeA8nFMgWEo5tcUEwJJfOUWA+Z5MM7NmVpWoCBKazXgYkRsU5tT
	ng+RcEHObum/IAF9HrDj6UFLXuO/f9TC3X/3urjzBL77fOR2JlIN9aYVzVxwxqrKikOXHckSgaH
	pP76KjJT/+hIdtACYGkuD8FajdUaAhqJuMb95FryxvuAFPwYudtnl+58iUVVqa+3mug53CzTm3O
	vnAfXIr4JVix5smDUdx6IBxCJghNhRm0rV5KYHTmmcs0K7cdJH2sS9tQ/HaA/kBbMtqBpOcBNk3
	nsq3+b4Sfjtekutqlulm0gr4uqP9x/fVgUJjdl9LUehKqFHsKFfntj0+6w2hv7nc3qqa2GXRshF
	CY++ORA7fGOQFPvIcH6SjIwZycM0pd21GUFfXhZOQ=
X-Received: by 2002:a17:902:ef48:b0:2b2:470d:6d18 with SMTP id d9443c01a7336-2b2470d70bbmr78007655ad.8.1774868526411;
        Mon, 30 Mar 2026 04:02:06 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9a6e:3eae:13fa:fe3c:864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm77701375ad.60.2026.03.30.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:02:06 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 2/2] ARM: dts: gemini: Rename power controller node to poweroff
Date: Mon, 30 Mar 2026 16:31:35 +0530
Message-ID: <20260330110135.10316-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330110135.10316-1-khushalchitturi@gmail.com>
References: <20260330110135.10316-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_040207_372050_5693B905 
X-CRM114-Status: GOOD (  12.06  )
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

Update the node name for the Cortina Gemini power controller from
power-controller to poweroff since node "power controller" is
reserved for power domain controller.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v2 -> v3:
- Used generic node name "poweroff" instead of "gemini-poweroff".

 arch/arm/boot/dts/gemini/gemini.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
index befe322bd7de..910faabf76ef 100644
--- a/arch/arm/boot/dts/gemini/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini/gemini.dtsi
@@ -228,7 +228,7 @@ intcon: interrupt-controller@48000000 {
 			#interrupt-cells = <2>;
 		};
 
-		power-controller@4b000000 {
+		poweroff@4b000000 {
 			compatible = "cortina,gemini-power-controller";
 			reg = <0x4b000000 0x100>;
 			interrupts = <26 IRQ_TYPE_EDGE_RISING>;
-- 
2.53.0


