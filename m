Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDEC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=; b=BgSFUKEg1lsBaqyh9oZWuu6t2E
	I7z5iRlmYIzLrBKmQWO4/Ja+PThPBzfhJKVdOMDFUDNG13pIXLAooRr4ajN36z1BQjVT3LugpkUfs
	1tcop6SV/Ay+8NT3yWeCSHxZwu1BtMVyvQhrrNfzd8UgkWT0u5BWoWl7VC8XNF5VDfiTKV0HMo/NB
	4eox47gCa7yioNYrkJgKhDbCoOMNql1s4CWlMS8i7rHIiRxJABCOcRp/Qq9N2th6fVyec3a/An8gZ
	II71i+zk8d0Fd9ShOkinnd84yX2Z5nOZB9FfQtNn7LEpQOSNmUC4dxxRq7xgGGZik8tuSD6Yo+dt1
	sG49EMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVPC-00000003dA9-3jat;
	Thu, 27 Aug 2026 08:24:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVPA-00000003d8Z-16Dd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787819051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
	b=EdfYdnFoIYeUakc9Y5N22dkPjMC7g8mn4cG/gfDWV+fRXtle//RdRtDo7zc63rYn+IIhtF
	/uubUu7QCVI+vuoPmw18gnu9wQcxNWtRb35nn3q11fwgY0LvC+hmFC/mrviBCUU4d8Gg25
	YOOWYF3qR7us3sgoa0Fy6yGXCX+O/Jo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-TZNNxDc7NUOO710kuFlb7Q-1; Thu, 27 Aug 2026 04:24:09 -0400
X-MC-Unique: TZNNxDc7NUOO710kuFlb7Q-1
X-Mimecast-MFC-AGG-ID: TZNNxDc7NUOO710kuFlb7Q_1787819041
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6db77430so253314f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819041; x=1788423841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
        b=gsnEsrDklRDYJdBmuQRNaNlpMkszDLZnWAbuoa5eOs/GrDMxCDPcLyEOBYrqOtU8Dc
         nAIHIjvMb9hUaYDjynaLRiXVgkRe3QTnohpSEGLJCmr6uZmGsbEF1asup1mD/uwxtfMW
         57VeBu8sBhUURr7KNoY/Lmnso6eFiqxT3EYw5+KDkixj8+pEndel+25qbfJJgdYugFEG
         FmZ2KEypE7qGnnzCqQtYb2Qc8GZ2UdzWH3cYDy70xlKLywi4RMC5Z3EcFcUYBgeIuHf6
         edZy/tW/sEcJZqgal/Ulq1uGtihZHvgMYFsS/FHTJr69W3JhUjTcbTM3N5AZwSx8pnh8
         49Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpmETWUYSwCJSs2byj5Oix0sKPH7paZaPruwPdZ48Q0sfQ7KtAnUcAEIYJsC5jE3QpQrx01N5kFtbo7DeP6p6Nm@lists.infradead.org
X-Gm-Message-State: AFuF++liprX1a1rSN8jE1MTlGJUMljUM0t3gyzox7Lpj4SLZ4ldbsFy6
	A4Hp6cdLezR/zZQO5kxIRVxkAnjBFe3F9TgSppYOJyKcwdMF1pFoh6q6N6AjgdTM+9b3JreDFIm
	sYBAI9qRcmL37Vf6PwTUQz6stF0lZ8LCC5TnLa/04NUPSSWYSq1wgzRcT2dXSdVWSem0CWd9H8P
	BX
X-Gm-Gg: AR+sD1129VhGHxCnKgUoRQ3fl8GiL2PL002uRprLDZBvUnFJvxNMdmdIJvz/2g7TkUJ
	OlM5tvrXGPdZRuoxk5lLCXe70IsAUK64jMTuqXLw0B1KXihDKrlX7QSXF7QTDtY0UOjMrdxxQjF
	R+ebIQn5TKJ7gk7b2csBGTk5obuzlBIKdIggHAD8EEP9rx4e+kY50nsKyitOOYEMq6hm7+NkZjP
	9mJ/QKJ6HYLCwev3Dtsvd+TJr/omNGZ7ej9+yv97jtX0kqAwRE1NyHB6wtXTrFSUzB8/dSKujKP
	nwhBXkoQvigCzu8VZ1z313nRGE/txSpqaZzTB2Qplto0ZLvliy7qVNhc+NhDcDVFhOw0lye4sFc
	JHOHVo0kWTYS50Cl1052ePOzM4H+WKJ6b6qstFr2Q4+fErA+X39qYfmsIZpeXvwQ+SOQ45yo=
X-Received: by 2002:a05:6000:4543:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-482e26d99efmr12170104f8f.20.1787819040893;
        Thu, 27 Aug 2026 01:24:00 -0700 (PDT)
X-Received: by 2002:a05:6000:4543:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-482e26d99efmr12170052f8f.20.1787819040481;
        Thu, 27 Aug 2026 01:24:00 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm7526943f8f.6.2026.08.27.01.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:23:59 -0700 (PDT)
Message-ID: <96bd39b4-136b-4941-9cb8-3e35c5680f0a@redhat.com>
Date: Thu, 27 Aug 2026 10:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 1/2] net: phy: mediatek: differentiate MT7530
 GE PHY from EcoNet FE PHY
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 daniel@makrotopia.org, naseefkm@gmail.com, joey@tinyisr.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827065930.2618729-1-cjd@cjdns.fr>
 <20260827065930.2618729-2-cjd@cjdns.fr>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260827065930.2618729-2-cjd@cjdns.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O8PA0YmeT-GQPEw8chOYGqBhklsfcvyojOllMmbZra8_1787819041
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_012412_371957_0DC49B13 
X-CRM114-Status: UNSURE (   8.70  )
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

On 8/27/26 8:59 AM, Caleb James DeLisle wrote:
> MT7530 gigabit PHY has the same ID as an EcoNet EN751221 10/100
> PHY. Differentiate by checking whether the PHY supports 1000BASE-T
> which is always supported by MT7530.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


