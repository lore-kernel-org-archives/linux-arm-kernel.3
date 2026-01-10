Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F43DD25023
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=; b=IiZHgk6jU9Wt/MWj13CjIoLO9N
	qm509Hm8H9aDNEH6Wpm9OalaAG/QwMJ5K/tJDCNNxljupccXYWNaIKoXLm/og7vIYotfoWeS8HOJl
	zmrjZ4oRgqZFnjhUPn1HfJOCi6lUEmL8/dawVHMiwEpiIt1L8a33BDrSmL3TklsKyDqzuQvR6RAl5
	4YQKPtjtfSEwnTxbTCa1ha6W0MLtQ2EgDdkxMSXXNzBCzB+topPirDwMxnyRUoL5JNAStoOVIuHni
	I2SViZk+CFI0x26lHopeGkExIuqEAl7OdRl9lRJaVTU/JRX3iQHtLTwSaIAp2pnhZWjxL4Zb9H75b
	rCPV+HNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veh8y-00000003ikQ-2Oqe;
	Sat, 10 Jan 2026 22:09:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veh8v-00000003ijj-2dW7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 22:09:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a09757004cso49701975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 14:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768082948; x=1768687748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=;
        b=MxZR7ihDGbmv4XtDsgIaseo7sz7tiYTcwO8sOMd49vl4i1KJ3bkOveEDvLXVr7PAk+
         gIojrMuWDdy16TYDSFZgglOfEFRUoksnkj3xCNiSgSTgyUiIgl62LSs6EOOvwSo1YS6g
         W+19I2oWKccpkkT/BsoHFVqFOo1OevZotsoVXqEeYbCjkRHnlKkjsZ14qvymx+q9EOu2
         0NqhsoZmpFMaACpCs/t05+sVHHBVsoGMFq39rNoPOlsjZ7LdPzt5gVZaTJWQ2VWPO+f9
         ILgtHHKxuKl4tr/EmvX4YrVkBTNOudqHDy0lqq86OzvdIoK0eL4TK6KKV5hWGm3b6MVc
         nVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768082948; x=1768687748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=;
        b=M/7i5i315DVONMy5LRVki479cVuJ1wlDuQntgnvRDyoGrqvp5Gii/UmB1iOeOMILjy
         LzAxEEBzCdmsw65DR6NkM9zOliqCL/8runk8TIGyVuE/Vyq4SQIJ0/SnoztCDJVMaCrn
         SbgkedeMuCx1WwFwwsNvxamMx5/8lo85OPjrbvQyW0ZBHhLvWPpwoKSbCwzHV+opZ1bR
         HP90gIq5OOkdpgMPRcMD4bwseVzfjSWoGBl4t4vssDuhNDoDvYfvMTVRvDrgBFZT4ywK
         kYoHaqNIUb2vcQlj0Ta2URtx51svShLfvO9QxsWKSdJ3WETXesyMgfT8sv2w+5j+HKLN
         03lA==
X-Forwarded-Encrypted: i=1; AJvYcCX0WKhqWT+LKXox38QcbvLP1YIuBnsjb1Yt7R1zZMLb+GD7j25GiUjTL1DhuYaHaxgwtQeLNuo51qJ4v+EkHw3j@lists.infradead.org
X-Gm-Message-State: AOJu0YyXRL+a6t0opYV4pTG33uvqF6D3cYwtAp6YU01s0kba0sRCAzm/
	yKuYmtP46hgv89t3wZRf5uSt8N7tTg466chICsf0i73kCcSZ+mVSmwvZf89uhKnwxu0zr85ncMq
	8gBT5nhk8dFpD5486wMELVjS3esXEioE=
X-Gm-Gg: AY/fxX4xDLQp5ghVnWQvFrTeEOFY1eFcKcC9ri8bXalr+Y21oOm28+z0fVyVc1GRQO3
	QHnvCgmeag+KsC1Xk29m1tcooJ9X8TjT1ELtuE8wp/0+X7Dw9DLHQ+R8B1P6ursVZ4h8y9bUbZt
	ULA20GUDjvSwBs1apLSwAiyjJ4Gj5GARSPLDiaoLokIs+RvMe/7S8OwBgjjddjwsLleavkj5dZr
	5D3i60zliX1u6pbEAPA64bhWC4yIp2wGCfnfP2YBFLISiRcERlNjBpLp/Suc0SHSPuD33rTg/8p
	9WiLbhHhayEhQAydwdHY6bPjixB/wQQC/xmXuok=
X-Google-Smtp-Source: AGHT+IEAqhyKZ4Zb9mGUXaf4V+H313p3cDSNfGR8K+R50WWW/gF491i/LIbVtoG+64AdUYGn/0TAd6Uaqs+FGGXp2Yc=
X-Received: by 2002:a17:902:e78b:b0:295:6122:5c42 with SMTP id
 d9443c01a7336-2a3ee43da5cmr117317715ad.24.1768082948085; Sat, 10 Jan 2026
 14:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com> <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Jan 2026 23:08:57 +0100
X-Gm-Features: AZwV_QhAKgfsFN9tGWs1QKxT7kBr72Z-TUCf9Thx-La55n8xXLTiY8eWe0kVLVk
Message-ID: <CAFBinCCPsaywQuePJ_bxMby0MJeh2ohkXcduRy=yxr8EExJ9nw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] arm64: dts: amlogic: A5: Add scmi-clk node
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_140909_673410_3B823668 
X-CRM114-Status: UNSURE (   9.20  )
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

Hi,

thanks for your patch!

On Thu, Jan 8, 2026 at 7:08=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
[...]
> +       firmware {
> +               scmi {
> +                       compatible =3D "arm,scmi-smc";
> +                       arm,smc-id =3D <0x820000C1>;
Just before your v5 Neil merged a patch to use lowercase hex consistently: =
[0]
Please update this here as well.


Thank you!
Martin


[0] https://git.kernel.org/amlogic/c/7bcbedd64ecf5624583140faebfdb0e2e2f6b4=
3e

