Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D959C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 22:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gq+kwZN/MyVZc1uW7z6nPFptfAEWXYUqK/icC7+T8p0=; b=JYWrHqOZmDtOLzT7kOEO/YaqJi
	ljeCeU5wZEnwu9Vmy3gZwgdj2p4PgqmH+gS6unDoUbAF5SgYUCIVocnjQ4mmB9H2ELfjLBbzMf1Tx
	Csfih2A+NI2ApOf9wvRhhNzY0Un0uHCCL0Qk5c63Tm7XOQE1OKzDtVrvB0QZ3mwKj9CwQxhUVd72K
	dDLhfG7BPpicwM5BtAsvkrzZAt2nS+zcpi+U6DgM9hdA7EUSzxw8vxbjug+8CoYN4iPKomGOBEt5O
	ch/IwPo3dXwe0uluCJS7lucsPemlj6huoD1KDyG21jXh4MzVQ0tmVRbT6MvGPlHBe6GoPGZDKD9hT
	cxuyoyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9szk-0000000AvPz-09ja;
	Tue, 29 Apr 2025 22:00:04 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sxF-0000000Av70-1vz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:57:30 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6f4cd4c07c3so44798656d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745963848; x=1746568648; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gq+kwZN/MyVZc1uW7z6nPFptfAEWXYUqK/icC7+T8p0=;
        b=eUR+2RPmIdM+NxFMD7YNI3RZAml5I5Jz05YjdGZ+OdzWOqDYnnA5HxVHcZHkVAsUHT
         moeUXcP49UKriM3PT/W51sArAx5U35g3AQIF56dh/NMH1WImOF2o3Zn0ai+1PUkODQu2
         4Ie7lQkme0QkPUTAXv5UFEseX3FUnMHZH8h2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963848; x=1746568648;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq+kwZN/MyVZc1uW7z6nPFptfAEWXYUqK/icC7+T8p0=;
        b=JBce9ZfBvNc1LzjxGSnF6bPEQ2SXw8rSy9f2aFvOe6uFEPnKQkpFanjWCvz3zWuOup
         KPv52my4Lqhqn0h/gQcHIruC6P6mVtZ1W+uJ1QdsF5PNqDxb4ZSPDWb8ys2kKsyaTZ7z
         UbgXSd8DZWsqqqtGhCln3joipdQPyECJd4wXRIo7ThhzdEHDtf9ZcOkxpIZjMfK+z8+j
         jzLEqjn53CMvv4ocUi4mdlVdtsW4uVlYEJG2QnEgsERRSWJpWuWo6FOVx1fLCYo1ig92
         4WabtGj8TGHwbIJ1zfcCp3DDZBRaPu+1rzvxg3s4Ra5QC4jpM8mSB0YYHgnmIt6UhAzT
         kalw==
X-Forwarded-Encrypted: i=1; AJvYcCWSg76M46bRF4uosR0ayS6fgXHT9/cTExVImuXOtHaPR7gCcVlRQnk41pQm7KuT+d9ACmqCXymOPpZeypba6/J9@lists.infradead.org
X-Gm-Message-State: AOJu0YwnmZ6044cTwO/UFVvarjk2UKr0oWtjvG+alxRXmX7KF9sObmTH
	qIOO3iFlzkPYpFa/MtfS23IJPRST1adz8hSBfILINcJvNZbN7/Wo6qARzbRw5gB/luAHg8VpK+L
	Py6H9oyQOR+Ly4FUFVhLwEfdoWCel18DpwEWE
X-Gm-Gg: ASbGncvGGXRZZrol9VfwGXre7zG1tHw7sk5+Uy35tSGfVNWcbMUaxL1ZA4VtmiOHwov
	AeZRG2i5sJcylDBNG54RICFnuoGlharWORbzxx30uaz7VkEbhSpPuGHUQnlr2MAByMUPpLDIdci
	9j2SsGW1u76VOyOEQz1AMk3GyeR1Ygg+ODLMz8fBZFcPbU8iYo2Q==
X-Google-Smtp-Source: AGHT+IGFRFcmj203HgxtSiaafsTGGAnI40IQFnCG9K6ptPppPzLUX6brI2DPTkwS2p0VSLmxrTrYIiPhDp6xRk6AwAw=
X-Received: by 2002:a05:6214:e8e:b0:6f2:d25e:8d17 with SMTP id
 6a1803df08f44-6f4fced985cmr17148876d6.21.1745963848451; Tue, 29 Apr 2025
 14:57:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Apr 2025 14:57:27 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Apr 2025 14:57:27 -0700
MIME-Version: 1.0
In-Reply-To: <npnpujjfonvzhf5c4upgajhx6hu5uqmerewmbqprvl7a3xrqgm@datubwgyucby>
References: <20250416000208.3568635-1-swboyd@chromium.org> <20250416000208.3568635-7-swboyd@chromium.org>
 <npnpujjfonvzhf5c4upgajhx6hu5uqmerewmbqprvl7a3xrqgm@datubwgyucby>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Tue, 29 Apr 2025 14:57:27 -0700
X-Gm-Features: ATxdqUHSfTHDCNbiMAyib_Rr1yPvdu5LV1ChItCTDCW7J5DkmOrjGVP9y9dJHm0
Message-ID: <CAE-0n51eQns8ifUzc36FNSSQJ7WFd_8hZ3JnNcFvgrTrvqRhow@mail.gmail.com>
Subject: Re: [PATCH 6/7] platform/chrome: cros_ec_typec: Add support for DP
 altmode via drm_bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	Pin-yen Lin <treapking@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Jameson Thies <jthies@google.com>, Andrei Kuchynski <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_145729_526326_4D1E96B9 
X-CRM114-Status: GOOD (  22.93  )
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

Quoting Dmitry Baryshkov (2025-04-24 03:51:17)
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 2cbe29f08064..27324cf0c0c6 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -337,6 +340,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
> >       u32 port_num = 0;
> >
> >       nports = device_get_child_node_count(dev);
> > +     /* Don't count any 'ports' child node */
> > +     if (of_graph_is_present(dev->of_node))
> > +             nports--;
>
> Should this be a separate commit?
>
> >       if (nports == 0) {
> >               dev_err(dev, "No port entries found.\n");
> >               return -ENODEV;
> > @@ -350,6 +356,10 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
> >       /* DT uses "reg" to specify port number. */
> >       port_prop = dev->of_node ? "reg" : "port-number";
> >       device_for_each_child_node(dev, fwnode) {
> > +             /* An OF graph isn't a connector */
> > +             if (fwnode_name_eq(fwnode, "ports"))
> > +                     continue;
> > +
>
> ... together with this chunk.

I check for the of_graph being present below. It's all sorta related.

>
> >               if (fwnode_property_read_u32(fwnode, port_prop, &port_num)) {
> >                       ret = -EINVAL;
> >                       dev_err(dev, "No port-number for port, aborting.\n");
> > @@ -417,6 +427,42 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
> >       return ret;
> >  }
> >
> > +static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
> > +                                    enum drm_bridge_attach_flags flags)
> > +{
> > +     return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> > +}
> > +
> > +static const struct drm_bridge_funcs cros_typec_dp_bridge_funcs = {
> > +     .attach = cros_typec_dp_bridge_attach,
> > +};
> > +
> > +static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
> > +{
> > +     struct device *dev = typec->dev;
> > +     struct cros_typec_dp_bridge *dp_bridge;
> > +     struct drm_bridge *bridge;
> > +     struct device_node *np = dev->of_node;
> > +
> > +     /* Not capable of DP altmode switching. Ignore. */
> > +     if (!of_graph_is_present(np))
> > +             return 0;
> > +
> > +     dp_bridge = devm_kzalloc(dev, sizeof(*dp_bridge), GFP_KERNEL);
> > +     if (!dp_bridge)
> > +             return -ENOMEM;
> > +     typec->dp_bridge = dp_bridge;
> > +
> > +     bridge = &dp_bridge->bridge;
> > +     bridge->funcs = &cros_typec_dp_bridge_funcs;
> > +     bridge->of_node = np;
> > +     bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> > +     if (!device_property_read_bool(dev, "no-hpd"))
> > +             bridge->ops |= DRM_BRIDGE_OP_HPD;
> > +
> > +     return devm_drm_bridge_add(dev, bridge);
>
> Could you please use aux-hpd-bridge instead?

I can extend that to call some function when hpd changes. If I make a
device node for the mux and the TCPCs then it may be possible to push
everything into aux-hpd-bridge and use it for all three of them.

>
> BTW: what is the usecase for the no-hpd handling here?
>

Looks like you figured it out. I want to capture the HPD state so I can
then go read the EC mux to figure out which way the mux is pointing. On
trogdor the EC doesn't tell us which typec port has HPD asserted so we
snoop the HPD state from the drm_bridge, read the mux when HPD changes,
and pick the right typec port while also injecting HPD into the state of
the port. The no-hpd property is used on Trogdor to indicate that the
bridge in the EC doesn't signal HPD properly, ensuring the previous
bridge handles the HPD detection.

