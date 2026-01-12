Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F6C9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTPyq4qlUQ/a0K+OplfgSv+5dHeytyE/LkETuVbOzE8=; b=jtnJKYW09+LHuTwKSUYHnYAOaQ
	4h5nsbUgWwKUXNuzotlPa950P658vF7ISWANP/1fYSZsLMr/9eaM0nWFHOHaYEwJjjL+8JQS+9Sk8
	H16wwiPRtUsyOs35n3ywQbsjuuQYN51Pl1+/VR1FB2CV3e4kp1bDEpJnoCHyJyING9npiWz+ri0gy
	hoRDh0axh77Q1jv4jXrvfo4i/6bIGFLZrBYsDI0d36eQKtfAM7ExcnXfM9/o8LvfwYTm/LTxhxUCz
	EnVruQmSshvTYORz2ZQRi5kF8y95Z0ff0wJpicU0P/9LlXOFWGlZLkpsH8aI506KCn3szq53+oJwF
	5BkaoWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIwb-00000005X8U-2YnI;
	Mon, 12 Jan 2026 14:30:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIwZ-00000005X7t-1e3i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:30:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so6800807e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768228253; x=1768833053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTPyq4qlUQ/a0K+OplfgSv+5dHeytyE/LkETuVbOzE8=;
        b=NfrjWWXxxWShzxRL0FqS2+1tbDtaJX3pceZ4tfMBdxH2Ay+F0TyO8cRKwhU+pikawd
         aa3+Pu/glE1iLMK2QrSjTJqcG30W12X+EsM2CfFk24I6iS9kO5xBzVarISAxuxCBRhZf
         zdzJQgVE03YtU5ZQFGbzLd/MCzX2HZyceWCKxW2LLr+XlfbWH5rnzsuKJqYAAHWoOWXl
         LWbR37S6OCBBQU+fqPzrMSooqD3Bh9HzbE3dJJl75F5SMUE+3A8B1e+vrLxdxwBc2/DG
         LQwhAncBlsk9xe2ng3w6iiLjM7pfNG08zSWXypF+bq0129hJpRW3efxUDKcGGh2IScpM
         KZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228253; x=1768833053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hTPyq4qlUQ/a0K+OplfgSv+5dHeytyE/LkETuVbOzE8=;
        b=b0OL1DLcpchjJVRwXC1vq/93gMtqwR5ebAlp29lLpnOhz8FZpafeLKmNBlQbCrfBTa
         Fflpnfct3l+iEKBrwugl2OeIandS9Dg5gVBf2jpQhv8xs93QuICd+kHhTcfzKrRs/IQJ
         hqeitUNX+I6aJCdvkZMviwLbBLUWLuXtJjjv8r1SCbb3bybAF2dww+0orjR2GeEdrB0P
         pU/D3IBQM+mQHw2NkILTil/dpivY6gCNoYb6h5YFY1VLRKnzIJR97BD2IJct1ScKi/sL
         Rlz5Hr91KLkyCRGJqmo2a9gZQJpd6sFszV22yJjdpAwKdW0fiuT8E/pWR4bdZCci+Izp
         1qDg==
X-Forwarded-Encrypted: i=1; AJvYcCVe45W0p8xvAswlDz1u3zW0Qe6i5MgccVVxEBoBMTNTVzyjNhNwDxolw9AN8yLzEXDZUTvUv3tbGVDwrtMGmB+y@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj2+ryF7ImbMOnY0luyVeizQCYafIPe91IHRT9M2gll/XKF7ND
	QWrdyZ7arE5F/eyNfTV7tocvw41nByIM/VcpDOMa9m5oQ1u/5ULOat+UhmVtwkUOCj4LfesH7SU
	Sf+NLABnrRc5QMiTEpJGW7muS5WgOB0I=
X-Gm-Gg: AY/fxX41YAO0FP+8Qv1A7I09p4osMAl1l+JavvpUyJBxFt0RdlxITvbGnUX05jQ9kPL
	OkSI6V1eu08b51mgXUvOCavGiC6KTJV2CqrUJlPzwRKPjdglzS3onjwSEQuzpBblYuh54tYwqL4
	KozuNzRU4e63M4jUPFkQwlq/TrHhI57ciWCqNTIc2cF4yaLJ1ITTsqh988zTvT4CkmhxkN/FJSh
	1ImaYjf7hmaZ7DjoVCLQerzJ7S5G5jJ7jgyhjqjW7D5sSglrDZUb+yvfFX5TZExRA7THsM4KGAR
	ZuvA7QD4LQvv/osJ30tJnW0So4g=
X-Google-Smtp-Source: AGHT+IGhCigRJCKOH/vexrtNg3kMW3zuAFzjDSpfErMZ4r2e1dNLwyfSgC/4Mcy0Fr3nxXSWcmYmpXz0yuQkJp7TZZ0=
X-Received: by 2002:a05:6512:2304:b0:594:2dbb:723a with SMTP id
 2adb3069b0e04-59b6f036a05mr6764776e87.39.1768228252123; Mon, 12 Jan 2026
 06:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20260112135612.465325-1-daniel.baluta@nxp.com>
In-Reply-To: <20260112135612.465325-1-daniel.baluta@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Jan 2026 11:30:40 -0300
X-Gm-Features: AZwV_QgTFcA7EUgW_TvWfm8Y1HneVz72_jOkyFz9DocTNUhPwAxWA210gbistJM
Message-ID: <CAOMZO5D_YMfsPpqB4zB4iL+ENO1X31Go2CcBdK+JcmsaZ_HNNQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx93-11x11-frdm: Add MQS audio support
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, haidong.zheng@nxp.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063055_433490_117F445A 
X-CRM114-Status: UNSURE (   8.66  )
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

On Mon, Jan 12, 2026 at 10:53=E2=80=AFAM Daniel Baluta <daniel.baluta@nxp.c=
om> wrote:

> +
> +       sound-mqs {
> +               compatible =3D "fsl,imx6sx-sdb-mqs",
> +                            "fsl,imx-audio-mqs";

Wouldn't it make more sense to use compatible =3D "fsl,imx-audio-mqs" inste=
ad?

