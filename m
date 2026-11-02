Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C905606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S04qzZM3;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=sJNlNoob
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W+m3CHrmFQywLf6TePlg1mKGWwLKYliHCdWDTJ6aHQ8=; b=S04qzZM3ZgyiO5
	PQtrs3FN/JnUww5TBgiDAvFoMRuJbWN472WGoSV3E3ZwiTQXGJhluSiW1e3VFIPNmV5AuUIdZnAVH
	mAQ1EFH23Lg1EDtgdAMHU2pDgchJlAA8gjekkgyygD2W50To8KWewmL/44PKYiw17uKvA3s8/bpwF
	tac56Z6foIk7FXKYkT81RjqmvQklwGm6y8UGNH6UDBA3pEX2ggVqA5MZ0ghY3DTV/nep4h9igs0hI
	ia+/OJkJ6UcLCL7eK1j00qroLHZjjZoIrG74/a6yAgXoQC2C1ydKRkOqd8R7t8ghu52Z4IYe2YdNC
	90JRnAyxH3PASKXXR+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqUq-0000000GNub-0iLM;
	Mon, 02 Nov 2026 11:46:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqUn-0000000GNu3-3oae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:46:39 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98CDEBE;
	Mon,  2 Nov 2026 12:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793619859;
	bh=Il2jawOtTACJ7zfhzEJQgLvlmZ3qfox3dZ+2zsbOxBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJNlNoobrLo/mTzbYvXpee1l13KmgrCl0cDspWwcvH3uWHndcG2AvJFi1Sx5O6oTN
	 8gbZGXdzgKffXCiq5AMopa6ANUAK4qf+lAWBbRxIAzcU9YN5WiTcUr+mm8dtC3Knp2
	 SFpekWuXXZNll1ziSKZdWc73Nb8GabUL71yCz6Uk=
Message-ID: <15b7bfd9-8da4-4cd0-9f8b-634c03f46c5e@ideasonboard.com>
Date: Mon, 2 Nov 2026 13:46:32 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] drm/tidss: oldi: Fix cleanup on a failed init
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
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
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <c12f6a9f-983d-4704-a90b-3453ce984a2c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_034638_150572_BAA63278 
X-CRM114-Status: GOOD (  14.35  )
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

Hi,

On 01/11/2026 16:14, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 29/10/26 10:18, Tomi Valkeinen wrote:
>> tidss_oldi_init() registers a bridge for each OLDI TX in turn. If a later
>> OLDI TX fails, the bridges registered for the earlier ones are not
>> removed.
>>
>> Fix this by calling tidss_oldi_deinit() in the error path.
>>
>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/tidss/tidss_oldi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> index 506507e83112..7344d86e1f13 100644
>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -638,5 +638,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>>   err_put_node:
>>   	of_node_put(child);
>>   	of_node_put(oldi_parent);
>> +	tidss_oldi_deinit(tidss);
>>   	return ret;
>>   }
>>
> 
> Since tidss_probe() (in tidss_drv.c) calls tidss_oldi_init(), it also
> calls tidss_oldi_deinit() in its error exit path.
Yes, but not if tidss_oldi_init() itself fails.

If we have two OLDI TXes, and the loop in tidss_oldi_init() inits the 
first one, then the second one's init fails, the code jumps to 
err_put_node. If we don't call tidss_oldi_deinit() there, the first OLDI 
TX will not be "deinited".

  Tomi


