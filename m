Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25563E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBSfrxpuC6OsYhjKIDRJ9B4wUIGyoKbNlTGgOlRrFlA=; b=Q1/dRsOZy5GsyyQVsVsUjUXFea
	6gqdfCT7nfN+8Ca30kZEJy6sF/jGkbdVVlHfuIbPDS1n9EPYAhxwXdMNsAKMEYxi4+gSJWGwoZXzw
	fT1+25G/4gPEWyIAIcDoG/56FyaOGfBIJ3Ua8dkOLIcAm7YEPM1PaeV1UWaQuTvDumvy+kw+1cxAB
	F6WtCLGGQFK/ZSAY3DX/nwaTu9c3gSMWtJHHtwfTAhdIr++4ZwP7LgZU08qr1DGH03jUoghYZgHZJ
	QWVtjdvYRk1V1L9fgSL+0P3GdC1xRPMTz7KnpweO2mHC1QORIJG8xnC9/LcpLF3JUJrICEAl2ErXA
	eej+gkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9AL-00000004sD2-0V2K;
	Tue, 07 Jan 2025 12:58:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV985-00000004rcR-1Zxq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:56:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so153961805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1736254576; x=1736859376; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yBSfrxpuC6OsYhjKIDRJ9B4wUIGyoKbNlTGgOlRrFlA=;
        b=daHzqQUBNhFx0K9BkqXSTF98V0E80cMJ4j+cV4H2r3jhhXabiXuSS1DRjf30mk0V9h
         oROQ3lahI3Um1+MLDVno0sTchJL4briNoYkApd//O1nQpphw/tY1RPEgnDc8YKYIAkXa
         byoBrtqn2ROKZhSM5/b5h0bfKQA+obyqQXM2Eoo84AjgtQjIAbdmrj+eT36sLi5W8sj9
         uwz/NzhjJoQxmzfAYw2gXmoiDRl/xCwgzoA0Me1B7nJ8DuSfsqtWRvAIW/nPpWsL7BfG
         KWxtRXw0eWUY/Cu3i7xlTz+HSlEGK6npRvRXAZ7wFMFhoaD4CKDCU1jrYkqjrQqgfkuv
         gPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254576; x=1736859376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBSfrxpuC6OsYhjKIDRJ9B4wUIGyoKbNlTGgOlRrFlA=;
        b=bYq3prxiUZnzuOAonsI0IIWVdX0Jct25oPlg8Mn8G/feeES0zBLIHChaMlkbAUuEff
         uKdIpr1UaTyjzHmfd19CBCt/uxJBqbNW6nctm7b6UogFqKdBBouIy/mtGkDUEaUn5hSd
         iDq9VN3GYYaBD+5SPt76dJxuiGVejE8dSneo4pbW92yalCcjLXiqjNnTtJ3YBxMmqOOz
         DnDRo5k9mnWxGUzjt7cJSi8o+7bRJwpDYnfME6iMEG6Up28Um1TRMpr/Z10lczBx7CvS
         4zalu+gOMBFDmnP22QW+ou7Fmo7yF+HEYV+573X1Qd82m0dxt78iq6Y1fX2Hnb402ZND
         jsKw==
X-Forwarded-Encrypted: i=1; AJvYcCXL7dH4M35D25/kMtqcS9Mu0xlhg7zd1wx5iSQ41zRJT6HXJPC4d1Q1CnCmPIWtbjC9s8rrIGBRFLm7zDAztu5F@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxw9deTt4W+tvyvy5rRDL1UMlIYNvbjG50IsoRXp+Li9l3Hy22
	/ztmlpBalNlqRdG3fbhiFX+zNBUaTqUnvUNYoiyAIQo4Yz3XOzFm6UeNEIqzgXI=
X-Gm-Gg: ASbGncvH/l7FybHJEgKg0zAeOQ3GEPYLfpe0rWqYjiY5AhKQtjA1pKT7+OCjI7dox/O
	CeApElukoHXZbJMpLGpn5q5inZBQuwClVEkWy2HJZKLfps9+aYeWhEIjwZ87PdP/k6ZMG2FA05T
	tvjvCST3fE6lzrUlQKevkDT2qEE1UrdQaK/7tlZRcgIaWiqBfOcy0vXICofO0XohOHeY7vuwPHC
	UDwpl404qb93MsGJaNL+2+LreVS/24AEExG7uZ2biAHWHqzATLWmbg6xLCSPc+Z0+hfEsCzb6wh
	IUfr4ysGx683IKc=
X-Google-Smtp-Source: AGHT+IEmps/wVpiEbRTPlIfFaxVLghtVlcbTA9GHt1AXFR4/nEGjdiruq//V5iuCyK9uhhdBpld1xQ==
X-Received: by 2002:a05:600c:2312:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-4368a6fb89fmr383424155e9.22.1736254575701;
        Tue, 07 Jan 2025 04:56:15 -0800 (PST)
Received: from Jessicas-MacBook-Pro.localdomain ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea487sm593720325e9.8.2025.01.07.04.56.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Jan 2025 04:56:15 -0800 (PST)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id B3086CDDDC3E; Tue,  7 Jan 2025 12:56:14 +0000 (GMT)
Date: Tue, 7 Jan 2025 12:56:14 +0000
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Rob Herring <robh@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
Message-ID: <Z30kbmA-3h-Rhg7l@Jessicas-MacBook-Pro>
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
 <20250103181623.1980433-3-vincenzo.frascino@arm.com>
 <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045617_414713_D5D2EC04 
X-CRM114-Status: GOOD (  17.46  )
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

On Fri, Jan 03, 2025 at 04:14:31PM -0600, Rob Herring wrote:
> On Fri, Jan 3, 2025 at 12:16 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
> > +       cpus {
> > +               #address-cells = <2>;
> > +               #size-cells = <0>;
> > +
> > +               cpu0: cpu@0 {
> > +                       compatible = "arm,neoverse-n1";
> 
> I'm pretty sure the N1 doesn't support CHERI/morello. Perhaps
> "arm,neoverse-n1-morello" if we want to capture what it is derived
> from and since "arm,morello" is taken already.

Rainier is the codename of the core itself, and Morello LLVM recognises
-mcpu=rainier not -mcpu=morello (there's -march=morello instead), so
perhaps it should really be "arm,rainier". Though SMBIOS reports it as
Morello-R0P1 so it may be best to use "arm,morello" here.

The real problem is that the board compatible has changed to include a
generic "arm,morello" node, with the argument that a v2 board could
appear. So why not instead change *that* to be something like:

  compatible = "arm,morello-sdp-v1", "arm,morello-sdp";

Then you can use "arm,morello" here for the cores.

Though some of this may depend on what the FVP's DTS looks like; is it
going to claim to be a Morello SDP, or does there need to be a common
denominator compatible beneath that it can use?

Please CC me on future versions of this series.

Jess

