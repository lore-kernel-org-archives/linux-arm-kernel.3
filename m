Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51439EDB7ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu3YC7tefrpRr+Xr7luEVx1O9NN6HnwtTIQE/2TxbaI=; b=X2i6BsMqeuJ9XQGazzQGFaSJLG
	WnNjjXM52QTJfr80JrNEaPP4f4I/XyKxHPwgsy0m0ud48IU1DQKpSXa7SLrY+RM7xkbBbF+68+BRJ
	5fMQD04uUmS0Xi2azGW9i8mpdJzf3FgsA3etsJ12PQDxWXWROKbQjULpzhjmnB1Ul4g2HpgAfUit+
	t9HOHr/JyYZr4VFAspsa3Nb5Wipgi+x5diQX/oYe/eyhZMpNXWDo09Wb4UnOKbGYCi+L8/HKKffjH
	o7Z+LsmGAbGmi3vDGOV9KBmXVrSmcLrli8lTbwiMpyHPGMr0m9ORiYD6lFcz+gsxI+iuJp4Gk2xPG
	XjJBwcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3mT-00000006IfP-2CD0;
	Tue, 07 Apr 2026 10:35:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3mR-00000006If4-1Hyr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:35:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F1831688;
	Tue,  7 Apr 2026 03:35:27 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71DCE3F641;
	Tue,  7 Apr 2026 03:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775558132; bh=xGASapseFRbHL3Uubm9FOBig3I0Lzpe0iWlAvh212w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYKqWHx9my6KjCuROYMXJznF76M0c1+FrWqKa8hIiMzZ/r+mZeDfYz2Op5RkjtF7t
	 A0PSP2EtvK7hgH+Gyr9K+DPbPC+ZA2fMMZvW1WJ9xdKVq1e6W7zIXW3+O8sPdTFBsR
	 fWtvaXO63exvRKNQsFfYH9fNWsgQNZPe0O45ZdD8=
Date: Tue, 7 Apr 2026 11:35:30 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpdm: fix invalid MMIO access issue
Message-ID: <20260407103530.GL356832@e132581.arm.com>
References: <20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com>
 <20260407081048.GJ356832@e132581.arm.com>
 <0a4911f4-168b-48c4-9554-3962d6e96efa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a4911f4-168b-48c4-9554-3962d6e96efa@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_033535_433593_E0119C21 
X-CRM114-Status: GOOD (  17.05  )
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

Hi Jie,

On Tue, Apr 07, 2026 at 04:33:22PM +0800, Jie Gan wrote:
> On 4/7/2026 4:10 PM, Leo Yan wrote:
> > On Tue, Apr 07, 2026 at 12:47:11PM +0800, Jie Gan wrote:
> > > Create the csdev_access struct only when a valid MMIO resource is
> > > available. In tpdm_probe(), base is uninitialized for static TPDM
> > > instances that lack an MMIO resource, causing csdev_access to be
> > > created with a garbage address and potentially leading to
> > > unexpected issues.
> > 
> > This patch itself is fine for me.  However, I am wandering if this
> > is sufficient.
> > 
> > As mentioned "potentially leading to unexpected issues", can I
> > understand some code pieces access register with uninitialized base?
> > If so, you would also explictly add coresight_is_static_tpdm() to
> > prevent register access.
> > 
> 
> Actually, we havent MMIO access for the static TPDM device, So no issues are
> observed. The commit message here may be misleading. do I need rephrase the
> commit message?

Yes, good to clarify a bit in commit log:

  "So far there has no register access for static instance, but this
   change helps mitigate potential risks in the future."

With this:

Reviewed-by: Leo Yan <leo.yan@arm.com>

