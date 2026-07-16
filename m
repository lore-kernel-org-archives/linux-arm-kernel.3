Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA28C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5zT/090OBDN486SJqrCBXr+ibXy821aDdOSseWC2Bk=; b=Dgw7htEfzSa+9IlPMKy9oUUrWl
	Z774In5bnOrE64zrIk6apw6w1hAHiEPh9g8R+0LWSc9jz3AnmjienMy/LL6Vl5LUhueHTMFsruOf3
	WdjFu+HzYTYoGMRkgVPL1Y11/EOEw8lhvws/9mb5Xpavd3MQ7s8+Chl5Lv6byNq+tCjqvqLCEoC1H
	kzQ1F1HmZA98PUGQf0QwQTFKZv5kGwkeqUdE8tbBmbYsuKYNzOPhSXuHpFx0vJ20hEpY3L8Rxi50b
	qNFcKm/I1dXB/lNuwLyvagyA7NZ3Y4B/H7zKErOja/tXoJ5ThV/4Fz6iqBbGC1INO8LpC6XywEZtm
	aBoxuozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMbr-0000000HQEQ-0E0d;
	Thu, 16 Jul 2026 13:58:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMbn-0000000HQE4-3Fhz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:58:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47d6c634f45so3801700f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784210317; x=1784815117; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R5zT/090OBDN486SJqrCBXr+ibXy821aDdOSseWC2Bk=;
        b=fsIo7dG2cxVWnAjJCRuE0jQbOCo+wnTn1gMF/EnOU5yWD1GuQF+nhCFabnUgKMsypy
         AWnB3XRFYUiZfMHhamLZFYvFcGioVUrjrChV4Mv9f7FDJk9uI/Ar0/r8itLBTd8tc4O+
         nIC0J29K8zUiLTfw82/C2Rw75tNuqdyhHhVa0XLVOm2ld11jZBzQ5I8d7RM4wyvR2u4u
         9suikuY1nm1geQEab4bBEY6jHrynRpI9SsW2pQJSVVvRf11iNWUBS8FvArNI9CE1mkuQ
         26pbYPUy9ziffmBXQ9KQn4yFOTTKAm2/6HpINABSaxYq+xl0Q+FxQQDaR0uklppIEV3y
         8PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784210317; x=1784815117;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5zT/090OBDN486SJqrCBXr+ibXy821aDdOSseWC2Bk=;
        b=VAHsyIr16ZP0nA2nvnFHlaOWj6+Xk1jaFOphTcmgoXXuG3mPfrgszjZPTDWm28Q6wK
         TfrIJ/UaHeKXh6KNCnQ3t2esbaze3KPyHEOo1fuYXdqnoY3a8SUvEkjuxe9PxV5I0uIO
         bAWXSdlh8oAG1Zn4EH5FB08Qp0of1owIXvzz3/Gcvkyntv1QoEk1k9brK6LUKtZz87nW
         Jl4MOVE8bK7KOodoBhOvt/9tS5rIi8hEsCNvmHCn5uBVGF9UiwY5Wd/G6oYMvl3FCCaJ
         MkNYeXsOn5KDzQjQWuEpN54L/94OrOU6vU/ksUm2kSsvOA9k03SZo1E5uC6wA7lQjOjm
         7bQw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+G6Sgi3K62hb0Bq8q44Pjvs6yYxrbuBwggY5DTMN8kA69tOpuvplBDnE2T91h6qrHkgon/XG/Rt/G96Shd3bG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpsnx3dVj03hFZImoag8bLUu7apvwWou7+RyZ9DXZ3vqCLCanZ
	PsQZJG+kEudniM+e0alikBIf/Z4ASFm8h771IrM8X8HJ59cC4e0qL9Fm
X-Gm-Gg: AfdE7cnYxi2ZyOSei8xD55r79TpXCMrpfjAxEU8jLd3GRmqCfHM7jcpubtLOatp/Uj2
	1gCB/Eszz60m4Dp0JswtcOeaSGFA7WYXeXgBzJrl+0WnpZBEAGadTe9tbKVFHxftZO0cMLZDiuv
	tqO2vJgTcvknVO3/1bq+BDTfx/dL9c71EVr3xZourUahmgMfPQorv+7taIlm92zBgCCsT89gUbo
	0CKB/f1IPOVoVtFT+gpXbcEa34v4MhEAYNdVRNDhAyu5O30Xm1URIBOXtozmZ4qcqFv5noqDeTE
	xUBJSzTvqgKPKYUN132wIrPlgpQjB+OTGUsuEWYGpNdGyi9eiHoacVmbrYZSWj5ayBX/ZVufjhX
	WhjWiDhCpf3fncc1ptJUoO08cOc7wWvVOfiHSj/GKiwI2t4Ii5KWJwg16ZNaOxLdr8fAqtC2AtT
	puJO9toV1NyKCRIvZ2ky4NKzjLSf7rgPCB0mvVqQI=
X-Received: by 2002:a05:6000:4914:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-47f488bf7bamr12897767f8f.43.1784210317205;
        Thu, 16 Jul 2026 06:58:37 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:b522:ee0:9221:cb46? ([2001:8a0:c4c6:f00:b522:ee0:9221:cb46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464caeffsm23296976f8f.36.2026.07.16.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:58:36 -0700 (PDT)
Message-ID: <38d07e176afdac0e2577fe93fec7ad47c1c12dac.camel@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-verdin: Reserve UART_4 for
 Cortex-R5F
From: Vitor Soares <ivitro@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Vitor Soares <vitor.soares@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 16 Jul 2026 14:58:34 +0100
In-Reply-To: <178408904493.1082634.1111398751432883626.b4-reply@b4>
References: <20260602141311.1366818-5-ivitro@gmail.com>
	 <20260602141311.1366818-7-ivitro@gmail.com>
	 <178408904493.1082634.1111398751432883626.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_065839_827828_1D6D35C6 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, 2026-07-15 at 09:47 +0530, Vignesh Raghavendra wrote:
> On 2026-06-02 15:13 +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >=20
> > Add a device tree overlay reserving AM62P MCU_UART0 (Verdin UART_4) for
> > use by the Cortex-R5F co-processor.
> >=20
>=20
> Can we please reuse k3-am625-verdin-uart4-mcu.dtso (if required, rename
> as generic one to be used across K3 verdin boards)? Else, we end up
> having dtso for every peripheral that different remoteproc firmware.
>=20
>=20

Thanks for the feedback. I reworked this for v2 by renaming the existing AM=
62
overlay to a common k3-am62x-verdin overlay and reusing it for both Verdin =
AM62
and Verdin AM62P.

I will send v2 with this addressed.

Thanks,
Vitor Soares

