Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94521D0D179
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TGTeidiGCvqOZ4bsoKIlueH1jfD2bKXwBQBBP/tjm0=; b=zdx01gu/FZWaed+t6/AAjn1JNl
	6cP16ZNTec0Yxfefvc5Unz0Ztd2EB68iApvfrSrzNQx8N4r6A6w5hYybiT99NNFPYo0m67KsHk3gC
	XLDN9EKbRhyMIEz5oLH2dnTxZBHpMCFCWG8WT6aHZhgAneV9xZN610nW9wvfVGyGC3RFNFU5Y7uK0
	VfxjZ+FJBBXSi0/4xcYcHbvzGWzkeHDUxDSVVOD8X+dIl/1vnIEXQVK1tB54HVg2TEuRFVKz7jeXd
	/jEVh7r0mmMvRdE5MFTwc/57GcjbHdIIyllLey05V/tC+StkRxG2V5F67D0U1i+yuPnwAG8V548t0
	8oqd1cNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcTV-0000000FivT-23Zk;
	Wed, 07 Jan 2026 22:57:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcTT-0000000Fiv8-2KBs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 22:57:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso23073465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 14:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767826673; x=1768431473; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1TGTeidiGCvqOZ4bsoKIlueH1jfD2bKXwBQBBP/tjm0=;
        b=fRbONnRZ32v7wh4ZhRcbovYSiKeFW5ImCXCnXRSMCpzWRBwzb0sl1Z4oNPqzklKRGI
         sJS1rFCZV2CnF/i5kKLL8mhOe8yTMWf+vmTt0GJicaz/Fr4yUGUQpZIbwqPfkHuR7PPW
         Cix6tcOKv3t1S8WGI8CtPk8+rAF+JFOK/d+rDAxrip+Z4VYHSZ8eeyfQD1vDFYVufH/O
         CceGDmvpIZ0ezq/1/kOnwNI1SP4JwCHeZyM+r/MitOpwbPrq46eKZZq7/IlXnI8hLJVp
         tyZ9wOsRs3Lfmwajfr3AUS/7SbhxAhuzIfMZec9dNLE94nIlXy7gIdby34KPLjyDAUKk
         3kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767826673; x=1768431473;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TGTeidiGCvqOZ4bsoKIlueH1jfD2bKXwBQBBP/tjm0=;
        b=kXJvCCoSl76cs3iyhN08xeiA+8bafr0osEaPLUPUFJD64F1DqqSBZhTA/4zT8boD17
         si3rnlH/tGYG+F8yC0Qa73lf4NzC47D563XKKtetlnL0egf6hUW0Sv6jTm8NZO/LwUqy
         QAcZdf9t5kLj63sv1aC2WQWeVQ9gxoLenf91YOdPvsVM+WqKTepZLv9UhmlfpPU1+vEn
         RCmnSJeuQN7NG/6+MZk9ajnC2YXYl3gcd73Ds1tuFSyu1HQT1RzJ/hTOEsFzVjCirYNI
         2iz7rZRfZTCsTmopaez7kP1k4QN+2pQ/Uh2KMJuV6rgEaJBn5obSMCtX9Nv65/ow5npp
         +qOw==
X-Forwarded-Encrypted: i=1; AJvYcCXsh1RgCru1g/atN1HG0C9hZtPxX9qLPKJpIApbxQRejUrc+DiY9W73AaQ9Jn0u+wYZ/Je4fLRIvI59IhCpzYw3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0HcbCUwe0ek1byN2HgmFC2bFuXRELJvIM/uLmt54k4H4M5cap
	AKMRhK6OtKM3EaXKHo7ZLPWhKW47ZiddKAc0mcpu3yiP8BiIl6qsGtnk
X-Gm-Gg: AY/fxX5MBlTXMlSad+L9KiaH/6EMpwX/kDs61f+kvMDTnq3povU12TJOgUUPXrqnPcz
	uSn60YrqOLsh62p9+jrAoVfq2madZQaTvXCij0Et2OA+M+BNwHSS8F5Fl62cIYZSe2RUirrAOav
	3HnJ2T1GK/Lh80w+0vg4Sy9PYZO/nqj/KgJDXYvXH6r5Q8zTQAGS/xm83CXjh45oHjORB6x0xxB
	j3i/WRGbwaHpryH/KQKL7XHsFlk2wN/rtYwAR9Wx5ckDe/Q9IJXvof5NmDO2Iq0Xtfr03e8hxct
	oyYPqOkNPg/1zWJgMgQGco0vtMit8MfyIpbstP2sBn5TqjW3K2JDjuAgGjCx0OE5jofxMk4BDlH
	MqrCpNSGf14+jGWHkuGrnloIwFWz3un++fpVwJZFcGAKiAp1Lvw52YcFUXtr4k4F4Hgz1eVLzg0
	HvDYCR6wcW1SJn3UE5Jhga+Xf1lcgDNFhSlSRg94t1fQ==
X-Google-Smtp-Source: AGHT+IGI92ZHCmtvBoQLlcOxARn6bJsuytihUD4BB7f9hJIHBDRWBS6xHjN7DFxYfdt7OJpxksqhhw==
X-Received: by 2002:a05:600c:8119:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47d84b0a8dfmr47264595e9.3.1767826672807;
        Wed, 07 Jan 2026 14:57:52 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm24574695e9.4.2026.01.07.14.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 14:57:52 -0800 (PST)
Message-ID: <6c90102537c3e3f1712538ca0b165cd54d71d8c2.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon
 <nm@ti.com>,  Vignesh Raghavendra	 <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>,  Akashdeep Kaur	 <a-kaur@ti.com>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Jan 2026 23:57:53 +0100
In-Reply-To: <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
	 <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_145755_647661_3ED2CC0C 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Markus,

On Tue, 2026-01-06 at 21:25 +0100, Markus Schneider-Pargmann wrote:
> > I think we would need to discuss this with TI via our FAE, because the =
change
> > in question has both been discussed with former FAE and the technical t=
eam
> > behind, and adopted in TI SDK.
> >=20
> > Or have you already discused this with corresponding TI HW team?
> >=20
> > Which hardware is affected, is it the official SK-AM62A-LP?
> > Is MMC2 the SD-card?
>=20
> I only tested my am62a board on u-boot v2026.01. It is a SK-AM62A-LP.
> MMC2 is the SD-card and mmc1 in the devicetree.

just wanted to let you know, I was able to reproduce the problems with SD
card access via MMC2 under Linux on AM623 with ST enabled.

We will seek clarification from TI on why this happens, which peripherals
are affected and what should be the course of actions.

--=20
Alexander Sverdlin.

