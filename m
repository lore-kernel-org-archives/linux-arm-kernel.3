Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E3CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 00:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=; b=tE549FHsHAOMCpPpjsVUskWpwS
	QO+rFrz43Igl3G9ByRY66UVziwv4IJichOmrJLLhlBXsMKoZpaR73ACNb4RWEy7suKgoIB4CDB4dm
	zocA7RoQUXu7sldwv6j5P0JpymqyxA6xN10es4BN4T+cfg6ZpCP99cBTKfNpTaa4yDXFOa1I1canz
	HfMW5cO4JDSxzDUIdP7vmuioKDu/27rIrD+a/u61CByYSGmQtTHFLZagyVAPbKcJPVmaxzXA0YrlF
	tfYir4PA4vWr2dWTe45nOxEwVIooJ6yXajnVo9XfLJbxwofbLs2C9u74TW7jDx1ptwUQd3ZtzGzmV
	+T3nzR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC4mQ-00000007WWQ-2mQ1;
	Thu, 01 Oct 2026 00:36:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC4mN-00000007WW5-1XSq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 00:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790814965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
	b=CG/ZM/dmk6KXA1zKuMIsS2aZv/KZzK7HhUngGJ1F6PN9hIFgQEtAPAN/C+d/naO8JX/+qp
	4yg0uXkAvSFK7uzBynX5+q7EUpHJFbmePqlsqG1EEOUvFXMzmwsb/jc9zo7lbvaf81Dkfx
	AA3GgVwIv1O/u7guBslUJnamtulbCWc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-uDP26yC9MwWvPSiWLk2Pqw-1; Wed, 30 Sep 2026 20:36:04 -0400
X-MC-Unique: uDP26yC9MwWvPSiWLk2Pqw-1
X-Mimecast-MFC-AGG-ID: uDP26yC9MwWvPSiWLk2Pqw_1790814963
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7fffbe0so10396476d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 17:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814963; x=1791419763;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
        b=lCIE/ySloUcO+GfDQ2TEpm/WSm4LeRvy2JsZR23NshozXjhOhoXNpGvxitQgHiH7YS
         6GORaqb81DKmCrTu84zXAWcralL/gLWStG0qODMjsHt9WY5xly9S4Xo+D/0cz+kUZrjD
         A6bUrYfmohQvEYZNi6M/syS3nBUgNvsV8AZ0yKgYaQTVmLpEoETjhAZCE+FcjybGucRe
         eMUzaj5kiJkkZj/k1kvhVnTkEFz4CikN8B7KE9pmjDMolhjmebIoZNGY9ykEXK0QQVFW
         LOfhMGrswn8RKJkj/uyxA7etkxCZY+V1kIDdj5W1NlQTrf791JVQDa4bxd2rphVE6EIp
         jiIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxCzscNx9Inr13aXg8fAj8j3fRTrj7j01hfhKcfEVRoBroayHZIeoyfnwo/nWcCmpW9G5xySP57YsaYRT4js+i@lists.infradead.org
X-Gm-Message-State: AFq9FYLSM5ZBUiX3GxtfPkoaymVMT9EsYU3/E719hZVS2yZQ8LAOaPrt
	4JhehAC0VTMfgrSSdTLRzh5tOMhpDCHTCoaiRciRENQiKZUbhxNmlRj9W/3gS7zquwAYnCLPn3S
	38sxvgIXNSlF0VA5MLX36saGGCaT86IDn8MjdpM9FRZiDxpmbboG0B0/WhRfrlwklT+75NVcuea
	OY
X-Gm-Gg: AYBFou2euJNIUXGH3buAXFoPOxj21NqK2M9UuyxI6YWI0oI2R7ZAEOYZFmC698PfU1U
	u+0bxzRbjGnqjJCBoIWsHmGPCU6RtoskgqTiyO8fCaN4rsYfpKaWtG9JAqaxhyTMFh6nRA9CG3Y
	eMTvMFrwSZeI0gw81snO/J4E+M5B/4rVxaFeC1jdcvuvr3I8pj/xB4540r+mo86JtI+AH7hQQzy
	W8zsF56vli+v2lFPDp9mZz35QOXRgFNU7qi1QdLek+T/l8CnRjMZhVGQcRLjQDQA2QaNLHdIAJC
	gZkyKbfuOFiVRqt/oWOT7GbXrt1UFTnQlVzmNpAsYJb7+OATJ/IkjI4L2gkyjE7dgYnShomjrTt
	uwqZ1BfSF+pylXhzRpexEPK8JNk40u2MfwcY=
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59189296d6.6.1790814963478;
        Wed, 30 Sep 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59188656d6.6.1790814962863;
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a881aba3sm12432406d6.2.2026.09.30.17.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:36:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-ID: <ar2q8M7Sn9DccVBI@redhat.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4>
 <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: deOom84AcWE53FLveTRfjVAd2A9a7uC0QKXn6rWRex4_1790814963
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_173607_498311_5140A3DC 
X-CRM114-Status: GOOD (  21.51  )
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

+ Sudeep

Hi Dario,

On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> On Tue, Sep 29, 2026 at 6:48 PM Brian Masney <bmasney@redhat.com> wrote:
> >
> >
> > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > Support spread spectrum clocking for i.MX8M PLLs
> > >
> > > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > > boards using i.MX8MN and i.MX8MP.
> > >
> > > While at it, it validates the spread spectrum configuration in the clk
> > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > extension, which converted the spread to the wrong unit.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/4] clk: validate spread spectrum configuration
> >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> 
> Thanks for picking up patch 2/4.
> 
> I put the two fixes at the head of the series expecting them to go in together.
> Am I missing something for 1/4?
> 
> And how should 3/4 and 4/4 be handled?

I can pick up the other SCMI patches, however I am waiting for a
Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
and 3. It looks like Sudeep wasn't CCed on the original series so I added
him.

Abel is the maintainer for imx in patch 4. I can take this as well,
however I'd need an Acked by from Abel.

Brian


