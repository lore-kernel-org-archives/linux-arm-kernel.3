Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A74C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=; b=ySkCc/suyBxQjf00FpdM9mP0+5
	Q4q3uH0aYxqSCPo7JPdubBfCt5C6Fd9lXtHg78a/ZVQKRdmuKsynigw8rPQ5eJeAZrNcm1heOSswZ
	dqqTO/GulgM04x3JvdaAcliEp296UU/7WtxnYDMZItFMgm0DVmALqnX2Ty8JPYMH8I7WS+RCJdRbe
	d8STerR8sVfhmjNhFcKgvJ+bMs44wBf6lilXOr7bYkBNtQE9hvonQ1Iww6QhchRznlre9EWkgNm/a
	mj6PsMl9fhC7Cq+lalJQyHSZ5zHDE/71pj18WtkvwllgZURNSCIPtzMBP8WEDWbno6n1FE+AQXuF+
	92+uRANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPIY-0000000BnFB-4196;
	Mon, 10 Aug 2026 12:40:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPIV-0000000BnDY-0aHH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:40:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69f4acf7047so267109a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 05:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786365605; cv=none;
        d=google.com; s=arc-20260327;
        b=mbrujiy5Ud34QXgF8DeDFiO0YUcVPAQXSpgI2uuDDQ3RVnJkAiXDbPLtkzGBI82P2U
         HdMk5JnNF8lLBXx79edpXLiuHezK9+sn6IXXFFm/IITQpN/fT3t7Vq7MqnRX78le/ytx
         HYHhioR6KNhMJ3lfrPUxvAuLBSN9wtQOQqwGNJCc+HCnRMWyDbzs25Un+H8ZfTDz6ool
         Ruq6z/Pd/XKPEmCxCER9hcTA2AcGLOXt0DNR4Fenmxp0763uFXjkST1eSIcbCAklhugX
         UFSqxI0L2tSYI1GiDPxQOtRusil5/bLFuoGOWIxI36IUCwEAUPyYUhn7B2bnS4serjiF
         5Xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
        fh=kDdd7onj+ZA1a32Ant1yXV0w3bD5N5XG2uEleH8BYZM=;
        b=oznwJ/wTYCCXoJy0VzErjBrWWuS3MW7wXVCH5Fvz0mUBeCApwVmfYPUHw5428M4Zyb
         n2RIdPTI8E0xxHuERXFtQh4jVAf/19Cktcb+d9fZMc24R23AbEdN9m8b92sB2RKH5oXv
         yZfeG5oVjCDyMdKKtvHi3PdSP8jZSkkO7JGio3YPpnw1HW3FOaXl98I9LwUtjoQxv++e
         h8xv0Wyvp8wl7b8srtrWlPnV1HhLDg4bUGBB7wZPIvO+F+bXqPzm0IIJspOV0RvjNd8+
         6ayOBP60Q6u/dxGNrfpFFONODGPsxFjd+ukV8xywqvKvueNst/9XCnwPqA/XlSAwUenf
         H08w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786365605; x=1786970405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
        b=PR5nFMryVpJbDZV8Drw+9LWFh0nMklw469A+ju5qtocKcjhJlj7vGxFArI6Fw4R/d6
         FQH2Lyx5GO+iLjT2r6rLLw1LB3kQfgqOBDSZhK4gVfBCXoXgdEfFJJ+eNshUOeIMRaeP
         nIMTz92CyzDy7JQPfEc9A8A1/t71+yyJL+GAl50ZYfe8eSYifi3S61+yIQDdf3LrWKJk
         C1/9cQXhYTRCdlXGph/oC7SLIhsbx+oDpi/Xeou9utf+96jJCwHwgG9SeAYy1B10WtOA
         08fGbYN8Yqfh83w3Nu8w3TWPcv0VFy7iK35exa2gQp8PqxviMb9+Pe5Lk+/blcLLH9Qf
         KIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365605; x=1786970405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzTjFhFkoXBLwd3NrSqY+4yLtTn3dkc2guIu8OqfuBY=;
        b=tGlUWyka6lOR5YZ77TvV8qqqTK/ozc3bhbfLtTz45ms7DTOPuaQD2AaQ/kHXyOXBzJ
         rYKEXJPnerceqq2FUoD6sBSfD32RZl9ikQiFwMTKlGnuXwItiqnKXeNqpDU+7VNJ/eES
         LhCMR2OpNNRvxP76BLI7fDuEsLydSxhxtJEmhCbHzD0JZq7MMkE8s0JupTth9dPIwSVw
         W8s1q8iOLpbS9FoVWjbIx74hZgVGoLPoMoah8kmqkZ9CHEtFHEYrTYCD/2ge/nAEQtOe
         hkEazvFN7AHURFHG05/3LS1S3lR9xjx/z1FHEA2dKAyZGhEsekyn+AZzvrMLgaAx5yd4
         HaGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkVb2tMmdHi8//OVH0iURc8/uXI46VBkRnxeeDuGWX0fd+Gc5LGqSLtpg46EqW5cPg6SLpOzEDRllXjLu6JvEh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk1YkTxFSj43xB5Au2zcqI87VNrv5N5POSOGehQWaGJLTJUjeX
	R0F2yeMYkWwoCXkPHz0FeNvd4cNmz9ZcjmIrpwY3m0tnr6rnNiE4s6iy4iClwJhoObkM8k/7tri
	BQkOhKVywU3QS5d4RQO5B/2nmrbDZa4U=
X-Gm-Gg: AR+sD13ZUJOYb3CFTSgGdw2QGNSInZidDdhTDgg2u6mTkvkkXBUq9sLBph1bUZcR9//
	ew9I2XvkOKQlHBkNM3yFL9Go2aAxAbO09gbsBDxkBwdYM7Q5sNKrICW24/9WE9cmdlGhoiCzqEU
	POj9PV7SAjUw8NDka5rVoOBOj4JHX/kr3HWhQIoYwxH9Yl3VYDsNJtdT88IihEHnGOnBCrOyD9u
	/Z1qU40IjXuBpOHf+27rjFXvPIHpuWYSSft0mN8wZrP1/yA4dxPmGUfYnPBHP2nd70B83rp2rWd
	kyY7rZTanijKw0+un4zrwjuLmdUszuQeA0FcpXuPaeLhwcfNQLNxoZ+5FuQEkPgr1FlpgoqquIh
	Fow==
X-Received: by 2002:a05:6402:2351:b0:6a1:fd14:8829 with SMTP id
 4fb4d7f45d1cf-6a1fd1489dfmr3529309a12.4.1786365602791; Mon, 10 Aug 2026
 05:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com> <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
 <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com> <00d6ee9d-0ef1-41d4-8cd7-affb320b84f4@collabora.com>
In-Reply-To: <00d6ee9d-0ef1-41d4-8cd7-affb320b84f4@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 10 Aug 2026 20:39:50 +0800
X-Gm-Features: AUfX_mwg7RyitAzo5nWhArTwTiYbA1EMZOXHMkTdNy0X60zc4wq-eQxbT6UdjPw
Message-ID: <CAPwA33KHoH6AM7HLMQSBMwy2-TS2A_J=QyLwcg-S=t2yQ+_78w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_054007_199055_83C28A00 
X-CRM114-Status: UNSURE (   7.18  )
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

Michael Riesch <michael.riesch@collabora.com>=E6=96=BC 2026=E5=B9=B48=E6=9C=
=888=E6=97=A5=E9=80=B1=E5=85=AD=EF=BC=8C07:00=E5=AF=AB=E9=81=93=EF=BC=9A
> [...]
> OK, makes sense. Looking forward to v3!

Thanks for confirming the shared block and for chasing the GRF
question with Rockchip - much appreciated.

v3 is out:
https://lore.kernel.org/r/20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com

The shared-block handling follows your suggestion - one struct phy
per PHY with a use-counted common block; the changelog there covers
the details, including why the helpers ended up as get()/put() and
why the GRF mode selects stay untouched for now.

Thanks,
Jason

