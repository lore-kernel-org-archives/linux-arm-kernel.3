Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087FFE937E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuDLpwamG2K/aC+3YrERa3F+bYmVu7zYkpiCoY9LE0A=; b=x/TGiA3wkT5cSWjNWrQuwjanCz
	dKB6bE7+CcVacyZa1CRWokzi7FNU7WcumLLX675AH+cOaz3MWw07gWOjf+2B12PXG9KPgccRsDKTH
	uL4CP0mNS9xaGycuMxp5HlIuPEzZkNThfvBeYTq8FwtQl74PH4gq6rCh+lCLhJx5+KMy1ItX9OJ17
	L5kMtl9O/h5FrdD4/ypTcT9qBZ3M6X6KN4qTP+hKFeNbR+4jb2Jx1IHYsPxwT1ZJqWQmVshOSJ70T
	vVyKPyY1/B9Sw5KyCcWzHBhzyRL2OJvmrwZWK36Ui7Fp2DeFoCyq5u2w1fmTCxYVn190o6AFhf4+q
	tacTuJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvBQ-0000000ELa8-18Kk;
	Sun, 12 Apr 2026 13:49:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvBP-0000000ELa2-0fYc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 13:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1608D60008;
	Sun, 12 Apr 2026 13:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884BAC19424;
	Sun, 12 Apr 2026 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776001741;
	bh=xRit3coA5ALjqymrXb9Jm+t1aohcwzdracpGa7ViDpo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eHX78UPPYC/i5w0AO0mnUByU5g2ysz2YmpabquM/5ppN2V9E56Qgvj7Lcg6T9aVbC
	 uSBq28PYKBa4i+muvHMAunaMqlz7DBwxPVuXQEdapBwqKnIzgTWg53xj8yFMQIADkh
	 w96UWBZKuPkKF65t5MHym5ZWqVk+siKUaYpoL8QVta2JFl37W7GBh4VjTesaNz8CrQ
	 T3AhjeeyWbJnLJp6bR+wTRV8VlwgI67/Qn3IeJDDlpz9w/dhPAZLkTwSOsGH7jeQ2T
	 MD4r3fdxTJeO38gJ8yMOcdW8H4pYC3Lr4MOIbZd4uVKhM/6PvslZ2qg/S5HGClrtMG
	 5F0VL8EDEB8Jg==
Date: Sun, 12 Apr 2026 14:48:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Erim, Salih" <Salih.Erim@amd.com>
Cc: Christofer Jonason <christofer.jonason@guidelinegeo.com>, "Simek,
 Michal" <michal.simek@amd.com>, "O'Griofa, Conall"
 <conall.ogriofa@amd.com>, "lars@metafoo.de" <lars@metafoo.de>,
 "dlechner@baylibre.com" <dlechner@baylibre.com>, "nuno.sa@analog.com"
 <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, Victor Jonsson
 <victor.jonsson@guidelinegeo.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
Message-ID: <20260412144852.3173a284@jic23-huawei>
In-Reply-To: <IA1PR12MB7736D5B150CA36406ED7384A9F5AA@IA1PR12MB7736.namprd12.prod.outlook.com>
References: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
	<20260307124118.1d527749@jic23-huawei>
	<1166aeef-0c93-408d-b265-9037f2840074@amd.com>
	<IA1PR12MB7736AE6EEE95D5D184A15B9F9F50A@IA1PR12MB7736.namprd12.prod.outlook.com>
	<GV3P280MB00657EB1524612E9BA0142DEF35AA@GV3P280MB0065.SWEP280.PROD.OUTLOOK.COM>
	<IA1PR12MB7736D5B150CA36406ED7384A9F5AA@IA1PR12MB7736.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 7 Apr 2026 14:30:57 +0000
"Erim, Salih" <Salih.Erim@amd.com> wrote:

> Hi Christofer,
> 
> Thanks for the details. That confirms it.
> 
> Jonathan - this one is good to go from our side.
> 
> 
Applied to the fixes-togreg branch of iio.git
Very unlikely I'll do another pull request before rebasing that tree
on rc1 though, so it will be a few weeks.

> Thanks,
> Salih.
> 


