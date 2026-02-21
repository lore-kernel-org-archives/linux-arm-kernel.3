Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5409C61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=; b=QLTRWh8fwDMJu/iLnCeJwblaGM
	zxuwf/arOmSCjQJU01TTrfnQBQ4MtYC7LnH7OmibB9hlONRQICb14Vk+nwlmsuA0c0NQshJJdmZVC
	iUFiaUwNgyu4mw/UyzcSmNiII+tGQfn778fiuq1fMB5luTAhhp3JDzZbPDTjT2NPslbArtYCRECwM
	ueAj+jUV02717cBYqdMss6B25ACfkDrMxokQmRf/zYAaaX/g8DBKoDT/EewFWOVc11Xml873NNWF+
	L48hi88P+iw1VTOsgnxoUVRTFLYDh5PnV0jW0vN2nzNijYZm4BiiS5zeZs7+VdW3uzje5oGziXedR
	g8q1lCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT8-0000000FwfN-2GyR;
	Sat, 21 Feb 2026 09:40:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT4-0000000Fwch-098c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-483487335c2so26125295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666804; x=1772271604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
        b=huPQk7GywpoxTTTgyzsRrWWGiXLcqb8Lm6+6kVgVLSF3/FCIRjMvoZVDSReexuAoQZ
         zOXRtguIiZxOD72VB7Nal24A7fOwQ6Pt5bXramF6UrcDIXT/NY3eaDq6RrUhKTRQeTz1
         uDLrymF3nNvNvtGkxZUqRSpNDIeULhq7Itl4BaDGs3aiu2gghCrig8XtSxxN+nnZagVq
         T1qCg7/9eRpJ9D7Gg6sT/Dz61hM9V6VLyVdS7Bmt2wBNLuxFSlFMymTdtiICMCeSutUD
         5V+cl+TTV3FEk+Rfh0tHSlKjJ8cfpOUua3aUvG9tfg0HvEhiQct8tEJGgx3dV3vr0Hre
         nOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666804; x=1772271604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
        b=oz02sT8aV9kWnDbI34aYcKUed58jTsLfcdg2+3f96e6Sk4DN4PhXabFZwCYY4nTwIu
         O5LZZTw7mrH54rWaBU693Gi+KUIPc14qUzs4i8ri7e8SWmO1ZW4mvEEFpA9l1mME/axd
         ww7kTGH1+vglD5ecD66cAUesR6AN52ONfXHJ9qxH+EKNisGul9SVrL0lsX59ygLcevqo
         PCvsiZ32R1eVgHOA8v/C+B1xUSFIaJzEk2dhQvmtH+YrAGpfhgHYJ7+pLREejo/yO4GF
         GekbXtbpu98j7mYXotp3U/KY6AfqqJUmVkHXwW95DUzY4UaUufO0868TgrJZAtnkocjx
         TbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU21mYyRazX4szfbFnunChWCrlDxXKl7wdaGHQkmqPrRd2GqyImz86CtNmFsW47fr2fJQtILSr/fzclP8Wtey0W@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+/qPTuL5kKfLjeQvn1vjlxbPis4Pq+fxva9nLHHbHDaA95uf1
	5Yq3p8ZZ0nkvBC2kPA2pX/DXnBDJnJxogWlDFu8cryfs8LtsLMGUIs8/hO2YXlNw
X-Gm-Gg: AZuq6aLwimDFua0r1oKVrmiCtr02MJxlhWPknVQZxXa9Wd0jVJgl01duRHKh76Z4wm+
	WFpDclOtJ7RNeX01HdhVTXLSiUFVN023y9SEq0nVt+z1VUVwc4ToOJhvwAjpJixSaZuCz1+KxJv
	1oTSz8auf+dI5WLrjobIociw84zPCjte8gi2iTbhoV3q0/TWtrbOD4uH4SeJ4YSzjeQP+xfCOCT
	vOgaVK4XHk5MS+K8RSp0RzSE5gAJbo1cs69lswf7RhvYoMgKf03Faz4evPhdjSrDJcw34C7wAaD
	WVWqHYltJCQkP7/tzKshVRZ4GAfukSJXvXGygE97XlpjnPM1i1+ZePazt02tr5HPrGWsHFBrfhF
	jAB4aGZXAthjqXj8f7zYSXolIYcgJdPUmW3c62M0WkbKzAlQ30QbT9GUlnsbPdasOFXjgf0+hSr
	JmzFw8QEgqNl9ixQUC7OrYo+IHJdKuop4vv7Pf3Ot/wtG27Yi+35n81OhPVwahlwVohnz8Cwar9
	GMs2XdZ
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr39989255e9.25.1771666803563;
        Sat, 21 Feb 2026 01:40:03 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a316eb08sm143975255e9.0.2026.02.21.01.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 5/6] mtd: rawnand: sunxi: make the code mode self-explanatory
Date: Sat, 21 Feb 2026 10:33:01 +0100
Message-ID: <3396446.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20260220161011.999642-6-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-6-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014006_082656_D26DEF78 
X-CRM114-Status: UNSURE (   9.39  )
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

Dne petek, 20. februar 2026 ob 17:10:10 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,
> the reason is not trivial to get when reading the code.
>=20
> The explanation is that, from the NAND flash controller perspective, we
> are indeed at step 0 for user data length and ECC errors.
>=20
> Just add a const value with an explanation to clarify things.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



