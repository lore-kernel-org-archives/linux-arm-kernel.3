Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32404CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtNjzQKudYD0ky97v1743lPf/WrnfS9KJCemG7a+/I0=; b=mAQaFdDa1o7Zizu60iIAqiIJWC
	aAltDm+pplz1aCWDT1y5L051rzcIOJE/YFbvgyOVEvm1QT9p2Lf2DzK2Z9MPQWxt/j2Hzg8VRV+ee
	ueaMrXzgshG+pguj6ZNQhhy5ATBj1Rb+Vjk7dvSozWQrNKY9s9uCV3RDFkZ0DYqxOfnGCYj4PN87O
	59v92TbSD8ScSEGXiC5rNN7qDS/uf25G3GtpSN46aZlpQr4ENe4my3Uerz/Thg6d4OBQ3FLdhdkXK
	Z1GFQLxsR6LNrjikn2QyHii9Koq+1gDEKWQ0ePJV02mSDSnsh2e0MSyPmbmq9i8LPyiOisjkObmMn
	U+s3f7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1m7i-00000009Sw6-1CtD;
	Thu, 25 Sep 2025 13:35:02 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1m7g-00000009Sue-0Ad9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:35:01 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63470a6f339so657964d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758807299; x=1759412099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtNjzQKudYD0ky97v1743lPf/WrnfS9KJCemG7a+/I0=;
        b=WYJvYwbufmTd5EvF3cft8Y6YGEVSgQdqH5kzDIi0NUl7GDeTBzvmE36Q1Lg7PaCDBs
         5Px7b6H9GgLcCkH18D0oIF4skTcVisUwcSGrmbyLvLaj6IhyCmGfW3pvR0LnjM0xERG9
         euwCCzrRMe9dcU3w9rnsslRvKR/vYEM309ZP3/ZhVBBicHxaLojrDYv+XEtLvwH0w8qb
         JiEyzzj9WrYvTaTfpoPYVaKhdFTGBOoeSadccw2CFVrtNNEUSK2vhRNSDjpipUlwqsR/
         hVYifL14KJIKJDUjIFbs93KT/PBmZoGNHF6b8QPtCNMpSjJqB6WspXGYX6qX6dQSueeC
         phZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807299; x=1759412099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtNjzQKudYD0ky97v1743lPf/WrnfS9KJCemG7a+/I0=;
        b=wqimLBe9CqtWr/9TW9nCxZPAJv/jW3bHTLl9FWXm6BIYhZTRgk/51WVF+X0C5aypVH
         OvD7YMhcT3zdIPQgnaG1L4NUn10/JDfWbjA6zbBp9xff4LbVGowLV3lrm8eM5KDMCfIl
         qDh4XRliT5cIifvxzQlUuCdQzjQji9yu+4cHtNCu2N/6rNpoxZWHcump1uud7H/6y4AQ
         UJlB62r1cty6bVFGgf05yU0pvfxWdwBLZUYl6LmiB3nmknu5ub+WURdSGmSlgndOEkdj
         1wxYrPQFgY2RxdzS81/Dfq/kFWK5lMa3MIj/1KkulTO5DvTgqjruu+7dQoT2LO/1zPwc
         5kVw==
X-Forwarded-Encrypted: i=1; AJvYcCWT3nWh2O2DCNdEFWCPKfJbR9GMuroDqMCWjpQNi61E3azMq1fnRiB09NU/Lb4pwnmx3Vx/Hmyba2xWt94adINz@lists.infradead.org
X-Gm-Message-State: AOJu0YwDFw/4y81jwr5+cVruJhcaOVPXntHKnj9IEkNUARKYOmLwcj7y
	iUDksCId5la5TqBC21ga0FCOiay8b6N6i5yCTLqv4GinCq0HQJMv2q2yNjVav1gGubK+Njyj2Nk
	8w7pCwEQ9admXiM3VTdPld3D2f845O7FVFqLtBu8gJg==
X-Gm-Gg: ASbGncu83eiXt6By09j7WZSZQW2m5MfOK5o79Xd6F16/AaJiCvDKmcj0nMaWtIdxSBN
	7qy5TY3HGDP0FTkfnhhOJyTplcNT2NHXmX5oJT7YNetD4JWiT0SqJY/xAeo2xbs+VqaEhjwlUvC
	d3p+0Za24/1OsiCpE9t5Ekd2NnBch3ETQWC5d1KOoG1nYZL1iVNvhPA6oQqO5zQo78CPlBeOUBi
	ywMN8dI
X-Google-Smtp-Source: AGHT+IGimO2Q23ZQRuh/31hfKH0M0gM5VQ+Kb4vJFyOlHv/p/Vvr462F0FI6JqMOIO0OkAJ4FQSVqaMbzzoyb5VvJmI=
X-Received: by 2002:a05:690e:240d:b0:636:d335:2515 with SMTP id
 956f58d0204a3-636d335263emr142033d50.3.1758807298695; Thu, 25 Sep 2025
 06:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250925090412.2068216-1-yangzh0906@thundersoft.com> <20250925121155.2401934-1-yangzh0906@thundersoft.com>
In-Reply-To: <20250925121155.2401934-1-yangzh0906@thundersoft.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 15:34:22 +0200
X-Gm-Features: AS18NWBTeJE3De2V6Q2_nyOlyupwgaA4ybsnxBjHtD7xymMmZJcjw6ksT3sbAGs
Message-ID: <CAPDyKFp3onTDGgygvOrK-G40w4mSx4S5=PbdZ+26hsQ+nPVRSA@mail.gmail.com>
Subject: Re: [PATCH 0/9] arm64: introduce Black Sesame Technologies C1200 SoC
 and CDCU1.0 board
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: arnd@arndb.de, adrian.hunter@intel.com, bst-upstream@bstai.top, 
	catalin.marinas@arm.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	gordon.ge@bst.ai, krzk+dt@kernel.org, krzysztof.kozlowski@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, robh@kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_063500_096747_324E5345 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, 25 Sept 2025 at 14:12, Albert Yang <yangzh0906@thundersoft.com> wro=
te:
>
> On Thu, Sep 25, 2025 at 05:03:57PM +0800, Albert Yang wrote:Subject: Re: =
[PATCH] splitting SoC and MMC parts
>
> Hi Arnd,
>
> I may have missed an important detail in my previous note. If I split
> out the MMC-related patches and submit only the SoC parts first, I
> cannot validate the SoC on real hardware: both the kernel and the root
> filesystem live on the MMC device. Without the MMC stack (DT bindings
> and the controller driver), the board does not boot to userspace, so I
> cannot properly verify the SoC/DT changes in isolation.

At least to me, I would not consider that a problem. As long as you
can test the pieces together "manually" that's fine, I think.

I mean, the platform was not supported in the first place, so it's not
like we would be introducing a regression - or break something, right?

>
> Would you prefer that I:
> - keep the MMC pieces in the same series for initial bring-up; or
> - validate everything locally, then send only the SoC/DT parts first and
>   follow up with the MMC binding/driver as a separate series?
>
> I=E2=80=99m not entirely sure which approach best matches the normal work=
flow,
> so your guidance would be appreciated. I can proceed whichever way you
> think is most appropriate.

I think doing things in parallel would be the best/fastest way
forward. Validating locally and sending the pieces upstream to
different subsystems.

>
> Thanks for the review and suggestions.
>
> Best regards,
> Albert

Kind regards
Uffe

