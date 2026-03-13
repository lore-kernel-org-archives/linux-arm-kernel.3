Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6127A107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=; b=Ue6MNTX29J+2WeUJ3jf18Kum8w
	Tt6inyWC0uKcdUTYB/0CcJnDYIwRRpF8swWkNSvvlwGYpdtO6YUwq6Dw0uygbAK4+8zUWUVpO89sT
	lDB+kMJcPCUQFk6NMHeB9BAQpJkXd0WsZpR6qQfS1NI13iOFEaTOpF+b8lo18PmBI/+MQrwC0NmrH
	UIXCLeMJmEQzNWa++zoIOlAgr8+nn5XcI5HHvWV9s2QGUwOY7Ynv5wxl43Zbmam62XXmDcDwDBCmc
	amtw9tS2JxOMbnyWaP8l1SLFaKjuOQlyqOt4/cy3MHdupKlvpe0rYe+OYOytTZ7znYA2lkgZnq+3G
	Xg1O382w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18ER-000000014H7-2LOv;
	Fri, 13 Mar 2026 19:31:35 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18EP-000000014GG-1BYp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:31:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so21587041fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 12:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773430291; cv=none;
        d=google.com; s=arc-20240605;
        b=hvi7tTwSnPCgHlTCIiSgNlEtI4cDBtvHrcr6XWHcbeQHF7LkOMtWZNHyS9ied9gz0t
         yOODdwtuFB+PwDVm6ioQ4UJ5y5gHzit25rRRZ169A56qiSWjoZDLMCHWMts7JDFLyvbv
         zviPXUx4h9mzyYL/50reVRcA5HI/IlH8btJFkSOhuMjs4NAtCRIODv9NMG3wPGG7I9KQ
         8FK9ywhqWLlRW/2g6WH38dhQ86nPf5dNlmX7CxJ+ZmLhOI1qKeNzXbCb/fwDIZbUc0jf
         RB55FkckOYrQkzP8JotHe1ZSLk+l2600yulPqeZAoli0UflwqHUrWxAsPQV+p+zX9xFt
         TWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
        fh=09xlfnPGbhtRckDKzyHwFXctn9025XnQMuThSOVqYrc=;
        b=aSQuontd36b166PSfJgjzU392Dkv3ob/R0ZzpKFzCmcZuOiim9fLrgplnJvfDYqxxB
         wZSyUn3+apT1RyL+bO6VD193Pfy/6DalwFirH+ReV96HeJ/EuSe4nIg+cCZhECqqp/wD
         BKERPcJQwYc9kEP0AMBOg2KAUkNdTRjjAsbFHIXHeyU7/2e/KA5/e1WW7UptgKEtq4vJ
         sHaOxOpSQnwFhq2h7rhuwRM+m5iDx9KldkfO//7/sZ8rz9gm3bRi5nZG53+jUJ8Fi7EE
         Bgq+xCbPkl4rCRkf4fQBBA0cUBnLlig7A1xTT/dmuYWH3ZMjdaMrfXBnVnuVcBLZz9M4
         Dzbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773430291; x=1774035091; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
        b=duD6s1cxQ4LT8juT6yCdTd67I+zMnz7GaqGdPx2lOFLRb6tD6m9WsVqMsxYR/69UBG
         nrV+pkjVJ75JCP4L7M9qaznMvwKVIxHunR+coesSaxd2fbrAhQ/1hsHGRgM9y5bQ9tL8
         53QXoihiTsOZ3rLXVuMcODbwz/yaH/USD8zGGH+cCKCZB5lSxtrWuNvMOSHV4xWFkcT2
         yAu/hNn9ABhAEVPK3ULZbJo/2gPokRnprIyw+VKJVlW/Kcze+zLgS9QtSE+60hk+HYdF
         inFUQJ2dgNuArK5vCBVSiwnIdw7qQSKt5eSaVO2yT+/9nMmpRMg4oYKsVsbZCOF6sSn8
         HwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773430291; x=1774035091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qk9o5w5pN/whF6xyjkdP2hsByxiZCU1yFYz//xI0dw=;
        b=XFqOVXyPqeJhwG10iiKnrwK6+tkYOEvP+hUWC7M9wQ06Esk53+Cs186Wvn7JRkboTy
         g+RJuwGv51t0VESwUKNOzFpih7XirlNJVYCt7pwRbg3ZWSZBd6T8qbDJezBJDi2h4aZD
         azu4H3r8aPEBX0fpyF/q/7SOhypvnHn6oYAJ8YMV0hTsUU1+nvmhBEU4UGkgKncqgI4b
         80LzS2pCxgyaZ3IK1hXexOU4BKt1ip70cZU5P9immopSYrDnoDU8Fkp4OFerTiPMXT/E
         Qci09T7A8cEyndC50WO/7yyFgUZUn1TLcVwLlDh8ShQlPKMyLgRg77U5ZG03XTDzhcJS
         Yy/g==
X-Forwarded-Encrypted: i=1; AJvYcCW07ypziekLcxpAjb4/OL9YEjGGZEDaiXgaClOLC2VHPuXwSridE12Xp48V7PElLWoB10nuc9rGFgpfJVmA0I4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxNtuhbG+pl94W3Ko5GKAkbWqJ+HKw3ypbRITLWEDOJvkO0Lort
	H/Ql4MT2YJA6H65WVOAtgcwEClQIU6broxM9n4MR9wGBoT9Zg8IpUltm4nn+C9RBL/w8/e/Tvhf
	cowrYeTx+GChwdH5BJM7S209QZvmbBZc=
X-Gm-Gg: ATEYQzyAdFh8B4BieANWElxo3eCJI3hcmzFBkmbqX2MAv6+besaG6ZocVV8k47yF/GE
	wdbp7R0SC9qTp+t4EsHSnFKCWsVDqMrk/p4aMqmN406KYignQFgLvvHGllcAhfESH7/07MKyxkL
	6vVjRHsls1EI+SlO9eB37OWjgjXL86XBPICQYawj6m7kld0eAAyLKSJpfBSnsOLzZWR0+zKa1Eo
	yW/FseF8OotD4MXmS779ntgF6WYNwFMokUNX963JCyUogZAzJHopKdAQQAxx/7vBZYrFvsSh2Q/
	hD/+9clbgZ9uGDvHuGfIK2/cfXME5vrf1LF5RgXaRVe+G/kS/hIv113PVpoSaX/lqOI7D/sc13B
	aJ9KX+dA=
X-Received: by 2002:a2e:a36c:0:b0:38a:1a50:d843 with SMTP id
 38308e7fff4ca-38a8981c174mr11402461fa.36.1773430290368; Fri, 13 Mar 2026
 12:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
 <abQ_d9fGarNobYdo@Lord-Beerus.station> <CAOMZO5BnuGc8sddmfhKJhFgWa+K2gExeRN5097794j48+Dw-AQ@mail.gmail.com>
 <abRDxRK_GFYwmAGE@Lord-Beerus.station>
In-Reply-To: <abRDxRK_GFYwmAGE@Lord-Beerus.station>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Mar 2026 16:31:18 -0300
X-Gm-Features: AaiRm50pUUd5PlDELi1jeVhIygeT3DuOuUYNivL7Ni7NnylRuT23VDH4JhtqGGg
Message-ID: <CAOMZO5A7XJL8TFHZJAgJAV=yHzqHEb4+AyDEoiBR4Zas3zMisA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_123133_345914_A6CACC6B 
X-CRM114-Status: GOOD (  16.40  )
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

On Fri, Mar 13, 2026 at 2:05=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> Thanks for the feedback!
>
> I might have misunderstood the best approach here. The reason I split the
> WiFi/BT configuration into separate dtsi files was to follow the directio=
n
> discussed in the previous revision, where we decided to keep support for =
the
> legacy Broadcom-based SOM while moving the configuration out of the
> device tree, giving the support for both modules revisions.
>
> However, I see your point that if it is not referenced anywhere it become=
s
> dead code:
> Would it make sense to add a legacy Symphony DTS that includes the Broadc=
om
> configuration, in addition to the current Symphony DTS that uses the IW61=
x?
> This way the existing boards would keep working while the default board
> description reflects the currently produced hardware.

Yes, the idea is not to break the old boards with the Broadcom Wifi.

