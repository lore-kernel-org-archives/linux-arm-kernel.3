Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67615D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 05:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPN2+ClNY4OUgw2QDwMQ8s5sPEe8deCfdS3jRkvBbD4=; b=jwUJ6qEbuWejQsIidaEqGAVxiX
	2luDX+tvuVXNxZtVFBljsABjVlFYPR0MHYYGIYUsFVTrcMJUKI85NVMO8XMSuoXjmu2UcT1wwuOAW
	3LkkRh7eXDxv9RiW6jbvskpKe/8yZ7aLo6fheN4zkcqYf9Y5v7ZUcpBc0KKGg2Tf2yd5qS9FBOWnQ
	DUOggHaGtHf2GcWbLaXgpqmnJJbkPn5pEqi1dGR8CEa6shzVVUZTgG81UemO3LKhX2oTn3IlTtVN5
	vuEdqBmCu1ALkN5eYmZCDSWf7LFsbpA8TF49oDrrJJd6I9BChmbNlBmCmp1cBznoCCJbcAu9CQI+n
	yHQHDgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5kl-00000005nEg-0jJM;
	Wed, 13 Nov 2024 05:17:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5ix-00000005n5z-28ha;
	Wed, 13 Nov 2024 05:15:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d462c91a9so4085356f8f.2;
        Tue, 12 Nov 2024 21:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731474925; x=1732079725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPN2+ClNY4OUgw2QDwMQ8s5sPEe8deCfdS3jRkvBbD4=;
        b=HLBcRMfhHdOnAvQWSp1baDuA4mO5ycagZA+1C0c8VfrB9rYWDm5Ez/EWUzA/7JC7Nb
         5k0oFgKG4nM9YrDXRpR7Gh5WBqKNkaSRI9q06z09MKsQYKycGEv5VxJCXe59O3pxJ+QE
         4NPYyuue+WxV6N08pdkKTrtlq5VntqEjEK8gibkObk4qeRoU1agTmQ5fZI3LENUJhue2
         o4hy54SyRXVbwxG3qBRx6UP76m7dUUc97Sqh2zim6VaLkpjHxhR9K9IOyei07Z7Y9i9U
         IPnzoCOhjrj/c71EwKm5RGHKiKZf6EoYf+pwrSG02yIx6cvWUU/OZVEF1b2fxvJzcyGu
         3xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731474925; x=1732079725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPN2+ClNY4OUgw2QDwMQ8s5sPEe8deCfdS3jRkvBbD4=;
        b=dMkEKRh/I9LXbDeuTovYCd2cYDtX0+Cjnwjkq/Arp2T70yooW92x4FpW9jpxQZPlpV
         PfxVzbj6jmv0McsysHfPkzJ1yh6Pt97VrXmCSuBuXGKNDbHcXtc5kTMb2AeP9qxe9QFS
         cMxY7jCnvmC10++VreThV5Ih6P2FhI8MWRIu1+8/QuSncjGXepeyJXtDEDIU83jbkAOq
         K+h9oamnH/x784G17yFkcXBb6SvSUBNXWKVGhH/zCGhPtMxgSNF6GIhfzzWapNScaB/a
         IiMQnaF//WGvHNEsPNGaT0Wr5MnTyjvm6H6OIRMFmFOPixOwANczuT+Liy7KLi3IFxQq
         SQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHY/E5eZMzVlGeWnltofQ2+ACuZZdDpyphzHz9tHnZArRACOdBMkme4EYp22uhCmkbOpsgXUp72FVMKr6uecJv@lists.infradead.org, AJvYcCWd/qUUVeVadoJ97rBTLpGh9a0TejNyVmj1JXoSb4yMmUBH61ttSEDcbvpXTMrjyhFS7CACYgZC/RbNC23cPug=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMB2mwydaR/tNRd+DleLYBg0gq6K/+2+aaU1uU7BfNRCswoC01
	YCzBxObJNqq1Kqu2K4uTo/JiSKEeY38Gxn7wPOP/IXLVSE2bBTfzlFCUI4osUXACuQEzzTfNZpU
	OOB5uruMv0PO3xTHItpcuRCRAXIT2gFBy
X-Google-Smtp-Source: AGHT+IE/zP4IJkvYGPVEb9b5NDmorppeghk3nUxzyj+9tdFlYYh5tXWjzAQV8KoaAiUa27cl7EKOb4TrrKEDwmr4/q4=
X-Received: by 2002:a05:6000:1ac6:b0:377:6073:48df with SMTP id
 ffacd0b85a97d-3820834b240mr3709033f8f.58.1731474924898; Tue, 12 Nov 2024
 21:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20241111045408.1922-1-honyuenkwun@gmail.com> <20241111045408.1922-5-honyuenkwun@gmail.com>
 <173135828350.1935626.3279818343954125790.robh@kernel.org>
In-Reply-To: <173135828350.1935626.3279818343954125790.robh@kernel.org>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 12 Nov 2024 23:15:14 -0600
Message-ID: <CALWfF7+KdqZT-FRzjAoXD5b1CXLWu-tk4FnSqeRRfuoBWvLzbA@mail.gmail.com>
Subject: Re: [PATCH 2/3 v3] dt-bindings: arm: rockchip: Add Xunlong Orange Pi
 5 Max
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_211527_571045_9ED94B95 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Nov 11, 2024 at 2:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Sun, 10 Nov 2024 22:53:25 -0600, Jimmy Hon wrote:
> > Add devicetree binding for the Xunlong Orange Pi 5 Max board.
> >
> > The Orange Pi 5 Max is a single board computer powered by the Rockchip
> > RK3588 similar to the Orange Pi 5 Plus.
> >
> > Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
This v3 version is now sharing a base dtsi with the Orange Pi 5 Plus.
So it's not a separate entry in the dt-bindings like it was in v2.

I'm eager to hear from the Orange Pi 5 Plus maintainer if this
approach is good, or if the boards are considered two divergent and
trying to share a dtsi is going to cause more headaches when enabling
features that are unique to the Orange Pi 5 Plus.

In this case, it's not as similar as the NanoPi R6C vs R6S or the
Orange Pi 5 vs Pi 5B.

So if we decide to use the common approach, I can use Conor's Ack. But
if we decide to use the separate approach, I can use your Ack from v2.

>
> Missing tags:
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
>
>

Jimmy

