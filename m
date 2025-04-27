Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1CC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=; b=z4erXX/AzEM4tUVmP0by3rVXE1
	i0OQ8CXxb9x8eAyaPKRV/3+H3yllkvqJqaemA6tT3TLdDm1oxHge4P0JQBtYDxhy3SiQr7t+x69Cg
	iEPG0C0Ct5eQt+I8zxcyJdPKGhjKQwLXYDI2BUqg88Tmaul/b8yVOxtVFeCcgA6zZ3H9TuJlY7Ely
	Fa1Dxk40wvZhuMa+89ALR0L2bl3Yw5JsrrmtjOZ9g63Yl4CQycxxJT5Lz2XMYi22uJGJRGBza1P4e
	bd8lc75R30F1QTWp2DvyAM9OiJbWoNVoVWsQ/uyeLHBXUq8BCUNw3ToMH4SeU+VcGD9aZPsKBb+Nt
	5lAsQnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92Hx-00000003cCo-0ztX;
	Sun, 27 Apr 2025 13:43:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92Fz-00000003c17-3x21
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 13:41:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so7165311a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761277; x=1746366077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=;
        b=qGEl4RCWYsfUPbHfaX3Ss+040HAgrto343h3F53yLGotfzk5ZBodjlLOOiikiHPMrP
         7jRnpa1FEuA0DEcuIYBfETdLHJSltlA/sel5yjhIUQPYiNvS6IilyOdqBqckQFnOG7ns
         3BtsEZAYuB9SvDW1t7K5gIQUyKRiXjyBuHWoIgMenXIJFE0MghXxExOMSqw04X1ocb2n
         5/NG6YQ5KSsPmiwtRMaT99I3S5QIPqqARAAq/3H9PiyMfj3A27ZSGQ5HzGqPWjrao/rT
         0TH9gyAuGYNJ5862+B/XzxQEPRTOvTvauluR+itc0Em0v+GgFNdwF9u1rTlxAxDjgeAV
         EQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761277; x=1746366077;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgLsTHFUHPVY+MlDYOlPHI/6Yw7FnfxYmbCzXZmnW0Y=;
        b=b/rrdUAJsIPJBpLq1FwMZ5Ktu+Ob2VzllEDqiQsfHDaDpJsiNFlKyW0JEdm63gdet/
         cp0pV/h+JK5r2SDYcG+kMnwLygxfYtI6CZoGmGng7JP/6JmRDJ433/zYJfwiGusG6ONd
         l+KBDj4tWjMcLt31T3xJlFE0isDFji2qPxTFBtm/7BeFUw8dIcxIHvt7xKGSGkNwYufz
         nYqmkYrmVQTnv13gDr/CK6BJdqsEfvsWgSnfNS02/vzXB6LjU/neNcv/UiHwc5Zv59ci
         gXziScDxNN5Cdlp4UhSmM10cyiyytS/FLkfn/H+3Ndjfz0hfBRKbmarw7wJr3UIQvPxe
         nzfw==
X-Forwarded-Encrypted: i=1; AJvYcCU7erNoRcKSgT3SLp6UxtAf9N/jjqxZ/0xmyhfG7+BdXMt51qg2/Bca+IPEpyUv0n5Kz/btT5aUNEre7MNK1H0N@lists.infradead.org
X-Gm-Message-State: AOJu0YyXwu4qdZztZOUhyAb1RNsfbJxrRAARQ1cnQqokDfpQGZqh8XeI
	xLBUxmFqk3mbjtTJLc59/DjKwgoMYW/Rh0L1sJPWuTgJEbqbOdsJhJmitmcVq6c=
X-Gm-Gg: ASbGncv2oyp1lM0Jv5zRf1IapIs7U1B1TNxhYOUK3ieA/U7OM+lYZl118mhZsuprVnE
	lAj6K9PqWqiTxM0SEG2BJU+wXS6gc/P/gr4tiV5ZIpnsrQ6J024mdSyIlt+g6cyJhY9W+iheovd
	jO6Q9+IOq+Jub7CQKIgalj0h+bXEJBu3DTcTzeq9ik27HiYlw5e6VtG5QJceJS6qnRZ4vyFuw6G
	jHaqppHTeiSA3ykvvqn0Ry+gd+asDtk7eV8ntch0mYDdfCglmoXjwKyMRZkjUDiOdmltTfJffzn
	er6jsZfmWdQezYIvG3EeAb5iFz+mAd4cmyxqjaPbK2g535PNtD9551ruk6yJ
X-Google-Smtp-Source: AGHT+IFjvYNUHCZ3dPrDRyEa/OPDZMNfSszUTn/p2tnOnx4im+io+5tXp8qpQenDsLlwqL9uw5wHmg==
X-Received: by 2002:a05:6402:2691:b0:5e7:c773:ae35 with SMTP id 4fb4d7f45d1cf-5f722672b22mr7593685a12.5.1745761277306;
        Sun, 27 Apr 2025 06:41:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff570sm4139225a12.23.2025.04.27.06.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:41:15 -0700 (PDT)
Message-ID: <86068277-5443-435d-b1cb-0d1a5731b331@tuxon.dev>
Date: Sun, 27 Apr 2025 16:41:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] Enable Power Modes Support for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_064120_134779_8354E517 
X-CRM114-Status: UNSURE (   5.65  )
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



On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
>   ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65
>     SoC
>   ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

Applied to at91-dt, thanks!

