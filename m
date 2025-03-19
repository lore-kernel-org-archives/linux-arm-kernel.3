Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74171C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 07:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiAfj4IElgBqEg5+PLChSU4IpIj1nxRfVkLGRm2D6Bk=; b=xgFTnOIhuXsw6Lrxxybl6Zuvwq
	QaTwVFdZr/ArMvHL74fWw9T4HBms9W1xTjZ+PNtmmNsneXrnfpLPTCndlqjznxf9yd+JRT4wkrKjF
	1i3tP+VgpIik2lUPmW8HfuxlXEMlseIj8Y1DIJXYOPsS8IsW2lyWvsQS+V7nu6hqJ7XnI8iPXSZIA
	34a5lQIh0unZP26D1R2ytNfiQ9V5yk+Q0iXExIPzPweUpcJtte7dcAxThUR/OIefB4VzBwvhxCvbv
	ZvIb0LdhJ2ZHFkqGPk9NS/K+9Wk8ZP25exPeL4KHapusIJMWjIZV1rgmjFiu5dK4Au2bvyoyjnNuc
	ghtHDNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunVW-00000008BDo-3yWp;
	Wed, 19 Mar 2025 07:06:30 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunTp-00000008B5M-2JhV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 07:04:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso8327550a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742367885; x=1742972685; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiAfj4IElgBqEg5+PLChSU4IpIj1nxRfVkLGRm2D6Bk=;
        b=bx+eS7O5im8tQbqqdgrMl2IRmMXhv1i3EKdaK2ay2oiVe7xpmb81m+uA8xh0PdQV6+
         FQacR6oEuorKQa4J5GY3+ozb1zplmqv3HzlVzihVl1XnOFezr2yzk6vP75GmMxn0VmT6
         yYMFYuqlJddo92gxo5FNH8GFo48pbpKW7k4XEvJ0B2RbiyJb7ldQJ6I/VlfS4WnVKuQB
         1VJA4LsYqia3JkY0UHMFxwwG1rSM/E4//63MptTOUTJy6Y13z/DgXxU/11/Bm2WY9y2+
         77mdxMVIkYqAYNgkOCmfevKE+5yCFca3a/G+ysE+X3t0+xYvWYR67rnbvUYmPyPVx7s+
         8Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367885; x=1742972685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiAfj4IElgBqEg5+PLChSU4IpIj1nxRfVkLGRm2D6Bk=;
        b=G6ZRDRXaJ7NWOXPQHqI9gLZJpk6sQJCtaVvmjthXG5gkoeC3Nz2qfw5ZMqmu4AcOrW
         ayF81G5Uabtc+GpEy7ssfnX1AlrC8zGkuOTq9Q8UNyX+e8WZPL8jGpPTkwnmgXKUc3TA
         5+TzufU9MMptLI0nZ7JLTOn/Ro64DtuJIbfB8dZrWxmvOOgdeAJdYNY1gwvLX7BoFs9f
         p41t14tsQ9s3NPoGBmq6Jpj0mJNga1aqzkm1o7EKnhe2ff980M5B0B4DgrsFCs2YSnDw
         PPmDvHCyL9ucIlTbTNmJQLeV1A6fcQix7WJaeV5FCYxdzsP2x1JxIkp3KAWzGXpeYlvO
         MkXA==
X-Forwarded-Encrypted: i=1; AJvYcCWtvnUDpyP6pF2rG9cOkVmfEhp3h4zaJq3zo0dq0pnvyBvIWt9/lG3lh1Dz5KX2lG+iVcnB8GZu6YQwO4UmNs+5@lists.infradead.org
X-Gm-Message-State: AOJu0YwH/IAl4u/9D4Q7WaVFw4aCUHbERLE1KWJ0fvcTi6R5xQtDI8Sh
	7bZEjl5KEmdQmjwWCkORLmHFwzgrLYS3MmN0ppSU/hEIMIsq30PPdNguKsJVDCwKUNA0wbPNY0a
	NfdZdh52jG55LNjSSXsHvu+muPgc=
X-Gm-Gg: ASbGncshHi1meZjmXHEfqL5Om86pOb/gyZCvi6DER+xhH/I9gtwD5rBFrGN8sbF1nky
	RTIjoA37G9zntAxN+bWIY/vXSMMT2K6x4CSn1wlmNDec4bIylgb0yz5LHXQg80lB7ew9kDV3Dax
	zGURI1nS9NtLhJc23OGoZqOtM=
X-Google-Smtp-Source: AGHT+IF7sF+rEHN+McOd/gdhxtrQC1m+FhYZvpf4dWKwkOdb9hKSjw3U2gTtL2CCTwVJ/KBH2mS5pciMbrLsv3G0xEU=
X-Received: by 2002:a17:90b:4c4e:b0:2ee:d193:f3d5 with SMTP id
 98e67ed59e1d1-301bde41b97mr2645278a91.7.1742367884632; Wed, 19 Mar 2025
 00:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com> <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
 <CAEnQRZBmYdLh29ha1FKz8=CbxjFBFFTgDkjrEmwTxW2WcxodfA@mail.gmail.com> <ca734f66-593f-4e7c-bc76-e343a7eb88d7@roeck-us.net>
In-Reply-To: <ca734f66-593f-4e7c-bc76-e343a7eb88d7@roeck-us.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Mar 2025 09:06:17 +0200
X-Gm-Features: AQ5f1JqTh1OKvsFHXWbBK7NlMP4RU0DewPez1R29Ybz774cJu_EpcSsA7szRxbU
Message-ID: <CAEnQRZDf_ko2p50EwR6q=dfkwdqE=c7fZe0jO2JdSmbaDa=j3Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_000445_610666_D4588550 
X-CRM114-Status: GOOD (  17.94  )
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

> >> Is it necessary to make 'pwms' mandatory ? The current code works
> >> just fine with defaults.
> >
> > The code adding OF support is added just in the next patch, so the
> > current code isn't event
> > probed when trying to use dts.
> >
> > Or am I missing something?
> >
>
> The patch introducing devicetree support to the driver doesn't evaluate
> the pwm property. That makes it quite obvious that, from driver perspective,
> it isn't needed. I don't immediately see why it would add value to _force_
> users to provide pwm frequency, polarity, and the output configuration
> if the defaults work just fine.
>


Got your point now! Thanks.

