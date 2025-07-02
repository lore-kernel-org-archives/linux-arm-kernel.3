Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB91C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=; b=qWPkU9u3TI0RyToQ9B5KOTjC9i
	NSh6l4PoR2JAa6dq5/dt80jOKsAddSpvo1e9y5sAFEVXv32IHSM3+DKYsR3C/gpAL4TSLzrDlwxxL
	3i5bwQqz2S/ijfCcaCfLkrVsEfj+k9qbiqkAyFrVJ9Sv9AcrQthwImHBmbs3TiasbHN3AQ5pHokA8
	S6o2Uf0sk7QUwaYUSYQqAeN64X2fnJAew2RbNl33jAQu6+hRcdgl+zbRfqiQN69tgFQ7nckUvCQip
	7JEk+/PfgJx9Fn85MnWbnAqHLvEvER0NTMw8qYZOX3ZKmif+8FOHmANTkoaVCNBrZARclyXCaW641
	ApOl8bQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX34G-00000009ORH-1x49;
	Wed, 02 Jul 2025 19:24:28 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2zp-00000009O5V-0o14
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 19:19:54 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so73977411fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751483991; x=1752088791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
        b=KVu6MIt0YvLEp9yLf3SluvKTwVRMoGMtFTv0G5O+JYNWN+x12yyl0OxTnG/XBqcbOq
         z5eUmy4btulnWSVpSZqMuDflcvmfrznzzPJPC+Jqyx2rLI1FQs0vAQt8BPUzZSBdheLc
         A/6VQF++O7NI7H5GkJi+am6ZFU7RK1BHOx289R9F7xQauCxuuYmVtLO9TsYIL8CHSVNM
         YuTG5cEO8JszaAev0xyF5abnnk6tZdHkZT9+NzaKTmVE8tWY0PBEWy+HVmbpsnQWs8Wv
         MXnR+2ke/DGoqrCmghGsGg3zsPW6YYuZnMiFRxYD3xmh7HI73hwN8VlpKYPsdbqdnW4G
         yXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483991; x=1752088791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
        b=OpmzeClIzW2cNVxR9BhfdJsKOg6TqIzFw3nL7XFwOsEjeqMQVEazCqm2rxutkgH/Az
         4/RE4vmFGjjo1QmphXacQEPnYHBb8QKhm3VbnNXJ6I01vj9mP8WR+jkJqU9UTMJY8EgO
         vZQsQ+dAEpdlS4jVDZz3luw2AFvbQv2KmX6Z5h3SulncoeUDgQ8QZJWwI7RdqtcZro6p
         mORq2V1pHrdpVdhOqfkszSEI3u4k2zKwbnaiK+0OHloE7mvt6shGn+G1jZ2hSpnBHSCo
         jeF5xpUpvh4W0JAAyv0QIJmI6yBIMvks8hIrnAHKBc/38j5L9TVKZqll5mUoQWSGnxmU
         GXSg==
X-Forwarded-Encrypted: i=1; AJvYcCVtXx0JsCDCiwdr9OkIDr21kTNM+pezoWEzGpSUGI2e7xSD1QLhlmWK5ZDBsFzp0RMtm2sh+At41n1LduW+7s1x@lists.infradead.org
X-Gm-Message-State: AOJu0YzkMwe8/5vw1T0zMPpmhD5hTuxNReCDxVUXyo7WS9l47vcAsuB5
	oTs1TLvLsT6q2H6QrvX9SPdEQCFx2McqVXSvu9beRLZNSDH64mXElukykNw8wZGxNHGiWOj4HdM
	R1oKfXSWOXGrMPJStgfcM6LZnv8Ei910=
X-Gm-Gg: ASbGncsN1OYVG2FqG6AjI0P4Ga8uUvxLifemGlo0k5kx5vnHfCxzrfGrHP/yk82iF0D
	wCg+oStoVhjmM+aTnzBAOIfPpzCL8yGgVo12o0zFu2Ohzo6fC+4igmeuYc52XtHp2Siu3nlbALw
	dJ8B98zxbYCIZdBFocusdbO+7ksjCUEhHjgdXseQiTyzy+FCZye7zvWQ0iBHow5Xw2ntCnznpf9
	+dItpbpr+cwMQ==
X-Google-Smtp-Source: AGHT+IHvelr2Sf9x0pHkrhNzudbB0N7XiiusqPIR1wY9p47fZeSLcVsNT/JVRmmR8/qM5y2EGSD02riNIPD+nyU56ig=
X-Received: by 2002:a05:6512:3994:b0:553:5d00:be7e with SMTP id
 2adb3069b0e04-5562ef25a02mr169873e87.39.1751483990547; Wed, 02 Jul 2025
 12:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu> <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
In-Reply-To: <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Jul 2025 16:19:38 -0300
X-Gm-Features: Ac12FXyKYcQK1-FZVNpekraID_F80XT5-HRO1qYNpYDshT-udtpBPslocc_9D9I
Message-ID: <CAOMZO5AYXvq7W+SY7H3yb3n1-WwGx6yFGA_q0VGDWmj1FvJtEQ@mail.gmail.com>
Subject: Re: [PATCH] arm: DT: imx6: hummingboard: Replace license text comment
 with SPDX identifier
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rabeeh Khoury <rabeeh@solid-run.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_121953_232064_2DC262A8 
X-CRM114-Status: GOOD (  11.05  )
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

On Wed, Jul 2, 2025 at 4:17=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.bence=
@prolan.hu> wrote:

> Several (7) files have been left out. I will resend it tomorrow; it has
> only been 12 hours and I don't want to spam the lists too much. In the
> meantime, please tell me if there's anything else that I should
> incorporate in the v2.

Just a nitpick: the Subject pattern should be:

ARM: dts: imx6-hummingboard: Replace ....

