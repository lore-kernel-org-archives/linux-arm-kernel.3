Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C65C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gbpsai/LhrNPfjSDLQaQK/5b90CAD+pxt6CDRDE9jrY=; b=jZMoFEXlB9vrjp8kiWkL2jSOsV
	48dCbSZnkSPHmJ8wtYXlPDUrWCPoQxKv17YRsmXv8kaJNnzikhkodS9Sr+Qb7XTDmR9g+s4ACtWEg
	6S3kbIQm+PTKAEq7sncO6E7mHGnwqNGEGYHrz9nDpBjrBfGdlaR2NcEC7PVzt8/ft4oq/REGstE1z
	oUlzf+gH+3GaIb56SbUaverdxw/aGmuGfOYDcqut3K3CCWSKYsODyqTE6d1DPTlVSl5YpC5dcVSCx
	nk/fKUH+3LSC+qlTXTqX4gTAHtQVcbNRaJPfjHTX1rpQHtBpjm3gLgujNdACVcp7oNLF33nrwzI0y
	NvIZKG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGxA-00000008Omv-0Kys;
	Wed, 12 Feb 2025 17:55:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGuZ-00000008OLu-2gI6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8002EA40F45;
	Wed, 12 Feb 2025 17:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B181C4CEE2;
	Wed, 12 Feb 2025 17:52:31 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:52:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
Message-ID: <Z6zf3YJq6qqoJQRi@arm.com>
References: <20250107200715.422172-1-dianders@chromium.org>
 <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
 <e6820d63-a8da-4ebb-b078-741ab3fcd262@arm.com>
 <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WTe-yULo9iVUX-4o8cskPNp8dK-N9pKq6MxqrPX3UMGw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_095235_747465_369284E3 
X-CRM114-Status: GOOD (  13.58  )
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

On Wed, Jan 29, 2025 at 11:14:20AM -0800, Doug Anderson wrote:
> On Wed, Jan 29, 2025 at 8:43 AM James Morse <james.morse@arm.com> wrote:
> > Arm have recently updated that table of CPUs
> > with extra entries (thanks for picking those up!) - but now that patch can't be easily
> > applied to older kernels.
> > I suspect making the reporting assuming-vulnerable may make other CPUs come out of the
> > wood work too...
> >
> > Could we avoid changing this unless we really need to?
> 
> Will / Catalin: Do either of you have an opinion here?

Is this about whether to report "vulnerable" for unknown CPUs? I think
Will suggested this:

https://lore.kernel.org/all/20241219175128.GA25477@willie-the-truck/

That said, some patch splitting will help to make review easier. Should
such change be back-portable as well? I think so, it's not only for CPUs
we'll see in the future.

-- 
Catalin

