Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C52CD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1uZmAFhIf/BpsGYDdVGvZjfqxClnkRrnP4gO1FVGUw=; b=AjOWX+g4bIqSIJDg3GFuU+7znM
	mKPE9quP7wlxhASXbw1+KNZLRqTkbhFFLl8S1zsb8LW57AkqTig6ZlOCZP8w7EgMipa3CmluieW1s
	k8FPXdgZeMoiIoMhoIsTY6q4lxjdjKJJ40D6GrCkWkOtDfbA1rsf3jmdlDGMLmT/k6mD4uYEHVxlI
	xG70eVDW7sdiC8p7hbkM/9jIHQek8PJpr3r2k2D50OWAjutP0sJSCDNxQCcelTp4T7+nXX6kgN0ZQ
	OtjKE4LExVokX/ReqsQphKNHvOGSnhZDbq/jblMp4/iXCMipkV84OO7SZTi2f9wcAm9+vdAAY8fVG
	pM2atdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Ne-0000000BRlw-0FHO;
	Fri, 12 Jun 2026 19:17:26 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Na-0000000BRjI-1idD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:17:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CABF5457E;
	Fri, 12 Jun 2026 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781277886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1uZmAFhIf/BpsGYDdVGvZjfqxClnkRrnP4gO1FVGUw=;
	b=nK5ym7pMW9Z4M8QUnM4ayPb3a8K+dFo0xH73ixcZYMu2hXJrSCa0K14B8lgwERaTs0UX19
	wOGeeHqy3Km0ENk/mYXssDLpibc/i5H8pdv2IVHk1zr+Mgs2fe6wrup60zjvo5rovztjgC
	FUpVRghUYKTtrI+TPLKHHrSf3HdXg74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781277886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1uZmAFhIf/BpsGYDdVGvZjfqxClnkRrnP4gO1FVGUw=;
	b=A7rPy1qMPgVT9GJwnXaH/XQ7r5noj13QWQvuEYJNdWthII/ZdyCj4IuQI/yRAXado37oYU
	Yw2oMxCSenVz0WAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RD9DdjJ8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iNpp5ScH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781277884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1uZmAFhIf/BpsGYDdVGvZjfqxClnkRrnP4gO1FVGUw=;
	b=RD9DdjJ8H6xiTX7/QP1zmmp7O8cXO+NtSCaQp0ABphlvvBbvAlExMolznNYCj+P3SsCYRb
	+Jth+bCfGMJn6n2kr/2LM5NxalI581vtVIhXwus+vU11vabJ0km11I/MHhubkYlCVsA04Z
	z7bpHHvmhpaaN6LkhxKAXZNCHPeSD/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781277884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1uZmAFhIf/BpsGYDdVGvZjfqxClnkRrnP4gO1FVGUw=;
	b=iNpp5ScHONDgQfBeneamoXJDuc+gZUzvF5gijJKjNmYXb76gjf++r73TRbg7ti5yFuMdq7
	XQWrVzTbZ5B0U4CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 203C8779A7;
	Fri, 12 Jun 2026 15:24:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MvyDBbwkLGrTVwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 12 Jun 2026 15:24:44 +0000
Message-ID: <5b167316-ed50-448c-aa05-6a041a6544d5@suse.de>
Date: Fri, 12 Jun 2026 18:24:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM
 controller
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780670224.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780670224.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,devicetree.org:url,qualcomm.com:email,raspberrypi.com:email,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CABF5457E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_121722_625888_43891A1E 
X-CRM114-Status: GOOD (  12.59  )
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



On 6/12/26 5:01 PM, Andrea della Porta wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
> 
> Add the devicetree binding documentation for the PWM
> controller found in the Raspberry Pi RP1 chipset.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> new file mode 100644
> index 0000000000000..6f8461d0454f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raspberry Pi RP1 PWM controller
> +
> +maintainers:
> +  - Naushir Patuck <naush@raspberrypi.com>

Could you add you or me as a maintainer as well. I'm not sure Naushir
had agreed to maintain the bindings in mainline.

~Stan

