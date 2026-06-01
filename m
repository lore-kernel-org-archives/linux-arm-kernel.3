Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E07CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DjmUwOCGOcB+Zvv7fk+Re0YCdBWlSozkc1Kn99ViNo=; b=rxUFFBITsO4080wY/nxkCpcuI2
	750o66NWWyJ8LbfKX1Vd1lTnme/XtOtczOMZF1e5FEEe+znNBfEf6pfo7zXEWCZ9LpaqEspnYom6W
	4hFo8kX5Cjzc2fYaSX2MZbx0B5cecJn5s4/gDxEnBvXHaJT2kJIPaE7gATPnV4PDIjZbC9DZQgSWc
	K3TAGokIfLRpWydt9cnSGMHVya2RSNwFXhxN0UF1iQ/UaR91bjpIAie7lBjtCV56q3s9BjTMu5BGS
	xC1T6GnmDRnkQiFxOHO3duruvbUKNsFJDW7NvwYby0SsIK5lwacFbpi2NsT/1gPA3g2BJgfNhd3Ld
	mH1y0vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyYl-0000000ARqp-3zGG;
	Mon, 01 Jun 2026 09:03:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyYj-0000000ARqX-1aYf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:03:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490a7627033so9346295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780304623; x=1780909423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DjmUwOCGOcB+Zvv7fk+Re0YCdBWlSozkc1Kn99ViNo=;
        b=GRQH/MVgDKxscq0Ay7JwnwN1flDxfaK95IQ7ZdXw6LXDSKQ0cX61DRBEowyWb4jV2h
         wGrWbPtoz2KMDKFf7MfvNJC8fzEQE2X0NDapUZh4TSUOxFY21gqR3uhq1M9mKUeBpziq
         LI3Lwca28ACe7tYiWFE7e7HAGg4Jp4BX42aV3s/VUEHye9EQqmGqKSY9MNLGeeRE+90D
         Ib0Rx9EcftBrWib7yx/uaJgtnZDtkzqDA6t0w+K2YezkmYI2kOc7BrWHf1qO2yfk9uFh
         tbl31MF4+AlO+cVtvv3cSaLf6bt0Kup/Q7EiSHN4dAgTIdWT/euMHDwWEM1bthhq1V5p
         USuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304623; x=1780909423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4DjmUwOCGOcB+Zvv7fk+Re0YCdBWlSozkc1Kn99ViNo=;
        b=T0eb4bQw156jg6mB6Tsoz1Rm4bonC/5baBXBBcR35zyv+lccD8CDFpUvtM3uimhOgJ
         a/k10phoABarYR7jDZD74NEYU31oI8r9TvDtdXG9YYxPdOfqH6RyyEDfnc4J58CwRV2O
         wA96wlaZzw4hvPXfd79WF9EqHpA588p/4CQI9OOGVVsPddcLIJv0mMcoCxphpxWanNeP
         voQeJaVubdnH2qwzAbuCbIxnRuas4l9pQE2PgcUu8pyQ0vow1B/CEqb1FWugTXgY0TQ7
         9NUgJwd78XNpLBv4vtUI75lSJSrnrxGk736NStQpCtO7z7P3D+DYitSvnHbqdGT9t9gj
         pqyg==
X-Forwarded-Encrypted: i=1; AFNElJ+jwpx5iuHBpl4zx9hg+BimnntQI4I1Dmf6zdeW6WfkN7WC12mvGz4NOpWYmu8f/3MrWWCPTv6RwbUCjXlU+rho@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5wNoqU7adiRLnlFLZfLfZMQE6oM7D6s51/gjxqAlXMrFv8bI9
	NYmRoz76+t4Ob4CGvzicsHfOOTQS7DJOepaRplOP9QARrXsFf1vLCg1mHjwf2/4FfMSQMtfx0Wl
	LviPnxkA=
X-Gm-Gg: Acq92OHbzP9BlTCPHrVgvVAmEurOgzyaqjNH9ceVFongANC1l6UVrNEh8OyXR8aCS6a
	s7FfpAviY19WdEgic5EwZ/zfDipVgoAJjx4oW5LPAaNWmoTJig2tjDT/KhuDkqY7Qmn1QZKZPuG
	WOEIKSHIcGmrN8Pr5nPUBqm+KHex+fZWyb53o0epy+3l73B4eeKPg00lohgNeY7Fqv1gHdKk9pW
	CdcIDeOhDPRze4cfjcIcP+kqO6GCVumQzYqDazuD3IXJitm9BzeMQL1n01+BcCgPIR3MGlmFqcH
	hthuu/HcqdEm66Fw0dJNxUGDe8jGF4Gl5FxyoVEIjCYdL06cXaaFeBmKJcLnEZ1oqVMFcNq6jf7
	LUzgY5BpSq++l6eI8MZ7FVwwDppK4NO5385zhV2PT6cyYPVmkuinn+m+QPaz/lBFN95mcySxzeC
	o0UW0kd0nt8VlgvFsOSJb1xZLrpa0DgzhHzvoWLJZFjBvwOJdHq/h59/yJagBqfonpaAB6
X-Received: by 2002:a05:600c:458f:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-490a2915aedmr194248805e9.15.1780304622657;
        Mon, 01 Jun 2026 02:03:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c127befsm74525925e9.31.2026.06.01.02.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:03:42 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: l.rubusch@gmail.com
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	davem@davemloft.net,
	herbert@gondor.apana.org.au,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nicolas.ferre@microchip.com,
	thorsten.blum@linux.dev,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: Re: [PATCH 10/12] crypto: atmel - update workqueue flags and add flush on exit
Date: Mon,  1 Jun 2026 11:03:29 +0200
Message-ID: <20260601090329.52616-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512224349.64621-11-l.rubusch@gmail.com>
References: <20260512224349.64621-11-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_020345_420697_9CF04CB0 
X-CRM114-Status: UNSURE (   8.31  )
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

> Update workqueue initialization to use WQ_MEM_RECLAIM instead of
> WQ_PERCPU

Not sure if you're working on this series right now, but this must keep
the WQ_PERCPU flag. WQ_PERCPU has been added to mark explicitly mark
workqueue that are per-CPU (it is the complement of WQ_UNBOUND).


Thanks!


