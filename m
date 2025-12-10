Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4B7D3B9AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZTsttuvHY4KRH8vSPsqNmTyYsf1BvktVK1h+5a+Eaw=; b=w3vhQKRwO08a5LBnSW7xz7w385
	xJk6UscmareHkHxGTVMAsyThC1vra2GhY8cOubMQiqj7X9P2RJQPEfFBT/qGDYj9uRYll245PC8ho
	AT7jKuEjmUZoXuJjpSH+DHdwdtzHfih5DZCm9Sp4HdkByjaSvWxYpojCNegY8r7i8WWgMIKDfzBc4
	odaC8meWEq8e+w/aaEdcYLdPjUiViQl6tE1MpTyb+wwZhv/mjFR59U4kccjwb4YnjmjNjq4MVdWEd
	7mCBdjzWggANtCodVltC/iDd2Gqsuv4wwCBbsvOh47gr/LrxFdvrNMQQqL7YPbkd4g9+/9nO5gbwN
	H7ggHh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTR9G-0000000Fs6i-3U4C;
	Wed, 10 Dec 2025 20:50:58 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTR9B-0000000Fs69-443L;
	Wed, 10 Dec 2025 20:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765399807; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VnmgidsXIZDiYQBJMG/THsIlfgtcgK5qtXBxNIty/4D1fOrj4zfan6ZertBCS5UaV2ksStymVCKnB+27v+8YmqOKhnvZhBbBwwt0VgE4FENEheoVQmBHrU5Q3h06B3OIVSWhhgywmTRseAweFW9aEhxNGaAaUNveO02jdjpVYJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765399807; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tZTsttuvHY4KRH8vSPsqNmTyYsf1BvktVK1h+5a+Eaw=; 
	b=ZFGKDhU7HZZO0yULQ977ciWNrXJELFXlonUQ3I9jShWa4/cnR/4apGR9Ma9l5qz4AXz6s9vUC0mXRX393l6V4CWFyOiz+2SwYMvgf9bHY6mZ0vCFTejyNCfDorPb9NGOe0dg4Rxdkorg1xPDO3KkX2ZSYW5a1uHJfVIuMQUI82Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765399807;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tZTsttuvHY4KRH8vSPsqNmTyYsf1BvktVK1h+5a+Eaw=;
	b=cDVBsSTq11152BDFc/ayvIAgrGqwkm2Pth6czcgjqBVSPvmleFNE02ogg2at1qez
	vovli6pma9M/hUMgLtDZKn15NgJN0t+bdX/fBPwSN30X2NvlpKZ+WCnaKy3c90TH7RU
	hHkmpN24WqZSi8iC//f36DpGv/QMncfbaGzX1e2c=
Received: by mx.zohomail.com with SMTPS id 1765399803936476.9898810900985;
	Wed, 10 Dec 2025 12:50:03 -0800 (PST)
Message-ID: <5aa65d89-9bba-4b2b-8727-7a4e69d74cbb@collabora.com>
Date: Wed, 10 Dec 2025 17:49:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/20] drm/colorop: Allow parenting colorop to CRTC
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-2-ac4471b44758@collabora.com>
 <bc2b7afa-96c0-4b33-a413-3758ab8fd571@bootlin.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <bc2b7afa-96c0-4b33-a413-3758ab8fd571@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <5aa65d89-9bba-4b2b-8727-7a4e69d74cbb@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_125054_063534_70EB59D1 
X-CRM114-Status: GOOD (  16.79  )
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

Louis,

Following up on Nicolas' series.

On 9/19/25 9:44 AM, Louis Chauvet wrote:
> 
> 
> Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
>> In order to allow for post-blend color pipelines, colorops need to be
>> assigned to a crtc rather than a plane. Add a crtc to the colorop
>> struct to enable this. Either the plane or the crtc will be set for any
>> given colorop depending on whether it is part of a pre- or post-blend
>> color pipeline.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   include/drm/drm_colorop.h | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index 
>> d61c6c40e47162cb8b1e7db58b6746c43ac5d202..7a4e0d0c4a3d594abecef304b1d5990434cdb231 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -206,10 +206,16 @@ struct drm_colorop {
>>       /**
>>        * @plane:
>>        *
>> -     * The plane on which the colorop sits. A drm_colorop is always 
>> unique
>> -     * to a plane.
>> +     * The plane on which the colorop sits if it is a pre-blend colorop.
>> +     * In this case it is unique to the plane.
>> +     *
>> +     * @crtc:
>> +     *
>> +     * The CRTC on which the colorop sits if it is a post-blend colorop.
>> +     * In this case it is unique to the CRTC.
>>        */
> 
> If there is a v3 of this series, I think it could be nice to have 
> something like "plane and CRTC are mutually exclusive".

Sounds good, will add in v3.

> 
> With or without this:
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


