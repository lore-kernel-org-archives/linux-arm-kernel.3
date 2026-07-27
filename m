Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9EDC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/kA/Y690WSDQmA6nTaxghCYq6fcNkFzKnP5KGG+KSk=; b=b895u5bZYS9TLBjIxAWtwuwWJt
	wIoT/VnKTyAZ2O8VL41ivgrzdqJpcUW/SBO6hbJ7BpDyV68e/E7ltqm+kVdz4MEE2hJOMoqxuNIQp
	M+hbS/sCUnvnBzcmKWmgrTw9NYJ14slf7Kz8xMFJjO5+RhAwZB5GejjEmxKKXbz16VEguiVp5CqSY
	07vKkzFEvmTStp33xIpcXap5LaNCS5v+wZmOpAhbhbqyrBE3JmCz5lHmgr//9fqd8ZYl8/ujl08AT
	669TEbh/F9QbHlIl9vJm2pdXcupkGg9ItT6pf6ohxR4R8QIf7mbsZm+KOE1v0uj7FQMoWb8CUy0Gh
	9oLWIAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJEI-00000002YWD-09ry;
	Mon, 27 Jul 2026 11:10:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJEF-00000002YVP-3RGl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:10:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so3620299a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150638; x=1785755438; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F/kA/Y690WSDQmA6nTaxghCYq6fcNkFzKnP5KGG+KSk=;
        b=lH9fO2Z5M4G9IXfu9lDcFNT5lLzFwjf+u2WFL52b/JrtkW70nQXd/OEo+/S5sdidZu
         3JiF+y/OPAKScxAuv2uddeFKLKAkLoc45aA58WxeevBGHdQsLBTgkWzPuXfFWa8dN4IW
         3xP9aMhmJWuCrngXmn84vP/eMu57MRUz2RzkD+EcdyTr5dTQc1vneT6ow9/jwF3zSseX
         FUmfiQ+6ljffy1TTKk7FQXxG/dQYI2uXAoHf7+GIhPVcgTcPrpX1KQqPk8+LyNsuEGyB
         oTT+xHwfVOARjPK2hEPPNI5q6pF+Y7+60G5j85nDGgofxdAjjrV2HDKGJBi+7P/mS/pv
         nzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150638; x=1785755438;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/kA/Y690WSDQmA6nTaxghCYq6fcNkFzKnP5KGG+KSk=;
        b=GV5Ct30t/vHz7Ya3kS/PwMvnM7lMVzH4HOwFM88E81gOe4//yBM7/+WyYyqqMizjhG
         Jv8bguVpo0xrWCWnVSqzYmR72TtsS5wbRp4Uz+TBvVBcGD/eJpw6J31JTE8uk5kB6POV
         P2PeLkWUPYrMi1Yr6uM6WUs2PHLnaonPr3aodkIMTKfnDxaGLgN89KJRlIpP9UmTbZwI
         JvClqdyw2PyGtuljeHtrSyhPPvqEueJE0qO8FQ01vfzL+MKVajVONpzCDWvOc2I9LR3X
         DHPybfAq0avrXlIahX3mItWKh7mLmvrcLD6KLBfIJBOK/2c6DINgpsC3kIOsZGmqCyOd
         xQBg==
X-Gm-Message-State: AOJu0YxkInvZhJ2KSGh05UfRGkzjNoH5Mgcswu0SDmUoQG6qz4+EHOKj
	vdNZxiumXK5ZFb8s/ncNBBRrjoCpBV+YTNtupGaOJF0Kg3HZx75eAoAXySxwfjsxFqyddw+qVns
	UDMSxzQE=
X-Gm-Gg: AR+sD123iqdJp4tZo8BJJ9VEqGwAd8RdZ99I3DHVmqzxfAGFfXBcaWFe3uym64r7vcn
	u3zDsUHCKM9Sb8DjC+hfkchcexgRTjYxXCPe8wGJDB1i9y8YhnnqNdX9rZiUSuhvVlG38nLmqUy
	rosVlmwqe1eDhH2QyAu/cB03wtrr2Wsk4p9Ghv0ITyR/bQjOD4a/9iidxByIcWHHBKMIONi5dQr
	8GLGXp/nx9MJJowi0lep8fkLaBBtUkdVHq35da3K9qFsq5H6hCRda36t3CnowU0E2M0kL3XiGOo
	tLxYdbtq/kxTC96J63YWIqB0phugJJM3zHwaULQmqZ2zstctRKQtA8CTBGg3tnfKI0nC/wwtmf0
	4nBYwi4hJvJEdx9ItFsolXL8sLRIjjvsJd5BGNKksknPGgzPYhrWveE8BkNovm67XR/UKKg6xYO
	nljYiZ9g==
X-Received: by 2002:a05:6402:3899:b0:698:c167:91f7 with SMTP id 4fb4d7f45d1cf-69fc1170687mr3269674a12.34.1785150637925;
        Mon, 27 Jul 2026 04:10:37 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543ab7sm2469285a12.17.2026.07.27.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:10:37 -0700 (PDT)
Message-ID: <c2c816236de472856d99d22b5f6a286844ae3dd4.camel@linaro.org>
Subject: Re: [PATCH 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:10:55 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-7-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-7-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_041039_860691_050BA387 
X-CRM114-Status: GOOD (  10.99  )
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

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
> =C2=A0 [property-order] property 'phy-mode' out of canonical order (shoul=
d sort before 'status')
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/tesla/fsd-evb.dts |=C2=A0 6 ++++--
> =C2=A0arch/arm64/boot/dts/tesla/fsd.dtsi=C2=A0=C2=A0=C2=A0 | 24 +++++++++=
+++++++++++++++
> =C2=A02 files changed, 28 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,

