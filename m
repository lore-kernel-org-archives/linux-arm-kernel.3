Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00007CAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=; b=ejomhDx/1trnOsom7BUwDIklFc
	TnH1c5bWtJzWNDXTBl5DMojmgiWxUs7UDp0f72V/9w/cnK16xTl19I3KThgHGVXVaPId0sybeGTK0
	h5N9ejlHAHs8Q12IofkMe/vujCH0jP/NaVcCxE36Vds4T1EHPq4+3dU9tIuF6tgd+loodePZd/JqR
	YUM4FvMO1/5W6QhtDQqnNIHXXDgs+wTBl6Q8c7jU2o7CvUq3s8WMYv1zbYohi9Jf/lMJpy3gYpyPk
	VneArvCNG38lOs5CvhEo7AsIeTUN/ka8bXHb6FkoR/hfXkOltVAbjfsUS5YlPclUBkAgNLXhthSPB
	/OkqxxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlX9-000000014ia-3Cym;
	Sun, 14 Sep 2025 12:08:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlX7-000000014hV-2LAs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
	b=FUeAnkDJW2mk8y1fOisF489Z0IOpfqgbpu9XulN49RNI288zmCFbSBfrEfRjRpKAZ5tK44
	7S/gQlysYWIHns+MG2wcxt9+q3ixxGadaflWsIYiKMs7qVeMvsM0b8LrcdYK46TWPA8Mgn
	GU8DJINiIk3yZCr1VyN3F7dsLXU/Lvs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-ROunTTGqOa-1sEV7rfoeAw-1; Sun, 14 Sep 2025 08:08:38 -0400
X-MC-Unique: ROunTTGqOa-1sEV7rfoeAw-1
X-Mimecast-MFC-AGG-ID: ROunTTGqOa-1sEV7rfoeAw_1757851718
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-828bd08624aso119249185a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851718; x=1758456518;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
        b=DQpusFxO2v36pDuG5lVNNpAUV687Y8FNq/77Vr/OLWbQLicMa/Rd1QsWuiZYfTKHT/
         +eHtlQL8ct9wZBSz0PtVJ9RCoPKEtUfrAt6U1f625i9490YyxLdJ2tdh01XR90Lvie+8
         CVR7eSwF6fAO7KszpE9vMzAsy1dnuMjPO8qsfQiFTT8aohJ+sLEALaHhTLSXImJM2FJ3
         mSc6S7+HMWKsMQzMCrf13MOc8/XSfWCgUsD6Vo9icuyoo/lFEnEmK1fXB5LmMIX2SN8x
         ArKWHphTA54yhydnYcfuflUmZ7U2QClU7uCmzRXVXUc37tgHpWAnWzQktDhjGHT3Ie+n
         48CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUocZiy9uVYJZMeDtXisw4hUQzpJx1Nj0K6UBaPRQpolCgI8MN2puLTIae7h/D8+foE+R+awtLIvivaGWa97bHq@lists.infradead.org
X-Gm-Message-State: AOJu0YzfSncaKiurnOq4hOBF0clTC8+6HAv+Qm9y2dbcR/zxue+AGqa/
	9cJ5qFRjqRIcM+MtZA3c5IiIWtTx+0C2VD7sa14099A1rKbJatYDSsTQxTihVNHHoPTqmf5GNsx
	TEqaGMPIdjCsThuoRF2csBYXb1s3kqecDWxdCcoQpMVFqNmHkx3aI4NsNJdThTqrgAtgA0rwSPT
	GW
X-Gm-Gg: ASbGncsuTGRngYyJwcd1EHDIcyiZxZubcwJKj5gaxh1em60kvsjSzwI5xp+wYZUhVQs
	3LoM5Asaiel6n9QeaWETlKXNU/bQD/0hXtzcplQemZRkbyn97IHvxlt0b3Wl1wff4wefTB4UcnS
	uoyE7p7Sof//gBXb0VddvlgFwPNuIzX00PuMFjQk4TzNSYJyKoearcdoGnuUwS+rwbjS5Nbixwq
	PZfKHJ8geJeO45OP7xiVqedaBQxDcKFg9Uh13CMqxReBaf2NY9Kx5Utx2RpmHLCqb8L+eBIkKXY
	ZaY3zE8D7y7Sua602f84aCS/vx2V+tFJ0ay1SETCFwV8G6KBUjJZz4ssT6hKw+HRQhWPFPusg/B
	kY9d/b/iZztXXzVkyEc77kFC370Bcut0=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036169285a.69.1757851718244;
        Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778;
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8woGVw1kySMoBYLFkGkAWLedhR0B5-u0uUo5fReYjG8_1757851718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_050841_673657_43A0C8EF 
X-CRM114-Status: GOOD (  15.74  )
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

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian


