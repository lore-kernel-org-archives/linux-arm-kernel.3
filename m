Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB1DE674AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DT4BUUrZlHb5wtWoqaU9rjK51tJ5tSI06XldWy/zGcY=; b=BKmcBo4srOAR4DLqJKfeh635Ud
	TBc9+RXt7feC0PPSyWM4ZtoXUgpenhFzzvXxkcoAVyco+/BnYtT5+xFM8am7WcR5T0As85x2xrWny
	FUl65a60Btq9eJuTIFYJ4p7vRvTBKIDTWpIDOxn3kGDyUZetUSmtSJbmwdPwelNz4RQBBj3nYYfOO
	3NkKZ/uuGWtSd0CxsWmd21ljxzTCdGGB2BuHjNRT6WL5bCVBq+dri80mEXC297TXghz9zeSuFOLxD
	Xwwyuac/NrKpfnuGFDSHyQeqnvOmagXGx4rAPGqY7cd2ZX2+RzNP5oTgbHsQwBgPd7MkBoepDcvVO
	Ik/QiIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mW8-00000006BRv-0kD7;
	Fri, 01 Nov 2024 07:56:24 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mSy-00000006AuG-3r7z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:53:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so13022851fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730447587; x=1731052387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT4BUUrZlHb5wtWoqaU9rjK51tJ5tSI06XldWy/zGcY=;
        b=StEmHYRTKVN55hK9AWg5nmKMv0mUFf6bzdEZorJfoo7u8iLM4Lh+YXMZCaAXN5yXOg
         djF8jSJvnNHeyRBw8IW0JEteDBtdYeji9i/TXuVTZVtP+1Xs5OYcOO8u77RsqpEQb53G
         FPmnz62SN1vEG1Egp0DoC3LmU/Xiy1FXGu9BOx3yUXPeOb6Pzz7ASpaSUFJ9+uJTb/8C
         AmEY6qFE/iXE1M9atNpGrhelkOnAIWo7NRLRPJqxqZ4bMFnwErkIORq0JbhMl1K8/1w0
         JYvSkfWJREQT8gX6QBplHL3GKcXiMGIv9eULRz7rNFCkxDKx8LVZOjUXbKoAgT4PKzmg
         mpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447587; x=1731052387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DT4BUUrZlHb5wtWoqaU9rjK51tJ5tSI06XldWy/zGcY=;
        b=nu+bbwJIOn6j+lhoJ9eyyVFmEOhEbv4QKU8iAnZuaSQe0eBEn+EcC0LMKX8CtYqHv9
         DrSBzh+BraO71h6FKefiawTU0tAH+o3dvWdvNvWo+Z60Df765DEVUXkfkU/fTw4XhZ/E
         0dkUQ35OPtinsmJl4eR95LoLFeF/DcIth/0zSTQwzhZSfzF4GI8bO2/caalp5BSivUXz
         YduCtrFQnoY3GS0ymwH5viMFPA9LB8KbVsJcd/tK+7w2HE1PVEz5G2/FXqMYDLgSu+SA
         bnMmd3Ev00L9RnGvyjIaOWwruV95DtZKaPk2nIRqFQcH8p/FATPc5Ql+OXNiwuqSmrG6
         qHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtit3F8m0R5m+ytPnvD+0y/IlHu11kUOgadJuVLAynBSedyCF2P7fkUnG/XKivdbZ1M8xFLNT1FXVqd9B43jf/@lists.infradead.org
X-Gm-Message-State: AOJu0YwABzPIXOSWXenEHeVR+Ph0EisPLo3lJ4DmanytTzI0ETWF0OHb
	WgTOQnFq1nJFvR5kvLojJce8pRoDBM8SmkNFnvQNK9eqVQzkkYpgmBJdlIfeZJMvV0E2Rni1+8P
	V2C8hmTDrWB4JqrZUQzt9ovjEVBIviEEEy/QLpg==
X-Google-Smtp-Source: AGHT+IELZSUI2DVA+FzMz/42W8qvFTlg9IGK8lEs4ICj6atJj/tU1JEoUYcgsym6ki0o0frp0CDKeHj6QhhvuKqrWYM=
X-Received: by 2002:a2e:d1a:0:b0:2fa:fc3f:d603 with SMTP id
 38308e7fff4ca-2fdecc2f1b2mr24393451fa.43.1730447585232; Fri, 01 Nov 2024
 00:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org>
In-Reply-To: <20241019-genexis-xg6846b-base-v3-0-8375a0e1f89f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 08:52:53 +0100
Message-ID: <CACRpkdYThSfotnE4Hra1G3kMrn=SNkOEuKpq0U2nSjG5Xz+yqQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] ARM: dts: Add some BCM6846 device tree
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_005308_994643_96DB94C3 
X-CRM114-Status: GOOD (  12.22  )
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

On Sat, Oct 19, 2024 at 10:39=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> This adds some silicon blocks to the BCM6846 DTSI file and
> adds a device tree for the Genexis XG6846B device that
> make use of it.

Is this series good to go? All prerequisites and ACKs should
be in place. Pending on the list for two weeks.

Yours,
Linus Walleij

