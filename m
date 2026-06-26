Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C267CC43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJMulB6FHoz3UwRU2js2Yx9wDg7dc99Kfk97uaLSZ70=; b=rmiNJzbMKtbVgF3cjv2G/Qxtv5
	5sEFP+JfLOeItrsd8p29cQqJ6E0yzzP86fMXu2BbZSJQyiDicncFGLhInQ6EGQx5F4QiWWOv/KiaD
	P3dKnVkgptHU404K/p1hbtDpZaTiXVAnWACm/AbFKkGbdAGRLbmFxIbJU1HV8xXD6TiKVGceln4Ij
	L8Zz+8dR6wKJslS2Ek9KRRUs2SCfDFXbGqxKPKx5BjSaGFitOQETUSCVDhZ/+Mt66wm9T0MRjWujW
	pXBLaU8w8GqknPvZANycnfs5M4vGeP0WWGqnfCVghDnuT60z6yssuArlB9ZWwZZ8exTRFIW779P9o
	W/i29xAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9zz-0000000BfuO-04Uh;
	Fri, 26 Jun 2026 17:05:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9zu-0000000BftG-3gcO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 17:05:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so11841775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782493544; x=1783098344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJMulB6FHoz3UwRU2js2Yx9wDg7dc99Kfk97uaLSZ70=;
        b=KB1F2FOY5quibFBr4w+EkgjFke2+QVRVzjBxSf0Gk48x01vIuxkjanuVhQo3qzeXCK
         vnn8Ha9aZa/OrYAmr1O3y3FbcTox4XyqWzt1n1oWKhbBH+dH/NMG3CECIw2oq03lRllq
         UktfEKIPxbYPD7+bstM5sEQxNLOdxUj6tayDLYTRB8/ThjYuVF211P+mp/oCbualGKU1
         Gfs34ArE/EMrKhVrl8AwZW2AqbsnPN2hqX2W4toUfeR1D7WHKvJh6K9gTjnVKCMRcdMS
         tzNpGBcVv+PQlVCCsMSMpaM3o69x8XZHS7U45/Agnl+LzejGgzR0xCg5bz9fuYBrI27m
         lDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493544; x=1783098344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJMulB6FHoz3UwRU2js2Yx9wDg7dc99Kfk97uaLSZ70=;
        b=Sxcym+9bj+MhqCAkOf1ACJRWVKflsdIQTJfsaxwGQzFKP+HFT0CvWIkpJg8e95gCqy
         t2fhFzp39eIiJS3AcFkfBgWDRwwhfcq9v7nzh0awHtccSCiTVgUVmoNh3N2sGOuUu1cJ
         x1Xpb68B1mRi70zDr6o0NoZIwKWXUy2kj6bqY3e4SlIMauJtDn8Cx9LncRrbf8GBAb7t
         pwuBM8DstWW2Q8gLHjuIMtj+HticCkdtubaw3F+1SE7ATqPcRSN4B/sbuJHzolTi6nln
         KI8vlUBa9v4ga3NGXTj0Spnnjzq2MdE0WzN/u6T7VabCFxlR7YaW6MYG8kT5d+Iy4VjG
         2IIw==
X-Forwarded-Encrypted: i=1; AFNElJ8G8AooHczxj9CIpea/5PRxzJ/zums+whxVd2EjRoNL7K+hMPoqDe+82Id79FUOipTBwtqz43kFkjFflAPOA3jl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywysix0xfDxCwuaoZjxxkpkvFQscIi7oN32gBhBnoLEBoGfXkwV
	EC+GLd/AwRyXL0AqcrUy6+oUlZnjPAnMBM7B8Y3f9+QZcaHh3Bfhqjett4yl3wlMHgA=
X-Gm-Gg: AfdE7clpGE7bpcs7MGHTYn/kkIU8d3tHQpnWylYvHKqAyxHNQRwv6zI1qGaA7DApav0
	TW2ZA2EQYPVE7GP44rH8f2lE6UyvVoAJB9AcEXo0y7YVcBeXGsQs7UjU0hBmJr7rT8jJVp0xjqS
	EBrY9nYBdQ3gYZYTwjctZa2ffdhE1ZypEg+WmIYe6P+jiep5X0uGUwqMrXRZqtJ0MKnf9h7W9Lv
	ecKxxbRo+n6De1z6JqF1sCEu7s1DiMsMbH1nKHd0tG88UuIieeOvTa8RNei/sa5ijZYzZDXl5UP
	O1qOGlR/KAfwQT/9AJdCh+7p6Tw+82RQ63syfeJm+DIm5aVjMAUFZnd+mdFj8NZmYaoOdjoCnFG
	L4ANle2ki4NGIvD65PTgdbjuby76b5r/wGfo2+E7N1K0ktKuKkKW2JFsHwcYTxwVXOnryilG68e
	SgHiGtOXWm0w==
X-Received: by 2002:a05:600c:3549:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-492668acc8cmr114223385e9.32.1782493544245;
        Fri, 26 Jun 2026 10:05:44 -0700 (PDT)
Received: from localhost ([195.94.150.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269009163sm100940205e9.11.2026.06.26.10.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 10:05:43 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 26 Jun 2026 19:09:08 +0200
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>, mbrugger@suse.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
Message-ID: <aj6yNJQZaQviXugB@apocalypse>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780670224.git.andrea.porta@suse.com>
 <5b167316-ed50-448c-aa05-6a041a6544d5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b167316-ed50-448c-aa05-6a041a6544d5@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_100546_932820_6671406E 
X-CRM114-Status: GOOD (  17.82  )
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

Hi Stan,

On 18:24 Fri 12 Jun     , Stanimir Varbanov wrote:
> 
> 
> On 6/12/26 5:01 PM, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > Add the devicetree binding documentation for the PWM
> > controller found in the Raspberry Pi RP1 chipset.
> > 
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > new file mode 100644
> > index 0000000000000..6f8461d0454f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raspberry Pi RP1 PWM controller
> > +
> > +maintainers:
> > +  - Naushir Patuck <naush@raspberrypi.com>
> 
> Could you add you or me as a maintainer as well. I'm not sure Naushir
> had agreed to maintain the bindings in mainline.
> 

Sure, will do.
Thanks,

Andrea

> ~Stan

