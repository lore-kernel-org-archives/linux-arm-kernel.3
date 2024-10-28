Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D913CD1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=; b=xC0vjVDKbzG/OahlYeO+IIC4B3
	0fqNhPUZkLfFweqvw6xY/brqI4kF3sBIZ+7yOXwxNzxo3wUWVuVwNsJjl/0bc7Mt4SFhjq7T63XdY
	MTGsDFSCxXoq+iqXR+u10nIva/s5Hw038aqdTgmdcfNeVycCErsLZmXxY4wnri8KfeHj83Y2od8LN
	ImXfDDH+zQUsRNSYsduGbKW/OVbwxDqW55hoQclOJi05UJmto/1nfYrrvaih2jgzo2UjXmrPv7fAh
	0vc/p89J/9QK0RxxJsm98naxBk2cootfLZ6/U62NIeKWPr1KbuP1MRm6wVNtzZlmDIvfziEQ+gk/a
	3xZRes5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PO2-0000000AsA4-1RVM;
	Mon, 28 Oct 2024 13:02:22 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PL4-0000000Arcq-3UiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:59:20 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53a097aa3daso3639154e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 05:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120357; x=1730725157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
        b=tEiHyvWId6IIIwwVEPjA8P0p1aEMiClJ3HKOSfVddw/6PeRAWsy9rvVg7bLCjWbVkJ
         Ed8VJIy+/EdVZxi0bnR3F8RmstbkK1YXX0ZDziHOYmkpX4m3lG8s7+ABaJlEShapIVjv
         02OpHy+zH8WK0jBjY8UjAUdQj7UgXEepAL+Am+TCmOcL6QzYedOOiwzkwfx93d3MEGy2
         lH+pKySvNDbmsr2rN/k7CYTH2knn2Noong+P7t92UKMYWomEFLceDFeoNr+xgdQVLLcS
         cXJ1jcRswohQBbKce8FhGqr42PkriIUU5rQJbuAVNPv8szXFc01/oldQvKB5w/vQFqRD
         h8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120357; x=1730725157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
        b=BFQfz3FxyBzqvU2O7N1gHmTjIYAnlt4c/Y233CAVf62nG+edUgbORqUdjUt32vRfc7
         Exth2IwDYBngwJNmPP9/etrLOyp+H4Dr/b897h9yN2ptpKDUnhYvXPaSuTaF39SZ5bAP
         KpyMuDtyWLZ1rrahIETzQDhA0z1/1Q61GGLLE0BCj2geThYD+vvZYCkiuyFjRDbA+Wjy
         OENQteY+vGSm/mC0xvimsVRwCF/hBGOEuyadDi72EUD+r0jC/xczdT48x8h6OZPo3y/D
         /wUuWNGVz+wAXjmmPjmLy6C5tXFAxUECQ8M804qF9ZK0B92FPD2/oQLvmB7OB2JpSym/
         f4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE8K9hmtgoa11KLoA3fYnfgoWs/syyTIgLBFbh1vLn+qQeL6SiIUA+BmPPu7NvVzkn0PcC2ZoqwlaFX5jqCphp@lists.infradead.org
X-Gm-Message-State: AOJu0YwKBWS3260iO8+zi6GINlByjsXUB1Oau0UqcAVVJS1M87JrAnq/
	rESlIeOcF9HPDLii07bmWoE6NKcMwncdzMCpYwILAGCvK/+Z5Ti2p6H0rjoJy8KB7peB3M5xEYr
	bsbUAXV12+Qdyst99D0FnwyyqSpwk3A2CkAyAww==
X-Google-Smtp-Source: AGHT+IGx7tfNH0mZRuKTFpu/Lt1lVaJ5wzth2GIk/zrU6MEJ3/k+kc+DMdfavO6Q5ppLTlt1sP5ACchOTuFdcWBszp8=
X-Received: by 2002:a05:6512:3e11:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53b34a1b681mr3290500e87.48.1730120356663; Mon, 28 Oct 2024
 05:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:59:05 +0100
Message-ID: <CACRpkdYEbczXUFD-CFpE6SYiqhwTdxS+w5+dDtLF=2BmeiJeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_055918_891986_246B4C56 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 23, 2024 at 12:44=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Add drive strength configuration support for GPIO F and G groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied.

Yours,
Linus Walleij

