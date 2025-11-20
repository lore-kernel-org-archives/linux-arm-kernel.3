Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EB4CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5zCUgwcpkF8m5tNoKt/Ujm9UTWHftPsvcaYAaXWT8Y=; b=waf48cjrLoBzg9DxOvAfSm/5WQ
	emwmgLfv+kWrIj4ZjLifHUTu/xPSSYB8zQ9DhB8IfcRey+W2XV61ZvsgMw7XB0EEuXMPDR8D17Kfl
	K2SIM4ptAuH5uSZI0C3+UYVRCBiOiB10cTfSjPXtrr7+dwK//ImMOAX/vyP/avykzmz2Z9MFV7xIf
	x2/+HWukJcjZmeGe53b5xpyhY7+Nmflg21aZvUBfbx1psY6zFZpQdDgjYQiROa2XW681dmVYycbW3
	JnLAEjVKcHBydIcZ4ReYpDPYY2iN4J0IKUc+cZURtg0E2jvd9veW1vdAOr9r5YCqWtBAMNz4BSKqF
	WCkjIYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2jf-00000006YwP-20hj;
	Thu, 20 Nov 2025 11:21:59 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2jd-00000006Yvv-2hFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 11:21:58 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b220ddc189so90099585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 03:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763637716; x=1764242516; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L5zCUgwcpkF8m5tNoKt/Ujm9UTWHftPsvcaYAaXWT8Y=;
        b=En/EHobIUFBUIGDSpZDLksNBE5p9fzyDVsnSkuPj8O7nFp8hHQcktpb9/RLPgGEA1z
         BcLcw7CNd+WgBItBiPWYgXBK00qz580VXB+kkaP+GuH0B+mG+QyLi4raJONh1PtG30NE
         P8x7DW9uHBZkmOLLMiCEyx85pq6tkUQDAPGyE5KPZiYgZHJTTtXb8of1tXO4qFXQ/xc0
         6RHdhtDzY8uJBmQVgHO+dgwIDypmIJ3nbhPgDatt2M0uYWa/jgyRWm/zcoZurlRD3dN2
         CmdbCHaQYnHYlMeMxOAxfnQNhsP28tVCeyDGA7L6e3v6tPJfaFbTVnuR+QGoAuFI8fPV
         1tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637716; x=1764242516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5zCUgwcpkF8m5tNoKt/Ujm9UTWHftPsvcaYAaXWT8Y=;
        b=lQwX3n2GqwIfS67adtC/15f5R3zk7eCBLqttBKUTRyk5qCSYKRCwqUouUBwx3SrBwo
         rpI9+2BbiXBbZhk/PbKp0vFPgrJg5P7YXcvi/b3NOvvhHddNopzfMwX82YO3ays3CtmP
         rSWsw3AfWjnfEJrKLiWvftWGpQ9JnUSU73ILE+5IlG42p6MxeGRJNZBlwZ0Uz4ikQ3iG
         z14weRaffOMA1LlJ04vNxOMxKNbLEz1KrP6zLqGbYz4ibXdgp6HfxbB1oLcMPlDy5rUT
         ZRIZHofwKTUgJ2uI/bOezEX8THTsgufq39YruIjPPgDmUJon9zyXwO+P+9xadphTTSUq
         4g2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5HIr9NYGMWYsgwae2XIiy7BVrCYTFAg/J2DCqoLWKaJ08SkrRpQabS/+tTjw1r++WfF04iJ0NvVePIvf1ZlPq@lists.infradead.org
X-Gm-Message-State: AOJu0YywUuJZAMC9EoSPhIiHt3k6Tc7hloYrxHhBpGuTOpQs8910vIGS
	M2LbAykWrHkoMjEDDT0Lrg4SanQW7yY5hi9JTs2Xbk9Z14BpXydOkbkz9dwc+F5zJDv8/9gEOmO
	kNgpm3r+Dy1EjZOxNHTOK9aAzuyU7A9RWWzr65g8QlQ==
X-Gm-Gg: ASbGncuEj9PWLQuif4e9MnhAPOYAJSroJC+6aXw24ViDBWNMjr7+nFxe/+xO7ePJp6M
	x7qHPN/UQZOIRglgIBoprLzDxH8dH5bWEUKiUqFVRDoACacr+9GjU4qsrfEwkE69PM/0dAEN6Ku
	12vW9K3JF20/O6O8PeJSWzslIAD9j5J1bayzFNYbS97dDYX0na+eSh3WHQK0gN2SulM6Oif7M9P
	+oB9SIrYpI7W61BWcgdfHRzpJcYkmQVAD4cqaEiM2/GsdWzmoyhnAJkznbDXrUsTIGeDMZzVY3i
	/qHzf6g2zHBAtolZFD22BHGhyKG8
X-Google-Smtp-Source: AGHT+IGftcFl62uPxiax/r1jkICBY3vztlPBz2EC42A67rYaYPPn8/nxfx4/Awa4o6J8ZUqzkrMvM++FycjBXss7I9M=
X-Received: by 2002:a05:620a:4609:b0:8b2:edc8:13d0 with SMTP id
 af79cd13be357-8b32731450emr356855285a.17.1763637716515; Thu, 20 Nov 2025
 03:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-4-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-4-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 11:21:45 +0000
X-Gm-Features: AWmQ_bkw8zvxNh6zB9690NSu381x529LRFBqHXFmLzzPZrP2-ZI1f3iaJvkZBHs
Message-ID: <CAJ9a7Vgj2P=PM2iFwSfL=GiDWtReCFn+QHUHXpkAg9y2vkocqw@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] coresight: Hide unused ETMv3 format attributes
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_032157_689771_4F527DF7 
X-CRM114-Status: GOOD (  21.41  )
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

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> ETMv3 only has a few attributes, and setting unused ones results in an
> error, so hide them to begin with.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 17afa0f4cdee..faebd7822a77 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -106,8 +106,30 @@ static struct attribute *etm_config_formats_attr[] = {
>         NULL,
>  };
>
> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
> +                                         struct attribute *attr, int unused)
> +{
> +       /* ETM4 has all attributes */
> +       if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> +               return attr->mode;
> +
> +       /*
> +        * ETM3 only uses these attributes for programming itself (see
> +        * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
> +        * sink, but not used for configuring the ETM.
> +        */
> +       if (attr == &format_attr_cycacc.attr ||
> +           attr == &format_attr_timestamp.attr ||
> +           attr == &format_attr_retstack.attr ||
> +           attr == &format_attr_sinkid.attr)
> +               return attr->mode;
> +
> +       return 0;
> +}
> +
>  static const struct attribute_group etm_pmu_format_group = {
>         .name   = "format",
> +       .is_visible = etm_format_attr_is_visible,
>         .attrs  = etm_config_formats_attr,
>  };
>
>
> --
> 2.34.1
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

