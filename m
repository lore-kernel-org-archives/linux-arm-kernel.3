Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D06BC36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 05:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y17ZL3We+j0Um9q8f67tlcHCzUzcIfQ03LepCBYfNfQ=; b=4xi8dapK9CJy4xGhtZObepUkOX
	7+0xjEnDuVaM6IcdsPXeHGgufogpmnyozh7wEvj3Pf/HPw0wNcBcMdyL7C2Tf3WTSOBJZeRkLXREF
	4PdW8t5gDlCGUsF2QBed9JR5+TTeclPz5+JbuNjYn42t1/ynpGpte+9OCM+nLSLo7M9SCjMCmvAaF
	2A89gIR2A3gdm8xzbImrS4KIrF2OlMgnLfgJKNrgf2LPbnASDkja7AXXHXmXeDkBBk7NXzEVBTA4M
	Rv7p2BTfH0Lylvs8B9KmgkzDw5nEG3KedWNFJ+cy9iHUnVaAgpQHfb2S3g5kPWVtH/18EdLxB9nr4
	1udaux2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twaje-00000002GzV-1SMk;
	Mon, 24 Mar 2025 05:52:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twahu-00000002Gqe-3Pnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 05:50:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso26565645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795441; x=1743400241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y17ZL3We+j0Um9q8f67tlcHCzUzcIfQ03LepCBYfNfQ=;
        b=lNo7Pdqv+aqweJ1WAzq/01Y9Ee4zzogJ6k8jP1zpfhrQK4FG+gBp7N7UnKe5cgOnSS
         Fp+xutyJ5R11pBH7BoVV12Ef70VmIVzXCXzIM1KBIMtWbq3te8ZGUukkkCZ35nFbBEou
         2pCYcvFd2Jj6e4wvuUMKZtjV1R1nmkKsp7/Q99ar6jRAWtZAw/dawyhdQ0VIbb5Ca6uI
         Ug+kwUhMeGwst6QihWmP2txg1127RqJDJqSFz6M7JdljwA9hG00uhd6IiFmGacaOizvi
         uJ4A4ZZTEOJEtnFd9mBPjnjgfioViGFuXKU/ULmAbOLYthFrjiqztqk8mQA6QEax3VWS
         oTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795441; x=1743400241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y17ZL3We+j0Um9q8f67tlcHCzUzcIfQ03LepCBYfNfQ=;
        b=PqozbaN+MJTk/a1fBMuBlD1Ea6X7l1cnFx9AdEMiiRYhXOoKkxWM+Px/1YBCk4Cvm9
         hIWwtFQewK75btwLhyPJkgsu75XnFnqONsJsPXWYwWcuGW62/D1eC1+SiaHfIAkrjn35
         U+9ao8UI3Gw/T1TnAtE4tCarzustSgpPLbkmwNiV8nm0xhy/cu08G0T2Cml6LQMMf8j9
         KcDEa6+rkng8WGq3XZGnGo6mQMLV3EN5OPUwT/UZ8H5fAjVe6NtjoTx2aV6jUEKmdd1y
         62onOJZ8qbSUisSYGxCVSHFflFjqO4Fbnm1oUNn8qkbBcxo+L0k63vUPBx1PoRj9uyQ6
         lRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAV4hF0XPmnC0pBv/8YfQXzVC313HSVHNg0KH3TW1EweNB2vvPqvNNwSIBR4PeVljqXDyKxDg6YJC7D5rxHQQp@lists.infradead.org
X-Gm-Message-State: AOJu0YxTP+WowqHvyiohrKtEbdkpQrFNZpKU5/7rAe70kYT8bfgm7Uiv
	oQa5M9QickiXMCLfrJEbXSvEu7l6IYqLR5wlu53zpfP/rJCIztCfxxOT8KAS8wI=
X-Gm-Gg: ASbGncu1dO4X9yLxYSTtcYFGhSSyB31WDSDTVIpPCn6SmLrIqWf7kRnWND0N2UgiDOe
	oAKfKb8QI9pDp0BVsEny8eruyjmnVfSao7HhkL8C/EjoL1Naua/EeeyH77i8mdswFi/bMQG5obS
	QrcFr1tSP/8WhGYvZpl0XXN57EcFKW6cFmhXgbskp7RQ9aRGrZc0EUtJjs32f+Sa//qZFuQw/CE
	/BTYq5YPENnQw5C32v1qZGXpbPb/AQc62ATHl7yRCq8D3+pPIVMOvCB4VacrFcuXZeTpzgvOYqP
	tfzkrrd09Lcfi59PLDL6I4G1MxoVo6+wvyiQyz6oJ+I5x2tAkg==
X-Google-Smtp-Source: AGHT+IHmTYmhdJOC8tWd9mJoKjnOkYwl7qqf/27G1AO/Qiuynr43p01EUz4e7kx3RkIBljch7G1LIg==
X-Received: by 2002:a05:600c:c8a:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-43d509ec4ebmr103517695e9.12.1742795440557;
        Sun, 23 Mar 2025 22:50:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f332cfsm161996995e9.6.2025.03.23.22.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:50:40 -0700 (PDT)
Date: Mon, 24 Mar 2025 08:50:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Dutton <james.dutton@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Markus Elfring <Markus.Elfring@web.de>,
	Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid potential null deref in
 mt7996_get_et_stats()
Message-ID: <223c7280-443d-49b4-96b2-90472339dcd4@stanley.mountain>
References: <20250322141910.4461-1-qasdev00@gmail.com>
 <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
 <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
 <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_225042_844891_64682A6A 
X-CRM114-Status: GOOD (  22.47  )
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

On Sun, Mar 23, 2025 at 11:59:45AM +0000, James Dutton wrote:
> As a security side note in relation to the following patch:
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> index 66575698aef1..88e013577c0d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -68,11 +68,13 @@ static int mt7996_start(struct ieee80211_hw *hw)
> 
>  static void mt7996_stop_phy(struct mt7996_phy *phy)
>  {
> -       struct mt7996_dev *dev = phy->dev;
> +       struct mt7996_dev *dev;
> 
>         if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
>                 return;
> 
> +       dev = phy->dev;
> +
>         cancel_delayed_work_sync(&phy->mt76->mac_work);
> 
>         mutex_lock(&dev->mt76.mutex);
> 
> 
> 
> Prior to that patch, the code looks like this:
> static void mt7996_stop_phy(struct mt7996_phy *phy)
>  {
>        struct mt7996_dev *dev = phy->dev;
> 
>         if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
>                 return;
> 
> 
> The compiler will completely remove the !phy check entirely because of
> the use above it, so it being present in the source code is completely
> bogus.

No, in the kernel we use the -fno-delete-null-pointer-checks so the
NULL check will always be there.

Also the "phy" point will never be NULL so the check should be removed.

regards,
dan carpenter

> If one actually needs a !phy check to be present in the compiled code,
> one must arrange it as per the patch above.
> 
> The fact that the !phy check is in the source code, implies to me that
> someone, in the past, thought it was necessary, but I think an opinion
> could be taken that it is there to obfuscate a security vulnerability.
> 
> Kind Regards
> 
> James

