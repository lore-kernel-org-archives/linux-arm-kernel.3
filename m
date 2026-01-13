Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684D5D29DF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koPjTBX4iK9OQ+Ff94Uc6fblTMyD4uSDXtmNeEAxpE0=; b=tuAFSBPf2BHXHcoNGSgn6lCSqk
	5xI3zB7WugbL73WJFZxsJdKJAPopBGHpRK7tdiQ0eLXRDx5Gtyse2rShorp9LNTJx/Oz8k/EFaFaw
	MGiz7MYHljMw4esyb6weeVAGbmwYL1+u9gzrOv+8uNiDcjf2ymGCkIVrRMvQrflQbdJOQbq78vaq0
	cK0CeIplq1qDHGHJF74f3bXTeJupugNDalY0Pub3kNYZVSD7FG7Y4I6swAy6GNXsarp0qM195tEgO
	QZAvxsE/ngEzXV5D1o87CApRCvhMXSeMCcLxvFwFnFPge6gjB/So6zZaa5nBCPIWWGdGT+9dEG9PR
	nXW42SdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNJ-00000006nkf-0BYq;
	Tue, 13 Jan 2026 09:07:41 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNF-00000006nip-0BNS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:07:38 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so18390782eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295256; x=1768900056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koPjTBX4iK9OQ+Ff94Uc6fblTMyD4uSDXtmNeEAxpE0=;
        b=WlWNNS8BQQ9ToqZN9972YTYzE6PDC1hi1nXA4lSFm4KdCXMxowIcfMZ22emyqgcyo/
         Dmhqh9y6MVfDh0Mx2HNEyrtRK+4dJsj7Z+t+8okPqQBkp3cowgfQZx1T1clP7skjKfA2
         cnjtOUO6OAH1wK5avE96MZlngIi4enIFrOksc+YHth7AdfvfiIsNztm1RDG3Wu65G4bS
         r+c4JGOkZE4vOHLRytUAfTEUtPCT0DJKMig6w1MZ6cfnvkulE1eyKnI2uk7BZcj8wsC4
         xc7vjzqnAfWjQQAVwSJ4zc0I+tG5vxysHDdiEvGa3oEKwbESAmHj3cN0cWxwLcLoAwJm
         iifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295256; x=1768900056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=koPjTBX4iK9OQ+Ff94Uc6fblTMyD4uSDXtmNeEAxpE0=;
        b=T66kQteBBrxd+04/X5rrwdggRBO0JKAS9XBZatyJqKrEgP2QN9VhvLo7G6ZATM97pl
         +/SD71MfIhOY5OCXTTtoSFHOAcQauavmOXs6mCa9zCxeYqumg1Ts4iPBG9n9cpKk546f
         TBi3UqSjaI8ro3M7AB2PM6e6l3A84FgZ9jBUFW7wA5tkfIQq1meiW8p7aiywd7KT/AsV
         T9m8LvyqpeJdIqjDL7SoxJ5pQpbC0Nzcq/kNcIdtbnIZm7doFxjIQKreyIMAf9tgkLOk
         rVpUBAbQ4TktY0bVMDp768Vy/cLvBO/H3iX14oykW1Ef3ZMTJ3FILSModIEQUD4GOHbc
         nm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUz/ZtcnzCe0Aui0bPkfSYTTNxuwuaeoE1toL7a9upmn0jzoVEyv7agdz40f3UgyINslBsiyBj+NEr55UdaRM8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx57cuIyWeuX2JN5mOqzoUEoZgMhVU4zZhtvEkA56KryyelGU7F
	3utOhlbmbXp34uA21RCmVH747RcoGo3NCjEK7NggJ2tQtCi+Dp6fmfOQolkWtg9VSLnnSk6JO3w
	vtkQgNkJRcKJVJ5hB9Vt1HGQzSuOvcH8=
X-Gm-Gg: AY/fxX7tPNhBLsZa5BU/pAm0jUsWkegadAQAgAcZKIfJU7HEZXwdj41OzKJaL5aeH7U
	t5IPOEM35ykXh1ed5UZ/6wf2N8kDOlWzUexSs+bk6p/i2yO3Ezpz9uXiDFzd7oaaowzpIijKt7H
	zdy9j+SBkP/w58eQOQQ7Y0YvwWe5pUXzSd8ssjwTgFGXQocjNZ/Hb+vq7dQvsu+BfgN2vzWOOYs
	yAy/I2tIJ41ZQgfsHXfeUQB4zJnlN9wWMSCa4o5eVtJDYEU4QcLsMFzX68FEYgP1wQ/xhGqNpeo
	AHGMVEbflxSwggMyV3ZWWoL/LTIrRarNRH2uUb4iAzWaImC5MJN0rQskzU5RAiUiBjetdhZG9qN
	ZKyzVVCOmJw==
X-Google-Smtp-Source: AGHT+IF3RX9nAlZTR2amE9GxDzDwPqdE7Cjqqbe7GDtDpeVioGO8As8gNYcnkAyF+8R6p5o6StJOxLoio/8dQb2c+Lg=
X-Received: by 2002:a05:7022:43a0:b0:11d:f440:b758 with SMTP id
 a92af1059eb24-121f8b450b3mr24817667c88.25.1768295256086; Tue, 13 Jan 2026
 01:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-10-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-10-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:10:04 +0200
X-Gm-Features: AZwV_Qg-q7k5jyzvnB6ALn27XAuNQ9bYa59uAz3y6dRfMLXSzH7lkJ4OAjmRmcw
Message-ID: <CAEnQRZCKAfhDT0p+MFjdZ+bLQJad1Wm6YT872FXyWB63u=zegQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: imx952-evk: Add nxp,ctrl-ids for
 scmi misc
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
X-CRM114-CacheID: sfid-20260113_010737_078589_52D2A5E9 
X-CRM114-Status: UNSURE (   8.26  )
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

On Sun, Jan 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add nxp,ctrl-ids in scmi_misc node for wakeup notification.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

