Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2DC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7ToUrKObJPKIOVkevwffLEL8FdMKLuEHQdCANKFQD4=; b=YutkH1MZ8mC8K6cSXYwCm++2wb
	mPP/6CoBH5XmDtXxLUvDhYYzgAANQLrn9rs4t/CY0n4Srwb1IUTL/+K6z+xgN76gWCh+O4Lht7PgY
	NVF/ByL8RqT4lpv/YLULGDt83baqZDboPMUa1oYREyDj2F1ixwXbPLuqH3Z660JONpQdnTD9xTVDA
	nGTqdghhaEl5QT4S60vbbjL2zhFh4vo/PexU+iilOn0pN7bl07YZPpcPt1F6yeNOMxaTNI6gRO1fx
	7EtjnoM7+RzcjgXPFK0q13I/9NhkYaYaKU2OL6zmkiQiJ6ocpfAmCl4un9dki3/hNXHOGo9FRtPg3
	YsEkKjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcj6-0000000EiIP-38CX;
	Mon, 24 Feb 2025 17:58:44 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcgs-0000000Ehs9-0TW9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84DCA611D9;
	Mon, 24 Feb 2025 17:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DE2C4CED6;
	Mon, 24 Feb 2025 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740419785;
	bh=Bt7VoPhcsSkXtYjPHqWG20sRUthCsltNi81xM60UOWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGXguZ/qhyClnkyquiJduCOndGjtbuEHy51vgO2CgfUp+T7mVmkc/gKDJZNqC5YqC
	 kVwpTJYN6GbyDaTm+3LcD85SnkMHbJu6PHfmbxGA49igZ0gZ3ee0MDti+bO91h3Nuj
	 sSwbgSKaWxVxDz8JD/OjVoZBXjyKXAsusTV3Aemn57N1Uhgc1SuKoMBq/tuQVWmw0+
	 JjkF8BUo17JNM5rkz8L4FhL4EXQ9xc5wgRhmDWbU28fsCkO/V8bdrp2FRO3UdFmjX6
	 dr93AlMnkFKsR52pEGJaEVA8lSw342sfv/6nOulOwG7yv++fxZM7etsczsQGkiDMj7
	 FpyDIUi3HerxQ==
Date: Mon, 24 Feb 2025 17:56:18 +0000
From: Simon Horman <horms@kernel.org>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] virtio_rtc: Add PTP clocks
Message-ID: <20250224175618.GG1615191@kernel.org>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-3-quic_philber@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219193306.1045-3-quic_philber@quicinc.com>
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

On Wed, Feb 19, 2025 at 08:32:57PM +0100, Peter Hilber wrote:

...

> +/**
> + * viortc_ptp_gettimex64() - PTP clock gettimex64 op
> + *

Hi Peter,

Tooling recognises this as a kernel doc, and complains
that there is no documentation present for the function's
parameters: ptp, ts, and sts.

Flagged by W=1 builds.

> + * Context: Process context.
> + */
> +static int viortc_ptp_gettimex64(struct ptp_clock_info *ptp,
> +				 struct timespec64 *ts,
> +				 struct ptp_system_timestamp *sts)

...

