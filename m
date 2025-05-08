Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5B0C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=; b=w637ER+RumJSHINjhLnCj3eFDd
	7hPbkN3XehBZJ7bw8GNsZMWakvjLU17eMM+yyTTRmjlP3oroeSExMUVRHmlgWIQwzNChFYTymDdze
	BkyCdz5bto4r0nLExawBfFKuGWHIMvHnheCTFwSLtfYt5uGAuLr6JdNMFLl4xZsIk0sEO5SRDzojI
	6XnmXUQcbKyclQz0UrAQ4QtCt7Uk+lVr2/ThZ8t8p+fl7vV/BRIQDpxhIdgthOiU0uFYMnV2aRaj9
	ujL1qVLNAxhZlHMO4AEUq7SOlxK793BnJZJ8X0QgnqAJKRs4eSKypUn+1JxCZsFRYNoZPZCHBcljz
	4zE/QjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD8nz-00000001qGa-3kla;
	Thu, 08 May 2025 21:29:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD8m2-00000001q8W-2IaB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 21:27:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so189133066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746739641; x=1747344441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=;
        b=NX37oSczI/cwTm1zBNzEOWn8JXYePxHoncC5uRy267+R+yDH4uSn3hvL1vWBlkNPoX
         t3toGQoLyYzbENm5ANgpo0uw1EEwyLlwy4rEN/ZTQCuGLjv5nCy4h4N4bJg49T/TikHs
         BRuLqGubXIIHnOnvRvQ30GyvEczC0Y3r7wxzS/aS3khjZde673bzq2Hde1+xd7C896vz
         9r6yeTxlLxApf7JN0VhW+3Z0FmLMWjx5Opxu9VYwAIQK+GAwnid4sWan29oTB24ik5wm
         7vm5R3i/agktq1yG9eGJQsQ9CeTn/uPQTya5g/qGjJ0AmP16SMBcfzUhaRF7uDZ6AVjq
         I2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746739641; x=1747344441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=;
        b=K8T+XoJWEGDXldvRh4BSq0V1MbxFPdnl7t5/EJYs+DTZsmEtB/InZqxjxR9Jt0nVJr
         wZKrk9s+MnaJUtSITEywPpt85aDJZlVSZB3ehNxRiCV/a5k90SwqQel60VJ/r5nO+F2I
         QBGe8hckVScH6zCmnbfGksjtx5X2edomb428fCe8Mcu/p81yANVc7CwNFqd+cclIEMHr
         YLxSBW8b46tnoqpX0DNzlDL9NY1BncjZ4Dicm1Rfopex9DGoeHyJwaHEMn773An9v9Zj
         9++HFffmZtR2ZA0PA1SkvgJKdNVW8SNmsvSMejfFzfkm6c/8Umm+ZNi7kMehJ1Z7v1Kd
         NdDA==
X-Forwarded-Encrypted: i=1; AJvYcCWtIPiNqLTPjeteo+zoE2wMamenC9qc8fJJO1wC6TLbGyBo7YqLCtL5cMYT3pqNeCOGI6Uz8hZ2oIOqSYPv+ELt@lists.infradead.org
X-Gm-Message-State: AOJu0YwOTZb0beGRLnjOA82cQwiiVHYLAdeHtFeH0nC+hGNWnRjWhzOu
	Cvw3dVOYrTXJLvUost0acovai9JUCfjiZE3llqTnze7/oo9rPkXscVrQoNw4nQc=
X-Gm-Gg: ASbGncty2Y8hElMhCodv4SOUOH49GI/1hMZZaULE7oSngObJliSoxzDRGyeegfHsj+Z
	FsL2Auc41EGvXd3D74HNAGOnovPxUaiIysAmTEpgSyt1Qxv+SfSFrZrBRc1FL8z2Y6sXIfCsttn
	xLbSIlpoBISpC4qqbvkc+NehB6KjT8B9UZTby+fUN0Mea+8/uuSak/onK0nfCfu3IszP4lYBBF2
	sZoy2oEQERFqAwW4OPV1oPNdew5iDLe6JLkZDffAVDA/vA91JED/FmzQzLp9MV2K06ojC0WxXqU
	GLkJVW+HiIfa0wpQXAxAyJWAkPJRy+7o34blyyNNrJIYToSs8Raay1oLJgKvtJFw7RsJErU=
X-Google-Smtp-Source: AGHT+IGwowNKNf6YdL0s+pZvYQ6xsCLedq0Pezu/34sukHINlGhsBSD9rVYZ5MZsMsdJMGy3cL3uig==
X-Received: by 2002:a17:907:1b05:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad218e48fe4mr115728366b.3.1746739640793;
        Thu, 08 May 2025 14:27:20 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192d4a1dsm46249766b.17.2025.05.08.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:27:20 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 23:28:48 +0200
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Phi l Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided
 by RP1
Message-ID: <aB0iEHqYmNxXQd8c@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
 <a61159b7b34c29323cdc428bb34acfa1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61159b7b34c29323cdc428bb34acfa1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_142722_585727_5AC74156 
X-CRM114-Status: GOOD (  19.73  )
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

Hi Stephen,

On 13:01 Wed 07 May     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2025-04-22 11:53:13)
> > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > new file mode 100644

...

> > +
> > +       /* There must be a gap for the AUX selector */
> > +       if (WARN_ON_ONCE(clock_data->num_std_parents > AUX_SEL &&
> > +                        desc->hw.init->parent_data[AUX_SEL].index != -1))
> 
> Why is there a gap? Can't the parents that the clk framework sees be
> 
> 	[0, num_std_parents) + [num_std_parents, num_aux_parents + num_std_parents)
> 
> without an empty parent in the middle?
> 

The pos 1 in the parent index array is used to select one of the AUX clocks. 
Besides this, the index maps directly to the value that should be written in hw,
avoiding remapping. It's possible to use a numbering scheme like the one you
proposed, but in this case we need to complicate the code adding the renumbering
where the index is written in hw.

...

> > +
> > +static const struct clk_parent_data clk_sys_parents[] = {
> > +       { .index = 0 },
> > +       { .index = -1 },
> 
> Why is there a gap here?
>

Same answer as above.

Many thanks,
Andrea 

