Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEDED1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGMYk1sfGljMrx70XS76pz0+JZldIxvVU7ZbZaIA+pI=; b=BUPrUF6hCrU+FAKY/ZveVGEk0H
	QfSo0Ht4FjYy83GRxnhBm3YJ3YVHTJTOWZUAsIhptwbYAIJauy+eV85LVC/nFbEABOybl/joHrUTy
	XNpoKyiQmc0MMKVOQ0+CL68dgfwYoO/IAq9tGbEn1d5eAIdUU6O19TbmLzeRGkU3sVE0+ewCF7B2v
	mLQ8zjb7PQw8XlMWlpFsJlmoFQLdy2gc95vgITmOvp4L5ntSuHQq4i+QMAX07EI0bMH95csLSDzuR
	p7C5y1TbW7pMA+tSU0qDTWcFCh2wo1dwR/U260mXxhsOawukaOjuJiqldcKvj5X2rVDY2xNZBxWVq
	XheXgIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR66s-00000007oOZ-0zHN;
	Thu, 04 Dec 2025 09:58:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR66p-00000007oNw-2g0p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764842325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGMYk1sfGljMrx70XS76pz0+JZldIxvVU7ZbZaIA+pI=;
	b=Zeh85N6riuMWszORPbar8CgZ3IZVUbwtfGxM96vWGfrbVdeEijs/rcb3zMm9haHO9gdveQ
	rNXrGvf2mHfYhpcjCMCoP0508fmPPiwWYupXtPyYOQOy5IOP7NCNmQcP7nilBkS7XVzS6o
	1Spl4+prTInQgOxT4rZzXNdu+y6HVpE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-u9mjIpwWO2qZNoImLT8p_Q-1; Thu, 04 Dec 2025 04:58:44 -0500
X-MC-Unique: u9mjIpwWO2qZNoImLT8p_Q-1
X-Mimecast-MFC-AGG-ID: u9mjIpwWO2qZNoImLT8p_Q_1764842323
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so481146f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 01:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764842323; x=1765447123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGMYk1sfGljMrx70XS76pz0+JZldIxvVU7ZbZaIA+pI=;
        b=OmmOrnmXhA9nK0sRKbz/eKe7z5YOE0oqkMHJSjRCEM3ypgDO1reUMybj4OFjoeLHCc
         0n0aIcbvmfEyqLxEjTe1KVznDHUOhdd7D17t60mnucqKVmbNyPcXa30p2XA8eSpZW3nl
         KCkfh67O5jYrYN/XIkWEjEUQyvJrg8bZKcEpY0BTZAfalnb9YFibFwYXbpFgJ5YcQKCc
         fbBb+3tjgZMjp53uZGkj1HCeCG9hzP2KTW0v+RdvPU3F3LGzB9qeJJ5m5q+klvdVfJt0
         xZFKYUBAZHb99yfxsslbnVvPhip7sd8zAvbdnyXs5PAOU31zl1BGGeTICB90UxZai/BI
         1+/w==
X-Forwarded-Encrypted: i=1; AJvYcCVsprxY57vcAaqryuY+qgj47PMPrBd32YO5uq385ecSXiEocOLnqK3Yz6fDmjFWy/gt4FXA43peaOrtq3VYyT2c@lists.infradead.org
X-Gm-Message-State: AOJu0YwELG+ORxIu9Q+mAgq0hWnhmAcj3Q8/TJSPoN6XqDg7kGxN5GUi
	UxjegGMFVaKvqa9Z8jxt5KLd73o1E+rwaswaoa6PTf6++1pulIJxz1Sp4TuVzmfhiBxeWQOio4d
	srMekuPKm/r/clFWUdDl3SOQy6vd7pUqdVsxedLCzkvJj5hdOhXM8Mxsj7J9rui+FK+Kc0OZaMw
	RR
X-Gm-Gg: ASbGnctJJplzEbasJx9bq/WA0r5I8iv+zn7PpLvldhMaA7YSNHXt6LdxmO+ZKy9hxya
	SuoE5OdvafJr+0r5z+RWvlCgVDwM9D8h4vi2F+lIblBHln5Gkq93PgQAPJN5hi1DIJTmwt2Gyf1
	dFxe4AXIWhZXGGrFUrQN07fGwQNCvWj+uYvIF9UAFWfVWNdlhZMK7yJtFdg7JQLzLiP+Nt9Bxlu
	XyXIIwSecToSoSEKW8XBJxWWfh86x9yZtfyl0THZqIpic83X+bTQm6/fYB+widrA6lKjs1AlauX
	LHDpHmrEJOE2XLdAh5Jym06/z2cIWrWlbyZzegVR/9GSrtpeJSE3CqH8gjG95tF9OE2sFAQeoKx
	SRa87Jrx+NKXc
X-Received: by 2002:a05:6000:2410:b0:42b:3a84:1ee1 with SMTP id ffacd0b85a97d-42f7317dbc9mr5978657f8f.18.1764842322736;
        Thu, 04 Dec 2025 01:58:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IER0C5ptlDk7jPg7WID0quVbFz2V15FUInT+2qvmmyu5lX8HX6WC9NCtkC3D/YD1+okBxxd+w==
X-Received: by 2002:a05:6000:2410:b0:42b:3a84:1ee1 with SMTP id ffacd0b85a97d-42f7317dbc9mr5978625f8f.18.1764842322345;
        Thu, 04 Dec 2025 01:58:42 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm2297919f8f.43.2025.12.04.01.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:58:41 -0800 (PST)
Message-ID: <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
Date: Thu, 4 Dec 2025 10:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: Fix E2E delay mechanism
To: Rohan G Thomas <rohan.g.thomas@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 Kurt Kanzenbach <kurt@linutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zwKCb-gqNvD9K46C_u-7h0yhgz90CvJzfNgTIfjI3Yc_1764842323
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_015847_774513_A8945E4D 
X-CRM114-Status: GOOD (  14.93  )
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

On 11/29/25 4:07 AM, Rohan G Thomas wrote:
> For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> messages show up for dwmac v3.70+ and dwxgmac IPs.
> 
> This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> Agilex5 (dwxgmac). According to the databook, to enable timestamping
> for all events, the SNAPTYPSEL bits in the MAC_Timestamp_Control
> register must be set to 2'b01, and the TSEVNTENA bit must be cleared
> to 0'b0.
> 
> Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
> addresses this problem for all dwmacs above version v4.10. However,
> same holds true for v3.70 and above, as well as for dwxgmac. Updates
> the check accordingly.
> 
> Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
> Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
> Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> ---
> v1 -> v2:
>    - Rebased patch to net tree
>    - Replace core_type with has_xgmac
>    - Nit changes in the commit message
>    - Link: https://lore.kernel.org/all/20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com/

Given there is some uncertain WRT the exact oldest version to be used,
it would be great to have some 3rd party testing/feedback on this. Let's
wait a little more.

Thanks,

Paolo


