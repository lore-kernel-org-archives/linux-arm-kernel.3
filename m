Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE4F94CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=; b=ggWJf2AKOdcoDcvHF6ivegqAZs
	lq/cfuQRH9fKDv/MJq4zXiRc3y8PkQBeH2qd2G8M4q/b+HZCQXyEYnSVEjFG8VyugqRPT2HHTseMX
	vTMfY/au+IfSxXTAPFYUCrvGRZsoGKE99RonB4jxsrY331jCw8rW6JK0mpISU9jVGfjaiDIqv0SeD
	LHk84pGSDNjdBFwlKlUqBhQktpM5Xk6GZ7tFA356MyveXIpRBpgsgBS+tA71R6U8WjKP7VFd9u0+k
	CXkifCllExxWJQK1pNh6ebq0OC5wqgqj/IoUPDKL5GEdtj8oz0cHP/I5ExMzxYNjiCCLsTjgsXB6k
	stI7DDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHNW-0000000975p-1A3F;
	Tue, 21 Apr 2026 20:07:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHNT-0000000975A-3d1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776802041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
	b=Bzp67evSAFNdGjXCnc0ONJvN8s/pt0NBfXJOXMFKxJ7jBKHVddINxCeo/GYccIcpkz6NZR
	4WX25r+wTcdd6qWCSqMUTZvnKAYoDk5HwqBiZrgw2BuS2C6ZeeGmdGOMi+fz+/6tXrN7fW
	lezp2YQ/Lpt8Ju08GgmEzGnm97bFHD8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-exb1mkmEPZWSbGfhBEwsmg-1; Tue, 21 Apr 2026 16:07:19 -0400
X-MC-Unique: exb1mkmEPZWSbGfhBEwsmg-1
X-Mimecast-MFC-AGG-ID: exb1mkmEPZWSbGfhBEwsmg_1776802039
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso21550056d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802039; x=1777406839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
        b=tLyHX4tmr2o3WETRG4KipN9z0nZuc5IQGpNZpJbtf+G670ZiQEpTfeiLWGh1UBFbRd
         /yqtjyEP4q+JZaPjpH+tzeYldj8XeQ1h31GjWZ6qsaddfpjRhco994b3P0Yg24PxHxHe
         c9Mlby0YbiyH0jG/CU1TgFRs1TyxR3b8KcUd9Lcu/Asz38F3uBgg7rLw19MkRM2RiWTQ
         pMAqguyg7wEpD2N2vukaxTLvv+9nq01fnwePEbWuvBsEunOk1qLgbxXKrBW+7FZO0Ybl
         3qR3VVfPWxSqxTd+3AYgR6wZI5IyyrOLxly/HpUSKNtQ2DBbOJ1nxuTZ3vcT/DxaFp55
         cSPA==
X-Forwarded-Encrypted: i=1; AFNElJ9L65Dq+IB4SSjgs+Y+VV9hadDqx2zgVB8aW189FIogbvEitQnGfZLXPiCB0PbINFJf5VJXb4UqO/F4++4meORV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0mFE1KLA0X49qqCn4qfDv2BxBfoJVVPs+pt9HwyB6t+qMLf9/
	9MCdwEkZ4CpCzsoqz+Go6l4RdaCNdAPpFonmpKzvJ42vAqNe0SUiFn3hMWCSLsJj+YZdlwTYjPl
	s6WmRaVNin9lzTr92eLUBTRFvfUpIWSjyKv4hZr7cwl0I1Ag1aesF5OD2OtqcfqdCSyNnvL3Y/+
	0O
X-Gm-Gg: AeBDiesa9n0zQAvsWlHWXIPIINehXwldGVN1goCvaDya1FJdn8H72hxsaR3O+R17nQ1
	9vCSEKZtfsOA9fVM/dArin5WUqprz0NX4Y4q0FTPw9VLT+vhdBuXcJvF/5c4SumXm4a+SHdhIg6
	7o/Mzob9Tr8LpqMoTt3KLhC3BiwIinRQRZB4AZrFFrgn5ZJkr4MGUlokYczzTHUsZvZGr8wPLB0
	F2OBIuCBQsv+dVikrX2ZVGesoJsOA+XnG0TxDZwdQMK/J/WPulju+Clj7NKsC7Wp8+qZtqSZ4JB
	Axq6s9bjESbivxn4MkS13xavMI6Lkryz23NZIpYhe1yRTYW+9TWgZBGrk/xeSUwdK2jf5Xcmyhl
	pR2qybIWZi/czUBnaN76r67ieaRqMc3S1G95/aNSuiQ==
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id 6a1803df08f44-8b0280d0e78mr313218066d6.26.1776802038972;
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id 6a1803df08f44-8b0280d0e78mr313217376d6.26.1776802038427;
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5c4b9sm149503046d6.28.2026.04.21.13.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:07:13 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v11 2/4] arm64: dts: s32: set Ethernet channel irqs
Message-ID: <aefY8WGCuNr4BQG4@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JKyXX99wfS8QofzEHQsYYq9mltDxjwBfsFPMoqwX7Mw_1776802039
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_130723_998653_5A79C8E1 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, Mar 12, 2026 at 09:55:28AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

Tested the new channels on an S32G-VNP-RDB3 while testing patch 4/4.

Tested-by: Jared Kangas <jkangas@redhat.com>


