Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7182CFD9E16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=; b=PKETZngdncrWlTdEcV6ZV9d7Hp
	y5TTmmlYHQBRHR2ZZzky7tiJQAcXoiZ39EOB2QcjsYGsBKRJKFugikGT458uNlmAPyRZJZpJEgEpy
	NtDoTY9VSqznf6hscRm6FYBXOUtd7AJimOje89fyRi0t9dHEcYrWzPajOazdz3VsceVMcqOJbLjyy
	7z2Cy/Txb8Hl97KEHCZV9KAX9vrCcVLfIGPvg+tRpzsWmgUcsc8KjWm2y0Z0jp2bRUtlLxoHN7PU7
	ezAR2C/83SNKSP03pNc7Ob8zMsz+rDg7CKE5JIvt2l67skK3H533UzjQQOJh+3A5FnX+Esq+pjhFk
	HRf5O4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvixu-00000007Fii-01PH;
	Thu, 26 Feb 2026 21:32:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvixr-00000007Fi4-2ZSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:32:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ade1806c28so8271385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141526; cv=none;
        d=google.com; s=arc-20240605;
        b=OIoEn9QlaY7eJkxFndnTmV5jhTg0J1SWvGXYhqlb75igkKSv0/vcWD31EMdAQmeGJw
         EAUiu8vvqqbk32WPM9BuYsKeLP7cEf+igDzw1eT0IBSJcKkyVEIXtSAyFMW5WIGuNeoj
         rEK41tUWNl3IRf3WkEPVDXqyI5uvX9wB6pJARYMKomD+y0y6SgyRmqAi2SBffKGRBYdJ
         pSfZ427eFGw1kBKxwBHxTnGu3dlmKUwwuqE6bIDteZonUxUDKnnAbPvbofT/8P5WZlGw
         DvAfDkl64VFPowlvw6PW6tKcK/gCR+/C0GtZUSmozydcwVU+CY+c5TJ6eMm3UStrz/7s
         LBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=;
        fh=liqTsv8b4gAQhMV0GclGABFNYeVfwbleLcu1Wjwag64=;
        b=PU0xvuAmKsZSZbRCesQOzfDhlKmrMUXHrTL00zmSQsfZLOa92SZTYz1p2p9o1WDpEl
         KTlSVVGLEykT9TKUfRvcD1RtNhBRmuWHBiHoEtV9n1MMKy52vIHfDi0Cb89Q4NzZ7HIh
         4dShOQ1bw70FnxMBgkQ5T9PDNPXMPZAXwsq8wher57892+ecVe3t7nZc4RSnp5EzrRtb
         26wB9oMfWjQ6H8nfhPUXe/Fz5WX4m69O9s1dFl+/GrTvxJFkOwQ7R0Aq3n/u5Oi2J07Q
         vlV1Glm8pzWdXHYMhdHLZYrC3CzJkC34uWdbnQuZdiTJUQKl9yEcl7TYNV/TxBWBj5+g
         LK1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141526; x=1772746326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=;
        b=OYNCUn9Up7FhuCa18MSRbd97w0pkoa5T1tRG9jRCPfFP+4sEJWTFwqGhi7fNNWikng
         7GwM+QLa/2e45eEewo3+W4nIqFKF2xGLyu1YUN/KFdm7s+qVaWTjEWtEft3kHeNdNs4i
         dLPwwoD9GNyArQqZpJr+IPziTGv/xTlcjhQ18L1IT1OMd0H5sGgnFz6REeRqANcLch25
         R7uqzGE3o4r911Ci8gtNVCiqPXZlmiQIE7rBHHNfzrA04yGJi4VnNFPNGUwoNChrz9DX
         puaxpfjmlu5CjXLaVlpS40uGmSnD3gtlwVDzT0oFfbO5xEFYEvUPL7KL/BTiqm8945Iu
         ShHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141526; x=1772746326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIXN27cKt5LsI7McWSFCiBFDokrmQWsOHp+I6lUGsTg=;
        b=N7XL+bjy65pZhLeOsxqSq6gR7grKZ2qTOEroQEO6lnznxSGTYFUWyogvOWcKFxhrZA
         XQNW40dGnPnY5t2x2ZdtnpO9Q4ywCKodgpMYcOsAeCFw2PjoW6dE2CIr7PNhIztvJcJS
         sJ4pm/bEdmxGFlDi/KCPlvSD8dBXO7aPSjYebpjzYHa+s46FSMBKwgqHSgxIQYgw66+g
         f68qy1Pmj11N1gO/oyQoZL99UCKay/F3Tylg0ChZxJfkJ/7YmaI4i6Rxiz2V2CLr+FlR
         0X4CTYTwu1H/Wp3XsahlxGPa7LMXkQeyEGAeJw1TRj40tZIFFiP9y2pPf/ZDbSjk3SMB
         Y5tg==
X-Forwarded-Encrypted: i=1; AJvYcCWVKRUFGVy7YeiOEa+cjBFGEOLRU9gbzwzUSyyx0jfyl8ncnaWyPFqp6cdIUZ/QwcUBSAfRe8jVuSLxVx/IB7qo@lists.infradead.org
X-Gm-Message-State: AOJu0YyiJWxnwsNzB/r46E4azMDgUvMbf/jNdwGFNlT5S0uTZa2p6Wa5
	aFaLssXGvXWYqlW8bbjCNaOzQCiChImZ738Mqq5DEYHTHm8HrlXgocU7Ux21D4vLMR0WoLFdQuB
	mudN5i47d5b27MBLZ63IGIIlXPJMhQpw=
X-Gm-Gg: ATEYQzzHkQAZ/sGn+zNl6zaKNHLhn1bDocRsl1G5XRc1iJTqocHw03b5zTo60syRCFZ
	+HM2cIBanQ/LpV4GnU9TCb7UHYBK84t6st/cA3/MYMIcD/TTu2mP3+cOxHpCBTFpB8fh4y0KYq/
	YXNMNEuNFOyi1J43k06s/nqyiRRBKrNNaejBhGc5LvYyCwH/inV8lo5Llolw/9pY1e0basEhjiT
	lnAt4g0AV8LNve1XEV4448hceG8bRl+0TL5iaf1cnAUaqBjpm/4xWDBDRcwsgFlKWJR885sUSm4
	AtF2p6A6rZJpOrp9G9ovwIp+Bm8sZhNQ/SYxW+Vd
X-Received: by 2002:a17:903:1250:b0:2aa:e6c8:2c73 with SMTP id
 d9443c01a7336-2ae2e496d5fmr3711735ad.37.1772141526246; Thu, 26 Feb 2026
 13:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-4-nick@khadas.com>
In-Reply-To: <20260123022258.136448-4-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:31:55 +0100
X-Gm-Features: AaiRm523Bjd_ZXG6sxAvgig3lFIwI8meXXnqGhq1qHMJ6dES05oESwn2i1_PAM0
Message-ID: <CAFBinCAc+gWy7ooUyV8zy5+So7dXF=+x3LAvno-f2Au4a-uDbg@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add PWM LED support
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_133207_674584_261991E3 
X-CRM114-Status: GOOD (  10.25  )
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

On Fri, Jan 23, 2026 at 3:23=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> The Khadas VIM1S board features a white LED connected to the PWM_G
> controller (PWM channel 0).
>
> Enable the PWM_G controller and add the pwm-leds node to support
> using this LED as a heartbeat indicator.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

