Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829E7FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=; b=PNBHX8gG4Su8J8jPjAgTSvt6K/
	9Ar8BajNyjdiCGQ9AP/2kUOnbtPY3KDITHAa/XEaz/MNC6hNrVhN4QXArR5V4LMPk0IRv9Tk+fbrb
	6nTbKYH9NS/XK44qW4zANn1xktPcajIUk084MAN2G95rHgYRNmdpW2+ZnZn0u69teoITClptF2Jpd
	Ctm5JEV37TU2iQMCoU3xANKAtGlkBsQ1mc/w3LV8o4qLA63SBx6Jt25MMCiD83eYG/wAnG8mnyfY3
	JgrfgEdlXT9+nYtvqF3fMPwKaKrNRaPONy68JWTWYroF5Pi3r1Gu39bmnoPegn5pg0B/qi9wbLSlr
	K3WYiq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH95p-0000000FwZe-3sEj;
	Sun, 26 Apr 2026 23:40:53 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH95m-0000000FwYr-0bX3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 23:40:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c79467f128cso3512623a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 16:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777246849; cv=none;
        d=google.com; s=arc-20240605;
        b=cFWRMWDAWxQlaiR6IGxC8Dz/giPxZ0Ti8uBjK77c4p/iE5qp1Scb81j/cXdcDT78q1
         VDpbhGqasjdZpdE2M/3x7YMHjR63C+PJtLCPmsfJr9D+0X3uUGWop+kEevMvov0cP9au
         lppUaEfI6m8AHXI/wQaWdcPVJwoN5Gy43jzdVJgtqLcqjJRwtUNQCnM8VSufQb0wrVeI
         mDoZsezp/Mbdyge2slWYBmpSoYrs3ghisohMd8wCEaXCiSqiiSvObuOZqyyS+AE4SKCv
         hIccVeXjDBB9yYJjyeP57YsPavlN8SJ2tUJ4PRfAySs8/hJtNCU16bNJQxfOxaSLsJyC
         k8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        fh=mTZjKnnWev52eAPqGCCWY8yMzk9bLHr90Dnp37m6A58=;
        b=blCLvXe84kV/+T+mIHMBzLQ4xwd6nUZuzUg3or4Gh8KEW5Gb8mApI07kF6bFSNgzrU
         L7+AokWDGKJ5DpW09UIZH0TMCfnSNJzzxLbHAHf5GtXMjY/snR2lXKZAJfMftwllaIG4
         DOm8TYZber+7S0l46qGpUYnHTsgZqBkUx4PSTsBtBd5gzrgmwbaEZbEDU6Jn0m5wuHFZ
         pX42gm855NlqnQaWZxrgwF44jSVGf9iE9F+bMOoGxG7hzspSC4XxZDaQ1r66bNtHByda
         C010uCry4rs6hw9FfYuUpsnfU14wd/XdSHNcW6nIR0nRBWpuV0HGE1knoYlon8xTjKjd
         ccGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777246849; x=1777851649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        b=Lpz1KXc19HreMpMBv/zLZj2xiJhKkqZm+VNJrtuXlFk3mf9yYytzd91LR4rmd0SKTT
         +iLXM5JoIrxJt2s56hIcbuTyej+TltEx+JPKDI/NPyZhDQoDQWwUZLcmjoLsN1+X82QQ
         FoIQIweOKlYbEtIWQHeTax4dh2QhZCbl/nJwSjA5pbhrZM4dPzQTsJOtgr4vcWfJE7fB
         eqsk1vN4LGRjfjoxck22YtQsKq1SvhTHhDnO4w5h2T7d2xx0fEFxceSVd5Gt24qvBpSA
         C0vS2Ofccibv+t//gmbXC2zmjHR56d/j65wGXA6tyYRj/IzaIQghb72Dgl6j6qmc/prK
         IGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777246849; x=1777851649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0mG82ZqnbNgU5UbwCZHANJfxcxBs7X3CB8+aFRbO3g=;
        b=sm1SNT7I2ayWubJTiFcK1FnB4vitpEoAOYqLA4YZ+E7FEZChjx5LvVv49mXN8Ya1jg
         P0NjMKlZZQrbO9OnT1zhb0ckOJu5/xI9FTLnYMb8eVYLUGrXgtahdfo51WfQVRXOEWrL
         d05jMRGwtnFFykbWB1NV+oqlQj4l9ljFS9Msazu/S8A1lNKeXXGHvbz6cL8/wrDDJ1Wo
         +gQ27acZ/3GU6M7cQah1sDOCerUQwpMUTI6T0qDnVhgdnT67UslA5Gt2irf50xOJZzNX
         egNKIkW2IrpmFS9Lw7yHFjHTawjhQzaw9gntuPggM2y5Bk758BZ7ssSBKR20+KdDPHAp
         Ojpg==
X-Forwarded-Encrypted: i=1; AFNElJ/dW72bTx4LxD9Afhwm58NjSq6XJWah952AJc8dayqNd4RZlLfO3rL5cEgFDQRsgBowqnRYP4JFixRW6zKnqKB/@lists.infradead.org
X-Gm-Message-State: AOJu0YzFSE/jzuH+AMaw7Cl2z7/7qjnRftrqwPPVJHbRwqyRxL/psDPQ
	jGm6KyDopZPcaIDJmLN5JAGdqpLCgErBSmki5EfZ6IRnKknR9yxUCBlPjh9pVfHyPm7cP/to/lB
	kRat5Q+gWXREPqNOq1CZ2WMAf5BvNN74=
X-Gm-Gg: AeBDiesBErWFWr6stZ/DPQn7oFFowgftLmGCpwPWetPcXxrOOndqz5Jz8cl2kRtOV5j
	7i0ulcp1hWvP/TdK0A6ph+B+CyhcWH3SlCpBFNAIth0SvczPjFWfpxEab6PUaswAZvQmC4N5VKq
	3m7WF7SQnKJVjU3VRNiLW9HbVcOhNJ2chY1UWalEqx1Uw21IKjz6VPGCl0w2Tkx7j/sEnO0rmdT
	p2RF3mQMJHX05ocxbQKP3hFbdIUfgagDeT1vIKgmU4XfM3Bzk3qSx1IPSd8bBkp8L9SiXD6fW/1
	yf7ReVJs4HecPGCokT/mavBoVsn693YrlEbnW64H9PN7vLE=
X-Received: by 2002:a05:6300:6d8f:20b0:398:8870:b531 with SMTP id
 adf61e73a8af0-3a08d70a1famr25303284637.14.1777246848558; Sun, 26 Apr 2026
 16:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
In-Reply-To: <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 06:40:31 +0700
X-Gm-Features: AQROBzALmqPDt_24g1IGVKGMMWkAGDfkR70trABOv_7t1jBQYK1ibQPH5H_P7bg
Message-ID: <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_164050_191640_834E439E 
X-CRM114-Status: GOOD (  14.89  )
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

> > The 'wakeup-source' property already has its type defined in the core


> TYPES. It is plural.


Thank you for pointing that out. That was a mistake in my wording.
Regarding the two data types, I=E2=80=99m already aware of this and have
discussed it in a previous patch.

https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAu=
z9=3Dw@mail.gmail.com/

> > -  wakeup-source:

> > -    type: boolean

> > -    description:

> > -      Flag to indicate this device can wake system (suspend/resume).

> > +  wakeup-source: true

>

> That's wrong. Commit msg is making here false statements that it is

> redundant. I checked (and you should too!) and driver does clearly

> device_property_read_bool() thus the property CANNOT be the second type.

I think Device Tree bindings should describe the hardware capability.
If the hardware supports wakeup functionality,
referencing the core schema is sufficient. Hardware description should
not be constrained by the current driver implementation
( e.g. the use of device_property_read_bool() ).
Bindings should remain stable and generic, while drivers can evolve over ti=
me.

Re-defining the type locally duplicates the core definition. If the
core schema evolves,
this approach would require touching many bindings instead of updating
one central place.

This follows the recent cleanups suggested by Rob

https://lore.kernel.org/all/177628888260.592110.11727813820499601669.robh@k=
ernel.org/
https://lore.kernel.org/all/177679687272.1458365.1328485324673928433.robh@k=
ernel.org/

Best regards,
Phuc

