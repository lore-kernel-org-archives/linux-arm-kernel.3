Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483DEC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGlhvHhCc7BXtmP6dEShzUyy1yLVf8RBaAuDCtWixsg=; b=Zw7D8P3x+e/DuooAqLULTYNAg3
	YZufdSE5UdhEpkpyuzVFfglMHCZuz0ylLJaxjNSyQox/0KycGqvF6iyivLIDtPJnvcjKvJt1E+xZY
	PIFhDnVplyTsaHx78VFxta9jdHcRku1kllTcHPIjsPZubYWFrR+OQoiwusBEfxspGzlo9DPEr1fUL
	nV30MN2l+RGxdH/A9MXO9esX73HgxHPicqx3OzM3YQjC5lA7SBnST+ITkmxgo/meF21anQ12Q3m4t
	RNNnBeAUGQU0kVcsOBoZFxa7P6dmOpsj4vNavgKAV+msMG/TTvAxy7r/EzmoF7KxUv0Er110iYTnf
	2iFOI09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Zt-00000001Ex7-3mdG;
	Tue, 04 Aug 2026 07:28:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Zq-00000001Evc-3Jij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:28:44 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 063B9493;
	Tue,  4 Aug 2026 09:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785828448;
	bh=1k+t4VolBe0laWMSM35QlxzZTvElA+9xlWizIlipJKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ikSm3iVo1D6z+cyqqS1JsZ5232679qhOk1We1P5Mvcw5SYW6ivf8PMmAzN9JW4Ery
	 4wMk98jfC5XOTSgi0lLWZPoO1Yo1h7VG7Xu9vCh/sfPsZzzTzj4SlgkB9j0NNwqROM
	 cojNekDAdSHknZuL0almOiW5mU5b1mWWStlEuojE=
Message-ID: <dbc0aa08-fadc-41bc-a8f7-ba39719b6479@ideasonboard.com>
Date: Tue, 4 Aug 2026 10:28:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
To: Alex Bereza <alex@bereza.email>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>
References: <UR3xiwNn0coPyYguDWjjQi-IWPyN8Surtot50IAldzugiznKwuwlVUScNRaQ1TMK5KEQcdglATeQVSWqQrsOuw==@protonmail.internalid>
 <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
 <DKFZ162370HZ.2XC8HNVB1DU6H@bereza.email>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <DKFZ162370HZ.2XC8HNVB1DU6H@bereza.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_002843_271670_478E0B61 
X-CRM114-Status: UNSURE (   6.50  )
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

Hi,

On 04/08/2026 10:12, Alex Bereza wrote:
> Hi Tomi,
> 
> seems your patch is not based off the current dmaengine tree. Please
> have a look at
> https://lore.kernel.org/dmaengine/20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email/
Thanks, I missed that. Problem solved, ignore this series!

  Tomi


