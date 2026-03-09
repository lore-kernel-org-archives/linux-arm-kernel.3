Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ECCFCA174
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=; b=soA7DJVELf/TVXh6Q6v9YIAXL3
	G4SeAauojtQM29NBGcgMN5u19aFRp54gotuDWKRVFiX1XAzlBO0/cj7sOEEce9cL9BY4MJqQkGZDk
	XegwtDPmnQ/8k0d0WSFm0AVeZ6Jb1fm8QPY3HVv9XfFzgmx+ifXhVGBl9i/BrHlSENMrGXUy78d7Y
	dBbYah2NjmiNT6Bzfu4ZDPnZjuHZytWG9kOb8e7P+ZcX+lZatKwYVpdENl9+zf9Bu2+/Afsh/fCqS
	wN3fUd5oWq65gxH9zFlAUVe/GYhqJbPM/s6BQs1xeMjhQkKvt1L6LOihA4BH4LCIJqXam5/oqbyfk
	m2bcAUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfY3-00000007vB2-3fin;
	Mon, 09 Mar 2026 18:41:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfY0-00000007vAW-1YJe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:41:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso6462832a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773081703; cv=none;
        d=google.com; s=arc-20240605;
        b=bo9UTp6X0QqrFyKlUvwdVZyVTznG9FiglwIOVV0zzfCoveNAsxMlkTn++d6gXHLhrX
         r3+ob+foONuKesq2cEfFimA/WLNWSqA1BtNRFoSYa1FfXVnf73MzGhgM+dA1M9b2ML0M
         /KXCugV0ynMTDE4YFjH35Gjtki28Ka0fZ8rwBS+lJJ7qtXUA5H3AMsxQauuvPXvj2laZ
         TYa8Y8JaEnmS0uyE6jkDs4B1bLOU0lL0wMVUHk0R2w6VLQE8LUNk41wstd6cWz5hKpdX
         R4KHqBpfinFbD5BIUwlW5aAS3uSEeclDOdJtlnL9Fa2r9JwPJYRC+sazK4Kx5Qcx0f6O
         WYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
        fh=GiDUKNNauROJ24k/w6/ss/AHQnTCc+2VccqJ/O/GTDo=;
        b=eP4azdY228iYti3u7+xcvSuC5MMKjJcW5dKbz8txJ+kTGAgDOGb4LBlrKx+mq3VJ8N
         BfKxzFj/9YcZkdIyL/M3bUGMmALW5AcRl9KqW/qLpbpOBS2mMWTD73NBDTSmnL0RZBq1
         0OnEbJYm7MydvQeGcsXrwKkoxyaR94O7X5tcjzQpJq37mpreGTUwLY1fgRF41WYVLUoI
         hMHLIlhBbNAV7Vr3EV6JgIYV+URIYi4JXv07oeioYY98JJYAEM7nXG9PCcgdP463+15H
         Ui38KZaeHP8kTmIbMkXNZRLs5WpBmx1DY/BGcjy0xP6lSOR6JFIdIySfIX7SfmkZaj9C
         xgxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081703; x=1773686503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
        b=JdRU7h8OR5a6KeBCS4OtfG5PHSr9GiTv8+C8y8UdDyvXWVWU0M016Sm/54wJxNXQnR
         +9+JhaaQpsAHflM1EHZb2/Y1YX8t2/EYPXqfAUbiXMzUynI30fS1bj5kipfhfPiKGBm1
         w2GHCMUGvzky9NHSp2ThPpXyvE2tFgEKYqAJgNTCGsWcpxeBvP2Mspy3ndqJc09gTC8w
         Zc+5Nfw82CnBEV8icfLF2OgQHm99ZCzAW0qNw+al0XYxG8oYpOuK+Z8WO3tqaDt8FDnY
         vvUcG06JEoVS6sZKDBcXaokLS3v2XgKKBStux1NaF9sJMzmYytYZNt/WImlohae7YykX
         YFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081703; x=1773686503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
        b=HkiKFnk13Fj8P2XKGrS0dpHkanjbllZ0jnmOZ8pr2fGLmzlWg2qJfr8YRPRZ0NvHTG
         lsgX7odB0vENn+m1kAl+cJzJp/FxHNc293d4Tf+UvpRmP7QRyEGFf2NVTjJFkn1kq5/9
         Hp1/0A6tqUacp0yT+/RGD52AyfF7eVkldttLT7+L/HK2ENY17BOvfrqfYyif1rqfeZ7e
         9zbv31BPwSXoYFeSgTe0ghU68l4jOZo8QjjlCxKTVcX99rM/tYW8oXisBdxo5paYnkGD
         +qkYcKG9/GnrlGMvzzbi1kGKoIVtr7RVtXMVGURuAuPRloy9bZVaKtimD09xsSJ35puz
         ZGAw==
X-Forwarded-Encrypted: i=1; AJvYcCV0u46muYgUQZdAgiW4Eue6iZ9b1AQl2qTQ7MXtLJl3kO7mOjxnRTBDsIpY2/8j7BhBMCCld/T5Z8GXylbBTTH4@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3eMkMWI3HhCWUII+qvWBl6o9DksEe9aQGozPLRXeCWAnQwS1
	k96hUdwGmM1G8mxpc20rt6ywt4h6qjXEVVB49S7voHt9QhTp6x51qdIkLyAIc0zcNTeG2rB6yKa
	wrZvrs8SQudJJMOvglCbJKsKkTSNUJj4=
X-Gm-Gg: ATEYQzwZgs84paypsFJ040TqQ84gYxx+4pFgE+qVYNjIxitPlD09Sm3TPggqe9sSpl1
	/fPZ3KPhp2W0ulXF4WK5dRuQ0qfFw+za+QgHJ6fDddse+PD+Dhft8saINRukz1EnXqKIoZtg6TL
	2aGRTHZXr8Okfs9JzlOjp7F1E3G4s/iDRllTNx4klr7Q4xp3f9duDB8w99UdF/WbMo3kv3m3XOq
	UrS5B6LBwUclEASmJIHGJjEzsGkqRkeyH9Ij2VeeV+0tVjyM+mJlGTRgAMLg19NAYucr6XnBXnO
	w2YN
X-Received: by 2002:a17:90b:164a:b0:356:2fc5:30f5 with SMTP id
 98e67ed59e1d1-359be2b927cmr11377904a91.13.1773081703130; Mon, 09 Mar 2026
 11:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
 <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com> <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
In-Reply-To: <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 9 Mar 2026 11:41:25 -0700
X-Gm-Features: AaiRm52uT5JRZlFgMZjCJC1DCOwOGUav3xI3jvI4TX-E-U-Zc80rWPyZ4TjKbeU
Message-ID: <CABh9gBd3b9TB1-s=Gq1q-M8bX+4UioXePUF0DPVrU2N3N8S9yw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] ARM: dts: aspeed: yosemite5: Remove ambiguous
 power monitor DTS nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>, 
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_114145_093139_0E8D6CC9 
X-CRM114-Status: GOOD (  20.44  )
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

On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> Sorry for the patchy replies so far, but this series bothers me and
> other priorities keep bumping it down the list.
>
> On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> > Two different power monitor devices, using different drivers, reuse
> > I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board variants.
> > Defining these devices statically in the DTS can lead to incorrect
> > driver binding on newer boards when the wrong device is instantiated.
>
> There are effective methods of maintaining devicetrees for variants.
> Why are we choosing to remove information about the platform rather
> than use existing techniques to properly describe them?
>
Hi Andrew,

This is due to hardware design changes during earlier development
stages, and the fix is expected to remain stable as the design has
matured.
Could you guide me on the best way to maintain devicetrees for
variants? Thank you :)
> >
> > Therefore, remove 10-0040 and 10-0045 device nodes, and let the driver
> > selection is instead handled in user space by the OpenBMC Entity
> > Manager based on the actual board configuration.
>
> As a separate problem to the one above, while you may run OpenBMC on
> this platform, I'd rather keep the description abstract. We can finish
> the sentence at "... is instead handled in user space" and remove the
> rest.
>
Noted. Thanks.

Kevin,
BR

