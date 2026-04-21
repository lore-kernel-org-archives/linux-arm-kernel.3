Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82D0F327BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rltM23Di8hY7tnmaulytFk+gPpnARdKWudYC6F/dOUg=; b=cJPxaXV+W9eXBlZiCMUEieDOU+
	9i5fZ1QsQTpzxtdQl3onN1wPa0mg8zetLVMjARfg6jyPbKB47VbFJPsmitHh1m+OavXFMKQtgwre1
	/uIMs1oUiHyO0cUfYI9X9K/VYK/LE7wx0ZLCQsBULqJmWrp4N5y1XfFrg9X/E5c8vW/+o1jpApEX2
	zVdi4bPOhHEFnpMiLa2Lbspt2sirLzsBWNOzyvpkj27TZxj49n48pkmA+2QsNr4WAO65o4Ko1gTQr
	I3DLX6odXJ2ezzNgUVUhmLUq/FZWNzpjgY2PdWAUwz0ADfglqWkbE3Ut599XWXz3tpKK49URFA8l7
	CIpM75KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7iY-00000008Mh2-3OpV;
	Tue, 21 Apr 2026 09:48:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7iU-00000008Mg7-1XZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:48:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F1AC26A4;
	Tue, 21 Apr 2026 02:48:19 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14A783FBCB;
	Tue, 21 Apr 2026 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776764904; bh=qE2+4kaBbTNPJvtb/mGE2xnzlgcKXz3scid3Ytm6884=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4+PA36gui3WIPus546arAP5ZBBKx3O6Kod1/X2wa388i6goFGiC6rV2CrViGz/UN
	 JY7hreDBBR2LN2s8/kS6/is6uC5U2bAHDULbuWKgQ30gdPKEJbwi2f+0gCPXiCk34a
	 bfqZuTRpqIljDoJMAz2vSGfoxDj02P9q4KqaZHb4=
Date: Tue, 21 Apr 2026 10:48:20 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 01/12] coresight: etm4x: fix wrong check of
 etm4x_sspcicrn_present()
Message-ID: <aedH5Art/JbnQ7fI@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-2-yeoreum.yun@arm.com>
 <d733a0b3-60a6-4bd8-909a-a2ee0c121dde@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d733a0b3-60a6-4bd8-909a-a2ee0c121dde@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_024826_641136_17121B4F 
X-CRM114-Status: GOOD (  20.12  )
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

On Tue, Apr 21, 2026 at 09:47:54AM +0100, Suzuki K Poulose wrote:
> On 15/04/2026 17:55, Yeoreum Yun wrote:
> > According to Embedded Trace Macrocell Architecture Specification
> > ETMv4.0 to ETM4.6 [0], TRCSSPCICR<n> is present only if all of
> > the following are true:
> >
> >    - TRCIDR4.NUMSSCC > n.
> >    - TRCIDR4.NUMPC > 0b0000.
> >    - TRCSSCSR<n>.PC == 0b1.
> >
> > Comment for etm4x_sspcicrn_present() is align with the specification.
> > However, the check should use drvdata->nr_pe_cmp to check TRCIDR4.NUMPC
> > not nr_pe.
> >
> > Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
>
> Fixes: f6a18f354c58 ("coresight: etm4x: Handle access to TRCSSPCICRn")
>
> With that looks good to me

Thanks!
>
> Suzuki
>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index d565a73f0042..74b7063d130e 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -89,7 +89,7 @@ static int etm4_probe_cpu(unsigned int cpu);
> >   static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
> >   {
> >   	return (n < drvdata->nr_ss_cmp) &&
> > -	       drvdata->nr_pe &&
> > +	       drvdata->nr_pe_cmp &&
> >   	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> >   }
>

--
Sincerely,
Yeoreum Yun

