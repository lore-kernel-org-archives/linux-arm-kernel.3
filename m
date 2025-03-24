Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC65EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENeTUflag0l1WgJ9MraeaFTIx2U/M6/MceOO9Gs6H40=; b=ZdF1bjXO+XTLwjxgKenowPg2nL
	8B4slQirMenFPUNmGqM1nyz/Hm7HGQicWe8f8d1Mh5KWR8sfR9kE5YRmTxUFdpzg8m+NthZSQ4eF+
	/UNEl5VXhp8z8ibaOzRM1CKT2cQ5APP+epjdijaH3sEEMj7qnZgjsjY5l8cBbo2vl+KNRLyVbLrNY
	Mt6OROdI07Q3PIZHKiAhkf66wE0aDJxaqmFqHTVGDYqS2FHCUYvNJMTjIR0JE34I4rgWNEnwHBrAO
	2csgUSTxCOjSU0Cx+AdQ8O/74edsi6G9pWqyDRVErQKCkn145PnLgaSrhkhvO5WEvnmeJrlsss36m
	f05eVQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcW4-00000002UNg-1zh1;
	Mon, 24 Mar 2025 07:46:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcTA-00000002U2d-0dLY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:43:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso21022845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802214; x=1743407014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENeTUflag0l1WgJ9MraeaFTIx2U/M6/MceOO9Gs6H40=;
        b=fjHHijztSA/jiW5J1ZJv5X/fBp64p30Yq2bGakpjjsGVCAELN3jEEPcLtonxyVw0zU
         3o6cWa+Q1LyIIKt68diCSWC1s4Lf4/4ZFheH/lxkuOGsm1+uFVm/pUXQkrtnC2u51qcS
         TSI1y5QjXcpbCAqVC3n+Mc5tQ8ma43fH8w3q7XjSHcBN+RdIJp6GGPMoVsWSR81ZN5qo
         uKya1iZE25My9hzleJamn8PIoPFEp5iFEmWQwaOK8MJtm15b4/E0dH04Beigh+3rU1Jx
         L88qua2mIe2tupsNfjNWdcVFEebV4kBR5U8B/pClEcEXP/3xLmas7rLtP5psrIaaUwhY
         BJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802214; x=1743407014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENeTUflag0l1WgJ9MraeaFTIx2U/M6/MceOO9Gs6H40=;
        b=e1snTew5YktSC5DA053P39jHRz2M7kfuNtDlFflDCGuB2BaMruhJWSzfNHs1vhi7lQ
         izTP/6ZwaZTyzFZl/o5wSiyB91a2Kd0BoHJAtZ1bQvlRDakxmFnyfzFo5uDiOc96b5Fp
         mPruhvKjdlH53HZ3TENtFfAGp044k+gOS1lCgWAPMWKBUfy7acNS28QUj+vJWnRERNQa
         RgwCERl/lXP4a26AbfjgSwKKfhg7dQCGAhamwNuyNj6NrsmOJWI+yXssI2UMl/mi/8Dw
         ZKoEQ73bcyhTRkk7ihZ2hdBGJPDRbAcpCFzXUZW1VOJUtHh0SL1W3BBU2anffwm407pH
         wRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX648Smh9icZ8DAQ+Cza/iY4RosBLejNTLW6KaOZ9MYu/xBh8teSXt8stT9aJQEfpRwBZvTPJpDG/dqOPjh2huf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0UbalI8/lMcY0v+YbBtMsekMoYcRA62skmMCMvmUtKy4bIlcs
	H+ik5JYF8KmBYsreueQvui5pbUgBWibfDWXeWU9SQh4zHY8QoqxSGvexzlSK8pQ=
X-Gm-Gg: ASbGncvsB7dV/kBfSHTCZoNmDTfIgkCo0IOUJUsG+LFVzSk0l2ilRiPvj3dsCAqsQfg
	obH+6hyRuBXsKdIoqRTvjWaO8Xb2uWY6Z2Qe19qWMTFB6zsQfHcJnsG5Wrbs9IOiQSdFRhmNYna
	rmjwB4W/mfaNXmjBawij2FrDkrWvsF2YlGWSt803YDOYu8LMtuS7ucRsFfHYWtN2yLY/7XqJ3Cn
	TGBAzv/UjxSMSrGYtyVeQDta6fhcHNgEOfDT5nNpZzmF/VhyLAiHWcyotAyHESvMgOmlXxcgcBI
	eeACxUHvCrGexv+YLa9EUkq9c9rhLbZh1iG95BLTx3bDhle4Tw==
X-Google-Smtp-Source: AGHT+IGmGmS5ufUfMSrgfk7DIRjiH+iIQAHj6POw/bNjEYZrqwMBfch1zIjXMn5LOd+CGNnKdNiELw==
X-Received: by 2002:a05:6000:2a2:b0:390:f400:2083 with SMTP id ffacd0b85a97d-3997f89a039mr9195803f8f.0.1742802214396;
        Mon, 24 Mar 2025 00:43:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9eff9asm10311692f8f.92.2025.03.24.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:43:33 -0700 (PDT)
Date: Mon, 24 Mar 2025 10:43:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	James Dutton <james.dutton@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: wifi: mt76: mt7996: avoid potential null deref in
 mt7996_get_et_stats()
Message-ID: <d723d5c1-ed17-41b8-9bc4-274fd8e2b615@stanley.mountain>
References: <20250322141910.4461-1-qasdev00@gmail.com>
 <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
 <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
 <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
 <223c7280-443d-49b4-96b2-90472339dcd4@stanley.mountain>
 <46a53498-6c20-48fd-b090-02163baefddd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a53498-6c20-48fd-b090-02163baefddd@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_004336_184055_19337A04 
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

On Mon, Mar 24, 2025 at 08:33:39AM +0100, Markus Elfring wrote:
> > Also the "phy" point will never be NULL so the check should be removed.
> How many tools can help to determine such a software aspect with
> inter-procedural analyses?
> 

You can just review the code.  There is only one caller.

Btw, it's fine to have unnecessary NULL checks so long as they're done
consistently.  Generally, we prefer people not add unnecessary code,
but if it makes you feel safer, most maintainers aren't going to nit-pick
you about it.  If you are doing the work then you get some say your own
code.

regards,
dan carpenter

