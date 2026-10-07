Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59597CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 01:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIYw+68tQBShUC14SvVeLSwO6mPbK9HrG575Az8p2gU=; b=he+2H/jCqelvEHDGppUcLUPTM6
	9kRSzwhA9npLtGu43DdNi8qz7iLktO1itGOcFolTNYelrbYs8Z80l3wCv2nk2WEKCDbXivW3QQbN+
	FcIy1gXKLbKUfeH8LBWSEFS2JWxutMyrIxWY9RQS8DwkMa/L/k/cbfK0GRY9LR1AjdDMrFVvTwIhY
	S+XIE4ojR4g2LLAwZkFVG3N0jtED47xzEgPtZSLPJFfYVO9RoOONjNOGp9iJj/Y5e6V3JN6W7uoZ4
	etA7sW5MV7TtbGCqyz6gyTCVPHXYJlqBO0d/skvSE/xF5nUmcdQceXt/CvuranD2pu7nvYtQ8SJu2
	OQ8Z0btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEG2x-00000001YpX-0uYv;
	Wed, 07 Oct 2026 01:02:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEG2v-00000001YpP-2qVU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 01:02:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D81B601FE;
	Wed,  7 Oct 2026 01:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CD21F0089B;
	Wed,  7 Oct 2026 01:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791334931;
	bh=lIYw+68tQBShUC14SvVeLSwO6mPbK9HrG575Az8p2gU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Kp4PDKnqo0J/23bLkqvFzfL2HTVDM+J0OhbzRkl6j4JFVXuGpPZl2qDYtJNFP0E3V
	 elaZYc4UVq8kPA7aqfl+O+zxL7FGKx39ifPnVWV5u30r/ZK4hUbNLjBEBNlnD89G5x
	 UCc0ku32G9WCAlbz4IFvufJ4PxBDtBrkpwOg4Qfpa9FkNCQy2HiYvGi6/b3zFSdOLN
	 BBe2VPTrZRtJ0iAw27nBYi7DDr3Ru/YUo1CejoXZzFLSk45YWGMV1kGUSlAf7vd9em
	 Bv10bBQJixf3jRerI0oVvge40ctZfZVWcLBAFsHO+gbss9MQyYNHGy08Z4Z6Ksigj8
	 f0pEiw5W6xIqg==
Date: Tue, 6 Oct 2026 18:02:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
 radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 daniel@iogearbox.net, jacob.e.keller@intel.com, suraj.gupta2@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <20261006180210.03a15e52@kernel.org>
In-Reply-To: <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
	<asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
	<CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
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

On Tue, 6 Oct 2026 06:44:55 +0300 Sagi Maimon wrote:
> Agreed on the helper.  As on v2, I kept the fix minimal for net, and
> will send the helper to net-next once this has reached it, with both
> axienet_dma_bd_release() and axienet_dma_err_handler() using it.

Let's do this now, trying to keep fixes small is a bit of 
an anti-pattern

