Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD07C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=; b=tfI2aH09wpjhXvt/7D4+e8O4xu
	nkmn2XTRIBFypZ4oS5Ikv29XtgxW4G1qXGFdYFIiipj/eMha/MJba0GMOKYEpT9CGNrp3b4MkDB+n
	k960YcZmxgZyDSzScvCs9NQFTZciZsYmIkOJyFqZLaGuXkcXK1DYdMtpVPbbNJ/3wcrCWS4pJQUzK
	y4hg+IPgzqEcknMFmS+HDClnlFgYSYH6u1GLclucAUozaqk41IkgNxKlDmQQadWEwL1riP6DJke9h
	1qNrewyOgBKWJY5FjXJ691DCU8CG+ayhWSLlGwbABaNjLScmo6gLepj7XE9jJkXgQl3Mw1CbCfYGF
	WZELQZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmppo-0000000DrV3-0RWy;
	Thu, 23 Jul 2026 09:35:20 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmppj-0000000DrTY-3dYs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:35:18 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-92e53581361so34423385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784799314; cv=none;
        d=google.com; s=arc-20260327;
        b=m7HlzmlA7tl8CjGlVy18ShsbN+jE5NrUHognjng7pUU7Sfy5OXmojNLQFX9G9Ag7EE
         UoiDLyJP99gj3uxv+YSvtWBVsxFGr9zJBj3c/4SiUe3gVzp3MvNRyHuz5H7Y5oucLEE+
         nY5pwlSBGaCBvTxt4lXRKpwv+GCkIyI39+arD2zNczsp14MwQ1V/NkyXs5rU0XDZbImP
         dGP8NxeSRad8TRIHe57Iz1munXgKNOs0mg67E8yJguPGQ3Bcnap6lmavf11uI9gVEJ3Z
         TYKvj/tVMfhpVgKHqhOTeqdUBMyy2a0Chn4h4nXGalEqaAAV8wHvfE8M3mP45NtWRLrS
         Mssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        fh=id58PllRFEX29LK/rWUxayXkf7lgLsObVqVAUGn5mCw=;
        b=ccucxjQSaSpTUZa1fb4s0UXPFeklhNPJHLTDS5UJD8eh8grQBM7yFyslIosw9Yyl51
         q7dF7q3r1AA/ikF0VTPUvqwmcuF1e+GXWQuRRfd1r3MwDpJHVfUmc4ainCL5nrS+k55p
         8Ws5ZBdksPvWjkBUz375ZlaKjET3U3bTiKZ59VBNPbhmqf7CDaQ+GS5K2NepFXuCQqft
         KN/Fx0tKcmlzfpDS7V9fA6k5gqxMk/pmV7DvAVXsYDZNRtJqpufamdvyMwdtv/kWvBrV
         8QwEsDRSkrsQO63hkuA8yPR76IbSSaZ9DQ2G0YCL5yBvupBFgTJ+0Yd8cAStUpzS1M4b
         E+PA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784799314; x=1785404114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        b=aFQVe/nuRs2awH9f4SJGYOQGEP4o6H63ZpzuzJ74OFrkcOrOgtIjOoPpuxDZESxKSW
         dB0DZGlD2xLRAPsVcI+QhFiwY8s/3iYkgmAAiOycm6EKxikfuiDQnRWhto4149MOLROa
         zVbWs48/FB2h608/BP9tcsnD/aWWyv9fdhCS9D7q576cOs2yxirzRjbhVbt9XDvVA8r3
         46zJonrrRdVwwlRO1lVC7CyuJorG/VY80verAY5GhAi4VtOE5HkbMKUoa9CMtsMahvGe
         VfY02VBCJ6XGU8WynohcF5c3fr41bN/wS2jyN2LcexY8KE/1IyDrbSuZjd44aJOOu3Sl
         mbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799314; x=1785404114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV/e0D4Cq+kXxk7foQFF5xP6EyKiu45j2ziUGVbkQko=;
        b=OaWdDXttKsgXh3JnqVKNlxCC2KQYskip0Hn8Xi3HNjFekBrUsX44aTR02NvQfElG6b
         u9IqT69m0y74CKCSkvAtODA75XlmlJDrMZnRdfWzjQATCuFfFLqfo4GYjpg7mEQiiqJ6
         4gNdHxwLOBVi7b/AcsKjxWcaPuypoTGLoNP5l8Dvp0ZNoNojPojoRWtoYI81m/6A/55b
         3VVDXPCmXb/nKoEfWd2iiLby7UgIoq/PkvYZvW5BVBKVNig513tqCrt3eqEDWBplulpU
         KDI+B3ZMAopbDDOE4lavQvYQnzZYapzleOJfxYkSRuE+DX4hOhPnt3kfqpnkXF/H6hjR
         gmJw==
X-Forwarded-Encrypted: i=1; AHgh+RqH3EO356csC8kP1/SGrAFckO0FvrfTSdSUaRfc4i6JYIunO6eTP9z+TWj7vSbjmym4rot9GBJHSAoXiqVRbodD@lists.infradead.org
X-Gm-Message-State: AOJu0YxC5g5MXY+JWjzoV4hhYhYt1HI1UHLvXP6sLbxsruNrlxpaWnVN
	MeRKbJr6wkN7EbtVMvXNZBu1KxTBllnjgoOZ/G+7gemoQFS2IJfE+KS14LSUTerbUi/ysVoz2gZ
	XSsobgW2uGRa1IHzzU3XEu6sXCIZKwCA=
X-Gm-Gg: AR+sD107sR4YnTMpn1uUYYS4yRmKRdk5bsFQLMH7ipJLq/jEL1a7iCzm+TCAuZ4ufZ9
	zeZV0HOJM3vuDvnaXPZZ+nggcsqkV+qpp1maSIAiH/H/AA8u/JhXMtm+TFmgSxg1NtP4g69zXT0
	9ElS1mjHjxce0KIDKg9Sja3AD56mDkFO3dldwkXJ0KTIYgstwcAdoa3jPacsGR1MiMfaDrhjiSg
	HXSa3IMr18dia2iO4moojVznKFc4UCC8j2cHRtX9CSGA5z8n16+AVypIirVKxE6ZLCEHJQfxwax
	hCw=
X-Received: by 2002:a05:620a:7002:b0:92b:c6cd:7f6c with SMTP id
 af79cd13be357-931038a842cmr237751885a.34.1784799314332; Thu, 23 Jul 2026
 02:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260629122246.148696-1-akkun11.open@gmail.com>
In-Reply-To: <20260629122246.148696-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Thu, 23 Jul 2026 18:35:01 +0900
X-Gm-Features: AUfX_myChBNOL8FDaggU_KSOgeBeezCWC3VAKALkyLtMuEBpjgaCigCdcfIYHDY
Message-ID: <CAKr_iV4nwatQ-8NTEkJOaP6fzrmg_-_AZ+1eWBKpRcJq=1SMXA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: mediatek: mt6589: Fix timer interrupt trigger type
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023515_934577_92C7AEFC 
X-CRM114-Status: GOOD (  13.04  )
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

Dear maintainers,

On Mon, Jun 29, 2026 at 9:23=E2=80=AFPM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> MT6589 uses IRQ_TYPE_LEVEL_LOW for arch timer, but I sent a patch using
> IRQ_TYPE_LEVEL_HIGH.
> The timer worked correctly regardless of whether IRQ_TYPE_LEVEL_LOW or
> IRQ_TYPE_LEVEL_HIGH was used in the Device Tree, therefore, there is no
> actual impact. However, this is not a correct description of the hardware
> so correct it.
>
> Fixes: 2a5d54507c68 ("arm: dts: mediatek: mt6589: Add Arm Generic Timer n=
ode")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Could you please apply this patch?

Best Regards,
Akari

