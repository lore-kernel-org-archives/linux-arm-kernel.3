Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213F9F9D0CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6w550N0MxEwxNAHSInqETjhVWVfzaLbGQYn5bMQkuk=; b=qHdwjE8aGLkrOY4e+ZkI4sp2dV
	wZtiR8TO/1ECTiqRISzWFqX1EbZRTvynyPYy+CvvwdWi5NZbdWwwIdBCFhTd4l3N+E0yqSsZo0tQe
	EigAjJgbFd0bsc7O3AFr8SHI9i/hGpkqACEmTwsppuYRn2/fEE+MwuXb5+xkGAS1ESszeGgZuyjEE
	pcpkeme7eESMuQ+zylw/0lI2MTW8BbGc7F8CadVa3ILjjZ/lOs8EdlwejhOG+tGhKAqW7SfzXmENS
	aXxlK40sjUg/t9/+/DU/mUvuctAOZh2i865W3OPdXoqQ1k77NCubTH2PiYSU5NgKxPs9FTnM3atOD
	ceHeppLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdbL-0000000HM3y-2A1y;
	Tue, 14 Apr 2026 13:14:47 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdbI-0000000HM2e-25Y8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p6w550N0MxEwxNAHSInqETjhVWVfzaLbGQYn5bMQkuk=; b=XlTlVTrF7k4kweRqsnLhib6u2s
	JBVZbhwkXgqWFEOAq1frC3U41CvvnE4H7d5DcfmfLjYN3/IjfFYQCWSnIXeNP322WjdezqWyz7JH8
	4dw41S+JTbqQrEDCQIZy1J7L7MaJenecODg6bLCc6UPpAp60Tkdimy5zFCB3Mw4VVXbvkW3uErNt2
	otJo5JbZIeOH4QLsrNHhI29zee0WDcpO8TBVsm69UOYvmuPE8VtS5CI6favDXclujdaLLZrGEmwvJ
	10fSHky5bxCsBXlFdslmXX+LID5KESeqvgYGCfxv2oiDqvXkZ5nmRNByU9jGspmYIdaup0sABsG3S
	v6S+BV2Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCday-00D5gf-1t;
	Tue, 14 Apr 2026 13:14:24 +0000
Date: Tue, 14 Apr 2026 06:14:19 -0700
From: Breno Leitao <leitao@debian.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "lihuisong (C)" <lihuisong@huawei.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, lpieralisi@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pjaroszynski@nvidia.com, guohanjun@huawei.com, linux-arm-kernel@lists.infradead.org, 
	rmikey@meta.com, kernel-team@meta.com
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
Message-ID: <ad48gItCwrC-ar34@gmail.com>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
 <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
 <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-cute-shapeless-dolphin-c5b2fc@sudeepholla>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_061444_540993_347420C1 
X-CRM114-Status: UNSURE (   8.82  )
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

Hello Sudeep,

On Tue, Apr 14, 2026 at 01:25:53PM +0100, Sudeep Holla wrote:
> So while I understand that the kernel did not report an error previously, that
> does not mean the _LPI table is merely moot on this platform when it contains
> only a WFI state.

Can you clarify whether datacenter ARM systems are expected to expose
deeper idle states beyond WFI in their _LPI tables?

Backing up, I'm observing 72 pr_err() messages during boot on these
hosts and trying to determine whether this indicates a firmware issue or
if the kernel needs adjustment.

