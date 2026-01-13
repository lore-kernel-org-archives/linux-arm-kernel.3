Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4198ED29DE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBgh3Jpx9q0vMwoLAMjf7VGH77cU87wpAE8E4CagitA=; b=3NGjmipd9GoGAdsyrryhzIdii9
	X2/rDPpKzrUg40z1KEmY048cL2ScMswWauD2wyqoWosGS9Mk1JDfe55YiCVooEcTSDevgplxP2kWK
	+JhRtlc30D2eR/9KMhZRqBRL6HrkKSgoq0IgmfSP9BP9smra+4ic8Wi10a0jO04uEvDx8SPrE6K84
	bpU98EA7vCYHnCOyXfd/Cx2DUrG/iwFkbAQafX/a66Yj/EotCg43k4ZcCPs4RRn1PO5v1FRGIn7vg
	uB6YnICg3T9bXDMgHHG1zEaodmJIlgUO4ye5kj90eNQGClzeCc+smOtnCyH4HYo13LY+DcijVhtS+
	Itwl88dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaG6-00000006n8n-45m0;
	Tue, 13 Jan 2026 09:00:17 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaG4-00000006n8S-2QPv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:00:13 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-11beb0a7bd6so4466086c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768294811; x=1768899611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBgh3Jpx9q0vMwoLAMjf7VGH77cU87wpAE8E4CagitA=;
        b=dIa222h/2e0x7jeU7lVCqK+cR+i+BQWzVl3H6mD2lmutoBOkqb2pa+Juw7O8QoAc88
         mSNtntY0+LP1Z2KaHdlIuZ/0P7NNkbYBtcZ5lHGDHMQJyFf/lo2/ZrqXAcJZ2/3wiJpV
         TyBuSCO0o8zRFNxm77jv9wD0Ct9XDxf1VPpLBAf/bGF9012kKbi2Xs+XwLsv5iByhc5s
         1xURKwdutK639izKQzeOki57YKHIlwNruUiyOmuGkArm/eHJYoWk8zQBxZO0gRLB9mPy
         VxRpwZqoJdFZGY1g4lBlKWQ4gqbIex0HOrEmh4iFjf/bNrWLY45NgGsAYimZFiiPenFS
         p1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294811; x=1768899611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dBgh3Jpx9q0vMwoLAMjf7VGH77cU87wpAE8E4CagitA=;
        b=FVG+vljqA/CF5lLAh08v86edo5Wtpkk8UpzEIJbfiDR1/NvVGgl13+YwBMIsn6qgVo
         dj1vFLqJ7ta+frjEv9E9U8u18g1MchoZviH3j6e4hz4/prmigJaqtU8lO9r7VGxZXc5W
         Zn3Hsr2nrliPApSlNC7wq2nRSxUEXUjJrFa1bI+08iwNY7xREHojCCY4mi7aAy9Ar3oq
         FAvErSV/ZmASRVyJ/jjBucX+G/J0r1WA+HwSa7kIJwoi74oaZGz4oc42umUiU1f7ovoL
         RvCTILbWySU0ysqiuDEJahQSfY1FIrOUuoIUAxIRBVC14CrPqmp224f7xHuxe7dDxOQl
         awUg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8KrNEjq0OmuN3OihzoYd+lHBgc97Ki9SsSfWgFIUjCQnlpz+RMtOLkSZIFiBgRa+J6jZjsXrs4COjn1rddCd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3tWmYVO9AsUK3d9MhS3vWyaYUbRB0hj6Ef2wEEUEKItoLQPPM
	XwfmUMD3dcZrOwvNXHjidqIuBHzNaor3+coI3D2dEeCd4aBnJcSyeZUKGtn+ZcRnj05qFPLK0yT
	1pnOjSOfdfsaNI4EJm8ChLdvG6/QiZaA=
X-Gm-Gg: AY/fxX59AVUzXtSeAjXLjRiqwqUnVWEe6wi9NCYyze6upnNUDCq/HVW8/VbJ//tGU87
	bgymfo6sue2gaxG302XYI4xOQ9xci+Q6vMjxiJLHaDoqBb0c6p0/20FkVLCMInyAQ62klS3xUcI
	z0pnksO6d8RGgFO42M12rb4vuPFrLWQyT+i3T1sDoq3f6sUMqUaTgQJwVd5NTgqX+bAWaBpy61Z
	D7V+txskcSc/arx0/9jRoQeilxlN2AdjwW5apH1LSMV7JwCyq9s5OXB4i3gd36WuHstcA9h9Sbi
	1kJn6ewSpuGVPaw6yUeb2+7hJvK0cE7D1NJwcbmZ4dwSHleAlUR8Bv187/uvmAiJvJ+kLhUlZp6
	cJ3B2zgbtvw==
X-Received: by 2002:a05:7022:419b:b0:11f:46b4:449f with SMTP id
 a92af1059eb24-1232b6425f5mr2643006c88.24.1768294810986; Tue, 13 Jan 2026
 01:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-7-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-7-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:02:38 +0200
X-Gm-Features: AZwV_QiS-vbZEBI1B5-7VHnaj5-2xQU7eh6G0NpgJs-gint5WBMU_wp9zkj0OrU
Message-ID: <CAEnQRZDODr2a3fvobXM7RWN_yo1mu5W+h6+tpbLho3QL=cQDuQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: imx952-evk: Enable wdog3
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010012_639300_BB0C9229 
X-CRM114-Status: UNSURE (   7.27  )
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

On Sun, Jan 11, 2026 at 2:45=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable wdog3 to allow System manager reset Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

