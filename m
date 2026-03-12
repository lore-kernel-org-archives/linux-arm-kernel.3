Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359131067029
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Khzpn5Mx56KvyAQlDdussK+xDM01SpYAZGq0vABXvB8=; b=r1Ndcw9+ReEmyCxfC10V+ec6Se
	KfpDgeg1JQIJvwoXV/qxWNZQ7VrsL+G5pX4bJatE6dZzIceMFiyiUD4Eo1myebtqmrYSW8CnuHx1I
	iufOI8aJvxhH8A/T1sev1AldW6zIkUEq3zxij+337dLEyCCS7KDHRmP5t/UidC8KD1Qf5YK6Eq8eq
	9yi8s8X0yikJh097M7PrdgqDP+6IkNlDdLdr2ZQ1nm37Ij+eUAGAXj/AW5TI2GWdUSrKge0usSTD/
	MIrIRCqhta715I3bpYCPYraX0y7xIefh/ljMXAi3LRGw6k4Qzsc1UxDM3IyBPvCHuyHI8O5jd5s+C
	3IvCsD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ghm-0000000EB1L-2ixt;
	Thu, 12 Mar 2026 14:08:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ghi-0000000EB0D-20fP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773324477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Khzpn5Mx56KvyAQlDdussK+xDM01SpYAZGq0vABXvB8=;
	b=Ef/ocbx8wYsAiuvgs/42BRGjrLyOmLxpGr3yHS6b1QyZd9ItXPSwM+HkB7EXy9r0P/9zuB
	agm31A3za9THH0oRiMgfZ2u3IqDVu4Jf/P0ps30iN4k9uzpDhsiu078Xs8HvbXYcDLFg+T
	Z7N3jiWSymYPhxsC3Z4ezDSG17Ua3oU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-y8-zVmHRP5umKzFJ5jb5lQ-1; Thu, 12 Mar 2026 10:07:55 -0400
X-MC-Unique: y8-zVmHRP5umKzFJ5jb5lQ-1
X-Mimecast-MFC-AGG-ID: y8-zVmHRP5umKzFJ5jb5lQ_1773324473
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-485375aa56eso7543465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 07:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324473; x=1773929273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Khzpn5Mx56KvyAQlDdussK+xDM01SpYAZGq0vABXvB8=;
        b=fZ9r6PY6sCX1WHD5bnk+ejMDM3geeHQnFuDgCmglN8+CFRzMJzX+oUYOLYlxASy4IM
         j3BYQET/O9m6BXKCUNgEkB8sn6G452KjgsIN7ARioEDU8A7KLp4l37bBonMHk6Cf3c5q
         Wefw4kdAax43etjW1B/iQ4LAN4NtHTyFkSZSFviHYubaM61jjjU6CeZ6qcmMVREqBJZe
         LBqCeqD0Qd1yBfJ5SwEJlRNFuYBilQNRs3RYbnjfaVM6VSUI2+jWRnWsKJj4+Eqjo/t8
         LiuK/XFj/2KexIZd/PWLdiwgJqX23e0XILjQc7EvUdsr1nblJ+hRrO2zlk7YkGoOHRbo
         FQWw==
X-Forwarded-Encrypted: i=1; AJvYcCUe9x5ep+oE3GRXuBxMitgbHuCz+wcDKy9jmV/EAzK1WNohcWEkE8agE6fg2kxuF6T3SEwGJeDbD56xQRguELMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqyo5+lFoUCaX0/pZ/W9LSbxkGzwc72zMsxjJFdVEA2WLuokHo
	7WidWe66LygTEVOj2Vutrz0nmiP7LGn3lXcbmyyuv0bdoKsZcHkxHRNxcdyn3s8Gi4wy3vSjyju
	A0MY4lDNXiWI5I5UaE7goJv1J9wNWSg3IiBKkcu1Vo8cOnLppUzr7COV9RjtAt4IvbwjQRsoOFZ
	vS
X-Gm-Gg: ATEYQzy7Vj/+tcT5+6qn/rSzQHhGIB2fh+J5uSKU4UzgejL7Jig5j0M+t2mUU+XSGJS
	Wjh3qryBdnYDpYNS7tDFNLD/EC2EKbniVHfSf+5k347F4QO9tgaiP4Ghb0Oszx/StxfYXSbDmmg
	9UeWggykKwGOlKgEWbwLk+QJiF68CZOecuHrfE0zd0B+TlCDuyo+mWP52QkhhBs4+sQCuArwk+0
	Y+g4LWK2fY9dW9GcSGalIgJZj8JbdpoVIjKFEFKtGPZ6qgscuUs6PbqMeyHlrwpDmufaS05HXKC
	2v3kFQsqel9W75M+kNZVC/Mepu9i1ATGFQlkV9vK5YavSgA66+K/+K16HWZ0qEMZtc5HeI+AjSF
	BmjNULJbHhQMsr5kYTL9pf6Z+VSVE1koPUaYY9rfYNa9XhQ3x9yG9zF4=
X-Received: by 2002:a05:600c:8b0a:b0:485:3ae8:2236 with SMTP id 5b1f17b1804b1-4854b123cd6mr107431285e9.32.1773324473121;
        Thu, 12 Mar 2026 07:07:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8b0a:b0:485:3ae8:2236 with SMTP id 5b1f17b1804b1-4854b123cd6mr107430595e9.32.1773324472680;
        Thu, 12 Mar 2026 07:07:52 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6756e4sm154581925e9.15.2026.03.12.07.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 07:07:52 -0700 (PDT)
Message-ID: <09528d3a-e08a-4942-aff7-b59610f6b13e@redhat.com>
Date: Thu, 12 Mar 2026 15:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend net-next 1/1] net: stmmac: actually error requests
 to change the auxiliary snapshot capture channel
To: david.laight.linux@gmail.com, Johannes Zink <j.zink@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>
References: <20260310140155.3359-1-david.laight.linux@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260310140155.3359-1-david.laight.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UwQHCo9gjR-oA_cbuIPYL9AEexRlNXFPSHcf5Pni04A_1773324473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_070758_599270_D6D8CFC7 
X-CRM114-Status: GOOD (  14.73  )
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

On 3/10/26 3:01 PM, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
> added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
> request whan a snapshot was already enabled.
> However it tested bits in 'acr_value' after they had been masked off
> so the check would never return an error.
> 
> Change the code so that the test actually works.
> Note that when the commit message says:
>     Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
>     auxiliary snapshot capture channels were silently dropped and the new
>     channel was activated.
> this only refers to two commits earlier (a few minutes earlier).
> Prior to that only a single fixed snapshot channel could be enabled.
> 
> Note that the check will reject requests to re-enable the currently
> enabled channel.
> Plausibly the best fix is just to delete the check completely.

I agree with this last statement. Enforcing the check could potentially
break the user-space.

/P


