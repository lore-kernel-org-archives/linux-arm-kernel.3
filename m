Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D58CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jessRx6TNC0QixhPKRj2h5XBAo+ylMyAf01j+QDGZrw=; b=QS/e0HtLqGDzedvr/m4izVHXRp
	Qa5SxB3eOHT5lhXbc6b5lyR072e9ZIFJKcpiWIoHxj5D0bfelT4kYXTAUzTetYfcIUy+mXg4TvE+g
	u0Pck4HNOQhBoXTFcB3/zwdFBTNoL9thGoFUoyOQlGUzlrcuvBPQFSr6CYnXRVhKt2Z+vn/yIkZCi
	dpnDJ6PYT+6R2+ox0x/oSQov5qw4kdmGkF1LtzJwQqDUZGXYJaw+PRrrpOiv2kdazl7yRNHKoUjTf
	hu2CutOCFuGLLEoIWYWwOxvYRNZ6iAIvGBg0cm4W5egqnxLbdy3U8nFEEkwRkbcSJsNuTS55IuhsW
	RBb7c4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtlM-00000006byz-2Uhg;
	Fri, 31 Oct 2025 18:22:12 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtlI-00000006byF-1dYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:22:09 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 433DE223E4;
	Fri, 31 Oct 2025 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761934926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jessRx6TNC0QixhPKRj2h5XBAo+ylMyAf01j+QDGZrw=;
	b=TzgpNHyKZcFSDWwunMLd2X71Jgz9ba03UiBxZQcLzDelaJP6atFhs4LA0UDe8oMvUnDgwp
	PXC4sOOnEzEEwiKdsskYEq54s11zaGrTZsRRvvU0ig797fLdg+pXn4i0rHIPxMGOQUoN6l
	l6wrLEjXKj2RmV1xsZ8efQstlGY02JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761934926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jessRx6TNC0QixhPKRj2h5XBAo+ylMyAf01j+QDGZrw=;
	b=CEH3HQeMT3rUTyh+KA1JIrTOUkOIE/w2GWcujKzHW1fp1rCI2mIJMdd52lszF9KohAiG1t
	YyI7HhGigbhCIZBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761934926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jessRx6TNC0QixhPKRj2h5XBAo+ylMyAf01j+QDGZrw=;
	b=TzgpNHyKZcFSDWwunMLd2X71Jgz9ba03UiBxZQcLzDelaJP6atFhs4LA0UDe8oMvUnDgwp
	PXC4sOOnEzEEwiKdsskYEq54s11zaGrTZsRRvvU0ig797fLdg+pXn4i0rHIPxMGOQUoN6l
	l6wrLEjXKj2RmV1xsZ8efQstlGY02JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761934926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jessRx6TNC0QixhPKRj2h5XBAo+ylMyAf01j+QDGZrw=;
	b=CEH3HQeMT3rUTyh+KA1JIrTOUkOIE/w2GWcujKzHW1fp1rCI2mIJMdd52lszF9KohAiG1t
	YyI7HhGigbhCIZBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A086D13991;
	Fri, 31 Oct 2025 18:22:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1SBoJU3+BGn3bwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 18:22:05 +0000
Message-ID: <309707dc-43e6-4c2c-9547-cbfce2e9e1fb@suse.de>
Date: Fri, 31 Oct 2025 20:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: bcm: Add bcm2712 compatible
To: Conor Dooley <conor@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20251031102423.1150093-1-svarbanov@suse.de>
 <20251031102423.1150093-3-svarbanov@suse.de>
 <20251031-icon-woozy-58061dd3d4b4@spud>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20251031-icon-woozy-58061dd3d4b4@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_112208_939913_02E0E497 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Conor,

On 10/31/25 5:04 PM, Conor Dooley wrote:
> On Fri, Oct 31, 2025 at 12:24:21PM +0200, Stanimir Varbanov wrote:
>> Add bcm2712-pm compatible and update the bindings to satisfy it's
>> requirements. The PM hardware block inside bcm2712 lacks the "asb"
>> and "rpivid_asb" register ranges and also does not have clocks, update
>> the bindings accordingly.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>  .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 38 ++++++++++++++++---
>>  1 file changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
>> index e28ef198a801..ce910802ee9d 100644
>> --- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
>> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-pm.yaml
>> @@ -13,23 +13,21 @@ description: |
>>  maintainers:
>>    - Nicolas Saenz Julienne <nsaenz@kernel.org>
>>  
>> -allOf:
>> -  - $ref: /schemas/watchdog/watchdog.yaml#
>> -
>>  properties:
>>    compatible:
>>      items:
>>        - enum:
>>            - brcm,bcm2835-pm
>>            - brcm,bcm2711-pm
>> +          - brcm,bcm2712-pm
>>        - const: brcm,bcm2835-pm-wdt
>>  
>>    reg:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 3
>>  
>>    reg-names:
>> -    minItems: 2
>> +    minItems: 1
>>      items:
>>        - const: pm
>>        - const: asb
>> @@ -62,7 +60,35 @@ required:
>>    - reg
>>    - "#power-domain-cells"
>>    - "#reset-cells"
>> -  - clocks
>> +
>> +allOf:
>> +  - $ref: /schemas/watchdog/watchdog.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - brcm,bcm2835-pm
>> +              - brcm,bcm2711-pm
>> +    then:
>> +      required:
>> +        - clocks
>> +
>> +      properties:
>> +        reg:
>> +          minItems: 2
>> +
>> +        reg-names:
>> +          minItems: 2
> 
>> +
>> +    else:
>> +      properties:
>> +        reg:
>> +          minItems: 1
>> +
>> +        reg-names:
>> +          minItems: 1
> 
> This else has no impact, was it meant to be maxItems?

Oops, yes it should be maxItems. Sending new version ...

~Stan


