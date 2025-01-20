Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C6BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxDAs9qqak1APPUkWh3PHzlur/dVlkZRuIQl8TruIDk=; b=sAqBMO7qwxs0zwUWDjQGjSQBU5
	urMAKOqanCpwgdyZ/bmSm/XWiCQ7aZVQHK7a8QHvAP/xkuUvxv45hfBs6eXNUF3nFbo1T0nhNP3/2
	X92zZRZUi/KvZu2AqJmM3eiLFYTbNQ7V1lZ0DCa1+cttZ/Nx44212gM02PAP42sUN+pS7+/IgivjP
	MFV8XLZmsCs/sHTKC4GcOyvYw+MOgAj+r2zMLZQi1T2V1pIESqGirkaRJGYHMrZr8lCSJh/j2bKI0
	8nGZNr82zDJQju2qMe2jAkCpl2AZmC6D9lR7mHb6vQXPl+HP+pfvi08zPmmBzWyztVbWdPsoG5QTQ
	515M3g8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtsd-00000005u6q-3Ktf;
	Mon, 20 Jan 2025 15:39:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtrL-00000005tt4-2KaA;
	Mon, 20 Jan 2025 15:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E84D1A410B4;
	Mon, 20 Jan 2025 15:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C85C4CEDD;
	Mon, 20 Jan 2025 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737387518;
	bh=DVUvoJIHLiUYHupURPdG/3K0udtI8Y/qhWh8bnVptFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3MZly8yPEL+ML9sLcHzsTD0LwexfWEiUnaTZIJU0aXwTh6GhvCCIP7W1DRx3fpil
	 72Zff62OeO1hkHNid+0UkJU1sh2inzL0uBbLXD9WhQW3aQcEBbYAiClRp33k/D7aEu
	 5jAZB2HlDbwg/PkNhL2zChp3iIDw2COUu4AidGcXrb2xKd4k0EDzgsD9OVCY3Ta+C5
	 jShBIHt9Bz4TOLfku4Xt/A59RTbC0F2dfx+533svJsEZ5vW5bPLq3UkFL9Pgyp5meI
	 oHHCHjnFXSV93lnFKAF3GL3w66oKEnIwfYADNepXHfoQxG6je+oEg/lLJFtkeGdRcB
	 bYJ4LZ5u4sGTA==
Date: Mon, 20 Jan 2025 21:08:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maramaina Naresh <quic_mnaresh@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Minwoo Im <minwoo.im@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
Message-ID: <20250120153821.3v3c53sc43a7yx7s@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-2-quic_ziqichen@quicinc.com>
 <20250119071131.4hepn6msmh76npi7@thinkpad>
 <57d52f72-31ec-46cf-b632-74b09e29f501@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57d52f72-31ec-46cf-b632-74b09e29f501@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_073839_724333_53256936 
X-CRM114-Status: GOOD (  25.34  )
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

On Mon, Jan 20, 2025 at 08:01:03PM +0800, Ziqi Chen wrote:
> Hi Mani,
> 
> Thanks for you review~
> 
> On 1/19/2025 3:11 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jan 16, 2025 at 05:11:42PM +0800, Ziqi Chen wrote:
> > > From: Can Guo <quic_cang@quicinc.com>
> > > 
> > > If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
> > > two freqs,
> > 
> > 'amongst more than two freqs': I couldn't parse this.
> > 
> 
> It means that the devfreq framework will tell UFS core driver the devfreq
> freq, then UFS core driver will find the recommended freq from our freq
> table based on the devfreq freq. For legacy mode , we can only have 2
> frequencies in the table. But if the OPP V2 is used, we can have 3 , 4 or
> more freq tables. You can refer to my PATCH 8/8.
> 
> > > so just passing up/down to vops clk_scale_notify() is not enough
> > > to cover the intermediate clock freqs between the min and max freqs. Hence
> > > pass the target_freq to clk_scale_notify() to allow the vops to perform
> > > corresponding configurations with regard to the clock freqs.
> > > 
> > 
> > Add a note that the 'target_freq' is not used in this commit.
> > 
> 
> Sorry, I don't very understand this comment, I mentioned the "target_freq"
> in the commit message,  Could you let me know what note you want me do add?
> 
> > > Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> > > Signed-off-by: Can Guo <quic_cang@quicinc.com>
> > 
> > Signed-off-by tag order is not correct here. This implies that Ziqi originally
> > worked on it, then Can took over and submitted. But it seems the reverse.
> 
> Thanks for your reminder. Is below tag order OK ?
>     Signed-off-by: Can Guo <quic_cang@quicinc.com>
>     Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>

'Co-developed-by' is not needed unless you also worked on the patch. I guess you
are just sending the patch authored by Can, so you can drop this and keep your
'Signed-off-by' tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

