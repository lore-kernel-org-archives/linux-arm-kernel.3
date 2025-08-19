Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9B9CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM67WPQOHye2i+1z72epmy92Qmx4agSMBIMH1WeYbtQ=; b=vrrAOM///QogoNaObLM3soC8Kh
	0RobHq58q2JexxyutXVshrZYXJBgFiR+AzBVMDGidB749ld+oXcJRyqkFGuWPKeqCuMJj7GrM7mxf
	xAZ9fwhlQZYgfWtE+4oCgXn/56kHXk+Iug1Etbij0KHLEsEyi6dZJkqdaOyM+UeSMN/dSmct88pDf
	2h/yszjgn0hgx7f5psbHCGluayHQ5uv9Du5oKxdBgLxBuPyVBdxKH98nqMWGCniUgnA7u1xq0yxAG
	ODYmHbeLNY0tXvW0zX2htn/tOAdn+5rE06XmTgtwkPN8AbJABSSlnl838Po4vOiB0mWiXt4qEsgDD
	g8dnBcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMtP-0000000AgeN-2GJl;
	Tue, 19 Aug 2025 14:00:51 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKPe-0000000AGBt-2hLq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:21:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55ce521f77bso5217206e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602517; x=1756207317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM67WPQOHye2i+1z72epmy92Qmx4agSMBIMH1WeYbtQ=;
        b=QY3kBcGOQeOtCpuwO/+2dzxl9GqAM/s0pYq37cicPpYAseJGmKNeTx2LXurVGMxcNK
         8JV2w4ytrjPTRMqwoEGOoLwezPG7o+Cb4UjHVlCl5WjVBL+L6nBIjgXhhofHa8VorGb8
         20ujtvhc+44BWOXzZiETr6Zvfhl+tkDGBWarK/ukS2c6hMeb0RtJp8pHxTaniXIFoG6x
         +V6l9uPji2H0k1Ushl3HVJi9d/GxmZ6kkj5m9+C2qurj8vAKRoynkbS12mDHOkBo7zDF
         flj9HzkC4hF3sYjOnG/mD2sNMPCCLurmvHkOtNUJTAYe4dZ06QOfwtTrLUjA+PTDfmry
         twKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602517; x=1756207317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM67WPQOHye2i+1z72epmy92Qmx4agSMBIMH1WeYbtQ=;
        b=BHQSTtfFnVTthuAKqpn/00ObTqGM21hoiMuBYL3voiKReu+mCprq/D51nT4zammcm+
         j7c/l1iojgVd7n9YcuN7DlOkLoWmULLE8YLI765JHYrHetwYsYWHl/qxagoxaHbeQZf6
         4r7iTzgIkHN4p37FSQZoqLzZjMGPHOR9xVj8Hf1CeUlMZF/AAbAlHk7J8IdKJmsoY+ee
         2XQt7bGrgiUOfDPTraXwJoHFM0F6Io+CKS3Q3vmFt3YPGIupBoe6wpDhcDtXYJeucoiI
         oqcFB0UdeEvxGTM+jfMDuq5VBxWlsu3oI7uqUGZYLITptkRjVZDWMlZPOEQ5Xa1piBmY
         dYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwmD7eZ9lAR9mV6mrhnFwU7tuQWE9KvbtFjLrZUerGQPeHIMx1oosn0KxSpcp/+59wsJ6pmeFWfJQLIL97dz+0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywomrte9SKpuA7j72rA+c2uS8Fme2/0kURR3s36+0UUms6PmQUp
	kfYb1bEHIxFsPiTXBioHvTf1SuEupHniWRCkpGiI9/Ipq/NceYD2vquCGlyluPo+js2UWRe4D98
	1MGQcZB5L8/QnZlxU/vaHU7LlxztDad4g6sCW1Wzp5Q==
X-Gm-Gg: ASbGncvZgW47tlPNX0hxafItvkyoJ5/LKcLh31hXCFCCtduKZ3Rplof0O3M4yqDB4Y8
	Ds7mby/tHYogAuulA8+gAq5lwzRFMbPm7ihx5qAV7K3oCqP60V0mEDdNzObMZhTprLtYp7kSjyc
	EKRDjJx0Ka+nlpoEWUsZo+436O216M2M6nwb5r3izPTAV5/Sxcbl2SaimbSBfTB46+MEPK9gef1
	U4HgDY=
X-Google-Smtp-Source: AGHT+IHB9ZE3HHwBP8KRu0As5tM0j3eS8qOs+KX5e0XlvnFV/qrios6LpoJC/eBjHm40/aNMJAbseQeE3Ftd5lSOg8c=
X-Received: by 2002:ac2:4c45:0:b0:55b:8698:6a1d with SMTP id
 2adb3069b0e04-55e0079296fmr723607e87.3.1755602516865; Tue, 19 Aug 2025
 04:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250812203348.733749-1-robh@kernel.org>
In-Reply-To: <20250812203348.733749-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:21:44 +0200
X-Gm-Features: Ac12FXwBOtQCyCuqh-xFzcRsUI8fbtRh0MGdvIn7jfDa7EoepbxRk616CgxWIGc
Message-ID: <CACRpkdYxFj9ZCdpOpE7G2A8cNTRTWoJatDP7OmCkkH_4eApz6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,iproc-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_042158_680796_748CDC28 
X-CRM114-Status: GOOD (  15.16  )
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

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom iProc/Cygnus GPIO/Pinconf binding to DT schema
> format.
>
> The child node structure is based on the example as there's not any
> actual .dts files with child nodes.
>
> The binding wasn't clear that "reg" can be 1 or 2 entries. The number of
> "reg" entries doesn't appear to be based on compatible, so no per
> compatible constraints for it
>
> The "brcm,iproc-stingray-gpio" could possibly be dropped. There are no
> .dts files using it, but the driver uses it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

