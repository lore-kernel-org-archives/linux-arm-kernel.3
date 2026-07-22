Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD27C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=; b=BNJuORY2bX7Zfr9JX3XT1NXTfe
	awwihLMEcI+FnRngKbM5BQRnve8LyAYDB8FasoaL3zCDz49OFEwGLOWHN2oVJvnhgsNsxaGwFuGtW
	whRrKdGPVU+YngrxBb64+hWAlJt8DXEVSfqOGAQbwd4UfEU1V3b4TPKmaZ44GQt5k5V6SGVSEDWl7
	6jfZ6QQ/JAyfkXrFZxXyAcbONEwD8rynwpFvwanhFPnld0DcR8AFqYu7p6BAseZWbAMpjhTWjHcaI
	q/eV3czJCEPdH8MXg9lKJe10/Bo0Sg2pM1/yPOeBs2hcg8c2lOnfHMhHRF8jPTccnV4+GLigkrjty
	k0Utk4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaG5-0000000COt4-0YeP;
	Wed, 22 Jul 2026 16:57:25 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaG2-0000000COsE-1rj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:57:23 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-9725084c547so4118790241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784739440; x=1785344240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
        b=b2BVDONLyLtdxl7EwYOL9MNDeGgXA2YGAmDgjJ7SPO66FFWI3JXEs6be6VZVQjXbMh
         QKIJnU3HnIRpOPD4/qdzJIT0sFvvEDUcxLzRyoJXJo7MwNLgkchRhotWBKv70qQX9Q+8
         3Q+WTYH4RuF89NU178iY3oTnFO3WKMn8KzvO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739440; x=1785344240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEYFAq4AuY+FzksAFP6rIn759EzN+icZzsnHDMDm53o=;
        b=k0WiZTmDkXguM710wP447HfRyOcmV9jgBg2BHOpqmLZYQdx0iJsVCgBIK35QVsk6SO
         kYoG3HrItu5T/COMYmCkszK6X01/IJ5SqS4hgjGDKgTtkbE3eZHuVg88p1GWUittqhbZ
         MUTKJh6yijx/1M2li382d94hX/IZYLTkCf7UgjAH1IC/Bj8zKKyYJB3ZzxX+XwR7K9JO
         RxfGiYlr8C3Vy+TeZqucTLxWBXQfvIsW/UhzrvOgAiAFDfvKeGshy/lY7QgF8EfbOpyA
         milAdtHfL2ybJYZVBTyiwPxHaLWNUp+JGFazjyzvzNSTIQibG7gFfA6y767r+mMgy/h7
         UX0w==
X-Forwarded-Encrypted: i=1; AHgh+RqgNH+w2EUgGdxiYw9frFlSSMd5Km7aXPtTHYGYkNOBKkEQt4HLYppRHIJfIgw7wPUEdRleuMSy4H6vAAqz0Av9@lists.infradead.org
X-Gm-Message-State: AOJu0YwmbVMchV42eabARhtcQEhBgSFdZjL5qZtklw9f/7QRDrXD/ZUs
	aWda353PwqM4PZHzPg1zqNuBxZqV68Mf9XVm408dIVkgwjXLhpsG1XPbQksobArBWjCZtNMjZRA
	xapM=
X-Gm-Gg: AR+sD13+4BNMBfk4n94zgvo0LIZZKhgxJWEY7NHImKWTSoRqSBvCbqyJr+125mJPKAD
	u0XTxb4LkeRtRuHFZjEs3jwS8vy7nEMkx5S17pCKRwJNL6UgWN7ay5Wznvf0KFjt3d/Mq4CVJsy
	Th2YqIP4mvTcTYdcR0tPQrLFLLG/MhD8DO07/0HRkPaplljf1mIwSI7BNk3QOFTsUX4/6T5kcTB
	wEnl4Z3I1oIP5oyWrjdai/8ptDx7iLDDjtAOSU0+k8SuOODud9W5Vd4Pxusno9PasHJKYBxxXCv
	eMmiMrs6xQkZchDpxc3LAtU2u6f9UkY5s0Z1jSEiM3vlOa1tURZTJ+5eGcA0t/v7M5LqxXn5yxX
	cQiri5w20X3BXF5Ugb7gBEBd4Sh7+TxnOwQWi2y0aHRuGME87y0LeVjDLBS0paqZGCsYcyjSQBm
	DayQO+lrHQWtsFXI/QjwOpO0niPXdhTOgrkONTYGMZ
X-Received: by 2002:a05:6102:3e2a:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-74753705f43mr9619430137.21.1784739440260;
        Wed, 22 Jul 2026 09:57:20 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad2e92ad2sm3232971137.0.2026.07.22.09.57.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:57:19 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso4306958241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTyRBUZS00jNzHQ4wy6VnViPa288EN1WMlaR2J2UMKy3S+eZdCOoM4PhjK0H6ZZTqsEVjwBBs6Y1lzA8UrIp+O@lists.infradead.org
X-Received: by 2002:a05:6102:1612:b0:6e7:5c89:3fc0 with SMTP id
 ada2fe7eead31-7475374957emr9783635137.25.1784739438261; Wed, 22 Jul 2026
 09:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
 <8e3025c5-16a0-40d7-affa-098ca37699c7@kernel.org> <CAD=FV=Vrd9AxO-NY_CP2h+f21qt4uGY2pOoFgacV+G5bnfd32Q@mail.gmail.com>
 <20260722141004.GB548057-robh@kernel.org>
In-Reply-To: <20260722141004.GB548057-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jul 2026 09:57:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=ZdgC4fY4PadBFxomeqVD0E0CdeD3=PrcCFB1brXgWw@mail.gmail.com>
X-Gm-Features: AUfX_mwQnLQAqN0MjW9caLrzNlzhz2FE4RbdPofEVajHvqOI-LXTbiHSC_fioOY
Message-ID: <CAD=FV=V=ZdgC4fY4PadBFxomeqVD0E0CdeD3=PrcCFB1brXgWw@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_095722_522899_C2AFD76F 
X-CRM114-Status: GOOD (  18.57  )
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

Hi,

On Wed, Jul 22, 2026 at 7:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > Sure, it means that if someone unexpectedly makes a new Google
> > mailbox-array that's totally incompatible then the
> > "google,mailbox-array" sounds too generic, but that doesn't feel like
> > the end of the world. You could call the new mailbox array designed in
> > the year 2037 the "google,2037-mailbox-array" and things would overall
> > be less confusing than using the "google,lga-mailbox-array" as the
> > generic.
>
> What exactly do we need to do to stop having this conversation? We've
> done this scheme and version numbers and it never ends well.
>
> The reality is the h/w folks can't help themselves from changing things,
> so nothing remains unchanged for very many generations.

Stop having the conversation with me, or with everyone?

With me, I'll stop pushing since I think I understand pretty well
where you and Krzysztof stand on the matter now. Even here, I wasn't
pushing hard on the matter but I was trying to understand exactly
where the boundary was. As I understood it, things with enough
"identification" to disambiguate themselves could use something more
generic, especially if no preexisting binding existed. I clearly
misunderstood. Mea culpa for the noise on this one.

I'm not sure how to avoid repeating the conversation with the rest of
the world. I think this will always be a confusing topic.

-Doug

