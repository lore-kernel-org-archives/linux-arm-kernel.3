Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D22BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7gQc3QlfR1hqcuIYz4aHZWE5hrbdjYzXkMGRexyCKc=; b=EUBHPKlhdqHHV66EqMvdORYAaZ
	CgLcMkyV1MrfmMikB7zoqP/cT7HZyyJemdD9prZWZbQI58YysEIGB8HKw4MKFQLU2FYovmJzjlVjI
	MMsdWkTZ4EnkhZaVg+HYFC1cbMNJ/VVzJ2s/ah2efSpw1IZDkj0VdxzzQvA3ZZX93lAykXi4dQ8Bl
	Cx1ynJav830LAKkm91oLFXf9Ob2bR3rZnQp+jneggzSYY8pzHishcIqrqJFULDjgEYfWHLkkjKP3/
	sjziRaTPfoXM+oYopkKtZKD/k3Xo682pLjqu0RT4d7K6SS2jxUlaCd7ID0fimJiyTkjQncrv5BKdF
	idHe5ZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLi0-0000000CiHl-2VEf;
	Mon, 11 May 2026 08:09:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLhy-0000000CiH5-1hZs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ED8940BAB;
	Mon, 11 May 2026 08:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9200EC2BCB0;
	Mon, 11 May 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778486985;
	bh=D5nuHM+mugpGQ52uN5n0jU/6pVfYhQKN2nkbAbZm+aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHo/7wVDARqN/DmKY5ZFWVrtLQ3RDTXa0iAJEzkvidACsVtMuPD6VtKXDOf1hmZPI
	 ehy+XYEyctdHURUgKJajWs6c52TuO4lTiOrlyszCpGMaVA/MVTiDZGdJ+zoXDVjnIf
	 jAd/UZMosPZ1bqYz1c2qDH9hmb46PlpYi1rEmuriNTn8F0CP4A0eT5N/nzJL7NkIcL
	 JIzBMKyMDG3g+7GqIopFYPbVWh1Rn7i1skmVTuobOgL/jCrT4xgj0V+igpRxONJvys
	 z56u6wSYv717DvEH5eFEKLhfGUBXHq35tiXRPMM1gKY2KgI+ieKM1UoNUEuJo2Hngm
	 4/TdyLNnOHB7Q==
Date: Mon, 11 May 2026 09:09:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
Message-ID: <20260511-origami-ape-of-inspiration-7b55f3@sudeepholla>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_010946_463058_38825AD9 
X-CRM114-Status: GOOD (  14.25  )
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

On Fri, May 08, 2026 at 07:25:49PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > it was a known limitation, in the SCMI Clock protocol support, the lack of
> > dynamic allocation around per-clock rates discovery: fixed size statically
> > per-clock rates arrays did not scale and was increasingly a waste of memory
> > (see [1]).
> 
> [...]
> 
> > v3 -->v4
> >  - Rebased on v7.1-rc2
> >  - Removed unused info.rate_discrete [Geert]
> >  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
> >  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()
> 
> Thanks for the update!
> 
> I believe you still have a possible runtime bisectability issue
> between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
> rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
> simplified per-clock rate properties": 04/15 removes the last setter
> of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.
> 

I have fixed this up by adding some initialisation in 04/15 and removing it
in 06/15. Cristian, if possible can you check if the functionality will
remain intact after 05/15 ?

-- 
Regards,
Sudeep

