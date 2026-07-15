Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48891C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BArhhnpdI/Cv8HoI1hRJgRyqIoDXROOU23KIbFFyDpY=; b=q7K+JLrwlfCz653e6AIJ/cADsE
	f7cFanrxGfzrkmxjNFy0gkKubAasKneKTdIaHiI8eTqoNzVIbeoPsYc6EdH/KI8JKeAL/ZpHWCzny
	KihlDvWSdCMm0/9V2thmNHYh7WaL0On0IJ0RxrRPDDtXML5OsC3U96enb6aN0YG11jCwH2HVGUEfH
	X2cRmSD5ZNkmq2ZRWlc51hwaGSCLu+0IoWNnczO9EPhyjQqMw78BCLbkPuyfYT4S398dNrxG6ij7+
	L4tqRHXiwc2gglFzwMF6Z4oNv0SbykPfK0yTBI1fvPMXYOs9PjbwBL+fqYDmKAdCN6Ul9LDtSpw0R
	75VFtCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0AS-0000000F2zd-0bsz;
	Wed, 15 Jul 2026 14:00:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0AP-0000000F2yH-2lDS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:00:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493ec555a26so35550815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784124051; x=1784728851; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BArhhnpdI/Cv8HoI1hRJgRyqIoDXROOU23KIbFFyDpY=;
        b=V1hEvxLgF3nlyfTDpuvisgHZRFuJheEawKg2lzokLMnkfef5ZunhYd5XmCWStu/PxT
         7m03+HKWJpoKJZ+v3+gHWWb41UYsx9bDL01IIQxpgZC5DZwLTT36cjzC51IvBcVGC8se
         1T7pp2I1GC489WmU0AMJmWFjTvEqDiL/Zr7N/jiI0eniyO1S8PmcrpliC2sYwP7O2YRv
         fUcZFdOKFDuN/MeMfTudE9SInq7kTwhOkwO2dGISql4eI3fNMARP4aw5q1dYY2Nh7TBJ
         QSXYgzG+shOTMzMZxYo2yjOu5uKJxM3Dd2y/pahkzg4+Gz4FAH6/osAGEMrg24/BC7EI
         KZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124051; x=1784728851;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BArhhnpdI/Cv8HoI1hRJgRyqIoDXROOU23KIbFFyDpY=;
        b=nX4nmc1smjAq2e+3J51g91k6eThHYvjprXr8xLzOsA9H2t4OJs5eaCM5KT/R4LcHpa
         OvmR9DVEkkiZAvV0C82HGOh0LPmejyuTLuO2Vgk7nAUbaPdVzMSwkgFPoKkL+wKRFG47
         AEhRn0cflVD4s9/L1YC7s0bRG77LQ1VmvpSSVcMFS+r6XkhnM34gRqe5v6bnttq4++09
         0akAaSokWYZAOLO2LJfwiMmeXSnAspSiz187wHfuwCv4Jo+TuoPHAsr6nSMNfHdbpvaS
         z87V0cnHJJuZCufEG6k3FP5CrihFM31ZvYAKRbogdzSmGIg1g4HHfGTGGTv6ASJrjU/x
         YBCw==
X-Forwarded-Encrypted: i=1; AHgh+Rpynq4N1zzb+Ma/+KmjNJsnpKPxbF36jF1qePNKXsck5FeXraH2sdEm8YucFCH8rLT4bXe3ixvTdU8d4BgxnkAj@lists.infradead.org
X-Gm-Message-State: AOJu0YzSjYO54kJg7N/wMuNDhwE+OAlIRY4Ql1/E5mTqj9xJMXCHE86a
	JOqmM/lSHYKCC/MpRWjeqSZ17QIrOJ1uZ4ZiTwEkZH4pEhmbxKNODsXp
X-Gm-Gg: AfdE7clhm5yMXehKbszipexuFxxI3f66npEqwwPUxo/KMtkvLPiE7ggALfPUF8zmkRj
	Elb67Era75IsJqiMeGQuU+0GPmc4yVYzLnQ450PHw6AjCvDPE+VghkJ/chXrBKe/2DrQaOvFPTz
	Xp60eNGA7uxdsaz/dBYx6lpx9fm7y+nbXucUF26xPfj5hKrzXoFDXtFFbLkIXyHrxPzcOVqc5sr
	2ygOKA8YAFGBXJAKTZg8oyFYIVnNzKA9r+qECvWftW2bh28wiX7Pb+Xv2cLH1WLv6EH9kzAYHnk
	78siQN5+I1X00nxom46hs3VEP4i/kEhq3wKO+KdTcnWlFtTZi8/q83Lasb+ubLfRae3N3MkEqef
	RoSP3WihtrBhwXUVmY3/9o7p74DITR3+xTn2B9QAf5IKE0cTSgHUHbc1/yP5VNfEtiOU8mlNNY2
	TjYx5Lny5Um5cUbOTIrtUeL169ShDP3QozVdrCqeWa0uYzCol80vLSnG7oYSIa2OKs62OdfbuU7
	VgwlRb0MOQZDfw9zdsawZwall/eh5sV0LBpy0AwZU3qYTQvVgzZR6Zo+dethsD7nXyAmILuousJ
	xvGLfQz0+UG3tLF7Mxvt14M3AULDxnSdHfpOvgvhY0/quHXikqrA5z9BTpMdm7PLHM6WU9/hxHX
	oc3vE9LEet1f2Loo67czHB+U=
X-Received: by 2002:a05:600c:6211:b0:495:3a21:4e5d with SMTP id 5b1f17b1804b1-4953c001211mr34667645e9.0.1784124050314;
        Wed, 15 Jul 2026 07:00:50 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2edd6fsm150750035e9.11.2026.07.15.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:00:50 -0700 (PDT)
Date: Wed, 15 Jul 2026 16:00:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, William Breathitt Gray
 <wbg@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>, David Lechner
 <david@lechnology.com>, linux-iio@vger.kernel.org (open list:COUNTER
 SUBSYSTEM), linux-stm32@st-md-mailman.stormreply.com (moderated
 list:ARM/STM32 ARCHITECTURE), linux-arm-kernel@lists.infradead.org
 (moderated list:ARM/STM32 ARCHITECTURE), linux-kernel@vger.kernel.org (open
 list), linux-omap@vger.kernel.org (open list:TI ENHANCED CAPTURE (eCAP)
 DRIVER)
Subject: Re: [PATCH 0/3] counter: Remove redundant error messages on IRQ
 request failure
Message-ID: <20260715160048.00000737@gmail.com>
In-Reply-To: <20260715135030.326290-1-panchuang@vivo.com>
References: <20260715135030.326290-1-panchuang@vivo.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_070053_714286_4764AE53 
X-CRM114-Status: GOOD (  13.94  )
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

On Wed, 15 Jul 2026 21:50:27 +0800
Pan Chuang <panchuang@vivo.com> wrote:

> Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()") added automatic error logging to
> devm_request_threaded_irq() and devm_request_any_context_irq()
> via the new devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> Remove the now-redundant dev_err() and dev_err_probe() calls
> in counter drivers that follow these devm_request_*_irq()
> functions, as the core now provides more detailed diagnostic
> information on failure.
> 
> Pan Chuang (3):
>   counter: stm32-timer-cnt: Remove redundant dev_err()
>   counter: ti-ecap-capture: Remove redundant dev_err_probe()
>   counter: ti-eqep: Remove redundant dev_err_probe()
> 
>  drivers/counter/stm32-timer-cnt.c | 10 ++--------
>  drivers/counter/ti-ecap-capture.c |  2 +-
>  drivers/counter/ti-eqep.c         |  2 +-
>  3 files changed, 4 insertions(+), 10 deletions(-)
> 

LGTM.

-- 
Kind regards

CJD

