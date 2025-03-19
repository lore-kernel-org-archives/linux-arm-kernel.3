Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE56C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=; b=vWp2DsmO7FxTohKbugt6DjK6R3
	VXCwURzmlurgwP0dEHF3DqWueIxPKGusUZqoHNbas7ntWCKWPDDOtrtzcKPBWN/alWL0ZARij/pto
	jWcCh+EJLRZtRB0qYQZwV2uUZkpcqfi5pX26VsFIlFMOjV2rUgDYrF0WYWL/d20mrFMxcXy9eApMs
	CFHelUxTcLi1AZcSWqSrT7V2QPpOEfGb1oBwmRMc040KSbchunDgKJAJzek8twKxfbopkjYvmXMR6
	m3y+RpHqxC0yBLk+rgXAiFFrm2wayLMA1EcOqA1BTPCtinksA9AfJtKhuAloyp1jg02W4atEJIOFy
	cg7GB+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2Cn-0000000AK3K-1w05;
	Wed, 19 Mar 2025 22:48:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2B5-0000000AJpD-1V1f;
	Wed, 19 Mar 2025 22:46:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22398e09e39so1327065ad.3;
        Wed, 19 Mar 2025 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742424382; x=1743029182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
        b=Stoer+3uSpT/NvgliH6NYh192sQpjslQmvTqKnwnZL7gGAe3rJAAHuQJY7KfKZSOwv
         n2W1OSQ2Wm8LHixGb3HOSd4aIKLCVMyHK3NhC/JRwLD6qKUD4ThZh1/o+w7klTmvhMs/
         9/9zcjfK0YaYJ6gJhsAeGRwW3ah55xg5sJV3KMlYIyDlcpf1xcq8GSgtkH/MqAtCenSg
         TnAxgSeCns8sN2fn/QMaYSe+jcf0m6ScxK+HwG+M0wt5OCjdQVIRm+/l9Csans6oKdkL
         hNXfx9Mys9GrbQqsKI5DYn98e4HVGiyJ+syIwhMNUIBo9X40aRowmAF+Uc78iA5LOQBq
         Kocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742424382; x=1743029182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRQIvZ3jaUBwceFPvK/o3Jqmpa0wMuq6j3XaA0hEZLI=;
        b=gCRVEFAlkRhzu4SBbtYkeuIDllvjy5AaHDkWf0ZPfczOPWXwG7IL7uQVF45M09wRH4
         jI5HI2pOFZJ46RMJNa3HbBUY5WtY8UTDakYo83XeJoCKEhYCoJ2V+cSmLIU0NfQO4Kgz
         afUWhBIeFkeEd6sTGCGBE0nNJXM+L8rXFw8XIfgjbRnj5ZKMHed0n0wXzn6gYjLG//XB
         nIePQEsYeI/JC7ktzxDqLs6h5Tn3MZQuphaUcpq5IhU4gyeZ50ENb5QO+UwdVIC5AYx+
         L2X9DLUeJBraziMzGoqZdBrrUW9HnLcritLAkT35Mssz8sqIaxK3gZ4ABmxnLyJVF4Kq
         yiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4sX9PeJEnYQMhZhsuRG3tXYVwXxXmenwixOf6BwA3UilbCo4+f/9OUBw5KOUrAoMSU+GvZ59eEMts7cEGq1dog==@lists.infradead.org, AJvYcCVLxiyfOYSWJ5A08x6XATAYh+1ZkH27SO/wxNSUm9PYbj0SVzXHZghmZYxJYX8VW5PtX++yc+9FrmmhscxY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9QuXg0krMlb2iTz9SNMMYjkDjDS7UQ12T/+UEtTHkBzv8MSvF
	yJLEZKq4C+ArcYE/nBrryVb/VOwDLASrb8JPt9tnEFMECxtD0LYt4MabN612MfHTEXGOz18zqbc
	s2oDzTQZK2350Z4RrjkGKJFT2rrw=
X-Gm-Gg: ASbGncuBUpdXbGRiEzI//FqI9W6lIN9qFqqOmCzypXsmyF5QdOv94zupnsGVTsXc9U0
	k3KCSp0gYktiCNUWoXm8hgmyHTc98+4M87zSc11tQqOPL0iYuAqvKdvNHPqKlBW8hjzWZ5oj9AD
	i3pxQwlWrqFV2INGgXkH8UucjVVfUm9aHsgcwSx1p3WDikIqiEUlksOK6WnEs=
X-Google-Smtp-Source: AGHT+IG8GiaDjf3sdv7Ye3FkTV+AEaDW7f6KYxRvPyZsM3yaqLJDqBbKlA9xkI4sNwT7OOGxYzetDJTJZ5N5BHjlaJM=
X-Received: by 2002:a17:903:32ce:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-2265ee924fbmr16165715ad.48.1742424382296; Wed, 19 Mar 2025
 15:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org> <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
In-Reply-To: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:46:11 +0100
X-Gm-Features: AQ5f1JpBHXJRBsjDf382ohz1oHEzy_ztXE_MKlrqlUkHAd_fr7KlcjqRE5tCQhw
Message-ID: <CAFBinCCY4-sETrXoi5ELjXhnUYB+6q+A3M2FqaGCFprBxe31kA@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
To: Arnd Bergmann <arnd@arndb.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, soc@kernel.org, arm <arm@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_154623_399768_D05779C4 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Arnd,

On Wed, Mar 19, 2025 at 9:58=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Mar 17, 2025, at 17:13, Neil Armstrong wrote:
> > Hi,
> >
> > Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM =
bindings,
> > adding pinctrl support for Amlogic A4 SoC with a brand new binding styl=
e then
> > finally gpio_intc node for Amlogic A4 & A5 SoCs.
>
> I'll skip this one for 6.15, seeing that the branch contains both
> driver and devicetree changes, which messes up the way I send
> the contents.
There's an immutable branch in the linux-pinctrl tree from Linus.
I'm not sure on the exact process here (whether the contents of the
tag are fine and we're "just" missing a description, ...) so I'll let
Neil comment on this.

> From the description I also can't tell to what degree there is
> backwards compatibility in the new binding, I assume the changed
> PWM and pinctrl drivers continue to work find with the old dts
> but not the other way round, which is why you sent them together?
The PWM part is backwards compatible. The bindings are upstream since
commit 5fd61cc28171 ("dt-bindings: pwm: amlogic: Add a new binding for
meson8 pwm types").
The mentioned pinctrl binding / driver is completely new for the A4
SoCs, so there's nothing to be backwards compatible with.

Neil, for me it's fine to skip this one for 6.15 if it causes too much
work on your side.
Using the old PWM bindings for another release won't hurt anyone.
And I think the same goes for A4 pinctrl support as well as GPIO
interrupt controller nodes for A4/S5.


Best regards,
Martin


[0] https://lore.kernel.org/linux-gpio/CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40k=
hNZDdYb01-BGigw@mail.gmail.com/

