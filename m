Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C903C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=; b=5EMTZp+Upu2x1cZwjFbOg+ToXB
	gGAfFyhvV87izSNuwS3G+5cv1LT5ZhP3B+bdW0/bETwsBrGXYTUFDYHv75MTZNuy70amp9JV2sStx
	Wkh9jHtx1+D63pd7EmYlGKD+kNs5wLIglUIdjmiS0bRLqH14RVAnm5nwpeoerLrdePrbnTrKbPjuc
	/sRRS604R1GlDYiR03d3yd+QO3UYhD958dD75pfmmNhVOTr0Nyh+h7us+viPfxWlnZDlA2J8Yi9AO
	PzPP3L4Xg161eQkwtqt2vrVTbx+VuWbelkCk88/H7DsupE7Hc7fC/gFyrfJlgJuc3tStK3oz+iW4j
	90eEZHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjWG-0000000ClPd-10oe;
	Wed, 19 Feb 2025 12:49:40 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjN9-0000000CikF-2kYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:40:16 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30797730cbdso69677271fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968814; x=1740573614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
        b=gLJSvcPR+Ti2Ostmnz24s5DFpbcCXhaZYWQqTvJers6CwYMCX3wpNQJ16f7x5H1r1D
         2tOXJtlJjkQREMXo46NvQVL+TDdNNettku/l+mt+72oMopMgwcRdserxkDXfdIwLySDg
         s72ANWAAJCBNW9jpKuOMeQjvUbWp9LnXXd6+Id5NRtwWXQTCnFzcTKl5TusvjA3PD7wg
         D1JbI8ctmDrQDdZOuW1nCfEBJw3q5sIDkby02QV8xen/8m9VWjU/U+DJNmZ6J28MyqwU
         P/d6l3gVDKWTqnI0KpWbnPAxSO/A631+rg9MZI9EqzWwXxZ6oPdBLciZ9JcdcVsh8Wx6
         5okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968814; x=1740573614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhQhj1c3gRWwOUJHeLmg2V70Y2oTFaMlvauJibjC3uU=;
        b=BsZc60DFvkhtzVQs8501ysLqBrnlyRx+s34YtcZpvMMsVXHAcWrhFAPvs0v/HR/xbM
         84nFQKcs83ZY6nc5EehkGJLGegTzz5IaDWiToo0ZswpZJ6oPaUOQUy0Zpb9pAharDAS0
         rl3HyEDbdeoFJlZnVBJn1u73LgDw1/z4rAHSmFuBW5VxXPrNrhZfLtDujjla/tOCUP/h
         +ZGwo0aj6JdBqDDQE3tB69/fWz+jLzivFWEK3Z08oqnY3HTUqjv55vp2nT2A6pDu63yI
         0wb+8h/pc59cwoome46isElkhQZCQfb+4pR42SUSsffrYPQ11FlEjLt4LhHiI2Z+WdMD
         Bg+w==
X-Forwarded-Encrypted: i=1; AJvYcCUq8Kmu2s4kcBbLo8R2sbRYPKVvfmSMyoSYRh+mvvrGgirK/kVctpQGshk4nkpYrgMWQmJKcOkTOD4YGhAgK3rb@lists.infradead.org
X-Gm-Message-State: AOJu0YwFV63MKjy904Zmtz91d8C0nXqBgiMZIpFt9X3kzU0mwhpAyXJH
	aEhd4QtuDeuhfwjqVLfVP0Gq7poRbvJlwjGYSYnCE14WBXjh9P2ZkbTPDIIVeBf2aRY4BBVmRfx
	f9AT3V0gu6wGNOtE6vWKI7EF0atU=
X-Gm-Gg: ASbGncs/zSFX52vJ4RTs6mPQgQF06Somg0YNZNbcRMNhsUPPrhQbsTDNA91kvSs3teA
	+Z0BPj0xRF5JJ9amvFa830nMI0Is3x2fWi2YM4ELh/UbTksopXbG2QZusj2SLotAbHEzybsS0j3
	ao9u2oNphsBmHNg6F+t0H8ttZdez0=
X-Google-Smtp-Source: AGHT+IFiEAAmOQeNiwKM9pYHoGOeRxDwt6aWpRp0aHFkiqJ/scb58wtITAVUYzMW7vzAfCPPDIj0kMB/lDvHjfDXQ/E=
X-Received: by 2002:a2e:8810:0:b0:308:e8d3:756d with SMTP id
 38308e7fff4ca-30a44ed1da9mr12054681fa.19.1739968813787; Wed, 19 Feb 2025
 04:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20241101135406.47836-1-festevam@gmail.com> <173073495749.210192.9138587910771237679.robh@kernel.org>
 <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
In-Reply-To: <CAOMZO5BVLpQecZH4vvmRi=KfZ=MvCgUQ_tUKjvUzMGO=wTU-MA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 09:40:01 -0300
X-Gm-Features: AWEUYZkvUCi3PRNaZjpqQ7zkYqcKxcjgv_RBbFS6LFh_ywtWOQiG9QgEhk9Prp0
Message-ID: <CAOMZO5BJy2B0Jy-ehz44ZkrzUpGqrAs_GjE-Nh1P9K8uDXVmyw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	krzk+dt@kernel.org, a.fatoum@pengutronix.de, dri-devel@lists.freedesktop.org, 
	andreas@kemnade.info, marex@denx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_044015_696232_D7285AAD 
X-CRM114-Status: UNSURE (   6.64  )
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

Rob,

On Tue, Dec 17, 2024 at 10:20=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:

> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> Can you apply 1/3 and 2/3?

Gentle ping.

