Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C3C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZNjlC/+ZO9O6oGCVqCRDGRskcv8+56l0c98g5Ml19Y=; b=WyJhpOvxYIK9TBZRi1LOFmJaoF
	I3j9zjtExVAmKSm+BPbaKAVFOMlkxVO15zIL1r5NIV0LlZDblx1m6mJrgm0BKh4CHMqIC54QAI5jX
	+BxPhPc7WwiBPsNOa78vPCikpUpVQzt+Pght5748alBkgHOHHhhKaGoOUQegyRtLOnbUJZ0Hdo+X4
	Yb5VNVzHUol0I0espcdXkNObl/gKYXiBa22c6nwh6QyOUiU1u2ov8LU/3f93cxRhwCa65N3xFwYOc
	x6yKPDC48X2cKK2AmekdEfVZw6tvimwZTHj31MSERCMdg93ecORc0461XLuxbhbJ67F07FCO4mFb6
	3fQiuXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Y0-00000005WaR-3C2E;
	Tue, 22 Sep 2026 13:28:36 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Xx-00000005WYZ-3lp5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:28:35 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so21728225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083712; x=1790688512; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lZNjlC/+ZO9O6oGCVqCRDGRskcv8+56l0c98g5Ml19Y=;
        b=DtSzcZHisYK0Mm+H2WRhO2KZ0TGfMpeQV1pBi19pg/runP7Mih+o188ggbMLms+ZuZ
         HP+CxYOOHf53F+aEQT+yiNzGCL9wTDCM/wTzi2GDpsZhnP3bCGirtI7gzxK6fLnMPtpL
         pnW70yflvgzdjO4qmlX/CMjYSkVZEw0EqVJw7lpGIVTSfIFNsTWwhpghe2Tuz7Mo+odv
         ZUIBNbQhyk7j/capdOVwUYo4DRFypYGXbTuA76Z+UOAkWIS3+0/v/1Y7KY32vu17cY4w
         A0UajwPrqaczN8EPCBx5EhkV/xxAyUfAYKaBHN7jMfX66AJEOpW9ek0lynNM4rAZgj7k
         xIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083712; x=1790688512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZNjlC/+ZO9O6oGCVqCRDGRskcv8+56l0c98g5Ml19Y=;
        b=KmaTIYLNlcu1b+rwGml8HzUG3YtrcYEjNXn7CnoH12bsGFGGeb6iYiq2OJjkI+O6Yb
         ykgT8yvn6e84aaXqObKtbRVetvlsKNMwxh14orBdrMa1KQAdaQ8scxFVIYfqMslZNOCC
         cfBOUsw70dPBGe9Bcu/T9A2lnI5GQMKVGPwVEuw1HtlzVq/b+XG4rHrdtyroNfu2mWuD
         LDZIlcSzR/pYc0sjN5s1jd5D86tB+ugaWNfPtkvS5trNlAq5wjh5VBU6If5cpBh6OeEH
         8GFqTv/UnTAiDDCLefJSdfSBscXusbOrDH3eikgB+UOiDx6luHMGmQA5r9E6NtS/+arM
         7/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzDFleibnRh2P01NTqTHBZlzl7Bhj78h8RauHOle+L9s8F5WwAdxWjk+JVI15RrJ8JuLiTFJ//qwhkH5IQNLS+s@lists.infradead.org
X-Gm-Message-State: AFuF++mWarg6fO3Wl7lkpmGU7CG4LF01A8AZQ35YpHJQzKbEJhC/qoSI
	L1Jd+ujwV2GsczuxEcOhKpnMikDPKJ44CJeHKQJdcmyueMlTG2VsCh1158jBMWn9RVE=
X-Gm-Gg: AYBFou0PrQ/Q+Z+pqpM5vEbAeMAZtPTZuCGXCwthgDt5gjLfhaClGrIXnthdVszArMd
	jdws9D+eRHOvFsjvWpum/jX63cej31dusNNnkvbOWbz05xNqVGIbNZkj/us+rbFlwW7QmRZj6mj
	Ju7XL4tzNjARFDNRlovpNrp1rklHeQ7+QmHnVIq79AiYkZSd37qglMJamer8yOUHcEKut01dT6W
	y4QO7/TK79HM+z776CpO9OYmgEw+Mm9BRl28EK3ViDCu+7i32+4VWwWF9SfNUN28zLRFwXu1ei9
	z+CrtWFZQYEb89p7p6zBZONJ3dEIaKZ2x0wxk+jhOfKXH7gIWo4lSSZ0Ir8Q1aUbEPmq3ERLn54
	SiToWgthLUbHhN2gtCsyk14NJ8MgUU1gBFJTwFJbEjCJ/48A8hjXIuOxjtAlIMpQP6N/LVSXrdj
	Fpi3cWJa6gdTHdTUCiCow6SBm5EEfCVwv9KxXUUaQ6fvurQq3rUAvH399J68aKFBXoU/y1xC9Wq
	/LZNd0vqcVcsag=
X-Received: by 2002:a05:600c:314a:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fce730865mr142999245e9.35.1790083712062;
        Tue, 22 Sep 2026 06:28:32 -0700 (PDT)
Received: from white-mocha.local ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ce2623sm98226175e9.13.2026.09.22.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:28:30 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
 billy_tsai@aspeedtech.com, andrew@lunn.ch, tan.siewert@9elements.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 15:28:19 +0200
Message-Id: <179008369971.83584.9572254757332285883.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790083701; l=1759;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=xCUiIr5EskgNmS8vCVmRU0QGH9yOZ9MWRCiiIOcxeqo=;
 b=ULILOtcbZnS4GYuH+KUA3n6tP0aNNnEcrdkLC88RnSQcm8yJEzrtKY85Upx9eCV9NuLq05VSE
 ISHdQHepC1gB+65oLajN7pZjrTmD2SUiJrvhRvKx2j57FFgFm8qPNJC
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_062833_969075_8CF7C8FF 
X-CRM114-Status: GOOD (  14.31  )
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

> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console,
> GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> connected to an RTL8211F Ethernet PHY.
> 
> Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> 
> Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>

*snip*

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..a4e384588a54
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

*snip*

> +&gpio0 {
> +	gpio-line-names =
> +		/* A0-A7 */	"","","","","","","","",
> +		/* B0-B7 */	"","","","","","","","",
> +		/* C0-C7 */	"","","","","","","","",
> +		/* D0-D7 */	"","","","","","","","",
> +		/* E0-E7 */	"","","","","","","","",
> +		/* F0-F7 */	"","","","","","","","",
> +		/* G0-G7 */	"","","","","","","","",
> +		/* H0-H7 */	"","","","","","","","",
> +		/* I0-I7 */	"","","","","","","","",
> +		/* J0-J7 */	"","","","","","","","",
> +		/* K0-K7 */	"","","","","","","","",
> +		/* L0-L7 */	"","","","","","","","",
> +		/* M0-M7 */	"","","","","","","","",
> +		/* N0-N7 */	"","","","","","","","",
> +		/* O0-O7 */	"","","","","","","","",
> +		/* P0-P7 */	"button-reset-n","control-reset-n",
> +		"button-power-n","control-power-n",
> +		"button-nmi-n","control-nmi-n",
> +		"","",

Nit: indentation.

Other than that:

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>

