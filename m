Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A052DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Y6rrymz9Cpt4ZZ+qupeuk6u6jV+dzKzkCZVGmBPnRk=; b=2rgslaW/qjBDlXZvQyI5fg1e6Z
	pqJJIa5W7JBF3o55deOOxeXoiJGJ1f1FVEN10uE8yRIHXtuMFpO9GqmrwMBEFTDG1nzGOnt5vZrki
	NqWkf+D2GRrKHdYu46ou//vzKXwxqOA7eAfGBAtn+JSXLuE0LR01mAcie7Y4WatE+2EFzg3N9c84d
	hsxnhx7KMHB9l9nQqbrBbUuRjcCZzAQU0/SHi1r54klVQwkn0nXCvuHF1e5MPqAfRH/vIL72KUVUC
	1seI8jQXcjpivcJN2CsFyIQoLWgXUni8PAPOGO83A8oPMojOFuxqXBfAceOLCBN8PV2MaJECgDsKt
	pnEt/iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8uI-00000004U4i-10wP;
	Fri, 13 Dec 2024 16:52:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8ne-00000004S4i-1hnj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734108356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Y6rrymz9Cpt4ZZ+qupeuk6u6jV+dzKzkCZVGmBPnRk=;
	b=MqnzyYVnsHjUd/7JvxJBaSuIAKLOCyFBXh+RCqSog78qQ2V6FJRDg8qRluyRiJ1smUXZJy
	QlOXK0YZ2X9FNZPdQat1RM3NsoP3ZuMuhaOOYI/RUtVLdljPoS2PeqnllS27ATjnFu0Gx/
	8Z20eWh5Q+czS4HSa+yANtJSJWjb6bA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-d7vC6MUMMnynhnWd4lvtjg-1; Fri, 13 Dec 2024 11:45:55 -0500
X-MC-Unique: d7vC6MUMMnynhnWd4lvtjg-1
X-Mimecast-MFC-AGG-ID: d7vC6MUMMnynhnWd4lvtjg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385ed79291eso1719383f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108354; x=1734713154;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y6rrymz9Cpt4ZZ+qupeuk6u6jV+dzKzkCZVGmBPnRk=;
        b=izSdZuMsE1QpvVtYYnJPccUm5+/FbYTWn5Ly6Wmf8aRnVnF+0MM6KTrUF87G80Asby
         DNJN0rGKJN9pL/eQ5BY9J5i6cfjRVq9lJsp4xNSDk4+QJra6sg/k3SpFKDh+kRP8Jit/
         wnoiRhGPd28cVYJHbJYt9tLtZHOl2nuFOPRtsLFqwgGYEACI2FsA7DnBLQqCHgn3Zbri
         B9r9XQnTfk7Fe4S38jlF8sye6CCBiC7x7qR8Y3otaDA2RGH7RKhWqr2FmTqEQqRWbJs8
         yCvg1i8jVvLo9FkA1skd/xpKv2uC96saEepCyvH5ZBkb8zh5TOqVsmgOUoE+9MMtUOdM
         M29A==
X-Forwarded-Encrypted: i=1; AJvYcCWkQZocljQygF92+uiDiQXu9Kp6vYZyWSIa24ENwMMCmMgBUJdJo45HogRc8xQwPv7iNFVjkbqb8MKn9EoZinpQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2/T2OqoOFgRue0jSFLPsAdGy7OHWdwdL7onSHUwV9yEeG1tO
	em6xQifPCMA6Wm/q9EqAYcGQIl3luyjKeYWSZGR6S8p0A06Td+7oRsxXmxHG6lGEdUBCapvFcIL
	GXsK4lcQgw3i3CUpnAOUAWoyl7SweS99RstVhdd2gLHonlus9KHtOphQIlBr6nJRdyFPScH/y
X-Gm-Gg: ASbGncvv49eIqz17xJkSMg+2uiP1tLqduKGpLgjf8qWIoihn9wVVAKO9LKck9bBLJ20
	+9U+4kKTbqRXFlgwiD7X/ZYnErnlzK9lFzKrM3ORrFfLZoA/Fe917G7zbKMYrqqvDxf00HkbIhM
	nXCGlqG+Ta1x0kzqyxU8ySa4nPfGnrueSSshph5/50cERcJt4n7/VREUgyVe24EydIYZZdniQYJ
	xhRLFQtrWr4eP5j1QzaWzmq9RUImU8PMpnT1d/fUXTs8DzJFyQxkwJDkZu3TN5Pw5KtMeA5lLht
	CPXDmuzEDY0fzKI6GugFpYk8kSK7
X-Received: by 2002:a05:6000:4b0c:b0:385:fa30:4f87 with SMTP id ffacd0b85a97d-388c35bc364mr3160581f8f.0.1734108354140;
        Fri, 13 Dec 2024 08:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkku6qh3dDcEB3F275XNRTYMIzS0gJCxijFbXDhWoWzHJOCYC9lv4K9hqsbt3d3HId86LVhQ==
X-Received: by 2002:a05:6000:4b0c:b0:385:fa30:4f87 with SMTP id ffacd0b85a97d-388c35bc364mr3160557f8f.0.1734108353794;
        Fri, 13 Dec 2024 08:45:53 -0800 (PST)
Received: from rh (p200300f6af0bca008282df582fad0b68.dip0.t-ipconnect.de. [2003:f6:af0b:ca00:8282:df58:2fad:b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e600sm7717041f8f.7.2024.12.13.08.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:53 -0800 (PST)
Date: Fri, 13 Dec 2024 17:45:52 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    cohuck@redhat.com, eric.auger@redhat.com, yuzenghui@huawei.com, 
    wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v3 3/3] arm64: paravirt: Enable errata based on implementation
 CPUs
In-Reply-To: <20241209115311.40496-4-shameerali.kolothum.thodi@huawei.com>
Message-ID: <09f590eb-fb3e-6a5c-512a-440613d79c5b@redhat.com>
References: <20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com> <20241209115311.40496-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TgItKPOVyMdWgIS-Ofxf0MrsLNwUANaAMoUXA3wZSPM_1734108354
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084558_521592_4B79421A 
X-CRM114-Status: GOOD (  12.43  )
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

> Retrieve any migration target implementation CPUs using the hypercall
> and enable associated errata.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> Note:
>
> One thing I am not sure here is how to handle the hypercall error.
> Do we need to fail the Guest boot or just carry on without any
> target implementation CPU support? At the moment it just carries on.
>

I vote for keeping the current behavior. This way the vmm could just
decide to never migrate this vm and if the vmm figures that the issue
is so severe that the vm should not continue it has the power to do so.

Reviewed-by: Sebastian Ott <sebott@redhat.com>


