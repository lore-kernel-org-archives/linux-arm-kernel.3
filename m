Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62757C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=; b=TREbT2C8j8bXC2+P/ZAWC43pdB
	shDBKW8F0iqhSZNNPkTsTLJpZgZolx1AWD5g5VmOaTDyPkLrdVeFqJHPu6HkPoumKLE0V/LQDsUMR
	6oDVKdb6s4agPSs+k0PVzpRIpvGdUM5acSCOnz0krqraVTaQEJqHTra63rqYG26T1KGO65oxoVd2S
	wiRlFA2CupKpjcwI3K6ED/FF6lU1V5CVRTs3YFbKcu5vkLTpGLwQap47zGHha8r/o7A2w02LcRDfE
	lIHSro1Il3zuWMCNPq+z/q9j71r71PXLMiXzH9zccc0eJ4YU24h8VjXk63WZZIzIhKMSbInQCSBYY
	tfrQ7Fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiFs-0000000CwIa-3ikm;
	Tue, 14 Jul 2026 18:53:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiFj-0000000CwFb-3vxt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 18:53:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493f75f7172so30905225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055190; x=1784659990; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
        b=LNNK/WUSanK1A5bl9s/6Fid/LyGse1gjRIzGxh4Rx3ZKCIQDm20DYDtfCXCXoizsXs
         JOmVqfV45ZPq5MO7wFbFSpAIdCfg3aVYHrCFFoo5D35Hdyn+1b7NWtne02DfKVx+KAsK
         gGFOEo/4w2ZYBMNSObytp8JxGWsbwlAFaD4VLpia09ZyP03THfDcmzDiRjHY/XJjH7Vq
         nho/4hdKMe2CIR7fySdw/qDcrkgcvkXfclMnE8pqfU+4jdISBJdfOH9cAGnfXlwp/AMg
         9QYcl8G6kiPxVoNsIUBgOkKdYJx45ueUIDK5EMylhSj6uqJ3F8b1HVFpY7Wxm/AO7THK
         /+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055190; x=1784659990;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
        b=UEbczQgd/bj4U2wtQUV5hu3a0VycbXNtFgFfdrVXXMzvnzfJuF7HhF88ZiW/ApHw3r
         yGeq5XAsKoiXyra5efzWKkTKMonaSX1EAt6U0VBvuvLhgoIP0IFBAu7wRbv2yrObyi3t
         OgY5Jrt1WUDijlE0BVbLWDLr3XIsR4Q3CZqPt+jR5k+kQ6pK/2+sKj4Xy6iif0OVN2Bx
         70/TzW4WoN0ARQWZjVnBHLhD10HKXDztvjS0+KVgmzEnHm9uNW+hYzonOckSu2QtHU49
         dGOBuND0fZmeYpGJlZV3w04+SDOejj5wfGHvo2AXG1E7s189gmkl3dCkadtm/o3PuuW5
         ZiKw==
X-Forwarded-Encrypted: i=1; AHgh+Rro2Qi4shQWYuy1RiDYVF9ixP1dJOwAuPZfVI34oe7zlJT8i6blQjE8AUyOnsaaEcJ4rihHdQQaEwzGEbPOCV2h@lists.infradead.org
X-Gm-Message-State: AOJu0YwYjhf0VXpbcuJ8Yw1vITGzOUyzO4mCVBOrMpxip79+nfgB85hu
	Volfdh2FdpiAuJqwPWjbHMQg0WEaPY0ZYkEsvUozHfnYyY74NFWVHWCfkziQrug3u7w=
X-Gm-Gg: AfdE7cnOPKdmxS3vM0XtOBtoaoLJgr5TJmdj2aOuUs0+Xz3CmhNCeMV1eULW5jUHG1o
	c1R4xg6DZYkoeSsgwGpoiHDrcDAwBaOzx8z9tj92zJar2NydtvWp2QUmDatKxTjo6lHnhuWcBXi
	9OjKgL+Mht0bILuMp+AAivuurUU5W4Yezi2mdqiVCBGl/PuRevFO6xhmuLjFwWL6iS7GGHC7kg/
	3nRCteshldZh+/LZ9ktaZ9nP5UuB1oLs+pg4ecTJnLZIJzdAHvXZvxaUlT8UNTKjC6QGfwCS3CK
	XuesWh7rH1L5H2vdxoYyzcKG3CT93AbwJp7vSU6GaQw3WFX7Jt1AHfP0QDqmFx4rkSsvzWYZGi1
	ESdBZEk1oNH4WqCCOkmqLV+vnEJj396NygcX0dprjnkNHUQAlnjiwtv9pmnZKorbOa/tiJSKMuU
	GbvL/5l+hBLqN3aDpXA5zHviLzeikiKw==
X-Received: by 2002:a05:600c:6048:b0:493:e404:3727 with SMTP id 5b1f17b1804b1-4953c27b338mr384505e9.23.1784055190102;
        Tue, 14 Jul 2026 11:53:10 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:09 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518338.194693.4399160180155776340.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=799;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=cSCbnH1xPXdFvXoeIkjlw6q74tyyx6jthYZF2YqxS6Q=;
 b=mkm+x2rfwdRTX6T+kPimO0xGU4ZCOBNQdoZdkNzfY3dX6Gjkg11WJUNKDAuKCKrynIBxtwo9X
 8eCoafR4SqRDuGXcQsnzwqL52BuI0qAQ9N5syq7ajzX3e5IrjjdojFC
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_115311_992677_9D1C526D 
X-CRM114-Status: GOOD (  11.35  )
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

> Use the ast2600 compatible string.
> Make it more precise and enable specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..7c02633f2bd6 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
>  
>  			vuart1: serial@1e787000 {
> -				compatible = "aspeed,ast2500-vuart";
> +				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

compatible = "aspeed,ast2500-vuart", "aspeed,ast2600-vuart";

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

