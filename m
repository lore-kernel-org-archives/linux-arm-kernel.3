Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FCCE8E6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FH7uXWoX3QdWLPzwWEMc43EIkqNC9PkUQeaKN9qCNYc=; b=EJyBVx0UcOoGK+uFhwb5DwJCu1
	WVkBOYtkzyqaKQDVo3I8FxHQ9WzCIni3AH8Q74S/0IB5P+Sln1IK6VjtD/Gil818088MDvVOjAGWx
	hvSjQyMfTzH2qOLMH9QdG9zCjqcmBNRkFLUUonaAIq5MKQfJrqmVVmOoLnrH7xLIWWIICMjF63xbL
	1Z/ReVcZGet2cAI0P6VQm9S1KDwWBukZUWkC8SgDfPPpeDQKqNPECxzhJdCnyqb7fFFUk3C1173xH
	nCNVqSHcRR4BGv/wQ/ZxWiU7H3TKDRW7tUlyG7nT8RFwu1rpQ8H9Zy8yrgiyIw9URYBGmam1UZIWp
	SQFzaUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wgR-00000000IoA-3GSd;
	Thu, 24 Oct 2024 12:11:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wei-00000000IPr-0m3D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0402A5C3F5B;
	Thu, 24 Oct 2024 12:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6616C4CECC;
	Thu, 24 Oct 2024 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729771771;
	bh=iomfgDWD5CNPh/yQuAmvEh6ZAtCf35TxW+HL9OdkpTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5zfOseBU5At6zcSg1iZeNle02dtD8fPN9BgTj/4GRZnbZiFWew7XC5zKxwgiBpcv
	 vZ02+hIq3qAffniDfFtXzNrJUASWrNEux5QGE4ZcakH2v076KTfE8BHzjAXXd+JpuQ
	 AbsTDe4CIQRqtjkg3cNcfVuR/AYlzv5MzS7TbwTIl1pbV5Mr2FAHr+Vtzsc6RKn+SD
	 uwQQvSLY78eq820+bc7YfyEs603Qtz/Ye/FSjtf+1RTGrnGUDk0L6kzc+I55lYpS6Q
	 vxMlYNmWwCd6RjuDKyPJQo3HyuATn7Ak/CCb6ES3NrQnPsvOCQPrigpfkXUnGo+GnV
	 o7Xg3DS8bV+GQ==
Date: Thu, 24 Oct 2024 13:09:26 +0100
From: Will Deacon <will@kernel.org>
To: Gowthami Thiagarajan <gthiagarajan@marvell.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bbhushan2@marvell.com,
	gcherian@marvell.com, sgoutham@marvell.com,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v9 1/5] perf/marvell: Refactor to extract platform data -
 no functional change
Message-ID: <20241024120925.GB30510@willie-the-truck>
References: <20241016080153.3546353-1-gthiagarajan@marvell.com>
 <20241016080153.3546353-2-gthiagarajan@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016080153.3546353-2-gthiagarajan@marvell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_050932_287463_30E4F0C4 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, Oct 16, 2024 at 01:31:49PM +0530, Gowthami Thiagarajan wrote:
> This commit introduces a refactor to the Marvell DDR pmu driver,
> specifically targeting the extraction of platform data
> (referred to as "pdata") from the existing driver. The purpose of
> this refactor is to prepare for the upcoming support of the next
> version of the Performance Monitoring Unit (PMU) in this
> driver.
> 
> No functional changes are introduced in this refactor. Its sole
> purpose is to improve code organization and pave the way for
> future enhancements to the driver.
> 
> Signed-off-by: Gowthami Thiagarajan <gthiagarajan@marvell.com>
> ---
>  drivers/perf/marvell_cn10k_ddr_pmu.c | 160 +++++++++++++++++++--------
>  1 file changed, 112 insertions(+), 48 deletions(-)

Please read the "Describe your changes" section of
Documentation/process/submitting-patches.rst. Specifically, we're
supposed to use the imperative mood and avoid saying "This patch" (This
commit).

Your other commit messages have the same problems.

Will

