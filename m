Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC57FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROpiUW4nfnLvf/oMZJYn+0lH6XwPLhFaln2Q/2PDHgY=; b=k/UbV50C/ftlg/cStIE3q+FlJM
	vCOKxU7LFJzE1pzGH1Mk6nQGJv54mHJ9+pLgD/cevW4i29WohOU8HLwBri7D8I6A9+39y6UvkxX4z
	hwJsAq2sa2JI8yn+BgfSvyf4pk5Ux8mwlqlIe5VYy6uTNLvrP+tQXD6d3F+bW5YiiL1xoxKVnkoNh
	r9WdvX76Rs7gaSOPfvlcqvrLFZrisdn9WiGQRK3kCoeTn7RQSKAlxXY7AIZHYl3ttX1UoTzXoLq++
	htBXTCjGIPLXamZt0cnvrpINQpHlR9AE23fDLtDhEgxqpyYcJBqzDfxjbiJMTwK058PRM1OAIrlxw
	AJznJ8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzxz-0000000BOJJ-1DRZ;
	Wed, 15 Jan 2025 09:45:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzvr-0000000BO3g-0k2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:43:28 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F4KQfu027304;
	Wed, 15 Jan 2025 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ROpiUW4nfnLvf/oMZJYn+0lH6XwPLhFaln2Q/2PDHgY=; b=C6gJ6kMX9GRMYrRv
	J+drCTKmogjD+SS+6zgBHoc8JZY8k6MgXz1lUo7GJj+gm1IZlIkKMEMu0FYue3/F
	one8F5Sfvh2rFNhZQrRM8tEB4nDdFU9RbFqXk2GoociJMPQOJPyFPVKU2c5LenO2
	BPSgqEXUd2yERQD34otXyuBXOYxpz24xSj39ByPImUiIDZOGDx3eqxUCkHQTDjqc
	EKkEgwjRpVCKQjGGTPcVebvrMYv7VUcGssIBHT0Y5kMo8o2DTbX466jp2GFRY6ua
	BiVVxkcUxTncCo+ZS+27FdTYZsYGTqydWHXSnO4N4ngiusIqzchMQ5gR5BkBXaIQ
	6l4FUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4465weh74g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:43:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 353C040045;
	Wed, 15 Jan 2025 10:41:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0E0C2481B7;
	Wed, 15 Jan 2025 10:39:44 +0100 (CET)
Received: from [192.168.8.15] (10.252.20.5) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 15 Jan
 2025 10:39:41 +0100
Message-ID: <e60d2c600133df2202bf3187eeeb9c31bc6c8f32.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use str_enable_disable-like
 helpers
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
        "Linus
 Walleij" <linus.walleij@linaro.org>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans Ulli Kroll
	<ulli.kroll@googlemail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Date: Wed, 15 Jan 2025 10:39:33 +0100
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.20.5]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_03,2025-01-15_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_014327_505691_B8389EBE 
X-CRM114-Status: UNSURE (   9.46  )
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

On Tue, 2025-01-14 at 21:36 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.=C2=A0 Ternar=
y
> =C2=A0=C2=A0 operator has three arguments and with wrapping might lead to=
 quite
> =C2=A0=C2=A0 long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
> =C2=A0=C2=A0 file.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0drivers/pinctrl/bcm/pinctrl-nsp-gpio.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
> =C2=A0drivers/pinctrl/cirrus/pinctrl-lochnagar.c |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/nomadik/pinctrl-abx500.c=C2=A0=C2=A0 |=C2=A0 5 +++-=
-
> =C2=A0drivers/pinctrl/nomadik/pinctrl-nomadik.c=C2=A0 |=C2=A0 7 ++++---
> =C2=A0drivers/pinctrl/pinctrl-amd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/pinctrl-gemini.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++-----
> =C2=A0drivers/pinctrl/pinctrl-stmfx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/pinctrl/qcom/pinctrl-msm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-spmi-gpio.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-spmi-mpp.c=C2=A0=C2=A0=C2=A0 |=C2=A0 3=
 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c=C2=A0=C2=A0=C2=A0 | 10 ++++=
------
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/pinctrl/stm32/pinctrl-stm32.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 5 +++--

For pinctrl-stmfx and for pinctrl-stm32:

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
Antonio

