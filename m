Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F398BD715FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvEA1f9ONRPJvobNgmX24gX18ZQa14zvBpNonY0IgwI=; b=bH358X5vBs2eTzzJUB9s9nq15f
	NcxouIS1ZvrMdeen6uZ3OletLt/QWoB9FjbvJIPgvrOJ4Eyhm2Qqyk+iBNKRfMiB3Qe7CPeFU6FzD
	Hw3owS+T2BBULaMzbjFLRyCRZpH2p6Vxvw2on5suUbRi9EBrsT1fTkxn0NPD+Bx8X1Hpsexc1CSp8
	d+ayEaK3b0iTptAfYEesVCj8cxusECHCWAkw2FKZFFSoWTEDCaPG2WC5yPLybFFac9q8+94hwyN15
	bxizGE+Miyefbeq2bUj4WHhMIO8e/J5XSjvGwNowpOahvWg58US393BZxScxYiZRy3AMplj8mFTDd
	+MvqZ4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjnPZ-0000000Ahts-0c6v;
	Sat, 24 Jan 2026 23:51:25 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjnPW-0000000AhtG-1ZHa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 23:51:23 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so4784570a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 15:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769298678; x=1769903478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvEA1f9ONRPJvobNgmX24gX18ZQa14zvBpNonY0IgwI=;
        b=Wg3nqoiXZVo0wyto+NYWnxTPLALiFtoKGf2QPEdpWT/MSYUcXsmlBRPAgIqlvLYcBK
         icoUX1nImSHRm8FpEt+oFPX6wmThKaK4XOhi4L30az2Vi9EjcFyvOPQIYy9kMnZR4fWj
         8OopHDocaGM9guUpkAWBxKStRyfPuPNePQYRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769298678; x=1769903478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JvEA1f9ONRPJvobNgmX24gX18ZQa14zvBpNonY0IgwI=;
        b=GEaandg9E8Xi5HxAvZVBxljG5snbLniadCrKn3AUGUy1f0ITi8K778kLy9y8TwKu66
         Dy9uIjBlRHb7rpCqb4nM2iKxkLg5TzIpIjQmhn5ZYSJTEewNOa+7alWZXAAHBfcVXOSn
         IiIFrTyZxU3ITlBzhes+DFl/l9qtLXTYpAXj1tUH63bWhTn/tfsxGKql4LnL2dzjccwj
         jNo/adQrtgTl9vYeADQu4Ycmp/lNia2Q8Q5gVfTAeiUWFua1W2RsbHyg8dE4Zuubo05D
         Yr0F7AGbGkzQNSOUcBaStpiiYYp3C9ROKf1cGjb+I/N00VhdHcn0bvQ4S+OKVClX3+9d
         61JA==
X-Forwarded-Encrypted: i=1; AJvYcCV6EK5qMvA63DBbmUX+670xxLPEsDojvArUv9U/5GkTpmthtN+ZTkWq0cLm030HjbKNwrclG/CVuBDMJitsKn6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzmV+snPgCiAvXOLn2MtrAcJteJazYcIa6kxBLM8GINOut4FOGe
	8CTxNW3PuSWjFSPvPy8ab7LowGIPrSG6dUsve8buJs5trEPN94loHh4FU2A6fOJOt27pJNsiIca
	0fvBreQ==
X-Gm-Gg: AZuq6aIqk6BGk7eUvuBtWxwZrGRwK/5bdQsJpezQXfHMuzBmbx+Jh5J/huNNQRasbPP
	2ij462ck8izGDHUV2BKELyPCbLhH5PauFfO7UziUp/AUYvGhTep0xMjUIz6X2utKl+sRxPzgxYA
	t9jKrLT16eYQ2hHpIytw9PfCb3TV5iX8Wtar8655I5eaSTwSCZ9SH9z13TcIIx7h1l4Q0cxzNXG
	uBiQ9ink2tcepgGTuB81TQlrAKBmYbs+f7Mg4Izv3EZT1Z/2LUyCdcJ5zL3QGQQdDkyqYdl1Y6t
	x7Y6AsK8u2Ultnz/sbFIlEl9wgmTs5ZKHXpXgOcGa1Mj5YK2JMdbxkcEH7P33bNoNlewbzaWAo9
	cFA+/ELtBsfPwQmhK5TplIBMiIH/52jPqLX6qiVkAYA5JtcWs/MT5uonrM0mkFc83kKExwQBD74
	aLMTX1s5K6oWUKN6y9OFpuLLyipp1tpyTuH59wDQNNbahQJElGOQ==
X-Received: by 2002:a17:907:dab:b0:b87:1741:a484 with SMTP id a640c23a62f3a-b8d240f5109mr8849366b.43.1769298677847;
        Sat, 24 Jan 2026 15:51:17 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6fc4c5sm359039666b.40.2026.01.24.15.51.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 15:51:16 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so38303765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 15:51:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYtsYH2H+oyfYgsY8AqHSwMxR6wwvSfbFJGvL1LTfwyBUUThxkjte+bZmJdF3kVUU86DVp71TFUqVR81AGvxeX@lists.infradead.org
X-Received: by 2002:a5d:5f93:0:b0:427:23a:c339 with SMTP id
 ffacd0b85a97d-435ca06bd9amr202107f8f.14.1769298676341; Sat, 24 Jan 2026
 15:51:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com> <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
In-Reply-To: <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 24 Jan 2026 15:51:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W+hbNiDmSmzPqGQsmH2WD_3Nm1vb1ZsvE2CORdVdR=DA@mail.gmail.com>
X-Gm-Features: AZwV_QgOnwu8ZDNoMgAedT6RUZDiRd84e1b3_o2xjJbMyBz7YJt7WbVufA8oGT4
Message-ID: <CAD=FV=W+hbNiDmSmzPqGQsmH2WD_3Nm1vb1ZsvE2CORdVdR=DA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Move FriendlyElec
 HD702E to eDP
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
	sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_155122_461313_BA7EECE5 
X-CRM114-Status: GOOD (  11.17  )
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

On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> The "E" alludes to the fact that FriendlyElec's HD702E is actually an
> eDP panel - move its compatible to the appropriate binding doc.
>
> Cc: <devicetree@vger.kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

