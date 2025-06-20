Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F84C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMIFRsdkyNFzMJ+x7jyoP2b6n5xXmdf/8m2IFfM2q7c=; b=TzSEJ+Nw/58ggvHxDzIP0UlBdO
	GIL3EUIeYbwAuHe8vVEeE+yXoRUkZLj/MTuydspAt3m1F6VGP6h8fJgR9aWg4BFjkjknTVJPo0bmh
	Ms7cHPG//l9bS9toqEdNl/gW92A0fqy8tTp0IuLTty3p7duq+T4eh+NJ8w6yEkVkF1XPtSi3wx5sj
	0fyRgQTD7eXgZxfSYGkJzJjm5kMyJmLAkRKlNC27QsDAoCRy8bAzlegTFJ9tFZradwDTxpCtjPa43
	3mCLZqkB2u18vfWUSX9TZK4C4DqUeSnyIHDNd6Z3hrmi6e+YELEgTmiHV9309oFKKcSL3b2U8ltEa
	oOfrSEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjpd-0000000Gg1h-2pC9;
	Fri, 20 Jun 2025 22:03:33 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjGN-0000000GcCb-1RAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:27:08 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-40ad20db9e4so147895b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750454826; x=1751059626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMIFRsdkyNFzMJ+x7jyoP2b6n5xXmdf/8m2IFfM2q7c=;
        b=nWQACht+SaEFPFC3mBnUmDe9Mbl3q0FG+qSETqsriAzZapJM34JdQ3fgiZWlK2HpED
         XsQf0r1yFid/V/iUYvXrFQFGahwqQxvTd6qzTQpVd62wJiUJyZP+0DDIGiXcCy171BCs
         idzE/HCeIdARlxlKtbdEao/Oy37GPsFttMpCxnd66/2C/+YzqMaulEGaaN23WDwWpydO
         SJWbx3HQRoVrIOGr89vZzOZau4jF0ASojMeNQWfPMZK/uIbJZd5YVz60KEROpfcV/1oo
         YxXGeemuG4tnKp4UzgGcDgeUW6+6bQ156rD5dToI4B4PSf90R4O/y3JuUs+7Np6Bd4tS
         IDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750454826; x=1751059626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMIFRsdkyNFzMJ+x7jyoP2b6n5xXmdf/8m2IFfM2q7c=;
        b=qyjflpSkKrPqYnFj8ZThBLGV3pDX4zF0GCGK0T18LWU+Qu/VOvMV93hfoxql/mjqF1
         EYfU7fFe0ebm/OL0QNntu0+1XY2UoPfp1SmNKEY4vj6gL51S+28oJOXAaT3BoS+YXj6M
         QCSVtI7DGrvaSPjmheKhT4Xp1byiE/6di2LLQMCiSuk+Zv44rMFG6xi2bpAaom64KUM9
         oRt/b0gooucvFSShqqIc6RZRfzQiCTzXVXef667stQkR87KUw3ZUWYXMZXFKaCSAhDb+
         4ip9r5mJhITCAsUfbHw09ur3flolBhSR32u8CxofMNuVEEtyvuM5PcwCa7OS9S9RdEsT
         MQyA==
X-Forwarded-Encrypted: i=1; AJvYcCX52DYxk6dhuy8AG8jTNDNUZZKT6eYOJDGCsMhauZjbeeEHxqCSY+puVUfvNuvjSGPqFO16kgM01/fGEVrFR5NU@lists.infradead.org
X-Gm-Message-State: AOJu0YyPaeLRI+hOkfz6rjeATI+pBKodv4ypesMbnS4pB05pWg8aPLcG
	G4sEfBsFsFnZ/yUPvjrDHgOOcKYJphVC2miyeS075Um24bpY8KIApvRBRrpzJC6+sDY=
X-Gm-Gg: ASbGnctrB34Yx3Kw/I629m3MyUmQ0duFQGD3Cj/jUXo+wFXKZJO8NruRExscyU8se4J
	wxCvkmRvCFc5RsvT9GJV5DFAJcYZXer35LhxklREU/97TqKcxhB3wY9cPjdavT3UNMRKc4JYvWY
	h+U2SzqvBYbKUXH6l4Hd6tYmjZUQS1EpH2HAKn+Yg84eGZWLh+wEt/7d2axhdCCqQxrwsSnfEb4
	H6KuUv8IZpXPf6u7aCrYlBDAFnDckO2WdpQgbCHMEf6EJF+pPsIANcc2/xnKG4qm+nlrmPUJpG9
	5b+xY/skD2euHB1tFAce9MDwcKIpIx5K7GuTNDeGTMmBxADD8XENOLuFJ6g86/ABOsMGiQ==
X-Google-Smtp-Source: AGHT+IESnwOrs/dDV5b5ifwpLpIA2to3QsVlAToKotqflwsgrSLGEX6wnpXNqOonKrdb5B/s7K5ZVA==
X-Received: by 2002:a05:6808:3a05:b0:408:fe75:41b1 with SMTP id 5614622812f47-40ac6f00417mr3259549b6e.29.1750454826289;
        Fri, 20 Jun 2025 14:27:06 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aeee82sm478413a34.11.2025.06.20.14.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:27:05 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:27:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 4/7] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <f2c0a0d9-6a1b-42c7-a180-e04e357dbbb5@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-5-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-5-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_142707_398776_900C34F7 
X-CRM114-Status: GOOD (  14.67  )
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

On Fri, Jun 20, 2025 at 08:28:10PM +0100, Cristian Marussi wrote:
> +//TODO Review available interval show
> +#define BUF_SZ	1024
> +static inline ssize_t
> +__available_update_show(char *buf,
> +			const struct scmi_telemetry_update_interval *intervals)
> +{
> +	int len = 0, num_intervals = intervals->num;
> +	char available[BUF_SZ];
> +
> +	for (int i = 0; i < num_intervals; i++) {
> +		len += scnprintf(available + len, BUF_SZ - len, "%u ",
> +				 intervals->update_intervals[i]);
> +	}
> +
> +	available[len - 1] = '\0';

No need.  scnprintf() will already have put a NUL terminator there.
Unless num_intervals <= 0 in which case this will corrupt memory.

> +
> +	return sysfs_emit(buf, "%s\n", available);
> +}

[ snip ]

> +static int scmi_telemetry_groups_initialize(struct device *dev,
> +					    struct scmi_tlm_instance *ti)
> +{
> +	int ret;
> +
> +	if (ti->info->num_groups == 0)
> +		return 0;
> +
> +	ret = scmi_telemetry_dev_register(&ti->groups_dev, &ti->dev, "groups");
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < ti->info->num_groups; i++) {
> +		const struct scmi_telemetry_group *grp = &ti->info->des_groups[i];
> +		struct scmi_tlm_grp_dev *gdev;
> +		char name[16];
> +
> +		gdev = devm_kzalloc(dev, sizeof(*gdev), GFP_KERNEL);
> +		if (!gdev) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		gdev->tsp = ti->tsp;
> +		gdev->grp = grp;
> +		gdev->dev.groups = scmi_grp_groups;
> +
> +		snprintf(name, 8, "%d", grp->id);

s/8/sizeof(name)/?

> +		ret = scmi_telemetry_dev_register(&gdev->dev,
> +						  &ti->groups_dev, name);
> +		if (ret)
> +			goto err;
> +
> +		if (ti->info->per_group_config_support) {
> +			sysfs_add_file_to_group(&gdev->dev.kobj,
> +						&dev_attr_grp_current_update.attr,
> +						NULL);
> +			sysfs_add_file_to_group(&gdev->dev.kobj,
> +						&dev_attr_grp_intervals_discrete.attr,
> +						NULL);
> +			sysfs_add_file_to_group(&gdev->dev.kobj,
> +						&dev_attr_grp_available_intervals.attr,
> +						NULL);
> +		}
> +	}
> +
> +	dev_info(dev, "Found %d Telemetry GROUPS resources.\n",
> +		 ti->info->num_groups);
> +
> +	return 0;
> +
> +err:
> +	scmi_telemetry_dev_unregister(&ti->groups_dev);
> +
> +	return ret;
> +}
> +
> +static int scmi_telemetry_des_initialize(struct device *dev,
> +					 struct scmi_tlm_instance *ti)
> +{
> +	int ret;
> +
> +	ret = scmi_telemetry_dev_register(&ti->des_dev, &ti->dev, "des");
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < ti->info->num_de; i++) {
> +		const struct scmi_telemetry_de *de = ti->info->des[i];
> +		struct scmi_tlm_de_dev *tdev;
> +		char name[16];
> +
> +		tdev = devm_kzalloc(dev, sizeof(*tdev), GFP_KERNEL);
> +		if (!tdev) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		tdev->tsp = ti->tsp;
> +		tdev->de = de;
> +		tdev->dev.groups = scmi_des_groups;
> +
> +		/*XXX What about of ID/name digits-length used ? */
> +		snprintf(name, 8, "0x%04X", de->id);

s/8/sizeof(name)/?

regards,
dan carpenter

> +		ret = scmi_telemetry_dev_register(&tdev->dev,
> +						  &ti->des_dev, name);
> +		if (ret)
> +			goto err;
> +
> +		if (de->name)
> +			sysfs_add_file_to_group(&tdev->dev.kobj,
> +						&dev_attr_name.attr, NULL);
> +		if (de->tstamp_support) {
> +			sysfs_add_file_to_group(&tdev->dev.kobj,
> +						&dev_attr_tstamp_exp.attr,
> +						NULL);
> +			sysfs_add_file_to_group(&tdev->dev.kobj,
> +						&dev_attr_tstamp_enable.attr,
> +						NULL);
> +		}
> +	}
> +
> +	dev_info(dev, "Found %d Telemetry DE resources.\n",
> +		 ti->info->num_de);
> +
> +	return 0;
> +
> +err:
> +	scmi_telemetry_dev_unregister(&ti->des_dev);
> +
> +	return ret;
> +}


