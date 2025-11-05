Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EBECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDZz0eupi9Fz24PfWJzSIo22fLfhragN14iXGgfADdU=; b=C5PrlEMlhGOXgTq8T/fvTOeA7N
	+EQQTOYblFa4JmZc2dFvOo7JTpyptsPHrq1hvulIt5sz9ZPKeopIgGz8JK5wuqxKoVoUlB/Dk0zf+
	LaqsYfoppmn/oRPqtuvywrmImHtMd/eKzsYYSu5tINJ8GJQ7BJOnO5CrFmW/HFJ39vNnHa2qfJPx/
	xlldwrjA5xTJUmF4UFbFU92ngTtOUcq/MhdS9fxLjwlKSUQRdmlNlHgISxJrMZWpcU52wAkcFM/lZ
	QidJGt+1Tuzxm5P8cdJHuRLc7SsgbVciskqfC/z3FXae9XWRZDUTZQ5+gx9MhV63br7ncOHPlLPCy
	8fxwYC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGT8Z-0000000CthR-3DJy;
	Wed, 05 Nov 2025 02:20:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGT8Y-0000000CthJ-0TZe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 02:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00B8760211;
	Wed,  5 Nov 2025 02:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103CDC4CEF7;
	Wed,  5 Nov 2025 02:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762309236;
	bh=siu99kukBiiervgH6j7Qp18m5/cq8S+7+ud47iygqU8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=axORwLR/ybOg6tEvjNILFMj8JaFmkVxdMqarGN4x8bHNWc+pApG6JWZ0GE3SMDN3q
	 s+oSvzV9mUXKrVjxmSzyu+4DyAiFF1mt5qhQ4Gv5MtxLe3cMtA6+NoQ1OTV7O7G5iS
	 oSEq+ozqc1JRAei+X6UYaGD4rgs3AjxNyPHbeX1JeaoZe7mapwk8bS0r4316B5pDPj
	 wzPANsrAFmKb+7BKP6NlqGEreMXHB9fpE+TL/Ij4RBOYzZOP568TE/TOYqXFK5u8Li
	 QvErucOaGSzvoQKU+clJbONyFn/TlCEYiU710qj0FgHvfZTYXbS9R3WjUvNP8VjK3f
	 f397froJTDmkQ==
Date: Tue, 4 Nov 2025 18:20:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>, Boon Khai Ng
 <boon.khai.ng@altera.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew
 Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 1/4] net: altera-tse: Set platform drvdata
 before registering netdev
Message-ID: <20251104182035.29082775@kernel.org>
In-Reply-To: <20251103104928.58461-2-maxime.chevallier@bootlin.com>
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
	<20251103104928.58461-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon,  3 Nov 2025 11:49:24 +0100 Maxime Chevallier wrote:
> We don't have to wait until netdev is registered before setting it as the
> pdev's drvdata. Move it at netdev alloc time.

FWIW sometimes the late setting of drvdata is done to make sure drvdata
is NULL if we error out but forget to set ret (so probe returns 0 even
tho it failed). But the error paths looks fine here so =F0=9F=A4=B7=EF=B8=8F

