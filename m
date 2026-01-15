Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F2D41143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pebBiil2ei/oib7mZd9mepzUxVShBPvTNogkSnHrW1U=; b=qO9z3D10mra9nMj5Sz2g+hVlfN
	zDmo6zjS5lxUxWJF07Y14z/EGeTsaKX6dwnlLYZUDc5LawfleMfUFglm2WWxi9U/8uOYB3knasF+m
	z44Vwr1/IzhyH/zmPvCSAnN6X3181hSZsaAxYUOFxz9zlk4B82VbBKvoceq5xrrV6ns4vFyl1mTgD
	wfRXt2c1LemwL6PtkAONUiwienyvdzcYQZjH9jqE5JwqBSJ+mSm+ErV5ZShfESzxS7TfqzSGZYAPv
	7oIze9ZmcKeDsSdUGtRpStQB6cfxsJMFHErvP/F+pDxxXsGKrqDQwUFAp1lUqhvVBZS0AEMjtRemG
	PCDqKS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIv0-0000000C0gu-0BTK;
	Thu, 15 Jan 2026 08:41:26 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIux-0000000C0gP-2Njx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:41:24 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-11f1fb91996so1516982c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466482; x=1769071282; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pebBiil2ei/oib7mZd9mepzUxVShBPvTNogkSnHrW1U=;
        b=KvSj2gNoqICDqArjmVWVs4pGJWWTrpfUFma3tSgxK5VzLgTEsyFYgUdexvg9vkiVXC
         mzPPrEqpsFUIMaEvGj7yDA+YN9esaUkGDE81la9+qg1CZ26+1/C4dYtyCK+wz6tEy4ni
         FIaMnxs5zVvHkP8+KsF+GZuBFCz1OdO36BndwKukAVbnMCDQCclJ0CYZpffrOTJNiVc1
         wtJu3AZZoUtUKwjaFlCBx6cfZXvay/jmDM40ErtTvUn317A5IurqvoE/QJDY4QoXSvHN
         hg0WfYVrGlBgl33WKbs1IIkbMIia7mKO5WEYWigA8xiapqH86vZoIUwVgmV3KHKNwWwg
         iHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466482; x=1769071282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pebBiil2ei/oib7mZd9mepzUxVShBPvTNogkSnHrW1U=;
        b=A9FK/JJ/qHhkg6VwzJvdEs37+ZO2tvAdzvqRnddNN9W/sKBGBjIY78qSiiH5SYOkIL
         tbntw4Mxn84GCAAYk0e+vHsfQCY2WPU6HHfgvoFoE6ghJUhRJeMrx5ztHqI548GbyN7z
         qKorYTpWayCGqDDUf+7YRjnot/kMK6tgP4UZ3YERMhWwKYkAHmkXjBbFD8f5YJvBECif
         aNRqa87RXZVeptN3aujDyRGmzj0WZhUHoo4hRlwWcJhOgLqqhTTo7jBPvSygLM+HjH0E
         iU3sGoEOwKMCRnAOXnhZ8uUxEEg2jgN2QUZ2qFYMLSGHhrsgW04+P4FbZBokrBSRVv7Q
         gWtw==
X-Forwarded-Encrypted: i=1; AJvYcCWNXksYw04PK+uO7yB5LUc55jpHbCnZrNyw+HCIR6B6H7WOyAKTZVBhGj9TDhmo3pFY6W1rf3aIbvtS+pgIqN4z@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ93AcOyGfg5apWX71glcc3kkYKKUF6lNadOMd5s5xNe4kjGpP
	WnnAjKJMWXYfJooIMAsdWHPhr/7GXYyGBb2oua1RKEMsrn7Ki0UaPqI/wAovj82/6LfL6vXVDWh
	1GpUoLNiyq/DyVUoH9wyk5b9GlmQ3fNc=
X-Gm-Gg: AY/fxX6pGzmT9IbnjfTdjzCakhwedvx5wrqGxg3m2Sjlh64K8c0qkxc+fP5Geouueg0
	BvbeVI5exmKOSLIRWiQ242UsbXxj8bwTsn48E9ODk4o1ucKVwZm2//Ws21Q+cdeijjArYJ0jvbM
	1w04V8TBpWx08PVqZGcc1l/7O/unJyekdo88idy1nVXAi/KZxmv2gP3SMPv/zyedUaJNbEicG5N
	26wm6evuWU9uIYZ50rdjoyHUeTpYUjKi8wqLfMgQPjZrbKDH2hdIv3sZAe7tvwpEjb/Owv1cf9K
	DebFYgdgULsV4PSbWqhXdC/c1JgJttShNzAsGyH0OqMi5RtRgXJnqaOQztBap6pVfqF4xy16+B8
	xi+hEqwhj7g==
X-Received: by 2002:a05:7022:2392:b0:11b:9386:a3bf with SMTP id
 a92af1059eb24-12336adc557mr5402464c88.42.1768466482362; Thu, 15 Jan 2026
 00:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com> <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
In-Reply-To: <20260114-mxsdma-module-v1-1-9b2a9eaa4226@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 Jan 2026 10:44:04 +0200
X-Gm-Features: AZwV_QgLOj1RDdzVccL_41XskfEEs9aTrYg8yhWQDuDVwvWQC6YUiA6AbKgDm9g
Message-ID: <CAEnQRZBkxugbzhNk+HE_t=2z_-1OZ_mgON=8=5Q6wV0zJcNHbA@mail.gmail.com>
Subject: Re: [PATCH 01/13] dmaengine: of_dma: Add devm_of_dma_controller_register()
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_004123_607561_8A7C25E2 
X-CRM114-Status: UNSURE (   7.44  )
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

On Thu, Jan 15, 2026 at 12:34=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add a managed API, devm_of_dma_controller_register(), to simplify DMA
> engine controller registration by automatically handling resource
> cleanup.

<snip>

> +static inline
> +devm_of_dma_controller_register(struct device *dev, struct device_node *=
np,

static inline int?

