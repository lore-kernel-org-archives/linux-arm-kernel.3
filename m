Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C707D4A617
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5nXkknwo+0TmPQcwS99jRHRtVkofZG2b6gSRD8S0lE=; b=ByEnTOgQpnBq+1eAGolUXisBcW
	a0IsshfvHTPIm7HWUvgZSq+3QxBCZ+KvDO7LnDVGylMIH6I8BZRi9Kb5Nq2RdQvxxnPoccBXFv9qQ
	8wo1Dz7PDQJAC14wH78P8h1DDARFCgROtHjQ/JlA2NV3xaKxvJUhm3+fTZqkv2Eu7wF0e+AdwHSUn
	d24u4VNzCQi8KTUgWWOs5vDNBDRGVGvBHtvnYs3oocULcVRevPiTcBUwDvvCn8AtgLTWRHAk+EUcO
	bUsCibX00q8cGTpnXmspnLHwViDZmAHSyQ7drdtQP+jj95Qsv9miz3VQ8CDSUJJqyleB1+M0NLFb9
	VhRj6u6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgg6q-0000000DrMw-3DFw;
	Fri, 16 Jan 2026 09:27:12 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgg6a-0000000DrLF-1Zzo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:27:04 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1232d9f25e9so3391801c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555615; x=1769160415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5nXkknwo+0TmPQcwS99jRHRtVkofZG2b6gSRD8S0lE=;
        b=DyMokJN3jGggpaSlrheQJMy2CLvGRi0Q6lEnAjyV2cVbljX/PNSbqrCYU3xulPPGTw
         S6xvCLR5+5ZkZdum5dcz8LgcwkYG0DxZIDoGuc3wNVg4sTwG27v+FfaxbqAyxTMjGeCv
         qpYr4/f3X8qhTswdOFDqyEmp/a2ZodTNDlfzj/bNvaooEoBUea5LpOh3tWWBcIK1cMyf
         30B+1j3pywmIUrajmjXcim7WuRsnUvsy/IVmjG9/nQFD8lVKR+jIbhoI1/Ot9lvaj4KY
         lSiqgd/Za44IyiZoTp+tHaajasBzaLI/U98j4OoxyKyWCqF+M/uGcUiMhyFwMXYKXe9T
         4l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555615; x=1769160415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5nXkknwo+0TmPQcwS99jRHRtVkofZG2b6gSRD8S0lE=;
        b=HNaDLG20HUi1Fygnlnebap++f5stKs+w/1C1YdPcWAG6ebAYseyv4bznXB3vFOh52j
         99yAeazSMFTOwk0d+F1EvUFUICvKeepIaqavkK8zLZ67pq3kLwZw01FZsuVigH61zhoS
         0jVBg9/zuVw3bVe6uuQZHZOmDAhumIOEQru1bx6Fusi+s3Ih62PtOVtJCZ0HwjYo1ioj
         dN+9aBz6SMc/yRfKyrjXnjoifDgvOoz8C+1Jyl70HY4pjY3kWLYs7ysXtHZPl+KfHXHy
         djTUx/v59j2LEnw5nVue+ly2JNL5PuvrqhKQTILn/95Q9jFPxD2+FedBZdsxbJZfUF9G
         vC7w==
X-Forwarded-Encrypted: i=1; AJvYcCXHzLi1aO1zJ9VSozq2YB62af87O0z592cp1lNFIdN71Vp81BpmiHdcy5mfLlGrcKcVKUGHMVFz6ROVt7ScajRY@lists.infradead.org
X-Gm-Message-State: AOJu0Yysw1DS7MqhaztbUEiIeyRIUCd2Fw0XuYKTcrywK/bta5CqZkxd
	JJihcU6AN/yyAabSVX1BOaKGP/vRXPXqrYB+hd8k1bk8ogjouCYJYWF2OwpDeCXI1PJkj5p3DdE
	cKC+kLiWD6jRgT07dhzUApiCY3j6jyDc=
X-Gm-Gg: AY/fxX5HzYg06h8US6PxUGQ1avpVrKAE7hv1LNxY2a+LssEFkOg1ztF1nMa4PB8LG0C
	P+Lxeqi4I69sfgZ/763Qw2b1AsrUmtAeQ1olfA/zb8YWOO2waMz6TfmiKfJXvKVbdAE49bHtn8M
	QRexagvu4ximg56MqTbaAIQ/jTk0TL28COGe+fmD3EpEiGhuDAsXedH/h5bnAtHEJCxlFz7JkUZ
	C7W03vmn/vFZUhu5oI16MZeYOC2dHc2YtR34+ixJiBLAow0FZ1Riddd5gjYZzUF9eTdQe4R0lJS
	qve4s9QsNOln9GnmU+MGTEBBFsxcC2nR29VHCHd4+dlS4molXqYONyuVxcIVQyVdXHLd24OpxrJ
	YF0kITH8KWQ==
X-Received: by 2002:a05:7022:b8d:b0:11a:3734:3db3 with SMTP id
 a92af1059eb24-1244a769e03mr2330673c88.32.1768555615390; Fri, 16 Jan 2026
 01:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com> <20260116-imx91s-frdm-v3-1-98671de64925@nxp.com>
In-Reply-To: <20260116-imx91s-frdm-v3-1-98671de64925@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:29:37 +0200
X-Gm-Features: AZwV_QifTzULMtGjkjSS3S8CC5_mhR_1WSH4xBiT1nAYE-It9I2PKynf_0a8WPk
Message-ID: <CAEnQRZA0TsOdttpZA3DGb7xrDXuEJp8PQTC3d1tXFQGqdY3SJQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012659_605751_4366BF53 
X-CRM114-Status: UNSURE (   8.94  )
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

On Fri, Jan 16, 2026 at 5:46=E2=80=AFAM Yanan Yang <yanan.yang@nxp.com> wro=
te:
>
> Add DT compatible string for NXP FRDM-IMX91S board
>
> The FRDM-IMX91S is a low-cost, compact development board based on the
> i.MX91 applications processor. It is a cost-optimized variant of the
> FRDM-IMX91 board, with notable hardware differences requiring a separate
> DTS:
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yanan Yang <yanan.yang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

