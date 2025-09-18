Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7117CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=; b=Cwtf5aefbnCpglP3Tci4cHjaJ4
	OgZ1aqUdB7twlk3SSpj3MEcRkdYGLKPHBUk1MxmmrlZ+SXxIDwfgVdyYlkz2B2ZoLCc9Ubgl3gbCx
	uXxb6RZCW4o9UNTe5mj6CGCTQZY48qFUwEY/eBoKsVdDvcc70qRUGfl6b1iqJMB4pgQXbyqJKSSrJ
	H66dGJa3+IEDHtMmPZadoMSelfX3aBKToO1aYCBz1SYyyzwTqy/CyP2o1misvJOL2bbRwFcMJ6Ihp
	3Pko+ZX9BCOWiD/vX3O3WqINKvq8a+R6PwLrCwCY0HRxMC/owaZbr0WYTLkiMV0xEsGMO7XfcDg70
	LanPaXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDq6-0000000HPjU-1sKm;
	Thu, 18 Sep 2025 12:34:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDq4-0000000HPj7-04Iu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:34:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77b0a93e067so867597b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198855; x=1758803655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
        b=Z4hOHApruH6VTOaxBGUVdkARaPc0lrkSBTEGOuRXk4U3hT873t8bujF+ufCjPZzfjz
         6S7u2e1pTGOZRlRkitgH8U4lze1+NXKxY36k6YKJJZ8c9Vb/Bj7YJcqF8jkkHu/eW931
         75U4j5ayuwIUgaZb2ZduIzppOeCqBMiaXvZa+fVcetvy3d0l4+Exs3Mpy552vyHPoW/4
         G2LBsvNGq1gYlNQQUDftX5+ABLdD/chc8doPXe31EqaswW+VaJFl2XL3VTZkHwzPY9bR
         6zhbqp39JZiDWI1gP6XDS2lWMhCcBG2O8Me13Vm4l74HUc4PqQyC3zS7LW9G1JwDeL2U
         VI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198855; x=1758803655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6qpj5dO6JqT1sJImilQ9anmY7mh64RJpsBsVZ2KLxU=;
        b=PUlEOc0o7bYd/R7ZHorM/XTU5pN2cpZ0itgIYCa/X/Bd38IAPQqNTalP54Z06lDOtT
         X1LcxDTZFZHSdeXPJDBVuOhvkHNleoEu9W6HEAzgF9KItaz0RcP0O85qoNN+oTI+7lrp
         hnVLKkMxU+6/qlL+EyDgqSKW9Bnl7sHNirBcBAqC8wGJBEUGTNo8v1R4R5jpn9+mmqKt
         BTF1CVd/81kBa8BpJJY2UMX0p5DHkmuN7MKDOWutLC8IZrfeeilzq5Nj2WXD+teTXo6D
         RYzcQO19xHZ2SCmb3v3rDrxqRdW17oXXOcORysvNb5BZySwt6TpmqCaREjffJiWbtBBK
         lFrA==
X-Forwarded-Encrypted: i=1; AJvYcCXoX8NH32FK5+e7/cVq7iNu6PytasYlUbtBWjT/9MSHKQoI5Ba5TihEJ2s7j4edIrCZYyNlAr0ztz2nsSBcKTYj@lists.infradead.org
X-Gm-Message-State: AOJu0YwCiIN+RNsn5FI6eSbav6QCK+OtwyIA5IxeOHmAu5MTNd1G+E4m
	yjoS4ST/nL7/F8WloTD/IqES4/3QbeygcsgodLhQBlzG8o1jhCASQ6DXW5udyLDVLSroyFPT1o1
	qg3Peb24SndLUQaTqTMUXAwCS31m+89E=
X-Gm-Gg: ASbGncvOLxGYlhwksXIzTu39m5YPHOcAHsN1L6mWt23qCbzms1qlo7kUDiBOiCaSIf3
	wMo9sHbvzVRSo4h3e1vjstHeIbKO/ChWJMu5cyaMNIJC5Z8e8Ze/dzVZQNSYwL1q0RYGs+LBJTe
	z0Opx05HR1Qt1wj9xreFXUHZoQD1CqulNjrTrt8r2FDGtJmLWLK8pCMe4rK80eOXWPN62qdFTCa
	W3dgzof2Q2j34M5/br9Jo/enHOY02xc1PBbvLuAdJEMZ007bDDMUnq4hD1tvEhkXQ==
X-Google-Smtp-Source: AGHT+IGnwyZAzgewsFS8BUxGi1+hNmSjaadWufVUdwqAGCS8aqyS2HM8fO6whTlbN/7oWRWldmq3iDfdXt1FIzoF+PM=
X-Received: by 2002:a17:903:3c2f:b0:24c:f589:661 with SMTP id
 d9443c01a7336-268118b963emr75488845ad.11.1758198855204; Thu, 18 Sep 2025
 05:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:36:33 +0300
X-Gm-Features: AS18NWDAzLMXylSrWYdgmw06GR6oKayTLcqLKRKndzdOYMuF8YWkd9yOlAi8pkU
Message-ID: <CAEnQRZD9XGSzYBYMF+0G9RtDo4y-RtX2n=5M9p8Osk3csYrbLA@mail.gmail.com>
Subject: Re: [PATCH 2/5] remoteproc: imx_rproc: Make detach operation platform-specific
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_053416_055512_8EB4CCC4 
X-CRM114-Status: GOOD (  12.10  )
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

On Thu, Sep 18, 2025 at 2:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Refactor the detach logic to support platform-specific implementations vi=
a
> the dcfg->ops->detach callback. Allow finer control over detach behavior
> depending on the remote processor management method, and make it easier
> to add detach support for new SoCs.
>
> The previous hardcoded SCU API detach logic is now moved into a dedicated
> imx_rproc_scu_api_detach() function, and registered via the plat ops
> structure. The generic imx_rproc_detach() now delegates to the
> platform-specific handler if available.
>
> Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

