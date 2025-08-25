Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E4BCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWiX+6VTPBW9oMyyTDAuGR0ExNJ3ZNdezl4Ijz6qJzY=; b=AbJgCTUoN7F+eQ6VgeLjoWr+dg
	R8DUuVqNBeHnrZhKI/OgqInclm8QhdIGORgpUNarnCwCzaytd/TTkxxjkY80HlSAOAZLCWvV5HrT6
	O8wK4kaId6Qpuhgu5Aj0YuYveD3yji+YH+LeEZWpIAT27N2QUNYhUxWJSzKRDH6cbS0qg0eqcFx3r
	gH6R7xE5BfvLrbS4HjTcnstkOXFq8x7P38RP+efN/GIXtcQvSo6QabEkj/Bh1hcjxd2jkScrkRMd3
	M9ZpNIm5lzmOal8nz28aZzu/xYf5MzqSA9Gm0IH4VyaLwVK7xgaJvIZD3r/4kqo0SxDYd0Y4SWR7i
	qoHap/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqc1M-000000091iY-1i9m;
	Mon, 25 Aug 2025 18:34:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbyb-000000090BX-3Nj1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 Aug 2025 18:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zWiX+6VTPBW9oMyyTDAuGR0ExNJ3ZNdezl4Ijz6qJzY=; b=VkTR86BJcbuznv8ukhsg8lmxk8
	YAY8fhZ9MmxC6F89YDQXw+gqYoS/H64JtPpFZLitcu4VbdDvDA8qSqA3UK4ruUJaAp+RHYs51XOKd
	Zn8P9W5/Ih76kEyP/6tIl/pToObq/rsWVeZUhPkZxJ6/5yrkzAJnTW3aw+0JfXa1GK7oeIdjDWsnE
	8PMy8wsg/yN0qsvEIql7pED45MC+RoHsAXVqML9w93QFASrSgSBMYZh2ciRjpNujHKLRHk/gP19E3
	/98NKDoq3Xmura+bRJkKN8tsFPbrBXhNsSPsb5e12ozF4aZFxwwd5jv/OjrPnJwqzzD+XoJq3ekCa
	FNLk4AHg==;
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbyY-00000001zwu-1pFQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 18:31:28 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e8704b7a3dso510950285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756146684; x=1756751484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zWiX+6VTPBW9oMyyTDAuGR0ExNJ3ZNdezl4Ijz6qJzY=;
        b=UZ5g9RjZXHOC0azysMCqywxsugPh3JZbxXi/NK9M55+mXgq4ZTWWKXFCxY+U63coTs
         WJpaDbBE5/x2MwvDHAYc+Q5rUEunX0maXlYv5MgQi4ckFebnrtsRCr392TtxA3dKpRxk
         cVOyc6SZNkyeZGIBVVvh3wKFFh2ZgL7bXxFefWvbqBkP29hPhJiw4aWd50jSc4znlbsA
         a9lTYHfsrhRbWRgBVTLwcOiFhOEy8tcX6IQqfflTL2YA+sj2SUqa/ZnDiYRvR46aeNbp
         ffwxiEe+gtNNNqd1BEXTfcFWZvvRVvCsnzFCNyBy8Yz8oZSgaSQinmEdy28eRoTPuNKE
         /6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756146684; x=1756751484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWiX+6VTPBW9oMyyTDAuGR0ExNJ3ZNdezl4Ijz6qJzY=;
        b=i+WlS9WSXK9S+WUk/wM7XRmYu7o7j2L0jWtPgO9Fy5rQ29flqw684CF2zxbbkuQUeL
         v8A1yxvJKMpe85+l0uhMoxXbFbL69Jy6UDt0+NFN4pKJBfhku5QTC0hBIy/gJQpLhjnx
         gIyPMLMV2Hvyx/riiOI+999JS54peS4/5buVIHqZ+XurGjs0ObdLEud+l2YaKphjbKAy
         6ocPYZdj+gfh240JosIwdYQ7GzNNYA8QfeomFpCa2st+bAzkdkgnLcu4lyrxpJTkn/mk
         7FHAhHyz1LcDa8qPMtf2AqqpdJspgyx2ebJApXo6pfQbvUjq+1VM8ZsSSqbLT4l48Cgu
         evqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxI9sKXaedEiAnR6HLgSDeoil6MqXm1Z57r7eu1FNlGlwXNQ4D3o17XWtIFOPuy3Skgv014veld5hwwTpke/7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxCiQGNk5pPIRleNh+78tenrsNzhnaNhi62U1Rgmf8lhwOkKyT6
	lRXKfDZBKlignNDc0YWQn8ImB1ZmKV1p+Si+2FT+pgJwo4hQZv6s6xvkgikH9/zLIfQ=
X-Gm-Gg: ASbGncvkcXe1W4+5Zx9/egCW3dLdbv9zLG3mtccZoGrV+ySdXnIopcq7hbTnU2Adwy2
	lfX8YeKNruK3jBtUrK0DYa4MVmML/NXrfz/tegkhnLtxJ5Y6mMKTn9PkWIpLKNCkUA1mXy5pIJV
	0h6y9KGFpuofVK9kc4WtvrtX8QQTkpgl4eIrJgAxzK/A4SRFHCDHXbQIimZDJ46vv+NKximNoG9
	Wf7UWFqn9Ug6tO2AALux6jXT8tJIf4ykh/fcjLxDoIBUib1jQ/eO5lJcrpTnqaYOWP1IRKDWo5i
	mPFY0Pwey/2heqeROYVJMqondE+Kl/x3Yw0K+sgq7Z5SZOnNMEgZ4vqKg+nlDJxeCghgLWoF38Z
	OIAJcwa+WTij8RksrichCbGsikvY3vqGeRIeW3YBOICkW6oSLfRcFfCIgfDEEkJ9NOfe+
X-Google-Smtp-Source: AGHT+IGrrqtb5FLiQ6yBv5bSbXionDmSOOeGsus0fmtyrIvrknH2Q5meU+RUaqrB7rQ0ZREIDsRXNA==
X-Received: by 2002:a05:620a:1726:b0:7e9:f820:2b95 with SMTP id af79cd13be357-7ea110baa0emr1337281385a.86.1756146683666;
        Mon, 25 Aug 2025 11:31:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c631b8sm57949871cf.3.2025.08.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:31:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uqbyU-00000008lWr-2NRj;
	Mon, 25 Aug 2025 15:31:22 -0300
Date: Mon, 25 Aug 2025 15:31:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <20250825183122.GB1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_193126_734215_A7C12522 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:

> Jason, the point is that the iommu and the VPU are not separate devices, which
> comes with side effects. On RKVDec side, the iommu configuration get resets
> whenever a decoding error leads to a VPU "self reset". I can't remember who from
> the iommu subsystem suggested that, but the empty domain method was agreed to be

IDK, that seems really goofy too me an defiantly needs to be
extensively documented this is restoring the default with some lore
link of the original suggestion.

> the least invasive way to workaround that issue. I believe Detlev tried multiple
> time to add APIs for that before the discussion lead to this path.

You mean this:

https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/

Which came back with the same remark I would give:

 Please have some kind of proper reset notifier mechanism - in fact
 with runtime PM could you not already invoke a suspend/resume cycle
 via the device links?

Or another reasonable option:

  Or at worst just export a public interface for the other driver to
  invoke rk_iommu_resume() directly.

Sigh.

> Benjamin, please improve the naming, comment and description, I agree with Jason
> its not completely clear. I'm also surprised that you do that every frame, seems
> excessive.

Indeed if it is just error recovery.

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff8c5622f9f7c644e995d013af320b59e4d61b93

This is already merged? And now you want two copies of this? I think
this is a very poor direction..

Jason

