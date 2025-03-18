Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF4CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=; b=tVQ8kr+JAk1AJAC2YkbvlwToNZ
	+A9nN4e30Xrohxv7x+q4wGYq9pO3+VvSenNWcwlMk0OT7u4M+8nlcQcSAgqkVmwb/yBRJ8HZ9y19Z
	Jg66vQS0KS95WbVkJzaisaxlAW+P3e0OL2EqkhhxusdNG+tA4iIxCBKlQigUl1Mq8EoIHw296t1Hg
	FyC4uLqmq539vHy32/zGtB+C6JcjWI2ZcDSUH0RFXrKqw3mgMrSb3X1p8RThdwUUmzfdNlQ5cxuzp
	VFxtbpqHdGcjT7YPWD3Zi3j8pCKoN6G5ICBsCZh/qLgvge34iRumvDZcqPHLQJJpGvr4m1CdVI78D
	K7qV8SNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSpZ-00000005FwU-4AQh;
	Tue, 18 Mar 2025 09:01:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSgd-00000005EVy-3gpC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:52:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so3626545a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742287955; x=1742892755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
        b=fw8nxt10a8BsGb+ht7Zwgfqpe5t8BHFjPVlrLia41mGSqiRckRHJiQ1E3CmJaXDRD5
         yHLklGG6PZEWMCFs2nShUow+Ok9h6FzCUs3JtyXPFOT8tQJ6tvtAW9OFJIP34MnqCcTu
         epO2wcPPFOWtk+dHZc6xK4P43fp1urRSKN1ue3RpPWZLPBKI4Oi5dSrPudJTAqkCm9o+
         Y9CHAj3DqTntvsN75qJXnJHznkijU+3x+zCwL7oK6qQSYy6v3p6hX5v/sMOJXo7MrZpY
         u6cobyNJv7gSbQzyUhRsKX24vIH/nzmkAKiZ6O4Pynej3xErc2Zxqq34OObjEgaKIZPa
         Szkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287955; x=1742892755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nekzz6fBfS4uQY6xszVTs6sj5myK1wR2V9j2ijLK7eY=;
        b=xSbXiTGXhWo5jKoo+NGzq7Yvx91zO1oOxvQtaMclI6B6qfZ271TikGd3kELA6pBVHK
         Vr32HsdnOLRuPfy1uurKt8Zpdsm5kWZFMjTKxgIjzGlump5M/BdK0He42JQGK2Fl+Zme
         L4JqBrPy1JXmx0O9c/+vGGwNBW++RlqabcIH9ylmStWz09dTlSHW+3xi0c6X3LQ0XIg0
         kI1ei7lnpvhj6j9XoGB4FWL1OeYWVmFMYszMTqNQexQIpcTaLZaEcppMZvU46fasg583
         lOi/vPAw3J4NQiKbbrZOPT+Kzafuf/VVYaRh1b82D9ZR486XftliWi0ZK9XRdnbD/hqP
         zInw==
X-Forwarded-Encrypted: i=1; AJvYcCXxFOSqSTS6QGBfu/V/d6MRp5v8aP5mQeVyG7ziWP1k3yMOupqVCYKesefSEibGVX9pzmbbVy2l4AqsuNCyLuAE@lists.infradead.org
X-Gm-Message-State: AOJu0YyC/8EOunXf0V/p7NoyxH9No7xkc/SDXeoCdkxfTaU6ywzoH86H
	rzECLc1dL8WsE2DiOrEfx/t5z3a8/HaCENuI9raYiMcSBlc+527CThMORYTIGpuAd2LvlGyzTpU
	Lz3spuUGFl7i21Q8defnXuvxjv1M=
X-Gm-Gg: ASbGnct/fBuPbdE3T2S4iRF72f9FeYJd3N4XWDrIqZEk8ObaCaMok4Na18IZl0QyUXo
	wZnBo0dZ7wfEq/uT66OKp9OTkkrouUZckFAyqKAqxP6FFc4Er65ovTsqXnQ2rAsrDG4NVql4V/f
	1EMXLaFQ5Jz+g4fzjdBhbQt/dxcQU+Py4m/A==
X-Google-Smtp-Source: AGHT+IHxBtGTYr3jKDOjfudNcmvMSpsoyb/R4JeFGP2QOzJVyaFM9HhxQUDogb4lJVnRc6RbdFlWwMuZrsbX9LPrL68=
X-Received: by 2002:a17:90b:1e49:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-301a5bc1823mr1936322a91.30.1742287955176; Tue, 18 Mar 2025
 01:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-2-robh@kernel.org>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:54:07 +0200
X-Gm-Features: AQ5f1JqTpuM0NFbEd9b70zQbznVEgiaQyEKWqlPuOjeLEzVp-2Bgl4hMPBt9TEI
Message-ID: <CAEnQRZAwd-e=j2bfHimx9xjQU-2=Anr7fJ_w98t3TAweZY4J8w@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: reserved_mem: Add functions to parse "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_015235_923409_9CA74CEB 
X-CRM114-Status: GOOD (  11.86  )
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

On Tue, Mar 18, 2025 at 1:24=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

