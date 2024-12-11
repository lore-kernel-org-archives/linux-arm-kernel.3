Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C73CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZChbzObT8yiyu3oc7dwGuAXjmHiQ0fUscqfsIIfuVr0=; b=bLj+mO9XX5uTCx5ONTqZzHqD3s
	xCSrCJEiZebXFwBB/9czNsM6XrRQrtdrnWcJ5vQu5kzACYeH4GSiMEuGw8DmthZ3ApeMdMXpsOlug
	qkd7OaVR+g4NVOE70xdH7IjjjgeUKsk1Mdh0NU6Ok7rZcTafnGbMLY8uAMekshLclWfupSepFuCKa
	TnIx+jLiwWYt/iqVQ0r/aU0fnybTJgFdCHsB8hX6G2Om+id6B1QabYaq4CIeMMYTWVEDXCOY6SQg9
	8hQeMHnMUQPgAARi+4K6YOcPbZjh5zg+hRT1BkljbOjaxD6/qawfHrBgo8jocWbumpmgbOgkvaWSO
	X3l5dnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPAW-0000000FNDN-1yWX;
	Wed, 11 Dec 2024 16:02:32 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP7K-0000000FMY6-1pi6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:59:15 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3022c61557cso27593371fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 07:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932752; x=1734537552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZChbzObT8yiyu3oc7dwGuAXjmHiQ0fUscqfsIIfuVr0=;
        b=g9YaC/5iVaTu5/hFGnseIPpTq4cYpFmJa5VkT/Nb/2v4gizF46wakSmcZ15XJhE7IX
         LzTnkyBnlu5jlMnoPvbqYYk2OunaZnn+u0CfSFMYXuQiph+hsg7AcD3ik+wOD1KfQfJd
         7PJO+sL0+Da4wSefuRDMO66DjKNP2+2L5BI8zEe+UdDxWTpVcpUftaUTPR9DhnIZoKWE
         /pYMvHPJt07ZCiCpz9tI8T3lCdP1R6M/8TsojYmb9PhqeX05wDv4eS5d5FJMyv56jvu2
         vzKo5paN9IklERHh9CeKW0KuoXXb/IxEPiaeLJBrXtJVcmxwahyOQ3np+GGQhhLcUATJ
         k6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932752; x=1734537552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZChbzObT8yiyu3oc7dwGuAXjmHiQ0fUscqfsIIfuVr0=;
        b=cMFsPxYaOSw7rjWuCfDD6NhaYwZWBJ7+Z+oHDO570auIg5H+XgGf0NGU4zQlIVwS1z
         4sGYf44O+OIvWQnC0SaVGEUfLP8QoCoRg+edBVeJHBQoyrzyJJ5DJSX26fZx7ebU9ywH
         XjyhNjgatWZ3HspRkDU9hMMNRiTQRwn5a/I4qL9E6wZankZPm4C/Im4Oc2rXruUXR1eS
         EHN2SyEgiCH3XazYyNkPor0eYWAxfTXUQrGev5pb4nN2+IdqNug1mCl/aMrsRoaX9wQG
         1AUkKnl/Aie2E28dSf5tu+70dDFH2RwClhBTujECAXtCQtG+DNNSD+7Uup/Pp/JhHgoM
         aTyw==
X-Forwarded-Encrypted: i=1; AJvYcCVq2DtvYmoif6n2Q9wkuHZjLN8qeVvIRwTUsyiQKKRw5xuvJhqmlKf82+9T71MbrmKdNyJASbjpE8/pnOo3UwFa@lists.infradead.org
X-Gm-Message-State: AOJu0YxZhQIuacAZNUlAvoN/Ozk2K8CVHoHkcONw6TgFKdbCCyOB+UhG
	0qjOhEeZJzn7kkJADwaKCQyLGpxo2zOSN9pwgIiGdyoCFdSleVltBKaLD9uUUp+J6nuRx4pxbB2
	1O4QWrIgR/xwXeCHwMEvx1dvInYQ=
X-Gm-Gg: ASbGnctN0WRtGOQ9h03Bl1p/8q5/vTbM41DdHZ2OSKanZXA/k5SLMfpRBkqm5ZqCv3G
	yVA48FOUNspCYixdMty0cW1cw/sLxzweHvXwUSOgyRsPs+kR9tAaqx7y5HjrDGrHcNNE=
X-Google-Smtp-Source: AGHT+IGjjd845gZqD6VbvGu8xD0QWI1LY7dIDKnnhm4caENDAWdY8siyqutCix247rdvw0pP+hHXXkECcEPStZBxUKE=
X-Received: by 2002:a2e:be89:0:b0:2fa:d2c3:a7e8 with SMTP id
 38308e7fff4ca-30240d4a03emr12884291fa.13.1733932751765; Wed, 11 Dec 2024
 07:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20241210-imx91tmu-v2-0-5032aad4d88e@nxp.com> <20241210-imx91tmu-v2-2-5032aad4d88e@nxp.com>
In-Reply-To: <20241210-imx91tmu-v2-2-5032aad4d88e@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Dec 2024 12:59:00 -0300
Message-ID: <CAOMZO5DC=Y=BU-MX0B_ecOBnkhbiUXXKDDYgn4-uhDNyihOXoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] thermal: imx91: Add support for i.MX91 thermal
 monitoring unit
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Pengfei Li <pengfei.li_1@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_075914_476644_13DCE9A5 
X-CRM114-Status: UNSURE (   8.69  )
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

On Tue, Dec 10, 2024 at 6:27=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +#define CTRL0                  0x0
> +
> +#define STAT0                  0x10
...
> +#define DATA0                  0x20

These generic short macro names can easily clash in the future.

It would be better to add a better namespace definition.

For example:

IMX91_THERMAL_CTRL0
IMX91_THERMAL_STAT0
IMX91_THERMAL_DATA0

