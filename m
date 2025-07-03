Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6859FC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdVEyliI7CI2o2rNcOBW/maFK6t06bm6iyL8o0UQrKM=; b=LFcgPrpfUe5vUQHfVMGwp3B5Pe
	XA9Q8F7XtS1/bGJ3HgXU/vFvDAF9jqfQ5tY8dhB04FKuJl5ZUo0xIf5Xyo44XbDG/s7ey10IjCrtE
	OH+kKPmqWJRUimdOLT433joBmgfpdy3F+mM7rClGbA84hEUOZVDCTyfhRvor+/z+KfhCqVMiHJxu5
	2jHOHISyMEnIM5SAb8pPnIncPQvFExFPsFblBmHsgmgnB66HvyOjFnvR+ah+jpPoA+hEflfwiMIJS
	nG/R8GmqNhHCIPY9EW30uVIugFBHkvyftXJT3PKYV/tOldVI0lf9SYgSD31akZBPU5yysiwnlOA4m
	nR11sQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSl9-0000000CmwN-42TT;
	Thu, 03 Jul 2025 22:50:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSDd-0000000Chl5-37Jt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:15:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7490702fc7cso321480b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751580948; x=1752185748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdVEyliI7CI2o2rNcOBW/maFK6t06bm6iyL8o0UQrKM=;
        b=SUvQIxsyHOfvKsg96XsMxgdpB4zpx5t/K5KFjIz9Pq1r3T5Mg+gJqazzgXdIghmqHy
         G2T8S2YX+S/RKbm9vPnKO1b/8SvE5OLxjOYtNeWoxS7K+5ffPjPqkaF2O609Kcwsda4K
         mv4aWCRH/agR6zAkh0RnpCyhbq4OWQsLgQd+cmxyuHBUH5nglhr8MgbCAHXuvP6cejVU
         mUPtZ/4ANQ5LqdNrmKh7E3lbhNMf01/aGzO0TgamQNImPyVS76inrTf5Gkivr4GoE14n
         BsxysIeF2yqYmqf9dR1TIAbT/ID2RQht58zGk7rWFT4OpuQ2Eo4gbMfkX1jiyhETxVr/
         5fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580948; x=1752185748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdVEyliI7CI2o2rNcOBW/maFK6t06bm6iyL8o0UQrKM=;
        b=WnP3xWaor7xTS481LihYToMOqExfjieSz9WlJNVSyOF1VnG01FifzVL1QDhhR9UtF+
         RCXiynhhT/5+vanlSzCOzAkH0bqnjAU7AUvmznvJPSmn4cvGokB2WPX3a8TxHSPNG2hQ
         nav3p+VcKL8Fpdj91BU/AuHHyCzyQZNUGKfPqRoB5cge0UEPca9FYIGdc7a0NnrRqXaQ
         TO9eHqDRR7FFRJs9G86DE34htuqabnR0lsgHqNiPDzjcqYLrUN7gddtYTDJUII5bgSI7
         d3dYwzbUSDh0QOHe2xbvT76tKrMfMlXFBgzS/zczXymvZsUZpsV/PDSEnOrWR6x1Vmvk
         zo/w==
X-Forwarded-Encrypted: i=1; AJvYcCUY9uWdInGazqPlWF5HQ/xjzTiPP5MnxOM9GeQffd+A7PYyz20wzTFR6vFC2k1nTV0ff8kbWtwUVf+Bwx2qMtwF@lists.infradead.org
X-Gm-Message-State: AOJu0YxwJuH8VGXJ9xuV3JMj/ue0XRRdwcdhXzwK6ktL9Ma7jLA1dky9
	DfrvREhEdn8TX5l3Nt+fpcym1J9gBDmYRJ3Y8UvZOzZHKWgwo85/2gKI
X-Gm-Gg: ASbGncubUfXWZDPmRd6KQKMUwfqxPgqP6/l7o+mwzX/Z3i1K4I7uqZQs36N+PZer7eA
	FGaklRsw5dqX0zDb6LN6UqklGWYOpf8Ecr4xXfub19PeKSclueu2yEih4f5Pmv90tgQGCGTaiqa
	A/5I+ThtzTdhVCcrs87Jm/V9eh2KaVQ9CnKaWty9OhfOtpSBFc55hDVTbg5Du/rgKz2gqvp9igo
	qakBvJZk/wIAPQj1FDmJt6lexCpUxsqEUSLKu3Nx8qQ/mCsi7Nm58mSrYpwvm9RP2jpDPk1wu0P
	1OfcA0Zxpb55DP1HqtEziIWp8w+OrFRvSPoKzjMHTR78E0NNjjjQ1Jb8FKFhjOdJflhuzMY8kJZ
	TUi6yN2rH7k4hM9p1uMyor2oLjgdmJEsHvqXeE4Bfk5/RkOM10Q==
X-Google-Smtp-Source: AGHT+IGUk7PwRYq/uESipZTr5l7TnZjN4IATKVV7k9iHCae7JNaUFn05U63lEW19hVmJQS8UvmDn3w==
X-Received: by 2002:a05:6a20:72a3:b0:220:33ae:dabb with SMTP id adf61e73a8af0-225c0de25fdmr530119637.29.1751580948326;
        Thu, 03 Jul 2025 15:15:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429b34dsm423082b3a.120.2025.07.03.15.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:15:47 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:15:44 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGcBEHMEyQJuzmjj@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
 <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_151549_783997_C2A4D44B 
X-CRM114-Status: GOOD (  21.49  )
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

On Thu, Jul 03, 2025 at 09:58:48AM +0200, Andrew Lunn wrote:
> > > How do RGMII delays work? Connections to switches have to be handled
> > > different to PHYs, to avoid double delays. But is there extra long
> > > clock lines? Or are you expecting the switch to add the delays?
> > > 
> > >       Andrew
> > 
> > Hi Andrew,
> > 
> > The delays are introduced in BMC MAC by setting SCU control registers in
> > u-boot. The delays on the switch side are disabled.
> 
> Sorry, but not acceptable. This is something i've been NACKing Aspeed
> DT patches for. You need the MAC driver to interpret the phy-mode and
> program the SCU control register as needed.
> 
> Since you have the MAC introducing the delays, you want phy-mode
> 'rgmii-id'.
> 
> If you want to submit some DT now, drop the ethernet node. This is
> what others have been doing while waiting for Aspeed to fix their MAC
> driver. Having said that, i've not seen any progress from Aspeed, so
> it either needs their customers to apply more pressure, or somebody in
> the community to just fix it and submit patches.
> 
>     Andrew

Hi Andrew,

Got it, and thanks for sharing the context.

I will reach out to ASPEED offline to see if they are actively working
on the MAC fix, or if I have enough knowledge to work out the patch.


Thanks,

Tao

