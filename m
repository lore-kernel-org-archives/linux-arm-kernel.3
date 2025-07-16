Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CEAC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am+nIE1F4DSrpycFS2I1Wo9UrAjSnMRHqnP7j+RzKjs=; b=yc+L3VynmEqRlVMtlensozMPdj
	4RP9rKWOj4fbs/YOPLFGo2zOwkrOZ05UX/PDUpSCE39qoCxED2uhJ3RI+/SyY7xvNaByKSsUzhivy
	VydJ7Bb8lmAvyc5wO4EGQXnaXo91iOgFAD+eWFxytyWbKVP7/uOmRRwyD3CYkf6z/f8B+30qD58LF
	RpKJZJPJs8nhVwGW3nM8XpQVtFqT7SdOG8+a49Sr7/5OcjZCtwkBPHNxA0mS8swab93aOrs726oe/
	uxR+ANnV+PE5opi/7IV2xmoXu2rwwidB1b0MU5Rn4b2MoyjscG3z0orzMB1Nyw+XIteR/HEYeN+GS
	qoY3LRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc01e-00000007W9B-1n8D;
	Wed, 16 Jul 2025 11:10:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzds-00000007SrM-0Uto
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:45:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7494999de5cso4056557b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752662739; x=1753267539; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=am+nIE1F4DSrpycFS2I1Wo9UrAjSnMRHqnP7j+RzKjs=;
        b=a5lJ4u3fj/pZZuX8sLvLqVlJnOUkEYL55XP2B8DSNhd2bV6e9MKSYhAxXIwX615IvA
         lEZbFQUFcC8vXYS5cXdqTvN8MHYHZ9MYDJxP+GLJll1X0Uu2afCHLSS6O51lp4yyDMSg
         udffpXsOhJauk9ueqYtJ0CXHako2Fi9A2X6u9J2aEDZ9cxC5VlwJTr2q0mToN3gAfDjf
         UKsNjuH04tilCFJTsI9CYnMUPveVzppq/7Ncy1Uk3wxYCgUaBTcFwpQU4RvfUn+B3aQ6
         EMWhIwxXXFQ4qJFzhzKSqHltjByRQm3BO+TT3gIbkHwfkpxTk4A/pNIPCXb5yh6yf2V6
         xf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662739; x=1753267539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=am+nIE1F4DSrpycFS2I1Wo9UrAjSnMRHqnP7j+RzKjs=;
        b=uurkW8nc8T3idHCwhQw95rv3/pk2CuitxuKg9mcGLMMokJQ4fREpXuvl3ajze30oXb
         2hRKwAlMpnQbLlfz1QKCpkZXJPg/NuWKeTrDRjmXxLovOXqdPecLNeKooMo8tlyrpn9e
         6oFgK8moJp0fSpLn5HMHa0pwR1uURtjc7m0qi0Gv3JakwQD4lknRrn8fZmFkiRmt76Rc
         HPJZGxAHemHDo3wcdLoxBUeNBu+VL/j1iSp8zUlku9FhocTAzVZwnzPYkfeFhR7xutH6
         QeJVK6jWDEeTraXYWzwRvnAzhdCVbDkCYXNEpgRah7k0hK54t3iQk7zdzT3yvq1tRUiV
         NqXw==
X-Forwarded-Encrypted: i=1; AJvYcCXeh1P0ickTWCqYews748dGmBCD3zxIMAm+aUVLM6Lf8OhO0oyiA0l5yxzXyoX9UKaJjNYcvOF9X4ikJeuAjwaV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6z5P0cUCU6V9DeckERAntFTWgg9AFfl3YRL22VqTmF1B5U+fQ
	AamNSZ36S41TYesHvf0a5hMyVczhVSpF6y9sHuv0SJyouEmXfdcIBt7IiwQnUuu7W03+0kgMJs3
	QKy6w5XHNbuI0+llvMChdUMRjho9SzK9EvF8NfFxcOg==
X-Gm-Gg: ASbGnctZ1TT0TzqpB/cA7SlOqtIbIIx8yXcpeZ6U6LRb3vkNi4nuzX9BLATfz0ZLbAq
	v3rifN5OtMsUv3Vrq3lYv+yCxQkcSjy6mZlWkVl4KMrpvjZzZM5IuK46QHSh0qQE3vEE7jhAmFH
	8D/vPJRhHLdJrj82Svw7iCo+MP3hVIH6wNWqfo5gClDQiDdbu4abx5FMQfg3A5ixZp0/3sO2B+c
	p/xyoMlOS/V9ljEUGjU+WxPlYR5emvC9p/uqSQ=
X-Google-Smtp-Source: AGHT+IEGtieAB4UoSqjXN+Sg8qQxmS8F/1OUpyt87e81VvxutU4sB4qMtakTi8T2flz3Qyim3gB60CfRRRoknOXfGGQ=
X-Received: by 2002:a05:6a00:4644:b0:746:298e:4ed0 with SMTP id
 d2e1a72fcca58-756ea1de0c1mr3849454b3a.13.1752662739230; Wed, 16 Jul 2025
 03:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-3-quic_jinlmao@quicinc.com> <20250703141905.GE1039028@e132581.arm.com>
 <0e7ae7d1-4877-4e8a-a0fb-0fda5cc03cf2@quicinc.com>
In-Reply-To: <0e7ae7d1-4877-4e8a-a0fb-0fda5cc03cf2@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 16 Jul 2025 11:45:27 +0100
X-Gm-Features: Ac12FXxbhbcdL16ZxrAYI1cGIXwRPQphg69YtVhrS7_0hd4B1XJVA6e6Ekha30Y
Message-ID: <CAJ9a7ViQ2A9FQV=fxzhu1DkZEBdiAvAijb6OjOeJriNio1nX6w@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] coresight: Add label sysfs node support
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_034540_164308_B957E21A 
X-CRM114-Status: GOOD (  34.24  )
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

On Wed, 16 Jul 2025 at 03:43, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 2025/7/3 22:19, Leo Yan wrote:
> > On Thu, Jul 03, 2025 at 09:04:53PM +0800, Mao Jinlong wrote:
> >
> > [...]
> >
> >> +static ssize_t label_show(struct device *dev,
> >> +            struct device_attribute *attr, char *buf)
> >> +{
> >> +
> >> +    const char *str;
> >> +    int ret = 0;
> >
> > No need to init ret to 0.
> >
> >> +    ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> >> +    if (ret == 0)
> >> +            return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> >> +    else
> >> +            return ret;
> >> +}
> >> +static DEVICE_ATTR_RO(label);
> >> +
> >>   static struct attribute *coresight_sink_attrs[] = {
> >>      &dev_attr_enable_sink.attr,
> >> +    &dev_attr_label.attr,
> >>      NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(coresight_sink);
> >>
> >>   static struct attribute *coresight_source_attrs[] = {
> >>      &dev_attr_enable_source.attr,
> >> +    &dev_attr_label.attr,
> >>      NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(coresight_source);
> >>
> >> +static struct attribute *coresight_link_attrs[] = {
> >> +    &dev_attr_label.attr,
> >> +    NULL,
> >> +};
> >> +ATTRIBUTE_GROUPS(coresight_link);
> >> +
> >> +static struct attribute *coresight_helper_attrs[] = {
> >> +    &dev_attr_label.attr,
> >> +    NULL,
> >> +};
> >> +ATTRIBUTE_GROUPS(coresight_helper);
> >> +
> >
> > This change adds a 'label' entry for source, link, helper, and sink
> > components, but the documentation has only updated for three components:
> > CTI, funnel, and TPDM.
> >
> > Should we also update the documentation for all relevant components,
> > such as ETM, ETR, etc.?
> >
> > Additionally, patch 01 is missing the update to the ETM yaml file for
> > the new property. I checked patch v4 [1], which includes a change to
> > etm.yaml, but this change was dropped since v5. I briefly read the
> > v4 discussion thread and didn't see any mention of removing the ETM
> > related change. Did you see any particular issue when add label for
> > ETM devices?
> >
> > Overall, this series is fine for me. Just please ensure that all
> > relevant components are covered for completeness.
> >
> > Thanks,
> > Leo
> >
>
> I will update all coresight docs.
>
> Thanks
> Jinlong Mao
>
> > [1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/
> >
> >>   const struct device_type coresight_dev_type[] = {
> >>      [CORESIGHT_DEV_TYPE_SINK] = {
> >>              .name = "sink",
> >> @@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
> >>      },
> >>      [CORESIGHT_DEV_TYPE_LINK] = {
> >>              .name = "link",
> >> +            .groups = coresight_link_groups,
> >>      },
> >>      [CORESIGHT_DEV_TYPE_LINKSINK] = {
> >>              .name = "linksink",
> >> @@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
> >>      },
> >>      [CORESIGHT_DEV_TYPE_HELPER] = {
> >>              .name = "helper",
> >> +            .groups = coresight_helper_groups,
> >>      }
> >>   };
> >>   /* Ensure the enum matches the names and groups */
> >> --
> >> 2.17.1
> >>
> >> _______________________________________________
> >> CoreSight mailing list -- coresight@lists.linaro.org
> >> To unsubscribe send an email to coresight-leave@lists.linaro.org
>

Revisiting this - the label DT attribute is purely optional, and
provides context for the hardware instance.
This code as written appears to add a "label" file to all devices,
irrespective of if the label is set in the DT.or not, with blank
labels where  the attribute is not present.
The visibility of the sysfs attribute should be controlled so that it
only appears if label is present in the DT.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

