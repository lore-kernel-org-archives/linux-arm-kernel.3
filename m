Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zXjV22J71EDQFdZq67DVS643C3Jg95hBfmkaDyXoDE=; b=fHtA8yuVQwDQJIkqyi5W/xe/nm
	DM+o0A4yLf5oVRkNbR+jtAA4Mql7xSCUNWamPvFptp1ZAfXcHXlQWaXtbbbKudn4rvo2RVzbP6xk/
	rYXzbQ2sG0GHRLu9ZmrqZO+V+wlfQ7V1+GWKulzKjWjcfWrniF91DQGKECTONl0ZGMnb3iDLb95Rx
	0DxXxlqo34ABsVfvswDV91Bsy9gCrsLzCkJuNTD6PXzh2KjOCkNASEGHAT1K9obgkXGrsv1kRMUYD
	CDCiQttertA38AkB6fgQG0yLVAF32yz6f53Zd1kz8nwwWFCYf350p4IQOIuGca9VKySKpx2uEHJot
	SAU6/RWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuhe-00000007UWW-2J7b;
	Sun, 12 Jul 2026 13:58:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuhb-00000007UW4-2K44
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 13:58:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2275202f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783864717; x=1784469517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9zXjV22J71EDQFdZq67DVS643C3Jg95hBfmkaDyXoDE=;
        b=g5z3KEM/AuKza/r9WMszsd8oFVKLJ1Lm5206MoLAl1B4k1FrtH/kdFZh4Vy05UDLFs
         qn8bZfdHthlLzcr+8GUaIK+C3E+1fnHL9et7NRUqrHLN11qROo4eCWf4tOHoD+JAIlp2
         Sl77RFnYVYbFPZ+uR36SAr1/x1cJydkzwxBlajNmrHIXw5o6sxCKIMy0EnQLu9+441k9
         4OGuRG7g5GVK8yU61pgzs3s2SiDQ2dOu1IWR0/Mzp7YVRTzvZnwpuuwUl+8+CDMrMmuV
         Uh2TtsUQKOAgqWJquawa3vj+PNe3PFwm1XBgMVtr49P2dfyYfoAxkMTWso0kRId93FzP
         /33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783864717; x=1784469517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zXjV22J71EDQFdZq67DVS643C3Jg95hBfmkaDyXoDE=;
        b=XpfLjJ6Ea/NqQC0RGZl2FXqnuyrcBjre6ZhnFXjoje14KmFzrpX63iPgtEFU1H3ESR
         xxNZUCdDUSmTnhAqO2MPqsEm+cXWGEvORO027o0pXxsC7Whe52bZv7AwzP3JowK1r7l5
         s8ddA13V8ykkZBo2ZArut4nc2jH30hCxQqDu6JTglYHN2iL/YPOBAPT8jFmJB1iX0pzQ
         IAL7HQh4p9lS/lCg255lI1+dq5pjuUXiK+RpnUl+3c1e3Uy+vVLpnYsyr1kWBRIrIDUT
         SBfMLhE8Gn19butOM7UCXPffIkau4zgd4bjyUF04rqXie4L8I6x6syOKU7FQj1jOLGpF
         91iA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0hnE0u8HjgW3KPX4Vsh+cmcyrwa7xPn4pwtSkljSKrXh0fklGnyO0veJBG0OMa7XQn30L/NR1xsF2j0k9lD6z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1EMyuLUqC2A6eJ2d5vSElmWUHWCBlPxnDgAZZAH3jjlwTlgwz
	49TSan+dLRhbhViAHN0rx1xaSx5mfYK5dExmbPN+BRl8Yga9ofRp0/bJazXxBjjP
X-Gm-Gg: AfdE7cmke5eXiBDOlPu5HVIlKXuXd8YjZoli+GRgU0/NRc6xlBKBgPWU58Ji5RVoOJm
	vGiUSc1pJYlDAH0NJPJs1mC3CcrQaruC03SLlYbJwnWRTv5/oR8Qb206auYYfnbNe0PbYLWyEkV
	P2H8mmCF1ddhJTVr6ZFnPJYwn6rSYY2w+vqox3A2YpijpS/3uYI6O4M24yVkmZqYRSVotV1XXkW
	H030n5wBB7+BOS+hJR3P2PN0FS3E65Cs+RmbhGVCHJzMtXvxwLuvOMxz1vCLlqXzOcRDP9LR01k
	+acSvUmzDoxbTnwyDx1yMirWFFwdOUGKVppuEeu9rCPWNwBSM60Yc9tNUPfuCtAsrr4WbE4xiO1
	wuOi/6w5v+7c5C6odrIvSq3Fy9RqSJNsfSDWH4J9lPUDRYN31K7Lw230R5hF8Uocf4xL6za9UCv
	0izHvNuKIQORU2auB0tJjkZFLrKwSj7WMZx4gMFUtZIgVLe2bav/qhlTUpIyN0qxgXBeabwoWC6
	8NYTltWiUqaFUDGjQlxVoIIRQSPNjI=
X-Received: by 2002:a05:600c:3e19:b0:493:f28e:462a with SMTP id 5b1f17b1804b1-493f87e6ba2mr57487265e9.12.1783864716979;
        Sun, 12 Jul 2026 06:58:36 -0700 (PDT)
Received: from GLaDOS.station (122.red-80-39-213.dynamicip.rima-tde.net. [80.39.213.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm260892055e9.9.2026.07.12.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:58:36 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:58:34 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62
Message-ID: <alOdipBb0WS7a86A@GLaDOS.station>
References: <cover.1783689915.git.stefano.r@variscite.com>
 <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
 <20260710214130.GA1387333-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710214130.GA1387333-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_065839_603531_6F726EE8 
X-CRM114-Status: GOOD (  10.93  )
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

Hi Rob,

On Fri, Jul 10, 2026 at 04:41:30PM -0500, Rob Herring wrote:
> On Fri, Jul 10, 2026 at 07:43:07PM +0200, Stefano Radaelli wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Something wrong with the Acked-by here. It goes with the Signed-off-by.
> 
> > 

Thank you, something went wrong here :D

Best Regards,
Stefano

