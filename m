Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC97C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=; b=k1SCg1nAiP4Hy086mvJ9n6t+pj
	MlUmI/cEC2lGrNVsyZRoyqP9PQHzf7YRxV4xJ/MrdqxtNk5zyyrz06ir4dFrisoL/0oOId7bDBcyT
	pczMkB/EzjyuMHtcDJqs1CZMLdTfUcCYKBKs3f20aqH0ddPCS/MkyGvnYbnlmdnkCtiueyf24bqNb
	Iohq7wbvKMKiaa+W1GQpemwLXdcMd2JNkVWkphGA+VuhI8EIdsV/ZLD3dDfYY88Ket5MgUcN2dBAy
	bZdeIHvNC4LGLv53Xjra0I6GvPFryXQ6AF6VUdu/koZqud5wEKbeUasM+VQxIdnoKXuhq1Pl6e0QL
	ckZ7mI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgiq-0000000CyIq-3R4O;
	Wed, 22 Jul 2026 23:51:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgio-0000000CyIT-0NFd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:51:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cf452def93so85625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784764288; x=1785369088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=;
        b=IHZnHszRtuQOViijGtojqDIhWITmSOJqgtddz0igIFIlB2LWZkiFRY4sVZaYhK9LIW
         I2NW7GoGEWywaeGsv6R4b/AyiTUOMpNuMhiNSHgtLLxcqnhJUzhZcwGpCs5SI2P6m+n/
         trMA28hSTumSENgow7A68mMhLTYW/k06RN+nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764288; x=1785369088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/owFfuQW7essVnvkb7c0YaK3a70SCLv8tN9SvYhKU00=;
        b=LLW/Abh0GdSw9LmXvENk7R+L2XiJs+uXoOsdjz2et2FtUGcjw92yPpnUVgsY+n31BR
         w+CQgDYF7jobr4vbPbEt4MMy2OAcfRD3LROPd+hI5G3KXxTf4ymQOo9yojBwr54juGPS
         wygo/yr5du4W3BZ/hBVPTAOoRATOa09mwAOyKSdS3QSeJk2fyNk7PeNXYjbZg3SqzeKa
         0dMQsUo77/VO98dsjHOCXn+/JkyeXkgBmeax35YVN/1RtwENWNdmeDBLE4JPFZ/Uo6XB
         f2WYfuppYLKD6vesKuuFJlkYm3P6X3qZ9VqvRH77gkEAA4kLTmTKOGSObCdZ3OzPC9ui
         cdsw==
X-Forwarded-Encrypted: i=1; AHgh+RporK0QevzNsKqqbpuC9QVc9IH37h0+urG7PrDEhFnAHPqmwf8uBDlkC837uDXCj7ErD21+cFLNUAQ421ktJO76@lists.infradead.org
X-Gm-Message-State: AOJu0Yysz8hQZAgZI/vIkVfPLjlIPM6pi9xoNWNjtzAJdXqI2S2T8Bi/
	Z0qTABBSKRXnTRAIfN4j4Dc/ThvZ8+/bcRwsI7oT+4rD6zQtI3JHM2u1AI9lehRwbw==
X-Gm-Gg: AR+sD10xPcWgS5A2lCFn8UpoPb3W6udrCgIBWtOGX0LQdZ2uAL/joGz8wgV1+Ito+jg
	f6J0RWciAFsr/5Xl69EYvPpZcQhIySRn2W/lBHtBv2jywxQI4V2WCTwnsI4h5WJ7oJkGgTMHEzW
	J4MdD50m29mZ9FUJ2zV06fcv+cdc10QeM+uRCBLeWdk6j3sWDrRnldiv/P/VRWU6sfDNPNkhiJF
	QHggLSy6q7fuj7XIQat6hY/zsjsYAMSDskGmGTfl41XHOIbDzMWyQOa7NwbePtwjxRna/Gy4S/k
	eW/4J5/KQ/x75tpohgpY5pPxMLAs7la2SxgtTr9dLT2CCqpJ9JGoqfV1pIXaqHa0PXd3LcG+6bm
	ayRjhI4UjgFQYJBDtyt9QhGHJROU6GlFircxIGX3MJfd2pY5wcpHTQw9zmsdSRe64ymSyvCtXVy
	wmE0iqccsjkqHy4DucxE3QdHeX+NeNBR15GsrQy8PGS5kcnClkvas=
X-Received: by 2002:a05:6a20:6a26:b0:3c4:2f75:719 with SMTP id adf61e73a8af0-3c44cd1de09mr386413637.37.1784764288427;
        Wed, 22 Jul 2026 16:51:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:f3fd:a899:78ad:64d4])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3147e07000fsm25313445eec.21.2026.07.22.16.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 16:51:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:51:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>,
	William McVicker <willmcvicker@google.com>, kernel-team@android.com
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for
 frankel/blazer/mustang
Message-ID: <amFXfFFSGfqReFWO@google.com>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_165130_511982_80BA0C54 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Peter,

On Wed, Jul 22, 2026 at 10:55:55AM +0100, Peter Griffin wrote:
> diff --git a/arch/arm64/boot/dts/google/lga-pixel-common.dtsi b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi
> new file mode 100644
> index 000000000000..57c318ab44c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi

> +	aliases {
> +		serial0 = "/soc@0/serial@db62000";	/* &lsion_cli16_uart */
> +		ufs0 = "/ufs-placeholder";		/* &ufs - TODO "/soc@0/ufs@3c400000" */

I'm going to go out on a limb here and guess that these aliases are
being spelled literally (with comments pointing at their label) because
they used to be formed as overlays (where the label won't resolve
properly, I expect?).

Do we still want to spell it this way? This looks generally nicer, and
won't need an update when we get a real ufs node:

		serial0 = &lsion_cli16_uart;
		ufs0 = &ufs;

IMO, we can cross the overlay bridge when we come to it.

Brian

> +	};

