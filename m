Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6A7C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GIYhUm7qP4hDO//mI2sDZ/wC78YEFXTr75rid4St6w=; b=U0hwUmCF+W2EqaxekpdeFFUCs1
	iM/B+VTthHCCSRkdJhj6K8QKza21EYn1E9Q/FQdI3V3JmvPTgkMGk8QwAM007YIDGzMsGo2bmRTHZ
	GxY7OfacZQoR1t0rlcOmCFoJMI4gau08/llrs7YBNEAp0+E+xKL/03nxdz+7Bzzv2EUFZ6YGouKnF
	ZAsrWUYM9zdsfLTypc4kXIpHgXeiDF0dImPeAJlVohPFwc88TBbQ1miHL0Dd02Oy9q62tnFVhlq4J
	ScdAvepi++V869hNuRL70b7BemHuE9T7eA300nhsT1uoGzhrCaerU+L6MszfMoJ4Q5z2VgQTD49f9
	ZxuGytLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllHz-00000006UWD-3AQp;
	Mon, 20 Jul 2026 10:31:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllHy-00000006UW7-2ZFv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:31:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01FE760103;
	Mon, 20 Jul 2026 10:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EFF1F000E9;
	Mon, 20 Jul 2026 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543517;
	bh=+GIYhUm7qP4hDO//mI2sDZ/wC78YEFXTr75rid4St6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U6dP3lM3+G8gII1NAY3/C/ISB7tM8Qlo1n5nKIzpizl/GOX3zC+6AUlTGWbWqYU5g
	 8fpderYjqJ9OL5b5SiFvke0Y6Oc/lmbYM+4ZarLNU2n7D9m4fMcN310JPW623jBwMW
	 HoKqgk7xvd1HQl/QOmWbdhTRBD1im2Ut5eV5N5IDJAn/ZG6WS9CVyG5SLjE5vePEdq
	 Y2+/EpsRrhY4Sl8VSrDLEWoC6nim58taCPAJhRSnCFmcxm3ai+88cSOeeAWljvK01y
	 L14Rq3u7k/V5DBYQtEZ8msFgSnmQS1rbqHTnkWvqm1ArRMl6Ta1lfKr9T53qeUXqA+
	 RAN6/1pe/fWNg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2] firmware: arm_scmi: simplify some allocations
Date: Mon, 20 Jul 2026 11:31:49 +0100
Message-ID: <178454310144.1349369.3756806387017332522.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630204719.334211-1-rosenp@gmail.com>
References: <20260630204719.334211-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 30 Jun 2026 13:47:19 -0700, Rosen Penev wrote:
> Use flexible array members to combine allocations and remove kcalloc
> usage.
> 
> Add __counted_by where appropriate for extra runtime analysis. Move
> counting variable assignment after allocation before any potential array
> access.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: simplify some allocations
      https://git.kernel.org/sudeep.holla/c/9c62bb72a5d0
-- 
Regards,
Sudeep


