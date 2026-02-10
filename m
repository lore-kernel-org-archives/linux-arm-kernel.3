Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA681EA8121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=; b=smat5Rhz9rRXrmMmuDr5M244JK
	+6l4nERaTKh+v1ALL1vbJEp+wnB68Rm5fYy5U8HVeuYfE8V7XsTbWiTCTXxKhwFEe62//E7NAH6Qh
	WY4FdBo6UgvUZlJ6SrqxoEI9jF8O5H3MAq5sNNv6gDPBWi3S3KtjPKfkdViUDOoZ6TM8NrW8F4SNp
	J4HZBqlAHW+oB4WVBkxmcYgi0MXloJezc/4cCxbyYHjM8nYQ0sU4pNdBHFK3wdCBz/Ju04D6TeDD0
	J/B6X4ONLvnh3FvQ7NaXkBTfVVljrHtGaLAyfnxeGxtxPT3TIROUAN/ZkZkwkZxs0nbcc/v5frmnK
	Kj9pzBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpob6-0000000H2b1-0op5;
	Tue, 10 Feb 2026 14:20:12 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpob3-0000000H2aN-1mpH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:20:10 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1271257ae53so1041699c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 06:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770733208; cv=none;
        d=google.com; s=arc-20240605;
        b=iy9cAKs/kbvCZnc0DZGsULzM+oRMnE4/VT7MUiSWErTD1nCXb5WVZohlPkSe2VTB4u
         vpDcdfIIF+Ysrr5Iq3TJerj4W4UZNeMT081koOEEhVBBab5BkkAAFQ2UNo4SxvnbdaQQ
         c9WuiIZv3kcjGasWerLQ7vAMm9WqiHzFSOfYgNxEGCaybc0nGU7ME+zPOPk3Q3izhnbE
         PqsgRsU+YVzucRhN7FK1oREBygOf9t1eLWOivcIWCdAnkcFEhXr/1+JGcbGQXdnRv0WH
         Clrd2idu4aEKuYA99vSUyIdPik7wX3TRdAFEuCrISu8X9jgNm7Rglp44Roei9qBFkZrr
         DTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
        fh=FLmNTjK2ShCssbSQmsLVsgEATxlahg6W/yY2XhkRbgw=;
        b=BSPw6T+dPzncjQU0Kqe41WkvqyhkLm7WnW8gHeEUSjlTG1G2oU0wGKcTZQ9scaWZ/X
         YKGRf8RE6uJPfemjV3YnyFEfIylr3lsViEAeo//3iq9+cdAufncSjIEqQso0wx1IZyne
         csVr3pAdsjE5FoemERQ5a8R58BIwBka/feAimof1/35R98+A9qGS8dv//T/YnF+W7IRl
         nuDMUj58aYu2fYh2M9NFdEQZqod2vATUlJX7AZt8Uw9KitXpYTTDWjiSD2aly215Ojk5
         po2JB9djeYqrGLBdQu0piDVabv505zsSuFuBp6Usqbjb7NQmexsYng5/xxQs5/zRdkpb
         cpSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770733208; x=1771338008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
        b=Aqvxer/ymvu1FWg+FO0635gmtsLhm4k3E9hW5XL8eMhDMGh8NlgkBoUJRvJJ9afVlp
         2CgXGS6ry0gjkBg/V/9QKeYZ8iyu3J5jf9JjJjKoWK4znDtKJpJSIrxGkzgwIYCTX7Ig
         jOAmi4rfepf/Ekdq2/UW6jm6oz76YY8BMZGjM/WzXrqfgG/xWauRVgBpWw+fW9bbSc2h
         t5jPNkeUw68vskvZd3lTK0SHZdqkf//AbuvnH/IFpI1GExGZnYmVXK/EY025jYCJW1Ss
         fndxFKbzr1mnTtxHL4j55Ryo0Z17mjTk/WsZX885A+0brMjOLybqzi4ijJt8IBFqelot
         wlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770733208; x=1771338008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
        b=DOSbdOsInAMThcnDTI/2ngbjIWPUeUB7nW9eEQRzCgD2OdA/iMB4hEc2UsZoRVM4VY
         AkuBHSo2IwUBfCV7y1gVrweu3FtK88hSByWOq+xZhqKX9QMZfQbQlYtHxpsyQN2DwSc+
         cQeC9kXhtRu49eMZW+Wo90PXmKEd0LQ0Hj3b2Q2ou8W+9d279JkcbYf8W5qRkap/+pQu
         qcHuNHQEtf1bPu9nl3uqQfhK+A6cCboky3GgLxxOewhoKGrH/fl0PjUa7me4GYpwumIe
         MqtR1Bpp6ZDFPjwwb1v8PPjhLDKWiDxImF967fvlKNN87BpP7CAzCEQsOu947RIGvfFt
         Olkw==
X-Forwarded-Encrypted: i=1; AJvYcCXp1lrGnJ3sbI6UqblONoaqLenDc8X+G8/y5pvbks3//PDNiLqO3Rn6xlXujU21aDih/pDs0hUcOQwNKAdaNdJg@lists.infradead.org
X-Gm-Message-State: AOJu0YzG/Z7OqrzU4aW+C8wo9O4YaHVoqz+znsVssm5iHG7AC19q2Bg0
	/KggNzB1h7yDX22ZH3t7Lh3/n8ySZgloN5BU+I0qPlSMULJXTK1LbRH2Rtkxds0R2c3Eibjf2pr
	Ek/P9VVhNCRkBoDOBYr65m2uSqTjwtgg=
X-Gm-Gg: AZuq6aJgQaU5KPTEee4q3Abg22WdJXuVgYBHK2lgbODA8TxehDnkGAKQHzJo6RCaoOz
	10l5aS5JW5rHyxRb3sAWy1P5kY5G9mjOqvvxjrXqBIHu/BrcOvN9PyevbbSBxYNNrwgkEBrOw9Z
	41KeIOjt0MtU7fcJQIsPxB2U4kMo3luVBLJyBWyh33rd2IUWSRWMvx7Wt2NK4on6Pnlo3uDyula
	jNa05rXsxTG12NLcqQWfQmMR0I1ElarlL9rnIVE9oxfuviDDNzyQnrnSgfVBZu9QyP4iiSqplnB
	UC7Nu3bbSHqFcn+c9SXKNudqaJ5rkmHrdZYIRbci9KjDDATXJOxBUNyrZKAxOBYGVpij7p71wcs
	S3ek2umH6bcVmiDllqqp8kQ==
X-Received: by 2002:a05:7022:699f:b0:11f:3483:bbb2 with SMTP id
 a92af1059eb24-12704010c61mr6241858c88.12.1770733208182; Tue, 10 Feb 2026
 06:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com> <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
In-Reply-To: <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 10 Feb 2026 16:22:51 +0200
X-Gm-Features: AZwV_Qi9nzL8plrh9S_oCJOUxLkKzuCBMraJPAzRuE6y3RzYD0VAbIX8BlC4J5w
Message-ID: <CAEnQRZCXwJUz5rw0dWP_rVbjw=ianqADbjXaX=fPvmMY+C6KRg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board support
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_062009_467549_A4A9E1E2 
X-CRM114-Status: GOOD (  11.77  )
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

On Tue, Feb 10, 2026 at 12:49=E2=80=AFPM Yanan Yang <yanan.yang@nxp.com> wr=
ote:
>
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
>
> Link: https://www.nxp.com/design/design-center/development-boards-and-des=
igns/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-des=
igns/FRDM-IMX91
> (FRDM-IMX91 board page)


Tested-by: Daniel Baluta <daniel.baluta@nxp.com>

Used your patches on top of linux-next 20260209 and managed to boot the boa=
rd
using serial downloader and rootfs via nfs.

