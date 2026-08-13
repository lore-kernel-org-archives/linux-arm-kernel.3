Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B910BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 18:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=; b=p+gZGBd0RVZtLM9uQYp8+yWMcS
	QSbv0lDRXZMRk6/h+/K45PQ5GjsJTFRlgr9D0LyK4BvF8BvNt9JBO0LkshTmsHOVhg8JvdRp5SgZU
	RfnlRnu+i6NhD3RqcQdyAg/nRyxz1wTcoJcws6vWMUKEck5FX7RzwUUnhK7IEv6s7okbbGdZVwUPf
	gnI16o4KCGOBQYFR9IjvhFHvdswIiNFrNDRPPT4or2cTNX8Ax3WLwxNp4i1L1E9EyTIN8iygDqckO
	vyC3/QqaS6jHP1Vf5sRrFBQ5yMpKPX67e3cAV4MyC1on348iXwiwGyJ/pB4ZMJ1zh6Yg8s0/6L/uG
	AYGPzuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaAf-00000001NxN-3Vhz;
	Thu, 13 Aug 2026 18:28:53 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaAe-00000001Nwc-0AET
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 18:28:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-39faa67fab8so937531fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 11:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786645729; cv=none;
        d=google.com; s=arc-20260327;
        b=WDQE6iBIy5acaNC45BN3WnUu9QS0p4OKVy5jUtt29GnYa9P6D8nf+R+41VuMy7cfn0
         qK9QEx7du5yhnyVdDIxpqt4El2nDNFcpkcRgTOh7e+izJCzsHmE44qKkrqQL9DvXbTFU
         KJ9hjpEpxR52RZXGnm6AspysMVWgErFNhNZtHItwz88owKY+FuHAIEa8wJ6VIeURTfkt
         CJYYnKhfsKMsvvI0LfADYLcvrLyTuwtQgHWx9Xcz0jcs2k2VTlI9pIEb1LK22z4dXnTI
         23kDr2k1ccToC/35bC/5tsqLMQBZB1cpRctj4XMrF8jdnbMfjuFnkrwk5EI42zsj+VRz
         knfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        fh=S3+wSUAGpsOpqNEV5eKqRS28RV2sPxx1dpk7m+Y+0cM=;
        b=qFDKQK5x4n6q+EDlhcPkOaOz6z58V7idySA2/GXOZ9aFl7WcRGGwSxI92tcTtM8tWJ
         p4TULLPIqIvbQO/sEkmWE+5Ar6AnQrDRjQtBCJuuBgVitTn/Ut7zffY3snZuyYZCInz3
         GyRIMfGjJ3FqPIk2nsrc3OEFTNVTnlQ89z8QrFNOLvzzjwrLhsZLKEzYe52VWx1eVQn0
         Rbp8DpWYPMdLft7QVNRR75QmduGFao+7dwd7AwEVIzZ80nOj+AnNBBrFin8YG3KzRH5l
         Ej5S1Eb1gjIJGxN/Zmv9CNB0/clQYao1nBMTMavPYeS/moPvyHTTrcGPNSGl7/NTOSE0
         qXsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786645729; x=1787250529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        b=YJg0L4o+jxy92PO3H1PhiKVT4FYwK7AvXgd73SCobHIeLDYDOx4bnPvGPPfzpAzUic
         Pjdn8M3Lp1nfC4t2Y9vguEmn4Oj2xGww0wECtZQXN7amUQKMKknuEOmMCpQqOv8tBPXG
         6VG9HzMCRqlMXsl3AFgrbFrC+djxXHumflbkGTULI7RpaUtWc/vvOox8NueKDZ+db4BW
         T0VADKCR3yR6gGZgGT8vhH5VpTexbGFU0WlvdSTGEFdpstQDCi6AalrMO5Q3Nun6kVg6
         3qs57/fPyTSuim2gAvKAIqhk5QDoJ/kmkXQB5if32+6cxTy2GOebXkHq1in2HfD8ZYvJ
         SmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645729; x=1787250529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        b=TOs26KxwSwsUqgEYcAAkHcsk6DVJe9C8/hfpNB0jcOSX+9EX8hUkN+hY/KQTrkRwmY
         MZhjrLVgkWcnHVnYDBOK3BoQwAVBFpIJFtBs6MMCsFNaknlgTGsxpNx9US73Okmw5dMC
         bUFrEokzaPsbcRNGw7geKHYvSNbYaIoXHi0ZpVKIGSnkbx0yPf2cZkMgKeeBKElD6ZiU
         MJ2kWWHNwFPadpOmEEdJvg+9w5uUjki4Jw61iixc+dssgZUED5NVub6uG0EEWqz72FIb
         yEDvlTmKVGwKjtdB54S++oxwMBtN/Uf3RjFQVWWnjEaeDWMcME5ireTahsu68MKMhB+u
         ANvA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6WGJNqOY+Z77egi68Qol8VPBkIw73tKuV8/I2rBE6sAHsUTmsrOI50dcDRUpT8LXg7Pb741it8KSZxM0G4Vg4@lists.infradead.org
X-Gm-Message-State: AOJu0YzyKVG4PNqKbxnlduEWfZw/SPBG8OxsF0SJFg0NHxYivIhblumZ
	WWmkwhHBM2VS+1yhAohV970MLTb/U9cimGJnhDCLuIVp4+qj8/Jm4hVM6qx7/twiUXBUFYozWlR
	Rr2EExAshgFXJwGWUa6RL4kzQGNIQRWt2/3KM
X-Gm-Gg: AR+sD11CykvwJJpJ7CP0HNyrgGsO0qaSaF+AHoNPc+8K5JYk7hK9seH+xDfss/KGYsp
	C0Gz9CsTIQd8/VpdsFtJFw+bvRQveTH4ijCDyHD6jTzh415JALHBB4DZonutH+OpYx4IWJh/GYq
	rC7RMbtPVjUcKs5Vx/OX7rciZ5Dl9eIpM4LEjorwmSlUf2cIGNC5QA7TtGnIdjfopkGvpXsyvf8
	erFv09Yv3ksALLqCyHSICTzkqqr93i5WbjEJTTQpCwyVNf56vw/HX4N9Ow/n50iY3KDuB24xT+K
	W7pzs0o7LDrFsIFgN1IWHlf2XAmZMnWkdrmN663Bv08z9lU2zw9UUHohyosl+1Xx4oLmGu1h34x
	3wOSXDwVoZmwsVIyAwPwcZrcIb+/WfgTu1g==
X-Received: by 2002:a05:651c:144c:b0:39f:a2be:bc3f with SMTP id
 38308e7fff4ca-3a1324a50b0mr553821fa.16.1786645728923; Thu, 13 Aug 2026
 11:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Aug 2026 15:28:36 -0300
X-Gm-Features: AUfX_my5p0yWdwpoBKfTk9A0esYAtB3NODe2jCHwBG5CaU5OZpEHLSdJGKH_EW4
Message-ID: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri
 VF50 and VF61
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_112852_097712_B1DBA544 
X-CRM114-Status: GOOD (  10.81  )
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

Hi Mehmet,

On Thu, Aug 13, 2026 at 1:11=E2=80=AFPM Mehmet Fide <mehmet.fide@gmail.com>=
 wrote:
>
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> This adds a device tree for the Toradex Iris carrier board carrying the
> Vybrid Colibri modules, plus two small preparatory patches for the
> module-level dtsi that the i.MX Colibri variants already had.
>
> Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18.

What about the latest mainline kernel, 7.2-rc7?

