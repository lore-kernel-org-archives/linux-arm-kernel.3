Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1897C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 23:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q1f6Ouy7hbjx9qckWIFtBppIrqabDs5gJ+JKIQOaiQ=; b=fL7wZiUtFe9ITYr6K2JrFTJHn4
	zpPgQi0/M2rILkqHV6DR2BQkIhIy+SRnLVQ4Om9ZxlMIlkBG+ATgWDvigYaeLfMo/qe1hGFxvqeT/
	SxqcPxSSOCROS0jJEq1cTUHvhgZTByH/iXt3OwLpxzne6cxSScV+FwFO/XYEfTO7eyeFXiDKype3E
	ys2ArqmRIR/4Gl2egtXH4WHVFi+r27vCQHFPlJQ0LzdDBnVmhY2umld5DXePglPfOG2yQtLpMnq0E
	KmNrs/N6Gj55M4wwLQr/epG+N1Wj7QdpOPcIDLm221/zcgVN76AVpfgpB7wQEpWEJ2svNXVU4WKbU
	EiuVDXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6g8-00000009mzX-0qT9;
	Wed, 02 Jul 2025 23:15:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6dn-00000009ms6-0ZpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 23:13:24 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7494999de5cso5539609b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751498002; x=1752102802; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5q1f6Ouy7hbjx9qckWIFtBppIrqabDs5gJ+JKIQOaiQ=;
        b=cSL0hAyWjRub9uHcQ1Y2kzplhRllX7FzSSWAWsnMWCo9fQ1k+F1nhRxZCzz2xlcab+
         ysCIBnkLUk6JJBaIpkzHjCjlJ7vNfThh8KF1jkltU+pfcxn8xxIlK+Z2jtSqwChpbBY8
         hEwib57k0oACY14U0Vqo28IuK8x63IGcOhoVTMhF0XowYsC5YcUg5hfzHWDys6JzzBvl
         x0vrT5ofMy1rbvyHKCDJ6kS8PfU5RMtcFUdYGGYwEt1OYqE1r8jC7biEnYaLBsi1mOxZ
         R7XJj28iCq7IRnxJYGImJBElDbW4zPdCHiykE0rTZLDddtayQ/mJ2PJw3vMH42v+kQ0Z
         /hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751498002; x=1752102802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q1f6Ouy7hbjx9qckWIFtBppIrqabDs5gJ+JKIQOaiQ=;
        b=rY5wI7rBWm+ZE9BpFYKzSWvJ4yb/jkgXNK9/uqgM3gMwdhkL8C01EP65BPz6cCMRzG
         btIrcXTiMxqz/fmNfPzyLM0BXPC4nREl1kd0JBm3Tbe28YNt43ziF3sXbr2EOofZd4hH
         Xj1G/NY+cZ5fe8Ar4rkSzoY/427ru4ZTbQAjjYnty6TNA3aApq0ZtaO4W548qpRmYR/a
         nhmW5OHmhU9VV39TsoC19vKB3dap30+ob7SjbUZyW5LWHwNPnrsMyjM1eMUf4eS4oP6/
         dUqrWcrrA7ohCm/vi3NhYVRZhpNa00jtldOdB8m6oI3YNJkCvrmwVDon39ltIQWWvulg
         6Rvg==
X-Forwarded-Encrypted: i=1; AJvYcCWK4dpKKR8L/QyWw8jPbnK4idlEvnHUL37PHBPkOslNHn7TI6RgpDd7YGHvUFdER2eTOh81jwLGJvaAtGoadMFH@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFDJN+qW3Y9HxZPXaKHR/oHzLQaMArBVnx+xM+Npzk3WAPkAJ
	bt5Q0sjN9zOTttNsU3yG90wJzGflmEI8s99MzCv3UQEf6jFLIgeocJGq
X-Gm-Gg: ASbGncsz2grUokzYGP9yMYCfLMCC6BU7WzRi/1nkbbjSdj0UC7MHm6vA+Woxu//+lCB
	y0qp3bPuXMt/JhPht8Bar/LEui+eLI4Y/jpKNbyCvGYsi6hYDveB+llrlfp81KFtoa/So+y2kIA
	5t+wE0aKACwgW22y+Egp47bTfHSfcTRq4P+QxT7vAtKDRvusu1HiqbLI6LdyFv8Q2i8tibvOEEO
	OgbPix/hhnq23d6BGvcFyPouAO2kt0cy/uiAgRFF0rI/TB6z+gV75PYuDZIzCdm5uhUdu6x0B+8
	atG43XI//SoLeN6DaloMTBixZ+/AF4ZvmZdykWwZD6RycTn4DWrWDGAwJQxmgEGQ7CWN4MxMa4R
	i1C8M+3+rProOXWvthwPpnFpv9FZVFvDg2NXllog=
X-Google-Smtp-Source: AGHT+IHle8eoISP2qCXEJoMWIftmhm95QoQXG95iollb4SH97ajP9LpfNKXbVUJ+LNamKOS8iN7+RA==
X-Received: by 2002:a05:6a21:32a4:b0:21f:50d9:dde with SMTP id adf61e73a8af0-222d7dcf414mr6544906637.5.1751498002261;
        Wed, 02 Jul 2025 16:13:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300994asm13788791a12.3.2025.07.02.16.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 16:13:21 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:13:19 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGW9D+xO1NaDodJX@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <34b0f5e2-0341-41cb-8915-8f1606e14827@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b0f5e2-0341-41cb-8915-8f1606e14827@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_161323_175259_9D7E2E35 
X-CRM114-Status: GOOD (  23.97  )
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

On Wed, Jul 02, 2025 at 09:50:56AM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2025 07:04, rentao.bupt@gmail.com wrote:
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > new file mode 100644
> > index 000000000000..f902230dada3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2021 Facebook Inc.
> > +
> > +/dts-v1/;
> > +
> > +#include "ast2600-facebook-netbmc-common.dtsi"
> > +
> > +/ {
> > +	model = "Facebook Darwin BMC";
> > +	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for the detailed instructions, and I can see the warnings from
my side now. I'm working on the fix, and will try to send out v2 by this
week.


Thanks,

Tao

