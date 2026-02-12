Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26D8EB48EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=; b=IOGp97IyXlt12vHNt87IOJRQSv
	31WC+CBP+sP5pODgSTeTT/4QJGTrN3q+xODl3R6aSIKYuue1T4giLmkDbNg8Ktlvj6WoGmJl2hwpG
	5KB+i9wUqhxp8nyxjAoFJeHnO/6Any9D+FhDTbt2sJim8fxFrK1TuHy3x0ZeqPhqk64EL3aBQk7Yw
	giJCWBTmrFdCjuU1X3HdDdb+gwq9cqR4C9y4MSg1OuGZiqV8qlSOcIOFZYjLx1QRdSY285rHc0liH
	oNXXXjR0+vPHZetgDIOUyS/41KZz6j+gU60wLlf9o/HUjH5J/BAXxJ/o4NvO+yWkvOe36DtSB+aVY
	Dhc9MQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSoj-00000001ot8-1NEz;
	Thu, 12 Feb 2026 09:16:57 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSoh-00000001osp-0JYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:16:56 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1271195d2a7so7583246c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770887814; cv=none;
        d=google.com; s=arc-20240605;
        b=drQtd/akZ/5ypP9viMp1RUmfDOxioaZgMiy2m+5qx7CRW282tF5qqsOLbRXJWkMkHB
         PqjaV+aYCBckbeeuTEzCPhYBmRXkIPLj/7y5Oz1lPhlCoJPK44VwPpezNb7aboFJUzBz
         0j8Qj6IePOsC/9RgIanACbzN0pXlGAZC9RhgE4nNu8nGSGaGsWSaOv3LPtRqNF+chg84
         uqgtSTZy50zE+l1PtClSrKcMhwwRHqxKN1z+IhUU7kX8BQOmgdHMuNi7lGfb2l9JZdqa
         zIkjQICBg0JYhu5gphxouN3cOT5V/BNqEqZ2w5u6UZOoMWdygGv70vYn3Tpry05TogVz
         VxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
        fh=9VT2pQQ6hjTfj48LM+wGQyV5XYlCt9gM42kMG7Gg3A0=;
        b=UmFe4lc8KP1Hw6r+WqqfDstV5wQsIaxm7ajVrYRrF2d0XD0TzTB/2S3mgbSCZUsgr2
         5DZHYd4823rg2jWNHka3DEEsuhzyXizM9uveeghoMcP9HlQ8WTNGvfmc3CEc+i0BLGe8
         rOY5NHR28cRn5NbHeIuw3hyDH93t2VLJmKT+U5GC97F/Aye8rQSB1yjxNGRVzH9Y6+KN
         iz5+kmJs1eakR3AMgWA0jX3SO+RWrBC4UzRCdnSIktKb5opjkIX9mGl6y3JhifOdIk0r
         /dm3u0gcO6YyjcMm1BB75FA5verti9t+Q54NXUPGmUs7rrrhiYSV3AAScqvUko3z3zfl
         HL0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770887814; x=1771492614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
        b=MnQpdPZgctmD/HpximxfTO1xS2WuhMTRCMzppb4+JM4c4Q3ybylcWWJ6jQZisZ1vkI
         IyWcjUKNawb1vIwbG8+DsUD+it5DA4DEwjfB2Wc2ZUb0j+4eqJFnE5G2QxR01Ii+86he
         JQkUzgqyIchjVytMSD1VH0VMkMoqMj+NSOng0SeKfVk0dzb6Y6EbQq34inVCRgk1dy3X
         2747AlZp+UVE4GsrYv48TDQEtEFRysjd0X4QKj527P9DnjX6xdpAISqc8t0pwokzjNho
         8FRyUZU2m66MLv2GhEZPcOJggMA2PvD2JqvNIxOzMYoPQrraPG+hVNKmcB35oiewW9Nj
         ry3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887814; x=1771492614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
        b=ap3ZnmqE3EUWtZq+r+3TCRFJ4ZoKTKABiPlcKqH12c+VGfg3BLSUnTDWAaSVdGgifo
         PBIFLEF/yYWQ0ov6YirayeWJNDcEgWo2mtMON9BaleL06V9AC3/plDRmdVOc85otmD8K
         lJ5eweMPhvWeIawOMdHQO5obLgMx9dk5c1FylT7LqHFIDuc0X13kmKvYKOgS/ZFtyhfd
         FzyGmR1EyLoVjg9zmw5fdNXFby3z82Iwx7lcb30AdXaws6sUaM6ueIP98ijdqCcPMlGS
         M4sFDD20/AfCr0wUIHcTXTJfAldfsrEoe356YCJjyezsBMEbIn/l3cnojgmhreRIxzEG
         AczA==
X-Forwarded-Encrypted: i=1; AJvYcCVyLzEJnaCwzgEhXMqnzOQhwMOCnOeLlZggAFYkZtP/7ZnodLnIffu03WFOl1kF1etuCC779FzUzf/59oqfMNDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxEeD9K2qZiJ656UqhMQKMg3Bwx+qs95mXTVrKeuLoCZyW1GpBz
	hMC3QbBR7AXdLdd5XbRl36ehKU3bogsq07oxexS4LooqjfWMh5L4r/FLejJ4SU4l5pjnP58P1zH
	m5GyUYzaDHg3TtwPDL4bbfcCbNjxgcVo=
X-Gm-Gg: AZuq6aL/o8l8n6THVoY1ULjll9h0oi92z4P1oZ8HPuFBpanGA4Pq0Ugd0AhPwDHm6nk
	GB18aDuuEbWCr2KofiWzKizUPtXle8G+AhqugTDGXfZNOuUU2e8EMhZ9o1zVB8Ma5r2Qp8MT+yR
	jiTfLkIcqL59cfLp1z8d6T7ysxv/cGUBGaaU7yj7SGGj/k9oLb5tRhLIqfMqKm7/xi/ROhoULBy
	vq54FvmrSiAZVcBvFpx6lVZSmwPAar67LZYJvhj+NJfWJT/+2oYXXfhNUgyYYnRzUD+IT1fpUYY
	qSd2OWMhksYCrjbcCSynXYbzpwSeaXRehVVd1rhZP+mAR1Z2bSEKfpJZ4tJHHPP3Qo1pN5PnpXx
	dRbeRxy4VZB1H1sG58whHH62MLenTIcyP
X-Received: by 2002:a05:7022:78d:b0:123:3bba:fc4c with SMTP id
 a92af1059eb24-1272f78ad4cmr962785c88.38.1770887814104; Thu, 12 Feb 2026
 01:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20260211221529.3745404-1-Frank.Li@nxp.com>
In-Reply-To: <20260211221529.3745404-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 11:19:36 +0200
X-Gm-Features: AZwV_QhNdMRVd7V9qLZDvSol0fqxji4If6Iws3_V_J6-ZGNkbg2vcJ-9A6hq2Wg
Message-ID: <CAEnQRZBXrrhn0ZnuyGZ5sQYUCmkS0e_AU19L_edKxjqqBgvy6Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: add compatible string fsl,imx25-aips
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_011655_143201_03DED085 
X-CRM114-Status: UNSURE (   8.20  )
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

On Thu, Feb 12, 2026 at 12:15=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string fsl,imx25-aips to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: =
/soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatib=
le: ['fsl,imx25-aips']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

