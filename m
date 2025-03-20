Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E294C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSXa0ucjx2iw9Nq/f9zLmD2fUqwx8MG/5t679bVcACA=; b=qKMy7MKC0ksLJYvz7fBfdW1fyh
	xKKN6lRjZG57pfSFw1wUDXd+rSVJeD8AmeuGRHtgFK4uz0b/EwleCCOQBmGyFJWqj9HBYdMVWkppX
	nuIjihIeuoQXdW0MPb9iQJVMQmws3AANN6fkbLOfLWX/4Gh2xJhrL7W3GhLIgrarDqNk8D3LuDZB8
	vInCeFe7re84cNs4SyDDhANkU88oTVmsbhgew+mRK/kTEHeD1K8yNHYBJF5RsGvA1aI7Tv5He13Nt
	EBcTQa4d486NZ+olwWomLWWgCmL1npclmM90s4OdQfbTpOLBp5GMM5qBtqsAspDtjFDPkHU3yQGhM
	e+2WUNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGBL-0000000CHOg-3Zfb;
	Thu, 20 Mar 2025 13:43:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG9d-0000000CH78-2CtO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 13:41:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso8600285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742478107; x=1743082907; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSXa0ucjx2iw9Nq/f9zLmD2fUqwx8MG/5t679bVcACA=;
        b=BBKbm+8cMDTr5VzBxhv3uw3VvgtAuKVATS9ZMpeXfCYvdStuZCPI/EPHERrWgbuETn
         9kbfUpFbHP9OxTdWVXxE/ntM+GnLju51aNciIEH5caTVsUG3WzesxWKqMXvAT87uDsqd
         XdBper8SANqp+lWg8v4HkwYyHPQcSVIirwXbHbnE7Lp+lGy/lnFNcUgs2J4DJi5FsRVG
         ErWA6cxeVYtP8wHYj+GOTkXm5I8Sebis2FJewgoTxnfqAlSH3ZpqY8QDeXSRrfqykp51
         ODMx/yR3tQliLT2sKj5iuYxMzPCREVUB42M/ZKFl6znngCpMB68Bn7aiX6TZYx7ukmPP
         EXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478107; x=1743082907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSXa0ucjx2iw9Nq/f9zLmD2fUqwx8MG/5t679bVcACA=;
        b=PUou0oRDlmM7FD8SEBVIGT47eq9ly1AvWtPSGIGrXLBIlusYBP0OMpr802iSGeYLMS
         ZT6lzI+Ao6nUTUVgN5kJ12EftZKcY2kW3ivznNHfqi1OeSS0AaDuOzKpfZcA96rKCh8b
         LjsrSW+86B9VoFHZYu/0wUWuBCK5WKjnWzW1jkbfGl9NecmbWleUSrRgTUEFM7AsqxKD
         XzT+t0Ja1zGikRtqh3lmsFy9ie6N51YIgrgFHgQKBeufSn5tBfLG72vA7A+wj3Jxbl7g
         d2ZpqUVnRibHzrHhea4dCT4XsZXDNGp+zYWgWnRPiZmrVBuJq8gzzhP8ooiR7R5D0JuB
         Nj1A==
X-Forwarded-Encrypted: i=1; AJvYcCVi3UeU3Phbo6DRUaTp4ot4PY1N/TilqCnuiPP6hU64Om4oG34reQHRRublEm3svcIIteI+ROZPKUNLWffmUtQm@lists.infradead.org
X-Gm-Message-State: AOJu0YylICOZYfiFiZ/1mA12w5+68UAdN5KP+dGk2BebKmF3RHsA4DcR
	O9eGYkLaQFRi8mUF6dH6yVWZawZpwMmSw/2rpsYFlu/kZlZ+zFuAgfemfUgMAec=
X-Gm-Gg: ASbGnct0RyOU+AKnUjXduJCSXxEe0LJjnnpraFwV1ultdXJ1s5nixAHl9SsivkHxNkm
	grGZ3XxLWO1c9l2nllBJ83cKVLCZNm+t+Wj8tnyxFdcc8EqPTjgaExRVMDwkFxqsOKsuRfqF58L
	X1Ix6iUQvpJAYdegaNyBfN3zBzakU7X4KUKab6K+M0V1kG+0Ju34YELCnXk9nVSxfEn9hvkhljy
	yAqN1l9Rd8LeDz0miMqU00Ou+jGc3aw7kT1fDX+oAebDDJUDYSwaHJapYwnVBxZ99wcbgJ6wfZO
	3+U5tpeoKFl5Xji1iBo9ryI9cFQ7LnQZqKLGXACQLGmjiVw9Bk60EDNoWL9kmvPtDvcZ3PMGMhq
	quTZkeGqXwOU=
X-Google-Smtp-Source: AGHT+IHB8Jpq/dv/MF5Xpnl20lVwYehCBg2fUw2R2WxrWPUwJTYa2KVgSsV+p6JoZMdI4aYop1tDlQ==
X-Received: by 2002:a05:600c:470b:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43d438abb10mr66472345e9.30.1742478107437;
        Thu, 20 Mar 2025 06:41:47 -0700 (PDT)
Received: from [10.1.5.55] (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f8679bsm50112995e9.40.2025.03.20.06.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 06:41:47 -0700 (PDT)
Message-ID: <818de9a7-b308-4e00-9eba-3f58e1d89bbd@baylibre.com>
Date: Thu, 20 Mar 2025 14:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: config: ti-sci: Default set to ARCH_K3 for
 the ti sci driver
To: Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>
Cc: Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com>
 <c506a805-9221-4afe-8d98-af0ca97a1fd2@app.fastmail.com>
Content-Language: en-US
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <c506a805-9221-4afe-8d98-af0ca97a1fd2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_064149_694400_C9E862EC 
X-CRM114-Status: GOOD (  16.94  )
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

Le 19/03/2025 à 22:45, Arnd Bergmann a écrit :
> On Thu, Feb 20, 2025, at 14:31, Guillaume La Roque wrote:
>> With ARCH_K3=y we cannot enable TI_SCI_PROTOCOL=m because
>> ARCH_K3 selects TI_SCI_PROTOCOL.
>>
>> Modify the logic to enable TI_SCI_PROTOCOL by default when ARCH_K3=y
>> allowing us to submit a future patch to remove select on ARCH_K3 without
>> breaking existing users.
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>> Link to comment done on last serie [1] we come back on first version of
>> series[2] to not use imply but set deps on ARCH_K3 in driver directly.
>> An other patch will be sent to update Kconfig.platform when this patch
>> is merged.
> I just merged the patch and hadn't seen the earlier discussion,
> just two small notes from me:
>
> - thanks for doing it this way instead of the backwards 'imply'
> - there is really no need to split it into two steps, since the
>    change to the Kconfig.platforms file logically goes with this
>    one and I would merge both through the SoC tree, having it
>    as a single patch would make sense.
>
>          Arnd

Hi,

thanks for merged.

i do what we ask me in review in fact or perhaps i misunderstand sorry 
for that.

Guillaume


