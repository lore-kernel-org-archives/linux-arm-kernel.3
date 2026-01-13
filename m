Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B094D29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFAe31p8PPO4mtj+DijEpW3hOfltqumeq8By/+jReis=; b=ShXVowgi9HVJ9WceHumTWmTM5q
	PCttyF+EaZXByL5lu2YHljolhYxyO5Kl17J+zaqayPMqGkAo9KWalgW0GF4rY771MVyHe//20m6sB
	FwQLjZuZt7gXMY61U6GAdrukfYuE/M6jZtbxJlHJGomtLQ7ILk1puBsnrwA3tssRUybgOWin5ahIK
	V20ripDtVVNDMRXkZ7B6IrBFE/KIzy5BFPSnC6n6H+qO60l2QZ/rwYLhonzRzZkXGVHFr0Mn0z1uc
	Zv7FwejbrCveSJ5wc52haTNPvE/F8n0d9lmW0q5KsklUroWi/2pefSdIUdd8owofEgbqHLjON4NS9
	R3+Zrqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaEd-00000006mxl-25TF;
	Tue, 13 Jan 2026 08:58:43 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaEY-00000006mwl-0xLG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:58:42 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-11f36012fb2so9579365c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768294717; x=1768899517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFAe31p8PPO4mtj+DijEpW3hOfltqumeq8By/+jReis=;
        b=kYrtpXvbOTb5VjKUj/bQU8RAJiag5nqH5C9A8J/ankknhKkTgSvICbXDc9b6NaEuEA
         FMKDrgaabpSPwR5N/flqx0ZZl9hqIwlVThyd5qItMIe7OmeopwkTLLNCOmoOcWpXbzrv
         yGkkA3Kp4wCUaboI3ZwYSaP+qUp3JvK9nvwC5B6EK02FRE9WdM9hr1mK7ORoB0lcXMuX
         5Y7TwOuhRTmkYaATbmTS0DxQ+gW8xsugRppV2z86y1LXz++Ezcxe+RTCiREuc2p7PUKC
         bqKSYYVWUfi9aK6RYjHVW+kS5OmFDwVG6UmkhMBL3LS5XUOgWgDHXUwurCKHmbcBbUsF
         83oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294717; x=1768899517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFAe31p8PPO4mtj+DijEpW3hOfltqumeq8By/+jReis=;
        b=wAPeLxnYTK5k6X/CAxsdju392AuyIrJKmq19ZMKF29S5BX+c1nbgd9asmSjdngmoMt
         9Ow7FSxl6uMaI0p+GzgwQY7Rgd82W5GJRY1VMyQVkAqububYgy38u882J5VLuY/juKPK
         svKmwb54aCZxhq38iC4uiAGqEAuQaW81xUfMpEiVVj7jZLZodKzehKPzmm4ZCh/xX/AL
         Zw/BGMOUOF/PSTb8EuLC7EDonuFDJw5OzxScatPr2NQ++51t4g31ODQasycXBMMKeSbp
         s/AemPvAH6Vee5EZglwQGQ28/Zsm//WPJipMopIsEW4HWJC/De3HwOEWQRqO+BVviHCh
         6Xww==
X-Forwarded-Encrypted: i=1; AJvYcCXebDuWvssknYKNLRSU77IH77aKaqW5FaJJsjCHki/4O/AohggfQVDJRBUbi8xePhqCa/fLjWpkXew3jwwgr/3i@lists.infradead.org
X-Gm-Message-State: AOJu0YxyeGUSFDburSvftFkHB4Dx/t3sZqQf+o7ZWrU8fGkONuNh9wlM
	leKnpXrNUgUhZq2BmFl3wBG+KJLuaGpTUVKjrdNhN6pFqym5mafauvJwWhXq/d3IOZ7Zt5hSkVx
	Tt9RMCgiOmimiw2jLCNe/pdHGOFZ2WsE=
X-Gm-Gg: AY/fxX7rKIKWYapT3k9b17ldbnpnAR/O6VVHPpy2zAZBnMNMVfkh4lvXPeLEq3l9fNx
	EuizVwZ5N4ePUJBS8k9L0f3CTxKT4bJG96KLZCbFG+RAd8kPG1paoP9Y0S8Bv+c0X51jLSz0nv4
	IrLEkHY6qANaWMHw6RFFifgDrNh/hrEO2OK2Z96oT4Eh0vnA0zXBTu/95gblOb5rFz8EebGytIG
	W8EES0cYLGVohtOswpc06+4fZk+0IRYSxgdRW5YThbixd3QsU4yj5LUahJ3OOPiFqfcE70xcRXa
	r92vHhvHRnAmkK0hL3Kq7zfMKpG1qeKpeToY4JI8dzd2/IVcKEjzy3/RGSBtzXydzY3mPyySz/t
	V5axHe7MQKA==
X-Google-Smtp-Source: AGHT+IHiFhj1SBZLl1zt634a7vOzJVi0cLQ2+ekOBzZnK6j9L0o9kjlibBH9Kh5FRme3B2cB/y9gNpIFI0l3hUxnOM0=
X-Received: by 2002:a05:7022:126:b0:121:cae0:a843 with SMTP id
 a92af1059eb24-121f8adce2dmr17795472c88.13.1768294717350; Tue, 13 Jan 2026
 00:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-5-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-5-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:01:07 +0200
X-Gm-Features: AZwV_Qgo7fPdD9gHTGPqvBycw28dLEq2C2vaqXtaAyuZNVr2OJaK4dq1mXPXdQ8
Message-ID: <CAEnQRZDc6nbGZt6jzFTYv3VrS+HvcZ9uXCYOGm0XKR7qWSLQbg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: imx952-evk: Enable SPI7
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_005838_263897_11FFECC0 
X-CRM114-Status: UNSURE (   7.75  )
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

On Sun, Jan 11, 2026 at 2:44=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable SPI7 for i.MX952-EVK.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

