Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50617C61DFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=; b=RBLJZe2jlEA2NmBI8OW1MYHyaU
	fqvtWLTjA6m65I8iGJHicSOlNYethAetoT0bAxWFJeBurOh3L6lr7e9kWlC2orGXUnDZ85JEmrsaN
	jZT23YRBumYFjHiKCPcoUZMYJ9XP3DShqf+OyRM0b/Gm0HbnCPFY+QTYfXkRogTmBQS0H9jKyM3ad
	rPDeQ2VF/qnnCyUESleLN/0NmOf2bzcCq8YOX8LwAKvPIeuoxg912aEdF3ya3auDT3DMRQXBcxGM0
	sMwAODVVurIh8hKF9NVi6SqDa5MjQ6ml9m7ntnGBkmC9emKOK5JQTiaE5ohI+pioy4gSWrfzYEaTT
	MeeQIrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtr9R-0000000GDqQ-0j0j;
	Sat, 21 Feb 2026 17:52:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtr9P-0000000GDq7-0YGw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 17:52:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so3059236e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 09:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771696336; cv=none;
        d=google.com; s=arc-20240605;
        b=Oj2TtiPoZhoarOdZBpBGk4GhH+r1E/qEHzcJRUxSnze3gGiQd0Xo0wSKVJDLonxfAI
         CXaS8KX//WAYdxRT3Gr7WQpOMu7jiNgT075HisUcwndLNQBXdcNkb7n25gJzkC/Z7UcC
         YuW5ROo9Uym15t8YAxh+UKPJgNJlmkMaFr6uicDKq5hxA6ne/Y8W47MdsMDAeslizeoh
         Eso/9X0ugq914LZAm3ylfnHrAxZVBkhOjHfA0aL6/Dj9ux3oeLPYZIOB2PzsdV1loSpH
         IqVqf86acikbPXO/WjVavoGoSETVwC6QXswbz9sKZDhW5wGowPMGZJz3EjlmMEm3etja
         1Hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=;
        fh=/Wel9D/SHLa4nIiM2TonL5sR/j7DBXrmsOALNDJwxWk=;
        b=Jxw7aR7tZB5UQPO5SUrB67ULRWWTsfYHnEfhN0vsXnw2E/iX6lNis2CD4I6bBP4EXu
         boP8sWWlMh6QKjnkHCMGZ3L9iPds70W15Pxm4lO/dD53iy7ktO/wDK4dffG1cBQfj1ba
         LHzBBckkJnlvHuBoH/Tm6joXzGTlilAZwL2ORyxcFvE+DDDX4FS851qskryWQdUoB4xJ
         7+rmGQ+Q8NdmVPDaDzm3S831k3+/DbzAgeOn1ALHwTwTNLSdxOGFH1osTdkiTyfDDQGv
         rHaAklB2wbkrov1Jumo0pCHVumzzNWyQP+fWyt2RCsLBr1YbeBDUMN9DqyX8mmjKBrBg
         dz5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771696336; x=1772301136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=;
        b=B8GSVLh7qwXyoJa2pvoDLefux1p5jxSeuc3stHylYzT2joJdn14RJ/T1YOGuxMdvZZ
         wKUvtEIqoIrQOLSRO7b86dlozG/J473Oq5/aoAI1Av9Jw8Vwaw5x+a8b1zUVuwnUEfJQ
         15kcRam48OMtK9WiLQFiFH0wpKH551am4GVHjI9yA5lRChE/ZpJ7PmmSrnIRsqKl5jph
         BiA/Abhi7cSxvRvkU33GkeFZEwQU2fLyGIYmFNeoekKA2hc75Y9gEBVomns9DGX/VjSf
         uzNmtE+BaPIz9zEchmn1MG6UhbvwE9xx8+JcqDJTjyHvMAGzCUycO2+H14vjcq4rhCwn
         4RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771696336; x=1772301136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=;
        b=wCDKLv+Z2Gn3rR3i8P7EtcM4YU2s6SNlf20zdGddm0xlzLAejRAsKdjPk1oUSli0Wn
         Da8sNp/RgkcLpoQ4BFUL13LxWdIpieW8KuuUAmqyjIWX4fiFa4xZ77+zUCEMjFOwuHHA
         l/uJHjzLMRzs7GVB15cfINGAJUmtbWXTe2dHua9f7F8smSUAalHG3QwO1y0pJSt9MPHZ
         mfJuyE0H946aBt3AK+xUFphF2iwrJMf7UCxABc0rc+e7CmF9t+ZxeBHTxhSFOWPegM0n
         8+SsE62xLSVab2376ZhHgw05cizywcBOFPT04H8+PR4UPlPOnQx7UT9bImq0C+CMZuze
         O4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFyz0fXFElI/uTOrunjllDB/xdg+Z/sLDwR0JXsYjmcVlm0eI7OnPqGUaVK02K2igdOpzaZ+WZHE+dEyFgHcSh@lists.infradead.org
X-Gm-Message-State: AOJu0YwljINtm2OfwhaRk94k8J0FkmksBEGjTUtb78Cjo2YnNQez4zsi
	exfh2V/VGFWl/E7w9n0zClC/xsE/H3Qxr2mOaG7khtNZJ25e14Hj9DoUzRyr4uTWLe0GxKf6peZ
	xYIdVzP8yyC0B39X0LAB95+6+HSGIrUU=
X-Gm-Gg: AZuq6aIup64e1btraoym5c3tz8MY9BrHeWTuLXh17S9xm5c2ZLyqWxaGKSx0TYYKo0f
	IXmfrNRGqgswZy67qJQmhwqTYLAeANWQnfxOLEhZXW7sDgBExY1BSMT/yhu8BrG3QcVHdKaSDUa
	CMKEgSmIhL3aG2pvGAA1loDDvIS1RNHJEuhnyoM6JONw7uqDOPI7OESWop1tVu0fGcZSDHbvDdY
	FVSCpkm0K3ZEY4fcmtBWjsa2YddOHlE/EXgXX37aKu4xXPiRXTwMuSyXk52ZUn7YOwDSLUEKv3s
	VJqC3MdRuurOUsJAoDvzuSGRk/uGiKr2uRZY5koYNw6FjGSqgT6mn1ASo4xPt7eUIiXDOlk=
X-Received: by 2002:a05:6512:32d6:b0:5a0:4cb7:d53d with SMTP id
 2adb3069b0e04-5a0ed9b3c62mr1119236e87.38.1771696336186; Sat, 21 Feb 2026
 09:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
In-Reply-To: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Feb 2026 14:52:05 -0300
X-Gm-Features: AaiRm535UxyOOW-KZMHW3TwP7IFUnVHAX3jFIxy0RPK6vWVRSydsJOFop73bf4c
Message-ID: <CAOMZO5A_Uvq4nTWwR2fXpcT7b6bAHmqf+qS-8FCSJqhkwwKdvQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: imx8mq-librem5: PMIC voltage changes
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, kernel@puri.sm, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_095219_212702_E1F29D62 
X-CRM114-Status: UNSURE (   9.27  )
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

On Sat, Feb 21, 2026 at 9:02=E2=80=AFAM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> Simple changes to bump the voltages up to their nominal values to ensure
> stable operation across all units.
>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
> Sebastian Krzyszkowiak (2):
>       Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
>       arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

Both patches should have a Fixes tag and Cc stable.

