Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BEDCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN44cRPPJNs08AgZF8viTPk0lBwtAQRH0vIjNbzefVw=; b=FYfIcJ+21dKrYAy3KuDmTQaQ9H
	kH8HYFxiIn85qyolYCraxJs7CnBash4xp/dIHB2o66bhJX45jYtL0yrSftthzlSc35mbcC17l0Zf3
	EOqQsvasEwW2RZqb5sdbu8bA/dd7pXlTHvLe7oaMYIbcCmso4hkmG7F6lAkZZcxJYrW7Pduesg0Dv
	87oVq+VDG13z1wD6zne9O/y7gobrPVYzaOrfrhTDmJnUy5GI4YtyZpkZdNj68V8rxP2Erl0F83bAS
	jUt5AQPVwSU2mbDY8BKlSTQC88GcgkC5qnZ20i0pOIgc5btrPXF97O4q2zD4VUEXTWwTUy+GbTryQ
	0PPxAcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmBz-00000004E82-2DKH;
	Thu, 08 Oct 2026 11:21:43 +0000
Received: from out-45.mta0.migadu.com ([2001:41d0:1004:224b::2d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmBw-00000004E79-2zIq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:21:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hN44cRPPJNs08AgZF8viTPk0lBwtAQRH0vIjNbzefVw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458498; v=1; x=1792063298;
 b=D7HiI7b9rItBv0ArdfQPKqwRGyF7N1MiYgg/RAx4FwHLelUtqGR9gZNkkqXgLTsFhLx/41Nv
 AbjyQzZhixr1kYqlY+bJTkuXoRkTOFN1uu/HS13/rh0vMTKU46eStWeQM7pI3kdGvlWavBR5mBO
 XG3iLnwmDp9eNf4kQxUxPCa8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 96e40d0ae3685c43;
	Thu, 08 Oct 2026 11:21:38 +0000
X-Mizu-Trace-ID: 96e40d0ae3685c43
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7299e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:21:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynAjJ0G2nFglGfWDGD1b/zed8LxV3wW7l5GbVaUeLR9l2nntryoWAtrcDrE0rVL/lwKUihNnhddUfXNAnO0NvK@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3Ck9f1QygcmAgkRtjVBqROIJchfJVAZxzupd2Z+xqL37vENAV
	tz7ZhI+bd8bkioYbEeeha9dRAqU718Vp5tow1ILjhn46rI6c46S31gWtwDmqp93sMy9tSdXcpvn
	z9y6F58j4hbTsAHkNFZ72tWewpiLt57EsET7ucoE4
X-Received: by 2002:a05:6512:1089:b0:5bb:7b34:8e00 with SMTP id
 2adb3069b0e04-5bcd41aa2fbmr117834e87.6.1791458492776; Thu, 08 Oct 2026
 04:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-5-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-5-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:20:56 +0200
X-Gmail-Original-Message-ID: <CA+EHjTxtnzcahWPtgvEdTyXV62EuYnMNFzgCbt9sBUe4Max1TQ@mail.gmail.com>
X-Gm-Features: AclHuK9PPIyWi-AF-JOxAvOaLC_7_TBjRNbevEdaA41uckDc-fo7UGZq6QbNwUw
Message-ID: <CA+EHjTxtnzcahWPtgvEdTyXV62EuYnMNFzgCbt9sBUe4Max1TQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MMIO_GUARD
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042140_890067_0F98D4DE 
X-CRM114-Status: GOOD (  11.52  )
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

Hi Vincent,

On Wed, 07 Oct 2026 16:02:54 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> Validate the memory regions are aligned with the hypervisor granule
> before enabling the MMIO_GUARD support. If aligned, then the MMIO
> regions are and overshooting is safe as MMIO_GUARD is solely here to
> indicate to the hypervisor where the MMIO regions are.

nit: "the MMIO regions are and overshooting" is missing a word, "aligned"?

> It is possible to add new memory regions with memory hotplug later.
> However the alignment requirement is way more conservative than the
> maximum granule size of 64K. Nonetheless, add a test to document the
> limitation.

nit: this is a runtime check that disables MMIO_GUARD, so "add a
check" rather than "add a test"?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

