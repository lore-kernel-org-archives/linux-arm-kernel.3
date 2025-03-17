Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Be+m8+WOPuEDPOjxk6T2O5N+1An96EeClwZ5PGpZN34=; b=xAaXL2O8lXoZreC++Xx+QFg+5P
	8S4/f1VdUsK+0kqmTMvUYPeWBYSr76Wma08INiZjJwYLDxcuzyFwAnBhCWndJsmGfnRmmdY1VAll0
	D1SYrOi5TNT1SolnOBQkeLa+6ZFcFkiOi3/fGXRSaQZt9sFyMGhLoSqk+r4PiZmGIHqEBi6DmXPIn
	zM1KfExEHxc7H2v3wTv9D0yGTJwiq8YpNnwM7msXB7P9ywjW+NoTLi7makOE75VZYqcjl509Q+dmf
	QD34ngXOsk0KSsmYV5Pj+c7A993y0Ao2DfLPxkW/miIYBl3JkS9lSUZxfAUG0KK5fNFFIqa+pTLx5
	4l6vK0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHIT-00000003vkR-2R8e;
	Mon, 17 Mar 2025 20:42:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHDw-00000003vJa-0ZmK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742243891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Be+m8+WOPuEDPOjxk6T2O5N+1An96EeClwZ5PGpZN34=;
	b=SeWkhqUiuYJjSDDtokqwNgh6v1Y1Rc3jmpqOFiuYNgK+/ET7/STKCY9R4VxMuliU4KTjfo
	OlbVkuHC/UZM/xnp5ALYPtCR+e5FFrToVzNBH8Nh4IZfpf/4drfDey5hkjBbmzfW/cOnLG
	ZJAeluH1kR7ewFdJH9WgpCNyuQMR/U4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-1x5ZU8ADO3OL5kOdF7ayCg-1; Mon, 17 Mar 2025 16:34:30 -0400
X-MC-Unique: 1x5ZU8ADO3OL5kOdF7ayCg-1
X-Mimecast-MFC-AGG-ID: 1x5ZU8ADO3OL5kOdF7ayCg_1742243669
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912b54611dso3273787f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 13:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742243669; x=1742848469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be+m8+WOPuEDPOjxk6T2O5N+1An96EeClwZ5PGpZN34=;
        b=FulJE4higdtdS5JTPuv4prQPXiTKEk9Y8h9CirbC9mmVb5zX1FUAhEPH8WXmjL05v/
         YxYGIEEjHmBLexPBc333vQy4LB2GcAuLELRf11QpSUWsr2g/4dWHn/AXW1F/V7BTLgbh
         ZU/0du6fRpyuNcnbTYimmoMeXpsb6OwD0UxLULQ/OSUIuP2eR3NJCrHNCKXpRvJDn8Ky
         Ffuj2AVapSV0M7Nmq0D/juS2QAkA+iuJ+PDG21Us/I6JghjGnJ9kUfDgyVqCnziqeHpp
         iXvBr+tLyzhkSk6BVDGo+kg+k1GEuKSHWxNmk3bHTZ7moj3AsWiTXYCcrXdHP3KNnIXV
         9Nrg==
X-Forwarded-Encrypted: i=1; AJvYcCUELah0re+aRZz/wmUm5g9JddUQeq0ip57LpO34WWabUVhAt9UKAa1LGJxVW6ZMLyAlhn0qu0RxmDPIvkRO3PcW@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ7qSRNuGxa88/LGDLNFdtnw6/z4GHcdaGmjOXcu342kCazRWl
	hoS6YhKm6m7kN4CMDtTV0ZbVClVsyAWQNQFKGCsA+Xr5IoPJITzQZCn4Db4zn7PJ7JAGdC7dnf6
	lBK/OBpQpDjSP3RaP5wMZNBZRYRxu86VDP9arhxd9YYs+iBs1hhvB8EwN/aXSjafWUN7661+U
X-Gm-Gg: ASbGncu7xzdizo9S9ptOxfZcpPwk+s/L1Pvg+nwmlzPZ0lMZcp9PtmoS6wqMaVW0tTp
	PGjLxrs3+EmynNGqL82EKkk1Tk8THijX/RdVukB+t+Ya7SPSUk/l375EwwbUSuZeYpWI5v9rsoq
	JjjqsTROkpOcZwsU+sJ54cKEgibvW2BXLj9WhiJPLhHFYtae+PtOSyaSA3Q4AVnfcSJH4fBNwNf
	gtoU2SCnHk5ooHef6m98noZZezdsVvbK27iTbwkrAsjotPm7vSuznVJ+wim+GEzAfpCsfHxkQFY
	U9OA7GnCkf+LrsRzBQGmi1PS5VbfD5aHwQICaFQjIM/DiA==
X-Received: by 2002:a5d:5f8f:0:b0:391:37e0:d40f with SMTP id ffacd0b85a97d-3971d237dd4mr11307635f8f.17.1742243669310;
        Mon, 17 Mar 2025 13:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxEfR0n9grx2beojtM/iScHwTGCBD3F8wtb70BAlYyWIxmSC6fEqAY7CKzL0p1YPz6UW1K1A==
X-Received: by 2002:a5d:5f8f:0:b0:391:37e0:d40f with SMTP id ffacd0b85a97d-3971d237dd4mr11307624f8f.17.1742243668902;
        Mon, 17 Mar 2025 13:34:28 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fad64sm114260775e9.25.2025.03.17.13.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 13:34:28 -0700 (PDT)
Message-ID: <8176af6a-07b0-4f57-848e-6d161fe58746@redhat.com>
Date: Mon, 17 Mar 2025 21:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/2] net: stmmac: avoid unnecessary work in
 stmmac_release()/stmmac_dvr_remove()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
 <Z9KTixM7_vc_GFe-@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z9KTixM7_vc_GFe-@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k6Zch6UmuyVnzrubOxyvkt2Isvk3Raeo6DpLhlMYJEk_1742243669
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_133812_243168_E1863CD3 
X-CRM114-Status: GOOD (  11.54  )
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

On 3/13/25 9:12 AM, Russell King (Oracle) wrote:
> On Mon, Mar 10, 2025 at 12:31:32PM +0000, Russell King (Oracle) wrote:
>> Hi,
>>
>> This small series is a subset of a RFC I sent earlier. These two
>> patches remove code that is unnecessary and/or wrong in these paths.
>> Details in each commit.
>>
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
>>  1 file changed, 5 deletions(-)
> 
> Hi Jakub,
> 
> Why is this series showing in patchwork, but not being subjected to
> any nipabot tests?
> 
> There's also "net: phylink: expand on .pcs_config() method
> documentation" which isn't being subjected to nipabot tests.

We had an outage in the nipa infra that caused no test running for a
while. At least it entered later CI runs.

Cheers,

Paolo


