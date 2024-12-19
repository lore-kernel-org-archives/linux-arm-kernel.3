Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359CDE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTNj229VVZk3lJQPlQTDhCSH+IbhHNfCsxHwqEtZnIA=; b=EW4wz1HOVZjwdKSTonoaWmSEK7
	RreQltNptECVt8ixDbzbdwHSQoGNfpZ0p59bUCVIKW1za3NqRHypgT3kOM7OKH/n7ADM7ykN3CqQv
	b450aaR4JbfeeFLSMFdmXiiJEc9+chJC738XhWvM/dJlOXq4T2CB+LKjV4TbTZ+yOCmyEefPN2IQU
	McS2UvMvlLOYRnqkWvcuQQAOtICOTsUY0lh8PcEmau7Pr4lyqRzohKArHcVOQ6tv6YB4Wu4SwbK/2
	0dBvFccAqrSRXP6j8EbXccC7ziVJasRyzkYuusETERt7JJOwS0VUe8KM+N/yYCLq87Iw4wuAeoSrG
	6p8Tn7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKud-00000002ggV-357v;
	Thu, 19 Dec 2024 18:06:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKgR-00000002dCW-0Vt3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 992985C6260;
	Thu, 19 Dec 2024 17:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D1C4CECE;
	Thu, 19 Dec 2024 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734630694;
	bh=mQhuLz9tB1b4rMtMDBUwzTyOUylWB0rq8Uw9EnJkeJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUWDX+wdWE+4qT6IPuWnw0OM+pH5ewsQlPNY427+g8ggMUC0S/Kh7FG+fcYEO/60P
	 p0EbtyjpK6LsDXT5V/SuDHFgfy0BgZpGlZiCHCiZbXvUMEo8foREbdrJzDNNCsRn8X
	 pOT8jiddQ9Mb+aS1U22qValRQ0w7meP4XbmqViftCdUb18Gej65qvwLQrQmkf1tNji
	 rs1K49lQIxCKU5QpIhDOh8o0oohuDefzlCG3DYi54YKTHkeD63vsypGUsqsKpTom/Q
	 Dak2vHjXTwo/2S+Fsj9v12FjGp7hLzxUllaLsiK0LvpUgqpz/BaMgWQ512sBxiV/Wd
	 OVOVkKZIPJ3Og==
Date: Thu, 19 Dec 2024 17:51:28 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
Message-ID: <20241219175128.GA25477@willie-the-truck>
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095135_249135_66898CA5 
X-CRM114-Status: GOOD (  26.07  )
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

On Fri, Dec 13, 2024 at 04:52:02PM -0800, Douglas Anderson wrote:
> The code for detecting CPUs that are vulnerable to Spectre BHB was
> based on a hardcoded list of CPU IDs that were known to be affected.
> Unfortunately, the list mostly only contained the IDs of standard ARM
> cores. The IDs for many cores that are minor variants of the standard
> ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> code to assume that those variants were not affected.
> 
> Flip the code on its head and instead list CPU IDs for cores that are
> known to be _not_ affected. Now CPUs will be assumed vulnerable until
> added to the list saying that they're safe.
> 
> As of right now, the only CPU IDs added to the "unaffected" list are
> ARM Cortex A35, A53, and A55. This list was created by looking at
> older cores listed in cputype.h that weren't listed in the "affected"
> list previously.

There's a list of affected CPUs from Arm here:

https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB

(obviously only covers their own designs).

So it looks like A510 and A520 should be unaffected too, although I
didn't check exhaustively. It also looks like A715 is affected but the
whitepaper doesn't tell you what version of 'k' to use...

> Unfortunately, while this solution is better than what we had before,
> it's still an imperfect solution. Specifically there are two ways to
> mitigate Spectre BHB and one of those ways is parameterized with a "k"
> value indicating how many loops are needed to mitigate. If we have an
> unknown CPU ID then we've got to guess about how to mitigate it. Since
> more cores seem to be mitigated by looping (and because it's unlikely
> that the needed FW code will be in place for FW mitigation for unknown
> cores), we'll choose looping for unknown CPUs and choose the highest
> "k" value of 32.

I don't think we should guess. Just say vulnerable.

> The downside of our guessing is that some CPUs may now report as
> "mitigated" when in reality they should need a firmware mitigation.
> We'll choose to put a WARN_ON splat in the logs in this case any time
> we had to make a guess since guessing the right mitigation is pretty
> awful. Hopefully this will encourage CPU vendors to add their CPU IDs
> to the list.

Hmm. We shouldn't have to guess here as the firmware mitigation is
discoverable. So if it's unavailable and we're running an a CPU which
needs it, then we're vulnerable.

Will

