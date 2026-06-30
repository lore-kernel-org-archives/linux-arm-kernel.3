Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ew0XKPxtXMcesAbrszv84Xa1Xt+7GkqKXKHIWM0PuJk=; b=pC5usDd250Mc0vDPdepWllJ2PL
	YhAZaqz2mce5CdcOzF7zuqgpZkgT4rpPSAccZ2wQo/0y1oYDlEAX+dt3ndPK5BGVueOLwg8aysb0z
	wT1TacV+YjSQVSgAhrH1A0VBSQNRZ224stSby1tG7+NPiQiWDOXNIgesjuC02nXWXhBYjj8uyTKym
	Uq+AaqGO4YB6ZIbAEmN4HjE3aSg172xxuMxVR5tTbjy2xNYXQJmWmzFm+zml7sb3homTRHbqBlwre
	FaqAOXZpeKPH6YeKXuw2rQC5WBkoHdwlX07v325xobgD+6i2JvCzCSLWV2GP5FeRTqrVYHiyPddgp
	Gix5vJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weadE-0000000HP2O-0Ye2;
	Tue, 30 Jun 2026 15:44:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weadC-0000000HP1a-0UuS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782834253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ew0XKPxtXMcesAbrszv84Xa1Xt+7GkqKXKHIWM0PuJk=;
	b=GZGtVwNgICSP9cLPLSeMq6n3sj5Qsveuki1dAnELSGRqVgRoiJrtDDkUoFQ2o3CvEAAYTH
	9DyZDmSwafZ0bgE5YaXD8xZjxfDALbZ4KPfYO2dgC1LcLVv/FXOUQ+mzz+c1jdS8YVQTvs
	pCOCt/kldNWJKJEQVf4N9vnVPMEGKRw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-6NyLcM-yPUWDjwdUcv3CAQ-1; Tue, 30 Jun 2026 11:44:11 -0400
X-MC-Unique: 6NyLcM-yPUWDjwdUcv3CAQ-1
X-Mimecast-MFC-AGG-ID: 6NyLcM-yPUWDjwdUcv3CAQ_1782834250
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7ff58c89959so99417117b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834250; x=1783439050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew0XKPxtXMcesAbrszv84Xa1Xt+7GkqKXKHIWM0PuJk=;
        b=UjoDt6T4C1a6NZfSRjvfsPEJR/WyBc/BydaGZzjCsIALizmQhsGF1YVXQR+9SQS9hS
         OZy2AhogjtJ/vqfDsid8oXHx3dM9lFXPJITmy5zo43Q//g7VoizzXgQhXFjyCOH+prjv
         4W3x9QWZRa5TI8bEOCylzPixkvmE2NJoq+Sq2c48X9p5uPblGM/RvMH+KV8dFnrlnv82
         pbPuUe+g1uu8Mr+zES7xl06X3A86UPObaaklQ8wrBbdRV+kQMVyBtCm+91BJVuszGbVR
         5/x+s+gUeBz9tMkvBFSqscvYT+zrfxSsFQ6t1ZkFna9jIkMvFaE6VWhaMUPyNJIrdHp7
         Td0w==
X-Gm-Message-State: AOJu0YwV1l41L0CgIhgJq2iGrECN+N8v6WoCkuaGVDDYQW4Y0BXQStX8
	JoQUObvXlLf+B0dEy4Z3N8CwBuT3G8iZJHq5FucDmgZtUASLxY5Lh3l+/6/2s/LnkbjijkygkHW
	D6SoGUyFu75aPJbI8XVnjZqutD1DAgDhJ7FaGc+mzLyij163mDOh/x5EdhMIDa+rIfd35qWSCjt
	+R
X-Gm-Gg: AfdE7cnnxZ3t+Ljn9wQBLTUNUnF/finPcnxkbIsEU/pSI/hP6sviJyYeIQpVOFDGfpL
	4AzK/m+4deZG1W0t7Gx9qLzGUlqrt6mfNhsFnfQvZRnrEmDMJwfq3BQmJm4Hl/Bum8bnAFAFZix
	pOfwKcoembJpnOK3ulNBoTKC8XlI/fEzoq4lqVOz0G2rNhLHaLhOsvLER2vrIlA3APJmYxQdQUt
	rN8fv6eFspDUaXrEDSQ/hAY9dx/GZVIbHAxl/1IsjAhz1od/+UhiPq71Hgk4zYy+PC7vYclceZp
	qaWr1g81ONiV8LPeTz7b1PoCArSYaHhJNkTf/A+sRbQsyoXj64w6fYqhptTrBJ4mPAXY58Ra5fq
	ecV/oAf2gnhwAGUeNUT5q09iLqFXxN4R/Z0oTOHjBk2W8eqBrHneVdhEzoMu6re7RvtrVP4i9lz
	vN27N7hZKMnQ==
X-Received: by 2002:a05:690c:34ca:b0:7fd:9dbe:4d87 with SMTP id 00721157ae682-810da312e4bmr47934807b3.52.1782834250416;
        Tue, 30 Jun 2026 08:44:10 -0700 (PDT)
X-Received: by 2002:a05:690c:34ca:b0:7fd:9dbe:4d87 with SMTP id 00721157ae682-810da312e4bmr47934137b3.52.1782834249734;
        Tue, 30 Jun 2026 08:44:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810e7288a7csm12312487b3.2.2026.06.30.08.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:44:09 -0700 (PDT)
Message-ID: <94901706-e7f3-4ff7-9b19-9965f593e228@redhat.com>
Date: Tue, 30 Jun 2026 17:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: fix max receive size configuration
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
References: <20260625-airoha-fix-rx-max-len-v1-1-45b9b827358d@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260625-airoha-fix-rx-max-len-v1-1-45b9b827358d@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x4hD8n0tOQli3r59wIqOMsclevVTl9L2Wkiaqb-JM1k_1782834250
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084414_220878_81430B12 
X-CRM114-Status: GOOD (  11.62  )
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

On 6/25/26 8:49 AM, Lorenzo Bianconi wrote:
> Set the GDM maximum receive size to AIROHA_MAX_RX_SIZE unconditionally
> during hardware initialization instead of updating it according to the
> configured MTU. This avoids dropping incoming frames that exceed the
> current MTU but could still be processed by the networking stack, which
> is able to fragment the reply on the TX side (e.g. ICMP echo requests).
> Move the per-port MTU configuration to the PPE egress path where it
> belongs, and set the tx frame size running airoha_ppe_set_xmit_frame_size()
> to dynamically track the maximum MTU across running interfaces sharing
> the same PPE instance.
> Fix the PPE MTU register addressing to pack two port entries per
> register word and add WAN_MTU0 configuration for non-LAN GDM devices.
> 
> Fixes: 54d989d58d2a ("net: airoha: Move min/max packet len configuration in airoha_dev_open()")
> Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

PW bot is on holiday, no automated notifications for a while.

Applied, thanks!

/P


