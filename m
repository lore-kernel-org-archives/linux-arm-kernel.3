Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F100AFD9E14
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=; b=oK0X4tdToM0bdX2csSkOczbUo4
	VcKzPXkBmnpj4mx7cf2QeOBEZr5fv1RQczU+fhZm1adI1+zHjF3UDWsv5IiLkh9TpQxm5w2TR1cif
	TYFz0JvNww27LFLUz4bTlu27ECmvOXJyueAEXXFnBAUUXwE5XAirVTpQK2Op0XPaoby4PW4dibpCy
	gCb4ZSKuMUN8ENYE4mxLEfwyhSpAwP72csnx1W3y1MONM29g0z2P5gZHjloypMtyBRf5b2SAXlumj
	6awncXpd2mzRC/Srz3rISGAPENWaB3CEFVEJ0dTD4UJ7op1xjeMdZucSmlGM71irZgRV2F4tAOBZx
	ggJxrqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviuL-00000007FBT-12Pr;
	Thu, 26 Feb 2026 21:28:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviuG-00000007FAn-1y0d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:28:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ad9f316d68so6444925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141303; cv=none;
        d=google.com; s=arc-20240605;
        b=Kfn4t7im4jFDRNYX/051dGp8bvixs8gMo2AhP70ImcyG6aZBS5MbWHNJxLFz0E6EMX
         hVkOr6rtsQ+ePnLFwRN6kzOftDJOqJos2w3OFrsLvhz853XGLyHxCuJTeVHwLnjTnGdO
         ujPdkeKKWV0Civ/zML4Hhv1rP/hWbfdM5f+aJ8mX7lyPEKxA0LIPuZJEHsUkH01YI3MS
         RGNnvGhiTyGriyPPnlx3/hfpgCbptKuUQWlYFrncr7Qpm/Y51IqJbchwgscMlsdLeHKF
         nr11cGkdZGnV+d2Ee1Gz5G/xvfZc6l9sElqSN8dsqUSY0BNxlk3m782grOXCnpKwdj1j
         NPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=;
        fh=J0mWEgzdEPil0mWJAYebK92eX4AyowQdcQ8GlcLyopE=;
        b=km3Pf9/anD8ErJzpQRCB2P1BSJKhh1y84ysGrr0RrEJhvTa5Io8uD9YIjNwDctGn7D
         0cYkaQl1fAdAbNO32l3O8ayizST8iYNDFx2nBbLj6pqgjWIIed+wqW35yXPjqqPkYIQz
         6A0j3rI591v7I8YF3vhdo6uUqsUN6yYAadKGDfRRGaz7ZKmceLymRgOIxpXMsHDvM9An
         WNBX6gtJLvJ90y+T24abVDfE0FC6/Fg+z+ffTWIrusYm6XCQCDHjzpsbhu2fjod5lLhG
         Zp+RGbbHL930BVENXIDt25mv+VSeHHE7Ff5WHWAdrIJTlkacJBc1/I//NhkwKLxmBtvK
         9+BQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141303; x=1772746103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=;
        b=GDEmP4tDHNI0AFbVPdfwbhtRPPXcQSvSYwUUUCNe2pQUumccmvVV88+ErpTr+x9jS9
         b7AqWOmZNWUBUj0xY/B2oJD2yS+dRvfE2xKFOodq/eRck52LPwxFjWUJO5kmCLH5ZYtQ
         WuXWfYIze1cOZQI5jjrKeU64fnsEENZ6ewn5NwSweYtLSu+tsj3bqjq32o1Ct0N+fUlg
         l0xf9DDIKJMsPUXehVbDmePcyZtjfNeF3/QhwF1G/U61iwQ7Op4QP3xow9VSN17wZm/e
         MHIdHUBntcrcKPFNHgjNDjd61B/5Jjt2HL5UGnAP94bD3r0A4ne9++hnyR/ubVsUBv3l
         NiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141303; x=1772746103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=isFrMkzZQLKE5l+jfwho3bY9wdKvh5U0o6XjpyV+yF8=;
        b=NjXDN/N9rLi3O+SERPXUAoj/9AROHjuev4noW3f/LohM7RBYiHNfsPC7aHWZ47HVu0
         4KEG3DXCSUHZj7iNugoXS1aTVYZouxqFaW3DSC5XiFkuX5dAzgb1y51qwEfNSkTuVn9C
         xnqvdiiFDgW14F+eh8P0okbudlxxSEvNW43JBqDAbzJrEoSCSjEJqUJ0Z6C21l+w5zKT
         aGLvkQVZFasmBaF88zX+vGvROuAslZ32cf84M03YKuXUxO+tjuHelrWfccD7kTRbSpCZ
         O7vshlZ9SAmNqgh0t4js6zpwoUu52QBpm6fM3wUv6WqQoE+9MQ0TmB4THmOKvWje+TOU
         g7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz6UAq5Icx7D5HXkwktjeBNgaSHthsfqPhWuKq47Y4Mz8OyIbby2dMjlgQICcuiXI0b1Q+RAlKxsfY5tPF2FDx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh36lUj2fg/rmnkyBrt/COp7k4eN5GZ3lls3UeNl+zg9dDuEMj
	fEqrWiO1m1HuiziglrQ8CAmS1IcoF64t3OYu8K9VtybQ6J0K1KsNlOWxX5COPk0+n6hDAWMrdvS
	AVvC9Dp+nqCRwv4EcDJ4IW7YS6lc6SEA=
X-Gm-Gg: ATEYQzxx/7NZVzUpQy686bZ7pDqNqXXD3Q3CrzBO5vJJROEqs5OkFRzSSt7smIYotR/
	r1qrbDxreElRNErQu7rUOtz4s+YH6TPcbOdYUHZMA/AkxOW08em5sxZIq4gVITlz/nGvSByezSZ
	IPAQAgKNH6Nb36HGFYjmREBMODQ+kzltWfDThYrxKC9wkdJuKJI3r31+SbcLeq5AYlcMPVOYYao
	iWwk7JHm6S9KqK4fJX22zxXIgzDridm+/+komMQmg0jUscpUPmYOrbPCPLUnAewyBlaItZatAuG
	vr53FUfC/lfx7HtCnk/Z/s9TRXLHMfhFaDLhDrrO
X-Received: by 2002:a17:902:ea11:b0:295:6d30:e25f with SMTP id
 d9443c01a7336-2ae2e4da14fmr3619915ad.53.1772141303480; Thu, 26 Feb 2026
 13:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-3-nick@khadas.com>
In-Reply-To: <20260123022258.136448-3-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:28:12 +0100
X-Gm-Features: AaiRm53fDnetE2FB5uKh_jYrb87ycfZGsGZSe-1f1i-ud__7mbll8f8_BcLdpWg
Message-ID: <CAFBinCB4R6nui+6uwcQAzPFyqA38rZGEvYwGgPHKbjysQyWLMw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable bluetooth
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132824_498650_4481243D 
X-CRM114-Status: GOOD (  10.85  )
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
> The Khadas VIM1S board uses the Ampak AP6256 Wi-Fi/Bluetooth module.
> The Bluetooth controller is connected via UART_A and requires the
> external 32k clock (LPO).
>
> Enable the UART_A node and add the bluetooth child node to support it.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

You can keep my Reviewed-by when updating this patch to include the
pinctrl properties.

