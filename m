Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD09CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 00:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZH91ndxG1GVWd5J5DxGYGsSekv8Ug8LCXf3PTvg1inQ=; b=n+h06uWRHmSsx6jtv+RyISfqD5
	lBW04uPKCryeYutIUjJAep0p3n3XhLPVce76khKQrqu4JLTq8pagWDNOzU85xH2D7wSo2qX+gBIfV
	BEXgA3zvpTowi1GgbJLDBc5/a6uwCP1wpiDuMKo6cwEIHCB2zET4hUcwBJzNaMBGpW01G7sCKHyIT
	52tccvXXh7cnT3fCkuosLiOnRkCxhaHxcRfShjr/fuCmpNQ6smWXDsKuISAl6wB6oqkbyHshJ40LA
	RlC8q4lcOBy+MHj93FrxmPm+hCMZLhtf7vn6IbB9Ey8B1E/VjLAEaR8o26Jwu3njokGr8QEEH3hy9
	vbD96+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wYc-0000000EQWE-1pws;
	Fri, 26 Sep 2025 00:43:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wYa-0000000EQUf-1Ufe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 00:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9458645524
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 00:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625D9C113D0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 00:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758847407;
	bh=R5AwY6reMT+hkszq0jHIk6/O1YZCgIsgfU6+UQvCVWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gl57E7fhZ8DqIgvwM0nMRP/DXf1FSjFCABVk7knk87AQP8l5wVjJ1OrEhIXLbFCjO
	 oKbYphKQ23LWUvnDBos4CsbqDejomkbQu4/Wl8KRPmzUibjkav8/bdVkDfxLMZjCPO
	 qLuEne61x6zG9UGnULFtGGci6PcmmfegCInhv46MHyhGShywlwavRJx/yAYJiymgdH
	 jiSr/51tjrCBdduQHEQWshMruCiNpjt9n9HpnA4KZVcRpRus79SpqfI9QrOx5FPfoK
	 z4A2gHO2pcOLwA8ptAGFJMrceRlxGM+tO0ipFDTC18jW5wq279TRrLF6ujsVEkUsqX
	 zJ9AmG5YKLY7w==
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2698d47e776so13710075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 17:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXowxq75XbWhKKgMCRU+klTmN/XefcXgmHSM5cTnWMiuyf6DS+15yFH8/oWUxwrB/arkMGbwUhS12cKXYob7igi@lists.infradead.org
X-Gm-Message-State: AOJu0YyLm0ajP6ruNJD7/F4SzJgJiUO1csdQC+DxbOXXLJan2c/7xtWn
	DZ16tkzYu4vIOVG1vyxShAStPMPxRTsEkiKDV0oY/H6NRlI4HO3fQOYXJUzvAP+88gQRhm+sn2W
	bqORrKFHFPh+shDV9I+WRRvvyUqhGdkc=
X-Google-Smtp-Source: AGHT+IHuE7lUJTM5NjBq9XyNywbeXtrU6kRpDRkGAl4f2osXROh+FGe/vjUXxkTy+Xyl1QFb2qNvoBguF7HigB6yATM=
X-Received: by 2002:a17:902:c94f:b0:24c:7b94:2f87 with SMTP id
 d9443c01a7336-27ed49d0885mr59873295ad.14.1758847406872; Thu, 25 Sep 2025
 17:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250925092058.16648-1-ot_zhangchao.zhang@mediatek.com>
In-Reply-To: <20250925092058.16648-1-ot_zhangchao.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Sep 2025 09:43:14 +0900
X-Gmail-Original-Message-ID: <CAJKOXPeLRZR9VkB3XHtCPDxT6-6xt6GkwJ-mLkw9hQNV2piJZQ@mail.gmail.com>
X-Gm-Features: AS18NWDL9JQ94XF1lGikABrmZ_SQTpxybLBch9JyjPz9vNsiAWV_NCfTqCxYNZA
Message-ID: <CAJKOXPeLRZR9VkB3XHtCPDxT6-6xt6GkwJ-mLkw9hQNV2piJZQ@mail.gmail.com>
Subject: Re: [PATCH v8] Bluetooth: mediatek: add gpio pin to reset bt
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_174328_446880_EAD2E95F 
X-CRM114-Status: GOOD (  17.28  )
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

On Thu, 25 Sept 2025 at 18:21, Zhangchao Zhang
<ot_zhangchao.zhang@mediatek.com> wrote:
>
> Support the platform Bluetooth to be reset by hardware pin,
> when a Bluetooth exception occurs, attempt to reset the
> Bluetooth module using the hardware reset pin, as this
> method is generally more stable and reliable than a
> software reset. If the hardware reset pin is not specified
> in the device tree, fall back to the existing software
> reset mechanism to ensure backward compatibility.
>
> Co-developed: Sean Wang <Sean.Wang@mediatek.com>
> Co-developed: Hao Qin <hao.qin@mediatek.com>
> Co-developed: Chris Lu <chris.lu@mediatek.com>

Wrong chain. Follow submitting patches.

> Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
>
> V7-->V8 modifications:
> -Currently, the universal reset GPIO can be found by configuring DTS.
>    USB bus can get the device node and reset GPIO in the probe phase.
>    It is fully compatible with other vendors' methods of getting reset
>    GPIO. Therefore, the previous complex methods of adding the compatible
>    string in btmtk.c to get GPIO is discarded. Abi files and yaml files
>    are no longer needed. When a Bluetooth exception occurs, the existence
>    of GPIO will be determined first. This change improves the robustness
>    of Bluetooth recovery on platforms that support hardware reset, while
>    maintaining support for platforms that do not.


You didn't even bother to compile this code, which is obvious from the diff.

I think you don't understand how patches and Git work, but these are
prerequisites for submitting your work here.

Please share how this passed your internal review - four people had to
write this code which doesn't even compile.

