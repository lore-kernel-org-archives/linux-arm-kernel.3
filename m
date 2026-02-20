Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B62C55ABE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=; b=tGZkE/wK2TlXZX6UQjNofhavVp
	9RUpSY1RTIS9q/z07wkXwNidhAo+zv596GRG+KEwuB7m4RejszE3sgutvuovjQBKs6y/4IM/sNRsh
	soL1v8SI5ry89FkFU0pvhJ2dlMUkncuccAFAETD6Xo9JV6jSyem3LDSEs94Trkt8dTY36t6kGM7dD
	+b4/EQbs6z2eBwiZroemoAnMZVk8lDh+1MzeVzL6l0wJhw1T5y3JVFfSKOZryo/JHPULYhnc919rm
	ds/oYP9hLh2W/yTvIlj+GYmwjyGpZFEPGsPbsPfvnMa7UWpQb+9dP4eUXR/VHrkJdxXfXJ6ql8rWS
	cbR9W8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQpu-0000000EZz1-1PE8;
	Fri, 20 Feb 2026 13:46:26 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQpr-0000000EZyW-0A0y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:46:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59e6b7b11ebso2446637e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 05:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771595181; cv=none;
        d=google.com; s=arc-20240605;
        b=dyG/jiS2bB0J0NeUuGsPIMYvSoY/+Juvi/KrSjvKbC4zzpoc1rr8PqSnrL2jnxEdb3
         pcj7HQ9CiWews3E6tKxeyPCRwGjyERmzFOTloR9Ewg6UWhNEGrVwpolC9d7iUU3tfeNn
         8SYoXR4M41QZEK/NdBB5SujskK6FapheGM5yCBJJJNCaZYAr6piQkMnM7FvS47bJ4bRS
         WYrVKEgkCFpZKvd5E0qnTf4PZ2IiGNKZjS3BdEbk8nkyTp5TprtMz+bGhyEkvDudOKr4
         tPnnGghp57lcH8BJSaGoBGhU1JqR2w3qhrZKXsSmUZ3in1PuGGVc08JMft/gh17XCDTQ
         LKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
        fh=DNtPdwAAEtZDQPeDeiX+MbAz0mjx6cP7o1D31GfW/5k=;
        b=OD/O2pRPKwybNEei3YZN3LLzi2/VkIW7nRkW+UXDDqPw/uEfI4BEJ6teWm7pNPFGQB
         9b1bdzlYrOeOFBkkJi9LelodYUXUOTAaxu8cfWLYC0xc2yb3hIjFGz7kcOZwhineAjcD
         FSPgcXGthpXahS1KEGwhRZ4GUz50ZA1chH7PVBABl7I5U/Mj/J5ul6nIWitSpSY1hA7r
         wgqPXzJgq9432K9fGBDqF43ry/f6nY4SlJ6VMqCuFM5NTaUYNfRNgkYGLnrVJ/6kWvah
         WdQcjjb2kRIbbeWNgLdVdT7hAcOpfYHBh185yPWbfkcVZzLOh8bAa5ovOUvZrepeulb/
         PXdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771595181; x=1772199981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
        b=kH8JSVxdDzgpWhdN6mSUio25rwyIVFN28DJ84G4bvTjJJEJXRiDjlPB/62wvWEFnt9
         +ITz7Q6Xody2uro+aSfW6AM+tfDMUkM+6Wt4wl7DIzd2EuzoOkn2Xsj1d/zu9cddWCfM
         fokzey8nwpQzmrXOXfbSrIjSpwQIyxYFLWQZTgo3k2wUvhFN9rBuVnHgOnJfHIq9T45Q
         I7eHRo5BNRAQ5lCnkwWdLk4pDWiIfHJbX/WOdOjrGCBuvtDGVUEmwMJ4vuixiEd+T4G/
         8DPjgwCnQ2PrXVrpmb8XHP5gk1X/GR+hJ6FNZrhVZyo2bV3JCdRSPauA5GwjLQA2mZ6j
         t56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771595181; x=1772199981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOrJsV7xngK5oabafDdTfaQdbOak3Z+Z+nL4+6By2TE=;
        b=fCgDpKRBFmV6soNZJQJ9Asu3EgXaslr7KNsAPotEnu+N8pf8Yh9/cBY9/fX8GiLu34
         DCBB1QA7ezOD3Qe0X8QbwJu1iZ2EWT3UxZY58ZF9pBthDviTqJOoOnJkHVz6DjvDM2CA
         aaQrlMov1UiWoa17vF5DZZ0DrSJPc6KoVWl3HYYPXmlupf5HGf6Yvuy36eNxeonqyIth
         WWtkL9uwA7LdJCYQTqFaH1q/jFNHy8y9TVCktmocY6R2YbYO9N4oDa+FuDwt2/AhZ+/u
         dHXuGzqsh7HISO6nX3TqzOEG+oCR0NdZUfZo+ppgelXdRnCoBvUWTlOsupNkdlPRbanF
         dKrw==
X-Forwarded-Encrypted: i=1; AJvYcCU2uGijKae5j0VjrcAH+FonJeIp+c1UxzYf2EKNnLpAgqaK5kea1Ac3jPB16ehRFC+zbJUa11WzfVXSopGe8PxF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7grex5+eFDlOmN5cALO4ZS2nFCmMoz7a6gh7oU+o5lDlSjZxp
	LBa+vHu5lW+5zCE43goZAPzNta1QsIuCR5zFKumIRxWJ5Afqoa6vRDtJfHuiXSeeqL2kP8ZPSVs
	UL2pyN1lBSV7BYvwQGj5Xv1iSMvYSDVA=
X-Gm-Gg: AZuq6aIyJhJMPPlogJKkyf2IMP77DEnqTn5oB+Z3XkpzhZpSeNT+2JMT9QQJSquyQYl
	9oFbQlNc3Jr68Glt31ThxxjmPCgVGCIzZpjwNT1X1YeHkWBzIqBZ+gQUqFU0oBVDFlXoJsi9hFP
	s2j/qzZMzUmrfjWOXv9JHvkhl/e+Rert01375wjl7knCVI9emz0fhpjECTudYfQRrHhVka3mQKs
	IF519s7DT3h98OkNDmvuoKDDW2URqKSq5GP6Hgn8WOmOJOq5Pc9v+NGhwaOWmXMSlsx9TMn1umo
	x9l9PF9Ml6a5LQrbOgmnQ0X/dJ1U+oi+wyvi8BtzS1oWWXE8CpU+AXv5pKxEPeW/2uNoWXQ=
X-Received: by 2002:a05:6512:15a3:b0:5a0:4345:3b83 with SMTP id
 2adb3069b0e04-5a043453cd8mr632693e87.47.1771595180578; Fri, 20 Feb 2026
 05:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <20260218132339.32157-2-Max.Merchel@ew.tq-group.com> <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
 <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com> <d1a87e01-f887-44ad-9b95-08c0e29be6ee@ew.tq-group.com>
In-Reply-To: <d1a87e01-f887-44ad-9b95-08c0e29be6ee@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Feb 2026 10:46:08 -0300
X-Gm-Features: AaiRm51_GsoZDQD00zZcBnGdIZ49TtjBpvahUOln8EYXFWstEClOh9muiMle6fA
Message-ID: <CAOMZO5A1+kynXqCDXA=aFw1y9UxnS4SQN2hbQXEmdXVgA8PjUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
To: Max Merchel <max.merchel@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_054623_097755_0CDFB169 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Feb 20, 2026 at 10:14=E2=80=AFAM Max Merchel
<max.merchel@ew.tq-group.com> wrote:
>
> Hi Frank,
>
> I forgot the boot property for the spba-bus in imx6ul.dtsi.
>
> If Fabio gives me feedback on my suggestion to improved the comment
> messages, I will send a V2 at the beginning of next week.

Yes, it looks good to me.

