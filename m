Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D539CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmxj2lj4Q4GvWHDzZDgnLPWqXygKdSJybIHJoEn8ViA=; b=TlQP9PwQfh41RLF9XYiy+BfuB7
	uQDQsYcPqattOPARqVwdr4XNCVYVIiDWTovvfTxJQZVEDRSnfpfC6NoioiI4qualDuph+AZ3WWaVq
	N5canfSFf8U/tYYwTsscWM4Uq1qMdpCMtJ+fjHZxn405buI+1jJ+SJkxUu6ME09MOKpv0+XxX8Jjl
	Wwv0wHwHvSXh6h0S6hwWHR0zlCPNFHt1jgqvAjUgsAEt/ZN1UUmHfaHeL2KqbW+r1BpgCExD8gzTj
	ZnJEInSllvqZ9x+v82p+b9xW0cgb+SoLGqHKDhEYLd72zaZhbya+Eb+PtrO/muzsdHSTHNitshU7x
	3E6DhRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE7A-00000006lcO-41ya;
	Fri, 09 Oct 2026 17:10:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE7A-00000006lbb-01vb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 17:10:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58BC760DC8;
	Fri,  9 Oct 2026 17:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25231F000FF;
	Fri,  9 Oct 2026 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565835;
	bh=dmxj2lj4Q4GvWHDzZDgnLPWqXygKdSJybIHJoEn8ViA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z634Y5IypidQbFnPdfvPWiyXUimIZt5btlC8kDBCbPcbKddDUvLPCFmkDmmSkzqPF
	 7ZqhSgd6J+zPUmKiIy0xFAUiviT5rw9W8j5hXZY9i1ephEurVBII7GhRb8cXSqvX1Z
	 JMaekl90TGTVHtH+FLrjs9QZHRrYPI0uLiYEDSwRVTAz+sZX41AXlmMmiI0S55ew5S
	 iDhPJJBEuzwW5JnXxyeACW1Yc1Jsj3eOpuS+gULPt6hNBByFYzDendJDvr/qAVmclJ
	 +m5j1kVglmlM7nKsiY2wNkeI8VtxkXcOhzv+KBprxmdIFkjV232r1bPLxmpoPcs2eJ
	 +2kFE86iQcaXQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	viresh.kumar@linaro.org
Subject: Re: [PATCH 6.6.y 0/2] firmware: backport CVE-2026-93083, CVE-2026-93093
Date: Fri,  9 Oct 2026 13:09:47 -0400
Message-ID: <2026-10-09-1-daily-reply-0010-arm-scmi-channel-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008191624.98532-1-artem@trailofbits.com>
References: <20261008191624.98532-1-artem@trailofbits.com>
MIME-Version: 1.0
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

> Could you please consider this series for 6.6.y?

Queued the series for 6.6, thanks.

-- 
Thanks,
Sasha

