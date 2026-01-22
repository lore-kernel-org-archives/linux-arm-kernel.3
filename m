Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23279C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=; b=vx7gGhk/MTS5BvA0qu7JNxGGO4
	f+w7dGfftD0C9qPc2M/EwnVIHHh1igmejm1Cwfrs3WXoUZK9Jt5b+1jhlD+VUOlt43bMD4T/DnlBe
	2RXZz4cKtoNyNx2ZOKdU9wSL57SbmU5Hv1bMaFp+G6z//HICd1rOqq3Hbbw1fCe+fYoHwQcfgs24T
	MMx3sGEsj6G5svAGQ7xem9H2Kdn025CF2ni2Ou1VwDQoBA+8bDQIlToqwJ3aEuSJck0klgndx+fpN
	31k9La+HUKNSn3lWZL8+Zq+FQdAabo+qVaPJk9x/f5/qbjgstEVsuieUxHecHGJHQA26oJ0v5+RXQ
	fSsenAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit0G-00000006yz5-1vXc;
	Thu, 22 Jan 2026 11:37:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit0C-00000006yy8-15GG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769081845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=;
	b=VVTA/Gw7XHuchA69uxohE01fq0YYwRN+kd06H5AQA6+NZ1T2S3767ZNpUkJmJo3G3LdkqT
	hTRZUexEIMu2MUyjf/1/ECnAB50ufUvsnmUwHFkVpgIJ+Vza+lxnwKJ5mZ4cLiFdhLZNr2
	B+nymQ6AwYvMf3cMcd4dG12t5cmTIPw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-efjjrVJSM-qHMqn2hLBRqw-1; Thu, 22 Jan 2026 06:37:21 -0500
X-MC-Unique: efjjrVJSM-qHMqn2hLBRqw-1
X-Mimecast-MFC-AGG-ID: efjjrVJSM-qHMqn2hLBRqw_1769081840
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47edf8ba319so7032625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769081840; x=1769686640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=;
        b=b0Wj4A8ct03vlcuCLv5ipZVghSNPj+zpKn/SepahUG3NWHlQPdz+3FNkdHy670hNmS
         ktTsin/SLzl5XhU/dyPiGyW5GXca6qGeAiJAZN55W4Xln5j2yW89dLZyllnSkSHg1nLi
         bHufx0fRWX0MoxrqO1EYMhW3trPZtqeewRQ+gjGLhqS/a2m/6t880UkfbS7lp8IUIPnC
         e3HF/8Dz6129VVH/kjk/Mlbzu79YUiXJy6UFAs/s0QshAEKj5nTgx6kQCv5VpEcjkCN8
         q9PzotU1BZw+dxzo3ZHUnXl1SUktVAsdvG4MAiPrQ8xIQrEE577KTqc+JJgZ0qfLddEE
         iVMw==
X-Forwarded-Encrypted: i=1; AJvYcCU3JpHuzadgbwe+Xi78EDDGpGYnt5b1Q50ZWwMLKwP3R7jbtLhJYPi70DtFJ1gYjuGglFhm0mW51e/IPYv2d9eF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzffmqn+6N/Jge8C64YQ0bTmB/qJxcu00FnwwqUtpA63uC9MzDH
	vTpxcIoo+kZlVnTLfkY2t72D4VPI9icyM6UyvCUaH4tnXVlX50/R1LzLzDd1fk6TOg+GMHkvrX0
	+D3EVpJMALoV2qvUs4CzaHp5JBI1k30ImNDLA+umwwDaQh77HrRQNVjdmx1/ibjKwek6sa/QnIf
	yE
X-Gm-Gg: AZuq6aL1VZwB5yV8BCN4LVIGzaSpCBrKkWdX7n1i4fCBLUmZ6Tauk6lfLKUN6nAztyy
	SJtdX9xh+YMivRRS49jShklWgOY3yRbu17OXr+30FbzFDOo9cfSZ+ao2/m24SVi3z/NptSe5hKV
	JDUnpG9zTTPo6EbYOtXXgoAL+U3HKr8kRxq+o7/h/aFoj83BQ3M8uQPwlrwa85NEhm+7MSN3S95
	kdODaOXSNYJQx5MKD21St6NI2Dk+vt29VhN9Jj4YHGaur1+8r29bp8sNGd0hS2lqepnm+/72jCv
	TRzjG4OdAj724rMQO0HNfpm758CUJUEKeZgfineiQnweApG/1qf+k8SwMInRIp7+v3dN9a5U8ar
	uZN61zVDCjFPK
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4803e7f03fdmr128686805e9.26.1769081840533;
        Thu, 22 Jan 2026 03:37:20 -0800 (PST)
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4803e7f03fdmr128686445e9.26.1769081840134;
        Thu, 22 Jan 2026 03:37:20 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424b18cesm51351875e9.4.2026.01.22.03.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:37:19 -0800 (PST)
Message-ID: <86b8feca-8e82-465e-a17a-b751758306ce@redhat.com>
Date: Thu, 22 Jan 2026 12:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: phy: add a new phy_device flag to
 keep preamble before sfd
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-2-eichest@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260120203905.23805-2-eichest@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: msSGR88RuxQp9A5KEsRhw6gr5vEizID9SoLzsT79SEA_1769081840
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_033728_395884_3DE77EBF 
X-CRM114-Status: GOOD (  10.10  )
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

On 1/20/26 9:30 PM, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
> shall not remove the preamble before the SFD if it supports it. MACs
> that do not support receiving frames without a preamble can set this
> flag.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

I understand this has been suggested by Russell, and LGTM, but still it
would be nice explicit ack from the phy lib crew to ensure it matches
expectations.

Thanks,

Paolo


