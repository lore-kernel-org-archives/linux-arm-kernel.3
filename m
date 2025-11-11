Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3FACCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiyCVpW74AzfmSw2woljowbltxeP4f6oP4DP84zte4E=; b=iqVACHjeRhcBa5wVg8IgGQj8op
	zSjGSoT4MFb3r+4WroYKtnoeXabZvM39Bsgg02xqMuva48QXAWOSWIJRONW0pu6/xSlxxON5tIL6h
	O9sDNjrq9aExUe/OrG6sUUidOh/8Z3dxH4qo/yl4JCIyQR6tSdPdvDwGuaUmRhp0pty9NGLWjOFVg
	Spj/RJmSQDbpZJqUXirX2FaoEtbqe/0nSH5Lw7vXFiI746VC46BJriswEjKS2j7XQDTrzalSFpZ84
	XHciERwO3NCLjTbfxaaX65yb/7jpWg2CWAvl0942OqXFK8DJQ8EdyFEL8pZN+OuJ5U15GHqziwm/Q
	nBoCXWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInmV-00000007CLb-306U;
	Tue, 11 Nov 2025 12:47:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInmT-00000007CL9-2O0r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:47:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2956d816c10so44474035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 04:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762865249; x=1763470049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiyCVpW74AzfmSw2woljowbltxeP4f6oP4DP84zte4E=;
        b=R4QR/gpUidLcteTzxBb2DXjytb6vxij6HNYYEf0vSh8sceJzhRB7Ywcp3OasutR6Xt
         zHD8APTwecv8mxnJ2EUuAwMnQLetg2C7MktGEgX+Y1ulK1rcUkuE438PrlRLygzV4/d+
         ZAiRBlJAItMhsIgkii7CVaZJQears7kYmzGnIH7/4ne+GK41+YgEv5K29ZhcmzbWzeio
         KhvJKfJVx+2xLfuH0LBPkPen5SMHFKdbIjFEXPaTfRHEguD8lJeSHCWSQ+qEnA4q7Qdu
         +aMd3D1D/lEOE61XOL0iVYryB9e5VqC0psuFShUOLmxiJUa5NS98loS9KqeVtpWKF/ti
         03hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865249; x=1763470049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiyCVpW74AzfmSw2woljowbltxeP4f6oP4DP84zte4E=;
        b=FbhwnEcLAOZZRN9AqmoEhIY/HivAil55ftsxQr077ebgpNLsbFKmGCBCe0jLpfHasa
         LPt5ZKMd1P2s8bPEZ1jAqPEoabzAWoyf7zhwFy8ATl1d/pNvFs/PtHBuKRJvlrld3EEL
         mTm2FnDr/qyvcOOm45DYsCQ/llV3nC8D+a4i251kA6gmSOgCcZMvZc1Iq9++Izlz+uR4
         8/9TqReQM0UI5C91ohluqoH7ykYrTIEpbCymEYaynMiSfYhEGYbEPzx4uWz8yVBrP2NU
         z2f8aaNm9fjgMYn+S+U2nZsLVaSeyQlNQJDqOk7hyKmgPACZc/LThvd82C03N40X5Ixv
         dJdg==
X-Forwarded-Encrypted: i=1; AJvYcCURucfPxSP19udUWSea0JQWzT9n8sdzWZIw1m7a28Yy5hC3C9KMl+veN9q9qgJ9ZJHzyY3VFMl9xWVeM1yeO1/p@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Yj8praRi+n5tLI40mFKu11BhsQde8297UI80TvacN3rPGZUx
	7ctVKPlAWytShxXqHaSCsqaDrzU+Cfq++jERd3/H95O3sMmO/pPezwW6H8xc59OL3e6MrdE1Npd
	gkWVEsyh6HM3Az/W1ozn2tqqYw5eP2eA=
X-Gm-Gg: ASbGnctZqBuqtcWpN4GEh5rkwtppCVna2s0RSrSRZKk2zhb89QAf8tS93l5nn5avv9a
	SCNUy0HXVNOGKYQOfoj5QO4QboTSzcD3vwyixqt6G5qgDG5KD4tXDsGXk0M7OSHTIONUQ+fFRfO
	Y7ICAZMryfZXXMSId87nc59YYTOBQqKBdYhk1vkX5+paxetrUB3nkHYl07hJnBXnFGSb1PzgJ/J
	T9Fr0BJcOohX5Vz4jne8bmwnQbv4xAYcY+UGTEHQWyktPAvDBgcbXuMqw==
X-Google-Smtp-Source: AGHT+IFJOONKkMfXdqPbe11hbjBNE3dvsWFF9H5OLiJ4S3DIHKfijXdDtwbm5zbR413VDlyjBE1eFW45EeSLVlnkRWU=
X-Received: by 2002:a17:903:2b04:b0:298:43f4:cc51 with SMTP id
 d9443c01a7336-29843f4d1afmr23812835ad.60.1762865248764; Tue, 11 Nov 2025
 04:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com> <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
In-Reply-To: <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Nov 2025 14:49:49 +0200
X-Gm-Features: AWmQ_bkTj9C0dCRYaaW6vS8S4HAZCMkKvqfHh7nxztfpxPDtGEV8r1QKd9FonHg
Message-ID: <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_044729_624899_DB32DA7E 
X-CRM114-Status: GOOD (  11.61  )
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

On Tue, Nov 11, 2025 at 1:50=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Daniel,
>
> On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta@gmai=
l.com> wrote:
>
> > In addition to that, Rogerio please read:
> >
> > https://docs.kernel.org/process/submitting-patches.html
> >
> > At this moment I think you should keep the original author of the
> > patch.
>
> Right, but NXP makes a total mess with authorship.

I cannot disagree with you on this, let me clarify it internally with
NXP colleagues
and sort everything out.

My guess is that when the code was released via the meta-imx-frdm Yocto lay=
er
the original authorship was lost.

Anyhow, what is important for me personally is to have upstream quality cod=
e.
Also, in all fairness we should grant authorship to NXP people and follow

https://docs.kernel.org/process/submitting-patches.html

Thanks a lot for all your help and effort!

Daniel.

