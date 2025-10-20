Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6903CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=; b=Xzmv3BYs8oAs4rrh96wOBx7cNW
	FG+Zo98uZoK8gyJDxTSTdaebdiq5uyevp0w/0kzML20ElvbLBYf9zcw+cZlPCzmNjacgB/0FY5m/5
	g5wQglIdb+4bbnXC3ew8cFtiXzquFIp2jhLIJDBOyfhBSGyNkW8+kiWPQQT9Y04dDUbBOsFsScxUZ
	HBy6cpWf9vmn05u2A4KDMGtGGAd2ORp+xVFQ+VmtVVOkOoIeQclo61kCmmTQ/H75KxXm9spPg5xF4
	YO5SBvC19uFeq2zXDuAV7nv/Zd6qAUMlTzRX5l0y5YE1nvhXrA0NSEfBeKXgziz8UKnuTFkow1ztv
	/Jj/Q6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwwp-0000000EzZz-0YxY;
	Mon, 20 Oct 2025 20:57:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwwo-0000000EzZW-1AsL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=; b=I4g3nTorVEjD2oZuFiFuH1daTk
	Ol9UVkAWdFVyKYBQu4u9qw0l3lAZPEbfCOn3e389pYzGBGkiMArlJVOQmKB8XSpKtpC8UUmZtzOt+
	z5hhaL3/pE0dA0LB49jgDWEeOiDUnWDNrBaO9rh9agiCIItEbfVezrP+o4u2LSFc1dmfsutJPLE7X
	bZkCHTr7CCkDZhkHNcTPeLjA92D/DmZ2Yq0FB6SxHFA3u83bNBM1/fnPUkc22mDr6gT1An5+F/i/J
	wMQnVVzatQC53ism9ipUo2SgsIfFpIJtRdm/0q33QXkfkK0Jj3YSOKuyHEAFiL7IRrp/mUHU5GuVE
	gNhjf2+Q==;
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwwk-00000001kde-19zJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:57:41 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3652d7800a8so36721431fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993770; x=1761598570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=;
        b=wJcrfrVU5CDZLqqA3lw/WVXFnxU9IAiqrMhPkAYFjtuqTl3WFluto2agvMrjVx8X6V
         7lRYJfE25PK/AXp2iIUrt62SOrW6LbHqm4dQHkETny87IMuRiy26OPD1aBe4NjptZjK9
         xiVzQ4x4Me9iLHCA/CxTI5Y3SoglryAgt20NtigxdhyNjDtF6KAbfIe+gVnJhjLKkvRa
         S/pojtioN9rrFIk9kQbnKHDyL6owtOIjSEVsU20WdWVoJSoTeMdJ1SSx+Stg7XszJ7iy
         Brc4/YOtoRWadKjQ88JmewqPI9/DjbqOoZexMID+oF3+mXWaBIMLKA4v4DTMbMnA85lZ
         R4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993770; x=1761598570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPDi/ONzbyezo/404PgKiTkyQluk8DrLj7+zoZTBiI4=;
        b=TRJaSbt4s8VejvG9kTU3wOMnfyIRD9wo9BT5d/rG2iqKZlahiuLF9YcOEgiA0wPM6D
         w0pTllo/9C2bt64DLvbOJKUSbjEMgcaOKbFFlZe/n1iF0dwtwRt5IgXezhpc6zxEtNeo
         J4cFz1A2/w/CzR1z2uf3xyBIxPiJQwGj7VF/+2lOfkA+qrHK6Q6vhjbigwSzjn7YHqDA
         TjQS61Co4CVUw0Wr8PeUIIukETqii2IPIPaDI+dYu7U5+dwKQygfRh2CZUbXGgjhqmmW
         mkPZSuuW8qPUEKJ5TmUhe/YB9ca+cf+ixnT0KcY8lVdAIbLmFiO2GuhYdMqYKvjVtrrq
         hobw==
X-Forwarded-Encrypted: i=1; AJvYcCXdExY5uGnxXQml5bFzTMWwIjhhTmx3QpKY1GR2lrf9NM7h6gusCh1FVKkCLMePNRs54K7OvQ/ygyKglCkZIEWG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+g0Q2jlomIroQZiKeVT0NKrGc7gmsVYDbXDmapjX2MpVNVUbz
	pnL0b4BP9EodYCEO0jKo6GOdxlKj7WMHTZO+G6Sv9iaF+hCqGkFiZa9m0PlkLpTuKtgx1JctznB
	up9L5965iiD8wI7b95KHKFxtmEEvI5qVtY6Sdk7ddxQ==
X-Gm-Gg: ASbGnct0+9o4QV/VKXbq+A/JngtW9Q1h7ePi+me0Co/R48WEWVYJWwjOkYghnuSm5E0
	KYpuLTW6EojJA86/MjgCx8meYj+xcRPs1uk0A+tbIhkT+MEFFerih5l8MfUZ6ZlGayDr7eJvfhP
	eAg+bpiKD94nKGlfutxALn9x2QVrbeK4DTXQlqC3Q9YnkQG2TcrOhMDjBYv6KBfjsZORXS5KeQe
	0vNgH81WOIVEjGarRa4KZBF/acm7iES67cSq9VzVrpbHlMgL8V2QO6KOs1RlwsoIvwDrv8=
X-Google-Smtp-Source: AGHT+IGRBR+snc/mrP1nvrB/wKqtP60la1CSY+obenGlvqYErOCTks8k7mteVD4O1yzHKYMcoV2tSKBToVA+O8Sh4TE=
X-Received: by 2002:a05:651c:12c5:b0:36f:284:56db with SMTP id
 38308e7fff4ca-37797a0e741mr41754291fa.23.1760993769829; Mon, 20 Oct 2025
 13:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251013191207.4135075-1-robh@kernel.org>
In-Reply-To: <20251013191207.4135075-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:55:58 +0200
X-Gm-Features: AS18NWCmdoPe9mUqm07LgesYzmI47cpuULBkrErXJf6vFAkis6yJb50IYSgtdOw
Message-ID: <CACRpkdZDM8zMtuPQ6rQQ+TZhz4bAYOepeETVQ34_MfDYx0LMmA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s700-pinctrl to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_215739_572244_8D0EE2EB 
X-CRM114-Status: UNSURE (   7.16  )
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

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the actions,s700-pinctrl binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

