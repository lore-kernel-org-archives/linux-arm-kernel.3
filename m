Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4350EC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=; b=3C/ApbShdnITnerLwBXpAseVPR
	lrZPXDcKpR/zt8t7pqqdD2tYT9M4tWpgZIVjv8HL9hSRpuGMSSkh0C6HL0IhijtwNIidobQ+ird84
	mMKTeB9vqPYUCVHC4/hMWu147HvHWiE6gOqbJ3RuyAXlhAl3f20d+MDjfppX96W1fBC6+qVh4TrOd
	WSmf7pLjvyI+4iJl1Ui9qKrHp3Hujzcgtu+e1gA/IH/5ZiGQU/SNuETlgjhG4DyeXgS+NOoyPvM3U
	yYzY8V3MDbfAvSXK3W26Bh5/57BjYSxupCW8g0zXNEBxBhvB1SB12NQcOq1f+lZYA1cBoLEACB+dd
	ZhqoUJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th9WY-0000000F7OM-3ibs;
	Sun, 09 Feb 2025 15:47:10 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th9VA-0000000F7Fj-0Zg3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 15:45:45 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5fc447b03f2so893282eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739115942; x=1739720742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
        b=fRnLsxNAldY79rP8LYq3b7zAj9Zju0FfVVgxZzZdds3WR0sQh8WoVuwFhDQxcQMdlg
         /s7d+V64YyZvAUXvvwunBZMRM17nvrnFRJYZTvDZNXUTBpsS1Bnb4W3o/RjzW/c/kiJw
         A8jVsYRLstn3szSfPy3KORUoag1v0zFEOWvf1rRdPw+p7Sn5lU4HDbrrg2bA/Fbnu62N
         m8rtiMaOPDhsyyUoGXzpQXuWxTz1ioHuksSF48jiNGGuAYNFRsz9eMsLMiEhE043iAhc
         lgu9lZE1IA9kMNRj83DZ1e7UQcvACcJmaqph0xG44TontwVt5ks8I2Kc9mu0nKi+HYmW
         82OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739115942; x=1739720742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gxfD1sGulzTxTC3HzNaZx25H1bSoJxtnCdOgYxuQVg=;
        b=LqefbFAqqgki3ynUM3K6mYV6Fjsgi4UppRb5RF9afFE5UeV/4B1zutiZXw18B0NNo6
         kmNRyRrazmy8AZL/3+ahoAR7E1YZx7aYfY0tmuf7PPzClPTnB2T38eTdjno7xxxhkflI
         Hk/QDnZnjoRTE/jqzrt6cNeRTu/JiMaaNiY8OgGfOrqMjHF3QuF5eJysCMmHCrXns0Ek
         Iu25RhzlTgYyTdKa977J4wuWD4OTDugOp9sZxb2p0ubr1LK2wNCxGRRo28cZvP8yYotl
         TXIw+pqPwV1UzGW+XJgBVEZxhEiOrwubxc1AgL5fjEY0GLBZ8fdRoIkN8DZKWHBgQX2L
         c1wA==
X-Forwarded-Encrypted: i=1; AJvYcCXhZvfjeUAdijOqszMTkkmnK+G3brwgVCcaOYmcHYTKNailvR53enzHVW4Df/uG/uJM2gVV/CSx8XtrE9EKwxgP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3krymr9PmK8D3zOy52UDlLACoqQ7Rl7+IZG2coIyFJdp+VWoe
	xrTB4brZFwt7thagZXHhcd8wXorByiomf59lfrwp12+ayOhtpvvD9qH6JsAhCYs8HylOwvnNQLP
	uplGoDH3ozwpGYj3TNoETH9YjGVR4IUHQYmX9v4rFoqtpc4Z5I74=
X-Gm-Gg: ASbGncuyMSHjgId6k0xpIHQvNh3HbxdMbQPGOaWG0kHLIoX8UmUEIKCbLg2zccyJVih
	s3NPsbj5v/2yDn7QQM6gRZ2OvkghyhcxCyUNKjtipcubS3mZiAFR3yC/+CwCHtXI0L4Yb32dA
X-Google-Smtp-Source: AGHT+IENz8t4vUeXGtVHid1JXOXuNJTbdadkrLtEQr8ilv9ZuDGPzHbJyKQfQcMH15TIJAyObgIJoVuODrlm6BQNqBM=
X-Received: by 2002:a05:687c:2187:b0:29e:75ff:4d0c with SMTP id
 586e51a60fabf-2b83eb5153amr7084882fac.4.1739115942497; Sun, 09 Feb 2025
 07:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org> <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-1-cdfe993fb3c5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 9 Feb 2025 15:45:31 +0000
X-Gm-Features: AWEUYZmSRsawKgL0IuzGCyXzwqdW4eDJSShnscBuwYbznWcXl18S7O0nhsTO_i4
Message-ID: <CADrjBPp0nhUEP3W-GG1xf=SqAmSmkDeqzP--wRmrin0JYYQDcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: exynos: gs101: drop explicit regmap from
 reboot nodes
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_074544_185501_5207F758 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu, 6 Feb 2025 at 13:08, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The regmap property for syscon-poweroff and syscon-reboot is unneeded
> here because the poweroff and reboot nodes are children of syscon
> already. It also is deprecated.
>
> We can just drop it to simplify the DT.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

