Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBF3CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=; b=vH5hLNzdaCJMtwUsghZsDFcv1a
	2UHJ1tjFeI1cg5E5ARgt/utr7FC+4jZA8gkhSvKVDV2c8mxZ6mimLS2csubpPUJO+rr+wQ3ACofCK
	WxMhIbRmRJJRyRvUa5NYN2HsJm9frvXtMAONCD+AriHqud6oXlVBU5+tR/33yc0AwRjpldJern5uV
	PqPOkl7ktIVICGdQc+R3QLitjJig1ZDhsNxFQ+T97WoMBBfXBh81kyXxIQMJ2aqkAgxJIGClvzuTU
	Q/NQDjQ4jfpeepPD2gQA+GCip4yfJ2T9L/WXeljVUPtU7G0FR7ZoMTY2qxKbcBM7+inebGmBsw+LU
	7aB/fw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrLY-00000007CE2-1JFv;
	Wed, 03 Sep 2025 17:32:36 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnjz-00000006dGX-00xm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:41:36 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d71bcac45so54971067b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906893; x=1757511693; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
        b=OQdh41lebVSgnt8TKzwXF1K3Y79Ye1oYOEUKdgi764jS3tqH5uASLmVB8z8dJQAvtA
         hdvrF0cXvQUjZzBESKwi1iYidQLV30OOd6ZRcws/zJchJ1eUVwY8Iavd3KX1CvlxA/Jw
         b13wMV9O9HEuMe9A/M0Nhvs3OVnUqQ9lKWotKU2H2MvgtjY60FchYCgH2BQtpcynkIdG
         XfxkA9uqiQqQicCyRWmUUZ78oXYCvUl9mdK3/ufYouHV7SV4apLs1+oAZBUVTN2HgwQ3
         tzpJdsgd8GmwNwy78QB5xVKhztReUNEnNi9K3UMW7iS3nVn1DUXniTHvMjgQQz41Trek
         EFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906893; x=1757511693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
        b=KRdH8MGxHU8PNPcGYJ2DffnBvo6k0I0b7GbGe0BAH1Qg5oxr8LuoGqqf2JyCxoX99x
         wEJLpXI1Y742VaolbV3PdrFjHE62559HvD5cRTKTGEMjjmvptQFjKkudpJQNpPrGSmB1
         dyOC9fG3byoHQW5ZDcP4bGcBEuJ3+NOUpmPMhd7xeio0nMVsN/ORTFQ/mu39AdyAxcMY
         ueGMezWXfmU5FgdApEnPGye9lfysRdJ6vN65JcLxpTw9nfMcEQDdttKSOY6VnMf3rok6
         TfnkCCOV4Ep1Cl0YASNpv4Y4+jmYLikfS9wWSmtwlGTjSMWEt0HL4bwVHmfc95Cm67zS
         mvew==
X-Forwarded-Encrypted: i=1; AJvYcCVNI12WH9Ue5OU4x2hpqchK3VEuaLchGhm+1FssEoQEInX4y6P89PbQEyRK8+PcS4vUXdPtV1jXriO5zpOMalnu@lists.infradead.org
X-Gm-Message-State: AOJu0YxikVpQa21wier37SIkMDvhNQrgvtEFwHcT1bgH/pjIkrrVOE6r
	FRA7Znn6paS7wK96u9LngOFAa+lnmVonLiZ+3UqtYscueeJ6dNo5woJj
X-Gm-Gg: ASbGnctCMuUfVYre2294j0F8vOEoBZeghmU2oDitTnfaKIaDVrvz9ZBUYCUOFozjXgK
	OLGkJPPtg3EiXBou6VuvTl/MZjmlefUjxMWVW/IVqnxTqQy2lxG8U+bBMW8gACKGGVUsEaWMGJ1
	JnjNnMljnexnftKR6Z2YrUF3s33JZqWeoDxLEca6TTUpxTUG/vwAnyF5upK9q0Bms2Owkm702uG
	/Y3zRsjzp1sAh9NDK1QKHMAsIAIn5sTtfAvlO0hkIua6tF0+9tGs4gHqevSGrTm32Ks/nQtlj9W
	jCgInLfwinyBzQPQyQ5eYr28SQhbFYVKIK7LKp8MBhU6NUE5ZFeAkS0zuHdsCYmefg3sL5KOyBq
	PvI0/dbzeoBpGI+7mfyfQ9ghHnsyMnPECh6EpNuQ8owXkPKcrPoQ8
X-Google-Smtp-Source: AGHT+IGnjHsAyQljYLZz2UQHy207mYMU6/HFTBywuxhNBv3nxCgO5MpvlVh0qFbK1/Zdh77rKiaXnQ==
X-Received: by 2002:a05:690c:4911:b0:71f:e430:666b with SMTP id 00721157ae682-722764acba5mr157076777b3.32.1756906893562;
        Wed, 03 Sep 2025 06:41:33 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8329a4dsm13556527b3.22.2025.09.03.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:41:33 -0700 (PDT)
Date: Wed, 3 Sep 2025 06:41:30 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, Frank.Li@nxp.com, yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903083749.1388583-1-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_064135_040622_B78CF949 
X-CRM114-Status: UNSURE (   9.72  )
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

On Wed, Sep 03, 2025 at 04:37:46PM +0800, Wei Fang wrote:
> Some PTP devices support looping back the periodic pulse signal for
> debugging,

What kinds of debugs can be resolved by this loopback feature?

It seems pointless to me...

Thanks,
Richard

