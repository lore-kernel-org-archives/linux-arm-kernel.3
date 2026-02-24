Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC612EFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhNrm0av+awaDMAZE+zf8q8wvC/W86Yd+ECEn3yTbic=; b=jXoW2K+ki35/91FfyCK7moiKxf
	AaBXhPTqgjr1B5iEsG277Gky1JC5D0abjkuMAlCpmMolnyto5Ti5k/5xffqErzbxlpS/SzcvgXZXr
	THC/JY9SGQqz68MH9JQg1yklXDRjTv8+Hxz//+P0xeQzsrNPRJhyDwy0BopvKN55jGJhJHJtI7ruc
	eE1FkxhAqxfGdw3vVK/gvRBRDipyfF72wVagVzvLDlmtG3PAQGcahuF0hcjvWHUA0MMdREFDYIgZN
	q1gpJUxHv0z6f4QwsYlZQMxWJV8QzX65lg+iqa8ecoVKa8BR50ZKi0IfIl+bVsEfr8X3J64AdFG37
	Jwm/2Vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuogN-00000001kGq-0QX0;
	Tue, 24 Feb 2026 09:26:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuogK-00000001kF3-3PIR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:26:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4807068eacbso41258525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771925175; x=1772529975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhNrm0av+awaDMAZE+zf8q8wvC/W86Yd+ECEn3yTbic=;
        b=Wyvv1dzfdCTnq9O5OYpzKlD9HZofZVnRZY58aa7sTj9aSRiUA2CESdyY78+nZV3sJA
         ZmMBX6FyX4O3MxXYGxVHecQjKToY/sh7tjwov246qXV1WtGvFK81m/tmuK6vPe7OyoUs
         fIoLuv+5FGQAGo0TY3uc6MbUqrJnQRUZCJ1K2L5rordWDhkmfrgLfgvbTqgmBP08tHPO
         hTLH0M3uFq5D019a5/JpZeQ72QSmVXwCzkXUw3cKc79pfWkGQokofs1WEdArazPUPs7J
         igoFN4ziMcZKvJM9kq90O9erbLKQwyX2jOA3SN7C4wyhv1d62adzYMU4Zf2fm952gQea
         mUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925175; x=1772529975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhNrm0av+awaDMAZE+zf8q8wvC/W86Yd+ECEn3yTbic=;
        b=JBPXrNwI2lfvHc+EiI+Lnou8ScRqilX0PRYjQmZPx2V0wTHpRO1eTMprR/fXFTjjKl
         eUA4INUmJ2evp5tXMPzOEWo9iE2uUG/+Vrf1vPAkf10ge9NK8xFklFsSzgSPq6MeRccB
         cL/A3HgmZGsFjsXgZMjX6+Pyx1U/arNmQH7Vn1vLze1a2SO8cmRzNl2x5aKGhiYzk1R5
         jJac86PWbg79hoE2gFzak8TdA6oah1ppA+SP8/g6iWFDw1XCIPQ9s0q/7t2jWTx2u6kA
         6h3smHL/M5VzeGsIAHP1u39CZ/Oxw1tp7CNoF1WDYz1Kdkf8rl2iV3LEQ29zksxM9nwN
         7dMw==
X-Forwarded-Encrypted: i=1; AJvYcCV0gQhJ+Vy4Jh81p+aslwLJkxdrlj+ubHNI2E54VN+uP8pPXeFDJZabPSY2GvBarf+9xzYn0EDVQRMCquxFIgN1@lists.infradead.org
X-Gm-Message-State: AOJu0YxdX0HrWRsLeQB/T+rgIemCRJcILW/qaXs34nEWUR/5fFVm/klq
	nEGHlisMCHWLuaDNoSLWO45P0phPhlbreU1KsyAw7MhYuVOtvt6x8vgi
X-Gm-Gg: AZuq6aK/Dlec6eJuRPq9sLaTE/dASat/3yiPiQSLE/FPkGmqfUZaY6vPE2wodG5SK8p
	BTQwkc8JdEBH3F5wksf1ilgJ2zAdjSh5A11zSm8HYKLU/fU9h4WY9YleGImcSXoSVxgyWlDiSPZ
	zqDayitWWK/dElagPhX4hdLxzvhHy0oPeIg02l7KRF0MkQoL3sDAChDp+7mxgyCt312sa93/n6N
	NUiBcz4H0s1UVqjR+q/UdlJVxeJfEozsSNH4UkvH4pXutUSwKuzgQlRCyK1KHi5KCS+1S/J5Cpk
	Smljkv7XGWVKp0Ni0o9Poo3wR2qtYiTj93gsM71vcw7HrUQS5vtPHGL9gkLMkegSB284fqT4uIJ
	CGo2ABRjosVhz8x83eX5Qa2fErGq6drQKMsdDBc4PCTssAA9hWgFWecqBBx8uFFlZCYvZ/kUj3l
	mboB4yx3hcCl7w3J/tS/4=
X-Received: by 2002:a05:600c:3508:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483a95bf3d0mr215648355e9.15.1771925174582;
        Tue, 24 Feb 2026 01:26:14 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b87db57fsm25049545e9.3.2026.02.24.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:26:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Re: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Date: Tue, 24 Feb 2026 09:25:23 +0000
Message-ID: <reply.1171865014.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <296b000c-5970-4668-bd42-b99ca78d598f@collabora.com>
References: <296b000c-5970-4668-bd42-b99ca78d598f@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_012616_884458_7A29F609 
X-CRM114-Status: GOOD (  18.73  )
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

Hi, I have successfully migrated the old driver to the pinctrl-paris platform.
It turned out that 10005000 is the actual pinctrl register while 1000b000 is
only used to configure eint. Once that was clear, adapting the driver was
mostly a matter of being careful with offsets.
Also there's a couple of obvious typos in the current maps that I fixed.

Before I send in the patches I'd like a hint on how to package the changes as
I hit a small issue.

mt8167.dtsi includes mt8516.dtsi as they're very similar SoCs. They both
currently define their pinctrl node like this:

  syscfg_pctl: syscfg-pctl@10005000 {
    compatible = "syscon";
    reg = <0 0x10005000 0 0x1000>;
  };

  pio: pinctrl@1000b000 {
    [...]
    reg = <0 0x1000b000 0 0x1000>;
    mediatek,pctl-regmap = <&syscfg_pctl>;
    [...]
  }

With the paris-based driver, mt8167.dtsi changes as follows:

  pio: pinctrl@10005000 {
    [...]
    reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
    reg-names = "base", "eint";
    [...]
  }

After this change, the dtsi compiler rightly complains that the pio name is
used for two different nodes.

I am evaluating the following options:

1. I could edit the mt8516.dtsi to change its address in the name too and it
_should_ still work, but I don't have a mt8516 board to actually test it.
This however causes some dtbs warnings as the mediatek,pctl-regmap entry is
not allowed by the paris driver. Cleaning the documentation would be tricky.

2. I could use /delete-node/ in mt8167 to remove the entry coming from mt8516.
Ugly but does the job.

3. I could break the dependency of mt8167 from mt8516, this would mean
duplicating some dts nodes but might be cleaner in the end. Still it's
useful to know that those two SoC are mostly the same.

4. Lastly, I could migrate mt8516 to the paris driver too. With no board
to test it and no datasheet however that's a bit risky.

Do you have any suggestion or preference?

Also, one last small question re: documentation. Would it be better to create
a separate yaml file for this pinctrl or to add a compatible to one of the
existing ones? I am looking at mt6795-pinctrl in particular.

Thanks for your help!

