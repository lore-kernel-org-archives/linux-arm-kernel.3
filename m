Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F28C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPnQGbJY6qzXsG54dxOhAsZfcJwhZhWhqpOSIo2IWUY=; b=gBIfnXFoWWqyif56y8hk1JWima
	1Cg5w6T2RuDoRcaX6HnFcovSaks2EKoL9rPoKYX4Yqb4NiwiIAW8Mc9/OIucGO9Lb5nUG+gsxV2lD
	AXz1gAPuCy0YDx+iJbX5EW1MVn/99nANsH1bmx/P5iK0zb9rPBo37pcquotOG0P+sw4YEHEx8T7cU
	3ykNGUyLC8xdQbeO8OeAWxPkMufk3kqO1KVZZwkxICkl3GddLV5zSSFVFdCYFlVON3EYCXR7jtGUN
	rjV1GM1/EmrZFK7yBWlbW1Ok+8jlBAg+6hzrtT/dmPG5FMffwI2lZK8pDxeHVcLfoJGXMlGw2+6LK
	wg4ZX1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN2l-00000003cT2-0s4W;
	Fri, 09 May 2025 12:41:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM1N-00000003Rsn-395M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:36:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-440668acbf3so726995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746790564; x=1747395364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tPnQGbJY6qzXsG54dxOhAsZfcJwhZhWhqpOSIo2IWUY=;
        b=gaVqKhQ4AEKkPrZH22N95rZ1xymdt5i8rdEa+4Hl+UZNo0D2QN0/mwWv82+T4eTotO
         3m8JzUqoHXAx1z4XgJtQmpaj7OvnngKeC2mAU0P33nkkum3+CkUXMR6lxqc9CsatYl1R
         5vs5+GLdSuzI430IA93biTTxOERv8yvgc5kkwiO/rRg1QS7cser/X72097cL68ViDAQa
         Jc2enAxcytHBeuQCVGmMCk/xJibJMY3KjOWXuPmw8YUKimqFlhY9n57M934CSZG8mIMp
         /b+4sVzTJw/yTLlN69uAxy1CriDbBtgHKXUJMMzUqsc/vntdxba/DWGJ7V7K3Z+n3+44
         QHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790564; x=1747395364;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPnQGbJY6qzXsG54dxOhAsZfcJwhZhWhqpOSIo2IWUY=;
        b=QKKistAju3gHgaKByy3vYsqrQUw8/eSKKMo1lA4djZOqeZpMnpa4cxd1QyrbvTJSbC
         Xa9Hm0TjR4NiB0S3wbtNK/zsezfZxIVcLkp9xdOyEy+50NJC9s+SxkeTO2rDnQKZKXcD
         o+MfEIdwe9jVps7dlI9OeCm/KGmAQGBhkzR6qGgR61JewkYumTKTHKm5Fwk4PRQjFLz7
         hRPOYK/arcqGbASnq7+1QaA95ESnilQTmgaGRAhFn3FOLxUoiL8aSMoo+nbaXY3TNcXN
         WbBvZcU0Pjo/TqQOeEeyl9JIylJPIT+frp9xyZfRxYUOpV9DZCJvMa/LFxRjEXWVkOp9
         oKvg==
X-Gm-Message-State: AOJu0YyNbQoW6tAAXtLRz8OvYxZz4spmoDGztjpdiRCY2iMPzbc7yWLA
	Yiiuf2PHDh55JalT3A63gZi1M/24jN19l/DT2b/bi3DwSPdG1UOHHFxglmocYV/R7qO3Y0O3Rwq
	B
X-Gm-Gg: ASbGncuX8RxBiINireXNV1WifxTqyi2KdygbKj3SLkrFi0EtNqLGQ+Ovq3BLbzAZheI
	oq0yMWSd5L9cXA9+xNpbGyTOXjaLAfhhjL4RZn0Wi/sUtDj3/RZZW5s2MObItBe3vGaVq+Wa7Rz
	mwuyZM/Vg35w4x2bG0zh00OHCeyMoKlwusRh1KpI8oBtdevrXJEertklywYhmoAJWXUtDSG4I3f
	ZvdepCjGLrQxky5MNQiCDQNW0YORPziA2FQOClPOIlXKHdTPb+MnmbOT1Ml3ygObWpXn/nFn5Po
	4IE1ciB438fNIqkgAuBvF+4C42Om6Q8m4oRA4Z3YuzIKnZDgHKEbOKLvxPg=
X-Google-Smtp-Source: AGHT+IEgrPuM7S4VVAaNtLdBoJxKXTA/1M96VqclVtrFn/BtmxjJuTsUGVTrZ8ByY2d+iylVicPD5A==
X-Received: by 2002:a05:600c:5118:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-442d6dc560cmr7713535e9.5.1746790564255;
        Fri, 09 May 2025 04:36:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm69392795e9.15.2025.05.09.04.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:36:03 -0700 (PDT)
Message-ID: <4f7b44f0-128c-4615-96cf-2d9d8bc54cdb@linaro.org>
Date: Fri, 9 May 2025 13:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASPEED: bmc: Add device tree for Meta(Facebook) Clemente
 compute-tray.
To: leo.jt.wang@gmail.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, keescook@chromium.org, tony.luck@intel.com,
 gpiccoli@igalia.com, geert+renesas@glider.be, magnus.damm@gmail.com,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, george.kw.lee@fii-foxconn.com,
 leo.jt.wang@fii-foxconn.com
References: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_043605_794409_A1E8C624 
X-CRM114-Status: GOOD (  11.81  )
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

On 09/05/2025 10:59, leo.jt.wang@gmail.com wrote:
> From: Leo Wang <leo.jt.wang@fii-foxconn.com>
> 
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.


...

> +&io_expander13 {
> +	gpio-line-names =
> +		"rmc_en_dc_pwr_on","",
> +		"","",
> +		"","",
> +		"","",
> +		"leak_config_0","leak_config_1",
> +		"leak_config_2","leak_config_3",
> +		"mfg_led_test_mode_l","small_leak_err_inj",
> +		"large_leak_err_inj","";
> +};
> \ No newline at end of file

You have patch warning.

Best regards,
Krzysztof

