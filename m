Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4874EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=; b=W2V3rWtotwPXE0cJObN8g/y5ps
	Us/Xft4aiPS2Xpumb/nXoytrHjaN0W9LG8ua8FIW0lWWTUE5j1FojOU3l4D+fZaWd7R9JC86yFgMQ
	fdo/XlFPpPYsSiRcc2c0nfr/OUWJc4INS4J7ZbKVTXC7N8QmYPxZm9J8m87HjkgxJ0rtMjiYfOr5W
	cFK3gUoWEWI1P+Ga18pwnxPGBfDqx/9VrzVs80n4yEmBSYmfApJi5wg5NVldu1gUhI4phRKC9/I3B
	dr0+yjNcAzeeYGOJOCRSK4UMFiDvH9bPnyF47k6sO0ayj/XWwXmfbqnTKII0RlmEtEYB6ERwX8h1T
	S7mmtPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aVV-00000004lV5-2Pxm;
	Tue, 15 Apr 2025 07:14:57 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aDT-00000004ilY-2FKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:56:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so5117149b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700178; x=1745304978; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
        b=hnGLmYj/tW84RAD3VWa8a9ThocyD5B0GWCA8jUun53LypwVZYJ5Gzl9JY9gE3/HazS
         /mwwEMmWS7cxRugBn819lxPP0n61Nfah6T/d2YPz0xpdDZpjqZ6wQ3l9M5rcD+m5T519
         j1F6aDao+dl+oMjAFJji6RBW+6C4ek3Z8VJU3ojhPsyIllGpkOgLko22673zaj/W0ype
         e4RYZYL4pPmJjapSJfcGD2xIuJmarSTEfHMV5vQKDPp9xsbUQolYGjMCaXhawmNG04wi
         MmQ2XqjbUTQwbrAdtQY5HFUO9w8Y62hcaxtfGNUSbqqUWvO9SlYbcXoJrRsymOgaflWd
         jDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700178; x=1745304978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
        b=Wxkpc0G89FyngnsQmP9qFSFQrrSiAtqULKUk8AOmb+zh9ivoDSkZndC1ta3ZRe1JKD
         MbFGOb2edRTU4ZTmxqFEvU8ulbs3xwtPuztQiakk5/svDXyZiItmTgpunbIUO7YELUXw
         ggQxEQdxGRxR1It+4Rjv9b2vqtjR0ByeiE07WYvIID+GzcHFwE6cKyLh29pekykLDYSj
         AG/+KNFH5356949ciI0hQ8uSIJdCCMpBqEl+rsVOKejD0o+8lddLWeHIoLHH52fi0SEo
         4OcboVEGCjUqQLqeOmEMPl7obfIwjMG9/2YI/Xf9NLEEru0249IXZRWW2ogpUm+k4lzq
         uEQA==
X-Forwarded-Encrypted: i=1; AJvYcCW+yNoeflrwwe0fhddQo35u+6njNCcNRyUsk4U24M4zolbI9vO2qZ7BsJ6wc3xvVNm5rv4Uz9Q+x7cYsap50cEF@lists.infradead.org
X-Gm-Message-State: AOJu0YzzqB10Whi/oVV2b6NCiFWF2x9F0Mdg0YLHN4W3XLNRDYB6G39I
	Hpf6Om4Bamw7If2aLhvinX3mK9+HFzw/hLM80cTkEceJLKC90CUbqtjLy/YmPBLAOpC58VrTeEJ
	rmgGnlL/5pHYPkMOeQEHG8gcP8EE=
X-Gm-Gg: ASbGncuLlgDKXQBkdXKW2fQNXUdLBEUZEXzs++CsZrzpZw2NgIquJNjqHAlOrJ0ms3S
	1TW2Txm5nsni8LFDKvxJD9Gdl1ykqwdAYGJR7nR5oo/4yR7msySbdLyuoymmS/9iAeA9vgf9VO+
	K378WJSsJ1E55J8iy5tA==
X-Google-Smtp-Source: AGHT+IG6NnOFJlKScP+Wamh79XovR7K0CPgG97m4Wp+PToKHbCYOR7nSiLCr5HD0lc3ekUswv3GSc/IBDvySxyjSaD4=
X-Received: by 2002:a17:90b:58c5:b0:2fc:aaf:74d3 with SMTP id
 98e67ed59e1d1-3084f2fbb88mr3226588a91.4.1744700178357; Mon, 14 Apr 2025
 23:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250415043311.3385835-1-primoz.fiser@norik.com> <20250415043311.3385835-14-primoz.fiser@norik.com>
In-Reply-To: <20250415043311.3385835-14-primoz.fiser@norik.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:58:04 +0300
X-Gm-Features: ATxdqUFzmx2uRpXUocIpbqqLeApK-nJ7IdkiHEJrpoo6ZYi5WSR7a6jQ2PJwfmo
Message-ID: <CAEnQRZDtHWTEHMkhd6BqtqYXCkOcAEj1eNYDdkQ2FV3a4QDbvg@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] arm64: dts: freescale: imx93-phyboard-segin: Add
 I2S audio
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_235619_571937_96CE269C 
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

On Tue, Apr 15, 2025 at 7:37=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.co=
m> wrote:
>
> Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
> TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
> provided from the SAI's internal audio PLL (19.2 MHz).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

