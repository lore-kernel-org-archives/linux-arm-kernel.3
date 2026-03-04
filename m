Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B558CEFCE42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxxzOa2h0b95iP3Xk5WWWLQcyEoyNoD/1Y6h01FV4K8=; b=3kftDBdLsN0Qxn9nh+kTd2BuEg
	f639MAhi4DU1NaENjeLK1Qvik7E+Cu8xSTgyHJsfMIOOzj1hfJ7h1LAgn3Cu1FobIRE5ADnUpnlLF
	8g9dVpk0s8H6xUsi/yw7Rj7Yk+4F9Pg1JCDnAjEAnlUizmye/AAIlUhRZezMt5M9lPuaKlUiM21ZA
	gSjuMcP/l9oTIsFB4wmzitoRcy3sw9FCjdnbsRKXMcbOA0G/2F5TMpuN0mPbKoEqTxHuIvUCYwXt/
	IDeNP51hnb2qEtghjpY2k+slnN9fUpck23es/80OstM17UZE0BR5gzv2TCOakgH6JbOjOUHCecMJ9
	1CcWhRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsUL-00000000R83-3g6m;
	Wed, 04 Mar 2026 20:06:33 +0000
Received: from sender4-of-o56.zoho.com ([136.143.188.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsUJ-00000000R7R-1ODW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 20:06:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772654767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c5K66uliHzk7CGpi8n5aExhKsMDeoU90n2QaTiYviOAKp4G9lCEFcHztxFKdds/mn0OY1JeyKQKTHmqwSAdctXkE+KFHGEdc6GP7p+PZ40VmvnPGzIvCy4X99n2fAc/bm8AhPV0/+QhnVDIShfb5y/mVb74ORV4ywWaW6qBkUPA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772654767; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KxxzOa2h0b95iP3Xk5WWWLQcyEoyNoD/1Y6h01FV4K8=; 
	b=Sb1adAzpwBtNOrEhOmIiofyghlc+EJJ2BbRyQaVGzpOW62S0zu6X0Gyz0Thv9xTW3xowOnY2gxE6w5zkbM3YgMzWo9/qVw+Aj59cbhXU/J4NTcdbX5C8FJTv9gaNlB6AmTEwa63eZTIGf8IMyYM1SBl5hI+b2QH5YHvyI+KYyuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pta2002.com;
	spf=pass  smtp.mailfrom=pta2002@pta2002.com;
	dmarc=pass header.from=<pta2002@pta2002.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772654767;
	s=zoho; d=pta2002.com; i=pta2002@pta2002.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=KxxzOa2h0b95iP3Xk5WWWLQcyEoyNoD/1Y6h01FV4K8=;
	b=hJiO9lCjT0uMu80sgo23W5lxl3egQAhfpU+tgR0JuDv0VKylV2IRFmxOfXflverg
	3jQFxAv+sc49cEKruWwcWFZSqyLgtizPyaS0R/pocYMVsge7+ShdtTyunW2IvlbWEC1
	Uym91j1sicQ/9kX8MNwUW/QNQlgRCA87Zq78qmtc=
Received: by mx.zohomail.com with SMTPS id 1772654765041376.56801706127544;
	Wed, 4 Mar 2026 12:06:05 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89a1347051aso30644756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 12:06:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuoNPKQ0vtayV6yH+aUOPS7hROwyb0w8+NPRM+3/JG62/QY9+qRE5MOlbC/0RF73cBQiH4WnhvcF7TpkGbC+ZN@lists.infradead.org
X-Gm-Message-State: AOJu0YyHMW6g+zpjU8uOsGFVvMay1eCnEUkGB6xMQik5YEvz6wqjIpdX
	FOxEswJqU/Fq/Ajqyd12YyVfT2IXZWHAYZH6mmPnE2pXodL06yXlEHqYc6eLdjZDWaT0USv1b54
	Eg/MchGSygyilMzQuFPH4q6FAo+PFM4k=
X-Received: by 2002:a05:6214:da6:b0:899:fecd:30d6 with SMTP id
 6a1803df08f44-89a19af7521mr44089846d6.30.1772654763973; Wed, 04 Mar 2026
 12:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20260304-radxa-r5-itx-hdmirx-v1-1-f77bf1f7ce03@pta2002.com> <DGU7SPZQMZR5.1506XM8RO4EHE@cknow-tech.com>
In-Reply-To: <DGU7SPZQMZR5.1506XM8RO4EHE@cknow-tech.com>
From: Pedro Alves <pta2002@pta2002.com>
Date: Wed, 4 Mar 2026 20:05:52 +0000
X-Gmail-Original-Message-ID: <CAAEXfUVBVMmT3i+10F3uvmGOtMMLoQK4WXM7_0G88aL5DntOuw@mail.gmail.com>
X-Gm-Features: AaiRm522NeKVPT_NuMI8MroNRdXzBN2oEYdWCpnVvfjbm98xzQHscRW9QI3Jbck
Message-ID: <CAAEXfUVBVMmT3i+10F3uvmGOtMMLoQK4WXM7_0G88aL5DntOuw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
To: Diederik de Haas <diederik@cknow-tech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_120631_409202_E8C2C7C4 
X-CRM114-Status: GOOD (  14.08  )
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

On 04/03/2026 18:38, Diederik de Haas wrote:
> I have a strong suspicion that it was named 'hdmirx_det' because in the
> schema its label is 'HDMIIRX_DET_L' where the extra 'I' was probably
> dropped as that seems to be a spelling issue and the '_L' suffix is
> quite often dropped.
>
> FWIW: The label in the schematic for Rock 5B, Rock 5B+, Rock 5T and Rock
> 5 ITX+ are all 'HDMIIRX_DET_L', yet none of them follow the convention
> to use the label from the schematics.

That's a good point, and the other boards all have the hdmirx_det
naming in the downstream kernel, so I guess that would be the most
"correct" name to use.

> So now the 'problem' is indeed: make it consistent with the other boards
> or keep the one where the convention was followed.

Also a third option of changing the other boards to all match. Either
way, I can do those changes, just let me know what would be desirable.

Best regards,
Pedro Alves

