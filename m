Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD16D339AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Q6EcbywE6ObkGLQJKdWlwUFKpn2ScLerpcjwePaETY=; b=K5nO8HIh/7OZpnKurawvi1BCwF
	q9BEBUKsBEvYpg9FZcpygje1khrGUtfuWA+JL1IAtRoHcV2h5tOla3uGBXNuAmi3+pqxXuduMh5HS
	9kGQUQIwzJokEebLr2ER2auYYwM+uE+6hFTFNoMQ/xWBRnGCRbBCEWUvbMSfKeMU8M7pj8B2G5goI
	owUhoIuxjtMKR4f1SwHakKlaLpNxB9P1SIfGTOkd7g63OEhonVHySwl8nxWXW8VP/C15s0cvooQPn
	B/J4ihzSBo17iHavRWy3/9WnrCP9qVW3D4/1/9DFJPIU8qMz0DGSZZk2ltvCTemOrbuDyNc++OYhA
	YO3uixfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRar7-00000009u5I-2ucZ;
	Fri, 05 Dec 2025 18:48:37 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRar4-00000009u4X-4BxD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 18:48:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so2782922b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 10:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764960514; x=1765565314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q6EcbywE6ObkGLQJKdWlwUFKpn2ScLerpcjwePaETY=;
        b=Tq9z631VxUd5Bj2XLtoKCUvgUKGVnpMTFLPXtJe3q4YCAXdV193ie3Xqv68M52Z814
         1sPECS890bBRa9OnHHho8BOSQakRyKJQYZDJW278l8KNSx0RmROWAZvCclBd72s4yDzx
         gtl5vsRwQwy8iwII6tuKWjqzYCFyT4kS+aZSKKi7pl/77Zs48KN19sGPQTdlhjOrKSFk
         z64WUWeYkjh3SvLv/S7tXm7nImVguERGDQxIq/v7NHzPZI8Jf6FgdyEHJiGT3mfffPXp
         ty5aFpWomXqK0Iy32N269XOoMuXUNXTXcINW2BnFtfIV0eAfcWN8k8ZN41s4wLBtHx/7
         cRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960514; x=1765565314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Q6EcbywE6ObkGLQJKdWlwUFKpn2ScLerpcjwePaETY=;
        b=RNpugVnmIx+OZt6spAdq/Z1Q5OY0xdqOceW3AF/IFHrAlPc/Ff6Km+bF9erx+5Zaaz
         JcSQ9m4Ig2f0Ho2vFuZMvqh8eOTqJTR3p1w03WQftlimjEjH7KLUzx92pcVfG3VOj3re
         aA4z+tEF6ZJMhmpwhJWJKKEMPgTj/t/eIWAIHY/HPRpQkzQsMq1d77+NaCYmay/zznYe
         cfJOqzCozcm5cXNEeR4OQJYQs//7juokZ3NGcOKLiRfQ6cQF+ForPIRm1ym7lsWxpAOR
         xuj56so7x27AuFFwhfy2Cr28XabWTxgCeoLkkyYoAxq2i4FTi4NNZVc1T6YXqShTee1w
         v/8g==
X-Forwarded-Encrypted: i=1; AJvYcCVRWDMCC3g3yRBmDlgDOdimuDXEiv2XBP6ZEe/LUg/h2F7deyJZ3T+94T7FNM9cnqFuRUjI2yWV+XhxvXxrhjOj@lists.infradead.org
X-Gm-Message-State: AOJu0YwXDpbBkF4FTcMXq2lLlEXJrDMi/EJdxyilpEsTHxOQ7bsypAMy
	k3o6b7ZbNAnYW2Xsw6usFBoBjK+NtgfbIGdcyb/JBEfzJxfA8b8hDUcMU5XUbDnBPrfBtkO9Ufs
	Wi+WHC6Wjheztb/m1GacWoAfWhXne3miZYXqLW81l
X-Gm-Gg: ASbGncvUps+eUtF49KfvkZ04ZH0waMOg5j0y2RejJZX8JDmTI3MdrLSdsmgPFrnWhpO
	jK0M51zOOlmYy96XAq3wSEike5m9iXgbdiJiFkqAHGDtKJ9HFlNep3Dcm1uEhtWOZ0GLj6drfOa
	YEP3kxIBPld73MbjpJtxPMi6uc+hk9Fe6BHkNM0Quxc96tkrPXg7RDc7M+RYOTRfbnyZF7E4mX1
	K9ue9lHad+JjRfFAHXxBJNP8f6VzgnciaRMQbaoqiVMtAShkdRHEZzmiOUljzIoUjVIsVmWprYa
	MsV6cJ/FfVkSQ4uFmpEoLLcKqtcTyMEdPNXK/w==
X-Google-Smtp-Source: AGHT+IHPjKxmUgUnc41hN8InTFTUB04ZMTHM8NxbTIHlyyEkurGa6h5cB+riJJxf4O6UOMxvtJ+cStktzfIrQZXN+UY=
X-Received: by 2002:a05:7022:24a4:b0:119:e569:fb9b with SMTP id
 a92af1059eb24-11e031662c8mr92285c88.10.1764960513510; Fri, 05 Dec 2025
 10:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org>
In-Reply-To: <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 10:47:57 -0800
X-Gm-Features: AWmQ_bmySTT8joxXt75c1w2iUmXVlvf9G0SNEi5yExzmfdZw7r8lYP_ul02mNBU
Message-ID: <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_104835_060050_6A644DDA 
X-CRM114-Status: GOOD (  26.63  )
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

On Fri, Dec 5, 2025 at 9:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/12/2025 04:54, Roy Luo wrote:
> > Document the device tree bindings for the USB PHY interfaces integrated
> > with the DWC3 controller on Google Tensor SoCs, starting with G5
> > generation (Laguna). The USB PHY on Tensor G5 includes two integrated
> > Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo
> > PHY IP.
> >
> > Due to a complete architectural overhaul in the Google Tensor G5, the
> > existing Samsung/Exynos USB PHY binding for older generations of Google
> > silicons such as gs101 are no longer compatible, necessitating this new
> > device tree binding.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
>
> Why intentionally dropping the tag? How are you handling this patchset?
> Rewrite every time from scratch?

Hi Krzysztof,

I dropped the tag because a new file is being modified in this version,
Although it's just MAINTAINER file but I thought you might also want
to take a look. I wasn't sure if modifying a new file qualifies as
"substantial" so I erred on the side of caution. I should've called it
out specifically in the change log. Sorry for the inconvenience.

Regards,
Roy Luo

>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/s=
ubmitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof

