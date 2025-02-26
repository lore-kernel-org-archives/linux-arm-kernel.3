Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F97AC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7HLSyA6mw5885Yw/vt1qQCOh4p9cGkmIlOUNwXfUDY=; b=bU+ZJiNqHuzXEwB8oSx0Hw5ldO
	UimmkJ10PPfpyVueIDpP1wcABD07zGnUG3lUObYQUobc6+O4GltbX1XmJIR/W7HJT7N3rGDtqCg0d
	P2d4XGV9AwtXGPrj6bwzAa4mLUmrs+Jq3FCy0OQbFI+W7Z7oWm6SgmB1Og11SlQFO5kM5ym/hRG1A
	f1A+3r4qfdrCw7YHEepbrZU+WueP2hRxI4iGi3JqllxXAekELVuLfm4iniaRVGvsAmuMxOsyoy1qu
	STW9yigYlMVOPgjAUf6Gay1x3ucaFBU5Ecujc9zg+i5tmBO6KhuVI4xvUs2sVZRsbFtTjJUImHY/F
	ik0cGCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDmv-000000036we-0IhP;
	Wed, 26 Feb 2025 09:33:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDlN-000000036lq-3ydQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:31:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abb79af88afso138921866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740562292; x=1741167092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7HLSyA6mw5885Yw/vt1qQCOh4p9cGkmIlOUNwXfUDY=;
        b=Rp6WTXsNjSFUOVvDbiBTjM2ZpxEnc6VCCefKDfX3tymbh9xj7b9EahN1pJcQ7pQG2B
         JkfNIGYbKTZqPC2MLzZ7SHNT6AtXh6sVUP1mKFmH0shdKsfevJKz2p3VHq5ckeyIfp73
         K6bGnaZ2i0ui1+jGw8AMC2AlBUCrKV82rwPmIcjfAWF+nh3vO4P/XMhp/p1670KfX9gD
         y/t/re732hqLhp6Rpf1G7bv4t/FhZa+pdhQQIolC9cUb0fEH1MNbZup+m2iNYKXZ+32h
         Jg2HmsaX5N5ROjUVIW36AmcybOlNw4sVmikbN0i6vec+fLkNjm66g939WpDH6VP4dZO1
         M2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740562292; x=1741167092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7HLSyA6mw5885Yw/vt1qQCOh4p9cGkmIlOUNwXfUDY=;
        b=qi69z4uit4N/kNkgv4e0pFMbBDtcB8s7b6DnFb+ieXohFqUUgCnofCZgKfXEcicYD/
         hYL3hVCtzs9ghf9WcO7BxZUnIZqrqjKN34LJZdwQXzbXsqxjqntrYEJz6aMeWBiegbG9
         uK+IRDJnRmvJZWjt25Iusxs5dX6qrpSRU/2xax6F1EqsjhtAVbodKitMnZdRS8lqwa1P
         zqbPdtomz1LIpw5rzIV9oNSZcDwrFO3osmNxXhF9rFvMYbpOen6SBv5KIaSuDSn19Fqi
         mJ4o3VlKDiGQcBylRqh0zx/GCEBphS/nbfpV+2jAz48miDc0Kb6znjD6Wepc0xuw/uaC
         PyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSYIefb6QLkRXs+hQ9+FIZz1RnEeOslYrwlwZpkmgyBQjBfTpWjsvE8rFmjaoeBATkTZRHtzQ/jJ21PKQ0ncRO@lists.infradead.org
X-Gm-Message-State: AOJu0YyfgwBes5D3pvp7V1+eHybKmJFHW52UIEEgnF36NCWCoNrx1inP
	3st98e73Ultr2BTah7me/6p4kcA7i1iq0s8wJZMmFhYBHndjVCPMBJg5WuU12K0=
X-Gm-Gg: ASbGncvUerbks61A1MTJxbauK1AIw1dwMlxlIhudrBPeybsn9y1iwHq7Fv2eBuvJpb+
	mqUNVtdf7lgkoAX3Q2PgXzdt52pRn4UtSf9SXUSX6MF+qzquyH2mbgwo/bp5gRnuIa+dJogyGes
	WLHT2hKNOOSmHNRnpGJlUHF+mKbFe7mhkgljQmZ6BrPT3RkbPa9Qd3IUOCEWS5BeC6ynsJGYC5A
	Rrm/s/4CL8iJoYU/wu76uS3sJ3g8QnptrAdU/i6dz9Gjdf4Sy5Y50UPX0YUj5wD0UeeOjEaPTsr
	PusQ1wF5itBHkd8wE2qP4IAUefANgZA=
X-Google-Smtp-Source: AGHT+IHOlwVgMQ+XjHmskbWK3r145DW/sQyZFjaekImQ2FOuF7PWx//irvpWADdBWiQERIVywycnfQ==
X-Received: by 2002:a17:906:f58d:b0:abb:6259:477e with SMTP id a640c23a62f3a-abc09e37f41mr2064332066b.55.1740562292322;
        Wed, 26 Feb 2025 01:31:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed2010f74sm288418966b.121.2025.02.26.01.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 01:31:31 -0800 (PST)
Date: Wed, 26 Feb 2025 12:31:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, dmitry.baryshkov@linaro.org,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_013134_006963_4EFD00BA 
X-CRM114-Status: GOOD (  24.32  )
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

On Wed, Feb 26, 2025 at 09:55:21AM +0100, Johan Hovold wrote:
> On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> > On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> 
> > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > >  			     u32 domain, void __iomem **p_addr,
> > > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > > +			     bool skip_check)
> > 
> > This does not look like it will scale.
> 
> After taking a closer look, perhaps it needs to be done along these
> lines.
> 
> But calling the parameter 'force' or similar as Dan suggested should
> make it more readable.
> 
> > 
> > >  {
> > >  	int ret;
> > >  	u32 flags;
> > > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > >  
> > >  	/* Check if the MSG_ID supports fastchannel */
> > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> > 
> > Why can't you just make sure that the bit is set in attributes as I
> > suggested? That seems like it should allow for a minimal implementation
> > of this.
> 
> My idea here was that you could come up with some way of abstracting
> this so that you did not have to update every call site. Not sure how
> feasible that is.
> 

I'm having a hard time finding your email.

Why does the scmi_proto_helpers_ops struct even exist?  We could just
call all these functions directly.  Do we have plans to actually create
different implementations?

If we got rid of the scmi_proto_helpers_ops struct then we could just
rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
and create a default wrapper around it and a _forced() wrapper.

Some other potentially stupid ideas in the spirit of brainstorming are
that we could add a quirks parameter which takes a flag instead of a
bool.  Or we could add a quirks flag to the scmi_protocol_handle struct.

regards,
dan carpenter


