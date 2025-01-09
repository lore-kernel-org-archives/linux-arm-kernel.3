Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5440E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij7chTR52mv9qNBFCE2hpAp3mYEyNOHKiG4EkXfOeAU=; b=w4LkAFh3FDnP2td3vrsEHZpuTa
	rRBcCSHE0G/o6UF3cIwSIFV+RU/SQrsPTbRcS8NJtBAgzl9jQbOPaGBnBw7LDny+K2vMufi5x0OHC
	yedyGp1NIBp+yAsxe1e7SEp/+6PEs+n+xwBhaGymaBwF6SYH5YlYTX5as5xCeB/Io4NgNyOyUvSOa
	emUKJS3jsbaBDU2QSXauzFJ0MGlom6XEB4EgKRcXfWN3btBnGqUN0QQuBszgGifHO01R5+Q2IIZLV
	MhTKBqqNRrb6X9dk9g5aOTXI0wXZ9Q1Oe3CwnaX4JP+XTdzzuSi7B8gPSFuPNY2bdNBvamEhHNDyK
	z2xFK4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0TF-0000000DPe0-0Hu5;
	Thu, 09 Jan 2025 21:53:41 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0Qr-0000000DP0f-43qD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:51:15 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7b6f19a6c04so116168485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736459473; x=1737064273; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij7chTR52mv9qNBFCE2hpAp3mYEyNOHKiG4EkXfOeAU=;
        b=JVl+9OUo7uTx9mEXW5L2pr4haHoHS+fDyQ9IzVTKVXctrDRn08bWI76bGizGKSFeu2
         VASbLcWEL340JBr9FLXUl6H6HvahEq4l6KgoWCilGGzyXQ6I/YwA47vNRcMAAkIAWwj4
         52HKaCLFgz6rpY082oHInKC1tffzHHsj04VdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736459473; x=1737064273;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij7chTR52mv9qNBFCE2hpAp3mYEyNOHKiG4EkXfOeAU=;
        b=lXjXXT4+2w6SAxXQx+54abB0dFYIlXijuT5Lv+VN3ehO31F5ySwuQHp/KxsMM8W4W+
         BAJVwbD3TsjrbkhwOXybEl2hjmW35mG51ek/mkeINL3J7yvv+nBW7vunLZTGJbjS2tRh
         w3uj6BLulNhxz+VLCe5wgv9AUoB4eBeTzC55nZMoG+Jcm5JB9Q20orgrW2QPnd9hXjJ1
         2iD14SGFMsYSKmR/IZ/CHurhyuPzTOLt7Ryx69G3kr1eB8sBYAPbfT3CvcaXP537WguS
         9KuhkkhfGl1kToEBFZh9b30ISAdnuN9c/9kTqQsnrlaycl41rknzdTGoMikZOEoULh+y
         UnkA==
X-Forwarded-Encrypted: i=1; AJvYcCWWiVoaBwGjRzgDyHs7xi25YpoRgXfRetZN5oLNAUYYhNy9sqroIjRBqaoEOqRpEOA/sMrhPwW7LFPqzhHARm/H@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ6kwV0ZH6nwfn0liTCxWnzKXh2dK9tLBr7MfMfq/yPpj0OP8w
	1SjcTnj2os1ID5gNBTYY0IgGnt7+XtH6iZ1cbUbC8tEX0ogFvhbdlVIoIXoKkY9aCGrDtR7I6Oo
	xWY5YUugeBm9B49VrN3JD/Od2SWZw97vEtTxO
X-Gm-Gg: ASbGncs4jNdc/6gp+ESC07TpILuadFPT4w7pVQdH1fRMUuS7+K0zNF/ZA8l/w+yxzzg
	NDcoNM3LVmYiK+l+axsHqcB93gBL/ZuCY2JjR5va/Kc5uW9ekj/Rc1ed3KhgOwqR1lw==
X-Google-Smtp-Source: AGHT+IHwh/7TYBr+p1emG57nZgx8kct5B4lA8ljc62+a1rq3c+VxjnFrnfGmjZb2NxxSfqge856AwGpQPsgIVQ3q7a0=
X-Received: by 2002:ad4:5748:0:b0:6d8:850a:4d7d with SMTP id
 6a1803df08f44-6df9b1cc40fmr138466756d6.2.1736459472811; Thu, 09 Jan 2025
 13:51:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jan 2025 13:51:12 -0800
MIME-Version: 1.0
In-Reply-To: <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com>
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-3-swboyd@chromium.org>
 <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 9 Jan 2025 13:51:12 -0800
X-Gm-Features: AbW1kvbQxCeGwgjzsKJ5KBUJJTsO-S_0RiV9cyqbOkGsomJiGfEijj-ht5JgDak
Message-ID: <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_135114_028430_A9C5C915 
X-CRM114-Status: GOOD (  20.03  )
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

Quoting Konrad Dybcio (2025-01-09 06:05:14)
> On 8.01.2025 2:28 AM, Stephen Boyd wrote:
> > Document the Qualcomm SC7180 System on a Chip (SoC). This SoC is made up
> > of multiple devices that have their own bindings, therefore this binding
> > is for a "bus" that is the SoC node.
> >
> > TODO: Document all child nodes. This is woefully incomplete but at least
> > shows what is involved with describing an SoC node in dt schema.
>
> I'm not sure I'm a fan, because...
>
> [...]
>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,soc-sc7180
> > +      - const: simple-bus
> > +
> > +  '#address-cells':
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    const: 2
> > +
> > +  clock-controller@100000:
> > +    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#
> > +
> > +  watchdog@17c10000:
> > +    $ref: /schemas/watchdog/qcom-wdt.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - clock-controller@100000
> > +  - watchdog@17c10000
> > +
> > +additionalProperties: false
>
> ..this approach will make any dt node addition under /soc require
> an additional bindings change, which sounds like absolute madness

We should pretty much know what nodes go under here though, because it's
a chip that exists and doesn't change after the fact. I agree that it
will be annoying during early development when everyone is modifying the
same file to add their node, but that problem also exists with the dts
files today so it doesn't seem like total madness. It's also nice to be
able to look at one file and quickly find all the schemas for the SoC
used, like a table of contents almost or a memory map for the chip.

One thing that I find annoying is that you have to put the whole soc
node and child nodes in the example. Maybe we can omit the example
because there are so many child nodes.

>
> I think additionalProperties: true would be sufficient here, like in
> Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml
>

Ok. That binding looks to be for the efuse properties of the SoC node
itself? I was hoping to find another example of this "describe the whole
SoC" sort of binding but that doesn't match. Is there one already out
there? Should I move this binding to bindings/soc/qcom instead of
bindings/bus?

