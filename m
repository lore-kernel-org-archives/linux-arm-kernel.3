Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1620EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhXPnr03Y/leMepxSCjQSHMXa+oDzBD6QYUvs+/AppA=; b=rFPMwQElCQuVy8FX/dZI5YDHAA
	ZSNd7UPp1jd+zA8d3qpcCQDX16Uz8ktpE6HMlglENnPOOaSk2wWmDaBX1E7TT5haM9jAsxgTDSGg0
	jdJ2w0pifHiBThd9qc68pywzaJPR8XYS9ZA1MS/A5FbnZ6WLjSD16KbbLKCLkDAEATmRT7OF9jmcG
	nrB6g+xsGOpHGkyQWEOkX9QAr6aS+JEpsY4HbQa5RZ0o8SmhafQECT5DvndmQhMq/I8v9D+b3G4WU
	+BHlAJkyARiOLKX8ErM8Izj8YwSKZm/sluon++JRgXUP89Lmh15JGQI9wPLNCq6eF0smKjCEpw1Rf
	GdfRObpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiwp-0000000Gw4Y-3TAL;
	Wed, 04 Mar 2026 09:55:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiwn-0000000Gw3m-06Yt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:55:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439b78b638eso3225274f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772618115; x=1773222915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HhXPnr03Y/leMepxSCjQSHMXa+oDzBD6QYUvs+/AppA=;
        b=b00WESqjztIM6RYu4acO6yr98nopsmsM4Bl46q+NqFfUR2Z5nv212wMBP+3rR8seeF
         TdkTuUZUy/wdlfU04N4kP6Lb2PH9MFwQfBFRlz3P2JN8fmuveqqlKm8Yxvv2w0jvOvG2
         HWV70IniK18JFibpOFSNTuegKmBNMkFO7H6Vd0aW76+ytLS3lkoydFCy5s4ELH96EKMH
         iOK3XFeidiu0GsGhnI3eDUNiF/PLB0xEzeMgyHU1qlLKw9M16YmI26kHlKwKY8kmWT51
         u93vlnid9rBKDJHVYmEj20hErYVfh7xATWcW+0Xh7w+9wYrpMIxRj2ytugXd3Sb7k9al
         1+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618115; x=1773222915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhXPnr03Y/leMepxSCjQSHMXa+oDzBD6QYUvs+/AppA=;
        b=MGr63QNjP0EJc/qunQ0Gb13KN/29pVQK020BKnTwPzv4RcVuReTz2GFmoTWa4v1kqY
         nxYEgIw9qVYOeMi+r0Kec52RHIHfY3d+fcXOWcRCOGEGxVU4Zasolmk1ejcRBdjEYQbu
         tH68Xl8pKcxbbaYEQNAwku5oPV+ReGAiVBFhatbO8NZyZMaOpGfaLRVcZBx6Egih5Cwg
         djB42ll+E80UObhKvo4PUOkP7HhlMRegtz2Yf6L9bOBiE7XROCE/MsCzkitzRRSZ5KwH
         DP0WZ4a9Q6DrB6xGA2L4Rencj1wggRujSJ+sgG4bFVaXXg0OmJwhnKWu2KKpSD2xEAfl
         3bhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkD1cdJE2kgO11yhWVroIZQFm79qozTs9eIMzTW7NiT6SMarTXhiDzs+l1J/O6CVwRmLzWl1hsyYFbK06Z57PI@lists.infradead.org
X-Gm-Message-State: AOJu0YxGdQZ3zpIzhfYuFRc7EQJeqHmcyQzWrrER1F1GMGAOeHrGwcKq
	a6U/4OCeis54eRQpfF8E4AEPEVNq3qZoBRUVTwdEKgNTp2gReiwHfPAt
X-Gm-Gg: ATEYQzyJGRtQoRD/wuSHZkDsO6vacJU31M+FMR9MRewDX2i67Gd1Cn5uaG/3Dhm2Y/X
	ommZTy02Ajs9m+y4WJ8rmy864SL/uo4MjTRnZR1uQlw2SR2tlCBCeqIOr90LLVxMjRqfqAmcWrG
	RY9OI5lfrCcE6Nn6nzTWzJns+N0HHhtLCNqaMJ4DwtBWrCviP3fPqrK2atOXHrSv8zAFeZwuDPO
	dhJ2AiOp0UtWzlcbZeEdM/hRSb+sf/oMwD3XOBK51ZPLle3X0AGxyyLx3w0tkHmglhL5/Jz0zEy
	/e78HZ3lQw7Z//jgU7eR2n/7HiLvGsuvyE9gbXwVQtRUhV33KKJndfCB0+HL8v0F37BHM0SOJ1p
	QfocQoPh29Xtdr1vavfMel7j0alBc5viFmPqDwzUMd/cThtqjonbLzBRionj7H9D3AkxlkBJNeR
	npyYDfmSOEvtcFm/0PZGtTzG04Bzc4Z2Bn7gvhvbI=
X-Received: by 2002:a05:6000:1885:b0:439:b788:73ab with SMTP id ffacd0b85a97d-439c7fe63e5mr2428249f8f.49.1772618114586;
        Wed, 04 Mar 2026 01:55:14 -0800 (PST)
Received: from [192.168.1.116] ([176.74.141.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c4489279sm9971477f8f.20.2026.03.04.01.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:55:14 -0800 (PST)
Message-ID: <97515a2e-38a8-4795-ba6c-45bc3b6cc507@gmail.com>
Date: Wed, 4 Mar 2026 10:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@infradead.org>
Cc: Joachim Vandersmissen <git@jvdsn.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dm-devel@lists.linux.dev
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org> <20260303193102.GA2846@sol>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20260303193102.GA2846@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_015517_100235_ED1B47BE 
X-CRM114-Status: UNSURE (   9.24  )
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

On 3/3/26 8:31 PM, Eric Biggers wrote:
> 
> Maybe the device-mapper maintainers have some insight into whether
> anyone is actually using xxhash64 with dm-integrity.

Someone requested to mention it in integritysetup man page
   https://gitlab.com/cryptsetup/cryptsetup/-/issues/632

I think there were more reports people are using it in some specific cases.

Milan


