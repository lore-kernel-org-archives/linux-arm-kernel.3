Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1901FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gd6WH5Z2Y9pPHA5ZlnmmPDlhqK92DmbEQgMULDuoV3Y=; b=xQ2tQpwe1KKCwtHAE4oIDHZNLx
	Emj5UySvooiU9gNLp6WD0d34UtQvrQIVXP6kJShn/L0fa4ww4wzS7zAUJw0oapKUYdZaLxSJAtzRZ
	CAeB0Q2qoPHnA3xsYgg4onKMNv60BXBGBvyjS+XyOiNbIFrQDqX2jZxnl37h4wcjatcuvr1IqTUnu
	0HuMEBOB9/N2lBlEOkEcrqgsgJXSdhNT07NdUh8RhkrOgTEjhzO9Rip5Xn8AKFaw3SjB/IpZf+Avi
	ZptI+7zStwZFuGfsMFeGe1l0ybITO2MXxi3eUcOMgt0j/wjeqxWjPdYWkR+PQZvZLK/jtqfhGn1fK
	ddqFPubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvt2-00000002rkX-3bMK;
	Wed, 29 Apr 2026 03:46:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvsr-00000002rhg-0Ca1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 449A144349;
	Wed, 29 Apr 2026 03:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4E3C19425;
	Wed, 29 Apr 2026 03:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434404;
	bh=gd6WH5Z2Y9pPHA5ZlnmmPDlhqK92DmbEQgMULDuoV3Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NfcnoBJkFJVEe4KUMKZ4qVKNI4tK5IzsIxGn4AONb6zTrrrEB5dWbwlzw7iiCV0NJ
	 0KYACEtfFUdrzdl8fkRwUwONmNbHocM2p9NJGWAui8imgcJnmFgjhsAVY/5i+gncNM
	 GGFieiLoffbsLqrPx1PH6mlZStqqE5ywAjOth7/pDKk5XOahRRA/qdTAZdvBB6ZmI3
	 Q0JiAlSZ58QfSY3QjKt7bR3eNcasxQL4DB8B//xjYrLUeYqZDhYI1ellAFO6cw1bLq
	 hgCQ7JW8kcdL2WkdoDT+R6HTgYcUBYCGCfpSzBGu6xM0/Jx161tM94/LhTeu+Hm3Eq
	 v5HET6pOLKoIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260326045324.240150-1-rosenp@gmail.com>
References: <20260326045324.240150-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: bcm: iproc-asiu: simplify allocation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Date: Tue, 28 Apr 2026 18:45:36 -0700
Message-ID: <177742713688.5403.2563831165371967368@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204645_108914_27EF9721 
X-CRM114-Status: UNSURE (   6.53  )
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

Quoting Rosen Penev (2026-03-25 21:53:24)
> Use kzalloc_flex and a flexible array member to combine allocations
>=20
> While at it, take clk_data out of the struct and move it into probe.
> It's not used anywhere else.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to clk-next

