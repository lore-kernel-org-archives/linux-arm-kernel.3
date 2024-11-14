Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAD7D65C52
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsDnUfrZgRFjY0UmHDUk9SJkSWvJeDPxPrYP69lT6wc=; b=Ak/1+scPdtCKPq4hq1krBfkvz6
	5x/9OeDU+DQkhar4ZFj2bkKl9Skz2KpqVqoMQTvm08N3KFDub3ryGUhLfXedjcbuo6jsfsozJ5PId
	QxQK5ktEYuZY5cS/0DvX/wKxef1UnqdoCf1OPNha/aaBqRbU/NoQJwaR5L7WDiuSwiy9B1mQg2jF8
	t+H3eZbSZQUVw8XR6tEaChNPwI3ELtPjDFsOXmcW7QQ3A8am7cddGGXtA6Peu85VWUTFkf6gG5s6+
	Ywj+moV0j5Ic4X9aI1jqmuxdesGUsgpaBj5Z3kYQ/MmlhhHRtJ5zvqxDTViUgowzk0JDaLzlrjEUP
	nFIEnoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBU7E-000000094Q6-1ENU;
	Thu, 14 Nov 2024 07:18:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBU3q-000000094Be-3jwi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 07:16:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76132FF804;
	Thu, 14 Nov 2024 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731568474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsDnUfrZgRFjY0UmHDUk9SJkSWvJeDPxPrYP69lT6wc=;
	b=GxyE51EuidCqn2Pdn8OFA7Sg+ji/0pvC1ymekdKgHVmZfvPCiqsiUouuyUi4tsY/fS7vN6
	cVDFaSLazT5yVHbAmh0kHHzGhgyZcEB4FtrRBrO50Fslm44scJDHFVdAfA+ykhXCnptg9j
	BGr7XT76RNrPgGZKZktJDuVVlLeZfPV9QvLhKZ97obQKy+0JyWMvazYCmv61ReV1WRLX7P
	QTvvr4vMHA3k0kdQB/TFuOTzi3YwDEiaWXn8QwzNOqF/026N6sFNf8+jg15XoAuw3nyLS1
	zmtwYNHyvI3M6JektsUL7TL/MBA5fdzQG9MG6bTqVvUZLJwZFijnTmGTeAYtbw==
Date: Thu, 14 Nov 2024 08:14:31 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: tsa: switch to
 for_each_available_child_of_node_scoped()
Message-ID: <20241114081431.23296fd9@bootlin.com>
In-Reply-To: <20241002-tsa-scoped-v1-1-ba6a6d657f82@gmail.com>
References: <20241002-tsa-scoped-v1-1-ba6a6d657f82@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_231439_226006_104CF2B3 
X-CRM114-Status: GOOD (  12.80  )
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

Hi Javier,

On Wed, 02 Oct 2024 22:21:51 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

> The non-scoped variant of this macro turns error-prone as soon as error
> paths are included, because explicit calls to of_node_put() are required
> to avoid leaking memory.
> 
> Using its scoped counterpart simplifies the code by removing the need of
> explicit calls to of_node_put(), as they are automatically triggered as
> soon as the child node goes out of scope. Moreover, it is more robust as
> it accounts for new error paths without having to worry about
> decrementing the object's refcount.
> 
> Note that the device_node is declared within the macro, and its explicit
> declaration can be dropped as well if it is not used anywhere else.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/soc/fsl/qe/tsa.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

