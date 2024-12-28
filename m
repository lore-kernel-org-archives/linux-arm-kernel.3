Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8D4E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 22:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=; b=Diw1EhcMMcysXtA1KPpAQUc/hC
	Y60wN2WXTIA5hHzH00ZrEHhYP79nL4yIbtBYnahY0siwrsRFQ2g8A24XfK0eCowDsZ8NnUEF90tC7
	Ge5qbdk4kqBgiK58Y0IvNqZi9LFiRSOsrkqUjo91mXB90z/mKtXKFFsYhkvbDlAaJdL/pwF8omZ+e
	R4M51B+PPMtP8opLCCmIIRHn9aEEufS4oA+z6sCEQbBdJfxmnahvOqACrBOJAaLb9/0kwNGU8F+Vh
	jaCijVZBH2C0HwKSeQdlvR1lf6Y7N8ZfPOJIZhcGG1+PgGgCUG6ZR+slPbPmMLmmj2+bFlhdaKgpN
	/G2n4VgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfkl-00000002VcJ-1Y1Z;
	Sat, 28 Dec 2024 22:57:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRfiw-00000002VMU-1lYH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 22:55:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5401c52000dso9482280e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426556; x=1736031356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=dGTPaX8m62OzyCFzmHOiBKCnF3x0b5EL6UllEVXoQ3xL3cJSWmVesntHVOFj/Taeu5
         Yh2LH/46tlnpTfLt3JYIZZB2ZAn/SKFFw0eTRvRbwwC6my9rIWys7L/CRUU59K0Ay04k
         70fbhSgUDsYsqjWcq3XUkR7u4Fj9SZ2ghbj120+h5UMLZs2BufquWZGxEJfoGe0MnOWN
         9iT+0DmEAEXYx/j704JPpPA/ua6SlcZAKKjIh+VXBCPPL4bv4YKuAh2NPFMzBkSAeXkJ
         oKbaj2ayZIoV1+So4i7SeFJQHO6c3/qySzPKXEk+YPqBifmdeCFSVO0zdRgLKJC/geC1
         ktEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426556; x=1736031356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=AuWqi9G8F5bHpTIGBS1wE1cpRKLEDoTtirSdl9ffgMaqIEPDQ4kd3lvynFAmupTZpo
         Isg/TGu/K1YAm/y9wFk4MvqP0Ldve6BsDRf/MqznNMcw+vhazDuF8LfwPpDJMQlceWqF
         GmQq/vJrCFp5MmL7WzLOeHOVdjh21qKGvLfc6GWowXS2MR9YTCGIcR3hPQgNN/og2GXG
         SXbF7nTYvr5v58s6wPdh9NprNw/FNZrvKFP4c5nC5e2ThmijizDatVVmVftZwxfmfqbr
         4gqCi0Vv9b5rpPnzynGr+QQq3sNsiR66CaF7QlJC3vHHBK6HSQBExQeZHJHxeMQuNVDa
         3HiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg74BZOYRtDKHNoIH0t3rcjhnk7Su5tTq8WzWthqFafSGI2etFLv2vPfp6wrHxbSI9GCWHMgwvw/4ukdzk5cUU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5S3+g0QkbfUY05Dw5zbucRn0wZgr59qs22aljb1EPdkDVt5D/
	7au56+iGjw8CaXY1gXzc5/WjlyeymPbCsiChFHUPZjAR4ekQUg/onDXd3YSZYglXtJmZk7yZe2J
	cJszZRB4s+uugzrub4BylgEHOJ+YwA8/RPC5vNg==
X-Gm-Gg: ASbGncveAWwny9oBq3KA7TxuFN3JGGmvFsrcpAVW8kQpWprDKHPtCmAzDA5pRVUyikv
	7+EiMUJ5KIuXu80ILXeMMZt9dQTF5BfhJfhfl
X-Google-Smtp-Source: AGHT+IEOcI/QKkD3AUBydUx80A/BH8Zb+xNHEVzuo3JP6PjvydFsYRRsKbYFCgVkNWvtDpuRPklRSeHgUyviYhKsrpU=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr6848917e87.42.1735426556517; Sat, 28 Dec 2024
 14:55:56 -0800 (PST)
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:45 +0100
Message-ID: <CACRpkdaTBSpk7wToj2TLS1Tgj2cshuSrYgEm4bj-WmFSVohYoQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] rtc: pl031: Use resource managed API to simplify code
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_145558_458941_378E6BDF 
X-CRM114-Status: UNSURE (   8.22  )
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

On Sat, Dec 28, 2024 at 2:16=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

