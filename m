Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93111CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kL83avgkPvebmqUXatcd7knV9g++K69fYPgzIIAyVds=; b=tgUAzx59KeXtgwGvNJoGkbPsiQ
	TQBtXQAbvftEY8yXgnyL56CT3457+T5zpQzArd0HazS0hl3l7Jef31ny2eYbBFWR7gUpul2yuboB3
	s9hTxiI5N4bRPn60jMg73aPWeRfVOOKBk+d4aUzGdbebHl60ArFxUuuUHeH9AW0uBYbxOkbHEfxix
	xXAEL3dDs6QmFqHTI10EOhE8jqwGLEJSovHj7/paUDedtSAvkOrWkLaJ18y0yOLDXPgWDsFEjoa5a
	rag7ASPpvRwFKBmUB90Itu+Q2aEsYWcy40vZsvIZDCr7zknsNXyFLJKbf6zY8vb7h27o3vhdNbDt9
	nKN8c3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C7B-00000002XTT-1av3;
	Tue, 07 Oct 2025 18:08:45 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C79-00000002XRs-08u8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:08:44 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b551b040930so4376658a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759860522; x=1760465322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL83avgkPvebmqUXatcd7knV9g++K69fYPgzIIAyVds=;
        b=nj32UKLeGbIrnD/dK83EtGuGw5tdqmUi3zEAKq32YhaaUmyjwiBPK/Cw4b25mHHOtk
         oNlysTeUlo+wmat3pbpbyvbc5ata6HLvM5Z7VUjRQS/9kAiV2xidCX/K12uMRMot3kIg
         IDI1J9tnRAbaqAY84Ebrx7cKBqBADLOOCjokHfpWJAtXfuBVegRtjNmmPxSko9Lp87aj
         ATWm1vcyB/HyvLMSKRBQGHkFXCnKXk1JADypU5JGbNV43c8QaCmXUpvsknBKdWByYFbQ
         LnrUsM4Y3kFzLNLwOCaaPcqKpFUJ+cl4BG8ETRhZ4877T6guUZstMMMtZPEH2Efi83vw
         e4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860522; x=1760465322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL83avgkPvebmqUXatcd7knV9g++K69fYPgzIIAyVds=;
        b=nc5Gw9+zEWU/ypIR8VrAQHi8zrf05w5GyVkXcAn992pSf5iHo1HBr4yd80FJZwbGq7
         86/VISRW34S7rLCZomvbmd2nSleOvEu7QJj7wPBekSZfMmj0jVZtAN0WX01D7zHPnHQI
         csQfdiJXBmWo2pjz+h2zYEy0ZHgA39vkuCPguacSzJ/+3aqbr9qPhZteAgIGvj4IuRr2
         LOGKgRhXBn3FXSMswpfrvdv7CKre+VKxejbS9VOQ7uc5uUY2eiR8daBc77wQrHjzjg12
         jzXdUaAuNuxct3MKIyT5IkClD3hLulDxsEGL8lUOI7Q5LdwfIKbPnmfycb29jeqOG0nH
         46ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxvF0y+xpyhAbh7gj6MyBT09H3GJuAyeFZKC1i0ZKEfrwh6g+g9rs8KTNPLg4Z8SIgS4R6Hy+lLwQwm2TNkVW6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw94wnNTzeyZPSBaxw0OJQx76osuVl2oDOk8oR/TgwyownO5r5g
	eUxCI9iH+OS1TICXxJmY/vu65TpCJywV3HCeG+sfgMrcidkm5vcLD8NXZI/v5uN7F3pOqg4IhCi
	PV5xoRK3gjVl8ZD9wpvkzWp3sRR9khDEL4XVD4k0D
X-Gm-Gg: ASbGnct0saR/G2lnJDmeymNE3cHVZhKLrfHqre+t5kePSF4deSC2quNVdSArvbqBugo
	EkYLziLBGdkIQgr+OrvZ7e4NADcxg1z4/ka1Mbfa/SeMPT9CcwS2Z00IPWQtSy7I0xYpn7pmdRN
	jaHMunM3yEj91PbAIL660OiGSbJBhp25m1c1kEGxrziqfMsPgDSD6BxvjMzHt1NYFtLm84blMFx
	pcmTBTZW4WYPRo8C5oUpNhTIhgabRcAVJ2t5v6vunfdufLrgozSS4ZtzfkbS9jDFXer
X-Google-Smtp-Source: AGHT+IGS0kErmJQEsnmkmk3f/fOEYFz/5xrVmbiZTV6hLQvnRLUwNPn7W+mzTIzummLCCaPUbPxoaoxxuABS/7SFA1s=
X-Received: by 2002:a17:903:46ce:b0:27d:6f49:feb8 with SMTP id
 d9443c01a7336-29027238ecemr7876345ad.16.1759860521582; Tue, 07 Oct 2025
 11:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-2-royluo@google.com>
 <5c2c298b-b0c3-4fa5-97aa-75b44084248b@kernel.org>
In-Reply-To: <5c2c298b-b0c3-4fa5-97aa-75b44084248b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:08:05 -0700
X-Gm-Features: AS18NWAJZttVCngV-whwmJ2b6zMeUXBnJ2src5pRyz7OavFl88Fb6cD_LbEK-Hw
Message-ID: <CA+zupgzMmgNA3uJiHSCY=5GqYf1RcSBdniJeo5VQnUnsyzY1_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] usb: dwc3: Add Google SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_110843_073761_689AD4DA 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Oct 6, 2025 at 5:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > This patch adds support for the DWC3 USB controller found on Google
>
> Please read submitting patches, how this should be written.

Will use imperative mood in the next patch.

>
> > Tensor SoCs. The controller features dual-role functionality and
> > hibernation.
>
>
>
> > +
> > +static const struct dev_pm_ops dwc3_google_dev_pm_ops =3D {
> > +     SET_SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_re=
sume)
> > +     SET_RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runti=
me_resume,
> > +                        dwc3_google_runtime_idle)
> > +     .complete =3D dwc3_google_complete,
> > +     .prepare =3D dwc3_google_prepare,
> > +};
> > +
> > +static const struct of_device_id dwc3_google_of_match[] =3D {
> > +     { .compatible =3D "google,snps-dwc3" },
>
> You cannot use compatible before documenting it. Read submitting patches.
>
> Best regards,
> Krzysztof

Will change the ordering so that the dt binding patch goes first.

Thanks,
Roy Luo

