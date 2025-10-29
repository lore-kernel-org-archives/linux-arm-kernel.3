Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9052ECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyBzuS5uu50decQRlhVuBsPB9Un8V1UaO7gxw+OVEYo=; b=pwZ7eI+bKEuObI6b4i+QRFq4b2
	M5zJp1Q4g1aM8UBZ0MDWXixrfmslo2I6gqSe4hUCGEhGB0qtI5n7WYjZ4pD2UQAM7x71p/G6XKV4F
	92qLkf+a0wrPMCvgqpqsUEVpq1bZ+dufhYP6jYicxYJpTNTZ5Z2jjzSeq/EdEm765JTqV3LEbLSeU
	e8gszTPWMknDw9uPoTUVhOdgp/wlEXqn27JRKAPfG4/hjfT1ZMa39DMaYeewr0xoaSlS6MB7+/aI/
	8XleC3juMGIJ2yqwqDZKcSVbLDv2Y6047R3MSUvPoLC3wOX27StpjUssDgk1lvAifVAxluAYOHeDm
	aX3KtFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE73H-00000001YPx-2Sd5;
	Wed, 29 Oct 2025 14:21:27 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE73F-00000001YP0-0qjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:21:26 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so3020891e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747683; x=1762352483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyBzuS5uu50decQRlhVuBsPB9Un8V1UaO7gxw+OVEYo=;
        b=p2owblJdYoFCU+XxurHdFjaPP23dfmqurbDfhmR0kDsGN1EtyA2ArZrRrzQvHyhHk3
         00/R9Fy+UZC9piigmigKh08OkIZWHpWh+GWgRzVJBTAI+DKhA099j31BgJKgSHTF51c1
         FUILGZw96mwFC7YwZtk6hP8cJItPMzAnmRcO9xLEyF6cM+Kqr5QtTwleCkodTZ0GEJwa
         odPywBYNSwEfX+NmepR5y4NzinjdJHibN57v81T+WJCYrX+cMBewuuDT/wav2iRB3EG0
         ZzI778ajyJLqgRBeauX6GUcqJDr77IvhVMxL5uAAzeZxbOQyfe+BTeKKgeqUqoqaJwgW
         PLVQ==
X-Gm-Message-State: AOJu0YyXAphKIGRdKes9YZVRlYI3K0pKJ/7Bw6e37UFUeYvwwMyd8dsk
	JMsI9YTzyxMsy92DUNZOZ24/5yzyRRSao3kluubIqW8CIgcKZaeurWmLFIa7WOvk
X-Gm-Gg: ASbGnctghdsbTmEEH9wUZ/PYe83KMGBmD5lZ+wl6pLP+ZB3zJyEDf8c5Hi4bc93TVKO
	QOSAxn2iS6jKlMzOwqb5/w7IehCPpMGE2jb8cwjL0zB+OGkOc29me7NuBIh7rw604fzl8Ewu7yL
	smyFvQ4ybbGbbiYttEJC519sfDet9PCFIvvQ0siCgfzhxLKvENgCXSWMBtCQ7uZRR2tn7Ik+9O+
	u5wzp3/EjqgoE18gCqG6Xnxo2VAigZbMckU+cabthXBtMbDPXRo50C1GhAewlE2+BgyfoKaVKMS
	DRdQR3r2PC47u4TKrhQkYKJhre5pA9QMKj/payXiSh1lOmDwjyfbBGajkYrzLeUieCNYTEAchEp
	yF6kH1b0BYxeCdPqRZvxAYkpQ09m/oPuTjtsC6FfcWoIjr/teIIshp+f2wvUE4LtuHBXeomMJJy
	xlaZqRiivhY4ToQJ8nQsdx6A+9BJup57nHG2APKWJpZZy118+NfeFn
X-Google-Smtp-Source: AGHT+IGFBftyyO0MTIaFULb4KSddAnMiaHcRyTuOb0goOND16STtf3zWJl/WLzXfVhOnx3QQEwG9hg==
X-Received: by 2002:a05:6122:1314:b0:544:6d4a:f52b with SMTP id 71dfb90a1353d-5581410c0b5mr818714e0c.3.1761747683154;
        Wed, 29 Oct 2025 07:21:23 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb5f493sm5487602e0c.17.2025.10.29.07.21.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:21:22 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932b7831827so2328005241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:21:21 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:5db:33f9:adce with SMTP id
 ada2fe7eead31-5db9069da51mr902689137.41.1761747681523; Wed, 29 Oct 2025
 07:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027184604.34550-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:21:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2sn09MQoV6ktBwd+JF-5M_c7jdW_e68xEGYsovqOr+A@mail.gmail.com>
X-Gm-Features: AWmQ_blJcp5ae8kH23TjMg-NYbqTJRrYgHltFldOLdMifDYWeLy3Gz7jK56UcE0
Message-ID: <CAMuHMdW2sn09MQoV6ktBwd+JF-5M_c7jdW_e68xEGYsovqOr+A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Fix full-size DP
 connector node name and labels
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072125_245872_1B8285F0 
X-CRM114-Status: GOOD (  18.18  )
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

On Mon, 27 Oct 2025 at 19:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DisplayPort connector on Retronix R-Car V4H Sparrow Hawk board
> is a full-size DisplayPort connector. Fix the copy-paste error and
> update the DT node name and labels accordingly. No functional change.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

