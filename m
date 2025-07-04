Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39F4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=; b=PFHdKj+p7w2lviLXCevafjurkL
	6PdhO6mCf7ylzOlZvj5wF/sr4OAAMDSUfpKDshz/m67qyc6ee55Ln25gb8glAjiV7FbgPQh1MKMkU
	v10XaMljjJIbG4eiimQx5PCJxT615mf5EXJR3tAVXtkuOHjRki35ujTmN/UX8nvq2+7HNMXdx+1N5
	NFCY7myEdnkwxWmxh1ptAusNxgc4OpRWRerVXPEdaKn0/m1jG8E0JcOUrktsUulNzXkKJ33MFUWVY
	ouVzcnufRCwrp6qFT5lS9Qpm9GNPQuQ/eBnzoREDXBpAuX92tv169sqgmydAhpkmwHarA03btYfqK
	3Vay19vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc8q-0000000Do7d-0qaP;
	Fri, 04 Jul 2025 08:51:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbNg-0000000Dedl-1Swq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:02:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553d52cb80dso631476e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616167; x=1752220967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
        b=q+yjdLOmKLBppFUi9+7Ko1WwN1XCQ+SlgUxnCRCS0ZJz8xhofBb1HF/5w9mtNL5JXe
         YeNLi3WSleNTENaf9WuRTWJ8Ho0QA4hfiMLSEGJQZnUgdm7rc3mRRA0cJfWhVlJyyMnz
         OUdymx82bUrs/GBjO80Dp1wuQeEP2DkZNv3YFyBtqBqxhFseQx9n+p2XgvZdIG56cYXJ
         HEQsKBRGd5YCh9j8WzqHFYw5FupUoFdC7sRDdb7TLc9ejfsSJ4TMET7cJ6HPrc0WKMA2
         ILsim6Owk+6oMNfDr8ab4dErX0JOkKRXfMAegr4fdSG+U72ZbbcdUQ3lx4mGcLeaYkUa
         kbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616167; x=1752220967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Q1fd2UmAUeRYeGhPM7wSGhz2EFf4uCAOpm7Lsa8zU=;
        b=iaW0x0C+rhZi3yfdKCexXYQpT8Kou7LcjtGHjbZvlQrIwQUo6DAx+fIQvsLMayGlvP
         5SgTqBKwyoPJGC/gEs5p2z+hjAaW4XHDSjUFyQMxPbmcJrXJj8ByzLno9T5GJNyTXAYs
         eM3Ztuv3Wb1W3ZiBjMCYeoD0zWIJ518f/7idIwnl2FHJhV/qSLPnxUEEsoiQ+gWVTyVX
         iMA1dhc2iCXjKYlE7zcK5K2wWI/ON1FLxyUFoL9CqR2H7pxJ5tGlFfAM4vIoihST14na
         GYZns8E+QQbQrgFaihv8o3Xdp6quDSfbV9hdcjMafhl4NPTNj0M2r82KpNBpqpeN9weS
         CcuA==
X-Forwarded-Encrypted: i=1; AJvYcCX0zLwl8QLoFy4/45jZYMg27H0kqmGrH9Ivuc/yt4oPJoJByLArDvimUVyiQAmEGSujCizZn+DaboJMIwaDqZ0/@lists.infradead.org
X-Gm-Message-State: AOJu0YyvqUJjNtNMjkL62P+cDw62fUaFsOzBKZh415ICjyylS6jI+oo1
	nCoXFDyvJS56Xbwnsh2qtAMFtAgmHTfHwnBQlnSyvSh1sIy09AqD69e+/SsFklFSWURUHlusnIn
	xLd5a20XMgAfMxgInQ6TFfug0zjF6chxlyXu06wpinA==
X-Gm-Gg: ASbGncsBAxH+ni4ZgA8ul3oI/0rOF9HeorBzcD1JRwN0NQDwvve4c5L5mzCt+m9smv6
	JJTxfCo5AyZiQJRnkwCG8yZKBz+3VXKoE6dShqw+9b/V3SRkB21VqgQSnrpF/VvYUAsYyAR6lFl
	zzDRzYEMTwfAUVYd5V2bRJPwtodtEKPuAAj6YDUTXjGv4=
X-Google-Smtp-Source: AGHT+IEViFXCMcn+u4hb5R0d0ojGEnFpfDhNI4g0r3Lc44CnC/koM/mbdYAwzUnF/KlRRn9NNEY5bmwt+E5RollIb+w=
X-Received: by 2002:a05:6512:1102:b0:550:e692:611b with SMTP id
 2adb3069b0e04-5565baa727cmr564962e87.16.1751616165679; Fri, 04 Jul 2025
 01:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:02:34 +0200
X-Gm-Features: Ac12FXzEoK3lIRrRhHYuQcLxyMKzE37BJ8MYgC7nOBJcQ6FysNDrbqPOTwFxTFY
Message-ID: <CACRpkdZ+kw0=X5L90Wuno9GjEi3pEnAV_bdJX=ELUxCbk5spRA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_010248_389788_E70A1005 
X-CRM114-Status: GOOD (  11.03  )
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

On Thu, Jun 26, 2025 at 10:11=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:

> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.
>
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 =
pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

This patch 1/5 applied to the pin control tree.

Yours,
Linus Walleij

