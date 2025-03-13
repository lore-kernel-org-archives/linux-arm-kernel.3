Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98747C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oIWPDRciLqWE5onPVwFJiWQ7qoNl5vDCFa0WS9jdh4=; b=NNajtRuuQ053sWK6wROQy1ac7J
	fY0rykiLCGEUgosIKND8pjOSrlvitwUIUlshYBWX/nZKKmMIDUo2OVT0szzwmhjiEXcDorN71yNbf
	aObku6znhJ+67Mi24lGnmw95G6Qp3k8rfmmU0IqU1/FWe5CwXheMIr0syne56EBA8dLTHkBl11F68
	j33fnSEyXueAv+pPNsIfUbuRuj6iQf0TJH95RUhO9I4NPyI34pJ7xOCXUPs9YjMTmTTBWfum78e6f
	DEDEnJY197hFJJofkUkt79erK2MzRERgr0IqS1mHl843aR4btJJhkp7TkJDJCWPrdWX7KlT6WOlF5
	Ub79zk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsntT-0000000CHQF-1mMS;
	Thu, 13 Mar 2025 19:06:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnrJ-0000000CGvs-2jWg;
	Thu, 13 Mar 2025 19:04:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741892667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IDai2uCPeDltdnQDWMLspcg/wpWhfJjWrHiFe0Oxud8trPkbuItbTwPuFtBu2bKWZP5HQ1jy6RRWDZo0r+8GsE8DXHALA0KEoVM149PtwDyn8m3zvn9cfUF3NGPOMhmJGYBaAtYFNZeDzE2QQetK0Ueo04up/jXQuEMWEVHLz98=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741892667; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0oIWPDRciLqWE5onPVwFJiWQ7qoNl5vDCFa0WS9jdh4=; 
	b=DTujC8IarYC+WlMIUIA3V0dfkynhjraTTMeFsnB2KEqbUu/k3LXGKBkjdIs0fOtxrcMjuBJlTpGBIfK7T+54EpBTiRMzZ7opNtbGbrabZe6zfoBEY0AbYuobq32eCHgF92H/Fm+Ew1iaLsLH5OQspxGxoqHpn4yvbfOrRpWc5KU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741892667;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0oIWPDRciLqWE5onPVwFJiWQ7qoNl5vDCFa0WS9jdh4=;
	b=ABhqq4BjNTKf0mQ2n2Hu4xIa+Uv0npWPfJe4cdjtmkAbYQRP0OMUUrxvxZ70q2Cc
	Hs54FPNtEfwy1R3Gei2dh/xKBnyV7eTBO2jSGseJgJu8+a+2RONFS68nZwm7e5PeapU
	lHVS1KkEufwpimWodvMlv4XaWdzfcHP76NqFvYws=
Received: by mx.zohomail.com with SMTPS id 17418926658661000.7935840965962;
	Thu, 13 Mar 2025 12:04:25 -0700 (PDT)
Message-ID: <fa5ff28c-ffa0-47d7-9498-ef8b297c7afb@collabora.com>
Date: Thu, 13 Mar 2025 16:04:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format
 on mediatek_mt8188
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-6-ariel.dalessandro@collabora.com>
 <20250311090649.0d15d74d@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250311090649.0d15d74d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_120445_730023_3C218A69 
X-CRM114-Status: UNSURE (   7.22  )
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

Boris,

On 3/11/25 5:06 AM, Boris Brezillon wrote:
> On Mon, 10 Mar 2025 16:59:20 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Now that Panfrost supports AARCH64_4K page table format, let's enable it
>> on Mediatek MT8188.
> 
> Can you maybe give more details on why this is needed
> (legacy shareability/cacheability not suitable for this GPU?)?

Ack, will expand in v2.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


