Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16645D690F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHpZFedHEBtUcb+szMjru33LYi0CiBGsIbwkSU8NyIs=; b=NykufMnqcc3qJW8imP71ygZfNj
	5E1Zdvf9VFZlTGEzmVh/zUdU33/fVCCt6k5U329Yv5mHL+q3ksGE574uJ24yDPNChVHemxgu+A3IS
	9RsFpjQQokA8J6LsneEw8qqTD9r9olb0k7vStjkjEmkNM9c+nh+DzjpjC4asbLKzt1DSHCJQ9oryE
	5T/EPIQocXALPM+u9AY8QkLDgMmdDzoEL6vVWm35MIjsgGcNmoazP/8h63c5w4bRN7iRLQuQ0bKzs
	2kuWtaIWSUO8R3CMShfkt00srYEBFxGbEbFx6Jkly3bTSdodGXioy+s0Vd0envknoRivCz8sZG42/
	ytt1ajuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcDj-0000000FJL3-1GGw;
	Thu, 28 Nov 2024 10:58:03 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcC3-0000000FJ52-1vdi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:56:20 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5f1dfb0b44dso261351eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732791378; x=1733396178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHpZFedHEBtUcb+szMjru33LYi0CiBGsIbwkSU8NyIs=;
        b=gJwUcxrlh/cBO4qa9PCZiDU1N1Vo1FNNUP9JIGOotFvjKSj99DzqwKJAFnIjQ8ibGe
         dugDXStcV9qVI1Hd0icuShJIB3DviiPf/rd8DNGC7wIpIljgfKgZ+PmmlUWgfvrP7gdf
         wssGTam+ZzxvPv0x90lv+8RoLY0ek+YK9GYgeFcr9IpbcYR5Uw7yn01kEfqgqCbYpX08
         nWBoaD7RZ2uxkQt1ZaM9mn7j6fW8XYrdzZmm/FMYC4+uok58HIkYYrGX8X8Eurd77vxk
         f3CA9efgwFLJnBkWzevqW3AgsXkh1Th/PrVS1BgJnIdcKNbKJ5R2HV7G0fYm3TXPGU31
         koYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791378; x=1733396178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHpZFedHEBtUcb+szMjru33LYi0CiBGsIbwkSU8NyIs=;
        b=rCrSUCvv7xyonbyoGC73ny+nyCb/G0x+QSXYnFKZI/h/bW+bYZl9kkh9dnuvwSe0xs
         nT7E808jirPOKn241+4ejk8HBdApGmhDF6GXmMomV4ZTiEqRdZGUKd5WFE/WWoahUCJt
         bjCMDvIIBlj5alHLTRyAge4ePhf7lCTD2bimwE6wUArjvVvVLLRu5/02W9yRRN41/WJq
         LdfJGE+21EosB6LB/Ru+JSTQsHLKTlGvWlx10WM2Zrwl7YYoaK7IG+nhbZAWneqbAFFW
         enR0KlxDPj4tdF3F0RTdEEyR4wdZgLmbAPesT7E7eT/J2qAom/BUozByq+NhN+Rxvdoj
         2GnA==
X-Forwarded-Encrypted: i=1; AJvYcCWmuWrLzCngY8TCmrIStnaEtVxgTVHZ2FzYAX+le3u5rH32fLY+tege6nuPZTx4HWtbew1lN7Vv87faCkL/iE/A@lists.infradead.org
X-Gm-Message-State: AOJu0YxkuYJ4AKNqjngqJcBM1xWTzBOqbMlHKsrJ45sRVuIrj+znkf/G
	olQ17zA0Zno0rmJCyQNPygxTIK5K5cROUZNkvuWs+eYZXpVSDV1fS+HO47KmTYJwX0AOtcDhwG6
	E6LaL3gN5r4wxInx3TdWA76u5Vh4iJBVt+8QWsw==
X-Gm-Gg: ASbGncvatbU+syGjoXuMcpgR/49KfVMGR49wItd5CTdBcNtiZO4MHHcnvks+Mx7Z98w
	V8PMVzEdYd4YnWWLRCZuM/qHrlWzTqJKe
X-Google-Smtp-Source: AGHT+IExQGgfObepg/1Hx1vn3/3ajGhOjBe+ADkPuF/jgeiOTQLuy+sihE6vDknoDDEFX2CMag6bWzzgs3MwxWCbYFk=
X-Received: by 2002:a05:6820:2704:b0:5f1:fd30:f45b with SMTP id
 006d021491bc7-5f20a275359mr5606418eaf.8.1732791378483; Thu, 28 Nov 2024
 02:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-4-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-4-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:56:07 +0000
Message-ID: <CADrjBPrVgnS3NFVvouRYQ32xBfyYBHKAgFyhEerMzenarE3G7A@mail.gmail.com>
Subject: Re: [PATCH 4/9] phy: exynos5-usbdrd: convert to dev_err_probe
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_025619_497658_C001C50A 
X-CRM114-Status: UNSURE (   7.24  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> dev_err_probe() exists to simplify code.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards.,

Peter

