Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B66A106ACE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h542fHy8Wlc9Q7iOCNi6a66KJOczbL9oTkHeuoyFY0=; b=2truHCkTs9PFNsPwUQxevVJwA8
	G36RbJ05rvYLerL+yZ2IfPCSRDH3VXexJ0Vap1nQD7Q406xpW+g5q/pK1fgx+pHYkF5UWdQuQTvYh
	DZysav5KxVZT0tntZegBEFHTxHo8BvOpXiZjfNxTXEnDl94NGajPmYt+K+cptBgmvxsQMpdpA6sC2
	UQ9JL+jbZh7FiYbruklhFb1e461DjOg3AXUCEUdztBqL2449unhjxKbbjOdanLxCMlzmFcJc4oLa0
	ZfowewKLuGRM6C8VdtmriLqv+kFuQph/u5S2h9H3bmdxWLzwMd19tUWGlmJbQfbgxixfE7NGomtaM
	5EQIJVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mpK-0000000FKsm-0R8W;
	Thu, 12 Mar 2026 20:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mpI-0000000FKsR-3YBz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 20:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBDBD6133B;
	Thu, 12 Mar 2026 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4B9C4CEF7;
	Thu, 12 Mar 2026 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773348011;
	bh=7h542fHy8Wlc9Q7iOCNi6a66KJOczbL9oTkHeuoyFY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BF5FhGmi7OYWgBa6VYv3sPSwQ/uiXiEm49kPV98hatOIZIPGsvCnsrpByD7+CILqp
	 oggd7G+k3kA9Ntl8pVlLZafipno8P1uZXXt2q3rOKXLtv2eLoymW/qOnpkoKWMxmDl
	 XMMI4jygXx97HeyyxV0iVRgtgPgi4xzKpmpehTPOoObcFuV2vJvjE1R79kFE2YJE7b
	 70zHW2MrRAoHeWFmkgnxr0WmlByQI7aIPmCmUM1k+yoIz0hVYlK4zmvuV/Vpkt3j7i
	 apYQ4Q3/hOTaiz7CUQaCzwFoTQTcyzWlcoVp+F4bn7PO1GrrHeh4P0j+tg/V2q/6Wz
	 clL6kg2m6P38Q==
Date: Thu, 12 Mar 2026 13:40:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jstultz@google.com, qperret@google.com, will@kernel.org,
	aneesh.kumar@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 18/30] tracing: Check for undefined symbols in
 simple_ring_buffer
Message-ID: <20260312204005.GB2747807@ax162>
References: <20260309162516.2623589-1-vdonnefort@google.com>
 <20260309162516.2623589-19-vdonnefort@google.com>
 <20260311221816.GA316631@ax162>
 <abJ_cm_yM3Q-99GL@google.com>
 <abLIslqIcVscZRFg@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abLIslqIcVscZRFg@google.com>
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

On Thu, Mar 12, 2026 at 02:07:46PM +0000, Vincent Donnefort wrote:
> In the end to unblock linux-next I have already sent an updated list of symbols.
> However feel free to send the logging bit, that is surely useful.

Thanks. I will review and test your "tracing: Generate undef symbols
allowlist for simple_ring_buffer" shortly (as I found more errors other
than the ones I described here) then I will base the logging patch on
top of that.

Cheers,
Nathan

