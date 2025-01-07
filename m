Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468F2E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4XeFeiFVsGRZffdM2vxTTFEKD3RxCPAOIYW+hH+96o=; b=YMnzB/zFNL5vD4IZ7wyeWDPuBF
	ndt85g+/3nxots/2/nfZ4ZzXWG8GqlhU4EgjpLP57kOcu5Raa545BHHvxFtT6AP9Z4lmSDihoiutQ
	jvVcJgH3UFUNIWZVsXEXQv/K5wif86QppZ6oT3dig8Bz50ofnBTodZ9kvQVJSgruXlie6ISLQbUta
	8f7utTwz+Rsu0Rab9gIr3dZRZquA8DDKSSN8a6NRhiStKtXd2HC7pIHiW5EEO/RAMEo573lcsVXqU
	tKQdxvMbnPhEkZf/kuHztiadSr9ggAOQPMxXynShGSdkuavy3Yf3mjcJjSvd6MghCEvkhpTsOcBNA
	FupNcL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBOO-00000005PVd-2p9L;
	Tue, 07 Jan 2025 15:21:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBNB-00000005PGj-2to3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02EEA5C5F32;
	Tue,  7 Jan 2025 15:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE55C4CEE0;
	Tue,  7 Jan 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736263200;
	bh=HW5UP+Hh2z2a22Lx+HwnvhXepcphCb4HK1NIWFN1HuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDKST+jn66IN7CqV7Kww2DUrbI8shNCa41lebRHzR1NDPBLqt+t+PxQj1y72pHYe2
	 /IgZg+/Yx1YGcuCN2yJc1MZp854BuAyK9Y0jitUNZo5WcwksYZSAuK77tRRK2/mfeg
	 K1L8870o8OAY4u/eUTJQi4oCX5tlLOdqeCm/BUyI6MqVDFQtC/eC3bgG03XF25/nlv
	 vTttlFQL77zUIXc5FXvNflBt326zpSyLaSfee4QkMDjXUsM1l8zA+KMZvRDkH/yHdZ
	 BF7/cTsRtEkiNAqYCkHQTenlpkTR5DH2ChavbXaU8al6mo1setNVliE9KNVd2uCaGK
	 k92GtyZBwseTg==
Date: Tue, 7 Jan 2025 15:19:54 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: cputype: Add info about some Qualcomm Kryo
 cores
Message-ID: <20250107151953.GB7368@willie-the-truck>
References: <20241219211131.2389091-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_072001_779277_8ED068A4 
X-CRM114-Status: GOOD (  15.36  )
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

On Thu, Dec 19, 2024 at 01:11:08PM -0800, Douglas Anderson wrote:
> 
> This series breaks off of my series that reworked Spectre BHB
> mitigations. Originally I needed Qualcomm Kryo IDs because I was
> adding "guesses" about their Spectre BHB mitigations. Now that the
> Spectre BHB series no longer has guesses I don't need them there, but
> these two patches still seem worth it to land on their own.
> 
> I've still called this series "v3" because the first patch was part of
> the v1 and v2 of the previous series.
> 
> Link to prev versions:
> v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
> v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org
> 
> Changes in v3:
> - arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
> 
> Douglas Anderson (2):
>   arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
>   arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
> 
>  arch/arm64/include/asm/cputype.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Can somebody from Qualcomm please provide an Ack on these patches?

Thanks,

Will

