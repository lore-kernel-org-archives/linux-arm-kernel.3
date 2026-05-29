Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BFCCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 00:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0LhC+L7ew0JwAUKzb7htSG+8KHzDbUfZ+uer8crve4=; b=gbooJ/81c2fQ1/pkeqF8a/NRbb
	OZe+Tl1Fawgkm02NQvaFQUcV2bnkyUp5yOlAHJI7UPDbLiu4hSaKzQD6iG4JLQtEYg/tiH+cd1GpS
	/v30YRo+egcGrwadzsFi4UBHf4dD9sMUajbpkOq1dXHnlwWyZvDlbmntSIROwz8fuFQrGVNmS1/2C
	jqu+iBx3zoc9T5t/Ew2V/CV2Ht/TQn28Rh6mfiafc3AuNOpWhtXFcL0FVH/lRTHu/1P8uttI2qDsb
	4WIbMBvLvf9lXFxa6eC+RuDDNZfzWvtlwvhW9mJtRat3SNiOMrzRmfqI4X9ixUncDTTES+9w8Ay9m
	++DlgeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlFh-00000006aMh-0uAe;
	Fri, 29 May 2026 00:39:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSlFf-00000006aMb-1fLx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 00:39:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D74160213;
	Fri, 29 May 2026 00:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD0D1F000E9;
	Fri, 29 May 2026 00:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780015140;
	bh=S0LhC+L7ew0JwAUKzb7htSG+8KHzDbUfZ+uer8crve4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Huhxiir74PyJdqHzFCx/VC7sOg9xcgOt2UIExXN4OjrzpRRIxL5udOeZOX5IWMPUY
	 Gxah3mU8eTdd6Ol+C+nOSSNLD9ABwLtEVZ4A9hEa9lbYQl41i3V2qSu63cZN8/Kb58
	 HAWSPpVh3Mls+N6dj+q5ESN6LjQ41QfpzqQO3klv4BnE9D6nGOhfyVNHkE2JQfBSV0
	 dgHApsPOfNZEf8KPP7MAErX+0XEINmBRUirb6nENwokaulWf+L63nzvCI2acrhF9Kt
	 ofaMYNQl1qgMBVBu7fcuTGVi6PZIAv+geeoUBL6+XWuB9Oh6Weac80vr9IryXGXj5T
	 a0PFjOxcuTcag==
Date: Thu, 28 May 2026 17:38:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, edumazet@google.com, davem@davemloft.net,
 pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: microchip: sparx5: clean up PSFP resources on
 flower setup failure
Message-ID: <20260528173859.04fd6c27@kernel.org>
In-Reply-To: <20260527073855.2334001-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260527073855.2334001-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 27 May 2026 15:38:55 +0800 Haoxiang Li wrote:
> Add error handling paths to unwind the PSFP resources that have already
> been allocated before returning the error.

Does not apply, please rebase on
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/
and repost
-- 
pw-bot: cr

