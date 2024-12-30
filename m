Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FC2E77194
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qCsLO7/DPq0fAwnmdxvog17EUVkdcDvufsuKKDDU44=; b=YCxXUoAa7pRrgDa/024bmQ81C/
	wg4qqceD6qo4cNuTTZ/czmcS9UCyZYeJKhD7/S2Cvnuf/YXB/VQBqsV1oVYXbTu8ivm6BancpwWhv
	srpt7pcZTKk+SElSLXuo+lknrj5oyTos4L/x4CkTcjNd+TpEOgQ1EhPJM89PyS4OzPxkFihzkBYIr
	1M1eAfOKFFQRdmvkDFtHopgBfr9pYtLgRPGSH7X1x9a/sgceKncY3sk1RJgDrqCApNjKod6ETftCN
	JOJf8GeugI/u9zgZL19WGMpfQq/OtzKUespmksmGfjjNJk/WTkUUwoq0haAUFT1ETrske21dBxqzk
	umMWYYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBRb-00000004pu3-3Nky;
	Mon, 30 Dec 2024 08:48:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBQO-00000004piI-1oAS;
	Mon, 30 Dec 2024 08:46:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E2C11C0006;
	Mon, 30 Dec 2024 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735548414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qCsLO7/DPq0fAwnmdxvog17EUVkdcDvufsuKKDDU44=;
	b=V2WVMabCR3tv3DYkj8ceVupPJhyavl3qhgOPs/I9FnR1jKneit/XiPGS4Oc3CUJ4NxgIDa
	pLsgJlKUNCJfA515f2cbXKr4alkKR+evB+Nhem5PI6cI4VnnEOcC/HAK8JCJ1JdAfzJmTe
	6dgsWTL9OpD5zUqe/8e95WW3QQ4Tp+4lMXZeQE2S90e4/GkcOWocy7y7wQ5JbxsZYJxu3k
	9l1OiSjR1bbhRB8hcCLOCEgC5RZ0vKiojIFwD8vKUgqnyFwFYK6QTPAFa7ivLgOObUwIZw
	2bJ9jpIfno95cevOBvtX5QOOsUSJQh9z8xuE9lsVYdYaV2AwFpnAnxqv/vl/Qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,  Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Adrian Hunter <adrian.hunter@intel.com>,
  Ulf Hansson <ulf.hansson@linaro.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Damien Le Moal
 <dlemoal@kernel.org>,  Niklas Cassel <cassel@kernel.org>,  Alexandre
 Torgue <alexandre.torgue@foss.st.com>,  Jose Abreu <joabreu@synopsys.com>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,  Mark Brown <broonie@kernel.org>,
  linux-arm-kernel@lists.infradead.org,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mmc@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
  netdev@vger.kernel.org,  linux-stm32@st-md-mailman.stormreply.com,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 3/6] mtd: st_spi_fsm: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
In-Reply-To: <20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com> (Raphael
	Gallais-Pou's message of "Sun, 29 Dec 2024 00:32:42 +0100")
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
	<20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 09:46:52 +0100
Message-ID: <877c7ha77n.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_004656_599152_F1A49D37 
X-CRM114-Status: UNSURE (   7.39  )
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

Hello Raphael,

On 29/12/2024 at 00:32:42 +01, Raphael Gallais-Pou <rgallaispou@gmail.com> =
wrote:

> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.

If that does not lead to any warning, I'm fine. However this kind of
change is better received subsystem-wide than platform-wide, if you ever
wish to go this route.

> Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gma=
il.com

This link however seems irrelevant.

> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Miqu=C3=A8l

