Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F4C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbxCm84oFy10egaK1eu/n39bvCZwRoUJXGeKOhPqLkU=; b=nvwLECI3pzV23kn/0kZhj53HMN
	WYD9C6WWwNQ3zg6/jjbarCxFf8g+gTlGCX5Fqklld5kGdESIyQ0IXUDYzCZJRnArWgjunyJov37zD
	YxqwKPXFsurYWPG6zz1lsjK/CMffVina+IHN1wfuzlaS063lz4K68As9ORtTc+zWryhaCvMpB6NII
	fu/M4C8KKZp+leOaZVDiJCcWAb+j3hAokJu2PgJFkayI2VUgxp9gisXY0Eneji6ZICI5UnhqpsXbM
	JH4iUXWu5rz6ZrOYOAe5FhXzj6+1bM+oGjNyFot+zWI7N++EBWU8l+ZEDRHbJGWcwMS/0y7anTaXV
	7tL3h2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ws9-00000007ZhK-0NpV;
	Tue, 15 Sep 2026 17:23:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ws7-00000007Zgx-22gA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:23:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E912640627;
	Tue, 15 Sep 2026 17:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC381F000FF;
	Tue, 15 Sep 2026 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789492986;
	bh=YbxCm84oFy10egaK1eu/n39bvCZwRoUJXGeKOhPqLkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kx5V19CWXjLMKxYCN/wNqCY6YFl5N/BmNIk92beOOPBlDUOFhqyjoKjYiVRIw3atI
	 MrrGoHScEGoum8kFw7d5LrP5cdiV+Y4f7vM6zPUuipNFxoNFP5M+k+jbg1R5LRqfzb
	 etZjG/3MSHHSzcgdH91HU+9/wbp+EfyLVy61uRnGMotomNGcrE9Kqy/aAJry4nm8is
	 JwlwCbbAneqfPRGZdiXYxXdvAsJqGscBQ5b2Ir/gq1AEDkkOk7elkv2gFqyDlqigYI
	 O3tLLHFyBrM/vaeBPTjbXunjwXVZZKRHRueDnn5Ixm/MTaOlTRzAd72ltwfU7p4BUr
	 FN+zJHeT9cibQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] include: trace: Use string helpers in msg_dump trace events
Date: Tue, 15 Sep 2026 18:23:01 +0100
Message-ID: <178949289369.3921534.10158871187589954451.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808191234.402312-1-cristian.marussi@arm.com>
References: <20260808191234.402312-1-cristian.marussi@arm.com>
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

On Sat, 08 Aug 2026 20:12:34 +0100, Cristian Marussi wrote:
> Use proper available ftrace macros to handle tag strings of variable size,
> to avoid wasting space using statically oversized arrays while risking to
> expose stale stack data when such array is not properly padded when filled.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] include: trace: Use string helpers in msg_dump trace events
      https://git.kernel.org/sudeep.holla/c/7d5b79cd7d59
-- 
Regards,
Sudeep


