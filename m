Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0ABD41C2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzOUkXuuoBWn+/0sImYm2b1vQ4lGKBCGEV5jyRpMqTg=; b=g9UnAeJE9k/IKl4nv5gZysGUz+
	ij+RxVQ6g8qIMfqQbvJphqx5cYF5cpz7DC3ZuWPsVkzRxbTpqUX0mOK6shH8bPJXLLR8rb1gMwZjF
	WW3vJP9XBcR953G2q5r4Q/0O1n+Kr9JLDJBOGb0U084XSE7WDKLvRAENSujdSwTTjG3rZyyj1BCEf
	Rkd/Zlq5KzKv8qhL3fDIyKDaSPi/OCZ2g2vPMyirwPImt8hKRy5E7EVfGK9JFSVc44344+vnSyBA/
	RjDniDg/h4OukpiJxkXVFDekM/+zsPya8IqsGUQXpcxICthUYvF6CTughJ+EqLL5no6sO1Gix3P44
	pbjcSHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTfpf-0000000GarN-0Quz;
	Thu, 11 Dec 2025 12:31:43 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTfpc-0000000GaqX-0fcn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 12:31:41 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59578e38613so32144e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 04:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765456298; x=1766061098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzOUkXuuoBWn+/0sImYm2b1vQ4lGKBCGEV5jyRpMqTg=;
        b=Fw9M8PsZyuaxPTCt8SVJQmtO/ZEKbhmttjceoMbC6nIffTRNG23F6ebQxcPn29JMBO
         kGvzJOqZrupzHXAk4Qgo5k0s82XyEF7rwN/6b56ll4nuedM3w3K9uCuG+4NJjxgc42UP
         BzdXEtWi0b0f9gqvsmW4TKvFqs5V23JVDHRleT4FDtpeg4DD++OhMn56RJPv9Sq92g9i
         6P03r6h/VXT+cVPchfE8gIZMh7eySESjl78B3FaCZ6sTwr2uLBG8nx1D4bT3iAj5m4wX
         qhBQN7/Puzebtq0EBcnZae6hE0EPSjj1vTDjt2+dSg4p7RRnqu+bwXgRUzpLdtVAVloF
         Cwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765456298; x=1766061098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzOUkXuuoBWn+/0sImYm2b1vQ4lGKBCGEV5jyRpMqTg=;
        b=kfSr1QjdB0TJn3cvHWbM7FTLnTP8xE7vjIdmw02nnxUnfe05SyV6f+c6JYUmgHfwZY
         eZ3XWlnYwcIgb29am2lkb55azthDZbdfg5ZvBQXdA+Njm0a7pidJNowVcUZIq/eoffZ+
         33Nmaw3oNzKzTAmC3JoIKzD3ezFDjlAvxsjZlkPp3ZoijomwYUnWj3+mM+usp1YqyEtJ
         UUlbiqLZG7XxmTl0mAfV9pubdAthnGDlV8ukYNhOEl59RoVg+UYKM2moGFZcBhaUX83x
         C67SXVW+czDo1MTpoi9ms7CrCj2QEutjmh8ssMCWbKnLqAHH0LnySiqmlwDU6wd6NX/4
         zN0A==
X-Forwarded-Encrypted: i=1; AJvYcCULOUM98ykNf91v4IFMCmVPaVQrqEyzH5nJH0+4nK47pFVMlgeAzgJglWSr0GColS7xjHiRv39gSOSNBYJkzBaG@lists.infradead.org
X-Gm-Message-State: AOJu0YyJaGDjgUTY79Ow9sXXgudfJM/Z1S/qA9w5Q0jGpJ4BNCqDqIKt
	yo/Upj5OgumWABpjDgLzAlawCsjL59cT80r8A2z7mY36BUkJ9PKH17g+hmfDlh+5VnRAgj6EuBx
	kjFh1hvjlAuWekh/+JsIUiKF9an7EFz8=
X-Gm-Gg: AY/fxX6JXnodcKVGaR5c6+PhH4t07iu7RqlJVZmBPBN5MoTF2JtZnPW7gm+zr1BEV6K
	zfuwoyLs1UESmiRECtZrSO0XVXbTGai+wYU0/WQCa2AEH+P0jBTZLhzso+rghAhqu9FSdY6J8O8
	iuo/btXCVw7s8qJ/xUDDi+YX4wT2Nl6oC8KXA6lGpXmHMXrQTywSOsxMbrQ5CjBJLYEzuqY6/3H
	UsEEznKj08mw4ORk3G8/q6V9wKzaYsVpyAPdi/9L/7Ib/KgqDwhWqOGfN+9c9KMKJnHRjQtksc2
	AsIrDAzpZjzv7ZQ/AV3aFTcB95M=
X-Google-Smtp-Source: AGHT+IFx8jB4DP/C6ch3hkvwp/hBlfDTrjHCBEs1ezVD9RnwEVMofSDStV8tSr28ue048X+oTa16zOvCrjQLAgrohPA=
X-Received: by 2002:a05:6512:3e02:b0:595:7fa2:acd with SMTP id
 2adb3069b0e04-598ee4f3f6cmr2412583e87.21.1765456297571; Thu, 11 Dec 2025
 04:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20251210152000.42265-1-stefano.r@variscite.com>
 <20251210152000.42265-4-stefano.r@variscite.com> <CAOMZO5B2__4qgJRni=DPxd1QoPQLwO+r9ZbdbsOWXZemVU86aw@mail.gmail.com>
 <DB4PR08MB103414303516B7FAFF29DB571E9A1A@DB4PR08MB10341.eurprd08.prod.outlook.com>
In-Reply-To: <DB4PR08MB103414303516B7FAFF29DB571E9A1A@DB4PR08MB10341.eurprd08.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 11 Dec 2025 09:31:25 -0300
X-Gm-Features: AQt7F2ogc3apjlXRADhBz8DDOhM7cjdSocB2OVTGdMTU2QG1NnJjeFWnNeR_tbs
Message-ID: <CAOMZO5Aq8iO2w7MsQz+BCNBsCUEewApoU=keGjSpFMZzSwhgyA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] arm64: dts: imx8mp-var-som: Remove UART2 console
To: Stefano Radaelli <stefano.r@variscite.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_043140_226938_1CA662C1 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, Dec 11, 2025 at 5:08=E2=80=AFAM Stefano Radaelli
<stefano.r@variscite.com> wrote:

> you are absolutely right, the Symphony DTS needs to provide UART2 (and th=
e
> other interfaces moved out of the SOM) so that users relying on
> imx8mp-var-som-symphony.dts do not lose functionality.
> For this series, my intention was strictly to clean up the SOM and ensure
> it only describes what is physically present on the module.
> As soon as our new V2 symphony carrier is ready, I will submit the corres=
ponding
> patches for the Symphony DTS as well.

This means the series cannot be applied as-is; otherwise, it will
cause regressions.

The move of UART from SoM dtsi to Symphony dts should be part of the same p=
atch.

