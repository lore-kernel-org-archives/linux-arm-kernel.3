Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323C2107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=; b=MGB9VvZJ2AGI/N4Ddxfv2cB/qM
	tfYkjitKyF42VQ4UFgzpp2PTIPQ3lKMRn0dY+f0ME/yWsfmCNTj+S9rIvXh6P5m0E0FHhw9lG9tah
	w85g2Gwr8ano7JA6ePdHf3RYqD2I80d+a+lu+wU4JgEYbEm5HiTQWjIVHIIfDyKRblgtwFahgeLPH
	C6gk533aC1QQl/BC6rtMfobQMlsqTNCdTnNtg7QA3d2FGktsEl/pg6GP+59HVgNouEDA/OWYE/VgG
	iACgc/Dm9enC2VN0AnF35LXZNIujyobKWQPlSePj8tDzcvGmrxP7NX7qzp9tQEvpx01AM+dAAaShK
	9QT+q9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Ze-00000000fhT-2shl;
	Fri, 13 Mar 2026 16:41:18 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Zc-00000000ffU-0xrZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:41:17 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38704f70ea3so20283891fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773420074; cv=none;
        d=google.com; s=arc-20240605;
        b=gUgDyjq0HhhaT3vqgJjgHMayZqxUonQOF7jxMEnY2RuDmn52AjtU2gB5RRxHMKHWf3
         7D+Yvho4DTCDDqpG/pXPFXvAB7mezV1kdWdCiwgBsZCh8CPLmZhTOY7mJF/Ql9B4f0/x
         6F8iwJuG2YQtOD/Q734lBCSEZYamxKcToqIXF15OWDpnJz8BiNPeCAphafJCp3+GAETQ
         x0rXiCzscesBbXGKVtnAQgNWYROFUgqmiFN+0y/GXblk7gxP9eZ1jMTuiDpxq4ixOjPU
         VuWk80pz3zvSIaF2uwgrvP0KOC1xeHByPmVq5vXAipBeZWOiLmqefYaq4YM4lPukfaxy
         QoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
        fh=lJhdSL7UI0qLs2QEuwJR5dh7jV1WOR/BhObrX9NURKg=;
        b=GvSa0KLQDRFQOq80/LowAwCMIM2FkX1H/GAcxfdCxKytvc6nV1w/1FfgcnT70IKqKU
         Hip1R/5yJFWgOImLBPeCrhkJ5JOUgQRphZWJ8CJHB0gUNCEgrvvyzM8QKeNUG2JKO1YF
         5lFx8iwFR2JDYk2ZSVmsHfGWpGdZ5TYq8H48Ubq233QkmqOaq0Bg757safGrdjuPyFCx
         //p9nj+aBB100hTWYcS3Cs3Wz7ba3SZSsraeP9FPN6dZlorgoTB4MHO2zWJi1RUIed1r
         oJTejGELbhhKEah6GyDk5RSoPU+lc3sjC3GajdrT1/C5FirJUzEqVNBp6mIazyWcAFtl
         zplQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420074; x=1774024874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
        b=m8v9NNqObQg0gXXzcCNJwOfL0UqHmplGfZTh42dfFJDnpsin+ezMRIMiPL5214hSHr
         N6rYUFbTidw2wN3OBADf3sOw0kJGRHnF6WvRXsv/wD/TRggXqKHkkL2GfkOR+XkEClu9
         ZRG+D+i1a4J7wWUdVW7DIPY9F/DLsilYPmsMfk+Z7U1LqBBwLphEBXL6Vy5jiniRaBoH
         SFN2Ccdbm0eAwSH3Tn0mUMx0Ty449gxrTY/9e9vGNZkVZAorS2xnAeRvP1C9BRUntuc1
         oDc035Qz2bXub3VlvF22qQy2fhl0s3RSwertLUXPbPjHoUbagc21kUx0z3lYYsPTWtAa
         8ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420074; x=1774024874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ebijAavojuxgzNpkroUxDtvAf3sJTdP3uqS+Pqvjz4=;
        b=qdIUxTyZezAjkXv24MXpJ1/hBqFny5GTACivitv6NIFeXhNMCV3sVaXXqn8hOvABcE
         xztRLssXGCWD+E3ecVUL2+jtvvYXcQ0JYCxDraW7KiPcry7jH1Sr+48Rho1hdj0Kb6mc
         xMH+sZwhclxGJ9P0vht1KNWj2KsOsm+7aeEtFBdq6M+msKu5CjvVfnvwk8xVaqw7miJw
         tOYPFfw61M0HVuhEKFxgWFmt6f2UInRfVIMi2+cXLX1eCPgzDLXqzhhTuIDutl7MD3z7
         pF3o/Voy9WWJZIDDwlaLZRCpfuWCyp6U1/ahJ9USbmibjFL7RFrop6UZppkGCm+eXV5N
         oxPA==
X-Forwarded-Encrypted: i=1; AJvYcCXLekfUJwPF8LSrec624ks8JEpz19PBMwh4dTE5ZylIwvzf+aKcoVKDRadsVOhbXyKelhDrM+y9vrM35FCYtcQn@lists.infradead.org
X-Gm-Message-State: AOJu0YwogjOHjDp94txwXvREzD2fuU6D8Djb2veGSoP0yA9CCeBFvRak
	3swKXSC/6AaImakMLuTQyRKgrALNaoF9/tKhrZ5RGHjipnlSyl+9eZZVInrR69P5/WuMifTcOYj
	12bs9++mgczjvyDlxJ7dhUeRzfWbfdpY=
X-Gm-Gg: ATEYQzzExAKMKYzd3OYYL6LupkAIh9Lq23ZhgqYmLCUmt5QJ9qmsfaF3DLZ6EpKweY+
	pEjNmX5MDngGYaV4YcbNQQKfK2F5nT1Sp9EtZ1xOrGGsZUY1zRAG6M0jUvMN8o+Q8oqiEm/oZ1n
	HduqKJXhH5pDX0lkwH4TbXonuyW2SxQ+3H3Tp7RGQ2bUMj3zUWeNMomhfHXukAuAQ5u2lYN6cDt
	GZZLW5h9Yy04IL24eIRX81NrN9TckXCe+lcX5xFBFlxytOlUeVHN7mc1MqVlUU1zmwLSwzHWPqW
	IPyX5VyommC7iV+3p0jot/iTQ00eLi3/s4pvButpFJPKox7ayz5Dg5MIUgmKKG6u3EVq8ydj+kW
	G5+hudwE=
X-Received: by 2002:a05:651c:411a:b0:38a:6acc:85f with SMTP id
 38308e7fff4ca-38a8983b635mr8205961fa.36.1773420073322; Fri, 13 Mar 2026
 09:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772898346.git.stefano.radaelli21@gmail.com> <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
In-Reply-To: <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Mar 2026 13:41:02 -0300
X-Gm-Features: AaiRm53S_d12Zw5UGPcEotGK3352SUR9b8Vel1YzgYrE0c2WVa0HFOKlHx3vKPQ
Message-ID: <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094116_289709_7E323445 
X-CRM114-Status: GOOD (  12.56  )
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

On Sat, Mar 7, 2026 at 12:55=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>

One From line is enough.

>
> The VAR-SOM-MX8MM currently integrates the NXP IW61x wireless module,
> providing WiFi over SDIO and Bluetooth over UART.
>
> Move the wireless module configuration out of the base
> imx8mm-var-som.dtsi and provide dedicated variant includes.
> The IW61x configuration is moved to imx8mm-var-som-wifi-bt-iw61x.dtsi
> and used by the Symphony evaluation board device tree.
>
> A separate imx8mm-var-som-wifi-brcm-legacy.dtsi include is added to keep
> the configuration for the legacy Broadcom SDIO WiFi module used on
> earlier SOM revisions.
> The Broadcom-based SOM revision is no longer in production, but the
> configuration is kept separately to preserve compatibility with existing
> boards.

 imx8mm-var-som-wifi-brcm-legacy.dtsi is not included anywhere, right?

