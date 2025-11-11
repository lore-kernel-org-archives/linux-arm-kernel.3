Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB382CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=; b=f4cgF5RqVLm+ZV8CniCWu6Qwr6
	rFTen9HB1z6U4ZirV71mPYTNBS3kW855FOeIOkxVgogG4ZvYZSSjPQnimjXOEMA0yzGXY2YUH5DGd
	WABkeV4mW+vzLYIU2GFWsF17yzfzRapUIjJv6g9oiApYr9BNz9u8epBW7L/gdhNPAffC/9Ronh9DY
	C438PcbWUaPxe9nTkVYwyvpwDCyRWXVXdMdpF9tBU6y6c7y+T0aLpKTaDZ3Jn3GHST/ZFdlUlOeMM
	NXOXKu0K9i96i6m5bGZWuUXb3Tb55dsCbg2OJua1YWBK2SC0GJNF35QWIfREjMpM6nSeRpaViccir
	e3UteyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqa8-00000007Ozd-0cp3;
	Tue, 11 Nov 2025 15:46:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqZl-00000007OyW-1qlY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:46:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so34040015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 07:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762875991; x=1763480791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=;
        b=iAxtp6MDVYhN4cW7VMxkifH4C9MYicZA55n8HLeMlGIKxwv6LhCVUOfaECYiMk19yG
         hethbMqJY2h2sPq9MhtyjBGdvMs9vCdKG9CI/VSOX3+o12zHhxOALor9/jDhRhFMkRSJ
         D7Ir7ppGDdx4InMbs8Jl9prbuVUjM3XcSP0XYvoMdX8P1Yiz0z8BhlTJy/am2atZpGaW
         mS9CWk46iPSVuSz5Dv4lTKtWCAg8VnLF9QkXmjTvMLx26ja8jAD59twnXIm3qnTixXg4
         EnVJ7BsNB1bMegH6bo3gZcVeWWrITDJDhf21/UMy4aGSS6K8F0HG49rkC2Sp2lQjzcxo
         LJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762875991; x=1763480791;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=;
        b=KESP5aW4VDOHrOuijBJ1Ykybnkgrf9IS854o59vvaZoX5OWbRai0sdTWukkVmq2dgQ
         5TKyIAFPu+XlT2WkkQgfXTiIVM8vhiaxr77vqZTyLNHElnouJW4CDun3HarFU/5ZU3bA
         12rbNcXD8Dmaf8ahGx6vcrLJSsljVDoZmUeiXO9X8wgLgKUEmsE5SH5TM5PJO5jzwi0h
         JNmo5UK+ocOSwn95fTVsoK2NBNRk0fHhoAhSitqbw/ATwDvDjzjyl0z72oWwvzFkMxfP
         wbLI0nv/0DNzT8X7zYsRpcg057SMTzepbJfiejshvpZDu/C/VOpSlQapfiIbZkVAcOD/
         2aLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJtDETxKcnfTw5lWTvLSdEtwQkSshvOKYstZyCx7ryZHgZ3fnGYMw6A5nUV7kDKhZ+hjiFpJYrsKYLQLI7HNPo@lists.infradead.org
X-Gm-Message-State: AOJu0YwemDu3v2T4uEETcmMu7Pp+zAE82K9epjaFwgV7xjuS/Gvj3jAP
	zcRn9w5udgxWDB7LZl3peTRxL9p89geVxn4g+LDhtLbNXJHM+rHaTi8bUGQWNsbzW44=
X-Gm-Gg: ASbGncsTYLS+0GMSPH95JnyhzHTirwvYJeveSH04spnpSSFsvnKthrwHO2juPbiZSMe
	iTwr8ne7aWrBGrmoSCyiD+BWGtAOVUGrfQxmLPEU9yH6i/pJ0stSN9evcOENezlkKesvFI96RHO
	9RDuGZT1elJiukkeCusj0vWpeUSgYoJ0dUT/O8I5MuB5QXE4ELnItOsZ6ANVt2Ci+4Y//cjYKBX
	WRMMEn/kvN4c7cYm8Y6q2non+5GbyKwnj3eXpSxjbjWCpo61gtFSN1AEXCo66suYtrqUH0uZIja
	ZZw1Uzirwiq3owQrL2arOOb6h5kPHXPCCPzyAWxFYBWroi6YfAeoBJO0JAaPHHOhzjGz+ln57HC
	vb6slBjdwX2bQD3heEowjHypFwcQIaJqsLRl5D8EJDNJB46c6xxqhHdBCGSzmZ1OLdhaALtL4KU
	5nC4pX2cQN
X-Google-Smtp-Source: AGHT+IG/mjf20bwbB9ulOVh4z563amE05UyfIyNIY5aYHGSZyB1LNnu3YZ77PJ1u1Qd3j2JGeLOsNg==
X-Received: by 2002:a05:600c:a41:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47773271aa5mr102937745e9.22.1762875991319;
        Tue, 11 Nov 2025 07:46:31 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc33bdsm377541625e9.1.2025.11.11.07.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:46:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
References: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
Subject: Re: [PATCH v2] clk: imx: imx8mp-audiomix: use
 devm_auxiliary_device_create() to simple code
Message-Id: <176287598917.23558.10560877169801867963.b4-ty@linaro.org>
Date: Tue, 11 Nov 2025 17:46:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_074633_515303_335636D8 
X-CRM114-Status: UNSURE (   6.19  )
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


On Fri, 24 Oct 2025 09:45:51 +0800, Peng Fan wrote:
> Use helper function devm_auxiliary_device_create() to remove some
> boilerplate code.
> 
> 

Applied, thanks!

[1/1] clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create() to simple code
      commit: 9d97a2fe48ae77976baff441edd5b30ea4e179c0

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


