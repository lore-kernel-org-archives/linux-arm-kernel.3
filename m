Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F7C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+EZu2FAVpE4rN6ykqMMomZc+KrMKXYrOxtiXGRUCig=; b=OglAUixPPZdRKSQzyW1iyJDLRR
	iqbJLYmZT4YVj96mSoIqoN2NjhTj5cYd8Zhf3jJgERoXSin5tyQgpckkPW/oPsiBQlsWXixywJZ3/
	nP0PXyCX63mvtM7lnY0cUrAODgHGyz7XgY4xd0XmqSyxbCTxRREmZLOjvtf76q1x8aeCFgy60A4yb
	fclVdwOpgvVEuAfr93BQjVOMfdunXPuZqop5Nc30JwMznSPHLe+X8x4KlmZa+u8c+dTOsaL4l0qtO
	JvQ4jbTaO9FqRHcWo7UsoJ0tcTOvnYOsiQHNR4Q4YO1qo6ok38M7P7FX+uhXEwD8/CjQjIyJk2uyi
	3uZxM1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treya-00000003AGt-1z4I;
	Mon, 10 Mar 2025 15:23:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdy5-00000002umA-1Xun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:18:58 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ab7f9f57192so62309366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741616336; x=1742221136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+EZu2FAVpE4rN6ykqMMomZc+KrMKXYrOxtiXGRUCig=;
        b=bU136z4I0di7d/Ig+ISCSkzjg648SUwZRjaZGwdMeg6tqyNAnFP58aEcZ7Q1rZQQmO
         Nos46WzbJz1jt1PnHMX8eoUhV87GpJpty708/5cq6KQHwjudGKDV6Z+zhztvyihHKe32
         jehWJmyfYbLtParNDZMdugycwsYbfrTWawD7DNMQUN+kcMWjwcMxnMk9GJe9QGfCAWIe
         rK+xKo7FOB+CbrvppNwieX558OKmHg2FS6c7gyLic+Cb8gXqftTL5V8rNSQaUJIB9x1l
         ymlwYlWJMrZmz6HmCNBkSmjDEIzbpYvEaSOrHZGi9UgnaiwT8HpTCkm79c6fJtVEejmS
         By+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616336; x=1742221136;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+EZu2FAVpE4rN6ykqMMomZc+KrMKXYrOxtiXGRUCig=;
        b=TO55qGMqgbAhJ0+xkOd3bfYIwQ/+UfeUGloR1tffDh/1ptYdF+5octYmEbSuIGVrZW
         F3r3oW/5M6kt1Nmuul6eJFhWVPRuVXjocDhkFtvAgS0WxXpPinJrZYJVWzyqxoWRSeKX
         poSfkswnOwaGtA1Y8+lM1D8w6aNFlDGh65pnMsT82hs1eCUDjxVK6JPejFELPOBGzzG8
         Y0SMSa4Xb5maoa+LKxM/5AhsES7lAR7gi02NOEr6xmlKxGWAAhdTUcZcrYQAoVpsT8Ia
         /US2MNH3gjQ4gpSWig4yjDiE3pc3683EbFvf+boHW7ZHkXeK4+9orBQHgXh3fhcizA5j
         lVjg==
X-Forwarded-Encrypted: i=1; AJvYcCUuQSKzzRu1uPIdZHoLcEyeB2tAYUIHMOb0yvJ/p/1KqvdSh+Nsey974pBg40nczjFFrRxT3UUHN1Hce9ROvF/A@lists.infradead.org
X-Gm-Message-State: AOJu0YwOBpkSYJ5Djpeg3dtEtAUgBMA8Cb+OpCk78lM4AYyV02MQRNvj
	lQ0L26zyvMVxRNCSM2AA6U4u6u/K9Z+7vH8op6ABEot942PhGbZMqGTX5xsxcYM=
X-Gm-Gg: ASbGnctgOS4ePMZdcjlj9BFRlCdF2qoDVgR/fFmcoaKGIvlHklHa+nwXm6iQC6Y+sw0
	vqxKChjsW5twzR3RhdoqrU6k9tTYW4vtNfRj1uDwWDFBI4aoRxl9I7mdfYK+XdOhRr4EFnEB/gv
	H631XjfSGpnI7nEGqCQJ12uWembj59WKt8+drZDnLow2qefCRJcEUtFjFf2hcdV/CV7p0CzQIh6
	mGVC2KuUdTulnrjgC19+mLBIYz/NdWWrXM5Q5FJVTgT/J/QnOQOG/uHX5T7zKovcDCKWy3OrY0s
	fpT0WEdcDx/sitWdb7pANgcfeBNZi/rcHyGGDx54YMDCfMTvLMwQ6WichnAU
X-Google-Smtp-Source: AGHT+IHS0jBvu9XaHak0lQufHDfvzvcPfBU6Anyh683mM3GmEZy4fDxzSj+b5ABDl3rLWTDSOFRSVw==
X-Received: by 2002:a17:906:478a:b0:aac:619:6411 with SMTP id a640c23a62f3a-ac27162dcf7mr355324066b.11.1741616335619;
        Mon, 10 Mar 2025 07:18:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988e590sm763446566b.150.2025.03.10.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:18:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
References: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
Subject: Re: [PATCH] memory: mtk-smi: Add ostd setting for mt8192
Message-Id: <174161633416.57206.15365261153795396869.b4-ty@linaro.org>
Date: Mon, 10 Mar 2025 15:18:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_071857_413278_292B193B 
X-CRM114-Status: UNSURE (   7.93  )
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


On Fri, 07 Mar 2025 13:45:08 +0800, Xueqi Zhang wrote:
> Add initial ostd setting for mt8192. All the settings come from DE.
> These settings help adjust Multimedia HW's bandwidth limits to achieve
> a balanced bandwidth requirement.
> Without this, the VENC HW work abnormal while stress testing.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: Add ostd setting for mt8192
      https://git.kernel.org/krzk/linux-mem-ctrl/c/90a0fbaac4a588a1116a191521c3c837c25582ee

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


