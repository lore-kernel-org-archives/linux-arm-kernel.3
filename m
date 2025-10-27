Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF0FCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=; b=yP4q1v4MEikvmUj5RXv76axWdA
	ystZBTkMMaS8KYXyMdZsr5Jjx9Pv1r+5Z6qT26tw2OQGCwjdl+viIPB67ed1rSOPTZTcbsYyLzC3e
	UOopMgKcgXW4YtsKrjdFkJUnmLswMINwMGGlf20aLpcAN9GRdwLoNABxDZelqZr+F7Q9SqvagrQqn
	hktZihC7W/Ww2XMPdacrgTy3979FOwMEacfcsvtyA2ddrEYojl26vPW9DFNmHHBM0i2x+UrrzAXDA
	DPOHchE6nzYBSh7QbR4Qf7k6AZqWaIQBosagnOg6/VRusNRdjpKsqjYjb556Nra2V0RqTkI4VRSB6
	PTcc5kZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVQ2-0000000Ephy-0VsY;
	Mon, 27 Oct 2025 22:10:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVPz-0000000Epha-1kus
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:10:24 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-592f9400b04so4545362e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603021; x=1762207821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
        b=h+IizHj/LJAku4/mc2yyHqLdeBsOW0laI2OpfF/3SfwG9afNZrba6K1uIS53pQyW5v
         /KGTEslY2E/Wmn2OHqQGGX/XMmITINsxd5geMHjeM01c9KjfOebFOTi0kQzIGYalYm+/
         zxeHbaonjEwHXgC3+2BiF6YYhm0usd8o+W5ldQy7jmFb/tafTyl6QpIOU/Z6gAV2Rbp+
         oV46zbfYh7HXrxD5DHu6Ilv7plVerGFrHqbctfus+7hA/u8qv/+oDkvHRXoT7Gf2C6os
         VzQyyawdJK4JrpBYR3XHVhxesLPFkRdj/lXlBGEw19OlBWPbuyVK5GQtIm/XiC5eMSkP
         7JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603021; x=1762207821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
        b=g2C3SuMGdb2CRSopuNEYyoH40ftfJzSLiERyUS+9p0/NRj0537NH67PthfsIeXgLyn
         vUAVFSGXZLVAE7f+9Y4GthPgjOXKrImYrUvOltQEWwmN7/mMRZsR2VDnPamLWQ9vP5JT
         /1CE9+p6KNEgFosLUyVykAGm827ZFykb6mt06OCN2UTixEFx/JalinmyvU7ygu/hb8Ke
         JxKjBu6vT+K62YOaYStKsvuRBanRhCgBzbB9rkAevQYJex9Iphd0gUHbZ+hKYaJkr9Vy
         REeqL3BraY4rfGOIcCyTfwtssD64N1Y/MmfA/o4v7eKOR5ulZrvcplz/2xqZqiuIcp8J
         WdDA==
X-Forwarded-Encrypted: i=1; AJvYcCVUrYPrvE7VqyvdQcri+gSEmdcsU+HFmvvrZ2iIrehJ065bvTMg2OdEUL9jrXN5pc6VF5KWFLfbHDc2/MlVLgmP@lists.infradead.org
X-Gm-Message-State: AOJu0YyQiuESCgIJ0ZAZ43vD+SjMrNMWA4+FM0GD7gOY35GYYGQF0tMT
	s+X0B1eqptjTUe30o5c356OwKl6HBa4XBItp5klTTZ30r0FBP3sKNA/etRH7H8dog4btvuj+mYa
	mSyQe5SiaPFoZoe23uZNeXjfp87FpLvRFCUWId9X2Tg==
X-Gm-Gg: ASbGnctk7904HUKamq0eMUV0oQObsMTKRpTFdkRTQPDAxaWdLAL9SLqEwq+0td75/qd
	58+8Swlp9IyCXSk3LEXcjQyIADhqy1U+PQLPVZgasNleyBVWqMjgZAyP8hnqt4xVGshN+AvwzzK
	nVTcvSi4bIfSTi3+EpsMs9F+CuTZcBGvcBa+hX7LWXqVDalo9HgaZ3/Fu3Fzct22xxKpzETDjaL
	oIB5p1OpfMPK5OTklNyqEGlcW822MsFTEVGE0CQ9KPU3vR/b79fVPwtwyUyqtmDpnpIn9M=
X-Google-Smtp-Source: AGHT+IG9eaDbYlt05Z9zFZohfCDZwr4gqNsotaN2JZ8jVtyJSZnzH8ZzP5hqxntC1aSKIIT+xacG9uS/M37uyI9DBCI=
X-Received: by 2002:a05:651c:43c8:10b0:372:9992:1b0 with SMTP id
 38308e7fff4ca-3790774ba26mr3083561fa.31.1761603021254; Mon, 27 Oct 2025
 15:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-3-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:10:10 +0100
X-Gm-Features: AWmQ_bm5etBIx2qF76UfEPLiy1Nl6j4OjIJVT1wJCcuvidRKmWwIeYmy15zR_II
Message-ID: <CACRpkdbitTgbd+DcdTNYeuHMuSeMQMx5PQbZ=qsFxCPU1ZFugA@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] pinctrl: pinconf-generic: Handle string values
 for generic properties
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151023_490401_1B03E1EB 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Allow a generic pinconf property to specify its argument as one of
> the strings in a match list.
> Convert the matching string to an integer value using the index in
> the list, then keep using this value in the generic pinconf code.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied, I had a hard time to follow the patch fully and unsure
if we should add some docs as well? But let's toss it in there and see
if it works.

Yours,
Linus Walleij

