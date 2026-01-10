Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53FAD232E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuQ42fy6KV/R7cbSk9nKdFvtoN542GeXZtiK6nAYg58=; b=pLgyGC0O6DXz6vVwma1wS4aRim
	etNnDr1aQkbIcuajl5KMTSsO93a/f/qZfTWQ7pSFswvjiPgFT3FhNm+QhNfs12TufpAkXv7/V8uce
	UCiKFjctbVBToheRrztZCBNIft5IXQdY6GXd3qhpb7PszN9frd8NJLnfGRnq5PiRJlwmnFjQtTX2F
	ik8nL2sF04gX4bWfepqdHD5MyGVgea/JQvtI6ea7NgowatG6wd+d7BkGuo7ReapbtdJfWfMIFYtNU
	rQVt/qcl/C+tW8JuahQa+eh1WhCuCdQa4qEUug+T2R2uN2PsuUAVu/cBYv+H1CdV/1B6J9yLIaOcF
	ehKNMWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vef1M-00000003eCv-3JoP;
	Sat, 10 Jan 2026 19:53:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vef1J-00000003eCY-1vs3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 19:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD98843D95;
	Sat, 10 Jan 2026 19:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147CFC4CEF1;
	Sat, 10 Jan 2026 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768074787;
	bh=1pce/+hL+mT4ikoF0LMeY9bsocfA5If5JoWOMV1Ha+s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JymwyqmPz+GxaedKcYJ6EC3ttFAS5FDePO0zeT7fWqdqt7dV/ssMsrJpEH087slQ/
	 JYSwT7uOPDdBaWSiYF+vShftlrQiLGCj8M9zRKT6J3iAkiFPxB3tpzW+czsKweMrgm
	 KKcaN2sOoMEKok8AJVORKtJNrcu/nEZrXHsP4kVaAOI8WUwBTVtk4FbO0O33aTDav7
	 jqJY/ct3miD0F6lz1AZe4XtWtsrnxyaBzkiu5EZq//MKX75FbA4NefQDUX9StIxl8z
	 wqKm2PAn5HwW3jg4Nla9XU8uX9Wv2DrO8A0YmwxPwevEIhwNp1dpIAWDrE1QIcp7zh
	 dHoaeaPGYwfxg==
Date: Sat, 10 Jan 2026 11:53:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <michal.simek@amd.com>, <sean.anderson@linux.dev>, <linux@armlinux.org.uk>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <bmasney@redhat.com>
Subject: Re: [PATCH 2/2] net: axienet: Fix resource release ordering
Message-ID: <20260110115306.4049b2cb@kernel.org>
In-Reply-To: <20260109071051.4101460-3-suraj.gupta2@amd.com>
References: <20260109071051.4101460-1-suraj.gupta2@amd.com>
	<20260109071051.4101460-3-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_115309_533455_37EFCEA2 
X-CRM114-Status: UNSURE (   9.45  )
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

On Fri, 9 Jan 2026 12:40:51 +0530 Suraj Gupta wrote:
> Device-managed resources are released after manually-managed resources.
> Therefore, once any manually-managed resource is acquired, all further
> resources must be manually-managed too.

only for resources which have dependencies. Please include in the commit
message what exactly is going wrong in this driver. The commit under
Fixes seems to be running ioremap, I don't see how that matters vs
netdev allocation for example..

> Convert all resources before the MDIO bus is created into device-managed
> resources. In all cases but one there are already devm variants available.
-- 
pw-bot: cr

