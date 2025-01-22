Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F5C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=; b=Qat1uPjpvhqolK2q8j9K7baApE
	BlBC1kZZsAfLu7bikpBxHyAZvRIHUHJ59ekpF7Gx9iKX6JFGQSajcO0IraJJExIuqyaG1xBZx+IQF
	a8IwjUxOiiK+wsooVwYb+Yn+Jv3PMG7hMr9pjmc9t/UmRhAJw1A/PVyiPed+1+2I5EL41UBSohRKq
	ZnthOo7KbQFN/C7t4RvPUEXAEbnnz/nthWK5gwRV5Edf8J58wDh8QlS2Xfv7KVN2NkTkckLWQkbMx
	Q6QVFvO4VJjCdJh+8YSBDmD2vmPJaf9u7UgXlCNJpp16J3/fcvvl7OYg0pn6QpZoWsN3spfA5fKhX
	AG9Cznrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taa4z-0000000ABEH-2Sdq;
	Wed, 22 Jan 2025 12:43:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taa3G-0000000AAnh-3Ht7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:41:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436249df846so47032355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 04:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737549705; x=1738154505; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=;
        b=hGu14YxvV0JYt2+a0SfdKnCX9DJH7CeSIf7lUJyhB0Zj/bMZ8Iy77LFoEHmApJOT1q
         2A425KKdtSWSyQAYJ9xU2pCAH3m+FNNai73lB7GjsKLxhtj8hwx/pchUU02ZJ245B7fP
         mMngqLfiEoGi6J4eTIhndHFJ9M7DZxL+BooKClv9Be3YYY1myfTOxfSyzo+JeLPKl/gH
         iOJT5pVRcZJm5En/WwdtIigblYTqVq5YlnoKvTlaXqiDQOvCYwo7Yd2bVlvkmGDl7cqK
         Z+ppIec/hCi6hHK83kylw9sChWXQGKbKZX2wcDWTHlQp7M/SFM9mCxxqw2RnPaI25WB5
         Xm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737549705; x=1738154505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=;
        b=c1LnWuZnnSXg25086fdlV1B/34FpVrAUkPDInpnrl/YzxSykuagulXyoENmGJE0q2f
         nCuwbNUaWNSI33V3I279Sn02k6/cARFKkl9XraZLrB258wtMUpV621LtoiqtlIL89z6l
         IK4IEmbd8bRv88rW5kQ0nvWg2YO0kZeNAo1+ET8BpcQTiHduAxFkM0FHxIkAI9BCM+wg
         R1HrA2a0S8e9jmCvptUyuf8/fSemTWqWnjLxqG1vgwJuiFF+txodi/ooQq0wKFlHbHkp
         Irefh3NUwQcGdEuaAh0dZU6DrajXhIDdDEaGH81lVhfM3UE1HZuoYqorCYiiI8TTMZXe
         ViCw==
X-Forwarded-Encrypted: i=1; AJvYcCWsHlV8c/fL5kBbM214Hd+hietuVSN3/TheiIbwodunUDeGbhg4sVs6i6P1Vctfc6YnUvsyaY0hufRhTJekMi56@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc/l79AM65PHa2IQ1bVlbxYwwS+a2U5+BOrUsOJ4lM8DqFyMvv
	11MdB/ItEUqVcDS//ymBIFV7Tt1jp+ZqIFQgENb5MpHsVXwR+zDa74h8NE6QRwM=
X-Gm-Gg: ASbGncviqnTiW/7vosSkfmERWxGpMPOBeTyhfooB9Akz79Lh8m+50z7lu693z9IMY+B
	uSnRV0lQdBmsnxGFrlbhmNRwmcBY12QBx9owBMnfrakwypTWe3vRkO0+G1+mX6fREaEFJTbQuQj
	ZfEQp5/mYmsWCCOC8dTfGhAJUyKVVT2gZ2x1/+/FdA0XUu8Kn5S2h4/llymJ59pi5+TWQmU3pmZ
	VxxbgGKImagvZM21dOJ9SNJK6mBZXrscCe/CaS83pUOWuRpJHAiGgCLUXDY+8tHmhrJWn5OfQQ=
X-Google-Smtp-Source: AGHT+IEA2+PefGbBDd9kf5Ode3Is1wr6+YVdf3H9X/PUUkYizot9mKm50rI9cF5I9tp7GaNN+guivw==
X-Received: by 2002:a05:600c:1d28:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43891434081mr186013305e9.22.1737549705023;
        Wed, 22 Jan 2025 04:41:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3124a14sm23456405e9.0.2025.01.22.04.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:41:44 -0800 (PST)
Date: Wed, 22 Jan 2025 15:41:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
 <Z5Di-uU52aejU-U8@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Di-uU52aejU-U8@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_044146_819496_38BC54C3 
X-CRM114-Status: GOOD (  15.45  )
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

On Wed, Jan 22, 2025 at 12:22:18PM +0000, Cristian Marussi wrote:
> > > +struct scmi_msg_imx_cpu_attributes_out {
> > > +	__le32 attributes;
> > > +#define	CPU_MAX_NAME	16
> > > +	u8 name[CPU_MAX_NAME];
> > 
> > char is always unsigned in the kernel these days but strings should
> > still always be char.  Same thing in patch 1, there were a couple u8
> > names.
> > 
> 
> While it is certainly true that char is the way to go for strings and, as
> such, it is used elsewhere to hold the resource names across all SCMI
> protocols, in this context it is a field of structure representing
> exactly the layout of message reply coming from the server, and defined
> in the SCMI spec as a uint8 array, so, we have generally preferred to
> used u8 to represent such fixed size array all across the SCMI stack
> protocols implementation....
> 
> .... not saying that it is necessarily completelt right, but that is the
> reason we are guilty :D

Fine.  I don't have intense emotions about this.

It does slightly bother me when we assume that the SCMI server NUL
terminates these when we do things like:

	dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);

But from a practical perspective we have to trust the SCMI server.

regards,
dan carpenter


