Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9873CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbdMXV3ozTZmE/S9AboaOaM8iqRjDNxZDvdwE/Es4Cs=; b=fH4ssfcUwu9ZcI9ab/Dq13phJQ
	JUBBGO2d/FtHzCu5coFuVx5t4JXEDNsVy4MKnfJ4rrFdIlcf9sNu62MB3j7H+xdNe+rX4jCDr7cNT
	Utn0W7xfUQhatV5qvQ2f1DqbLOaoeHQk/ApI+lJSxNJ0Rd+lITNi3UrPe1NRHDUAXJYHhYqdM8b3E
	3iyfFt9DtJhGeXG34bx9Xw0ZEFVk6RAhHVYFGgmOpLR+j91BhoARx8imXt+ukc5YISHo40wLO8xL+
	fZaQ/7VEEt2cisSTLsEoSnc/vB3Upx0OFI2ZvIAdVrk43X//wnPjPGbRhFXAMRtgVkUwIgKx789zd
	6zFq+iSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EZm-00000002lpt-3Ylb;
	Tue, 07 Oct 2025 20:46:26 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6EZk-00000002lpT-1kWc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 20:46:25 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7bc626c5461so2235795a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759869983; x=1760474783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbdMXV3ozTZmE/S9AboaOaM8iqRjDNxZDvdwE/Es4Cs=;
        b=yKLSc22GrKWulx49Z07KU20xk1sqsbun5rIkI2GxcMy0A/GuZi4kBWabMDE6/5l++B
         y7kz6+FbktM7t/v9fckcoJv5P7+EPvjwGOH1WBzb4NQZI4b6VNXt7Nro4zakITbB/2Pr
         oceRul9HkWrXrsajx2xf1x5Xl1SMfkt2xa6uqxLW2WLia9XXKNls9HMaFhPJ60I1gaow
         OUnbAbwB5i76p4pXQIm4qyR3FChSHL11seuGD4PIKDPYdKEIFl+nvtnc/tnCh+Ub56YB
         bhWDYz/1fiS2StDtHdwrbowNRV35LLBC6V5Ys2ZfVyLLKQeyd006gE5ZR7LMeDXpnTTz
         jccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759869983; x=1760474783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbdMXV3ozTZmE/S9AboaOaM8iqRjDNxZDvdwE/Es4Cs=;
        b=TUGQFnA/PT3zQ9XVH/6EuRNOuvuyJ2f91jBXIX7KuJfpeyPFlU+fX4Lhv1aWCi/jFF
         rNBJF2ET0VTcU8vU9cqigliRu4PCw2HuFBlG8SewRAA/Eu0mh5TzY+40wJHp1mJBjL+l
         8m3Mr2ln9Rq4PlMq/Ygnw5pHEwI10beGy4AbjJwGGONt+WdtqVJgfMxWonGy1uGO1aQF
         VsU9lUKYUWCzA+rTz9xcNWh9pU8+Q5ZTgdTzutQT9HAbtKKmSKuAj1Jtboa5JZHOtMlG
         744FxWYFrMK4zfw77zgJ+wcFu+UMRpcFwxYHoJxFGVYSFHNOpWT+oTklOSxJToBkHOJI
         XTDA==
X-Forwarded-Encrypted: i=1; AJvYcCXzgCYPSZE9vzjuZaWxtTv2udRzi+4flEM2yghMn6Nzq5T+ifupowI+oeYaXAcRVu5LalHu6XxwE/IlBL6kUWUc@lists.infradead.org
X-Gm-Message-State: AOJu0Yypf7mAxatS8Q3VB8tZyNiFd4H0L4+9/b9YXlQiMvpWHbxXmMax
	lywiohnLqO6GGPIOCHAtoIbKeb61yzIJ4rHDDLCb3TkyLWooFtSDEpF/Q1zB+fO72VpuRO+T5St
	gK5ArdSrrhKVeaYnz9a4p88myHOO+bLLaATp4CntZuA==
X-Gm-Gg: ASbGncv3RY2MxZ/DFFr/9OZM5zCAEgImf++6ittwqcyaz6zruwssm/e8fZG3K3EWVaq
	7mZwVcw7Y7qNB7ayxpchzdRERXK8fmfwSqHQ62YKHvatmqMIl9qjLjHaHYgwYveKMVcOhc9DQbZ
	3Ulyx2AhDhk5Yp0BgYwfLVgmCo0rWZB4WaeE5syan70Xf947dL0KObbNGDwIQxG1EG+6yxstTrH
	CEDmlT7Va5+90a2+FjwWGV/C9oivzqyoQAPdw==
X-Google-Smtp-Source: AGHT+IGcTMLJLJFMRFfxr35P1VFknbDk8xxpM6Ma7bfAlp8Jh6N302g2i+0XPxTMnwxgopW6JsJbBg7g+qmgQgVNk1I=
X-Received: by 2002:a05:6830:621c:b0:746:dbc7:e3ee with SMTP id
 46e09a7af769-7c0df715858mr633841a34.4.1759869983308; Tue, 07 Oct 2025
 13:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org> <20251006-gs101-pd-v1-1-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-1-f0cb0c01ea7b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:46:12 +0100
X-Gm-Features: AS18NWDxc12ZxAU4LNjeEPKBB8NsjHFZacb56hFZBSRRIbtDZk4xL2W2KL2JXWI
Message-ID: <CADrjBPrT6LVqs2NSu6HMWiQ5Rm59pXcbfcjLc3ZxrVBrMjGQwA@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: power: samsung: add google,gs101-pd
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_134624_627625_D05D76B9 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 6 Oct 2025 at 17:43, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Add support for the Google gs101 version of the Exynos power domains. A
> new compatible is needed because register fields have changed.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

