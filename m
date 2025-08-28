Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A47CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91Z3nV2xDDPr0AIVq0M2gFIJkrVUpCIj8oRRwM3WbMg=; b=Oi+FniRL1DXoFsF5+BF+3pc0ro
	eH2UTtQ/mJMSemhrbTYcI63BrmF0MAZyVdSSTht+1V5uqg2FsaoATN8cimuEZqRyz4JhNX1ZlgLZo
	JBnwr0sH/liBNlcrZ21LBM7lgJeT26EBMCHsZmHYzVBgFh6CEUjruRH+d/KtThfGc2edMeaXT+iKC
	b9uPCXVv4ttyYDiqX6iYejpUqz+496F8rawew8N23HBXEW4g4tAmNWw74j2JPIQI3fjT4vF/+U2OW
	eqb13fgjSyrqF0ksxDyQL8LkJ3KtkAJqBYJ1fx5nSTkaf6v/dzdxbu+iSvMTEMp0wVfkNzV8mKyHM
	BWqnrRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjXI-00000003Dkg-2Bxp;
	Thu, 28 Aug 2025 20:47:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfo1-00000002JNx-3gzk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756399736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91Z3nV2xDDPr0AIVq0M2gFIJkrVUpCIj8oRRwM3WbMg=;
	b=CM0LuFAgQgHmZaMhakWlhxUiDjQhZT+1y5tzMQC3DqD7z4z6lbWV99HRoq3TGp8i4kEJVy
	DEWJEgnUKckxiIDRitKU4OMtZMSs4AOC9M+BwrkmT/eG5uBOBjNemM91+rbDJkB0BD32vg
	NHju+aDctCHpsqNzeuGROzRJWLeaU44=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220--HMYlkoeNYqo5az0UP2c8g-1; Thu, 28 Aug 2025 12:48:53 -0400
X-MC-Unique: -HMYlkoeNYqo5az0UP2c8g-1
X-Mimecast-MFC-AGG-ID: -HMYlkoeNYqo5az0UP2c8g_1756399732
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8704b4b01so276278785a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756399732; x=1757004532;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91Z3nV2xDDPr0AIVq0M2gFIJkrVUpCIj8oRRwM3WbMg=;
        b=Dgl0lz0CWtDfLqJrx2ev40N+T96qxhmRVyAVXJi1sdQo2xoPaVkA5IGe6kskvO2XtV
         hJzCOcswCQAsftoMuQfIrohcPKalz9CrrTLo0O0oKeHTXnK8N6df4inKB/VPkwS0qnKX
         bwQwpCWhJuOoCbl64u8U38XanZjrl3+0vSiaMolqln/z/WFBYtH5RPkdphC/SGP1gHya
         eFXPc+MFCa4m8kdan2ZehKUN10aamfsMNGLMQGsqdaJWIqkLbbQm8xiozVSKTgp+TDvH
         4lK042kgdlEBMkJxBvmHdNkPgn/g/1/HXCj2644U1Ojhkr6L8MKvbHwwatTw1cUtrE/t
         cSvA==
X-Forwarded-Encrypted: i=1; AJvYcCUOm39EbY9FOwDO8XCZzrvWjW/SPVAWMFGAUS64vcrvzvbROcm019eoRjdpcbyrfhuz5PCHSSM9V7SqrmqrnDDh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8R+XvSyrfsQI6pYS7k3zVzSxr7XTAIy7VAja8OVwX9H2HrsWg
	Cz82hUDbdx7m1vNPkT4AGAW5WhSLb9nPX+TxeH/dacvAg928ho0C4emfykhM9qqyhAgmkcfU9Sn
	bh2YOLb8NReAtZU1/upubqtMI6VGncBd9dy1F27B+3NiStmvbKoj1a2U9ooD+YXk6XchtgG35il
	Z/
X-Gm-Gg: ASbGnct40H67kXo/Djtblqszj44kNiqfffoGhSLEe6We/VNfVpMlSZpeYoqVB+1Z0Qh
	tSW19RbHC7F4tNj/qLowf9pkbgBeI+Z7trjb4VBSH4JWD7MZn7LdAcWp/u6Yo8hxAMquKjQ/MH9
	i+z3Vmr5DmnfsAOJp2Wlpm5ROY5BNNbYDvP/exEBDNSTl8XZvuovPLBhwIBlgFGOf5f5DuXqyJz
	S++cFZMGoq4cwe6Wt6M3othIoGDNWL14/JcROqeExGzrlgIyTK2oDcBIvWXkgsbEkmE0Qyk8l7E
	JXpKdxA6YgUCAXsddOFZKtgaTxDubhyoUgKjidOUMNIveeMQUH9wm/47Dn9grPgqylRgHTutV5o
	l+a0bTocM9jxDn5ObRBg=
X-Received: by 2002:a05:620a:1a23:b0:7f2:2982:1eaf with SMTP id af79cd13be357-7f229822d16mr1501257385a.74.1756399732597;
        Thu, 28 Aug 2025 09:48:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBTDG4Ww1kwCTyr3kj9IVvcYfVGPYh4Xr0SFGCZucQRn0W59c/rhczTAx0aZ+uZxiIuXhzEA==
X-Received: by 2002:a05:620a:1a23:b0:7f2:2982:1eaf with SMTP id af79cd13be357-7f229822d16mr1501254085a.74.1756399732137;
        Thu, 28 Aug 2025 09:48:52 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc0eea8e74sm14591785a.27.2025.08.28.09.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:48:51 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:48:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan Wanner <ryan.wanner@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 00/32] clk: at91: add support for parent_data and
Message-ID: <aLCIcWIJ4Nfqt7oi@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <aLB7CJY9nMLoS1or@x1>
 <08dd4d82-8ac4-43a3-8d01-f293db6302e2@microchip.com>
MIME-Version: 1.0
In-Reply-To: <08dd4d82-8ac4-43a3-8d01-f293db6302e2@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rh8mhQDRNx2p7gPQNtBWfO1W-wVbGsNbLpGT8itf50c_1756399732
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_094857_990289_F3EF1C05 
X-CRM114-Status: GOOD (  16.25  )
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

On Thu, Aug 28, 2025 at 09:16:16AM -0700, Ryan Wanner wrote:
> On 8/28/25 08:51, Brian Masney wrote:
> > What tree did you develop this against? When I try to apply this series
> > to Linus's tree (6.17-rc3) and linux-next, only 12 of these patches
> > actually apply with 'git am'.
> 
> This was developed on 6.16 but when I bumped this thread I checked and
> they all apply cleanly on the v6.17-rc3 tag. I also just tested on
> next-20250828 tag and this set applies cleanly as well.

I initially used
'b4 mbox af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com' to download
the series, and tried to apply it with 'git am', and that's when only 12
of the 32 patches apply cleanly. I expected to have to 'git am --skip'
on the cover letter.

However, if I download the series with
'b4 am af762c93-c9d0-485e-a0d1-7792e6e37c09@microchip.com', then all of
the patches apply cleanly.

I have a few minor questions on some of the patches.

Brian


