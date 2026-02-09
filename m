Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CD8E94616
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=; b=oRDJZYwRnfCo5WmZ7si898sdOk
	txCLqKHtlhfbpqrhHnd+F1S3kKwU0BtR1nqcneEeu/7QE0XbVNQbEb9Hzz9JTLFY9Syj9Q5ZF3Xpg
	Mi82QPSQ1IDq5LdOpgZKIjU5SxOhilYQei6HtBiZmrn5/lc5zDJE8NclytaSnf5Kaj6DrRtQEDm1E
	rcTH1c8cquLYf4WjydCi951ON2UEUs2pjqgDVfYS4eh+7IJ6cxebKLd4WGlohzcV8FIQNGgizybW9
	7NuFyHTEG233ITXdbu3+VBvgUENjU0NiKTgrdVWFWOjIJDNV57tEBX3iBaPDGG/oSSwSYmXLLHRV6
	9U9NPfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYt-0000000G5jS-19ob;
	Mon, 09 Feb 2026 22:16:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYq-0000000G5iJ-17yE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:16:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2aadc18f230so12078245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770675411; cv=none;
        d=google.com; s=arc-20240605;
        b=T4BevNtvWbKZ87HvZ7F0LwH7gDKSAfPfpU6lfeXXuIWAqzbQYoaFjfPBJuEIeHs9Zt
         qG/J2cSW1MTgT07YqMggthj6GdzxBEt9fQT2H1VvR+0EclWu7G7zZzQGO603G/dnudIc
         L0aSKysZq6ofVO5XXJUcW83P5+OFmRFqBFAh5nlLYMQgTE7Ewf1tUFwyBO/nrOoDLjsC
         8nsBI51GeLQ+gzqWgIUAz4W6dYf3EkuOfxuNO1TxdGLnERlk/QV1oUgWcu+QTBI6mf9B
         WQOWTh2XhFBTMQwIyKqnPPu6Sr4FAiH91Sw/AXN/Lizuyp0N2D/ho5haSA/9sFmBYqBz
         Kb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=;
        fh=Mtoziw/4R0VudYvi7v5N7VUKWSUZWOPltgc3/p78yKA=;
        b=XhXFlN7PgBcps5z7xqwipmze0+o7rIyUp7gXtzH/3LrLtKxwZJpgItC6QIIOWhdG5S
         fQ8lZAkCa2ACYEd2AtSgqlMq/sIgw04t0Jaygc/N209Y2kIwyd5wR7t2IyEcK3MoB+l+
         xLbgMv++Lvt3CIopcyzE0yAdEhyE0gCCIgaSZUssxvMDZ79RjNCD3TCtaudjjIKI91LW
         95B0T5VLfSRQNHeAexoEuwDtuBQQtXlVJF3DAsk3/QMbmSYdIn39jymdPyXxb0SJ+EzF
         H1BatyLwQf7zkMUDOuemwCiJypSK6cBgpR3adBFgtHpqv30BdNxToJ9EjAQQfid4chCB
         jC4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770675411; x=1771280211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=;
        b=iyGs+r5YPOekIxsg/MXop8B+RDgHpcJ4gaA9rHwR9+YMdU2AcsKea9QyyqdV8YhHxN
         FIdXF/wgLst3uWfasgCASrC4EdIVF+ZDh6E/SknuuPprYJxUJhdJtv+uLioo45DVrd8W
         FwzO5JTgVbAb33I/5ico2hPYi/L+Ld8vgLCERMQkHfdo7XC1dm5kdMcyLq2AFlTNrBtj
         ce52Ey1Nn2Uz4YGobJWwdQFfNmgJZLUxMTJlQtAB/60Gy6k1sF+vXlxh460NDzLiEhEX
         NtgGkgtaITpwn86xeW8XFX5z17SnzUkKHAYqCAx02FmqvlzdbkGmHaKHoN2tEOUdvuW2
         8AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770675411; x=1771280211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=;
        b=oEHcOSG5vHzbWvq+S6r5mvzolzGz8Me8KIQAwwOAOFKET4PHkmmw5JmqdM3RKusrw9
         BvmuxgqGwm6bI2MAJwWYFAW6RTHthC0timpuwKJTnN0/JbsHiOiy/Iay1uaHRVsEiojP
         RMnGuqrRp75HIljviidg9AGuNMp2Bwh9HvEFUqrTyiKCWp5ZkxRm6bGtqWlhDQlbXeBc
         AWHuji/FLiZ5Q8nSJ7YVoOuewrtUoZpnc/NYk6H6daTzXCX2xp/hCdIYLdKvDSbpfEff
         YHLxWFpBFfDN7rPbIL5/DavThhzA6gEqc8u8e9i6kh645UcxuxvIPwBiXL72QBJzHVRH
         jEYA==
X-Forwarded-Encrypted: i=1; AJvYcCXBo7ZoycKk5pAfFMQYt8n4XKedgbTSrfI90JHMlT+Y+h3fy7wIyO68kRv1fM6l3y1+pnN1JwalTKUbNzbE4bSX@lists.infradead.org
X-Gm-Message-State: AOJu0YwP+jKJasikkzGxXmjDLb/z+LaTFOjDKXyTkwHJ9ZpI0HwYWtUs
	LY9AL1WKwvZhKAqTauhzjLi4XVw6o0sH4E/AFsHc/vY7q0ZLmWKAsFg/Zhh7BQZVfyGVGZHDNzS
	YzvnltJ1snwhTiuS57J7WFF5bws5UbZg=
X-Gm-Gg: AZuq6aIP8zBiaVu9QtSU4qKbpSxgFU+wA/2SV8DSvBRcMMfSKG8bZ2pScbcZPY7ePie
	g6PWACEKARMhI9qB2jxlqJ4hN6HjsKHxBSRzmG1xqInCUjIuRbBo/RD/1kH5PC0KaWUO7/vWIws
	rLo9TaOus+ypEk0hq/6RpwcrRlM/NO6OCGwySnk0GJsLXseljkwj5qTjCf8y82Be6PzkDV6AnCk
	g96q3r+1qNClXY6DIZCyagIan1OXanVSJD3n2lVoIPhR3sbvuvre2F+0dpP9m57af8MPZSH/EV3
	82ozX3p6GIRuMMb1EYTpEMuG/1Ng
X-Received: by 2002:a17:903:1b24:b0:2a9:62ce:1c12 with SMTP id
 d9443c01a7336-2a962ce2047mr97146675ad.53.1770675411337; Mon, 09 Feb 2026
 14:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com> <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:16:40 +0100
X-Gm-Features: AZwV_QhquR0hlfJ-1NnFo_9al9F-KxCRrVsi-UMsb1efCpkm7v4Q1O8T8O58qzI
Message-ID: <CAFBinCBMQNrFdAdhoxPCfJi-SU1kdhovmaJ6K9WwEQuiMfhQ-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: amlogic: add A311Y3 support
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_141652_317223_3D3C2B9E 
X-CRM114-Status: UNSURE (   8.71  )
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

On Thu, Feb 5, 2026 at 7:04=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add bindings for the Amlogic BY401 board, using A311Y3 Soc from
> Amlogic A9 family chip.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

