Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224A5C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YO4iO+4RoSYMeteNu9nUAyD/efKBamp9eHyouwcTSY0=; b=whjy1HHdFAx2cvn7X8RmirCrTO
	6xQI1MtlBesu0PI/nBaZRJbNQLY+euFJ92eGH3AyyFA7xFGWvQWs8wSiyC/q+9HhI/5HapN7ROFVW
	KIoDyMyGEBw95XPPK3oI/i1c84aHDJRZdWf7uSdW/OjxqV+iTBEcJqOLujyn/eaFpmqDA7Tl6LoP6
	CwmJ8LlN8qZYw81cP8BezOYPfIhtJTP3NEO0o8mk54VEsEdDOGbTbq0ssGpYJTStBuHuzumhxZmhQ
	FWov/5gp6SbJZzDYtfVso02NvhPBJmT7schYSYTdynSY2JKkbEXreJVWTV+J+dzLY/XQ/ZYZw8+JP
	MUG/J/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHOR-00000009Yow-0505;
	Mon, 13 Jul 2026 14:12:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHOO-00000009Yoc-3yiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:12:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-475881b9a4bso3200171f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783951938; x=1784556738; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YO4iO+4RoSYMeteNu9nUAyD/efKBamp9eHyouwcTSY0=;
        b=QyWmpelYfTsK9FwvYWT1SV2tlVPwed8fDqZNqxEZTU/WWj74ql6Wfv9S2lYDq91cCE
         Zpe5fhCk2bbWoB9eQ7kefaoNFDgKRy/LtRdftBPoVEHn0c6iETvxJ2WlPjeCoUVdAv/c
         L9u4bNXc2+1+SQ0+916Dr83827ZZYmRko5LgsdCBJCerC48uwytS3uSDHOoRCGgvA+9x
         u9B1AMRd2Gvb/EeXGU3HqHExxvG49HhoTvX1izuInwFoxp8aXo8QF9LwvbAyG9wzGM1z
         oTAAD1sZl6BzG01zqGl9xlqScq7XbagJxUI85Ok12hrBWRQfc6YkP3+N7PjWLq0WfltR
         mxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951938; x=1784556738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YO4iO+4RoSYMeteNu9nUAyD/efKBamp9eHyouwcTSY0=;
        b=W7OOu1HuA4k6/IVeR6bNbl3NUICxtrj5UDexZ9bBuH7Bvr+tuj60tAkXUER89HzRgR
         TLGWBop3I4VshYOEzVBXQgXQfCSwfzpGnENUIZ8RouRAlV/Y8wMJRyVHB6lyFeSkRF1K
         OYTv1kXViguZ9mmakDFm2i8piSaTKmBTtmInPUaOfxWWYCGm1qK+0ar2mQs6foG3YD//
         TnXrzfzuFnJuXvDIq3XTaAKr5a9+C9r6vRWf7KqiKFFCSQJbMhMTwjjuMf3b+CH/06kA
         s64MYr4/sgV+i7idu1UQJtnYaOTtkyecYzhkX8OJnvop2WnR2H2NZoHe90TmySzCS4Aw
         sxWA==
X-Forwarded-Encrypted: i=1; AHgh+RpFHgUaJNwE1kGaugnnPi0EvxuI8y9BAMWA9fjp32NX9OIncMXY02ujIDfd9GFe9/XeTiaW2g62cvTrNAO5Ekdc@lists.infradead.org
X-Gm-Message-State: AOJu0YwvO5gqVDC+/TCQetfNeEeIqMjgo7HPaO/qCTFNrEwGsOBO8U0P
	/29yg8kI+r+d7XSk8lr9gYqC/njj8qfEUeAD9ObdFjNLkWT7r+G+IP2M
X-Gm-Gg: AfdE7cm/41nb+4fdP7pWL6V0/Jt2YUaU3Gtwq9csUKdUAxkOdurVLtrkUjE2gCMG2I1
	LNidokOs0xxYmVNK1xM00aOITYR7S8FTJFuJCRtcuxpBarQeGhsEG6+AREVVCJzIkUob8I0oC6W
	ZSc15mayPJG178fe2FcCSZP6wbb7aL17zwQ7aX0BpUtwlx2GFYDFVGj2zz4gsgbP2togR9R1A3+
	v041sKKsSOOwa8hupaG+JBisS+YMDHSaaSsk/vt8N7/WD2UCvY35qyX+KCDNmRlmeaZuOIm62zf
	o9pyrhwn5YVREdUlmzB4VoWPWybJ3J+jCQGK+ElzFEnsdLWsih9ZWDXS9sVOYucyjD4msNL+FQe
	c/R6n4dCa9P18FYGsbbY8IvUAK3pITzCdvALioPTJdGPc6eow+Jj75NsWQC7NCqm1gKIvXedeLy
	2LQpAD4YJq6F55i9TnL3gRkUPpO2l8BrS1Hzi8TWGpITRb9g1NICetxoIxpwonkeDa1qFeSQuEO
	L61H+JctKsWTYMbHSfSKag8AOPYahOvmTi7lsRs1srXzetDcDRlnNE1EZuAecJnTeMV8k7imTd9
	+lr1KMG1MCIw936ve+eelwQ5JGN0dH4GwRgibY44NLHbhJkZ1aW4CjmUqSlVfccUS6s6y9XNcSY
	65AmNbDVWpe1cvmJZAk0mkF6pmRkiPkDqMw==
X-Received: by 2002:a05:6000:400a:b0:477:3d23:f920 with SMTP id ffacd0b85a97d-47f2dcec627mr10652902f8f.26.1783951938155;
        Mon, 13 Jul 2026 07:12:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm84998163f8f.34.2026.07.13.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:12:18 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:12:15 +0200
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
Subject: Re: [PATCH] counter: Remove redundant dev_err()/dev_err_probe()
Message-ID: <20260713161215.00001cc3@gmail.com>
In-Reply-To: <20260713131005.306069-1-panchuang@vivo.com>
References: <20260713131005.306069-1-panchuang@vivo.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_071220_995884_E09DC0E8 
X-CRM114-Status: UNSURE (   9.07  )
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

On Mon, 13 Jul 2026 21:10:04 +0800
Pan Chuang <panchuang@vivo.com> wrote:

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---

I think you can drop the commit hash and title from the message.
Otherwise LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD

