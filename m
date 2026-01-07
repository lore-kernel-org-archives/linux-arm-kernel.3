Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC726CFD641
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peT8hDVe1vV9CvEJKFFERAFarbRQwnMnwY5d7hImP38=; b=SmdMeHJHruJSr5DhoqARGenGJH
	lGH0pT8Mzbosny5txpg013ZpE2ATLLPKREl95WG4IN52LbF9RDtaOy7Ybj8F92d7Hn/oTIh8KLVvq
	/ge8UsX/jA/EaFlmkJ6lDRB3V6dsQSBUv/OAHHV1xMp1pc8SfIGggHGdZqu8ZqTN1jEh0HJrfBkgQ
	mzbMymLD2o8zqC4nACQUPXIHV1sNxyMfAmhTFIKmFvQjZrk2Ksm3TqWg4eCL/Ofs1Hc79z4vwQ4HY
	aM2W6Fswaw8ungfobQQeEIDFPHZzzIPPIHO63AYnV3ZB9PHir8SuzZ+DEJc78zN29nzPd4KuXYAPy
	ziUKEasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUqc-0000000F7ko-2djh;
	Wed, 07 Jan 2026 14:49:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUqa-0000000F7jo-0Bli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:49:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso10261055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767797354; x=1768402154; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=peT8hDVe1vV9CvEJKFFERAFarbRQwnMnwY5d7hImP38=;
        b=ZKI7mymNWe2dPn9Q5FmBb+eqju4hc610p21AvdhirrM3dtTd9DT20uBLgdgpDvF2JP
         wgAHeYL8S61wnyHEaHMtICqU76cmzt9OmmZJ36Xc7hj9GzMSmuEIjgWlX6vwsqitJB3m
         6BRBXBqA5uYbqNFacCX9ECJC6UZPWj0KTFfSqgjhanw55W3XjxxBYklL75U6Nh4CjOaJ
         fwZJ4kz52rebam13f7tvw2btD8629ncr18HSP/MTexqbkG6j3vTyzWjgEeTuv5KVJKV6
         RAjduUnG3ZG7hgvyE/naDzJXOEhgrtClGLAT8hfUTvnhjndUpZv+G8q5D6QQH7mc7Z6/
         XhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797354; x=1768402154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peT8hDVe1vV9CvEJKFFERAFarbRQwnMnwY5d7hImP38=;
        b=UkXzVW4opkV3qFDjZbk+Vy7y09G5hrB8DvnbJ6IdvxdXgql1QJQZZmSF3/FYhJjq+k
         agf+nLwy/11FI89OIDFL/PWfoYA3Pw+ooDDTTPzWOdBx3DVkF/0KpAd1NRSZEWapqyhA
         mTH8b1Oom0PzZ8ApoXYC4dqaJx8OGEpS0Qzj9QdRZe4xf5kP+6zU/tt8dPBfWWuxlQQo
         YCiemNnX/VldK4GDnLOj2LmZ4IIrczf0TV95SMHx9A+QnjV28f85CG1dyt+P2cZSxtOJ
         svu8LywhwAK1TZdKUCF2Rmz/dmMtBApjhxWWCzTcG42h7OKlos86t2ee1zRN0PRj/8QC
         a40A==
X-Forwarded-Encrypted: i=1; AJvYcCVhyHD7ek+RSyPmzXMcJecnNH7Cx9yuLGJJ6hwu8Jxy4ApGBuOA7G7Pocqu24DNU3fjRjF5Z4WjUbgaKDm03L2b@lists.infradead.org
X-Gm-Message-State: AOJu0YxvD+f0kCGgnlxoZodttB4jFn8c3rEptOsrUYGvffnLO/XZbZ4N
	4ftVhN/MgdWB0Vi+M6Jh4cBT7pQvoaQTiCEv36mwi+9NINshCL41plwh
X-Gm-Gg: AY/fxX53mFtGK4zQnWIKhVEoBYWDbx/cDxqrtlR60OybJpkJErd3j4oto5aFRm+TK5I
	pncKUYlxJ+WM6AfFU4zBm4ldofQddHQWet/wRV3lz4H10UiVuAOL6EJ8VcHy2PAeLjC0m09GjCt
	U2SSoTxp5BGjndELzBa3Tdq44XDrhYTHLQeRrol9zLL4dTtIdUi7k4JBRMamtLIjrwQ+z/d5IRE
	FIMSSA/BtFsS0sWLUKW7r0GgSATXNPn+4K3y0KSCOlrNfRxo0nVkj3OGptM6OCePztn0CuTZMaX
	AIb/yOdcksC2JNMTk7PpAPXEWnNr5b+bzgMKvG685NaUzOP5M5zEKYfSSbeoXzuyou7QanMd01O
	E11o8f55WTblkIMQKI1LwdKpECugsDviZ6JXHs2jqTkgmcepH8eUwtuWc1lPiM7x7Rf+76efgF4
	Wk/fPuU+Ds0bHbTLHSoU7q9u8s9+wU95HtXigAMJDbBN5uI62LwO1ZmZ0NOIec8PIRd20=
X-Google-Smtp-Source: AGHT+IHuQgPCjwiilqr6hyBHN1HkSgQVZ6NN3lKXSTWrISePYNQxZTvkk1unNl5fT/qHKyALjSw5Og==
X-Received: by 2002:a05:600c:4e13:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-47d84b32f30mr35819795e9.17.1767797354005;
        Wed, 07 Jan 2026 06:49:14 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f418538sm99516175e9.5.2026.01.07.06.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:49:13 -0800 (PST)
Message-ID: <5e116c9089bfa8d645eb044090a75523758c6743.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
	 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	 <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>,  Akashdeep Kaur	 <a-kaur@ti.com>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Jan 2026 15:49:13 +0100
In-Reply-To: <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_064916_097454_9B4D4E7C 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue, 2026-01-06 at 18:25 +0100, Alexander Sverdlin wrote:
> > =C2=A0	main_mmc1_pins_default: main-mmc1-default-pins {
> > =C2=A0		pinctrl-single,pins =3D <
> > -			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */

this is a bit trial-and-error, but maybe you could try to add missing clock
retimer/loopback pin for test instead of disabling ST? Would this help:

			AM62AX_IOPAD(0x238, PIN_INPUT, 0) /* (N/A) MMC1_CLKLB */

some SoCs from AM6x family seem to require it even though TRMs claim the de=
fault
PoR state is the proper one.

> > -			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
> > -			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
> > -			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
> > -			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
> > -			AM62AX_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
> > -			AM62AX_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */
>=20
> All of these have ST enabled on PoR, according to TRM.
>=20
> > +			AM62AX_IOPAD(0x23c, PIN_INPUT_NOST, 0) /* (A21) MMC1_CMD */
> > +			AM62AX_IOPAD(0x234, PIN_INPUT_NOST, 0) /* (B22) MMC1_CLK */
> > +			AM62AX_IOPAD(0x230, PIN_INPUT_NOST, 0) /* (A22) MMC1_DAT0 */
> > +			AM62AX_IOPAD(0x22c, PIN_INPUT_NOST, 0) /* (B21) MMC1_DAT1 */
> > +			AM62AX_IOPAD(0x228, PIN_INPUT_NOST, 0) /* (C21) MMC1_DAT2 */
> > +			AM62AX_IOPAD(0x224, PIN_INPUT_NOST, 0) /* (D22) MMC1_DAT3 */
> > +			AM62AX_IOPAD(0x240, PIN_INPUT_NOST, 0) /* (D17) MMC1_SDCD */
> > =C2=A0		>;
> > =C2=A0		bootph-all;
> > =C2=A0	};

--=20
Alexander Sverdlin.

