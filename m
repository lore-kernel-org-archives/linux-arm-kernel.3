Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C526ACCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FO5TJu0e3hKi5ooEEyq91mLNTSFD8iqOTnH4/uGmiI=; b=EPRfr/dx6qqCTLdBYEqMrO0jwj
	6lv5+X6rvoAi6GXri5sr8fwrxRPqqzJSc1gmbS6HlCL8SUBpzwthmSH3ban13Pc6Mb/tsBqzHsCVI
	zo6z6NGR3ZXQBAeQYYyQX+ACcoILHfwE/8kWCmPd+dR9gT2w/tCWCOnO5L2XqqX3ufWQbDVT4Zig3
	I9vuuXr2qV1MQ3T1Qik168B9KvitLy7IZjEeH2U8PT3SL+ENpqgITsxRwp10vfvkbb43C+p1YrbKh
	T9Jd8J9Qe7ZbNYY8S0O+I3d9cwOsB5ETCPaqQ9vupdOGKW4YSWiQB+UI+fYtIGdtaCCMI8YjuLfp4
	ZlNebVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XTp-00000004zgn-1LdH;
	Tue, 30 Sep 2025 10:21:09 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XTj-00000004zfB-0hHg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 10:21:07 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 125C6336CF;
	Tue, 30 Sep 2025 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759227661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FO5TJu0e3hKi5ooEEyq91mLNTSFD8iqOTnH4/uGmiI=;
	b=lC1nOXmwgp1Fr1DLnriYWoc4IfBB0y/Vp0R5PvPq1Rwptyjlw78PCwQxFOJQSKCq32GHBT
	WQoNbevmCL+F96OIMzYL3sNB6QGMgq+LHikU3Gzm0tIlwqCrP2J32yNwu1sZ7XvpuO+wfk
	Qdrj01zGuMMelSUJSWHTI/xT4OWMNKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759227661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FO5TJu0e3hKi5ooEEyq91mLNTSFD8iqOTnH4/uGmiI=;
	b=gkTeZUFV70twndFZVAS8N0ffQ87/o43z5AxtvtJ9CKbeIXB+Bq5SgrVZtz8kxWtP2RWeCc
	GpzVhEbqissIJTBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lC1nOXmw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gkTeZUFV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759227661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FO5TJu0e3hKi5ooEEyq91mLNTSFD8iqOTnH4/uGmiI=;
	b=lC1nOXmwgp1Fr1DLnriYWoc4IfBB0y/Vp0R5PvPq1Rwptyjlw78PCwQxFOJQSKCq32GHBT
	WQoNbevmCL+F96OIMzYL3sNB6QGMgq+LHikU3Gzm0tIlwqCrP2J32yNwu1sZ7XvpuO+wfk
	Qdrj01zGuMMelSUJSWHTI/xT4OWMNKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759227661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FO5TJu0e3hKi5ooEEyq91mLNTSFD8iqOTnH4/uGmiI=;
	b=gkTeZUFV70twndFZVAS8N0ffQ87/o43z5AxtvtJ9CKbeIXB+Bq5SgrVZtz8kxWtP2RWeCc
	GpzVhEbqissIJTBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1734213A3F;
	Tue, 30 Sep 2025 10:21:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kvSsAgyv22iuBwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 30 Sep 2025 10:21:00 +0000
Message-ID: <88bd67f2-de8c-407b-ba98-08663eee2d7e@suse.de>
Date: Tue, 30 Sep 2025 13:20:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-2-svarbanov@suse.de>
 <20250925-outlying-causal-015d8ba33c53@spud>
 <89dd04b9-e261-4bdd-83ab-499e46fc9c01@roeck-us.net>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <89dd04b9-e261-4bdd-83ab-499e46fc9c01@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,lists.infradead.org,broadcom.com,suse.com,kernel.org,lunn.ch,gmx.net,raspberrypi.com];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,devicetree.org:url,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 125C6336CF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_032103_491625_9EA29819 
X-CRM114-Status: GOOD (  17.60  )
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

Hi,

On 9/25/25 11:37 PM, Guenter Roeck wrote:
> On Thu, Sep 25, 2025 at 08:40:54PM +0100, Conor Dooley wrote:
>> On Thu, Sep 25, 2025 at 03:04:13AM +0300, Stanimir Varbanov wrote:
>>> Document dt-bindings for Raspberry Pi's RP1 ADC.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> ---
>>>  .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++++++
>>>  1 file changed, 46 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
>>> new file mode 100644
>>> index 000000000000..5266b253fd2b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
>>> @@ -0,0 +1,46 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Rasberry Pi RP1 ADC device
>>> +
>>> +maintainers:
>>> +  - Stanimir Varbanov <svarbanov@suse.de>
>>> +
>>> +description: |
>>> +  The RP1 ADC is a five input successive-approximation ADC with 12-bit
>>> +  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
>>> +  and one internal temperature sensor.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: raspberrypi,rp1-adc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  vref-supply:
>>> +    description:
>>> +      Reference voltage regulator 3.3V.
>>
>> Looks like you're missing the io-channels-cells property that allows
>> this device to be a provider of adc channels to other devices.
>>
> Only makes sense if the driver is implemented as iio driver.
> Which would be fine with me, assuming this is a generic ADC.
> The iio -> hwmon bridge can then be used to instantiate a
> hwmon device if needed.
> 

According to the RP1 peripheral document the information about ADC is
limited and I cannot be 100% sure that this is generic ADC, but it looks
like it is. On RPi5 board the ADC inputs are not configurable, but that
could change on another board.

I personally don't have objections to implement it as IIO driver.

Phil, are you fine with implementing the driver as IIO?

~Stan


