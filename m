Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B284F31E22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naDRmm0MM0WP+mSb+OhGMjRTyDM6lQGDHz2YaDAdfQ8=; b=L4V7VgVhuFfw7Q0VQeCtIovLTc
	KL2CJRGkjf1EH7rN0zE6bk4u8z3595NUc0DjtEB3SGpe412HxNM8/XFF/7p7kvTS234PQ7IlscoFk
	X/VQX+H51xH6SG0aV9l21inZY6BvmyTUfweJyUq+AbZeYOAPMU0XRwn9h/YDpH2n1FERQryDwPH75
	gom4caXeyIDBTnwXuXL5yC32kfu2XGUmP9Kl/+NBkHDn3hHnwZsyy2SXOUhIKOhK54RKlM+XAe9lT
	OljCBivUwuCN5201L22b/KSpyA1Q+RTCxpSQ2DW8siyJFDmFfcuT4zYZMKGFD8OQHIr53JIzwK3h1
	QFLNgJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqO2-0000000Ahfw-05LT;
	Thu, 09 Apr 2026 14:29:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqO0-0000000AhfZ-01ub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775744962; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iwdDStjy1cdrXLE1JCJAYfLrd7FffWJYfu9OB/A8Q5UsNERnIXsqj9b9in11rt+5oT9Lu6G7KwqCk3boSPj9OY8vskNNeq0f79teqNwQDfuDNEX0qwPah3L257RjSBYKp8h/w8F8CbIg6eXFZbq6FuqZX8P5jewbw6yFK3xbNa8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775744962; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=naDRmm0MM0WP+mSb+OhGMjRTyDM6lQGDHz2YaDAdfQ8=; 
	b=OB4GrK4sl26bfcBg3lBvyYPkyEznlknhhOIPJm1WZ85CFKmUAe6psezd+QBOPqMr8GpUs8oxQggS8f1D9RTC7X/APSvZ169SWqffikgVCeHqpvmvqKGxMlDUlT2hjyX4iFMmU3itLOt4fRFwnWM3/GRMY4C4nTW1oDf+mBApg2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775744962;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=naDRmm0MM0WP+mSb+OhGMjRTyDM6lQGDHz2YaDAdfQ8=;
	b=AhaDif0sTnHOO9nABQArM+2Ndx0Nic87K7hL5ocYHdJlnrafXjoYyQyC4y4x7mX9
	qdvofsh4JSKJfIQYqKfKBFdfhuFyGbNmuawYdu0caXriPqcrOt0agmDZl48BDwxkdld
	FcZBPZPcEbqpqtcziNql+THIqTs+/sb9gfb931DE=
Received: by mx.zohomail.com with SMTPS id 1775744959635728.7774325162087;
	Thu, 9 Apr 2026 07:29:19 -0700 (PDT)
Message-ID: <9fdca013-32f7-4ce1-a296-f2f36ef31b50@collabora.com>
Date: Thu, 9 Apr 2026 10:29:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
 <20260331072347.253-2-ming.qian@oss.nxp.com>
 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
 <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
 <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
 <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
 <8911674f2f86a4b75e1f44d6e9b66a28f6e74e56.camel@ndufresne.ca>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <8911674f2f86a4b75e1f44d6e9b66a28f6e74e56.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_072936_071977_B4223AF9 
X-CRM114-Status: GOOD (  24.28  )
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



On 4/8/26 17:11, Nicolas Dufresne wrote:
> Le jeudi 02 avril 2026 à 11:14 +0800, Ming Qian(OSS) a écrit :
>> Hi Nicolas,
>>
>> On 4/1/2026 10:23 AM, Ming Qian(OSS) wrote:
>>> Hi Nicolas,
>>>
>>> On 3/31/2026 10:54 PM, Nicolas Dufresne wrote:
>>>> Le mardi 31 mars 2026 à 10:33 -0400, Frank Li a écrit :
>>>>> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com wrote:
>>>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>
>>>>>> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
>>>>>> applications to query the total amount of memory currently used
>>>>>> by a device instance.
>>>>>>
>>>>>> This control reports the memory consumption in bytes, including
>>>>>> internal buffers, intermediate processing data, and other
>>>>>> driver-managed allocations. Applications can use this information
>>>>>> for debugging, resource monitoring, or making informed decisions
>>>>>> about buffer allocation strategies.
>>>>>>
>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>> ---
>>>>> Not sure why not export these information by debugfs, or any benefit vs
>>>>> debugfs?
>>>> There is also a on-going proposal that uses fdinfo.
>>>>
>>>> Nicolas
>>>>
>>> Thanks for the reminder about the ongoing fdinfo proposal.
>>>
>>> Just to confirm, you are referring to Detlev’s ongoing fdinfo proposal,
>>> specifically this series:
>>> https://lore.kernel.org/lkml/20260212162328.192217-1-
>>> detlev.casanova@collabora.com/
>>>
>>> I will align my work with it and switch to using fdinfo.
>>> Once the show_fdinfo support from that series is merged, I will prepare
>>> the next revision of my patch accordingly.
>>>
>>> Regards,
>>> Ming
>>>
>> Regarding the discussion about using fdinfo instead of a V4L2 control, I
>> have two questions:
>>
>> 	1. Key consistency in fdinfo
>> 	fdinfo uses key–value pairs, which is flexible, but if multiple
>> 	drivers want to expose the same “memory usage” information,
>> 	they need to agree on a common key name and meaning. Otherwise
>> 	user‑space must handle each driver differently. A V4L2 control
>> 	naturally provides a unified interface without this coordination
>> 	effort.
>>
>>
>> 	2. Lack of notification in fdinfo
>> 	With a control, user‑space can subscribe to control events and
>> 	receive notifications when the memory usage changes. fdinfo does
>> 	not have a built‑in event mechanism, so users must either poll
>> 	or rely on additional eventfd‑like or custom event mechanisms.
>>
>> Do you have any suggestions or existing practices to address these two
>> issues when using fdinfo?
>>
>> Thanks again for your time and comments.
> Added Detlev in CC. You can also refer to his work through:
>
> https://lore.kernel.org/all/20260212162328.192217-1-detlev.casanova@collabora.com/
>
> Nicolas
Hi Ming !

One of the reasons for using fdinfo is that it's already being used in 
the drm subsystem and it is working well.
Of course, in DRM, drivers don't allocate a lot of memory themselves, 
userspace drivers (in mesa) go through the DRM uAPI to allocate buffers, 
making the DRM subsystem aware of all allocated memory.
That lets DRM show memory stats in a standard way for all drm drivers. 
In v4l2, memory allocation is shared between userspace and the driver.
We could have drivers report memory usage through a callback and 
v4l2-core can add the standard field based on that.

For notifications, I don't really see a need for that, most tracing 
tools will use polling (I'm thinking perfetto, but also top-like tools).
We could have a max-mem-usage field if we'd want to make sure we don't 
miss the maximum memory usage between 2 polls.

Finally, I think v4l2 controls should only be used to control, configure 
and exchange data with video devices, not get stat information on what 
the driver is doing.

Detlev.
>
>> Regards,
>> Ming
>>
>>>>> Generanlly document should be first patch, then driver change.
>>>>>
>>>>> Frank
>>>>>
>>>>>>    drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>>>>>>    include/uapi/linux/v4l2-controls.h        | 4 +++-
>>>>>>    2 files changed, 11 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/
>>>>>> media/v4l2-core/v4l2-ctrls-defs.c
>>>>>> index 551426c4cd01..053db78ff661 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>>        case V4L2_CID_ALPHA_COMPONENT:        return "Alpha Component";
>>>>>>        case V4L2_CID_COLORFX_CBCR:        return "Color Effects, CbCr";
>>>>>>        case V4L2_CID_COLORFX_RGB:              return "Color Effects,
>>>>>> RGB";
>>>>>> +    case V4L2_CID_MEMORY_USAGE:        return "Memory Usage";
>>>>>>
>>>>>>        /*
>>>>>>         * Codec controls
>>>>>> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char
>>>>>> **name, enum v4l2_ctrl_type *type,
>>>>>>            *min = 0;
>>>>>>            *max = 0xffff;
>>>>>>            break;
>>>>>> +    case V4L2_CID_MEMORY_USAGE:
>>>>>> +        *type = V4L2_CTRL_TYPE_INTEGER64;
>>>>>> +        *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>> +        *min = 0;
>>>>>> +        *max = S64_MAX;
>>>>>> +        *step = 1;
>>>>>> +        break;
>>>>>>        case V4L2_CID_FLASH_FAULT:
>>>>>>        case V4L2_CID_JPEG_ACTIVE_MARKER:
>>>>>>        case V4L2_CID_3A_LOCK:
>>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/
>>>>>> linux/v4l2-controls.h
>>>>>> index 68dd0c4e47b2..02c6f960d38e 100644
>>>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>>>> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>>>>>>    #define V4L2_CID_COLORFX_CBCR            (V4L2_CID_BASE+42)
>>>>>>    #define V4L2_CID_COLORFX_RGB            (V4L2_CID_BASE+43)
>>>>>>
>>>>>> +#define V4L2_CID_MEMORY_USAGE            (V4L2_CID_BASE+44)
>>>>>> +
>>>>>>    /* last CID + 1 */
>>>>>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>>>>>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>>>>>>
>>>>>>    /* USER-class private control IDs */
>>>>>>
>>>>>> -- 
>>>>>> 2.53.0
>>>>>>


