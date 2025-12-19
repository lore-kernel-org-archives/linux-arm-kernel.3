Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18246D78785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SY5w+tUH8s9MZEweKPOypbqcfjFIujvFs5cE+TaQsk=; b=tWzF4Xh4EhvyRxy+LfwpWfoAEV
	OVlDa6q3wBUaKDtSDONIwXNNPHU8vaLl1nnUxX0sM47FasvttmcOrIZzPyYXkBoHZ/KrQ0E/QgTQL
	3vwID1XD0Jg235zuuumj6/195aJvAWjfEDdDHcbcxXAUzrSAjAxUKijhutzEeYQ3joXG4xp87MQ82
	c0wI2CxMJGYsgACvpjH1Npw+YSG85S8mALHKON4T+M/+11nQqOSJzrZ+s0f0xPdJh8saVFBnclVHJ
	SN/6A9PysqGdI5AsPQ5QYXFhv1KdrWjRexQLfZbqxqdIMW9W9mXGo+yVdIT6weBxm3fnm8pDghNrd
	PP565u+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbrs-0000000ASpI-0Q4Y;
	Fri, 19 Dec 2025 14:54:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbrp-0000000ASot-0hRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:54:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a102494058so14679285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156044; x=1766760844; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2SY5w+tUH8s9MZEweKPOypbqcfjFIujvFs5cE+TaQsk=;
        b=JZKocvirQjlZ62AbrivPP0NB1fuQRIs4nV0vl0uMdN69CckKfmO7APdd+k4Wn0tOxt
         OYB8cr/E+Pzsfoy55Wow0zqP38VEb6/tQMOuLPXdVLqE6G5M/fPgwWbomO8zaZRSO8mF
         1e78pwwaWtluZBniDaOrvErh1HP4hEjwhsQOVJ/q2LSZjCuQC5k478TKoP+P36BDumrr
         HNuV3wlPRBVsW5RA4kcekB8gGj+NBK/SxPAHyKL3JyBKp2lMmzaLCcDiJd8NCvwJUsjJ
         iuRIMKanC4kqJ8wtch5/Zx5lJKgzeYRYSnnsVejPu6WsHoap5qE45XJqnP5L4czLqCu9
         fzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156044; x=1766760844;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SY5w+tUH8s9MZEweKPOypbqcfjFIujvFs5cE+TaQsk=;
        b=QQfp2cX6CT0N5DRuJIHuuByXxLb/UwiEXLIZj3CcAo7UaFy9r3WwN1KKtY42c4QKUo
         aQIWZXEB8t9uQNxezM42xG8Z5rXHSuvyND40OdHL6B/vVonmYF0nkB1AWxMXZe9rCtFW
         IIXquwWosBpIE/BnsYpgpJ3Rxu0F9x776fxITV9KMt8fjdz944bti46wnZao7FOx/GOC
         r2dp0N+VBmv9CF2hwjPIhMx2YbcpW878ZKYaRQEolEnQbA/6Glnlle+16m+zroyyQyeN
         lfv9YbK//cG7uZx9HdVGJUiiM6+remyIJ1c+FYoAgvbDGSDT3aUomKw+nBlLS4+Oph3m
         fhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZMWo1wzXTdQ0+fXJ0lSJB0sIU4sQtXOjW26trQN/vpRFjmbF5PYIoAe9qhc+S7miYpTMR4gTZqd1gxLzxsQXW@lists.infradead.org
X-Gm-Message-State: AOJu0YwxE6j67Hv3wHUl6RpGYU35OAdoNdvwIrAZQ3xadtuYX8WiMZvM
	H5/Sn/6MPTpt6h4yBE4RfHTLpqse3g+JQk0Fr28FvBnkM5X3A4+NFshGzlkuC/fWCbA=
X-Gm-Gg: AY/fxX7xN9AT8dqE6FZ5PdxCBUfg30hNq5zhzDT5vc5SPnlOs+x0dvQb0nc9So66/tP
	inz4DbDk4TDmfbN5FZiiE8auBD05qLCzEjVr+zo9htZt5lMZylmhNXh1jyxxAss8JZsXhniLyzX
	BIF8bjbGexD0ha7FtHWiRkawcOZrEEo0B9iXIxyTHYVkZ3bE6HVgjZglLg/FvAgvb/O0P2EfBZG
	j7beLpVK+bvm8CyHMpwr0t9MjlRTeknr7tjpIzLuHphrlZI2Zf86kmTQKAZzrpCBCIJ1AheJTAZ
	RPkS7LvYbL157hFTf/j5Q1+/7NeRpZWaxoLQqDsbeUfIXpR7nwJZKpxrZM4QylxnbjHGwwivLCv
	1yQfHnCkfvKE6FfVzJxDHrFMXCgX70wLcIr81DDRf3zFrI4IbdmjjBz+bK3mr/qjCrcP7uKSkos
	Jw53iNTW3KXkoD/cpB7nCowEEr3+ci
X-Google-Smtp-Source: AGHT+IEfQV9bnP8fsaEkN3KGv8ZqOWPjOs88+7XQncM6ppKvoaKoftTo6/MtRekt02qZ2G9dsu6RDA==
X-Received: by 2002:a17:903:3508:b0:2a0:9047:a738 with SMTP id d9443c01a7336-2a2cab1635dmr57855615ad.19.1766156043627;
        Fri, 19 Dec 2025 06:54:03 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66bd3sm25192085ad.1.2025.12.19.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:54:03 -0800 (PST)
Message-ID: <5b366a0c0d7f4dcb6a3daa793ec503a43ea754b4.camel@linaro.org>
Subject: Re: [PATCH v3 1/6] soc: samsung: exynos-chipid: use devm action to
 unregister soc device
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 14:53:58 +0000
In-Reply-To: <20251120-gs101-chipid-v3-1-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-1-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_065405_253526_D3A5FB0D 
X-CRM114-Status: UNSURE (   9.28  )
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

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> Simplify the unwinding of the soc device by using a devm action.
> Add the action before the exynos_asv_init() to avoid an explicit call
> to soc_device_unregister().
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 28 ++++++++++++--------------=
--
> =C2=A01 file changed, 12 insertions(+), 16 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

