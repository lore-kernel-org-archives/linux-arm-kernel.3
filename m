Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292EBD0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAvBpyoA7p/WU9ezNY7dbESpw2rn52Cl0A6r6A2MshA=; b=dNwXZ4HWVhhUPRbIiLA409GOEk
	QoFgP9zEtx+T58qR2rkTfWtjWV8w46xZIhSyfRWqVP52Yx4YNLYEtYwP8oMChipzWc5GdhyN8X5Wb
	+wfhLa/USkRbEHD9rNuZwPtgn7B9j+sNTnTMYF2OjCBsOPa3Egv3+LN4ENFgEC5CaYdccbDHFJreA
	0iptneSjxD8BPOJsv3IsdTIzsivak2pymgjW3Smu0nY/vIxidwAqCHhYfU8XpCrHNLC9kEy6O2S/2
	IBu71oSCYxVi28u1HHkmpcY05+I5H7yEIe/HvJH908jeeSGipuRio28UB4zpERYOX8iSuKbf+j0tC
	YJBQ55yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4M5X-00000004D5b-2H0X;
	Fri, 25 Oct 2024 15:18:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LhJ-000000045zp-3ixw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:54:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so20606525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868032; x=1730472832; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAvBpyoA7p/WU9ezNY7dbESpw2rn52Cl0A6r6A2MshA=;
        b=y79NS5wDCnLWIhqtVl1EinkFeKLZyCnA/n4BUbE8KeTqknEYaR3RH25bN6D7d8pPUw
         DuvynCaxOD5l/jBEp5tZoGGLTpniUYALLKPkHQ9LlEJgNUGW5CxYvmWtOga64hTTn6Rs
         8xBWFpCiJAdH1/coed8P3xZ00LsaQ5g0kiANTzFG+V/KumlLv/6AIuhurRhhVQbUqCMD
         rRCi1CGxuk1cow3018Rl14sgC4uVsr/nVjXKldXoF/P494+xcFQuA6quYtK7NNB4nLrZ
         ctJGghlFXJrLbnfQ3xzZAa8elmr8G2KMS9uWbp57lwkscDMU7dEh3DUuILUmGmyVH1sf
         GW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868032; x=1730472832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAvBpyoA7p/WU9ezNY7dbESpw2rn52Cl0A6r6A2MshA=;
        b=OyOhN7tlSexTLq+ZTuqzxmqpg56PwOZFumbaygAovsS/SI9K0fgQnGjFEYQvNE7WZW
         KYThKGf77RHnJE71r5ylDYBrwMNGYJ7lHtUh33UBpi0e5ZxvhNlZ7xcyeSgOXDbDsOLc
         yE3OJIwECDkAdByqxRyb1ktYeLe5yv9d1b/GYg4FQsYjMHtq++yqM+UFKWAXiiu5ingg
         bWgniKdJA0Uc5maUJdav76gQXd3TvpKbXAARwryqtQD/ScqwLL96bkywBoUVVxt2qg7j
         agbk80S6vw5RK/aVyrjDHIv4XalL37AeUNwFaTHKLRzDJro+oxUrVISv5AIZwuWxiFN2
         UEWg==
X-Forwarded-Encrypted: i=1; AJvYcCVp3OkbFPI1j2ZmAT2uv3gjdp8Y5r1HqCAIgiOY5z6OPdrBMPeu2VO9yZ54bLjc2AlFlT00AaszsPe0tk6YppKo@lists.infradead.org
X-Gm-Message-State: AOJu0YyzStAFnt07tkcRIQh2AuiZ01UoPsLgS0BtgExq1WPTcTi8nk8G
	f5MVDeAW2WS6wVuuTnpX6mpzXo423s0tUgGIPjqfvQ4D/jJ3n0wIscKEEUfosns=
X-Google-Smtp-Source: AGHT+IHqqD58Q4h+Z1tHpG4mKzv+sCqcuzupgvdqH2pjc3In+xcJGw3ZFSuEWgJnBVI83yx2PFst/w==
X-Received: by 2002:a05:600c:4ecb:b0:42f:8287:c24d with SMTP id 5b1f17b1804b1-4318415cfccmr89969295e9.21.1729868031754;
        Fri, 25 Oct 2024 07:53:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70e0fsm1717115f8f.73.2024.10.25.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:53:51 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:53:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com
Subject: Re: [PATCH 5/5] firmware: arm_scmi: Relocate atomic_threshold to
 scmi_desc
Message-ID: <5366e0d1-dedc-40a9-a1c5-edfed8f4d9d4@stanley.mountain>
References: <20241018080602.3952869-1-cristian.marussi@arm.com>
 <20241018080602.3952869-6-cristian.marussi@arm.com>
 <842a9844-ac89-4972-9024-72ed0e08c2d3@stanley.mountain>
 <ZxuszZFKdJoHwiSe@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxuszZFKdJoHwiSe@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_075353_955050_9E944A52 
X-CRM114-Status: GOOD (  14.59  )
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

On Fri, Oct 25, 2024 at 03:35:57PM +0100, Cristian Marussi wrote:
> On Wed, Oct 23, 2024 at 04:20:53PM +0300, Dan Carpenter wrote:
> > On Fri, Oct 18, 2024 at 09:06:02AM +0100, Cristian Marussi wrote:
> 
> Hi Dan,
> 
> thanks for having a look.
> 
> > > @@ -2959,7 +2952,7 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
> > >  			   (char **)&dbg->name);
> > >  
> > >  	debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
> > > -			   &info->atomic_threshold);
> > > +			   (u32 *)&info->desc->atomic_threshold);
> > 
> > This cast is unnecessary.
> 
> I was indeed wondering why I added that....then I remember something
> about debugfs_create....without that (u32 *):
> 
> drivers/firmware/arm_scmi/driver.c: In function ‘scmi_debugfs_common_setup’:
> drivers/firmware/arm_scmi/driver.c:2988:28: warning: passing argument 4 of ‘debugfs_create_u32’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>                              &info->desc->atomic_threshold);
>                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> since the enclosing struct ->desc is const AND debugfs_create_u32 is NOT
> smart enough to expect a const when the property is R_ONLY...unless I am
> missing something.
> 

Ah, I missed the const.  Sorry about that.

regards,
dan carpenter


