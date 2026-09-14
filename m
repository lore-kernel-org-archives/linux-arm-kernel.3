Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB49C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=; b=dz++unX+Pf/3iG+THycTP6QPpP
	NHZOoCNlRX583sMhR9uXDQrzsyb8EuulrfD27j+RXCBKEaaXPmx+aZpgWApoEP5+iB5QLm4MBpsAm
	H4QVRnuXop1sf9plPhC5djZIHke/CFqg+m3xF18mgQJ8+XbgCHQ07moPJo4492T1/8tQrNcoD8rra
	E37/pkPTLHXocFCtG88o+m/NIXCugW9ty87p7XfvDelsd1q3s+tFz0r0WMi0z4WQAjH+5q/Qz28dG
	gJY4WPHYxp8bXDn693Ke4GKieztNyZOJ+r3MtbxXb2fLVzlrL/tt0tMKvyXxFvpwXFvmwG9Q5Jhij
	0nYClvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Jr-00000003v2T-3JJk;
	Mon, 14 Sep 2026 14:06:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Jp-00000003v1V-32A2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789394760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
	b=Y3vbWeUg0NEfll1P3FDzMjK591IeXhPculxsYO0ZzugANtGawDAKQaen4P7D/ywwW9IZii
	NuoF/pzchU0qTJEK2yPD3/LYnkT9z9M+yf1YgCrU+tSzRjUPVXHqqUAgP76XiXFW6XG3v2
	6lhCJKSdeeFzn5YnrwGz6lOEPel314Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-E8gyKGkPNq6aRvRrtcO5cA-1; Mon, 14 Sep 2026 10:05:58 -0400
X-MC-Unique: E8gyKGkPNq6aRvRrtcO5cA-1
X-Mimecast-MFC-AGG-ID: E8gyKGkPNq6aRvRrtcO5cA_1789394757
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so546401385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394757; x=1789999557;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wHJSL8csboMYxIPrt9fIoOx8qVsPB687MZL7EWYIGI=;
        b=llFLMHZ0pn1pfHur9Ts5jzkib/adKNgLcKu5ogEO8+EE1faUCeO2fAmDtZnnMA3kYn
         BgpFsKHFfaCeBa7S4nJAdjOZiMgT0GfDj08kIJSN8CdT8cl/bQ+u0a6PIsOjr4W5tUPY
         D/FGE3Ahgtgnmj4i41ptOv0+FyLtb9sdVbJRbARuO4wtDeqV9RkoGlcZX+Op80Fsi5ps
         gaSI8opfLfdq6wfhsQEzp+4cZ996zbGkYRVtjZedK/0CK3Wxv5GjDK3qRolcT01dEPBT
         sZYtUm3+Z1tRo7AJExabanNiRlzhx5H3yr/4/UuOgDExTOk1YhcBPiAg8fYA/PO3bY9v
         3FgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgdrFRWk6v7nfDd4HcDvCehofsnl3zLO4Ry/VOPyyVW5slbjFGWCh5qr8Je2rUItTn/SwnSyQGCktM3uA46t0V@lists.infradead.org
X-Gm-Message-State: AFuF++lK7e/HqLl2Ly3hzzNLI8ifjMUfIsBDGDAv6LHxjP7CX+2F5N5C
	pBQaGdAo8HA0OPJ2HoIhNGxxi8nybdCKWT3oMYKNAC/pKLCULS8AoRYRf4Dpaiiw5sk8JN8hsnF
	o2mc1rqgXcweqCBpH03idIyt4+zMkoRJaqGde9om4jg86dRyjHLyPx+fzTRWL2uO6y6n9VL9H15
	ub
X-Gm-Gg: AYBFou2fkVhz9UZ3SAp85FIq6d1IWC9v1q1Z29MNMQnD2y8cSE89x/hWzdemiPd+/xA
	s+DA5D8FE84G4VBgUfEpHuyMgJjj3wTJen/9qG9KDFxnfWQCB7UMBXhRJazFoI7DtIslhPaxT+G
	SkbTEPr+Z7Ug9bDkfpOLKPUMK6lOjZgjQFYc3d22OBeudqHTJxmUKiG7+B4PZs9KW8GzCfZEQaB
	3KLqLGNTNUxMS8jnR2kfibqQylOIauwDvP4To1JlEefzVwPjeZ5tahvGQg5uX1oKHeHeTcNuGPY
	VO975VGbwp+N2zBJbUF0EG25xa1omH60tDNQTxrTud7C5MCCLa5NysHAVrTWZIOuuAHtSszdfLo
	dNhAiI/Ffp0XwPBLrQHkP3Yzg9DzieqSm/1Y=
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389773585a.16.1789394757368;
        Mon, 14 Sep 2026 07:05:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:939:6ec8:6928 with SMTP id af79cd13be357-93a2985d5c8mr389765885a.16.1789394756851;
        Mon, 14 Sep 2026 07:05:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm906151985a.43.2026.09.14.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:05:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:05:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf_QZpOIj-170Am@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
 <aqf6NH-xrMtCQppv@redhat.com>
 <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
MIME-Version: 1.0
In-Reply-To: <f2bb7446-bfbd-4598-ba95-d9561a4e132b@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yKMV_e8KGZrJlmUcF-eigJA84atwU79GXog8fse2P20_1789394757
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_070601_853943_15843896 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Angelo,

On Mon, Sep 14, 2026 at 03:48:20PM +0200, AngeloGioacchino Del Regno wrote:
> On 9/14/26 15:44, Brian Masney wrote:
> > On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> > > On 7/30/26 20:22, Brian Masney wrote:
> > > > Should there be a new MAINTAINERS entry added? There's currently 221
> > > > files under drivers/clk/mediatek/ and there's currently only one
> > > > mediatek maintainer entry:
> > > > 
> > > >       MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > > > 
> > > > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > > > subsystem maintainer similar to what the other SoC vendors do? Help with
> > > > reviews, send in pulls, etc?
> > > > 
> > > 
> > > I may be able to step in, but I have to check if it's feasible, time-wise, on
> > > my side.
> > > 
> > > Though, that won't happen until mid-September... because, well, I'm about to go
> > > on holiday (in a few days from now).
> > 
> > I'm checking in to see if you would be willing to be clk submaintainer
> > for the MediaTek clk drivers?
> > 
> > Brian
> 
> Time is lacking

I can relate...

> , but I get that one hour from me is more than zero, which is
> a good thing.
> 
> Let's do it.

Thank you. Please send a patch for MAINTAINERS when you get a
chance.

Thanks,

Brian


