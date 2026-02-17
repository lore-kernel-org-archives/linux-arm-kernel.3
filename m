Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327ACE9A037
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=; b=RCILslKKFrX14OWgAiC8POzoEp
	FOJIlApqvBAI5+nDPQVg3RKCBIUilS9R6fQj4SOh5HvCdBVSS85nh6lgtDpzYSA7gBW9tOKgJa3vv
	Wr/oH6cVUgvNsOpluQMejyzD6ctqJc82bAiSczawKEyJv1rRVWoHlWsm9j4AS8+JV4SSLgiMv3KWw
	l2Ga0AUc0T5/++uekNrk69ZOye0ULaUryghwan3MOkJmwdxhjTQw5dRhkYFxxJMRvnkGUez40AKrF
	K+Qb1inFmyh3J5JsAbJVSyKmGur+T/43roa90uqSULUg9rCoeBQhmF/6n/7OM3mXpQlgVolAS3EcD
	gd2B4NmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQIX-00000008mBI-2EEn;
	Tue, 17 Feb 2026 18:59:49 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQIV-00000008mAw-3BcB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:59:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59e65b8e268so4142547e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771354785; cv=none;
        d=google.com; s=arc-20240605;
        b=JiEJbXivwU3YxFrOWY8cZpRxTV/PieFqL1gs5F3JSIl66dPbveLGmANck+RrFTpewj
         YyVcL+4PRZUxLl9HEdR3XUECXkELB5uVGByuScI65lAZ3j5u1dlKiqsLipHcq+Tp2ZXP
         K5/u/tueUv6MqYTpiNVs+gEb8NgSWTlVMYJMIBR7uiQ4n0nFanBrvhFFIUQgzt+9q5K0
         7oYEtM/oFirdMw0kcr1JqcfWPsiHebrZpXyB4umUT3cEx7xJKx9WSF8dwm/6oT3Qo5Wr
         lzLwJp4dbAwxSnDxvnEVj44eBIWad6JMMyiM/vKdPu5Zlr0V4Y0cUagX7g4JqvG4baZz
         pBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=;
        fh=fqKoFUFM5r2IWNXqvHhxncoHp52oTv5pUOPn9C+WO/Y=;
        b=dQnX4F0ceiHVhYIK+O5d1PyD+HkFqDcikS0gpgvNS50V5V6zrKSB7oIX8gqRpsV/hi
         cIC/pGGwRNnFbtuZnT+nbm38lsfXMGu8Jiq3CDRNfhTuIu2xOvlZ6LuQm/VXjKsk5CUI
         MDFyktJlnc8Zxje3Vob7W4AAMmKl38BlPSY65dOn/kit2QL/GlAbhZ8yNpHM46VWkiXC
         ydhQUw/DhIBAIx7gvvyOO6oq8NgMyuUcazrNF4eNoVHuMKZ04KfMnUitUN31xPmJ7NBr
         m0MacW7axmfSL9ypsCPIxrT+oGSDlW87jTnmrk6Eq9LARRJ+0hPmvHswi3P9Jvm47XGb
         M33A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771354785; x=1771959585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=;
        b=EcjE9QI3ZyyV6DAOSUTDVpgEcGSynUU9MvyzvgWzZbny5mWulH0w+Xxmxl3x9m96eE
         Uz40+SEAtRJz5rlRuK2w3+t5Kj1zHjdoXgopSbqn2EyWhnqglCZKgbFjNBm+imAYcXcw
         31bVLrC51b8kViGDwpGImiIi/WmCSwyQ9e0DMVQCs8dGerjmYYLAbRFdepbJCP18Ekwp
         xUMLwkUMkwca26Uf7m8+9EIau0UKvsqIPrAHCrPCvpSAamejU1F25MnvhTImSjPjcqOU
         2emAxBFIBVi+uwyXqTJzQpHLskxVrarxoAalxyUwJVVVFHwPsThqmuXMBBZgVIUWZEBt
         kSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354785; x=1771959585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=;
        b=bCE/HQtcddTk613f0zuJnTD11CuO6CY4LSz5RjKHytYDTrbr8DT1sQPbBKLq5Eg0Ta
         M0+7aWHztEEWF1Ir3UjuujTuOjRxRiIaRAruS/uMJTc42PPEcLKFpQRAfjIpVNCl3tE2
         OcbA7rJqZiLd9eQ+o3ySahnxO/wDk6Yam2loPTLo0LbENwpsFb+P0ojMZJ5oH0EMrOZ8
         X+PCPbt1p6FnBMr596+fgDf0ENVD33OHp7JCE/KxMPUNqZET6T1Tw32u6wYna7sibS8H
         v0YvPjck8DK9GRN6fBXntohP7Im7by6XMhN6IZlwqhMdIosmoIR/YfXkY6IhwmrDU/zQ
         GIjA==
X-Forwarded-Encrypted: i=1; AJvYcCVjed17pgcSQB2Bi9VvYKPO2K/++yVmaVwxakpwUsUcHeZqSLTBIfo523sFdbNCVR7uKXP6EpoI/sDtakcNtpwN@lists.infradead.org
X-Gm-Message-State: AOJu0YwDsUvAt9rqroGQd4QAuS3eh+9ZpoBBtyELKF8TyNLup5EX3juk
	H3nwaO1Q3Ixji0tDmJO4LIYR4Uijci4VHWZFjvwYyn7LdIoEtMF/Isa+GMYuWbGh52lFxuid/F0
	Byma5yJxL9YZHULP9bzj7Arqn2QI0tpEfLw==
X-Gm-Gg: AZuq6aLDjK+IUIEMqgfnA6OqKttnRlU5JnP0xfLgf7f/364BC/+nDffvstsCNS7fp2b
	7i4yte7ip7tWF65eHqHageIY0J+4NvKSWa2TMl4GcekTR2FgdfbHQHhDaKZdVZJ47aGWNKeRui/
	nPScO8MZYvcaZkTopWBytVtfCD51VJc3N82yfLbLmzYASmA17J39QMuC/BIGS0eZ8nru/zbcuwW
	H1G947gSm4UkFdlR/5Hsb0P4hIW1/WdBGWfoMH57cYHVr+PtmXJ5xttDdW5TcrwMgAc/WPV1wa3
	D1j0XNGeNMXwzBzAvzGOwGcg8bk0RqL4WD2nq0ZhCTn+RaNpTQuLUEgfbwsEP6USbuXjjrU=
X-Received: by 2002:a05:6512:31c1:b0:59e:478:6423 with SMTP id
 2adb3069b0e04-59ef97ff31emr4493222e87.21.1771354784796; Tue, 17 Feb 2026
 10:59:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771353301.git.stefano.r@variscite.com> <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
In-Reply-To: <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Feb 2026 15:59:33 -0300
X-Gm-Features: AaiRm52kMzrAsjUxh-2JQc8fxA8DgYgxlgW7re9ZloT7Pc8JEqOscwExFoMYpIE
Message-ID: <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_105947_819264_C288F0A1 
X-CRM114-Status: GOOD (  11.83  )
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

Hi Stefano,

On Tue, Feb 17, 2026 at 3:43=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Update the WiFi and Bluetooth configuration on the i.MX8MM VAR-SOM
> to match the latest SOM hardware revision.
>
> The SOM now integrates an NXP IW61x wireless module. WiFi is connected
> via SDIO and Bluetooth via UART.
>
> This patch:
> - Adds an mmc-pwrseq node to handle module reset and power sequencing.
> - Updates the USDHC1 node to use the new power sequence and required
>   pinctrl configuration.
> - Adds the Bluetooth child node under UART2.
> - Removes the legacy Broadcom WiFi device node.

What about users who still have boards with the Broadcom Wi-Fi chip?

Will Wifi on the old boards stop working?

