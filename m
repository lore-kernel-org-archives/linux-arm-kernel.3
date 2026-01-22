Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1DAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkpa5OxWgCp3h7DkI1J1tNafsGslYSORVR3B/thOJ8Y=; b=3n5AIXd0V2dLE5GglB9QynyrF8
	Zq/5brWIrTAy405diAXlAKesSexDxHFDtHzzZ5QCumLtIkMCyWiiuVYydqJe4rkCATgjwEZovfy2t
	O4hhk24s/YjqVvZEexqBBW3w7+qWnFm3bOSp1PSW4y83inNHMsgFJomCXsqpCNukjhTluQXz5tpya
	EClFOFkcO3weG/6p8S2xQFRXTQyvRFSH2Y0OY0qcZTwWZMYHK2ntCLDU+kmZmC4eqXpbWV3EnQI84
	tb0CwSGSzDsDXEUqevB4SMrZYMKTjFX2FFPY2bbyY2zLDuuCkdquD1a75fVycdGf+9wIhY/VIYf/+
	sH21bShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visot-00000006xiQ-0wxT;
	Thu, 22 Jan 2026 11:25:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visoq-00000006xhs-3BmD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF1E342A94;
	Thu, 22 Jan 2026 11:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56207C116D0;
	Thu, 22 Jan 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081143;
	bh=rB6oVz9be/E1Ki17Rez7m48bfgIZtYeVWggaFcuAcDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iL6Fd35IcopbUCLSakYEU6NDu+RELMzIoVWs2RAcJ/NcpUL4ULxqV355DiXkQCKkr
	 X989YsUZnYgdLsaO0KFoHBAzvWvZzHeQgIfF2eICG8gSs6jZkASHmEjJeIk4PIKM+a
	 Q9Er+qpmLt0ymtLpdZIYV5tZuGzwlxdp+TMMocn7n83OZz58n5S51x1CsZ3BfCoiWN
	 MW8cyAxqZEEdKKXoI686cG5UITIs6v4uMwBqIJWedVyfjsKJFo9i2nlgKANJWKoadt
	 1ETA0FvOplm/LjrZjKb0oZOicANezz2dRMrCQq3N2uDq6EPYFVwgSKyO0xP7jXvhGk
	 fd3XeGLtDpDyg==
Date: Thu, 22 Jan 2026 11:25:37 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
	iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
Message-ID: <aXIJMRcfuJwi73iz@willie-the-truck>
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
 <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
 <5a8fc32f-0a4d-4b76-8093-faf9207a4938@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8fc32f-0a4d-4b76-8093-faf9207a4938@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032544_816824_17D6D680 
X-CRM114-Status: GOOD (  14.52  )
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

On Thu, Jan 22, 2026 at 04:52:10PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 1/21/2026 3:56 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 20, 2026 at 08:41:05PM +0530, bibek.patro@oss.qualcomm.com wrote:
> > > From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > 
> > > The ACTLR configuration for the sa8775p MDSS client was inadvertently
> > > dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> > > Add actlr settings for mdss on Qualcomm platforms"). Without this
> > > entry, the sa8775p MDSS block does not receive the intended default
> > > ACTLR configuration.
> > > 
> > > Restore the missing compatible entry so that the platform receives the
> > > expected behavior.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > 
> > Missing Fixes tag. Otherwise LGTM
> 
> It looks like [1] hasn’t landed on any release branch yet - it’s still
> only present in Will’s tree, which is also where the referenced “fixed
> ‘commit f91879fdf70b’” SHA was taken from.
> Given that, do we need a Fixes: tag in this case? and should it use the
> same SHA from Will’s tree.

I'll add it when I apply, no worries. Still playing catch-up with patches
:(

Will

