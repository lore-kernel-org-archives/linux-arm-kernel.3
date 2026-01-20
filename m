Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B422D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8E5ZexNwUvepWRnAB8kom9407PvcV1LCFOFpBHsJ7Q=; b=ZOIl8othF0m8zeu7QK47MwkWoZ
	9MWJlTN7T+V+Wvlubg+pieJRJ1gLVEziEX4sU/FG4sRCpkTdvIWDlSjuympg3cNRJCoPfJVj6Kjb5
	/HanRqLG9siSNcoaPLduVyZJiRrX+jWF5OFcYhFdeuLTLeD5nd0XFT3xftnn5tFbmKS7U5gzdGUY5
	5QIrhpxa8hMDlEAM7N3zlyw/4TdGxIj2aj0aW6jdKq+3s1Wtpl5UmFjFpemILaPIr0aIOnvlM9C76
	MzeKZD82e7tzgzsLY+4BbTHuITCtImzfoeHupdzZeo+j3RxWqqs/IHcH2vfVELO5kdmBnnLGTrNgF
	gpa0G/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8fN-00000003Zw4-3W9i;
	Tue, 20 Jan 2026 10:08:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8fK-00000003ZvR-43Td
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768903728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H8E5ZexNwUvepWRnAB8kom9407PvcV1LCFOFpBHsJ7Q=;
	b=g2mCFRnavvT76+MUPL7exymMoakxZUI0HqHzPAHw8w5ZR5nXByI8W7MwZCjvmo4tyAcdp9
	pTqC5mk9du+lE4GyQLvxjCaFHUj517mIDlikH4nJUJP9ZW0CYQG6d0w9N0dQY5jTGVfiL8
	zrEIr6fciSZ6aFBPIt3A5q+QmCuQWMs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-wopM-KekMi-H25zbXfkgMg-1; Tue, 20 Jan 2026 05:08:45 -0500
X-MC-Unique: wopM-KekMi-H25zbXfkgMg-1
X-Mimecast-MFC-AGG-ID: wopM-KekMi-H25zbXfkgMg_1768903724
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-432a9ef3d86so2408303f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 02:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903724; x=1769508524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8E5ZexNwUvepWRnAB8kom9407PvcV1LCFOFpBHsJ7Q=;
        b=qWUrpuhbQdUt/T+LTCPo493xCjKruGGoxL8j+p5zA2IREfH2cOvYtea2JXu9bIgJOb
         +OZWBw625agaqg7oairbo1/PDM7bBFuENIK4l84xTtn+46HCpbdc3523L3tqn9gNIm4E
         2szTq1dSIcq0AJUwYYaMdZyPhap0W0f7WQ0APvWlZ2RYsPIs+8GOTeLGVIrVUtjE/S/b
         0zlqA/NyxR2wyOYG0IMLCnbIWrTolUXIrAlg9T/Kr8DkzYv7Zn/eOtje/oni53q8lhXA
         19Up9wBCeYGi122F1InqlpdgxnFZjblu/N+yMAxCTUW2sV5a2Lit9MTU2306xPuO+XMz
         3HVw==
X-Gm-Message-State: AOJu0YxDz3Dsn5LCX5yloIyIzzVONDZd38nWo9MLgHbtllgYHiFfFMRQ
	k3hcO7DrftIoLTFvhfGt1HxSlZS8Kw71TrPayAteDJcAD16hp7lBTA1rNlMSw3k4lH1o+y02FOc
	nVuPa1zjJrFz1uYITPTOh7kIE0YRkjSd6xqtgoPQgxaSZN0Ov4W5Fx5v9rNXwB2GB9Dckib4ZKX
	Ot
X-Gm-Gg: AZuq6aLAT+OI161uDAe8ZB1cFZTBRK3pfoC1imlwVbNipXDNwHKQgMVGUUUX3cQKnFl
	WsPevCAyCriAW0dM426i4JND+6taZhw/FCkkDvZdgLYK2e1Si0uPw+FBalTRiFuI3B1tybaD9bA
	Su13lVrzVhlwEJnNc+7ZfgIGUpl9A+PikoGZXcmbVtc5/AirDGZ5zbKfeMSrETuior7dyfeqHD+
	OWg6MhbZdmkJGIC2Fu83j8rJAAY0st9+1ocdB7lQa+5ktL/qjX6MwUIfybsiO+3YgYISzsKsBzH
	P8YMlBRcoDvIekouCHIpiv+NCPd3JzTxoNdcWmS3P8xYNxWTlymfdOGQJ8YDE1rBdIc317Eikje
	kARjRkwDzRrvs
X-Received: by 2002:a05:6000:25c8:b0:430:f41f:bd42 with SMTP id ffacd0b85a97d-4356a0662e3mr18086965f8f.57.1768903724428;
        Tue, 20 Jan 2026 02:08:44 -0800 (PST)
X-Received: by 2002:a05:6000:25c8:b0:430:f41f:bd42 with SMTP id ffacd0b85a97d-4356a0662e3mr18086936f8f.57.1768903724027;
        Tue, 20 Jan 2026 02:08:44 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm28563115f8f.35.2026.01.20.02.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 02:08:43 -0800 (PST)
Message-ID: <f35ba439-bb32-4c62-a057-29f45f95083e@redhat.com>
Date: Tue, 20 Jan 2026 11:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: airoha_eth: increase max MTU to 9220 for DSA jumbo
 frame support the industry standard for jumbo frame MTU is 9216 bytes. When
 using DSA sub-system, an extra 4 byte tag is added to each frame. To allow
 users to set the standard 9216-byte MTU via ifconfig ,increase AIROHA_MAX_MTU
 to 9220 bytes (9216+4).
To: Sayantan Nandy <sayantann11@gmail.com>, lorenzo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, sayantan.nandy@airoha.com, bread.hsu@airoha.com,
 kuldeep.malik@airoha.com, aniket.negi@airoha.com
References: <20260115064043.45589-1-sayantann11@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260115064043.45589-1-sayantann11@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GJqgqsjgjN8EOOxoNJq_nT_gSk196h34lG254eN_qkE_1768903724
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_020851_085605_258D665C 
X-CRM114-Status: UNSURE (   8.89  )
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

On 1/15/26 7:40 AM, Sayantan Nandy wrote:
> This change ensures compatibility with common network equipment and jumbo frame configurations.

It looks like that a significant amount of the description landed in the
subject, which is not good.

Please reformat the changelog carefully.

Also it looks like this is intended to address a bug; if so it should
target the 'net' tree and include a Fixes tag.

Thanks,

Paolo


