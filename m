Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0486D3CCAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 04:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6fjjXfXdXI+f3gfu+7LUUm7YVOdAS+PartG2/fB8Co=; b=Q8Gb3P5c3/YFBRvPSIY7vUDwLy
	vnMzUAMFNLLPGUVEUAYoexZyrYrQvuJhftBL07jEKUDP8p4YW27sk7Dd/iGxw98VS46Trggws53go
	ZOI1kdYgqg3T5C5dYTN6aVS+rd6+PeeDY6psR935BB3bfJ6JJ/R7ISogO+EyyVBp7zohJTEVnj9lo
	VlOvaPb+8fuGHSKu8oZI1Xxv/ICTR3ljU5QuzWHS/rJR2hZdyss5577H0l60JGBsZMaYB3VsYEdy+
	JCb1ZZb0wjkp00nHs+xbFiUVM2iiRq7wd0t0+SmE8K1Av80LoS/CnxFdZd9lk8smPMtvGxCJN6lPt
	AVGjkasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgF82-0000000BmK5-2kyl;
	Thu, 15 Jan 2026 04:38:38 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgF80-0000000BmJZ-0dG4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 04:38:37 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-121bf277922so673421c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768451915; x=1769056715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6fjjXfXdXI+f3gfu+7LUUm7YVOdAS+PartG2/fB8Co=;
        b=nq3HiRhUa//DlwWYCCND8s8K65k6Rnwg+/v3s0BIFJhVPpH2HxNoH5MokXB6jUmugo
         KA9nVH9/82K8r9gZ4jBuPRfDogbodlavgJMa+kn7FdRlrKC5dSRJ7PXwoNMkLjD65w6D
         RvfWdIWDEsqcNAPj41pWKBrpJCxSDrNod3yKCsUOR22ird6y6fWZMWpB0al5VQ3vh1On
         zdxm9t87g5xyTxB7d6VaXgzNfUL8MoOtkmh3a9uDLSWGcTS+YFEFjL1MVELAU7rRXvfk
         sCqEnahA3BUOLzidwnYkx1mJ86aZ2v4EnHbX4lxJ26vPnL9bSjyjDplMQrrFyt/sKNq0
         aI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768451915; x=1769056715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6fjjXfXdXI+f3gfu+7LUUm7YVOdAS+PartG2/fB8Co=;
        b=ZtjSsA5cQOqZPRGfqGxMwN9p7IuTy1x1LJDsGQsEv5AaB3lj1/mlL5/Mp554uNMCyE
         B3bgqC8yqkvcAsvd1UZxGHfwuYtUPzvevPYO8ogIC/TkMQBlxFqWltbKXeDrzTqgvFVx
         Zergq8oBQtnv1N2V0PkzBuLJD8rIEy5fygCh0UDR2P/w1TkJiEBhBvkZlomSSpVMXhxc
         GzxFoarN38j6RcJ2bL5CR8F1SvNstHf7Nz+VS7M4Wlw7OHiZ/86Kazj4CG3oFPsymFgu
         /yD3f+CijP3VR5pOQrzy36PUCifnUqnV1u7+FUTKfTCeP8TNATnod51BhVyoVmMDOhIi
         DHYg==
X-Forwarded-Encrypted: i=1; AJvYcCXhWjySs3bkuXtc9y/ylF2HhQEeolCCagSA+jhe8VbN5SX+W5sVoff0/zTAGCD64LGrf+554Pp//Bjm2p8bHJQJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxDmJbqGHPrF/ZcuyAM8arGSN4Ps/00nq/vE8elcgkPK194ylvO
	mSIMA6lAha/GH46xOEBl+zZRp97WEUjeejYyJkwJPHcYvgVX7zXJ2XiQPyWl3XxLheWtO4TL0r9
	2W7JJwDb5BCJ9F1CRtRMcja9EBRhBwJw=
X-Gm-Gg: AY/fxX6iyQCqIVMFNZVIESmwEyZF5UeuGWIa9C7hnFU0dN5aJKteoBccUMOgPkiIuDt
	eXmNMvJyv7tjhqaG+P4JuxB1FiFYYmcgr2GJ/MxbTPKz9hYmewk1Ca6HYcwGIbrf9f6XHOvX9CQ
	ptqupBNMMijewkBRA/FluUnwKFtbqr1tnN/DoI+w7KPbPdDvLweyK0/s/RqGUE8URgOYWlScZd1
	tVckav1Q1x3DhrV/YKhMWFKDIUZHKPKLgW3+GIOYQDUR9chwGEkzWSFFcQt0/CAYw9zw6pTEw2q
	awBK7g==
X-Received: by 2002:a05:701b:2714:b0:11b:ceee:a49f with SMTP id
 a92af1059eb24-12336a247cdmr4745181c88.8.1768451914862; Wed, 14 Jan 2026
 20:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-2-anirudhsriniv@gmail.com> <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
 <20260112-whimsical-annoying-fulmar-25e4d9@quoll> <CAJ13v3RKydFK+sP_Cm-HnQjsOJSDyX_dsGs_Yy564V=Wc7tQFw@mail.gmail.com>
 <e97b7a193f8bbfca9ec00037808ad80a5baf9f00.camel@codeconstruct.com.au>
 <CAJ13v3QYWRfyivrbP=+hreHuMkYWGPkngW3kJyq6xNVL6YdpgQ@mail.gmail.com> <0e611132794491eecbcd3426222b6dca09a35b84.camel@codeconstruct.com.au>
In-Reply-To: <0e611132794491eecbcd3426222b6dca09a35b84.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Wed, 14 Jan 2026 22:38:22 -0600
X-Gm-Features: AZwV_QiAZ2miykzbN0XeJ-opRxy8zZQtPtnuJhtoFTPjOMJKnrOQBUdwpXszwIE
Message-ID: <CAJ13v3S+u7fi2h1MUQ1QvFm6Ouz4TDrNwJq3fJvDmBf37h8LGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_203836_195411_08219E70 
X-CRM114-Status: GOOD (  17.96  )
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

On Wed, Jan 14, 2026 at 7:03=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> KODO is pretty consistent in the firmware update file name. KOMMANDO as
> the product identifier also seems reasonable, even if it only appears
> in FW_DESC in the latest release. KODO -> KOMMANDO seems reasonable.
>
> A brief bit of binwalking suggests it's an AMI MegaRAC implementation,
> and so I expect 'SPX-13' in FW_DESC refers to MegaRAC SP-X[1]. The
> significance of 'TB2' isn't yet unclear to me.

Yup. The screenshot in the PDF you linked looks a lot like the webui
on stock firmware. AMI has sources for a bunch of stuff ( "unmodified"
source tarballs and patches to apply on top of them manually) over
here [1].

>
> I'm not super concerned about the length of "asus,kommando-ipmi-
> expansion-card" - I'd prefer it over incorporating the 'kodo'
> contraction.

Understood.

>
> I guess it's still unclear whether 'kommando' is a (future) line of
> products or refers to the specific AST2600-based design. Perhaps we
> could solve a few problems with 'asus,kommando-ast2600' and including
> the phrase 'IPMI expansion card' in the binding description for
> something searchable.

I will make the compatible "asus,ast2600-kommando-ipmi-card" and have
the model name in the DT contain the phrase "IPMI expansion card" for
searchability. You mention about adding something to the binding
description (that'd end up being more than a one line change to the
bindings) but we could just have the DT model name have that
information.

I'll send out a second version of this series shortly. Thank you for
bearing with me on this. Naming things is hard.

[1] https://github.com/ami-megarac/OSSW-v13/tree/master/Core/

--
Regards
Anirudh Srinivasan

