Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B77C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yVdDelh0G2g2TL5gxsNNSxDzJyW376EN3oDWRulMzs=; b=XwIsFFBuPOlLUrb5SUemyiGHKH
	fYpR9ullieyPoTELgUNTulQP22ZDPbzGEDyftQK6sITzk4M4rzZL5eV5+Z6Yj3Ld3oUGX6sIQAY4h
	xKfUJZkfM7G1F8JqaRQexjCeOB3I/PN3u5/PkWJg2EKcb8AcVDqteJ/R8T1yVSEcDgnLeDwrMAT9T
	JAyU7fVslb4AN4UWssZ31zYTEYvbbACEE7+UE31M1ShOEwBiIrIuO6UHZpMAniN7ESmG9gQ941WIP
	kdaWYj+YolhRbhwN975LeEo7bsu+KQo2QyZ5sGjXhnLXg8k9MCWrxt9AZrZVtjHwTcHbu3ygJHqyp
	gcU40ywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubM-00000006DJs-157q;
	Tue, 10 Jun 2025 08:45:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuGe-000000069xc-314h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-450d08e662fso1858945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543814; x=1750148614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yVdDelh0G2g2TL5gxsNNSxDzJyW376EN3oDWRulMzs=;
        b=b29Jvag2aFUTR/vPpt0RDBlffc++Ba+ZJycsFKN/EmkqQC/M03u6AcUp41otVc9VAf
         d77HWRSZkjd2BPagAioCVgMiNSkZxGTNG9ahEl6cAc/b6MxSxrdG47Adglk+J97W5iQA
         wURKLGbHksUlbqR8IYbqJ1LTgQKIJ3/l948/ut4XC88otvHDdvXTIzyIFwyhUztBZHQc
         PFdV12Hvf9W/gp0fNYd5KzurXiazQY5khYpNAtJYQPlasd0aaMcUyvqvitlJxam/VlH7
         OgNOimeXP8EjyDJ328csiRgYMTgzub1SOQLB4Ub8IC0LWgjI/NWKm/nyIOEJ+Ev2Fk6A
         1TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543814; x=1750148614;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yVdDelh0G2g2TL5gxsNNSxDzJyW376EN3oDWRulMzs=;
        b=YbKTwt8qimzxVQKNi6ThZB73KOvWW4ugLF0WtWhS1rPp/cNFRfLXmG079nnpxAUeC0
         rlxlDN/AkCi4n27l/ykDvOnmkMaqeDeNBDipmUHzhOuRn5AhMZFmOG7X2M2JSNpA0TAg
         vTTrjB3i1jO1hMEQgj5mRBU3LOr3kVwIuU7KNpj9qrZ3vUdWjLAkVPD9c5b9k5ZQiV+g
         36FuknTGN+YlHw8xZC2yd5v182CIWXRFVSGNn4SP4s6THRAEQxCouo+tcvWRMRH7EtcS
         wVbPh6aookia/M0+H3fYZxQVTTZpujQ+a1OYVpQsad/Vl4SpXgbX8jlAm+5ZVZbW1ZGU
         dVVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7cf/5C/2ZPKxvo4GSDpWOrtQFeqqAVBF88jABx91FrjWJMX2nPWpG+xYLo3NID3rl20ZkLFOI410gxbT0bBw/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw94hsRgxyXR9IEru6/1rUheiMfMWA203wVCYMInS103HNQTAXj
	WX+3oiNVmXlHYqOityGciMY9m8zCNfCA4VQ3uHZEaNsG1VW8JKpq4ue0PDUNjr7CIkDmrrIt6OB
	LWXo8Mn4=
X-Gm-Gg: ASbGnctTWIFcVdrs5P7oH6xgpI8xsSlQUcHA+Wy+RHhle4jVc5ZLQCsGTrrVlxbf2G0
	ffa8WZlsBhQIGjUV5EWtbYJWe+I5NEfGZxuoTQCoYDV/1nVKo1I9zYmq7HtP1qkQPJRIWRiReWJ
	oTNkT7CrS1KWUDa7VHlZtB8zSSiCerubsC3obw47rNLhLumyMQPuxnxzy5nmdruVu2MZ1Z0RzZP
	w4jAbxn9IwgoXLie6CHT4OdyOj9XkPRab1BkGlNTAN4jAK12ZOLcESa2IBnPtij7e55vF27e3sg
	ntIifx1ew5OpYjoU/eLeSqJnq/XksPdZqJoPczI0CnARwzsKni7jYmywucBqarITCXG4APRVZH/
	OQCjgYA==
X-Google-Smtp-Source: AGHT+IH4Tx9uamsGrItBDI2u67txsm8PcW5JtSr8VTliqVeJ2KnCmT5Yh+EXBdeAxp8xz5LOXkLOJw==
X-Received: by 2002:a05:600c:1c1c:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4531072ab88mr23950055e9.8.1749543814536;
        Tue, 10 Jun 2025 01:23:34 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20250521091626.4283-1-friday.yang@mediatek.com>
References: <20250521091626.4283-1-friday.yang@mediatek.com>
Subject: Re: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
Message-Id: <174954381208.117761.10620346119186400968.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012336_749486_78F2D589 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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


On Wed, 21 May 2025 17:16:16 +0800, Friday Yang wrote:
> Add initial ostd setting for mt8186. All the settings come from DE.
> These settings help adjust Multimedia HW's bandwidth limits to achieve
> a balanced bandwidth requirement. Without this, the VENC HW works
> abnormal while stress testing.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: Add ostd setting for mt8186
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e18c3f5cbd0243c60777f7a3a02e4506f5196c31

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


