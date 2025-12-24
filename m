Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D2E784A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnvkjgIQSMZ2fFgOTGmGi6iMTWpkoVAzbb+DAbZva44=; b=tZrL3iJhXogBetdyNTIItLAiwC
	PCK8hAVLqhgKnMdJ4Uih1A78zTGZU+l9uHprHmlODxB+nO94q1cyX2dEOzXjyVy+tb1DR+NisdDPV
	AHi/oNPwVNsdrt2N7qt4d2hKMWDcXyN1MYxCU0blzp+kbRW8P4F122owtEQfn6VcOMQGB51+kSpKp
	qJiEeBHw6CBEtNgj5MU7Kc8lCO1axfgG4cdQDVUp4WWPlOllnlO/OnoyEZ6duZvAW2tia28BN0uMd
	ujUqvkZX3vVOUeuH8mU5lpNusbM0WskXN+nxeOaRK06IyDFrj3ZqX69QXi/hx7f0cqtWHg+jFCMIj
	hOW4XZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY3Z-0000000HU4y-2dl1;
	Wed, 24 Dec 2025 23:14:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY3X-0000000HU4K-1LqQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 23:14:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a137692691so72381895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 15:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766618051; x=1767222851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnvkjgIQSMZ2fFgOTGmGi6iMTWpkoVAzbb+DAbZva44=;
        b=mAdJTpj3fntBD3onzRz0SiCkRshwfdj9VIQhdnjGOThSOtRFuHpXQjvR+aKP294mZd
         +L+Dmyi2sQEFMi3aGk/+hx7Vefquo9SwzLj/fmEjo3HSOMd8vOVSPOrFeDELJeWVQCAl
         R0djKoD046/8YPgCrF21nJrfmQtAavJRSoyuUzez0NfAFz+3/6yNDFmL9BSOmiQHk02O
         2jU53EzeS0kU7YKuk/I/A2F5RSQxhGiYDeFBjLogP8mb3ihYF4Xub9w+01gJWRuMnGNL
         BSvPqqTSQpLQbLzymQbK+VH6IroOfNjeFNCqSJv0aLNduNUSMiQyjmCmDgxHj0Mpql8N
         TP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766618051; x=1767222851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnvkjgIQSMZ2fFgOTGmGi6iMTWpkoVAzbb+DAbZva44=;
        b=QRbGzbHcARJKJDB58Gmykkr/4IeKv8DfWxJRdG+eosO/S/ONg4sunU9bulpQGAoKBG
         O1PT9eAGLTxZrQFimC3vH3SPteBZUgWRvtMFW/tQkSHkszCDDfw+y3Raa0E81Jm1X55M
         awkw2cQn4lB7WZwB02KlLIYCL7dgO7kQpUZflRvJE3WJZlkANtW5HtCXfZOiyRf616xg
         4yQ+Y9o5XHHdH7G2qndlatf8A3EVyPC3TB4WG5qvLIKtvNkUuKH+tzoIKuQ4NFD5fRh4
         wPO7EtRjOm9YgXFi4CKD8ntRy5puHRG/mPss9xi6St4kAdLuOc1BMD1A0lB41b8Oc1Th
         bxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG8OcyP1x+zLEkI8pU//JK8rqzFtwsQupE20VN8OY52fhBJueqWO5pt4iaEsk7oM7AF2VZlFZXIHI/jv8dXfQN@lists.infradead.org
X-Gm-Message-State: AOJu0YyXMcqHI9R8VgTuLtlVPxF/fNkUmgH4/t4L9Mm1E87as1vtNEgZ
	T6Qv9uPtGKdpawJZlkjqYfPAnU+XXxO37qmIt3ATS1aLtNoRMAdEAop4txUlH/KT/UgP8lwYrl7
	X1iskbldSPzaZIOMp/sjDVKBr0Ve+MjQ=
X-Gm-Gg: AY/fxX6uqPpt/mWiA1tw95efCF0lBQF1WLg/t6LBxYT9S+bl47ZPfSbqejnptb45Aml
	rxxTzdVa6qMGugAjdo0lvILmDOQhDllXsQzjpRrlrlun3E5iH6h9Zt9Xv08NOLD4ZpWMEq10mUL
	dRvgb+EY1IoMkirLVG3WyAlo68vkTLDTxvn+F2MUKci8S1S32rwB9ktVapjNl2O89mOB2aL3Czd
	NX9WREB96ObeSVuQcX4jBSdP3b1a8Ir4nE0po7FRWoHD9bAQU05yA5Tx9QXw32nHAgmK6zi73bA
	A9CleeUxiSUeqzRqEJUkq9G4Qcqc
X-Google-Smtp-Source: AGHT+IHthi3k+zDs3P+SAzII25k4eUepCwUdMrIiQFOSCpjScqeZekCj2A3iuJPwCzJEJ7RsstWKD7g+YL5nj1HOeaY=
X-Received: by 2002:a17:903:3d0b:b0:2a0:c58c:fdd2 with SMTP id
 d9443c01a7336-2a2f2425808mr216050425ad.26.1766618050651; Wed, 24 Dec 2025
 15:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-2-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-2-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:13:59 +0100
X-Gm-Features: AQt7F2oZyQySwMduACSiQD0byJ5Z4QahdWpmskA1qiL1ybEip0B6Y600HDmvFRw
Message-ID: <CAFBinCAYWy_VFY8a=AAGpv1+7f5AkWnHk3KDH3fqRMTZfjuNsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: amlogic: Add S6 Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_151411_949170_CD5825DB 
X-CRM114-Status: UNSURE (   6.82  )
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

On Tue, Dec 23, 2025 at 6:37=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +#define RESET_MIP_DSI_HOST             93
should this be RESET_MIPI_DSI_HOST?

With either the typo fixed, or an explanation why MIP_DSI_HOST is correct:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

