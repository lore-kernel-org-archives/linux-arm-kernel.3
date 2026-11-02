Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pe3TS/o4;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BdOvR9YR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Celi/Jf23dDYxiVlznjq1HrYLFzw7DtXkyqXcvMwU1o=; b=pe3TS/o4m3AIZf
	cm0o7K01yAZs/wW02WNY11ftjg7Krqd1aW9SFqPKJJSe+3w4/74X9+uavhER3VrUPD1FHTBxKwGk5
	My6BwZapCPfoXZBrhT4aS0fvtBMK2wTFOukclLfydQmUtcLHGH4ISzsLVEiEujTY2PpTpUpWTMnYW
	gTzmD9+BE+miUBa9WpwRu4fZTWE8krkpspeovVwBuBg1TRY/45q1SUKJZGjzOkMjURC8EYFFZ4dsG
	+Zgxi5kawWGyFVNBYZZB0JdVgiW9GcGWADZcv8ZKTV9zdYJRKVjWKkvIyhz7uWoNlRKJq0JpoMgRo
	BTrniy+1DQDS21GLFOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs7g-0000000Gc75-1Vr7;
	Mon, 02 Nov 2026 13:30:52 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs7e-0000000Gc6F-0IzF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:30:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QSwhozA28ShgXnO4vo/Y2h8mkgH1EmGlGFODbd6mOaU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793626248; v=1; x=1794231048;
 b=BdOvR9YRuwP7VQCkEOm9VWoF8zPdmVy97qxm2Q3o9EFpE/TRQbd02uEvarwtDhvJSMj4rw7p
 huG/XEgTInOmP+4TNBAgt2Jh/Y8dr+g8UrVOGq7m1mM+UotGNkZgVcWzgscYs/isXkVehUbiSaT
 BdHTY6NCKjxhYRXaT8cd+Qyo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 83255ff9d38ebe22;
	Mon, 02 Nov 2026 13:30:44 +0000
X-Mizu-Trace-ID: 83255ff9d38ebe22
X-Migadu-Flow: FLOW_OUT
Message-ID: <91573b8c-d5e3-40ab-9e9b-be55e93425c5@linux.dev>
Date: Mon, 2 Nov 2026 13:30:42 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] drm/tidss: oldi: Fix cleanup on a failed init
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-9-dc7f2b532478@ideasonboard.com>
 <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
 <15b7bfd9-8da4-4cd0-9f8b-634c03f46c5e@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <15b7bfd9-8da4-4cd0-9f8b-634c03f46c5e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_053050_381878_F8001D96 
X-CRM114-Status: GOOD (  14.40  )
X-Spam-Score: -2.8 (--)
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



On 02/11/26 11:46, Tomi Valkeinen wrote:
> Hi,
> 
> On 01/11/2026 16:14, Aradhya Bhatia wrote:
>> Hi Tomi,
>>
>> On 29/10/26 10:18, Tomi Valkeinen wrote:
>>> tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a
>>> later
>>> OLDI TX fails, the bridges registered for the earlier ones are not
>>> removed.
>>>
>>> Fix this by calling tidss_oldi_deinit() in the error path.
>>>
>>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/
>>> tidss/tidss_oldi.c
>>> index 506507e83112..7344d86e1f13 100644
>>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>>> @@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>>>   err_put_node:
>>>       of_node_put(child);
>>>       of_node_put(oldi_parent);
>>> +    tidss_oldi_deinit(tidss);
>>>       return ret;
>>>   }
>>>
>>
>> Since tidss_probe() (in tidss_drv.c) calls tidss_oldi_init(), it also
>> calls tidss_oldi_deinit() in its error exit path.
> Yes, but not if tidss_oldi_init() itself fails.
> 
> If we have two OLDI TXes, and the loop in tidss_oldi_init() inits the
> first one, then the second one's init fails, the code jumps to
> err_put_node. If we don't call tidss_oldi_deinit() there, the first OLDI
> TX will not be "deinited".

Thanks, I see what you mean.

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya


