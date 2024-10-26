Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E558D10BF7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsNb/l8P+ovBzoihIQ5fxrfqePSLqA4WIatD2wbUDcM=; b=rCHsXDYusVvQvaXVr3NdcPxymY
	lBepvAL6jiHN4MDvFaHErtgrQYLJjcEFjrUT3FuietFW63kCerey2id/CshB4DTTMBZzOxQUwKniu
	2WwlOIb/zQCwUL5AF4Ouv2fq54/JxaI9QF2f92hJEmiyXvgiBDjmswT29hPZFuPUTZoTQVeKAN0Bv
	zvIxSFy8ta2AgUyP6fqDpPbnP6NdtndhFHC/dbs8yrn4QHgiWACFAorbYYduK1L6HgtQUXflNlVk0
	FlfXAJnzcBXNnR+3ol503ECjT2wLTn/L0PCiiL7FcNE8wrt88KL5Q5Lu+IwAO2m+tyqkgoXCv7WZX
	mFxZk34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fs6-00000006byX-226c;
	Sat, 26 Oct 2024 12:26:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fq6-00000006blg-3ePx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7CE0A404FF;
	Sat, 26 Oct 2024 12:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8AFC4CEC6;
	Sat, 26 Oct 2024 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945457;
	bh=kO1q2x2TNqovqSKbL+rwFnj9xp9ouk5oRfZzFVn7LN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mthH6AlbHiPMsUNrjGp6yVtLLDqxtd8g4cIebz1H1zt7h00qm7TpB2D1LtmgNMrMZ
	 D2suiFczBjLaPlDggh2kieOezM8UmOcVHIKjbQa6AMP6fbrvx/r2EBheE3w0GXbH5+
	 lYjaGgvJrvIhXRIwlas+XEySa/kQ7VljFfUnAKSkilUo+PDE54o+StlG7fZhRItVV0
	 /pC5QXdOe0WOZIMIjZbGBAogsg4yulH1HoPWVSAWqQf0+MBl/ldoPRnTwnw0yPY82f
	 dYH3P6b9/+MLE7lLk2KpB12OnJWKy05LUVT6MAJEWE3bvDCgfG/hMxQdT7FdPQWiO+
	 o4hf6pTCUMlcg==
Date: Sat, 26 Oct 2024 13:23:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit
 Ghosh <subhajit.ghosh@tweaklogic.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 3/7] iio: light: ltr501: simplify code in
 write_event_config callback
Message-ID: <20241026132333.2ed8f343@jic23-huawei>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-3-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
	<20241024-iio-fix-write-event-config-signature-v1-3-7d29e5a31b00@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_052419_004836_539C5541 
X-CRM114-Status: UNSURE (   8.03  )
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

On Thu, 24 Oct 2024 11:11:25 +0200
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied.

