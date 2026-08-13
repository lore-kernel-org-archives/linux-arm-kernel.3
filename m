Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46283C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=; b=i2wA8XNywD+C1p+CGv9Am28Ph7
	jraOk+GfnQZpbkDso9/KQYDITycIeDnObbg2P2QnstW+573gNvafUVE7Eb9btCtSLfrkkrBFHaFrC
	1v/BbODDwA2FvT7Ima9vNrvi3k1oQcTkGhpCjvbyDsoUFme+r7E5KFPmMxspnyutRYsTDzMBMPbqG
	cFBXXrCUbpcMEm09hSCRFaV+2H5WQR3zmFdvPA/09CG5DJfDPnlET241ueA3t4U6TZdx/Cvyerghn
	98Brrd7p3BZEm1uXmrVGiD2SKmQfB04MpJsLUm8+XccoVytlXqFYLpCACQRApaWkXXgce7AaZOpal
	kScB/Epw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuT4e-00000000WEf-04dK;
	Thu, 13 Aug 2026 10:54:12 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuT4b-00000000WDr-3hKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:54:11 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso597877a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 03:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786618449; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4vwD2/pjn3jAFqrBdDJyFKSd5jQORl+0H5ZOKFpHUTT6p1gJx6+IrzE1vhaUygSVG
         0W/YHLPgas0F7XzPX0gkmVWe5ivtFMceY0f91pLw0EHO9rpAoDu/x2PD2YdJoH4TpcJP
         uX+mh/REi9mF+D3gWMm9WLH4JS0/zSqDNelQjQKlyKNPCFXJjDRyRArZJ6LNbg0UG8gZ
         YTe/f9nzjuOrkn9A5jKyagK03Pz4UutXNtO9a8VY3NX0d/wUaFW+PxHcwpsu6wExJIEP
         nBPJ6GCqNoF4+Ghj4x5lSdn40Hg54tph1nIhXAvvzreH3fI2fDHadr0cy6i3tlLJDEQq
         VUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=;
        fh=atcmiZzZMV+EiTX0whw2fjDqMVOE29vDyjuoqAbt9eY=;
        b=Swbd/NQbi4P6Lu5nXeQHgx/3jnJEql7TexC/REa9U6b6p74NoeHfV8VG4iT+oZ1boc
         wJ8eKTUlhbwD0V7qKFhGRVAsg1y+YUfT4ffWORviq0z7aWPOrsFu78J58E0iP3Tbi7+D
         unlzcIGn3yzgz+W+ZN0sJHMvS+x60fS85RVLvj7M5eE6/ogrJp14zUowSJqkYAxxqT2p
         O8It+haUcYlJAJBOy8KjUEjnp+zjTmhxxVemxAkxkphsO/1mV0dN0aSduIL0ZvCedQpo
         ZcpO/H/EuifD8KRhPqwEmHZeH0078EKwlYYEYRZKyRv53abhniiZvyhTHkyB+1iUpEpF
         ws5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618449; x=1787223249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=;
        b=MQytHDm0YRCM2JblTmkhYd+yWbt5ID57Ps2aPnbWlcF0NaB+R50e266+OJgPxTJv55
         22QhMSBl72fy5b4jpnEazn85840y3yvG1t2mnjqV5Fe4APNHX8mBGiQUFp3RGjMwwKcS
         O5QTx6da4JQGufKOh5233KGZznIjxyvoUI8ycHXGzy8LT25zIrw+CZiFrEYsLTleGXCS
         +cnKpdFYcK2h6ptD+edC+HGoCT7c5INRroiiuOH0JVjoOBC0rLsEZqcgQ/oPi38/XT0J
         Ka9KbpdfPf7yWxMHttKgOgulKdynX3UA9TmCuNxYbmprvVSUGpkyP6SVEOGhsrOC0SS8
         OMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618449; x=1787223249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=;
        b=lKanvLfeflWTTEPrIZVSAAVTkxMj3Qs3LyQlcLSqGLhI50BS8YBZ7ATm1PMMOQZY2c
         o6KkOK4UmZxj1LbEppObyvvUH28DBvsulLcp7DpGQ/VnK5gYE1dWaSYNqDuzNT+0mSPe
         LmDTvQwhOd8MspOr7Sg/P6Tydh+3Fyw/ruaCcB9mdXSA9SOokdNovWur5dD3OwQ7qluQ
         Lmq79YLa3FBfOHrneuUMOQYztFMNB1EdP8+Cg4p94k+mDGilKNTCZEYITBuQaEEWNXqh
         iAcEnAmr64gGoIzhg4JRfNGnC8dF6SsDdTaAI4G/4+bJcoF0IFDSOtUWntAx7p+B/hmg
         FPDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrdj7UUUB/qh3vRaoERadEb1ZepwJGQrn0JncYmpiorxm9yjacXJiGogMP09RCKohNbwlV5YNf77DewDiw/E/Zb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi5iyII1w2LHZ1sLhJs1H6VC1HRYDERp9N8VdcUmzeCdGoLaPC
	CETNoC91pwZPQRyjtg9/5GA9UCT+OG7CsWslY19JwSUpztsAx4LbH33Sptio6MG+mz87blolC/p
	8CdGIJo+jlNOF6tvxWAzWmlwVe32VBLE=
X-Gm-Gg: AR+sD103ZkGAPq0jYpVR9c49sMe7JeN+qbbc7sV4UGrkqlT8Vj3HNSKgpMfd396nw6g
	GcAVXpHz6mAO/nNAizUaP+lnONK9f+320dDNjzsdnaUMAXueY2OpYt9/u1OqJKRixKjh5/u0fYO
	0JWTu+1phpWPffEhk5XSR93+medKsZ+Qjs4/fcUCbrfm0Qvwg1FfERxHw+OkNuT/Cl87gauocE+
	0T91OBLIEDKC+5k7v79QIKZwKPyw5vbhc2nnEKobhTfbLdR66oItIi0sLlKttFKj3ZDXdBLUOMw
	1S86cFsqUK9jPXH2ffPAESQMvK5Sy9+ZYO9mCnP9ct76szsG52PmYm7ZFeMbog==
X-Received: by 2002:a17:90b:53ce:b0:38e:4f42:d0d6 with SMTP id
 98e67ed59e1d1-3931f9126e8mr1840719a91.12.1786618448460; Thu, 13 Aug 2026
 03:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260812132755.32585-1-zajec5@gmail.com>
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 13 Aug 2026 13:53:56 +0300
X-Gm-Features: AUfX_mwvfJgoJzaqHfueN-LQn7bH3GneBJt2tzTAZG8zD1CSNA7ePCjt5jSH6b4
Message-ID: <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	Hauke Mehrtens <hauke@hauke-m.de>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_035409_926202_69C76996 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Rafa=C5=82,

Tested on an Asus RT-N18U (BCM47081 + BCM53011 rev 5), with a local
DTS change enabling ports 7 and 8 like your 4/4 does for the R8000
(the in-tree bcm-ns.dtsi state). With patches 1 and 2 applied:

- The op works as designed: DSA picks port 8, the conduit is gmac2,
  the 1/4 warning stays silent, and management over the bridged LAN
  ports runs through the port 8 path with no issues.
- Trap delivery is restored: 20 of 20 BPDUs injected into a front port
  reach the CPU. On the port 5 topology the same probe measured 0 across
  every front port.

With all three CPU ports enabled, GMNGCFG ends up in dual IMP mode
(0xc2 read back). In that mode a tagged frame whose VID is missing
from the VLAN table is delivered to no CPU port at all: an 8021q
upper on a standalone port receives 0 of 7 tagged probes, whether
the port 5 conduit is up or down. With port 8 as the only enabled
CPU port in the DT, where GMNGCFG reads 0b10, the same frames were
delivered. So the preferred CPU port alone does not revive
standalone 8021q uppers on DTs that enable all three ports.

The same effect touches 4/4: the R8000 today has ports 5 and 7
disabled, the single IMP configuration, and enabling them lands the
switch in dual IMP mode through the same driver path. If its switch
behaves like this BCM53011, standalone 8021q uppers on the R8000
stop receiving with 4/4 applied.

On the RT-N18U the boot firmware provisions a MAC only for gmac0,
so gmac2 comes up with a random MAC and the bridge inherits it,
changing per boot.

Best regards,
Semih

