Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8ACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 05:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUrhr336s+60zt23QDWZqcGTF0DZKHiNks6mhysqyVM=; b=zPNdUSKFW/yvevXkB2Zji4KXVx
	wm/9brbncCrt4T4CNBs/+ZA3mFlO6d4YYqxkDBZyHsfP+hAy3JXb7pkKaGPtCBUakA4SqhVUFzd+T
	i/tLDrrxBN2s0COJuI2OqTFkclR5ZXr7isLZdqITZXJP9Xv/hfJwBdrrHeGyWHqnT5Jq4IhYj1gsG
	5Df8W0M3XPxiW7GZkBIE+6S/Gh7hUimJ0HnJmqTBNHovcu4WTgbbqw+TWWT3TPfhCe36jBnjB5OH/
	pqwZDdMuLiM50sQImaURe2Ln5TfcGTxSBPt9X6PAYwaTAvQGIVZByzcUag0nwgNl/SSqlRKCkDUeP
	fwhxGaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaKn-0000000C7VT-0qty;
	Fri, 03 Jan 2025 05:34:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTaJd-0000000C7TC-0NSH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 05:33:47 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so12591331e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 21:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735882422; x=1736487222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUrhr336s+60zt23QDWZqcGTF0DZKHiNks6mhysqyVM=;
        b=QIa+/P921eWGi1Dq+7khJhFrwCUrJcaXu8bbguqrER20iXCLcWIeJ2JTz5VT/1vsyA
         tVzYNaVzy23LUWas1DZIwE56FBU3ekFeWnt8hrF8oJoLcd4TsCbps8T8YDN8nsqnd59/
         emjPyGld80HyxvCNrS+lmvJJ1Bv0S8zPvVPBh4toZMnJkB+MTd79F06D7ziRFQhHajNN
         VFXmO51JKYmvY4H8Rw6QHyjfPEiWPi6Y81w9LMhN881jwpGZaeeiOw8AudrfetJjNM/A
         jorXZJJKBpzDeMf2YYN7394B1BU5JowCJqgxG+IDEDUMSP/KyYS/gm0+KTBxGtRPZM/f
         TKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735882422; x=1736487222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUrhr336s+60zt23QDWZqcGTF0DZKHiNks6mhysqyVM=;
        b=iWzyUIEmdkdB/cDnYXgtMx3vO697lQfbZspeDA6ncCfAZd7FxFk9JXDk7juNf/h0gr
         TIEyw/4dvXYkrRYJucLes5GLJ+ZKFUXiCUFWpd8eyX+NR8dkNEf3LZdplJ6bNXruS+AU
         tXPale6uG3GbuWx6gUDnLnZbHshIKRGasupsJrj7wnB2cVRfMq6pdGCSep/83XJVOGrs
         zdKkZEVdL6UEFRUbrK7Xm4qWSiDr7L7pwYHmZA618xD4TwJiwuqrGMvNN2J4fY1qFJ+V
         ZcsNQ8kxaPpCoGSaZbb1sf1skTOWtM2BUBYsCIOHr+DFMzEZZhdvTU9Ja4+sb4liu0Td
         cfUw==
X-Forwarded-Encrypted: i=1; AJvYcCUn7VQ5sCFjuOdv4XA3Y3xVrVhc0Fz39RvmuI481Vc8b60WcvYkeueLKTgc+2WRP7msHpQ7z60RHyukzVM0DQsf@lists.infradead.org
X-Gm-Message-State: AOJu0YwkFYNcAPfihvjR38KCJecS6gmvdKEpps8WTQVyKsIThBbQ6fYP
	MqBoRTCDJFJ7xxr98ZDf+F0jCq7xDhkZ6j1xI8xD3vjRIoMXzhai2iC7ju79c1M=
X-Gm-Gg: ASbGnct3R7blwCxNNPa0dG3oUAmOCfADZ14st2zHLDiyeQk4SnIk8TQ6GQ6BNOXzULf
	MRYhw+OUugKwb3lh7cqBk0Sr17MWl0zgKO5wxUzifUioadrni+et4WOX+RkZ1FXYvhGPt+b6+fF
	5ddKuX3UHNO1HfzJI9ouK4n5/kz6xyKV08vIs5uG/I7Xdg9OqLm6oae1xKbynbiUBDXVX/XVEbn
	1rIeRhp6rGcVf9e1FtRBxJ5tzFa93Pe9lHEUBTp5/qQM7Ap6fYQqumHB7Sf6Bv5ow4crlmJ77gn
	OdogRUvvx8yCcutcWgb60PMFLkfnbDvi/5Oc
X-Google-Smtp-Source: AGHT+IEsLjhbu2jSaiZPN8bLQCUM6NVU655VzJ0kcFZvInsNgvUMyCwvCcQ0/H8BekM4Tf47nmpS8w==
X-Received: by 2002:a05:6512:118e:b0:540:22e0:1f80 with SMTP id 2adb3069b0e04-54229530295mr13502516e87.20.1735882422120;
        Thu, 02 Jan 2025 21:33:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813595sm4103333e87.136.2025.01.02.21.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:33:41 -0800 (PST)
Date: Fri, 3 Jan 2025 07:33:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <zijtpn55edeeepzfqiv6d5xv3vyaircloeaa2pbauwlxow7h3a@a5v6p37o3ppq>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
 <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
 <20250102083038.GB14307@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102083038.GB14307@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_213345_954774_5D63D686 
X-CRM114-Status: GOOD (  44.02  )
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

On Thu, Jan 02, 2025 at 10:30:38AM +0200, Laurent Pinchart wrote:
> On Thu, Jan 02, 2025 at 05:26:50AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 02, 2025 at 12:36:20AM +0200, Laurent Pinchart wrote:
> > > On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> > > > On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > > > > Hi Marek,
> > > > 
> > > > Hi,
> > > > 
> > > > > Thank you for the patch.
> > > > > 
> > > > > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> > > > >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> > > > >> HDMI but do not contain the HDMI connector node. This flag allows such
> > > > >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> > > > >> use this flag, do not proliferate this flag, please fix your DTs.
> > > > > 
> > > > > What's the rationale for this, what prevents fixing DT instead of using
> > > > > this flag ? Adding such a flag will most likely open the door to
> > > > > proliferation.
> > > > 
> > > > See the V2 series discussion, there are a few in-tree DTs which do not 
> > > > have the HDMI connector node. The rationale is there might be more and 
> > > > they might come from vendors, so this flag is necessary to work around 
> > > > those DTs.
> > > >
> > > > > If you can't fix the DT on particular boards, patching it could be an
> > > > > option. We had a similar problem on Renesas boards, which we fixed with
> > > > > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > > > > to create LVDS encoder nodes"). This made the workaround self-contained,
> > > > > and allowed dropping it several kernel versions later (in commit
> > > > > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > > > > compatibility").
> > > >
> > > > Frankly, I would much rather fix the few in-tree DTs and mandate the 
> > > > HDMI connector node in DT, which would keep the code simple, rather than 
> > > > maintain a backward compatibility workaround for problem which might not 
> > > > even exist.
> > > 
> > > The in-tree device tree sources should be converted as part of the
> > > series, I don't see a point trying to maintain backward compatibility
> > > for in-tree DT sources.
> > 
> > DT is an ABI. We are supposed to keep backwards compatibility with
> > existing device trees (at least for a while). I'm adding DT list and
> > maintainers to be able to provide comments on this topic.
> 
> Backward compatibility is about supporting old DT binaries with a newer
> kernel. There's no need to support old DT bindings in in-kernel DT
> sources. By definition, if someone compiles a DT from a newer kernel and
> installs it along with the newer kernel, there's no "backward"
> direction.

Hmm, nobody is asking to provide compatibility with old DT bindings.
However supporting DTs with no extra "display-connector" bridge after
the DW bridge is exactly "supporting old DT binaries" in my opinion.

> The backward compatibility requirements aim at ensuring no breakage when
> upgrading the kernel without upgrading the device tree. As I mentioned,
> there is no regression if nobody is affected in the first place. Proving
> there is no affected DT in the wild is difficult though.
> 
> > > For out-of-tree sources it depends on how likely the problem is. There's
> > > no regression if nobody is affected. I personally like restricting
> > > backward compatibility to the strict minimum, to ensure that all new DTs
> > > will use proper bindings. Making the backward compatibility code
> > > self-contained helps there, and we could also print a loud warning
> > > (WARN_ON() seems appropriate) and set a date for the removal of the
> > > workaround.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
With best wishes
Dmitry

