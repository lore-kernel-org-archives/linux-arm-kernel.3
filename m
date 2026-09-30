Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5ACA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=3R3obCFBFMtSL8N9ezeWNAPgmA
	XlJqszle0kJxKrOqaE4rN7Jt7ZvQNJrKJxYO0v+nVfKPKKlRetRa9yPFV1lw8DhLm0f96u2ISmRTU
	oSMuUp/LLcpgLRhAEQJ9E6TL677Ab+IhiA98cOfTBQTikofAGqFr9stf03AXiWvVXjWRUWczuUl3B
	Dh0JRSilNA7OzlCB9fe+dk2W4Gv0jpKEpsUSuj6P/fvxuFbic+uGGAOuTWu0Fm+O0WKCxUGJtY6uz
	9wDBRgoGmA4jPuJ5zbM2u462SV2Shc85fGg9n13MxBzArLZtrudP4FO6DSXcr2Owl5Tf60SdF4dA6
	Au5MA0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtlH-000000063YP-1uwV;
	Wed, 30 Sep 2026 12:50:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtlG-000000063YJ-13xZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D238042DC2;
	Wed, 30 Sep 2026 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C0D1F000FF;
	Wed, 30 Sep 2026 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790772613;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LBUI6Vpe7LkYZp0fRjgobvRt+inliDYtbviJuQv7tMs4DBHGRgDX4wjDbKAbH8xaD
	 rLmQfSnzx1lVfEvjdxfReUO4ocBo7em0HMhqTsJXg1gQsIp5++1EhlEhnQuBjqUJm0
	 sFyak7R8TtHR8c04yRiJZ88DUJ6Z2PdrnqZkc8jYlJGBPe3dWmFdsZw2Qjh0VMCGqP
	 2m1sW+8eMCD3l9h+ODpb0cMfs/V3d9NktYi/9xYu3s1td/NYVtzEErTlI8l7Gtj037
	 EM2e7ctLU497Pvd15yVtp6oe7CKgjh5vbbQWnVIKzDqzeqU7vUHCavwqu+m3pQF2Bd
	 4gqa05D1/4mYg==
From: netdev-bot+sinfo@kernel.org
To: Meghana Malladi <m-malladi@ti.com>
Cc: elfring@users.sourceforge.net, haokexin@gmail.com,
 vadim.fedorenko@linux.dev, jacob.e.keller@intel.com, pabeni@redhat.com,
 kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, danishanwar@ti.com
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix switch mode for offload
 and non-offload cases
Date: Wed, 30 Sep 2026 12:50:12 +0000
Message-ID: <179077261251.31693.1465174699926958543@kernel.org>
In-Reply-To: <20260930124356.3083743-1-m-malladi@ti.com>
References: <20260930124356.3083743-1-m-malladi@ti.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

