Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlHz+lr4HPDQ7x8wm8r2SfL6WTHQSlXEEM0dDW4sFxk=; b=UCq/YJgp6K7GKLsV1x1RT6s6HQ
	OE9UuWIfn/HzMiNkzwg+SFSpgjiyDADFBYO/wAqpsdlE2opniL/4eQcKEHPsPNYh78XxLDEaL7Eby
	PWLkcSNv0l5+tPot8NtxEfTsR+fgD5Y6cbCK0QXhcOuI81b1fNPHSQB7wGCCiFBzgvUaJrkkEwSDR
	ZNCI68xZjLBN8btqgX8wh/EyyvKJI6Ejzo3AX0x93IQD7OQ97wfgsjbKY+wa+cHVK8Xo/XkarSvUl
	iNp/SPK/fZ5NYLmVnCGHD9hpjMPj8MsEqJiIrXx+joBnDTxwRJEO6+lpSLbWpCIhAy15wRMYczsd2
	3aD0cEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8bl-00000004Q8E-2PPK;
	Fri, 13 Dec 2024 16:33:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Zx-00000004PmJ-0aLG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734107508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlHz+lr4HPDQ7x8wm8r2SfL6WTHQSlXEEM0dDW4sFxk=;
	b=e3kuUkjeRnMBjxqEGLJl3FmljmHkqblhCP9iubTkOzzfT+wC6sWZoQG9tn0PoDbdFJYgRf
	s+SGtoqQH13MG8UnZkag3s6qdfnMiOzHoC7u0YODua7+CArvQkyWoBBmNa+GMuNi4ltRxs
	8PiaHXWgTJLatwA6vu9nKfeTwgWxAeU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-pyzDbtErM5Op6cWZKVa7Iw-1; Fri, 13 Dec 2024 11:31:47 -0500
X-MC-Unique: pyzDbtErM5Op6cWZKVa7Iw-1
X-Mimecast-MFC-AGG-ID: pyzDbtErM5Op6cWZKVa7Iw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso4428525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107506; x=1734712306;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlHz+lr4HPDQ7x8wm8r2SfL6WTHQSlXEEM0dDW4sFxk=;
        b=m8RLus78KYtPeQJi+bKWn+d23gaPpQVgldf8wzozUtC8WYph8KpVuoFG3C4Km0k3lx
         gVVV9J8IJhm0ALWmg09JmeRWS++h5TQj2KXeL2tZXjJgZ3NG/q7eX8JP6eXKNzHmQkhl
         uhzyBHcManGqAJzyBzC1mj1yw0DtRarwjKRBEeX1WPdiE6X5K+qHhk8dg2XQxA6uvKMU
         TKJemTk6JBlkieNbkzkrzA/09XHuRvK4Fe2k0ni/C5TjxWsQHzTjvEkXUckciihRPIsy
         clbA2K2kRSQGM0/1ttHcyVOXOeFlsIEqxDnWaQNRcFpukkEHgcg27b5TFecgnxVDITFt
         fV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzAb2JYA8ZDBYzS9XDrmatXJPXhGbzBT26wP6XS7eeo4gwezARq7D8mJmK/L8DzD1kXsVupXMaOHy/2KFsiu3+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+TXEjyteV1FXKPYJF35uvS4hHx6ptm17AIJcgaECEukpBPfBj
	tSmvTLU15zKNfag3z3zE7JRIkLDlBQnorjpWvZ5kpvHuM9zxT6ix/R25zCHWPB+5sOXcYqqAeF6
	bU2OQBX/1/ISLP19EnKfhzDIjSKOVozlKinpqc1An5BXvm47ynStWjO5OmBheRKoZLcHm8vCB
X-Gm-Gg: ASbGncuJfquIYHYCyyDyJBdZZ0ntg6BEaVlnN+SDUggt1McpP7xK/oiDL9wGafaWwzb
	S44t3fa27SOC4C8r/qcZAGfBAUrOKW4roFYnNKThlsQec0CAw24WL7c1P5zKtMahXMv98krUA0s
	Uo6OhQp3VJgY5WFFHL+BpaQrsJWhhWnKdaaAPgpodTJzIzNrzAtHFtcvgHBvcst2p5G3PTbMNg4
	Cx8Ls/UCTlak7m8O8iSoxW+GFkIi+58YOTgHn0cmVjPIam3IKT5jqtBbNyRm+Yg1EiiHMcVrvsQ
	C6Ee4XND2+1Bwx37T0OY2pnd+P5Q
X-Received: by 2002:a05:600c:1da4:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-4362aa43222mr31872865e9.13.1734107505947;
        Fri, 13 Dec 2024 08:31:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzaBiFcYLOIETWgouIDtQBnlV88BBESWk31ASraRk6McgMUTtlmSvIy7PHCzWNTaauJLwiXQ==
X-Received: by 2002:a05:600c:1da4:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-4362aa43222mr31872515e9.13.1734107505667;
        Fri, 13 Dec 2024 08:31:45 -0800 (PST)
Received: from rh (p200300f6af0bca008282df582fad0b68.dip0.t-ipconnect.de. [2003:f6:af0b:ca00:8282:df58:2fad:b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625717c9fsm53788575e9.44.2024.12.13.08.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:31:45 -0800 (PST)
Date: Fri, 13 Dec 2024 17:31:44 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    cohuck@redhat.com, eric.auger@redhat.com, yuzenghui@huawei.com, 
    wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v3 2/3] KVM: arm64: Introduce hypercall support for
 retrieving target implementations
In-Reply-To: <20241209115311.40496-3-shameerali.kolothum.thodi@huawei.com>
Message-ID: <0610c537-292a-1720-34d7-438524009cd4@redhat.com>
References: <20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com> <20241209115311.40496-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LNJ4lw7wESBp3C0R3r6xJPXERjEXQMYze62LpUWAo3Q_1734107506
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_083149_243217_AE5E1358 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

On Mon, 9 Dec 2024, Shameer Kolothum wrote:

> If the Guest requires migration to multiple targets, this hypercall
> will provide a way to retrieve the target CPU implementations from
> the user space VMM.
>
> Subsequent patch will use this to enable the associated errata.
>
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


