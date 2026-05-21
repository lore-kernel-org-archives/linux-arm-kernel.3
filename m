Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32629CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqtx7/ZgZtJqtGmUDilhAq3QEZVyLamVBnXprfT/w7Y=; b=XbCB5+LbTiAkndjTqcxTSqHaRo
	gdV6/H0w1ZZfkjgB6ObNg0TOHlJxSF+4A52Tp8LsznM2z/QCcDXZct1EtpdpBB9klPfZPr0t9Yb8c
	oBeK24Je1stWmoBi7ur5eEQoljcQrdSJvr0Vuph85b3ElNUJ/BtsWaXvEgLc4GSCGuzxaU0Lbeu75
	WBsIGoc/LyZZvxBtmOd5obkKvf0/4EnfebhxPHDmJ5lvuMfkMpHRGKtHxhSpJvQ8OssYy3f+KLpcO
	pavsOk6n0tGM22TDnh1wsulcezaT5FFHNT4M8zfXRIkYjFP4T8JxquZ4zslxy5RMA7jG1Xyb2hXpI
	7qgcEukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6rX-00000008aOf-0TYm;
	Thu, 21 May 2026 17:07:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6rS-00000008aNS-3PdT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779383224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqtx7/ZgZtJqtGmUDilhAq3QEZVyLamVBnXprfT/w7Y=;
	b=ZGLiUCmB4ka6ubeGgG6ez7SjuN0KmGjR4kuz8JuNg3eblfNtOBS/SQPHgyNasD1EcbWp+J
	MBQtAJfhWLstnsWhkWh//0h8qqOJXmz2M+1bxBZCFnj1REYIdX1wdQOdmWyMrHOhEru0dp
	nlGVwtuZkwfnEJgTg8UPqagP5JvfrA8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-Si519SFBP5myV1KRA88w4Q-1; Thu,
 21 May 2026 13:06:57 -0400
X-MC-Unique: Si519SFBP5myV1KRA88w4Q-1
X-Mimecast-MFC-AGG-ID: Si519SFBP5myV1KRA88w4Q_1779383215
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41B4219560A3;
	Thu, 21 May 2026 17:06:54 +0000 (UTC)
Received: from thinkpad (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E07CA1685;
	Thu, 21 May 2026 17:06:47 +0000 (UTC)
Date: Thu, 21 May 2026 19:06:44 +0200
From: Felix Maurer <fmaurer@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: MD Danish Anwar <danishanwar@ti.com>, Luka Gejak <luka.gejak@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Meghana Malladi <m-malladi@ti.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	David Carlier <devnexen@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kevin Hao <haokexin@gmail.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
Message-ID: <ag87pBZfOyccPZTc@thinkpad>
References: <20260514075605.850674-1-danishanwar@ti.com>
 <20260514075605.850674-3-danishanwar@ti.com>
 <20260518184506.694c584e@kernel.org>
 <E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
 <20260519165646.09b0783f@kernel.org>
 <1d8ab51a-6943-4978-88cf-adda8cc57f7e@ti.com>
 <20260520153303.33692fe3@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260520153303.33692fe3@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: fwHpo4mwlk347g13pA_jU14KSRLP9d2TY6rWP180FkE_1779383215
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_100706_922115_DB1A52BB 
X-CRM114-Status: GOOD (  19.48  )
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

On Wed, May 20, 2026 at 03:33:03PM -0700, Jakub Kicinski wrote:
> On Wed, 20 May 2026 15:30:24 +0530 MD Danish Anwar wrote:
> > What should be the next steps here? Is there any existing defined set of
> > stats where I could populate stats from ICSSG firmware for HSR (similar
> > to ndo_get_stats64 callback). Or de we need to implement a new callback
> > that will do this for HSR.
>
> I'd try to plumb this thru ndo_get_offload_stats
> Close enough for my taste, let's see if anyone objects.

I'm not super well versed with the different options for stats we have
at the moment, so I'm definitely not going to object. I'm just going to
note that the stats I listed are applicable to all HSR/PRP interfaces,
not just the ones with hardware offloads. Therefore, it would IMHO be
nice if the two didn't diverge too much in the end and (best case)
userspace can ask for either the one or the other but get the same
structure back (no need to implement it for the software-only interfaces
in this patch series, I can do that afterwards as well).

Thanks,
   Felix


