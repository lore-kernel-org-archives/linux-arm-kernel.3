Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A38C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYuxKIpCYIcO+gJn+7H1gBQp96uaiFhZpQnHXL5+kYE=; b=Mvut6ftI4nq/9aboIAgYlm+jkO
	NvGYUiG5AVk7xIIiCIoUpU2HrDhpWiNyyQ0nEqzcbZkTXqMx83TioNz+0aSObfDDMQuBcIDJ+Tcxb
	eIimP+/Jp63SRLLQYr29hiFz4ey2SmivclhhXfMQIMz/LBWGpVp82Tbzurkk8cBq7W8jkXvHTsEgt
	9FBWKmPp3r8bvlK7qhZlTChtfaniSckrJEDKukR3iSa5HqZMZsQsc/S7ECS00ZSn7NEWzFWnn6P2W
	soCm4y1t+4L9QA+LkNrv83oS9h8/WbwCtqY/wsj7WajWqd+DHOb1vo8meFvYTt2/0yU+3SMwM8DKx
	NDV8tnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmvz-0000000Cvew-2GPE;
	Fri, 18 Jul 2025 15:23:39 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmtV-0000000Cv89-1e4m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:21:07 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-41b4bf6ead9so1320283b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752852064; x=1753456864; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYuxKIpCYIcO+gJn+7H1gBQp96uaiFhZpQnHXL5+kYE=;
        b=r1ZFGurOLvWOu/cgAniKViBSJxlCrvWBlt/X1tQsi45nusu/t3flRnxkyvDSrci1M0
         F23NuzvLVU2Ggf0TK0akxgDETP1vKcXul44uLw69/YhGA101Nml7Kyo8CkzSdQSxy5Ak
         Gs85boFiRENVVtHi4t+RzCR3W7sia/9AbEsVczB/Yi8LJB1BiRJznhwfR/YjTWZNDwYg
         uPgJD7Gs2XgYU/OUDvd1PyTSKoIvufHGXRjalj3ChD8JfIj7TUxbb+JH8U/D3sgdqOnY
         8t8FvntcZX5SOvNVUZ9dkHXtfSCoHCcY2+P7b8IB9IKB+rvXJmkeHOa6OuVigwBoajLf
         0HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852064; x=1753456864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYuxKIpCYIcO+gJn+7H1gBQp96uaiFhZpQnHXL5+kYE=;
        b=a/XErMlV1xu+lFd08MUEI+0GbGrwDB96aWDjhWRagC9RxrBvmOUAcxtCw7P2qGShpC
         G2RbbS1oNE0u7+kNwH8vf0jD1f86+RJR45S2RU+vvQKqjERNZelyUriukN/F+8/lTyPx
         dYey2BZ0RsZ4gPsJbX96r7jnrhjabeatzORHImn9Lr67OY54Hj80P2au2ZQj6RaJHPkl
         Dyy93FI1v4oZz583zTyneiSjY2AM2I28xx9GF0X8RaUggp7FKRmzHjPKl6rqu+M9ztLr
         qm7iJnnIKI6EV4xZlsmEmlVM3XiDLq0gdiSUocwR41c4wD+XPIXzs6n0jF11SU+fnzKs
         dVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUspZKxMH0zCuOIL5lUcWufUvv76WhXC2EF6x3SyHlQo/AB+EvwIPGp/ymVi9fpIjlcvGGwa/PCGZehGqEGZqFV@lists.infradead.org
X-Gm-Message-State: AOJu0Yypbv/q8aTDp4EdABFpF02xqSLPsjeOmQlBBcSzz4tINByBP9n7
	jtJweKEWOYcW7Q9V8P7OzEB+wRmJDd1DDgVlNMOcAv5axOrGRuQOwDFOoXYrScwUoDk=
X-Gm-Gg: ASbGncuz5WKtOV8yj9S94VhcV55CiY9HWGsRWEuRGD0hvsl3Hl7kpNtO8x0V9X4qeu9
	yRxVxu7r0YSCx2fXDxU2VtVSkwPxAu3oXcOfiVfmee2FSsRVnYz8q995OCNtO2ri8c/l7275RJz
	FFRcri2EpmshJhWoxZykRVKXOruY3rImV59WJdJxqtjQjmxAG9LMNzdH14+2IEpeQiRaIy1ibST
	0DCo/e80WEj9zbHQdylVCx8+ZTNgPiQLtmLQWchnJVlNdrAzjLfLdJxzF59ZIxFLpZlgWDE44aG
	bc5QPyAGA6VidVets9XcL2B0MyCuT3mhLJIatUSDkq+UwoAUShpIamFTEIHqm6EHazp24vawq+A
	Bpiiq+dWcD1o/KjtSNV0Q4o3I/P4jvg==
X-Google-Smtp-Source: AGHT+IFHYUOrLnCL26v1j/YOSaFa73FuGV6iSj194qbCo/8B+uaKvogFvTM462nA+ygYaDPEodMSug==
X-Received: by 2002:a05:6808:1301:b0:406:7704:b2e9 with SMTP id 5614622812f47-41d036ec35amr7991928b6e.9.1752852063904;
        Fri, 18 Jul 2025 08:21:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fd5951f20sm458273b6e.44.2025.07.18.08.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:03 -0700 (PDT)
Date: Fri, 18 Jul 2025 18:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device
 tree
Message-ID: <e4c5fe15-87c8-42d5-b4d7-09e3d1f7e712@suswa.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
 <95b3a17e-a5a2-4d84-960c-2539af9d5450@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95b3a17e-a5a2-4d84-960c-2539af9d5450@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082105_442589_A2830835 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, Jul 18, 2025 at 08:58:19AM +0200, Krzysztof Kozlowski wrote:
> On 17/07/2025 00:46, Dan Carpenter wrote:
> > Checkpatch points out that this should use spaces instead of tabs.
> > "ERROR: code indent should use tabs where possible".
> > 
> > Reported-by: Xu Yang <xu.yang_2@nxp.com>
> > Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Patches were not merged, so this should be squashed there... or you
> meant they went with Greg USB? Then no, that's dissapointing, you are
> not supposed to send DTS patches to Greg's subsystem.

I worry that I have accidentally stepped into politics...

Yes, it went through Greg's tree.  I'm just using get_maintainer.pl.
Looking at it now, Greg and linux-usb weren't even on the Cc list for
the DTS patches.  There was probably some b4 magic which let him apply
the whole series.

How was this supposed to have worked?

regards,
dan carpenter

