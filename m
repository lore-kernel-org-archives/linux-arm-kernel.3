Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAE4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GRaecEdfuWriM7C+yo0bHf6awsUkAtrtSOEV6bJJCA=; b=PWA5YL8vYTsgfVnCDtYqgL95Mo
	ybWj7au7oyFAEhzK+BAwHzUfSod7xgxAMZNvHDAy/gVmgcs3xXyL74W6yxax7aLadUGCmXcGXpcmt
	QL46mB8pVJOfHdMlytIMIjv0ZrFZHvDB4ZTJ2iS8K7B4yuxnJKiAGQF8Q71Ud8lwtNBV74g0orFPU
	mjYOUMfKJroZA06H0DYnkiARZ6PInkE7u3GB9gxKWI0KKRc/X+j5yLzkVNB9vh3XCvoffesPYcWX4
	pX5+UojVVLaN9xCzYf8lt4gY397AyiZ1KE2U9PiJh0ClVwXpMUGjYRiMADrcFPRKrrCyyzLYPbEcT
	5UFdZG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SBv-00000006lt9-2R0d;
	Wed, 09 Apr 2025 09:57:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2R4V-00000006d5T-34nk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744188369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0GRaecEdfuWriM7C+yo0bHf6awsUkAtrtSOEV6bJJCA=;
	b=MHV4ZhI9yPO3LnEm28W+ZCCxkTLrt4OWySpTS9UgB8Y2ORL/N/mcaDwb3/xZb9IToPD3UY
	Mqtp+sxiWMJiSCRLxgPLNMGlu7nBHCLFXzFstpyfa/MJpTvPDuwEq7++0HwJNCaMhdWHxf
	h4nBqCW4uDNkwLjMKYc0mBcAD/9+llU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-G8Z5AOJxPMufKkMDcn1ncA-1; Wed, 09 Apr 2025 04:46:08 -0400
X-MC-Unique: G8Z5AOJxPMufKkMDcn1ncA-1
X-Mimecast-MFC-AGG-ID: G8Z5AOJxPMufKkMDcn1ncA_1744188367
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912fc9861cso2633064f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 01:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188367; x=1744793167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GRaecEdfuWriM7C+yo0bHf6awsUkAtrtSOEV6bJJCA=;
        b=pgsJHgVwA3X/qbVReERf/cZcgzmviNIvaEmFhRvY9kIjaSYOUfdOBiJXRBpd53PGSt
         t/d8cIXY2eBY9CcE7yrtw1FzTZmFYoTkJ9c05DrTM7aKgoQZIGvWKkAqdlhEBljSkEGr
         83hsoWg2DvG2l2MZ+9TmYG5nFXL10X1vjFk0Tu6kpYm6TLyy13b7bHytEoBryo9CiMv4
         K4xksI26Pkhh6qjM86+w3ali910huV0HjHgUVT+KVHe261Zh4dzKR8w3PaXgd06qR9C4
         ekr49nmNSgu8FqZ+bzsYcyUYJiv76rlgKpCPRd9r2qQSJDH4QVnd0rlJMXu1nKaY1z7D
         dsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX40DPPovXuISmPAqPBlVxnVfvQmU6lT1R2HOrNe2jlfMNnAFGghtz6g/QHQHVzJNMxsvMrYAhKBDTMZEKqjPmi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz9VuSSlvlqBTvnDKTbkCraTVnVp7d0K3rnCrqy9f8aJ4jxsiL
	3tgNUvEpBmcSA66rt/IM6M0cuMFwReGoniZk3lPZUGbXeGB6iV9jyisJVh71cvHue/F0E/7TXCT
	y6wC8i06LB587b6Bk8qqA8F+P8JLc0vrZRPrWaAEkac8UMhSvC56EsjEZrldtf++Pq1iHSxdG
X-Gm-Gg: ASbGncuqFyUbQ9KOgfYfjQTZtakymimoPXtoZOt8Jqe9pooc22bo0I5STmxNEhZmCB/
	ETxLd9+VvCNRJekpeBnhzcH4m9PHJyKHznAbOsCuoZNGLmJrTjpJF9aSsD/OQ6JzyBeQ1oYJzJy
	TD+DNvTC0hUqSYuH7TZi8qnF5xKzlfrcvP7ckcln5XrebZvFJs4kNrCxdOsfUR1VOtjdPkoCVVL
	J2HAu/D1REalYT7Nq3WJwlokuX84dRjbf/bSUgvzGI12sDNmaAHcZenkBoLpKW6qvH2Lv+qkSOy
	f8rfl57lLQ==
X-Received: by 2002:a5d:59a8:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39d87aa83f7mr1836449f8f.17.1744188366941;
        Wed, 09 Apr 2025 01:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy+550CSY65ENB+HIM0YP9gUefmg712FU2KtH7qBXHCJBM64fPaYYk4BYRgiS6DoCFcosTjQ==
X-Received: by 2002:a5d:59a8:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39d87aa83f7mr1836423f8f.17.1744188366581;
        Wed, 09 Apr 2025 01:46:06 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89389f72sm948917f8f.42.2025.04.09.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:46:06 -0700 (PDT)
Date: Wed, 9 Apr 2025 10:46:05 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Add matchall filter offload
 support
Message-ID: <Z_YzzeUVd8ww6sjf@dcaratti.users.ipa.redhat.com>
References: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oz1v1uee9I1JgoNNiYibIlHymww-3WH1FRhNK9_V1ic_1744188367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_014611_831398_8F2FACD0 
X-CRM114-Status: GOOD (  10.40  )
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

hi,

On Wed, Apr 09, 2025 at 01:15:32AM +0200, Lorenzo Bianconi wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
> 
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
> 
> The current implementation supports just drop/accept as exceed/notexceed
> actions. Moreover, rate and burst are the only supported configuration
> parameters.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Validate act police mtu parameter
> - Link to v1: https://lore.kernel.org/r/20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org
> ---

for v2:

Reviewed-by: Davide Caratti <dcaratti@redhat.com>


