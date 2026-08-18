Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2BBC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=; b=JOidZHF5RbYkfAV2JDyhKC8F9V
	qLfiXstCixjLTWD7bqB/PzFS5ilTnBOU2ZdhPHlk/5+zfGbQzyAZyI7dzC8aLhXHF6mjNDGb3wBMu
	8kMMYwDAA+rtgxG2QMc2EdjXtlhdXJFrhIFgW7P7uyU+Avl1GUvFEQrzpmwOznDqLjL8dIFqAuqNh
	HXhz+gIdWdJrla4LPr3Jfi+qBILWkvu8GSntpVkqQ+/nmYooFHMASfqt3+81/83k6w5iBDLtijCx/
	zzXNg7rL9OYmEN+0+CnON7V9RX4h8tZLDvYD09cdyu0/WQuRXmWuvX6gjYvRqEBWfj42kBbvoNzic
	qR13rRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKWB-000000086G3-2ehB;
	Tue, 18 Aug 2026 14:10:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKW8-000000086F9-2XqI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:10:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a18b91fb1fso818956a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 07:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787062214; cv=none;
        d=google.com; s=arc-20260327;
        b=kN1eR7w6Jx0xwNeiGD4Juu+c7VoJPRCiGHq8Lv3QYRjch8paD7xMc5zXSOIQIB9KWd
         HzS+XEoTrC2O/eNaYSSx1WLS2TiZN5F0R7kHngDavoJy8afd45XEfccTJbRpMb3wO690
         bTAcDJN+icwsvwH3YjHE2JzEPMoykoJn1mS0dd89QVOTKXmcpMNNguSnBZT1GK6rb9jr
         0DsYmCjYde1AaOPV/MLasdLE55EwKEZlE+CbVXjWtyOHQDOm4gv84I1a4/pWlCnfk2mL
         j3oUTHk2KkNNT6Opj7zbUMlvTEk3l+L86sQPgC0+E355rrr2azUDHpbLoJgleISGtmAA
         Bncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        fh=c/srgEiPrWDJoQptlYvCkm2i24GYqxT7RJRWne1WKP0=;
        b=RI8R+ZGOonQsEv1mSndee+43cLaNMSt4/FG8YgWlKFrBV68PWwIorBHHQEAJpkKv1f
         vhvo3C27tLxK6XRLBWztbkT3IvJEg+mJ8U2re74XyADydsFidAgOB+IEO/A+jzyt8to6
         HMOfVlXAMPdpDgzQykIVFfFf43ELQeBMOb6ajuQNd9/8p0xNIQMl6UuAK44XvY67l8CA
         iIDedXtjAC6PHUYDdyoLAIUbH0xYdv7oSJNBgZFa8eTUnuVg04YDyunKfq2strsCVQM5
         8qNLYcUCwZr/dPC7jb7dLYrJnmZumnELB+yKcEnI4q551TX35Xtk3tyhsl/Tn6Ch5m0g
         itaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787062214; x=1787667014; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        b=hfews4weKXqoZksuFKqLBn3VbTOicwp0hyVCxTaQdP4IuRgX1Glpy16yk2iwpv90VM
         LlNWgOcapNDawSlhysn8c3PKDqXGaUU7R424pPW9vc8g7BGoI2JixFWgqpF9/IeH1O5u
         aiKgVWpgiKJj9sW09zPPHmXLs/7rEHvfY6WiXJDkdySF+V0voAxoYQlF0tvsJCWRAozV
         jLoP/EfaTn4GRc6oRzCCAWoVOME9V0OZ+QY6emiQyHrcabj3xoAgOrHyL+p5xhgvhWC5
         XtOF7Yz+NRQRTRPWtTeAfGIQchDQX2JNuO5ImAwgTfc5So/T5Y4RS5anEVUEwuksnJ4R
         loSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787062214; x=1787667014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlXqdOv5z4xMnW/WIr9rPcU6Spl+WfQOIAJPu4c+j/E=;
        b=ax0jwzEp0S61qeUNKENWTC18Q4Z3TywF7YgvzjbS3UKqV507mvOexkNrJUDvHwHDuJ
         WchoS91FPBDB3NfZCTTbn+zRFAEdJJ706wtFRHxaqDPJ3k4+nWah4BMrP3X9Cay1C0WG
         xmSzyV38mAL8k2+57bdnaiiUy4mFTr6kyO8wtmal5ocCVdIYYZfy23nhC4qqOihaQ0rc
         cnRdeCZkFOAR8evOn5qYVJsRs/wEwbTcyivAfBg9BQMGVVYrU9E6qlemRPIhPKmlhadr
         SyVTAJaUZarwxrBXVa8MEELD53xTuHzfxoaOzsSDJu9t4izvG9A+Ku3nMNu2m8HPT007
         9E4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqj0Oo64zZbbZKZQXeG4MkqKgYJmFzp53O28X0Mw34YXfh6oy386kZejFpwtxWzAyfgWCEA4MG3Rc6UMihPDAGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxboS1870gUqMF5GKeIskg+MufSxBbWXCa1p8b7uVRPHR9mfKuG
	3gaJ2NU+P4zgIACe+Y7AEspiYQbLlNmhe4Hh9HGXppuqINv6NuJ0GYIAgVyH+UUsNHWVT3fAkxG
	+Yr43r7g4q/6ngzx30qVdNjqAzUlCbZs=
X-Gm-Gg: AR+sD121aydJWD6iNOKQUT8LSl53PfFm4bKq64fbx4zPC1EXxxb53aqffNAehbhxFZL
	Si/M36wfss85A0zEIq3F/aGkP8ucQmlUs6r03/OeRtvu106I2pHRPuhJqARA41/sTftZXm03zVq
	HIgqHY45rx4sWojv8aCNIgWQen6ZWtc3bzPxVDwy4LtiRVkjF8V1mDMDzGVPhuB3U2NsREDy/y9
	sBXGzq9k/niyq3h3t7PiBjm2O5P9wqouTZvIBoJbmMchvdzmp3fy9BSGlr62RNtIhPNwGK0CQvy
	q/iFN3rGF4f0Hsuz4cU42bE7JK1bANEDt9dyb03ebdbo/Qc5MPG7ERgQUPCpWLSpR9tRDVOrJer
	Mpf8wkcwqS2UzZQ==
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id
 4fb4d7f45d1cf-6a38a8b7c62mr9115636a12.1.1787062214328; Tue, 18 Aug 2026
 07:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com> <20260818-convivial-manatee-of-jest-acd3f6@quoll>
In-Reply-To: <20260818-convivial-manatee-of-jest-acd3f6@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:40:02 +0530
X-Gm-Features: AcwNN1VkFAcXdnV8Yz--n3a3WkMmue2uYHuue9khptiKYSaOQgn4dqIhHktkVKs
Message-ID: <CAOWyW_4BrU+BO+KQjH1M525+0y6_YOa2C_3sjrxPzzgT46aNJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071016_660626_35BC4D10 
X-CRM114-Status: GOOD (  16.66  )
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

On Tue, Aug 18, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Aug 16, 2026 at 12:23:00AM +0530, Bhargav Joshi wrote:
> > Convert the Texas Instruments Keystone Device State Control binding fro=
m
> > legacy text format to DT schema.
> >
> > During the conversion, the following updates were made:
> > - Add "simple-mfd" to compatibles matching existing dts usage.
> > - Add required bus properties #address-cells, #size-cells, and ranges
> >   which were missing in text binding.
> > - Document child nodes gpio, interrupt-controller, and reset-controller=
.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> > Note: Running dt_binding_check on patch will yield a warning for
> > 'ti,keystone-reset' in the example block. The YAML conversion patch for
> > that child node is already in progress here:
> > https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-=
1-189389503324@gmail.com/
> > ---
>
> You need to send dependencies together, either in patchset or even one
> patch, depending on the case. If this has warnings then it cannot be
> applied.
Yes, but ti,keystone-reset is now already merged into linux-next, so i can
wait until it is merged into mainline then resend the patch without warning=
.

Best regards,
Bhargav

