Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBDCC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7egaasjyS8ZJi5/A+1wWirXvHFkWLfG+x6Fwihwtfek=; b=tEmnFFg+uSPN5e11Mn2v8h3CAZ
	bS4K8SBeLJ8mI7INtHEa1ZUkk0ClmEn6uhmcUvwGTC+RGXVrOL4KxoqGR4HZ9gcR593j8uEOfk+6x
	PJ1pivNVQqTZG7z+86YqTTShpJtVPSPlTjGxcSZ4PxrFCq3G2Z8v5nRmyqMSeWHs3TD4tGG5j3A8+
	NFDOhLk2oC7LybWXdaCHvsep17q6XDCIKpSlt8RG+8pjbtXDvfxHCVS9qdFg77lmfd1DHVrywmasG
	c20yKIfw4yokpfLa2WE0MS8e7ieRKohT+PYCIqb5cnEEuInHVd+T10wO0wchV/2MlAZg7Bw/PHbxM
	UxYlmBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTli-0000000BUB1-07uT;
	Wed, 22 Jul 2026 10:01:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTlg-0000000BUAn-08qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:01:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EF2C45066
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323CE1F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784714495;
	bh=7egaasjyS8ZJi5/A+1wWirXvHFkWLfG+x6Fwihwtfek=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fmvu7cyex6PSZOKU92j1PBbDR9fWWe15jgJUpmG2UHufwrvwv+d/U+oGd4XWvgW/C
	 pbYo6eEbBoCaEAi0TC4VtOfc8Z1vzIHsHGbgJJtV+jUAi1ul3P65JlpNBWzwi4nLGs
	 WgreYoE0pE2QtPyJB/d12TMtcCgm+WqlGY+JvbcAkJC4KUNGFOHkUBKveMCVPkkTPH
	 lD5jLZcegvZT3ZPlM/SC6IYJWKBohzS57msKpnNRuT2/ou+V7jp0vUrqZPKzU0Hrh4
	 Hh5tFYIb7LG9teIbSvAsT/oLu4+C4YnkqrSGHoaMUJXZ/CoVfqbFyv8nj7uWxfN45I
	 5SOlhYBrSIQHg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so610637e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 03:01:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro7ktZplm0AuU1F+l7skzOSdZp0vVANEgLWsASMlKGRpGOmIViPFsD5XdZcHcfaSptRJYIpplZzeqC1VKdrqZ1W@lists.infradead.org
X-Gm-Message-State: AOJu0YzpiB/2w9/5EXOKK6lg6SZKLR5CpY0IBabjJyCIjUEJZQHcRrVZ
	sJL3E98nsGbzOf7x01lsQeWOG5xy0O0ptBM4WMfdadf1I7GnscLr78VaZ5wR6c74KukHc527215
	h60+CV+fXlb5/KwcNVs0uLVx3+0VcYItw6mB9bz3YvA==
X-Received: by 2002:a05:6512:4384:b0:5ae:cee7:52bf with SMTP id
 2adb3069b0e04-5b28f8615d2mr3888545e87.9.1784714493736; Wed, 22 Jul 2026
 03:01:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:01:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:01:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c7f5d4cf-07ee-4716-bb8d-83bcd0b2f8d0@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McxoC6711rmXmPb9t21bBsTeBMJ3ieZ1XhyTqMLaMS-4Q@mail.gmail.com> <c7f5d4cf-07ee-4716-bb8d-83bcd0b2f8d0@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:01:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdo=vEOUD0=U0dWu3ry7_ZqLaFz4Mwk_qv2viYQYNAq=g@mail.gmail.com>
X-Gm-Features: AUfX_mz_52H5aVX8o5s_GYgqmkBXwWl26GDtvaXPn6ge5d65lgGY7if6PzG_jAY
Message-ID: <CAMRc=Mdo=vEOUD0=U0dWu3ry7_ZqLaFz4Mwk_qv2viYQYNAq=g@mail.gmail.com>
Subject: Re: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 21 Jul 2026 14:48:46 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
>>
>>> +		struct device_node *named_np;
>>> +
>>> +		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
>>> +		if (!fwnode) {
>>> +			ret = -ENODEV;
>>> +			goto fail_alias;
>>> +		}
>>> +
>>> +		named_np = to_of_node(fwnode);
>>> +		if (named_np) {
>>> +			ret = mfd_claim_of_node_to_dev(pdev, named_np);
>>> +			fwnode_handle_put(fwnode);
>>> +			if (ret == -EAGAIN)
>>> +				ret = -EBUSY;
>>> +			if (ret)
>>> +				goto fail_alias;
>>> +		} else {
>>> +			ret = mfd_claim_named_fwnode(pdev, fwnode);
>>> +			if (ret) {
>>> +				fwnode_handle_put(fwnode);
>>> +				if (ret == -EAGAIN)
>>> +					ret = -EBUSY;
>>> +				goto fail_alias;
>>> +			}
>>> +			device_set_node(&pdev->dev, fwnode);
>>> +			fwnode_handle_put(fwnode);
>>> +		}
>>
>> What is the reason to have this split into OF and fwnode functions? I don't
>> really see why you would need to do it twice, isn't fwnode sufficient for the
>> OF node case too?
>
> We do a duplicate check here before adding the named_fwnode and split it
> for two reasons:
> 1. of_node list pre-exists. We add a new list of fwnode. of_node based
> duplicate check go wrong, if its checked with the fwnode list.
> 2. of_node need to go to its respective list as fwnode list, release
> path, is different for us.
>

I see. This could use a unification to fwnodes as well but that's out of scope
for this series.

Bart

