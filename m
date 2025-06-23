Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27996C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=; b=o5FZlMO80qajo1IfK7vjJR12Nm
	IlkKpuvjYjnLGCllgnWA5eSrCDC684MYGOTge6beLTOnP/bYOVpr/+BvhEgEFyKN6tTcxAyOVlqe2
	dkyReeyLfzbNUNMurv52nk4eWpdbZHlks2Q48SytCqCZ08TLZfukAYKH0eTVw40AnjqsZcXw3hPa3
	8C3dUURf068cnXtNF853Xwk5adKBhRJYemQjd2bDMqiu1xKNqhi6MwpR3JpXONXqgWXKlHsOPsohC
	gjh+n9QfHkKGl/wYYckMhUSd9sV4Uy5xDbXDS57iAgpFWLd0t+EchBVxrn+fUwpGmg08XfrldsqLg
	/mz8rF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZ4-00000004Etf-11DY;
	Tue, 24 Jun 2025 00:31:06 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgj8-00000002n64-0kSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:56:47 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553b3316160so3079057e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750683404; x=1751288204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=;
        b=Kv8/QVY4+42dONCLDhyH4wk6VLpygPVo8LYlAfE4u6tfRv6vdeNWHhBVsDhFBz6Qd8
         bw7L45cKTJRMssbHq25OfHLCdlgJXcdUgC9EP+MYZRXeelAL2tvr7Snm/QjorP3tgwCA
         oX0W93903IiIdOx8mjpvZM25YVWmQOlXE9ifftDy2XYMpmJMBfTTmjNrwfo8FcKVAiat
         lExEmQzv7viu0PeI2yqaYlUNeH556x2nqks+WzlcJEwsd63QhNRLUS70iSgvk803T7gW
         jaqdW/jBYAA6MKgsi/9OC0uzZ7cx4H62vPhO72rk+NSCEUP64n0Tu5IBZTlFhBZMGULq
         cjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683404; x=1751288204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=;
        b=ZKuWUgkVRlr6XPdJGlJWaD5XpzxwjmIT7hV7yc+XDPDym0nRHuzcGH3XC8JQeR4BeA
         Y4j6IZLwslY0eWDeisS2yY7SvB+T9+mF1280130ch0rJDUmEdmrE6pJqnnGsmLi+r1DK
         RNUZ6dHoCbhcMj+wvxC/E/Sk8qX0jTnPa/hg2zyPYWLpaYBzaXcrZjARsJLLSa2EwYmN
         351hEuoHIVcF4NA5LtkHcgIJdgOhh1wPAm2+p48m9bPuW6HfythwrN8Te9S7bovUsjMF
         vNYrqZ7TLTDqk7U0P8MkuYjbs6aZrvcSl+j8wn/Aw9tJ9XI0+GzFt9eFSAQxPKjhf1uq
         QitQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+EpARhVveGlU18qKvJXxnJGFubrYJOhs6mtK0EyYTtdWNbfMQk4YEZImBSPFxsyLRquw3nD1AImwyS0gbFq8O@lists.infradead.org
X-Gm-Message-State: AOJu0YzdHBkAU6yYb92LcqZURjzoD2qUfuBbVSoA2IB7+qRI9rPJGPBE
	z4Ln25BdWgOrTzRlEQ/Oz/3tVZpm6S4+jLuz5H6o2gjhPPtkdmLfvA97sZMeA6UaTyh0L7bCbbj
	zdiRT+qOAebJqYNGN8YTUTDEYUrbXudE=
X-Gm-Gg: ASbGncsnK3riQ5X5pcWcfnyrcoMHGNTNWZak4jFOvs+xxYDv3t7a0Vg/kVfDqxSAcB1
	LTGXJoONXZKIUHasq++otSZta4PwDcm1Fl9EPi/2ZQ8OIurTug+lWXcIMHq7M8qdWpeDW57TFb/
	7VrEbewmRYccDt7aU++EC76c8qOqIrP54IvzJKIuOvdpj2/vCL7zgyU8SCoSCD4hbteXjcpxFXB
	mg=
X-Google-Smtp-Source: AGHT+IHVX0GlIPq3TBaQtLm46YetyZZ0s+N9/Y4hGKlfh5oMqO78Ds4mOXk6wiprWLKaWnye4Cex5x6r2Jq+usWNPy8=
X-Received: by 2002:a05:6512:159d:b0:553:ceed:c85f with SMTP id
 2adb3069b0e04-553e3bb4cbbmr3113374e87.21.1750683403609; Mon, 23 Jun 2025
 05:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250623095732.2139853-1-joy.zou@nxp.com> <20250623095732.2139853-9-joy.zou@nxp.com>
In-Reply-To: <20250623095732.2139853-9-joy.zou@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Jun 2025 09:56:31 -0300
X-Gm-Features: AX0GCFuGOUHw2mx0QPMnuqMm-hZkSD1S0Ck80ClMf9fqxc9r2EVikPukaYObI_I
Message-ID: <CAOMZO5AzU03qEg80vhyU=CrgVgYt+rn=WQ7SphtADxOc5eG5tQ@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] pmdomain: imx93-blk-ctrl: mask DSI and PXP PD
 domain register on i.MX91
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, 
	will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.or, 
	frank.li@nxp.com, ye.li@nxp.com, ping.bai@nxp.com, aisheng.dong@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_055646_215212_FCFE746C 
X-CRM114-Status: UNSURE (   7.38  )
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

On Mon, Jun 23, 2025 at 7:00=E2=80=AFAM Joy Zou <joy.zou@nxp.com> wrote:

> +static const struct imx93_blk_ctrl_data imx91_media_blk_ctl_dev_data =3D=
 {
> +       .domains =3D imx93_media_blk_ctl_domain_data,
> +       .skip_mask =3D BIT(IMX93_MEDIABLK_PD_MIPI_DSI) | BIT(IMX93_MEDIAB=
LK_PD_PXP),
> +       .num_domains =3D ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
> +       .clk_names =3D (const char *[]){ "axi", "apb", "nic", },
> +       .num_clks =3D 3,

Instead of hardcoding the number of clocks, what about using
ARRAY_SIZE() instead?

Like it was done here:

https://lore.kernel.org/linux-arm-kernel/20250619062108.2016511-1-xiaolei.w=
ang@windriver.com/

