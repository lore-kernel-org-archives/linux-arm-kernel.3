Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB10CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqKmJAcNXHCDcjaAnbZVhbmbW/ApAzLJDIUDuK/HU4s=; b=3SLVMhK2vYjQSPHH67jd8t2Hk6
	4IV5WhLqlpB5M75huSZ6t/02MFssbV+YP4UnYXfsOenjylEKBWuLoD18AxgppLY3wXJstnzqAHnof
	whER7n/hgvia84q7ZRGA1OXS8yaL+DsdghF57cye7Ro/KNbRiCGr8hOj5U22/k4GQxtSnF81dXTIv
	Ra+8jTyxnnSkXBDS8/mNU16xNe9jcohsHq2HvlhY9y0/iz2hadq5LtWg13ZNEs72hPJsOUUiScOAv
	1KZsM208sWZdiTe9KiX2JkgzyPcThY9WYsBYs5xzRQQstVIbAf+YpAXC3P4uleKkNmw2HlrNuNh4M
	jSukluZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCl2-0000000CqKN-2dFo;
	Thu, 04 Sep 2025 16:24:20 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7nM-0000000B61u-2kMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:06:25 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e9baa0310cbso899561276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756983984; x=1757588784; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qqKmJAcNXHCDcjaAnbZVhbmbW/ApAzLJDIUDuK/HU4s=;
        b=RI7lkc/fKcfQr6YZdSxpHvZjgC2TQEUrYIxFbGQFbwiwmbA8LfhH4EZTX1vk1Jn+XW
         N+PVmM5eXj5EmwvSYIg1xaFJZPDH3P9RtvTVw/vHlF1z7S2G6AFqtzvJYW0gvt2QfPWp
         QCPT1OAEGkfqtJm4zX3ylY/kUPvS74WZ2ddAmNvXBme9wbzlcXEzOjnRusyqB4dXgt2x
         XZ+F7vjnmFhOlMMlYZKLEGppljBkDSDoOykCDJESMyzo2czeOcEmBB20Yz3WEdn+yPAJ
         VK6WlLOuo2OcJjpCBfI9N3utVxJmfcqRRN2RtiRVsPZHm/jETRIZDQ5PJ8QoB5o5f8aH
         OazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983984; x=1757588784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqKmJAcNXHCDcjaAnbZVhbmbW/ApAzLJDIUDuK/HU4s=;
        b=BLFmy/7Ikqn5x5XsBuQVVy8Wz/1CVMT4/iIq1U2D4lHncIH3y5xuNbRaEwHVy0ZFZL
         cwPKUcJwKkGj0AzIFtSXP7cntj7LDu+6w7MBSABj1EOhQmoAn4Cjuy2TZXte+HhoA/lO
         CBHVWEiPYyA/lrnLZBuYDJlJuH4g9lBiiwyNNDi5aORQwMEATZnGU8SISaSusg/N6ISH
         DKsMR85jitTYoDMxkYHo6W0RWLiyjgjchWqU9yOsyHu6qdgO9cK7tDOpPH3WhdlXB2PO
         Xb5gSUklKd9SqcqCqevpQJ7aXWeWumeoNCKrKXBqW8kmWDYE7gWRd7hhWkdWUG+gEHmf
         Fu4A==
X-Forwarded-Encrypted: i=1; AJvYcCXHnGzjgamcAHzs9ozhj4ETOYJf0Dy629Pk7BN4VwFsggD71fYvsd3aSvCZkhAtF6BVuPitQm3S8foOdF2tCARd@lists.infradead.org
X-Gm-Message-State: AOJu0YyXKrGoGW7QJCJIgJfI8xNdtyNdyliDN+1YdNP41x8hMgrMj1ny
	kpfWCL/UoeSVqItP3iL8VkIBOsLRNAzcGYD48QKcNKaFCVjp6NGC2LiawDlTj5hAqbmP545Uqn0
	soynjxNHz3y2yuRKQUUYwpoWsq2CoqZI+Qb6Euu5n2Q==
X-Gm-Gg: ASbGncuMzTh4OXNl/6DnnkpT1YCIVr8z9R6M430U2QaGiXhgHZhSny3+UY6jmoue4VV
	Z+xYT//CvijUAyBIfqd9HE969I9hwNTYVY0wDQ9oOHDbLZ7BqrlrdzSXPC/oRgBYq+H7YvYI/f9
	Nuys3tijO89NchGQVN3GbgcvO3XRe6cDSYzc1qqrz3gd6Gg93biZhnabqo3Mvovcce7VOGDHnu3
	Dl3/rej
X-Google-Smtp-Source: AGHT+IGqecQe5yOp9cR8x9hlAxxhDZsB8TfIupcC0FJtDt5AMK3d6JhTkzzkgdPyrWC0L7dsYj69W3txBCo/Z85TaT0=
X-Received: by 2002:a05:690c:9a8d:b0:71c:1754:2696 with SMTP id
 00721157ae682-72276542673mr206178927b3.36.1756983983654; Thu, 04 Sep 2025
 04:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Sep 2025 13:05:47 +0200
X-Gm-Features: Ac12FXzzO6lh2XeuKq6zK_9jSCFOJd4db2W5dfvQA3Y4rmF6D3oa47ZB2y7XJS0
Message-ID: <CAPDyKFo=pwb43vZFkKprbBthxAy_YtYD2mKitY6Oe-rMHYCkDQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Power: Add power domain driver for S6 S7 S7D
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, "hongyu.chen1" <hongyu.chen1@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040624_706017_E5C53EC7 
X-CRM114-Status: GOOD (  13.15  )
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

On Fri, 22 Aug 2025 at 07:41, Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add power controller driver support for Amlogic S6 S7 S7D SoC.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch 1 and 2 applied for next, thanks!

Note, the DT patch (patch1) is available on my immutable dt branch too.

Kind regards
Uffe


> ---
> hongyu.chen1 (5):
>       dt-bindings: power: add Amlogic S6 S7 S7D power domains
>       pmdomain: amlogic: Add support for S6 S7 S7D power domains controller
>       arm64: dts: amlogic: s6: add power domain controller node
>       arm64: dts: amlogic: s7: add power domain controller node
>       arm64: dts: amlogic: s7d: add power domain controller node
>
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 +
>  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 10 +++
>  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 10 +++
>  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 10 +++
>  drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 95 ++++++++++++++++++++++
>  include/dt-bindings/power/amlogic,s6-pwrc.h        | 29 +++++++
>  include/dt-bindings/power/amlogic,s7-pwrc.h        | 20 +++++
>  include/dt-bindings/power/amlogic,s7d-pwrc.h       | 27 ++++++
>  8 files changed, 204 insertions(+)
> ---
> base-commit: ffeebf7587f518a3717fad308cf735adbbcaba97
> change-id: 20250820-pm-s6-s7-s7d-950f720aac6d
>
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
>
>

