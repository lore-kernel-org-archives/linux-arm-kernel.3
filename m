Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E73AC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=; b=iSlglQaQyagTBUDvmzci/y4dgl
	rApBX0u09yfthkCtDiu661XzCZAG3k44/NMM/9meoBmTvlrGLU+KJRoKdte+9UItUDQJJHRmga37s
	BrJToOvWIDBNfE6puafcQHJnGhd+7QAdczRR0bdT8+6OKB7qcnoIi2KllFraOJsk/Emh0UIOsFZJz
	OdE6j7RRSSq34Mih+HbJaLVgTaSQtiJqx3feL/q/AYcKivUNWPiZP5Jq1Sk5smQriu/vhWeaqoreM
	nxlo8ibJPP+lcxn/DDQxXXbfL3VTMkpq1MpeDJq7/tvU3CLBii5fN8GM8/WqiqqgnvouQ1/MulPJg
	nEVVTIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSy-0000000GuAp-48NB;
	Mon, 24 Aug 2026 15:20:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSw-0000000Gu99-2INi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
	b=LeoM0iFDJo8NWNziD7hM78sIEYia5w7TwqxaNou21AovXxFC1Dr/xS9Qc7uDDESZYbvdMz
	tZenoRNFbGH8OJtIblr2IYonChU2kPiXiEv6kXSNCmLEd1sQVOIBmNpnrQQdHRBH3sWr5w
	f6Dyz2IazZiqEJaslnmTKDOL18nOEmo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-3WM5JJEGOtqudg3OFq6aQg-1; Mon, 24 Aug 2026 11:19:59 -0400
X-MC-Unique: 3WM5JJEGOtqudg3OFq6aQg-1
X-Mimecast-MFC-AGG-ID: 3WM5JJEGOtqudg3OFq6aQg_1787584799
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso35772676d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584799; x=1788189599;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
        b=amyJqoAt0Ig41CVZwa2XN44+5VlQ3rQp3ZUbqa9Qwtdo7TiR8z1vqwCzYVlfjlxCgz
         LoPbq1t8gHta14hVlroBSes3oRnEgfPs6HpoFbFHYPaGoHkIM/M7BokitrBPyfcMm/Pz
         9WE/ALWuqw4jR5vUhWLhXPXsS6Wz0zLs0UCkYj6MpfsGXd2RvDK8Di0NpHacFtlcBb9s
         PVLBDZ58KilMsOzijc9wdbEiW/+kGOqAJAVDYKDzo8OYSDLzLiBkNCK4YHZZkSoZe/pp
         0/eMZDJtO0nW0d62qRdq0ZF1hEVoWmyLb+QAL3YumLlMbnZrp/h2UdzVVArnrZ5K/qPf
         7AdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5vWRh8nk/wgc0m1b294H+4iU62Z4NPuPx+xLBrOcNWoUUjYudqglHCqj6qzujRXSLAa5GlVbFluUUo/gjhCrd@lists.infradead.org
X-Gm-Message-State: AFuF++laNFsU9/0DqPou3fe0Oaa/cFwyNlDjQbsQH0pdEPnvV3jyABxQ
	dNJxS0mB/1FGw52irzmx9fDhGG2sNK+pyQ7/LZgWD3WhEjSxME9sMpfSZ/WvSGTR4fYFQGw+AxX
	7RDucFYKESMPg3WW1VhrrznnyEo+g3IvnEtCpUe84v/YJlB6+ZRzBV6Vuz+unuNuIl3R8QqQW6x
	y5
X-Gm-Gg: AR+sD13oayA9FQ3WPjXHNuVQ5FubiPu3xyqpaTEXbEHnAYX3ridyaeDQCJ2CkeR+uGp
	Uw3c4DjpCEPLZxqpMVwljI0qy7xXZCNtjoopxookq5/DUf/tDYQX4S/X4aTrrZh8pTsA7kSSDET
	Vd+cjWuaEvYQAQh+Cysj9AUe4fb2EIXoi36W60avBIkByoJ5m6CsrTeoXKsMKpsXASWefZhCyL8
	G1MsLgk+nEAbJ6OzmceIPXfWOfyJ2bVQUqHJ9Ub5WBkfeYXGo9eLc+/06YlhASKd500miUM2zTA
	xIPmBQJqHJbYajuJ3HvkmZ6eDWMpF64h0VNgay6IBUCb2UlcrX/rBiPtKLYS+10BT46a+K0Lx1e
	ll2v4AnkyPSybrsXLFR5hpxOfwlWlllyJPS8=
X-Received: by 2002:ad4:5d4c:0:b0:908:98fa:f374 with SMTP id 6a1803df08f44-90c8094440bmr304531296d6.6.1787584798998;
        Mon, 24 Aug 2026 08:19:58 -0700 (PDT)
X-Received: by 2002:ad4:5d4c:0:b0:908:98fa:f374 with SMTP id 6a1803df08f44-90c8094440bmr304530556d6.6.1787584798413;
        Mon, 24 Aug 2026 08:19:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93931452sm64597986d6.26.2026.08.24.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:57 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:19:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Make sure clk_init_data is fully initialized
Message-ID: <aoxhHNZjrh2kUXXQ@redhat.com>
References: <cover.1787240035.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1787240035.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UBcJZzSNWHxOk3O5HRonuNY4sjwwIXgfu8GCoEcSagw_1787584799
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082002_662969_95E4E009 
X-CRM114-Status: GOOD (  17.12  )
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

On Fri, Aug 21, 2026 at 12:04:27PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the media subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


