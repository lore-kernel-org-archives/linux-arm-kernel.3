Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3940BE6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49fgw3axp1IDyDrO/8mErO1GkkZHK9CcdYm60SQ4MbQ=; b=2rhyk/ahUNFs94UtEmezIhfFw4
	Rbq9xW/r6bKc/T/6m747P8GyM4d02YSJxc98Abq3C8RltEmGZSAFC3NThCbMNcfe8CX8tdNrvTDPD
	NK6DuvDIDBLUVkEFAze8LIJtcIbvQOdwqkSXP66LHZ/uQDeBuZZKqy1JhyootLVmXCNegWYiDwTyW
	vofUXecAl5zM8JlsueubyziXDRl23uPqF4YontVVYLibS1dgiKqaNmiwpitebek0CY7QMbZrF3xcB
	Ns5wYsNXAhD6pBRkqAp6Wh1wDkmiJEqWeoRwP5Egy22lNWaMxgmPJSN5NIkvVgEN1FJu9N5ziu54Y
	5OmbGIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ulq-00000007jTM-2Xbz;
	Fri, 01 Nov 2024 16:45:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ue0-00000007hiI-2A88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 011FB5C4135;
	Fri,  1 Nov 2024 16:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1342DC4CECD;
	Fri,  1 Nov 2024 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479023;
	bh=QET17fHgUqNbmUw/e9EdVPDP2UwGuQA8tvgZ5/yNPgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l14K5SRt1vC7zG+/VORahqbr+H6ulbVRDGBFQqXQrlK65o/ub6oYejiOTlB3PTP+t
	 ojIvFQAiM6eCZyGzENOs0yMHTr2uO8dWnwfinokslRJsBu9P37TMZnux02xYOlCtzM
	 EK6rS/bitNuCRQeM04K0w8i1fLTqvY1KCpyTTO2NKLQRnQndxkAEUdekfUn/utuDTd
	 oOCDKuIEdj4R85KlKTGWq2I0JD6y348/hop0m/AUa2FbOMlj77L8f6dHmIh6//o3Mn
	 MuOX0BLZg2wZpUTzzIeaMq8bP81cyI1nIOFo50d6vJ288U5hiHbTmy88m3C7SKeuRO
	 wPHYT0ZSpEvKA==
Date: Fri, 1 Nov 2024 16:36:51 +0000
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
Subject: Re: [PATCH v2 11/15] iio: imu: st_lsm6dsx: use bool for event state
Message-ID: <20241101163651.09ca52d4@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-11-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-11-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093704_646631_98A08A5A 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, 31 Oct 2024 16:27:06 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Since the write_event_config callback now uses a bool for the state
> parameter, update the signature of the function it calls accordingly.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied.
> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> index caefa15e559b8808051ff1c7f82c3f36c947933c..509e0169dcd54e773540c4e3f1b56e5b737f80c3 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
> @@ -1865,7 +1865,7 @@ static int st_lsm6dsx_write_raw(struct iio_dev *iio_dev,
>  	return err;
>  }
>  
> -static int st_lsm6dsx_event_setup(struct st_lsm6dsx_hw *hw, int state)
> +static int st_lsm6dsx_event_setup(struct st_lsm6dsx_hw *hw, bool state)
>  {
>  	const struct st_lsm6dsx_reg *reg;
>  	unsigned int data;
> 


