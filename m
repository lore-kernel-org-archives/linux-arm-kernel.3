Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VVfGFJya;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qOnMK50P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qyLdQkfNYwaIL2tvZVHosKJLHM/SF1iBQ073W2ag8io=; b=VVfGFJya2vyc/2
	YskWsZGF+IWSi24S+kjHpl8HSIO9rQMWVU/UqEGMMVvZKg3zCCp5AwZAR78jk4hSsO64wdBU+4Nyu
	EkhJ496yuTQZnCf6jOyYNHt+TsTJ3+khRs2AixltrmljzCuYefyFpiuHOo1A2eNhWGZd5C4aEq4qD
	0MbuiojzOQNXuTLgiZER6THKTqae3WXOhC55xI7BtPFs9bBrQHK953+uNh7iOBrsCxISBUg3NGxRt
	9ZaUmyZ4Nbl5pJ3muXMTVGxxyF4Wmdo3sgkt+/nJwp7CAPIrsAcBYyV7gzA6LRUUkkVmX2WvLDq4c
	5OGbluAh2UmgtdA6v+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFih-00000002kBs-47Q5;
	Tue, 03 Nov 2026 14:42:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFif-00000002kBR-39CS;
	Tue, 03 Nov 2026 14:42:39 +0000
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03CE9802;
	Tue,  3 Nov 2026 15:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793716817;
	bh=fM8o4Yo6P86qJeboPptU0LDF1gRn7q7sqG/GOoNdjNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOnMK50PBKh6oHOxSSuyvk+004pafcNzaowW/M8IjGltitFSkhnZHRE3Q//JC36s7
	 vOU7Jtx6M2ylrocsMAQ051XYvnXzQ1F05n3sz0tkz/C6okmxjKCoOHfGLDuLgBWilR
	 1cyffsIeejfgae0B2Ip1Xq69vU2f20M8FF6bSqvE=
Message-ID: <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
Date: Tue, 3 Nov 2026 14:42:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
 <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_064237_962887_A88792B2 
X-CRM114-Status: GOOD (  18.95  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi both

On 03/11/2026 13:51, Nicolas Dufresne wrote:
> Le mardi 03 novembre 2026 à 10:09 +0200, Gjorgji Rosikopulos (Consultant) a
> écrit :
>> Hi Daniel,
>>
>> On 11/3/2026 9:40 AM, Daniel Scally wrote:
>>> Add a flags field to struct v4l2_device, along with a single flag
>>> value that is designed to tell v4l2-async in which direction data
>>> flows for this v4l2 device so that it knows how to set up device
>>> links between subdevices connected using the async APIs.
>>>
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>>   include/media/v4l2-device.h | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
>>> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
>>> --- a/include/media/v4l2-device.h
>>> +++ b/include/media/v4l2-device.h
>>> @@ -15,6 +15,9 @@
>>>   
>>>   struct v4l2_ctrl_handler;
>>>   
>>> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
>>> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
>>
>> Just for the clarification do we change the meaning of output->capture to input->output?
>> I know that output is confusing for everyone including me but somehow i get used to it.
>> However to clarify what this means will be helpful :-)
> 
> I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
> CONSUMER, or does anyone has a better idea?

I have no better ideas - naming things was never my strong suit - so happy to use PRODUCER / CONSUMER.

Thanks
Dan

> 
> Nicolas
> 
>>
>> ~Gjorgji
>>
>>> +
>>>   /**
>>>    * struct v4l2_device - main struct to for V4L2 device drivers
>>>    *
>>> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
>>>    * @ref: Keep track of the references to this struct.
>>>    * @release: Release function that is called when the ref count
>>>    *	goes to 0.
>>> + * @flags: device flags. Can be:
>>> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
>>> + *   "output" rather than an "input"
>>>    *
>>>    * Each instance of a V4L2 device should create the v4l2_device struct,
>>>    * either stand-alone or embedded in a larger struct.
>>> @@ -54,6 +60,7 @@ struct v4l2_device {
>>>   	struct v4l2_prio_state prio;
>>>   	struct kref ref;
>>>   	void (*release)(struct v4l2_device *v4l2_dev);
>>> +	u32 flags;
>>>   };
>>>   
>>>   /**
>>>
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip


