Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ED8106F314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLLjfS5BvDFcvjGePocKuzlspinwqEnC95/6wgf9NSk=; b=S+gvsbl6ttpJP+6ni6qEYJh3hx
	LpyonUcDVGc/+psl8QaZ0w8bRIm/OAnkTlYww2sdAcCjNo95a+EKo9hnqmXooMuvmHCcOIFmCbrpA
	vkbbE76wr/+vfqlxCbgNFnh6W2jFPWonRajDfVtFq8lMWl2TwvSkgOe7cqyHR+NuFnSUaWSIMfaSN
	hkMZnmv+Nd6jDhf/Q+9P61lccjK5Ly66I7Eqr/m4rc4CKR8mDcWeEQQeYGOYZJx60C3WTWsRf756Y
	DoZjdt/5MenYeE7B0HrHHbEg2TeS/gH0W+2nPvJz3kgu0CIVWe/WoCm5RwDABQw4Aw1J8KFexBECX
	WoBBqKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hGN-00000005B14-3B5w;
	Thu, 26 Mar 2026 09:44:27 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hGE-00000005AwT-1sAn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:44:24 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso483828241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518257; x=1775123057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLLjfS5BvDFcvjGePocKuzlspinwqEnC95/6wgf9NSk=;
        b=U3P9zm+Q4O879t6WYJVsmzyw5ONvVGM8QJGocMHh/w5e0wLfYUnJ/Ex815ttX+tmfn
         QKzTQ5BZR/m4fT++jXg4Xry2sXRCm8lDtoSqRsf2uPR4jFpSGV6siBsLC7pH/99o6cNl
         Ke8wYDE8Uh62oZMsLWsEvuC1H9t6xiYM5hNAv84tAScT5wg//8uKWLWbrPBLeqUIwOTk
         TXSAhMwJ14SgOXaGrjpAU05uF1ifYVYvt1Bv7ZUExLsoaXwerEyh8z+pVIQhlcKhcMRs
         k6Rsd/h9QMZgEkpH4whq6rdSTk1IjwgDslsKNaCVvz+tYuRZ14MqnqwswelT8M5rk3FI
         iPbg==
X-Gm-Message-State: AOJu0YyVZZtKII/mya0f7ehaKKzHyh/rDnFFKbzeOtP5Td0iNgi5JGxr
	r4Wi38HnhnZcbngQk6p69AI9PU/HTCFc1VCQdkVoy1Oe+aveAvGOjYRqeKHeMo6Utfw=
X-Gm-Gg: ATEYQzzif0R69+AX3Qqrw0aUWn13sIJQfM7hyMP6/49ArXxsJQ4NAQFbGvBrE3suv8I
	L1QUDxaj+3zn/mNLLMOfDurp6sxgghkqkVNlVbqZFmNrzGYJaf79Dhc1RU0HHblSs2qm+VjgPVU
	O4CgfAIzxXPhP4Pjd08ekOsvypBNAC4rOtvWZ/fKfGY6DDQTvbfPzYaMjpeNYxk6Aj/bU0bG2ED
	ynIY6fUk/rpMcsO9a/qCjEcXvVvJXzpK+BZgITdYcgnuB7Wl43fVZQhqAs1AO+bGgS/GgZr2bo8
	eFbew3qCkkKEJLIa72Jgc7Hwb51wcaQlHwAa/zxdHDUPY7EdqtcWeRxzUP6R+dvgsNDVHOJp9RE
	UFQGLBp88XhLUoosTSy/dALuS4Fstl3FPr7DgQSMbsemmvgASPTrOBHy9Y9uOHuyuJCwLZxpUrl
	DuLlT/xCABYin1We5QN6KBHd9hWFj1USk0qmrVKp0TinslI+R6wmqUReKNlYjT
X-Received: by 2002:a05:6102:dca:b0:5f5:4f68:9f7e with SMTP id ada2fe7eead31-6037900d2a0mr3365262137.8.1774518256742;
        Thu, 26 Mar 2026 02:44:16 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d53951e2sm2413466137.11.2026.03.26.02.44.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:44:15 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so487075241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:44:15 -0700 (PDT)
X-Received: by 2002:a05:6102:84c1:10b0:5ff:d192:ff22 with SMTP id
 ada2fe7eead31-6038728e7b3mr2209468137.19.1774518254998; Thu, 26 Mar 2026
 02:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:44:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM0zq2pAJAVEO=WkNyoVFFf-3OX2_+7fJxMWTPuG6hyQ@mail.gmail.com>
X-Gm-Features: AQROBzA5raX3WKUVOehzAlLaSiESouGRrUnc8wD5Mdt7U_rTWFsDl9lKV1nSlwY
Message-ID: <CAMuHMdWM0zq2pAJAVEO=WkNyoVFFf-3OX2_+7fJxMWTPuG6hyQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop
 KSZ8081 PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024420_292620_685E6306 
X-CRM114-Status: GOOD (  17.68  )
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

On Thu, 26 Mar 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ8081 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1560" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

