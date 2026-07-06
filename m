Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD87C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=; b=b39i2peU2ejyHvhlseZJI193w9
	a5TcwgCO/b3zYrX2IoulaFOJFC9T/2G4aFJL+tC7wNjDMtcspIi3OcWeNeLo95wV6Ap9Uq4OHdNjA
	VJgfbzPtPVxCxkwu6J0zH95XqFJEWSqV9N/Rfaic9KA4BTjltz0KQBsh24ZetN3jdX+yGcnH3RMe4
	o0lqDQDwMqM3eojkyU1UnCaUj6EfNPTquzsYJSD5kck0d+6axNSxUUR7xdPGYrFoIkus91FBUt3Ns
	xNBrtW+yFEQrchjjTxcxUTEXN587mcB8WYMul9Iy/dQiJdNGDmPZ3H17mZwNEvuyIV9IH9SffyYzi
	Ob/ss5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj52-0000000CXMR-0lbz;
	Mon, 06 Jul 2026 13:09:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj4z-0000000CXLm-1wX5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783343384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
	b=Pz/8Vo6rDnLyvAaMWe2b7mQwsltpk+qoOKSbGNII57Aw+9UOiP82NMDS5eThTEX43fjmkm
	LfwXeSTnkw0Y5pOtNzP8MVq5rUYOEzeYEpqT+vM/RvAuLFZnh7NANS8UFNzzBQHrNb/ndo
	5roTgCn3WSWFxfPvDurl5UM+zUdxq6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616--WhHUDdxPVO7nOgNBBZAMw-1; Mon, 06 Jul 2026 09:09:42 -0400
X-MC-Unique: -WhHUDdxPVO7nOgNBBZAMw-1
X-Mimecast-MFC-AGG-ID: -WhHUDdxPVO7nOgNBBZAMw_1783343381
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso24222745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343381; x=1783948181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
        b=buHz3Alb3+dsCWkFIxjpcCghgTvfV/IC1YD66NS36pMIl+LFqFEiiK2OVmvEf5MLKQ
         KQqvnTrZMezB145J9n9oI2kHQbSEzH9Hgd8SDyxVZUxuPM5ZFh3R0bceWnCklN9a+36T
         r1eYTYoNYYS62WTqa6aK0tAOD/yBQgtrh8lWkFmKZfY/qbYornEGbHc8A3ZCdvAGc8MC
         5HXIYpD+QS5TOKFDGsYWQ38StnT57MUvNOeE5eeWeJPgHspOfvF/rlN9Wtu7hk2b/HrZ
         e6xUj/47v142fWVQlQM4pIRTmnaphPk0noZJ0a+cnoCm467salGgz4zcMGboeoJEPhuL
         WT/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3xxK/We2recb0SO+ybmmaSQFNhzYH/85ii4FsIz36wmDHxJifnYwGU4/nPigKTfVIpArng3uae3v0YxsyOG0D@lists.infradead.org
X-Gm-Message-State: AOJu0YzioogbU8QjKN0p5AW3lmKInl0UdbLPATqtt0kd3Uwlb9tTKvJk
	w/TEJdvem4g8ADtYucX/cgmVRgBslZLqSahVTEvRPsvfqGXwuetBtfAJFMQ1ADGDFWhP1QgUF8m
	mO8vMcm+Ax+RKHkYFDaAd+YzH3IOZNmStOoA7aj3wsvWZTUHA7zCyzslQxMP+bfbljW9upXrJ++
	fh
X-Gm-Gg: AfdE7cmP3/5tTbC6ioGBa3Gjb+GnZgsAltEwFfcevkm6qiceJUAOie6SXeDoP0c/IyR
	TlK6RWiqJDh02iflKD2Num8kc9Ri3gRadMpQ2FystmFe8p6+zIcapXd15LhcPgRxKO8pX4wwSem
	aFK0vlsbWyR0ZpxpBlMwlNBe26emPzjcXs0clD2+CVclefDDItEZ3Vof0QmzirUEJx8fwmxCn5I
	IDKrS8PtuGplXV4JE/V/PLpQngj1yONzggk/OZD9SJC8uWm6sZ1aTcuRHrlxYiSjToXYvm+w07s
	83D7BJAbsXinghTEv5sbs9vp2GuXx/2/WVIG1e/Wf61ujxBDa78dTVpX1mtLwQ9PVwxhMpjDWes
	hn6YtL5zDdPOmK5GKN65JEhe2vXmiqtwqFZbesE0mzxci4FAgXkCQbI3gGyGiEEMbaTG0kZw0Nv
	cyI+/AsWzSQ+QV
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr4850905e9.7.1783343381394;
        Mon, 06 Jul 2026 06:09:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr4850375e9.7.1783343380895;
        Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25839803f8f.37.2026.07.06.06.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Message-ID: <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
Date: Mon, 6 Jul 2026 15:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, weishangjuan@eswincomputing.com,
 horms@kernel.org, alex@ghiti.fr, lee@kernel.org, wens@kernel.org,
 lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260630063445.1226-1-lizhi2@eswincomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jutlrWySnPEjzPw7aS7sEkcvyia5bVzrZvQcrO66cFA_1783343381
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060945_585187_436BA01A 
X-CRM114-Status: GOOD (  11.72  )
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

On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> This patch is included only to provide the DTS context for reviewing the
> binding and driver changes in this series.
> 
> The upstream DTS series will be submitted separately after the binding
> and driver changes are finalized.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

@Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
PW, but I think it needs explicit acks from relevant SMEs. Could you
please have a look?

Thanks!

Paolo


