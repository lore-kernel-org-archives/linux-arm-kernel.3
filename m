Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C6BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DPlrQTYkt+ZE8rRAAVfPF09NGI7WKsXkRoeE2olJfQ=; b=m/flLTqDKNqioVWgm0JQaVCYJ+
	GiPAN1xGxW1JbS5rMyumAleTG8aN+YFU1h63ZcREg9TXg7h+lFvd1pNGe8QEr3qDwCIwuy2gTKNZc
	wO1ee4OfcvUe/q0Ngg7sEquwM6ZCgi99+74iN16QACVpFfUeBNZsku7aiFZOmPVyy56KiAAtSN8x5
	VbD9AzkgprdyHXF2VgaH0TcyT1fnR18HQHYJVLkHGzO32oa7Pg6pXnRQ4RCZLFExiS7umruK7IbOB
	FokfsMXoVncZfEEXcRycH7yyR3XbFohQfAlQLWtJvq/EYSCISyxBJUmkbFiWdDf0Kh5oM9cCd99Ca
	/gnJTz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBiZ-0000000EZfL-1ZTf;
	Fri, 11 Jul 2025 11:15:03 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAgm-0000000ERqt-2PFf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 10:09:09 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e8259b783f6so1585544276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752228547; x=1752833347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DPlrQTYkt+ZE8rRAAVfPF09NGI7WKsXkRoeE2olJfQ=;
        b=EdmkqzfFyiFTG6dO2Hhba4Ji46/GzbLqIhqng41MgMKQauvH5Osptlfe67zZiV61NI
         tckaEUZYbCj3yLkbmKlS4ESMymgC6vSTwx+7bcy5rLs3AxwT1v5wg2fgJruz+KAhbZaJ
         KybWnfYHpUOMWzVrJqrt3vpYKhQlzsjsShAK0JzEUsdyQWQiqrJDp/AHzc3vyhekK7Ih
         1Zo8Sb0t9f2W1jYLDEVEXp84JEyXMJDuVeAvNQlNdqkCGFkKP5/Gyj8+UNs1sCR+gSwx
         GW0Hb7IHphcC8Z+2HjNDskYXXmby2px6QInmwRX5+pVCUHwUoTKWI7AvEbGMMtHcaXOR
         QQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228547; x=1752833347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DPlrQTYkt+ZE8rRAAVfPF09NGI7WKsXkRoeE2olJfQ=;
        b=fEJ48zlRT0dpli6xECYTbGihIRLS+maMmw9HX3+/XCcV8t3bjdgAvsZymL0ewSUgTg
         inWhGv1HVmfV2Ia2pqggx39/YwClL3tGjP3VhA5UEiIv3au2kj5mBhB9JOlc/ogrhXpv
         +jJz/bJ27f7XRKO3ulZm+u2Es+wji1GyKh3qEubOBhlvVwSBxJQrf5K6qYuz9Zg1iAVO
         8zv7BY9Uqm7dbsvLyLPLkJ3TbMRaK/GxcXTWU2sKcb1NOZH0jntpIhqZ43PhJ7FAPAGc
         BCuXt45Hz4I47VUWMP3kSRQTieHXtJH5YhYrMYHC6zJam7hDz59gG/S3BQx2+lLqr71p
         Hkdw==
X-Forwarded-Encrypted: i=1; AJvYcCWAd9iVONNQHc4YsshOt8txNp1G6hvjILrqvOGkxXiw4olaN37EvDtQ9rbBYu5XNIBta4RAoR9hK0l5lmagIhXW@lists.infradead.org
X-Gm-Message-State: AOJu0YxybVxr04WZMvWfAwWtttckuscVs46M/Owf9BzGivdvcaafqAAc
	NCpiKwezKa5IhzMWXXrqdjgWe3sXEHJ185W5H5oJXwZF2EdCzHS2p17ua2aYUM2WSPpotrYZa4Y
	X9PSC0vvbCpbBEnM6Cf0THcKL0WGk+qQ=
X-Gm-Gg: ASbGncusM1oBlroEGbiYbXYOofjQzEN+0ExMRZsPrl3OQBMTG/Z7gDxZ0bz21+aIxQg
	ZYS4tqL+FYUetCwepKI6WZPvh9vRr3ZtAf0r+mcRAlMe9vWWRsaE3laEhcF/Ct0p424x44Wl3Vx
	MM7blg3qeMQdXsFICSJ3ngrpkKEfgEDdsISdfWQPKxwNnr8PCAm6IsMGMKuXhPo9JtZvibT+p5i
	EZQsw==
X-Google-Smtp-Source: AGHT+IHQpevq+XY5yL2INS7d4S8i9FSRzaPoq0u9J3IcMyelf48WOLt+P9Cs1J1wH/z+tAIZ8PQ8eE45oNJasrMgO7Y=
X-Received: by 2002:a05:690c:4486:b0:717:bff8:4681 with SMTP id
 00721157ae682-717d7a0ec81mr41763067b3.24.1752228547438; Fri, 11 Jul 2025
 03:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
 <20250710162737.49679-4-stefano.radaelli21@gmail.com> <56a860ef-7994-465c-a902-ca5ba2f90f73@ti.com>
In-Reply-To: <56a860ef-7994-465c-a902-ca5ba2f90f73@ti.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Fri, 11 Jul 2025 12:08:51 +0200
X-Gm-Features: Ac12FXzZlU0AU1NAJ9x1FPayIcmG2Vzc5ZawWw5m98FRFxy9HHEL6Iq3JdutXZ8
Message-ID: <CAK+owojYvje74dZbd3_35u2SMT--Lq8mG8tQcBGdmFD4oKjPcg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: var-som-am62p: Add support for
 Variscite Symphony Board
To: Andrew Davis <afd@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_030908_611272_0450B1E8 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 11, 2025 at 12:39=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
>
> These mailbox nodes are now disabled by default, you'll probably want
> to set them to "okay" here.
>
> Also, these mailbox nodes, along with most of the remoteproc stuff can
> go up in the SOM DT, these nodes shouldn't be carrier board specific.
>

Thank you Andrew,
I will fix mailbox nodes and move everything MCUs-related into the som dts.

Best Regards,
Stefano

