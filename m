Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3590FC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=; b=w3E6jXcohdd5M5JGGRbUxYzt37
	KA6+h6IVvZOMjfq6fQHII8SGCASDlxUtikI6vl4fXrJCBYnwCwCsd+FLcHS2sNxsuKUP6hOET8NAQ
	4e08Fi2nqPo7JYOcC8eGRKX9R5DJnjkFWDttJ1/YzkxdxgxIuaMqcJgso/zDfGl2XoCvq4JVVtQ36
	PSQNBTPmH5Us63Cn0jlZ+mYrzlk5tOiYxfTjfgo9LhsN0rQhhwjMB+zqlAJ5mExtwWz+wvDt4D2Gi
	EM9fRi5QvDytlD7Dp84RwVCC6uQ9bKDz2N6tMSXYrEb6HeKtgdvO2idle9CZWnAn8sb7Ry7Xbz914
	53q0hSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSitm-0000000GaUT-2tig;
	Fri, 20 Jun 2025 21:03:46 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSirX-0000000GaM1-2g5U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:01:28 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-735a8be4ea9so614612a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750453287; x=1751058087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=;
        b=pn0VM1GUv1WpM2JuB47Kxd8vwRfVBYV6S03P7RmU8BdAyj1uUUFTwI9s7RgbsNgAY1
         zOD8KvKQdYKTyKHntPcCEterqqvj9JDfvoalQ4WvT71AOwVBrmMD5tEgv0yjSxEiOvmt
         ZUrGDCIiO99iqlhSh6Ac3pTcmPNowBG8GlWVbfl8fBb5WuDwpLDlBGFnAMLsAcbtgKaH
         NF4pekEDbT6U/Bk1zITdAFCKlS583k6Rmol79Qszn2hAxxi5YAAfrIwTigGlnB6M59hc
         rS9Ek9DpDGdMosZ5an5CsNMk/XMnBTeRT8I53Uqv3P/a6qFcud58SEBlJ+Gpxgr8na1k
         mRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750453287; x=1751058087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPfdrJsc6SyDgZhcqK06/DS6CQf5yfjgO3ypGfImvDI=;
        b=Kma7eb8uuzb2eYp3E9WzH7u82LWULWGygmvTpELzpQTEOQ6DMrPl2+gHAFDwwYH7bF
         W6a2bJw11SbJLTCfPfB39rj4uCm2RFFhb7W9aPHdu4AkYs7co7Wse0GsRsCc+Rw/Cfpl
         vWV5QkhjtCFqS5k+4j5CzlCEclhV9WVeqX0JvI/sU/gvET5eItoyBqIH+yzzPjWMES1F
         x4qAch15OPf4IE6FrW2svsQkwjBAYt7f87VtGmfGvXtTmrxXakCglhFx3ez4aG+UjJVn
         jtFXgl4+tNsRxKbWmVFbOQk0ljmKHE9RkkrjB5J5Kd6RdsVfzpIjtuUQa8T3UJduBetq
         rQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUFt/aRFXXPS0Wwwn6w53twg5RFF9ylhncNaXboynGe6ihPSIV3IIJI/CQpnYT7TQTDU2hq8pCAVu4zqBW2vgyA@lists.infradead.org
X-Gm-Message-State: AOJu0YxWGVF9U5K6/uDFCwYCiPMtMm+apIMJcGqKg14eijyv+V7uX49m
	xYEBcH1YotHDnRP9IAtVWPXJ0FLe47yuEXNylOOEYYmS+eegnXOFGUCWYbuX2s7rrhs=
X-Gm-Gg: ASbGnctAmCO+Kx1JXoSR5cYlhaBF7ozOSygHDngY0BJeS50MdlM6PS31c46hCYYcI1G
	jpcFyEGGeXM6KgcDi7JFxrrl2GGqoiwIjK8znBHffJUb4CLn+ReOY/lPkOcGpB80z23l2G0rnzL
	q/f3SH+j15FBsxxT949jE4Z+jpEKZev8pGDQQqQkAXephzYQkwDJErZFlLFNOGCTJBZfjU1gb1e
	DtOD4H7m1kdDBNlSXAh8umpyloXFkzux//1ir2+NdUdb2uklzlUMpAKFum3vCbEe58Mv/E5Gg2s
	pqtdQhnVsNPhI1JqhcjzyIExBkyYzL+tahAbzU70MNdjUwIWMM3H0WIODpOUqIKvFy40WA==
X-Google-Smtp-Source: AGHT+IHKvI+mlOijqo3udRWnDlycAVvVSoeM8zvft6XIXbrw2Mbg1ujBAm0ngTbxYas49+aqilccLQ==
X-Received: by 2002:a05:6871:7393:b0:2d9:3868:b324 with SMTP id 586e51a60fabf-2eeee4e0080mr2955071fac.23.1750453286668;
        Fri, 20 Jun 2025 14:01:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead967b86sm543589fac.50.2025.06.20.14.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:01:25 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:01:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-4-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_140127_699170_0D0370D9 
X-CRM114-Status: GOOD (  12.67  )
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

On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> +	/* Build compsing DES string */
> +	for (int i = 0; i < ti->info.num_groups; i++) {
> +		struct scmi_telemetry_group *grp = &ti->info.des_groups[i];
> +		char *buf = grp->des_str;
> +		size_t bufsize = grp->des_str_sz;
> +
> +		for (int j = 0; j < grp->num_de; j++) {
> +			char term = j != (grp->num_de - 1) ? ' ' : '\0';
> +			int len;
> +
> +			len = snprintf(buf, bufsize, "0x%04X%c",
> +				       ti->info.des[grp->des[j]]->id, term);

Please use scnprintf() btw.  Otherwise if there is an overflow the
next iteration will complain that bufsize is negative.

> +
> +			buf += len;
> +			bufsize -= len;
> +		}
> +	}
> +
> +	return 0;
> +}

regards,
dan carpenter


