Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E3FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zATmQj0XyB7/VoZzjPmz0V+W644epir4Rl4IGnvK18o=; b=OhNy75TSR0+r4oqEsEEU0ah6Tf
	ZhGUxklqD1AQIZuaRUtMXOBcXEqi7qWga6jWbMsA95u5Xj45mgsP1fNhUcqwghbYmHUfeo5GO1vq3
	aRVFIGK+cev+C3fhgQZlF81XD+yBnnJ89u8sQ9ltszJq7mXyfWiu+9v6T6yWAQFKnX/gN1H363tW4
	ftYHozT5KrP9sldymHmt/UsexKs9VfyREZVx0+QHbh+s9PVNyegJp8OMT1uvmoC70UEEMEGSdFaKW
	pz1ooPYYquND/NxMrWgU/vOL4Uqp769zBpk+QvPV3v1X0vGIoPk0kKfol2Eav1J1aGHVbUNG8H2Yb
	3pXjq5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMSe-00000008cJq-0NsH;
	Wed, 12 Mar 2025 13:49:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM4s-00000008YtD-0uY0;
	Wed, 12 Mar 2025 13:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741785874; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KQ2P/C6BtkYsueq4akRJPsp2naRHaM7GZ9RL9q/HknxMqsZ/t5EvSXen297LmjxH4CUXZHk7qFgYS0Q2NIGXE2V5uMsCi7o5G3kZuOQ43ORA71hSJJLHp4vgfH3mDCh2oIVbkOSE/JPvQ/P3NThah7EoXKW4HKltNqtwVClsc5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741785874; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zATmQj0XyB7/VoZzjPmz0V+W644epir4Rl4IGnvK18o=; 
	b=BXsSNOEqCeOufLJNWTjNcx3/6+LmMi2c3f59FFUK7kSGQQyDsVqVKD8CU04rMN2uSt2kgvrui/1WgqHpOF/jnVGpMkwy/GE0vCbkRETpaeFgpuQcrgFiV9LvpHRaRcD6QxhcGneqmXcb+G9tY2lP1e80YuEdXjjV5KAsgJ+rvNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741785874;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zATmQj0XyB7/VoZzjPmz0V+W644epir4Rl4IGnvK18o=;
	b=D/UFUKhGVuHLpq0HvEd/liwgMeVn13FHRlBLaLu7IOARHB62GAz0tEKwquyBZfNx
	rJ2Vw+kG2SEajG9072z1u05X2ZmvLxXX/A+92OmcHrofUcR9mGZjrAMwUUpYXYKHSHz
	nb7bowQoGRkqA24ygY9kQEUESaft6X0CN82kJ1A8=
Received: by mx.zohomail.com with SMTPS id 1741785871899734.2310655484773;
	Wed, 12 Mar 2025 06:24:31 -0700 (PDT)
Message-ID: <3aca6477-6014-4c24-8aa6-6c601fc54a32@collabora.com>
Date: Wed, 12 Mar 2025 10:24:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] drm/panfrost: Unify panfrost_mmu_enable/disable
 common code
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-4-ariel.dalessandro@collabora.com>
 <20250311085158.37329b0c@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250311085158.37329b0c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_062454_347353_2B0159DA 
X-CRM114-Status: GOOD (  11.24  )
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

On 3/11/25 4:51 AM, Boris Brezillon wrote:
> On Mon, 10 Mar 2025 16:59:18 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Both these functions write to MMU_AS_CONTROL register in the same way.
>> Define a common _panfrost_mmu_as_control_write function with the shared
>> code.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 33 ++++++++++++-------------
>>   1 file changed, 16 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 294f86b3c25e7..31df3a96f89bd 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -121,38 +121,37 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
>>   	return ret;
>>   }
>>   
>> -static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>> +static void
>> +_panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
>> +			       u64 transtab, u64 memattr)
> 
> I'm honestly not convinced this is needed. Let's just stick to
> panfrost_mmu_enable/disable().

Ok, will drop in v2.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


